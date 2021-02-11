Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F28318DCE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 16:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921566EE31;
	Thu, 11 Feb 2021 15:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683046EE31
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 15:05:16 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z22so7254132edb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 07:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=KcdIifEUv4tTQv36iQgQr9SmmJzq/a9ZjbDxci6wITo=;
 b=fNvY6GFsvvMMw1fN9EN5AahDoonizMfbEM6GmiEtutbfw/uR8VwtPxaMF+QLoyW746
 nahkvbYEuHTTY1Y8bh5P+6f/Kkrev63fnwIxYnrI5K7pUm+IlTVcWZGlDl4eD2o1b+mp
 2ep6iSzP7uJlD+zX/mc45wVvDGcgimU3Z0wVSd+8w1u5xZ9+CiwOIbTX3OG27rB32MMG
 R8ZK58JjS/QEUr79PD0A23mtA2pgF4M/lTde223cMnVQtFZ99keNlb8/yEGhAJAdOGCo
 BPej8WN66cLnG55a9L4TqGtJGvQBFoD+SzP9ppD70/2d4CMcVPMBbm5+1cOMmeNwBp8X
 ZDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KcdIifEUv4tTQv36iQgQr9SmmJzq/a9ZjbDxci6wITo=;
 b=sdokbaT5MdRUPXJMSm75lCrXIN+f7bLv3f+K5wxkT91OsdV/96MllYisd7y5MZDThP
 whN+bIVzS7NEj+ndoI31EEb522ggc7h55ezQucKH4/aCCafWz6vyIMy6pJilFOa5JGlB
 mxf3hITcmC+zQD9kdaoIl2ItKcR8V9ZjBJKcLslj0b7UwuLQx7t67WvwPXl6kstJEhlt
 SCF1qPTcHs2oL3NeeIIDpGhg/Ms/MARH+x9DMJI5Xlww8oU9Lp94CturwkSlYBbtkqXs
 Kml2fCyDf9NdHKv92eKXGxMuwlwIi/zY89ABbuYH1jJkC3PA2utGli0ZJsLfhC1Ch1O+
 V+yw==
X-Gm-Message-State: AOAM53368XA8I/qPAa8RlhH44+JtuPVnOvUfC9vZTvjrvcA3Yhat1Jm4
 hGRdHTn/CgYaRczn5V8ICh5PDqQYBxmwMA==
X-Google-Smtp-Source: ABdhPJxPOQpOpe3DrU+VghQZDCNzZVl+EhZ5iMvsXR/NEuPxDbiCiuLCdtk0MErtltdzR1p4HvVsgA==
X-Received: by 2002:aa7:ce96:: with SMTP id y22mr8660597edv.369.1613055915091; 
 Thu, 11 Feb 2021 07:05:15 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:128e:c59b:ac8b:316f?
 ([2a02:908:1252:fb60:128e:c59b:ac8b:316f])
 by smtp.gmail.com with ESMTPSA id hr31sm4425681ejc.125.2021.02.11.07.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 07:05:14 -0800 (PST)
Subject: Re: [PATCH 1/4] drm/vram-helper: cleanup
 drm_gem_vram_bo_driver_move_notify
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, kraxel@redhat.com, zackr@vmware.com,
 dri-devel@lists.freedesktop.org
References: <20210211131659.276275-1-christian.koenig@amd.com>
 <365e99a6-24c4-33b5-ae9c-15904b056b89@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <acc54d35-38b1-52b0-1ef1-75a8a4f6469a@gmail.com>
