Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 982F51A95B1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 10:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6421B6E906;
	Wed, 15 Apr 2020 08:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7CA6E905
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:09:45 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id l21so2523162otd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 01:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cR3k8d3xfmclQS8lvjY9yXbBPZe6NeGIStVHsQdqnps=;
 b=lX/Y2v8dhsU8Nb7yMJv2lv1K/wPWEKMCbEHtyrWqdPR8DoREn1lXkW+4BAm0a2VmQg
 B1xwJzesV4rnV2+6vk+a+DcJF1ohFZW8o5ElZl1SSoBs7tiQwHfxu9JlEj+cKDIiRwZm
 i1Kbk1gPa0K2GuH/AFYmiMyu+c78fOhMteOFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cR3k8d3xfmclQS8lvjY9yXbBPZe6NeGIStVHsQdqnps=;
 b=Y12QdSr4Qk+4fxLfxgZNBKnqnMk9x/USchUQ+Ud8Vjp54qBc6m4BSbPCKpRq6MY4QX
 +Q5M671cHILV8xbE+bjc0NcEBU7HYvSdB0d53yuz2Pjs1kFR6bICEGitjWpdW/SHot9O
 2vA1PByIwooxBke+kCwezGakQWPjBl1yKGyoaXJy4kU0jX8rkOtHC3MjbK0f/t3V0lpp
 lIWHD5SgxAPHq2oy3RgZaEug/eBXrQvxZPUwCGAF0Bik4CR5WP/2F4yNmY9QVWcCjecE
 QoEwmsYq5gAGCEj8D1f5XSHgzrxR9ICqvl1QOcr4F34KYHPeTTzIQyRt1zZ33onr6c/h
 LoyA==
X-Gm-Message-State: AGi0Pubq8NftHMNSqfjh7h62tRwrBc+shTwBll2sf2dkhV/84BqKwYKs
 scCNphNtKOfrg6/N3shej4oVD0XNf+EVIJbwgRI7Rw==
X-Google-Smtp-Source: APiQypKTYlFRX7NbAI2zQ9dkIwd61K6vLaomU5Zm5IZzuaepADUzy5xQ8jKDZxE4rMhhaV25UhYUeJw8I633O8Ye06M=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr12578122ota.303.1586938185063; 
 Wed, 15 Apr 2020 01:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-58-daniel.vetter@ffwll.ch>
 <d33d1565-1c1a-a926-01a1-cf01691ec84d@suse.de>
