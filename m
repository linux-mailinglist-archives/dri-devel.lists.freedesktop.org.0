Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31E0B309B
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 17:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44116E088;
	Sun, 15 Sep 2019 15:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2506E088
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 15:00:46 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62227
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <noralf@tronnes.org>)
 id 1i9W16-0005MC-B8; Sun, 15 Sep 2019 17:00:44 +0200
Subject: Re: Recent tinydrm -> tiny drm drivers rename causes kernel-doc
 problems
To: Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <d83a5434-00df-89cb-e0cf-3318fc12d3e8@redhat.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <40883d3d-44d8-df51-ccc5-a1ecbbbf8827@tronnes.org>
Date: Sun, 15 Sep 2019 17:00:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d83a5434-00df-89cb-e0cf-3318fc12d3e8@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=As8JTJRMAwCvHIV+edDGeu2oF+mV3wXKJW7or8ujGdM=; b=pOQ4vYeMWXiCaJbi2h7XRF9LLc
 tBXzhm/xau9fNymVBDcq9czyR8hwFmeOR/LaiP+LMPI/K/3TbvYZFGNlmAAJ542QJ1PYlbbl57xjY
 Sqkv8qZV2GCi8Ip+VN2iQslWiEOgcb/cDwP7fsF/IRTuKzP0gdnopAIw+Ev1kAz2kU0rN+g5+Lqke
 w4x+23TtnhKjtIzGen+kVi8Ww3r8GVVQIRfk2OeDQftGNWW8shBtoPFPhHt6n7XeRHGI+b5Hzbmeg
 UzuuK8SE4w3Bf5+Cy91gUDdG747NXpBiZ3GZlU+4Zc9yEMIYK7LXBMnSk1PLcBCvEceJbMUS6kvMz
 4GHCt/Rw==;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFucywKCkRlbiAxNS4wOS4yMDE5IDE2LjMyLCBza3JldiBIYW5zIGRlIEdvZWRlOgo+IEhp
IE5vcmFsZiwKPiAKPiBXaGlsZSBkb2luZyBhICJtYWtlIGh0bWxkb2NzIiBJIGp1c3Qgbm90aWNl
ZCB0aGUgZm9sbG93aW5nIGVycm9yczoKPiAKPiBFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAuL2Ry
aXZlcnMvZ3B1L2RybS90aW55ZHJtL2NvcmUvdGlueWRybS1oZWxwZXJzLmMKPiBFcnJvcjogQ2Fu
bm90IG9wZW4gZmlsZSAuL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL2NvcmUvdGlueWRybS1oZWxw
ZXJzLmMKPiBFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAuL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJt
L2NvcmUvdGlueWRybS1waXBlLmMKPiBFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAuL2RyaXZlcnMv
Z3B1L2RybS90aW55ZHJtL2NvcmUvdGlueWRybS1waXBlLmMKPiBFcnJvcjogQ2Fubm90IG9wZW4g
ZmlsZSAuL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL21pcGktZGJpLmMKPiBFcnJvcjogQ2Fubm90
IG9wZW4gZmlsZSAuL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL21pcGktZGJpLmMKPiBFcnJvcjog
Q2Fubm90IG9wZW4gZmlsZSAuL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL21pcGktZGJpLmMKPiAK
PiBJdCBsb29rcyBsaWtlIHNvbWUgb2YgdGhlIHJzdCBmaWxlIHJlZmVyZW5jZXMgdG8gdGlueWRy
bSByZWxhdGVkCj4gdGhpbmdzIG5lZWQgdXBkYXRpbmcuCj4gCgpJIGRvbid0IHVuZGVyc3RhbmQg
aG93IHlvdSBnZXQgdGhvc2UgZXJyb3JzLCB0aGUgZmluYWwgdGlueWRybSBkb2MKcmVmZXJlbmNl
IHdhcyByZW1vdmVkIGluIGNvbW1pdDogZHJtL3Rpbnlkcm06IE1vdmUgbWlwaS1kYmkKCmh0dHBz
Oi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdD9pZD0xNzQxMDJmNGRl
MjMwYTFiZjg1ZTZlZjJmOGM4M2U1MGIzYmEyMmM5CgpOb3JhbGYuCgo+IFJlZ2FyZHMsCj4gCj4g
SGFucwo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