Date: Thu, 11 Feb 2021 16:05:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <365e99a6-24c4-33b5-ae9c-15904b056b89@suse.de>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxMS4wMi4yMSB1bSAxNTo1MiBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+IEhpCj4K
PiBBbSAxMS4wMi4yMSB1bSAxNDoxNiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+IFN3YXBw
aW5nIGJvLT5tZW0gd2FzIGNvbXBsZXRlbHkgdW5lY2Vzc2FyeS4gQ2xlYW51cCB0aGUgZnVuY3Rp
b24gd2hpY2gKPj4gaXMganVzdCBhIGxlZnRvdmVyIGZyb20gYSBUVE0gY2xlYW51cC4KPgo+IFll
cyB0aGlzIHdhcyBpbnRyb2R1Y2VkIGluIGEgcmVjZW50IGNsZWFudXAgZWZmb3J0LiBDYW4geW91
IGV4cGxhaW4gCj4gd2hhdCB0aGUgY29kZSBpbnRlbmRzIHRvIGRvPyBJdCBzZWVtcyBhcyBpZiBp
dCB0cmllcyB0byAicmUtdW5tYXAgdGhlIAo+IEJPIiBpZiB0aGUgbW92ZV9tZW1jcHkgZmFpbHMu
Cj4KPiBJZiB0aGUgbW92ZV9tZW1jcHkgZmFpbHMgbm93LCBpdCBzZWVtcyBsaWtlIHdlIGNhbiBs
aXZlIHdpdGhvdXQgCj4gcmV2ZXJ0aW5nIHRoYXQgY2FsbCB0byBkcm1fZ2VtX3ZyYW1fYm9fZHJp
dmVyX21vdmVfbm90aWZ5KCkuICg/KQoKSSB0aGluayBzbywgYnV0IEknbSBub3QgMTAwJSBzdXJl
IGVpdGhlci4KClRoZSBzd2FwKCkgLT4gbm90aWZ5IC0+IHN3YXAoKSB3YXMganVzdCBob3cgVFRN
IGRpZCBpdCBhbmQgdGhhdCB3YXMgCm1vdmVkIGludG8gdGhlIGRyaXZlcnMuCgpJJ20gbm93IGp1
c3QgdHJ5aW5nIHRvIHJlbW92ZSBhbGwgdGhlIGhhcmQgd3JpdGUgYWNjZXNzZXMgdG8gYm8tPm1l
bSAKZnJvbSBkcml2ZXJzIGFuZCBzdHVtYmxlZCBvdmVyIHRoaXMgaGVyZS4KClRoYW5rcyBmb3Ig
dGhlIGNvbW1lbnRzLApDaHJpc3RpYW4uCgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyB8
IDE4ICsrKystLS0tLS0tLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3ZyYW1faGVscGVyLmMgCj4+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuYwo+PiBpbmRleCBhMDk5MmYwYjhhZmQuLjBjMjIzM2VlNjAyOSAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCj4+IEBAIC01NjQsOSArNTY0LDcgQEAgc3Rh
dGljIHZvaWQgCj4+IGRybV9nZW1fdnJhbV9ib19kcml2ZXJfZXZpY3RfZmxhZ3Moc3RydWN0IGRy
bV9nZW1fdnJhbV9vYmplY3QgKmdibywKPj4gwqDCoMKgwqDCoCAqcGwgPSBnYm8tPnBsYWNlbWVu
dDsKPj4gwqAgfQo+PiDCoCAtc3RhdGljIHZvaWQgZHJtX2dlbV92cmFtX2JvX2RyaXZlcl9tb3Zl
X25vdGlmeShzdHJ1Y3QgCj4+IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibywKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBldmljdCwK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3X21lbSkKPj4gK3N0YXRpYyB2b2lkIGRybV9nZW1fdnJh
bV9ib19kcml2ZXJfbW92ZV9ub3RpZnkoc3RydWN0IAo+PiBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpn
Ym8pCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0g
Jmdiby0+Ym87Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGJvLT5iYXNl
LmRldjsKPj4gQEAgLTU4MiwxNiArNTgwLDggQEAgc3RhdGljIGludCBkcm1fZ2VtX3ZyYW1fYm9f
ZHJpdmVyX21vdmUoc3RydWN0IAo+PiBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8sCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX29w
ZXJhdGlvbl9jdHggKmN0eCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm5ld19tZW0pCj4+IMKgIHsKPj4gLcKg
wqDCoCBpbnQgcmV0Owo+PiAtCj4+IC3CoMKgwqAgZHJtX2dlbV92cmFtX2JvX2RyaXZlcl9tb3Zl
X25vdGlmeShnYm8sIGV2aWN0LCBuZXdfbWVtKTsKPj4gLcKgwqDCoCByZXQgPSB0dG1fYm9fbW92
ZV9tZW1jcHkoJmdiby0+Ym8sIGN0eCwgbmV3X21lbSk7Cj4+IC3CoMKgwqAgaWYgKHJldCkgewo+
PiAtwqDCoMKgwqDCoMKgwqAgc3dhcCgqbmV3X21lbSwgZ2JvLT5iby5tZW0pOwo+PiAtwqDCoMKg
wqDCoMKgwqAgZHJtX2dlbV92cmFtX2JvX2RyaXZlcl9tb3ZlX25vdGlmeShnYm8sIGZhbHNlLCBu
ZXdfbWVtKTsKPj4gLcKgwqDCoMKgwqDCoMKgIHN3YXAoKm5ld19tZW0sIGdiby0+Ym8ubWVtKTsK
Pj4gLcKgwqDCoCB9Cj4+IC3CoMKgwqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoCBkcm1fZ2VtX3Zy
YW1fYm9fZHJpdmVyX21vdmVfbm90aWZ5KGdibyk7Cj4+ICvCoMKgwqAgcmV0dXJuIHR0bV9ib19t
b3ZlX21lbWNweSgmZ2JvLT5ibywgY3R4LCBuZXdfbWVtKTsKPj4gwqAgfQo+PiDCoCDCoCAvKgo+
PiBAQCAtOTQ3LDcgKzkzNyw3IEBAIHN0YXRpYyB2b2lkIGJvX2RyaXZlcl9kZWxldGVfbWVtX25v
dGlmeShzdHJ1Y3QgCj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPj4gwqAgwqDCoMKgwqDCoCBn
Ym8gPSBkcm1fZ2VtX3ZyYW1fb2ZfYm8oYm8pOwo+PiDCoCAtwqDCoMKgIGRybV9nZW1fdnJhbV9i
b19kcml2ZXJfbW92ZV9ub3RpZnkoZ2JvLCBmYWxzZSwgTlVMTCk7Cj4+ICvCoMKgwqAgZHJtX2dl
bV92cmFtX2JvX2RyaXZlcl9tb3ZlX25vdGlmeShnYm8pOwo+PiDCoCB9Cj4+IMKgIMKgIHN0YXRp
YyBpbnQgYm9fZHJpdmVyX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4KPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
