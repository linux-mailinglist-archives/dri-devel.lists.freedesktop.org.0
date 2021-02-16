Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DB731CE48
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 17:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1020E89C53;
	Tue, 16 Feb 2021 16:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA8889C53
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sC3sO/bS72AtEqP90G5x7VExQuWQRyOINPX4+6P8VmY=; b=EYHxHxCTeHbl7b3fL2i2hxMZaZ
 O3mB4XYP84ABXfBGIFE52Istlt/BdDekT14IumA2bJPsBLeKzwDV5LyJfgSX1QQDfPqv9WnRNrz06
 rT7ri+AIN6zCPlNgEudgi6gPl/IZzQoUqa/kejnB2uGCmRU7gWPeSF6QCaT8xjguyjC+sgzRduvU3
 twKgdkdN60cTtIGtm7meCXhiZNhv6Dg4BVRsW+Sn07AsjFSmwvku6lYxAdWeZvMTvSozr75H0E5ww
 SSaM4SZd7J64KXYgrWGG1nafw66yX2UHnDZrncn/thIwdYEUNMXk8GlUKh1H2zoS9W/sKKKxVUITe
 GiDLksQQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49315
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lC3Ro-0005BE-9F; Tue, 16 Feb 2021 17:43:36 +0100
Subject: Re: [PATCH v5 3/3] drm: Add Generic USB Display driver
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To: Oliver Neukum <oneukum@suse.de>, dri-devel@lists.freedesktop.org
References: <20210212174609.58977-1-noralf@tronnes.org>
 <20210212174609.58977-4-noralf@tronnes.org>
 <5164bb01b7f3cf71926109a37b9e3957cfb630ba.camel@suse.de>
 <316502da-218e-3837-d356-79a7b5dce7ae@tronnes.org>
Message-ID: <d89c375e-3dea-89a3-2315-65ee91fd17f0@tronnes.org>
Date: Tue, 16 Feb 2021 17:43:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <316502da-218e-3837-d356-79a7b5dce7ae@tronnes.org>
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
Cc: hudson@trmm.net, markus@raatikainen.cc,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com, peter@stuge.se,
 sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTYuMDIuMjAyMSAxNy40MCwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IAo+IAo+IERl
biAxNi4wMi4yMDIxIDE0LjM2LCBza3JldiBPbGl2ZXIgTmV1a3VtOgo+PiBBbSBGcmVpdGFnLCBk
ZW4gMTIuMDIuMjAyMSwgMTg6NDYgKzAxMDAgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6Cj4+PiAr
c3RhdGljIHZvaWQgZ3VkX2Nvbm5lY3Rvcl9lYXJseV91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IpCj4+PiArewo+Pj4gKyAgICAgICBzdHJ1Y3QgZ3VkX2Nvbm5lY3Rv
ciAqZ2Nvbm4gPSB0b19ndWRfY29ubmVjdG9yKGNvbm5lY3Rvcik7Cj4+PiArCj4+PiArICAgICAg
IGJhY2tsaWdodF9kZXZpY2VfdW5yZWdpc3RlcihnY29ubi0+YmFja2xpZ2h0KTsKPj4+ICsgICAg
ICAgY2FuY2VsX3dvcmtfc3luYygmZ2Nvbm4tPmJhY2tsaWdodF93b3JrKTsKPj4+ICt9Cj4+Cj4+
IEhpLAo+Pgo+PiB0aGlzIGxvb2tzIGxpa2UgeW91IGFyZSBjcmVhdGluZyBhIHJhY2UgY29uZGl0
aW9uIHdoZXJlIHRoZSBxdWV1ZWQgd29yawo+PiBtYXkgb3BlcmF0ZSBvbiBhbiBhbHJlYWR5IHVu
cmVnaXN0ZXJlZCBiYWNrbGlnaHQuCj4+Cj4gCj4gYmFja2xpZ2h0X2RldmljZV91bnJlZ2lzdGVy
KCkgc2V0cyBiZC0+b3BzID0gTlVMTC4gVGhpcyBtZWFucyB0aGF0Cj4gdXNlcnNwYWNlIGNhbid0
IHVwZGF0ZSBicmlnaHRuZXNzIGFueW1vcmUsIGFuZCB0aHVzIHdvbid0IGNhbGwgaW50byB0aGlz
Cj4gZHJpdmVyLiBBZnRlciB0aGF0IGl0IHNob3VsZCBiZSBzYWZlIHRvIGZsdXNoL2NhbmNlbCB0
aGUgd29ya3F1ZXVlLgo+IAo+IFVubGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcgaGVyZS4KPiAK
CkFuZCBpdCdzIG9rIGZvciB0aGUgd29ya2VyIHRvIG9wZXJhdGUgb24gYW4gdW5yZWdpc3RlcmVk
IGJhY2tsaWdodCwgdGhlCm1lbW9yeSBpcyBzdGlsbCBhdmFpbGFibGUuIEl0J3MgZnJlZWQgd2hl
biB0aGUgY29ubmVjdG9yIGdvZXMgYXdheS4KCk5vcmFsZi4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
