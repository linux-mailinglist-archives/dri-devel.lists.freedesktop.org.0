Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D832C1ECFA4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 14:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8D689A9F;
	Wed,  3 Jun 2020 12:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1FF89A83
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 12:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4khiMqQn+FxsRP2db57R3G3VwI/nY+0fbVRJvI9zgsQ=; b=Q4jo4uCO68pzoHigMQQS7t16pd
 H/ZEPBCsKMcBRtbG+KE6mhAJiTQuPYQTnSeLhIPyfThAaOIYprxMYkNfvVK3GNnaOawROiSmMZg+c
 YJ5gMvSrSPUvyyO0hFVQZIyHUmTkl3Y3qXZt1lZIixauj1ysPKP/sEnEIEdFY3QtyG3bG6B5rMPih
 rl9M89ARQhbBVWz8Ik9hVs3/4291adVQtHDxRxETlAMdgVYwdR7JVIiqdXcotWqesFH4JYP4Se9Oe
 btlGtd0Mf6WAF2Ghy3SyyZPFUyejMIUyOaPVHRUJHoz2tQkzuaSgYd1sV3rdiAnaoRwWaa9vC6Tp0
 6dL684+A==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:12043
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jgSMc-0004DT-Pq; Wed, 03 Jun 2020 14:19:22 +0200
Subject: Re: [PATCH v2 03/10] drm/client: Add drm_client_framebuffer_flush()
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200509141619.32970-1-noralf@tronnes.org>
 <20200509141619.32970-4-noralf@tronnes.org>
 <CACvgo51Cq1ipV_K-NLk9QZ7d1Pweebz2ST6anqrT1q09r0+QEw@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <61eba989-4a3d-9208-5e5c-1fb587a36cb6@tronnes.org>
Date: Wed, 3 Jun 2020 14:19:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CACvgo51Cq1ipV_K-NLk9QZ7d1Pweebz2ST6anqrT1q09r0+QEw@mail.gmail.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Lee Jones <lee.jones@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjguMDUuMjAyMCAxNS40OCwgc2tyZXYgRW1pbCBWZWxpa292Ogo+IEhpIGFsbCwKPiAK
PiBJIHJlYWxpc2UgdGhpcyBoYXMgbGFuZGVkLCBzbyBhIHNtYWxsIEZZSSBjb21tZW50Lgo+IAo+
IE9uIFNhdCwgOSBNYXkgMjAyMCBhdCAxNToxNiwgTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJv
bm5lcy5vcmc+IHdyb3RlOgo+IAo+PiAraW50IGRybV9jbGllbnRfZnJhbWVidWZmZXJfZmx1c2go
c3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIsIHN0cnVjdCBkcm1fcmVjdCAqcmVjdCkK
Pj4gK3sKPj4gKyAgICAgICBpZiAoIWJ1ZmZlciB8fCAhYnVmZmVyLT5mYiB8fCAhYnVmZmVyLT5m
Yi0+ZnVuY3MtPmRpcnR5KQo+IAo+IEhtbSBjYW5ub3QgdGhpbmsgb2YgYSBnb29kIHJlYXNvbiB3
aHkgYW55b25lIHdvdWxkIGNhbGwgdGhpcyB3aXRoCj4gIWJ1ZmZlciB8fCAhYnVmZmVyLT5mYj8K
PiBNaWdodCBiZSBhIGdvb2QgaWRlYSB0byBXQVJOIGluIHRob3NlIGNhc2VzIC0gb3RoZXJ3aXNl
IHRoZSB1c2VyIGlzCj4gZ2l2ZW4gZmFsc2Ugc2Vuc2UgdG8gc2VjdXJpdHkuCj4gCgpJIGFncmVl
LCBJJ2xsIHNlbmQgYSBmaXh1cCB3aGVuIEkgZ2V0IHRocm91Z2ggbXkgYmFja2xvZy4KCk5vcmFs
Zi4KCj4gTG9va2luZyBhdCB0aGUgdXBjb21pbmcgdXNlciAoZHJtL2d1ZCkgaXQgYWxyZWFkeSBo
YXMgYm90aCAtIHNvIGl0J3MKPiBwZXJmZWN0bHkgc2FmZS4KPiAKPiAtRW1pbAo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
