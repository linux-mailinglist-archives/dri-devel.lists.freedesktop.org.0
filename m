Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75F1B9892
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 22:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740B26FDD5;
	Fri, 20 Sep 2019 20:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1188B6FDB2;
 Fri, 20 Sep 2019 19:48:59 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::9a1f]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBOtl-0002KP-Lk; Fri, 20 Sep 2019 19:48:58 +0000
Subject: Re: linux-next: Tree for Sep 20 (amd/display)
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20190920163637.GI3822@sirena.co.uk>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f7328ccb-0561-3917-47d2-5d101400a66a@infradead.org>
Date: Fri, 20 Sep 2019 12:48:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920163637.GI3822@sirena.co.uk>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 20 Sep 2019 20:39:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=weRqgS5ombpBOF0myIcU8zowirEb3nbtSgzyhH54kac=; b=CMJQgs2m5NOJ0jHHy2MS1Dd++
 +1qoR2mMF0+tP5HzwPyUPg7IINzyBCWJjcQNfaNsXsl9NkwphGbxdsYTUM1PT/gSP2P69IyUQp3Nk
 tC/sJZTQy3JaIXn5SpW2dgfbALKkPDhaIMR0+m7ev2q8bVJ4koAeyiX7LVFcohxSJoc2GvCcAub+0
 2bPww9D7kfPV0nzXb0nKN0UThUkU33dK3Ji4NCqA6CcPn+Nd1yBI0QrvV67mevoGMItKnm7DJu27D
 +6xvyV85jj9dZbk7lX5Qr9gFqmgUp0nurHWRK+rR5BYeiFLnQrMkqC8uSRzjYBZi5O/8A06V9CdAb
 atgPF0sZQ==;
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8yMC8xOSA5OjM2IEFNLCBNYXJrIEJyb3duIHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBOZXdz
OiBUaGVyZSB3aWxsIGxpa2VseSBiZSBubyBtb3JlIC1uZXh0IGJ1aWxkcyB1bnRpbCBTdGVwaGVu
IHJldHVybnMgb24KPiB0aGUgMzB0aCwgSSAqbWF5KiBkbyBzb21lIG5leHQgd2VlayBidXQgaXQn
cyBtb3JlIGxpa2VseSB0aGF0IEkgd29uJ3QKPiBhbmQgaXQgY2VydGFpbmx5IHdvbid0IGJlIGV2
ZXJ5IGRheS4KPiAKPiBDaGFuZ2VzIHNpbmNlIDIwMTkwOTE5Ogo+IAoKCm9uIGkzODY6CgpsZDog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNlMTEwL2RjZTExMF9jbGtf
bWdyLm86IGluIGZ1bmN0aW9uIGBkY2UxMV9wcGxpYl9hcHBseV9kaXNwbGF5X3JlcXVpcmVtZW50
cyc6CmRjZTExMF9jbGtfbWdyLmM6KC50ZXh0KzB4MmYwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgX19kaXZkaTMnCmxkOiBkY2UxMTBfY2xrX21nci5jOigudGV4dCsweDMwNCk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYF9fZGl2ZGkzJwoKCi0tIAp+UmFuZHkKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
