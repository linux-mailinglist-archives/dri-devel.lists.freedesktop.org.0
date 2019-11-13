Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C3CFB56C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948736ED9A;
	Wed, 13 Nov 2019 16:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812DE89B33
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:42:30 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q70so2727107wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 08:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xAxTpWWLisg53fSIbFcdXkU3JsKnzzAuKpXYKeTMAPk=;
 b=Iu348687NDwXV2i2NwT25fYgdQ3tntY8S9mohv+3b/gE6FUZopBcFMI15Mxs4Cgv4n
 rrDGjbfwH1xsSe0kwhkrcLwOzOsAUYXKxQ763/U/WtATSAVXmqSGcybl/UZSOemLL7Uy
 sZP+IM0MzFTlmACF7Pb1LeUPzJKBWPBRpLHdBC1+DueKpefsKhly5RzL0ml9RTSIkhKu
 CJ9w/Bw1yr+xWuULZ7j9KnlOEKqcGK9c93uRYhBdh5ZhfKxAahSi60xhaciLPLiXbcte
 pz0yrwiv628TuHg6E9PDE1ly612uFdkImHlPqPIqdZuWUoGSCfmnHOfLaJRLdzLMoCmc
 VBhw==
X-Gm-Message-State: APjAAAWJ4R0A1v4HHjphcjFiuGsUbFuJcDppJraoUX1fx1WqOrc6R/D0
 7eayiZr7LySX3IerMvailw4B5u2KjBg=
X-Google-Smtp-Source: APXvYqwXfMDf243S6FJBBrSDJbj5s9tkYxZLgXL+zuOfIJ9AmD12Gu2ZWPNvuCShWmltuMpcHZiwCw==
X-Received: by 2002:a1c:4946:: with SMTP id w67mr3799279wma.16.1573663349135; 
 Wed, 13 Nov 2019 08:42:29 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id f188sm2641574wmf.3.2019.11.13.08.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 08:42:26 -0800 (PST)
Date: Wed, 13 Nov 2019 17:42:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/ast: Call struct drm_driver.{load, unload} before
 registering device
Message-ID: <20191113164224.GV23790@phenom.ffwll.local>
References: <20191113155857.9507-1-tzimmermann@suse.de>
 <20191113155857.9507-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113155857.9507-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xAxTpWWLisg53fSIbFcdXkU3JsKnzzAuKpXYKeTMAPk=;
 b=MxojzEeOIm/9gHzNyr8A6DjIfqEp/iz9yssDzCk1u626kK34pyXy2PIKUaJ4WnqpHe
 payeglwDE2sRtRh/nE/ZjHKfn1g010JbvYeOfqUOdMcJCKUDRreImAhmvwpeP3vl+Zhq
 T/VABeXVX3cTNA9jfALaBA1Roy/YsPjR6gdOQ=
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDQ6NTg6NTdQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gQm90aCBjYWxsYmFja3MgYXJlIGRlcHJlY2F0ZWQuIFJlbW92ZSB0aGVtIGFu
ZCBjYWxsIGZ1bmN0aW9ucyBleHBsaWNpdGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9kcnYuYyB8IDEzICsrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYwo+IGluZGV4IDc4
YzkwYTNjOTAzYi4uOWRhMjY3NTBhMjJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMKPiBAQCAt
MTA0LDE3ICsxMDQsMjQgQEAgc3RhdGljIGludCBhc3RfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2
ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQo+ICAJZGV2LT5wZGV2ID0g
cGRldjsKPiAgCXBjaV9zZXRfZHJ2ZGF0YShwZGV2LCBkZXYpOwo+ICAKPiAtCXJldCA9IGRybV9k
ZXZfcmVnaXN0ZXIoZGV2LCBlbnQtPmRyaXZlcl9kYXRhKTsKPiArCXJldCA9IGFzdF9kcml2ZXJf
bG9hZChkZXYsIGVudC0+ZHJpdmVyX2RhdGEpOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGVycl9k
cm1fZGV2X3B1dDsKPiAgCj4gKwlyZXQgPSBkcm1fZGV2X3JlZ2lzdGVyKGRldiwgZW50LT5kcml2
ZXJfZGF0YSk7Cj4gKwlpZiAocmV0KQo+ICsJCWdvdG8gZXJyX2FzdF9kcml2ZXJfdW5sb2FkOwo+
ICsKPiAgCXJldHVybiAwOwo+ICAKPiArZXJyX2FzdF9kcml2ZXJfdW5sb2FkOgo+ICsJYXN0X2Ry
aXZlcl91bmxvYWQoZGV2KTsKPiAgZXJyX2RybV9kZXZfcHV0Ogo+ICAJZHJtX2Rldl9wdXQoZGV2
KTsKPiAgZXJyX3BjaV9kaXNhYmxlX2RldmljZToKPiAgCXBjaV9kaXNhYmxlX2RldmljZShwZGV2
KTsKPiAgCXJldHVybiByZXQ7Cj4gKwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZAo+IEBAIC0xMjMs
NiArMTMwLDcgQEAgYXN0X3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gIAlzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+ICAKPiAgCWRybV9k
ZXZfdW5yZWdpc3RlcihkZXYpOwo+ICsJYXN0X2RyaXZlcl91bmxvYWQoZGV2KTsKPiAgCWRybV9k
ZXZfcHV0KGRldik7Cj4gIH0KPiAgCj4gQEAgLTIyOCw5ICsyMzYsNiBAQCBzdGF0aWMgc3RydWN0
IGRybV9kcml2ZXIgZHJpdmVyID0gewo+ICAJCQkgICBEUklWRVJfR0VNIHwKPiAgCQkJICAgRFJJ
VkVSX01PREVTRVQsCj4gIAo+IC0JLmxvYWQgPSBhc3RfZHJpdmVyX2xvYWQsCj4gLQkudW5sb2Fk
ID0gYXN0X2RyaXZlcl91bmxvYWQsCj4gLQo+ICAJLmZvcHMgPSAmYXN0X2ZvcHMsCj4gIAkubmFt
ZSA9IERSSVZFUl9OQU1FLAo+ICAJLmRlc2MgPSBEUklWRVJfREVTQywKPiAtLSAKPiAyLjIzLjAK
PiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
