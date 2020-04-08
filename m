Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D260A1A23AE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 16:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A306EA7A;
	Wed,  8 Apr 2020 14:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191876EA76;
 Wed,  8 Apr 2020 14:00:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p10so7942000wrt.6;
 Wed, 08 Apr 2020 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wSW9Rg6e/x/RGGPb22/90O250IXy1NlfHB3scrBda8A=;
 b=RH/x8LjaFMBGVzFuW38+KmJAsAJ3rdnXDVghhySU2kc6KXnbru+RAla4Z+T8FecDV8
 C2V1MPSLLSq5XQbk30qPdEVPsGb2rJ9jElA7AbrVnoMvOUtxjkmIXYXkgHGu0lwVA6Rb
 bFBfzAk+ZhQx3SxG0KQ9MTdRNwHvOkdY7pODHSa1Sq6K8+j8MgNGnREWQy0uJIpc1lKr
 5CXr0kZa7ec/kfYLM1vaDrPbmhmCKNNithi6fKPBaIBj8AMGS+xrpee2VBUH/Wqoj2a5
 +iJMzm9DCfOJZmxKR/F4nwSGFyiMcFIggdfAVkBm3IH7MnOvSSwqPaFjlUA8q8Psu/OY
 OdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wSW9Rg6e/x/RGGPb22/90O250IXy1NlfHB3scrBda8A=;
 b=DOgOAFKBLW6RjNPuiCMKau20xe5GWQI8QaDSSavWx/Hx7q5NF+TdzGGBsdjKLEzevL
 2Hmn1PIdMCIU06BER5AH7hsJVe0McBgc5+8zna8yZAIC5a0t7JRX+MJMFGm30FkExC8X
 IAnomJh3nRkolYzRyJj7/OKfmTDgaWdrpE8fe5bI5AiOPs1Y3P3C/S2zJQwMB3jUJ90S
 +HfvUDsrtxPIYv8QxY47IOh+RH2mnR4n8DJJchP1T7FzSFKix4vvc28hM0+Ef4KJidx9
 G9UqQcits5Z6za/zco0vvQr1D083IUiNyGB8XD4tGuImqFtdXYdj7Tp+VQidakzoSBLW
 zSzQ==
X-Gm-Message-State: AGi0PuattHN1d+ntyNTzmW72iUBuyXZAvHGTGxFixarqxgclf5f8+W4c
 cQpUCC2dWR4T1XiyD+spJj3D624qXRaIpGDNns5DkA==
X-Google-Smtp-Source: APiQypIRxp4XUO0GKEduMN5R6TzsEVsvHb2tMo+wgNKSCzTUy+x+ueBDBEVo2JW5d4YPGlq/KRVDEGmvZIkAjT61f7A=
X-Received: by 2002:a5d:45d1:: with SMTP id b17mr8518576wrs.111.1586354439749; 
 Wed, 08 Apr 2020 07:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <1586250773-31519-1-git-send-email-ray.huang@amd.com>
 <58129925-9bc4-25bb-6f26-69e8362b4c9e@gmail.com>
In-Reply-To: <58129925-9bc4-25bb-6f26-69e8362b4c9e@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Apr 2020 10:00:28 -0400
Message-ID: <CADnq5_P8fFBj2R+owKoX+YEdgOExPMoRKrJUuhVBKroEtBW9Xw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/ttm: clean up ttm_trace_dma_map/ttm_trace_dma_unmap
 (v2)
