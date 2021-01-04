Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D022E93CC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 11:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB235899C4;
	Mon,  4 Jan 2021 10:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AA3899C4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 10:58:02 +0000 (UTC)
Received: from zn.tnic (p200300ec2f086c001ffa80bfe662d8cb.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f08:6c00:1ffa:80bf:e662:d8cb])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A88571EC0266;
 Mon,  4 Jan 2021 11:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1609757878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5GizZkZaUZ0FWl5frthsoGdmpOhLMxMLt6FD0R1SWg=;
 b=r4NZohJmXs/qYbsHhlJFQ7ktoN+PmtbjkZ76Zj7sjkq6LzyLpsU/0C58patf0orbnMuhWJ
 x0LUx8Bwag8gNVSbpQ2pqwCpcW9knTj6tRNFuqIXOqOnKkKS2tM4o2LK/qJIeNONmHQKwc
 xWKS0/07f3cd+eytRN3YdUVFmbBpeq0=
Date: Mon, 4 Jan 2021 11:58:02 +0100
From: Borislav Petkov <bp@alien8.de>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: 5.11-rc1 TTM list corruption
Message-ID: <20210104105802.GD32151@zn.tnic>
References: <20201231104020.GA4504@zn.tnic>
 <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Huang Rui <ray.huang@amd.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMDEsIDIwMjEgYXQgMDM6MzQ6MjhQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBHb2luZyB0byBkb3VibGUgY2hlY2sgdGhlIGNvZGUsIGJ1dCBjYW4geW91IHJl
cHJvZHVjZSB0aGlzIGlzc3VlCj4gcmVsaWFibGU/CgpMZW1tZSBmaW5kIGEgdGVzdCBib3ggd2hp
Y2ggY2FuIHRyaWdnZXIgaXQgdG9vIC0gdGhlIHNwbGF0IGhhcHBlbmVkCm9uIG15IHdvcmtzdGF0
aW9uIGFuZCBJJ2QgbGlrZSB0byBhdm9pZCBkZWJ1Z2dpbmcgdGhlcmUgZm9yIG9idmlvdXMKcmVh
c29ucy4KClRoeC4KCi0tIApSZWdhcmRzL0dydXNzLAogICAgQm9yaXMuCgpodHRwczovL3Blb3Bs
ZS5rZXJuZWwub3JnL3RnbHgvbm90ZXMtYWJvdXQtbmV0aXF1ZXR0ZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