In-Reply-To: <d33d1565-1c1a-a926-01a1-cf01691ec84d@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 15 Apr 2020 10:09:33 +0200
Message-ID: <CAKMK7uHxN62MUJrFtWJ7oKjYPnrrMHPLZgSNVZX21BAsM=8P2w@mail.gmail.com>
Subject: Re: [PATCH 57/59] drm/ast: Use managed pci functions
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMTUsIDIwMjAgYXQgOTo1MiBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaSBEYW5pZWwKPgo+IEFtIDE1LjA0LjIwIHVtIDA5
OjQwIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+IEFsbG93cyB1cyB0byByZW1vdmUgYSBiaXQg
b2YgY2xlYW51cCBjb2RlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4gQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhh
dC5jb20+Cj4gPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4g
PiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IENjOiBFbWlsIFZlbGlrb3YgPGVtaWwu
dmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4gQ2M6ICJOb3JhbGYgVHLDuG5uZXMiIDxub3JhbGZA
dHJvbm5lcy5vcmc+Cj4gPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+ID4g
Q2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gQ2M6
ICJZLkMuIENoZW4iIDx5Y19jaGVuQGFzcGVlZHRlY2guY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMgIHwgMTAgKysrLS0tLS0tLQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X21haW4uYyB8ICAzIC0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYwo+ID4g
aW5kZXggYjdiYTIyZGRkY2FkLi40OGE5Y2M0ZTA4MGEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3Rf
ZHJ2LmMKPiA+IEBAIC05MSwxNSArOTEsMTMgQEAgc3RhdGljIGludCBhc3RfcGNpX3Byb2JlKHN0
cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQo+ID4K
PiA+ICAgICAgIGFzdF9raWNrX291dF9maXJtd2FyZV9mYihwZGV2KTsKPiA+Cj4gPiAtICAgICBy
ZXQgPSBwY2lfZW5hYmxlX2RldmljZShwZGV2KTsKPiA+ICsgICAgIHJldCA9IHBjaW1fZW5hYmxl
X2RldmljZShwZGV2KTsKPiA+ICAgICAgIGlmIChyZXQpCj4gPiAgICAgICAgICAgICAgIHJldHVy
biByZXQ7Cj4gPgo+ID4gICAgICAgZGV2ID0gZHJtX2Rldl9hbGxvYygmZHJpdmVyLCAmcGRldi0+
ZGV2KTsKPiA+IC0gICAgIGlmIChJU19FUlIoZGV2KSkgewo+ID4gLSAgICAgICAgICAgICByZXQg
PSBQVFJfRVJSKGRldik7Cj4gPiAtICAgICAgICAgICAgIGdvdG8gZXJyX3BjaV9kaXNhYmxlX2Rl
dmljZTsKPiA+IC0gICAgIH0KPiA+ICsgICAgIGlmIChJU19FUlIoZGV2KSkKPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuICBQVFJfRVJSKGRldik7Cj4gPgo+ID4gICAgICAgZGV2LT5wZGV2ID0gcGRl
djsKPiA+ICAgICAgIHBjaV9zZXRfZHJ2ZGF0YShwZGV2LCBkZXYpOwo+ID4gQEAgLTEyMCw4ICsx
MTgsNiBAQCBzdGF0aWMgaW50IGFzdF9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNv
bnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCj4gPiAgICAgICBhc3RfZHJpdmVyX3VubG9h
ZChkZXYpOwo+ID4gIGVycl9kcm1fZGV2X3B1dDoKPiA+ICAgICAgIGRybV9kZXZfcHV0KGRldik7
Cj4gPiAtZXJyX3BjaV9kaXNhYmxlX2RldmljZToKPiA+IC0gICAgIHBjaV9kaXNhYmxlX2Rldmlj
ZShwZGV2KTsKPiA+ICAgICAgIHJldHVybiByZXQ7Cj4gPgo+ID4gIH0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9tYWluLmMKPiA+IGluZGV4IGU1Mzk4ZTNkYWJlNy4uMWIzNTcyOGFkODcxIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tYWluLmMKPiA+IEBAIC01MzEsOCArNTMxLDUgQEAgdm9pZCBhc3RfZHJp
dmVyX3VubG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ID4gICAgICAgZHJtX21vZGVfY29u
ZmlnX2NsZWFudXAoZGV2KTsKPiA+Cj4gPiAgICAgICBhc3RfbW1fZmluaShhc3QpOwo+ID4gLSAg
ICAgaWYgKGFzdC0+aW9yZWdzICE9IGFzdC0+cmVncyArIEFTVF9JT19NTV9PRkZTRVQpCj4gPiAt
ICAgICAgICAgICAgIHBjaV9pb3VubWFwKGRldi0+cGRldiwgYXN0LT5pb3JlZ3MpOwo+ID4gLSAg
ICAgcGNpX2lvdW5tYXAoZGV2LT5wZGV2LCBhc3QtPnJlZ3MpOwo+Cj4gVGhpcyBnZXRzIHVubWFw
cGVkIGFzIHBhcnQgb2YgdGhlIGF1dG9tYXRpYyBwY2lfZGlzYWJsZV9kZXZpY2UoKSwgSSBndWVz
cz8KCll1cCwgb25jZSB5b3UgZ28gd2l0aCBwY2ltX2VuYWJsZV9kZXZpY2UgYWxsIHBjaV8gZnVu
Y3Rpb25zIG9uIHRoYXQKZGV2aWNlIGJlY29tZSBtYW5nZWQgYW5kIGF1dG8tY2xlYW51cC4KCj4g
RG8gd2UgbmVlZCBkcm1fZGV2X2VudGVyKCkvX2V4aXQoKSB0byBtYWtlIEkvTyB3b3JrIHJlbGlh
Ymx5PwoKVGhhdCBkb2VzIG5vdGhpbmcgd2l0aG91dCBkcm1fZGV2X3VucGx1ZygpLCB3aGljaCBo
YXMgdGhlIGFubm95aW5nCnNpZGUgZWZmZWN0IHRoYXQgaXQgYWxzbyBzaHV0cyB1cCBzdHVmZiBs
aWtlCmRybV9hdG9taWNfaGVscGVyX3NodXRkb3duIGZvciBtb2R1bGUgdW5sb2FkLiBBbmQgZGV2
ZWxvcGVycyByZWFsbHkKd2FudCB0aGVpciBkZXZpY2VzIHRvIGJlIHNodXQgb2ZmIG9uIGRyaXZl
ciB1bmxvYWQuIFNvIHllYWgKdW5mb3J0dW5hdGVseSB3ZSBjdXJyZW50bHkgY2FuIGRlY2lkZSBi
ZXR3ZWVuICJjb3JyZWN0IGZvciBob3R1bnBsdWciCmFuZCAiY29udmVuaWVudCBmb3IgZHJpdmVy
IHVubG9hZCBmb3IgZHJpdmVyIGF1dGhvcnMiLiBJJ20gbm90IHN1cmUKd2hhdCB0byBiZXN0IGRv
IGhlcmUsIHNpbmNlIGFsbCBvcHRpb25zIGFyZSBraW5kYSBub3QgZ3JlYXQgZm9yIG9uZQp1c2Ut
Y2FzZSBvciB0aGUgb3RoZXIuCi1EYW5pZWwKCj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiA+
ICAgICAgIGtmcmVlKGFzdCk7Cj4gPiAgfQo+ID4KPgo+IC0tCj4gVGhvbWFzIFppbW1lcm1hbm4K
PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJICj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQo+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2
cmZmZXIKPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
