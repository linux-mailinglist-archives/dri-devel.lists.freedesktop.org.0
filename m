Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C00523C551
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E846E4E8;
	Wed,  5 Aug 2020 05:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C126E4E8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:55:27 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id n141so21023987ybf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=flQGLEwQt/DviUPlSzPbh/VyCilgVM3DfuslZ380AgA=;
 b=Lx2+1QMVvSzW6qEemjSIHFwZY3jmqxg7OgWtWgZ1mFNNKhqgXTc0YVfWj31x5WqBgK
 cs2dembpkkTz33Lp3b6aSpKHG6e44G87St7zQDzRzZ8r9OKU+Lbgf3YaQDuEhG0tXnH6
 z3x8Z6xCvcViU3mv4iCCJm3ipTlhtobeMMfFlPnCAJolZTDM/0ObjghVDfIHkWFgaZBX
 tbwD9f6or5BFU5vAohOJD1ncVh887TzZ1xhWYbv+kG+qZ0Y7snAIfi2eUhvN7PkyaBVb
 J0pD8XgRQ8cA5xHBHqAZECNB+EHE8VipcWnl8CHafZuKydtO5XWkzgEfUsTlpKjib2tD
 vpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=flQGLEwQt/DviUPlSzPbh/VyCilgVM3DfuslZ380AgA=;
 b=d6aC6LY6XfZI0HWzLNGeQ2tMZpEGBcvelToxuvRXMPac26IqX+TvldI/vzWwcXMc+q
 jexEgWpa3GSM2gZEQi9FJzin8TfS1ojXkTSiy9F2tSWdF42MJP4TGvq3cuMKAczD8JqO
 yATjh3YXcfVbtQrGX/ZfnHDybSjWzfezHf/+A8gv2KNrawMrRUHMPco8MLd1CEariUl1
 SUP250tjLcS2tDwf/Nm1JkPZORRRRsywXC0sVplCdbD3y2+f/9kqcwEDY3xlqdL70/yA
 hOjFKqwITEpLNa2ZMKDNm8/r4Qj/UwHJUszlesJWGgqrxph2vMckTAMBAK3IpXsn3DCD
 yl9A==
X-Gm-Message-State: AOAM531utgcNbnkFJx5gDpbLuzU/0LCVcLlbYW8oxFdXG3z4ix0Jz40k
 bbItkMPZDLlpfa6C96gp2WXGrT+DK4Ai+s0sNt8=
X-Google-Smtp-Source: ABdhPJxgt2VRnEfTd1L7bvvUNKXgrL6W5vv3RflOZVKVUrv7gaeldHpRq0S2YDh2BieHJh3C0LHr83T1zHhFd8fuIyU=
X-Received: by 2002:a25:cbc5:: with SMTP id b188mr2256296ybg.268.1596606926974; 
 Tue, 04 Aug 2020 22:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-55-airlied@gmail.com>
 <cb1104e1-5b15-0714-7595-d4641d9af938@amd.com>
