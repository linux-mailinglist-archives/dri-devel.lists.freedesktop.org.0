Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1405FB539
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681EA6ED92;
	Wed, 13 Nov 2019 16:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DC16ED92
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:35:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i12so3131228wro.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 08:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=UkXx3W4qufvVOjAzTSHRA/yLN1aPEj2ZXdbdMn2qd/w=;
 b=mXnFhBNhGmQ/RWBZRveGCEU+OVbkJLITz1TGaMdIZQ/BxD1zK967r8w3nbprenlMN5
 VeeWVks+Gm6x/H6ls315tk40DRXH6o/WyAa1AcSTuvCfK4RQbZnFzRRkOYNRBMUjCwhD
 egG7aeadeCqRVLan40r/NxAb+ffRRYWBoqu/nNHudrhI6FCQ4GYBsO8vkJMCO+DDisNL
 5aqf8j+btwdvZatjy2y8XgmBw1eaAsP66A3dQEtd/UWi0yHTcnLJaarecwqWv270kIX5
 bwQT2CHQDxd4JqIkN7IPzasIjXls86dCYFsEpu63syUazI5JHxwUZlG6lKxPJMluF7N9
 LyoQ==
X-Gm-Message-State: APjAAAWFU9UoKPMJ/ErCJgoabIT68X7l9z7Csm7yS+P+iw553btJbkjK
 VbT2RA5EQj2VVue1VsXcbHl37w==
X-Google-Smtp-Source: APXvYqzr0C10jVBrFHN0qpTLezqN8YCGV+2kSPEGcKTAu/N1uCBLJ7Fm2lARus7QZhiZA50VhLRYbw==
X-Received: by 2002:adf:9d87:: with SMTP id p7mr3607451wre.11.1573662944222;
 Wed, 13 Nov 2019 08:35:44 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u203sm2852238wme.34.2019.11.13.08.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 08:35:43 -0800 (PST)
Date: Wed, 13 Nov 2019 17:35:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/ast: Replace drm_get_pci_device() and
 drm_put_dev()
Message-ID: <20191113163541.GT23790@phenom.ffwll.local>
References: <20191113155857.9507-1-tzimmermann@suse.de>
 <20191113155857.9507-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113155857.9507-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UkXx3W4qufvVOjAzTSHRA/yLN1aPEj2ZXdbdMn2qd/w=;
 b=H0DdfqLUtpg8Y1EINlhRT/Q+9+4yzs9NGdZz/SsghpV7DoBrnTpLpA+ektL3J7iBvc
 TIY1icdaSnTp38CPKIRqjpUo0/ToiSGK1ngBGBhNhNU//sBhWe6Hb6Mtg0XSo9ZpCOKS
 XJVoKSp3/pF0s06ri+1+QKbRJPe+iZnM2vGzI=
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

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDQ6NTg6NTZQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gQm90aCBmdW5jdGlvbnMgYXJlIGRlcHJlY2F0ZWQuIE9wZW4tY29kZSB0aGVt
IHRoZW0gaW4gcHJlcGFyYXRpb24KPiBvZiByZW1vdmluZyBzdHJ1Y3QgZHJtX2RyaXZlci57bG9h
ZCx1bmxvYWR9Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyB8IDMx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMKPiBpbmRl
eCBkNzYzZGE2ZjA4MzQuLjc4YzkwYTNjOTAzYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jCj4g
QEAgLTg2LDkgKzg2LDM1IEBAIHN0YXRpYyB2b2lkIGFzdF9raWNrX291dF9maXJtd2FyZV9mYihz
dHJ1Y3QgcGNpX2RldiAqcGRldikKPiAgCj4gIHN0YXRpYyBpbnQgYXN0X3BjaV9wcm9iZShzdHJ1
Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKPiAgewo+
ICsJc3RydWN0IGRybV9kZXZpY2UgKmRldjsKPiArCWludCByZXQ7Cj4gKwo+ICAJYXN0X2tpY2tf
b3V0X2Zpcm13YXJlX2ZiKHBkZXYpOwo+ICAKPiAtCXJldHVybiBkcm1fZ2V0X3BjaV9kZXYocGRl
diwgZW50LCAmZHJpdmVyKTsKPiArCXJldCA9IHBjaV9lbmFibGVfZGV2aWNlKHBkZXYpOwo+ICsJ
aWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCWRldiA9IGRybV9kZXZfYWxsb2MoJmRy
aXZlciwgJnBkZXYtPmRldik7CgpXb3VsZCBiZSBuaWNlIHRvIGFsc28gc3dpdGNoIG92ZXIgdG8g
ZW1iZWRkaW5nIGRybV9kZXZpY2UgYW5kCmRybV9kZXZfaW5pdCwgYnV0IGZvciBhbm90aGVyIHBh
dGNoLiBUaGlzIGlzCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KCj4gKwlpZiAoSVNfRVJSKGRldikpIHsKPiArCQlyZXQgPSBQVFJfRVJSKGRldik7
Cj4gKwkJZ290byBlcnJfcGNpX2Rpc2FibGVfZGV2aWNlOwo+ICsJfQo+ICsKPiArCWRldi0+cGRl
diA9IHBkZXY7Cj4gKwlwY2lfc2V0X2RydmRhdGEocGRldiwgZGV2KTsKPiArCj4gKwlyZXQgPSBk
cm1fZGV2X3JlZ2lzdGVyKGRldiwgZW50LT5kcml2ZXJfZGF0YSk7Cj4gKwlpZiAocmV0KQo+ICsJ
CWdvdG8gZXJyX2RybV9kZXZfcHV0Owo+ICsKPiArCXJldHVybiAwOwo+ICsKPiArZXJyX2RybV9k
ZXZfcHV0Ogo+ICsJZHJtX2Rldl9wdXQoZGV2KTsKPiArZXJyX3BjaV9kaXNhYmxlX2RldmljZToK
PiArCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKPiArCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4g
IHN0YXRpYyB2b2lkCj4gQEAgLTk2LDcgKzEyMiw4IEBAIGFzdF9wY2lfcmVtb3ZlKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNpX2dldF9k
cnZkYXRhKHBkZXYpOwo+ICAKPiAtCWRybV9wdXRfZGV2KGRldik7Cj4gKwlkcm1fZGV2X3VucmVn
aXN0ZXIoZGV2KTsKPiArCWRybV9kZXZfcHV0KGRldik7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQg
YXN0X2RybV9mcmVlemUoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAtLSAKPiAyLjIzLjAKPiAK
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