To: Christian Koenig <christian.koenig@amd.com>
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
Cc: Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgNywgMjAyMCBhdCA1OjUwIEFNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEFtIDA3LjA0LjIwIHVtIDExOjEy
IHNjaHJpZWIgSHVhbmcgUnVpOgo+ID4gdHRtX3RyYWNlX2RtYV9tYXAvdHRtX3RyYWNlX2RtYV91
bm1hcCBpcyBuZXZlciB1c2VkIGFueW1vcmUuCj4gPgo+ID4gdjI6IHJlbW92ZSB0aGUgZmlsZSBj
b21wbGV0ZWx5Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1k
LmNvbT4KPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4KCkNhbiBvbmUgb2YgeW91IG1ha2Ugc3VyZSB0aGlzIGxhbmRzIGluIGRybS1t
aXNjPwoKVGhhbmtzLAoKQWxleAoKPiA+IC0tLQo+ID4gICBpbmNsdWRlL2RybS90dG0vdHRtX2Rl
YnVnLmggfCAzMSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzMSBkZWxldGlvbnMoLSkKPiA+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
ZHJtL3R0bS90dG1fZGVidWcuaAo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0v
dHRtX2RlYnVnLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2RlYnVnLmgKPiA+IGRlbGV0ZWQgZmls
ZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggYjVlNDYwZi4uMDAwMDAwMAo+ID4gLS0tIGEvaW5jbHVk
ZS9kcm0vdHRtL3R0bV9kZWJ1Zy5oCj4gPiArKysgL2Rldi9udWxsCj4gPiBAQCAtMSwzMSArMCww
IEBACj4gPiAtLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gPiAtICoKPiA+IC0gKiBDb3B5cmlnaHQgKGMp
IDIwMTcgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgo+ID4gLSAqIEFsbCBSaWdodHMgUmVz
ZXJ2ZWQuCj4gPiAtICoKPiA+IC0gKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVl
IG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQo+ID4gLSAqIGNvcHkgb2YgdGhp
cyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUKPiA+IC0g
KiAiU29mdHdhcmUiKSwgdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlv
biwgaW5jbHVkaW5nCj4gPiAtICogd2l0aG91dCBsaW1pdGF0aW9uIHRoZSByaWdodHMgdG8gdXNl
LCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLAo+ID4gLSAqIGRpc3RyaWJ1dGUsIHN1YiBs
aWNlbnNlLCBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8KPiA+IC0g
KiBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8g
c28sIHN1YmplY3QgdG8KPiA+IC0gKiB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6Cj4gPiAtICoK
PiA+IC0gKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5v
dGljZSAoaW5jbHVkaW5nIHRoZQo+ID4gLSAqIG5leHQgcGFyYWdyYXBoKSBzaGFsbCBiZSBpbmNs
dWRlZCBpbiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zCj4gPiAtICogb2YgdGhl
IFNvZnR3YXJlLgo+ID4gLSAqCj4gPiAtICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJ
UyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKPiA+IC0gKiBJTVBM
SUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNI
QU5UQUJJTElUWSwKPiA+IC0gKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQg
Tk9OLUlORlJJTkdFTUVOVC4gSU4gTk8gRVZFTlQgU0hBTEwKPiA+IC0gKiBUSEUgQ09QWVJJR0hU
IEhPTERFUlMsIEFVVEhPUlMgQU5EL09SIElUUyBTVVBQTElFUlMgQkUgTElBQkxFIEZPUiBBTlkg
Q0xBSU0sCj4gPiAtICogREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4g
QUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SCj4gPiAtICogT1RIRVJXSVNFLCBBUklTSU5HIEZS
T00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRQo+ID4g
LSAqIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCj4gPiAtICoKPiA+IC0g
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKiovCj4gPiAtLyoKPiA+IC0gKiBBdXRob3JzOiBUb20gU3QgRGVuaXMg
PHRvbS5zdGRlbmlzQGFtZC5jb20+Cj4gPiAtICovCj4gPiAtZXh0ZXJuIHZvaWQgdHRtX3RyYWNl
X2RtYV9tYXAoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgdHRtX2RtYV90dCAqdHQpOwo+ID4g
LWV4dGVybiB2b2lkIHR0bV90cmFjZV9kbWFfdW5tYXAoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgdHRtX2RtYV90dCAqdHQpOwo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