In-Reply-To: <cb1104e1-5b15-0714-7595-d4641d9af938@amd.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:55:16 +1000
Message-ID: <CACAvsv7stWt3g8RRY1eMicqecdAj16uTpTb88nFdiwVASOPfeQ@mail.gmail.com>
Subject: Re: [PATCH 54/59] drm/ttm: drop list of memory managers from device.
 (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: sroland@vmware.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, Ben Skeggs <bskeggs@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA0IEF1ZyAyMDIwIGF0IDIxOjM3LCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDQuMDguMjAgdW0gMDQ6NTYgc2NocmllYiBE
YXZlIEFpcmxpZToKPiA+IEZyb206IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4g
Pgo+ID4gVGhlIGRyaXZlciBub3cgY29udHJvbHMgdGhlc2UsIHRoZSBjb3JlIGp1c3QgY29udHJv
bHMgdGhlIHN5c3RlbQo+ID4gbWVtb3J5IG9uZS4KPiA+Cj4gPiB2MjogaW5pdCBzeXNtYW4gZXhw
bGljaXRseSBhbmQgYXNzaWduIGl0IGFzIGEgZHJpdmVyIG1hbmFnZXIKPiA+IHRvIHNpbXBsaWZ5
IHRoZSBsb29rdXAgc2VxdWVuY2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBCZW4gU2tlZ2dzIDxic2tlZ2dz
QHJlZGhhdC5jb20+Cgo+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YyAgICB8IDYgKysrLS0tCj4gPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggfCA2
ICsrLS0tLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiA+IGluZGV4IDc4YjcyNDQzYTllZi4uMTJh
YmU0NmJmYmMxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ID4gQEAgLTE1NTgsNiArMTU1
OCw3IEBAIGludCB0dG1fYm9fZGV2aWNlX3JlbGVhc2Uoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJk
ZXYpCj4gPgo+ID4gICAgICAgbWFuID0gdHRtX21hbmFnZXJfdHlwZShiZGV2LCBUVE1fUExfU1lT
VEVNKTsKPiA+ICAgICAgIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2Rpc2FibGUobWFuKTsKPiA+ICsg
ICAgIHR0bV9zZXRfZHJpdmVyX21hbmFnZXIoYmRldiwgVFRNX1BMX1NZU1RFTSwgTlVMTCk7Cj4g
Pgo+ID4gICAgICAgbXV0ZXhfbG9jaygmdHRtX2dsb2JhbF9tdXRleCk7Cj4gPiAgICAgICBsaXN0
X2RlbCgmYmRldi0+ZGV2aWNlX2xpc3QpOwo+ID4gQEAgLTE1ODMsNyArMTU4NCw3IEBAIEVYUE9S
VF9TWU1CT0wodHRtX2JvX2RldmljZV9yZWxlYXNlKTsKPiA+Cj4gPiAgIHN0YXRpYyB2b2lkIHR0
bV9ib19pbml0X3N5c21hbihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKPiA+ICAgewo+ID4g
LSAgICAgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSB0dG1fbWFuYWdlcl90eXBl
KGJkZXYsIFRUTV9QTF9TWVNURU0pOwo+ID4gKyAgICAgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5h
Z2VyICptYW4gPSAmYmRldi0+c3lzbWFuOwo+ID4KPiA+ICAgICAgIC8qCj4gPiAgICAgICAgKiBJ
bml0aWFsaXplIHRoZSBzeXN0ZW0gbWVtb3J5IGJ1ZmZlciB0eXBlLgo+ID4gQEAgLTE1OTQsNiAr
MTU5NSw3IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19pbml0X3N5c21hbihzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldikKPiA+ICAgICAgIG1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdf
Q0FDSEVEOwo+ID4KPiA+ICAgICAgIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2luaXQobWFuLCAwKTsK
PiA+ICsgICAgIHR0bV9zZXRfZHJpdmVyX21hbmFnZXIoYmRldiwgVFRNX1BMX1NZU1RFTSwgbWFu
KTsKPiA+ICAgICAgIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX3NldF91c2VkKG1hbiwgdHJ1ZSk7Cj4g
PiAgIH0KPiA+Cj4gPiBAQCAtMTYxNSw4ICsxNjE3LDYgQEAgaW50IHR0bV9ib19kZXZpY2VfaW5p
dChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiA+Cj4gPiAgICAgICBiZGV2LT5kcml2ZXIg
PSBkcml2ZXI7Cj4gPgo+ID4gLSAgICAgbWVtc2V0KGJkZXYtPm1hbl9wcml2LCAwLCBzaXplb2Yo
YmRldi0+bWFuX3ByaXYpKTsKPiA+IC0KPiA+ICAgICAgIHR0bV9ib19pbml0X3N5c21hbihiZGV2
KTsKPiA+Cj4gPiAgICAgICBiZGV2LT52bWFfbWFuYWdlciA9IHZtYV9tYW5hZ2VyOwo+ID4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90
dG0vdHRtX2JvX2RyaXZlci5oCj4gPiBpbmRleCBiZmQxOTQwMDM3MmYuLmQ1NjQ2ZDdjYWM2MCAx
MDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiA+ICsrKyBi
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiA+IEBAIC00MTQsNyArNDE0LDcgQEAg
c3RydWN0IHR0bV9ib19kZXZpY2Ugewo+ID4gICAgICAgLyoKPiA+ICAgICAgICAqIGFjY2VzcyB2
aWEgdHRtX21hbmFnZXJfdHlwZS4KPiA+ICAgICAgICAqLwo+ID4gLSAgICAgc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyIG1hbl9wcml2W1RUTV9OVU1fTUVNX1RZUEVTXTsKPiA+ICsgICAgIHN0
cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciBzeXNtYW47Cj4gPiAgICAgICBzdHJ1Y3QgdHRtX21l
bV90eXBlX21hbmFnZXIgKm1hbl9kcnZbVFRNX05VTV9NRU1fVFlQRVNdOwo+ID4gICAgICAgLyoK
PiA+ICAgICAgICAqIFByb3RlY3RlZCBieSBpbnRlcm5hbCBsb2Nrcy4KPiA+IEBAIC00NDYsOSAr
NDQ2LDcgQEAgc3RydWN0IHR0bV9ib19kZXZpY2Ugewo+ID4gICBzdGF0aWMgaW5saW5lIHN0cnVj
dCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqdHRtX21hbmFnZXJfdHlwZShzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbnQgbWVtX3R5cGUpCj4gPiAgIHsKPiA+IC0gICAgIGlmIChiZGV2
LT5tYW5fZHJ2W21lbV90eXBlXSkKPiA+IC0gICAgICAgICAgICAgcmV0dXJuIGJkZXYtPm1hbl9k
cnZbbWVtX3R5cGVdOwo+ID4gLSAgICAgcmV0dXJuICZiZGV2LT5tYW5fcHJpdlttZW1fdHlwZV07
Cj4gPiArICAgICByZXR1cm4gYmRldi0+bWFuX2RydlttZW1fdHlwZV07Cj4gPiAgIH0KPiA+Cj4g
PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCB0dG1fc2V0X2RyaXZlcl9tYW5hZ2VyKHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2LAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
