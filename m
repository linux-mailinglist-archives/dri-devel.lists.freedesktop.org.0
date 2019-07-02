Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2435D0BB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 15:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AF5898CC;
	Tue,  2 Jul 2019 13:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D099898CC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 13:35:57 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w20so27336337edd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 06:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=GlnLnFAncfwccDgZijUzPpnP3dC9NUu1flbr9KSBWWo=;
 b=LuzALS0VAZyTAsigoKgh5r2kfrLt/AYzZSj49JYjoE04J+sPWmk+3j3GD11/x6MXhm
 5i/gXvL8Wr1P3RddiyPfNtULenSLezmaAd9gGdrqZb9YqpejKKFA7vxUGCjpImhsXb2i
 ziP1XIhWWgPc6Bi4JXAH+CCkxR22B3kZkl2zNJFEor4vWnOO394oOfDKJPrS5+DUS8it
 ugq6RDZqZiNJDsYM4SF7xc8hCBKVtpavT+CUCvySNTo6j6++VE2lHkJjyDiHfiK0PVIe
 5uIC+5ORr0+8aWhXtSddOL9CBQdSp1FWlE1d0k4hoiXuVmTgRY8RBa6xK2TDnmnrVOH8
 eZQg==
X-Gm-Message-State: APjAAAWKNYT/E6X+IoXMO87rlqPojIGeehB4u1BL00q1HgMz+NTjiEjf
 WLxu6NZMF4e+KBI3H+DzXlgFeg==
X-Google-Smtp-Source: APXvYqxfvZWHV/DPyJmUao8hZ3fY6uqZhuboMI3GtEpH0H60XimXmQi1sDiKZYTRB4jJKVcZuLc6Hw==
X-Received: by 2002:a17:906:4552:: with SMTP id
 s18mr28038831ejq.271.1562074555798; 
 Tue, 02 Jul 2019 06:35:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id by12sm2812771ejb.37.2019.07.02.06.35.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 06:35:54 -0700 (PDT)
Date: Tue, 2 Jul 2019 15:35:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 30/33] drm: add missing include to drm_vram_mm_helper.h
Message-ID: <20190702133552.GD15868@phenom.ffwll.local>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-31-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190630061922.7254-31-sam@ravnborg.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GlnLnFAncfwccDgZijUzPpnP3dC9NUu1flbr9KSBWWo=;
 b=Pj2JV8MjJBYZspACNp77cnS3aqKOIkPq10KQSl7AL19jV8hFEoTCoYsUDGum0LhpRF
 fDgEM9c0tq2urNiaSCPWUZfq8TwpPZSfnQDZKToeoUAvsCcrKeLcy2mzXUgEOh5RndJm
 nQLm6/gSSI8hNBuh94XVRv3XNJfAfkmESFYYg=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMDg6MTk6MTlBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IFRoZSBtYWNybyBEUk1fVlJBTV9NTV9GSUxFX09QRVJBVElPTlMgcmVmZXJlbmNzCj4g
ZnVuY3Rpb25zIGRlY2xhcmVkIGluIG90aGVyIGhlYWRlciBmaWxlcy4KPiBJbmNsdWRlIHRoZXNl
IGhlYWRlciBmaWxlcyBzbyB0aGlzIGhlYWRlciBmaWxlcwo+IHB1bGxzIGluIHdoYXQgaXQgcmVm
ZXJlbmNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4g
Q2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiAtLS0K
PiBUaGUgbGlzdCBvZiBjYzogd2FzIHRvbyBsYXJnZSB0byBhZGQgYWxsIHJlY2lwaWVudHMgdG8g
dGhlIGNvdmVyIGxldHRlci4KPiBQbGVhc2UgZmluZCBjb3ZlciBsZXR0ZXIgaGVyZToKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdW5lL3Ro
cmVhZC5odG1sCj4gU2VhcmNoIGZvciAiZHJtOiBkcm9wIHVzZSBvZiBkcm1wLmggaW4gZHJtLW1p
c2MiCj4gCj4gICAgICAgICBTYW0KPiAKPiAgaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVy
LmggfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1f
dnJhbV9tbV9oZWxwZXIuaAo+IGluZGV4IGE4ZmZkODU5OWIwOC4uMmFhY2ZiMWNjZmFlIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV92cmFtX21tX2hlbHBlci5oCj4gKysrIGIvaW5jbHVk
ZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmgKPiBAQCAtMyw2ICszLDggQEAKPiAgI2lmbmRlZiBE
Uk1fVlJBTV9NTV9IRUxQRVJfSAo+ICAjZGVmaW5lIERSTV9WUkFNX01NX0hFTFBFUl9ICj4gIAo+
ICsjaW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+
CgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCmJ0
dyBmb3IgdGhlc2UgaGVscGVycyBnb29kIGlmIHlvdSBtYW51YWxseSBhZGQgcmVsZXZhbnQgcGVv
cGxlIC0gc2luY2UKdGhlcmUgYXJlIG1haW50YWluZXJzIGZvciB0aGUgZW50aXJlIHN1YnN5c3Rl
bSBnZXRfbWFpbnRhaW5lcnMucGwgZG9lc24ndApsb29rIGF0IGdpdCBoaXN0b3J5LiBPciB3ZSdk
IG5lZWQgdG8gYWRkIE1BSU5UQUlORVJTIGVudHJpZXMgbWFudWFsbHkgZm9yCmFsbCBvZiB0aGVt
IC4uLgotRGFuaWVsCgo+ICAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmg+Cj4gIAo+
ICBzdHJ1Y3QgZHJtX2RldmljZTsKPiAtLSAKPiAyLjIwLjEKPiAKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
