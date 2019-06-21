Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 274004E9D9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 15:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707056E8B3;
	Fri, 21 Jun 2019 13:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56F16E8B3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 13:48:44 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED744206B7;
 Fri, 21 Jun 2019 13:48:43 +0000 (UTC)
Date: Fri, 21 Jun 2019 15:48:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v2 06/29] docs: console.txt: convert docs to ReST and
 rename to *.rst
Message-ID: <20190621134841.GA26766@kroah.com>
References: <cover.1560890800.git.mchehab+samsung@kernel.org>
 <00ddb1bc19e07b7ce4d1e7cda457733a37cf1693.1560890800.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00ddb1bc19e07b7ce4d1e7cda457733a37cf1693.1560890800.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561124924;
 bh=rI3c1BOmsczqHXJN6hvv4bgjJQdjsSyfRhzndKaR1so=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1f2JM+sOwZwawmkvWu37ujbWtD2T1HlcBG9j72f0CLmpgLBRpmjvQteXZQPHxpgS5
 CsqGEbTjAp8Kd3J/r34AAQw+XRAwXwaiOE3LR1IU9K+YEdJz5nln8wdejeqNARO8Pd
 lZrvKScl8baWWKF4m7thzkL80KUkCtRjHfFFNgE0=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-fbdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDU6NTM6MjRQTSAtMDMwMCwgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIHdyb3RlOgo+IENvbnZlcnQgdGhpcyBzbWFsbCBmaWxlIHRvIFJlU1QgaW4gcHJlcGFy
YXRpb24gZm9yIGFkZGluZyBpdCB0bwo+IHRoZSBkcml2ZXItYXBpIGJvb2suCj4gCj4gV2hpbGUg
dGhpcyBpcyBub3QgcGFydCBvZiB0aGUgZHJpdmVyLWFwaSBib29rLCBtYXJrIGl0IGFzCj4gOm9y
cGhhbjosIGluIG9yZGVyIHRvIGF2b2lkIGJ1aWxkIHdhcm5pbmdzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5vcmc+CgpB
Y2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
