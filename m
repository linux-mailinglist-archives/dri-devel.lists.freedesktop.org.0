Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C4C275C6F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 17:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811216E931;
	Wed, 23 Sep 2020 15:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A069B6E931
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:54:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so522748wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=e2wARfTPNXmqIszD8pnFm77jFgW+Vxuvl/Lx4CI2G8g=;
 b=ZqgLm6IIqgX8WLMm5k83BB3cpuv5qFTGsx3p2qytuPwonnkK8t5TZVD2pK7gqDqwAx
 jutfbs0py346JCTy01cuqvurA1fh717zLn5TJ+5UUpga5scPWphrpcEaxBp8FlUHFdZy
 eYCkS4/U/v6/olsf73jqHYj6uegerttazS5ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=e2wARfTPNXmqIszD8pnFm77jFgW+Vxuvl/Lx4CI2G8g=;
 b=rC1nYHXs3j2eb12LtVyK8XIzH/nLdbqS1ZelmDN4FD26RTQ4vtZeFON03dsjOu6sYi
 XJ30lAPvBjin9G0tg/xwQNUfCX8Jl0I61AmOqdomJjUijUQssQG79EvxiRvpfpSYhw5I
 gt1CrR7E1fglrw5eY/id17SsgYma0KmJWvWWUwTS7ZBQI88E4R0p/Y6dntvQ62KUPs5X
 N1UK5kD5wLKfCDg82hBQz9TrnadF3rMKGmNsHTRXjD/LPW8grnknehyz3Pnwc/1xzkVz
 i3eC/1Aj1x23+bguBfGMuo8fRQUrJyhIPFuInpCM8nOFVANU6tnmVFV3sZXx8H0zBgVY
 ZYKw==
X-Gm-Message-State: AOAM530mZ8NH12ltoBFPpgXqRn1Ec/9rgG3loLIsDJJoVRsSgP1B7Xo0
 ETIBbazUz2yWUixxRaVT4lSmtA==
X-Google-Smtp-Source: ABdhPJzR2zcW/VSCIgRPyurajQ5lKcKo6pv2l67qGPCfZu8qiocS3XfEOBe+KP8i9tucKgq9TAMfiA==
X-Received: by 2002:a1c:7918:: with SMTP id l24mr265417wme.46.1600876439335;
 Wed, 23 Sep 2020 08:53:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm275138wri.45.2020.09.23.08.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 08:53:58 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:53:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required for
 fb
Message-ID: <20200923155356.GX438822@phenom.ffwll.local>
References: <20200917164721.2038541-1-daniel.vetter@ffwll.ch>
 <CAP+8YyEqh4HRx7G5VefwEYTrLQthki7Zoxxx=g=EVYnz3dNDMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP+8YyEqh4HRx7G5VefwEYTrLQthki7Zoxxx=g=EVYnz3dNDMw@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Stone <daniels@collabora.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgMDc6MjQ6NThQTSArMDIwMCwgQmFzIE5pZXV3ZW5odWl6
ZW4gd3JvdGU6Cj4gQWNrZWQtYnk6IEJhcyBOaWV1d2VuaHVpemVuIDxiYXNAYmFzbmlldXdlbmh1
aXplbi5ubD4KPiAKPiBPbiBUaHUsIFNlcCAxNywgMjAyMCBhdCA2OjQ4IFBNIERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+ID4KPiA+IEV2ZW4gZm9yIGxlZ2Fj
eSB1c2Vyc3BhY2UsIHNpbmNlIG90aGVyd2lzZSBHRVRGQjIgaXMgYnJva2VuIGFuZCBpZiB5b3UK
PiA+IHN3aXRjaCBiZXR3ZWVuIG1vZGlmaWVyLWxlc3MgYW5kIG1vZGlmaWVyLWF3YXJlIGNvbXBv
c2l0b3JzLCBzbW9vdGgKPiA+IHRyYW5zaXRpb25zIGJyZWFrLgo+ID4KPiA+IEFsc28gaXQncyBq
dXN0IGJlc3QgcHJhY3RpY2UgdG8gbWFrZSBzdXJlIG1vZGlmaWVycyBhcmUgaW52YXJpYW50IGZv
cgo+ID4gYSBnaXZlbiBkcm1fZmIsIGFuZCB0aGF0IGEgbW9kaWZpZXItYXdhcmUga21zIGRyaXZl
cnMgb25seSBoYXMgb25lCj4gPiBwbGFjZSB0byBzdG9yZSB0aGVtLCBpZ25vcmluZyBhbnkgb2xk
IGltcGxpY2l0IGJvIGZsYWdzIG9yIHdoYXRldmVyCj4gPiBlbHNlIG1pZ2h0IGZsb2F0IGFyb3Vu
ZC4KPiA+Cj4gPiBNb3RpdmF0ZWQgYnkgc29tZSBpcmMgZGlzY3Vzc2lvbiB3aXRoIEJhcyBhYm91
dCBhbWRncHUgbW9kaWZpZXIKPiA+IHN1cHBvcnQuCj4gPgo+ID4gQWNrZWQtYnk6IFNpbW9uIFNl
ciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KPiA+IEFja2VkLWJ5OiBEYW5pZWwgU3RvbmUgPGRhbmll
bHNAY29sbGFib3JhLmNvbT4KPiA+IEFja2VkLWJ5OiBQZWtrYSBQYWFsYW5lbiA8cGVra2EucGFh
bGFuZW5AY29sbGFib3JhLmNvbT4KPiA+IEZpeGVzOiA0NTVlMDBmMTQxMmYgKCJkcm06IEFkZCBn
ZXRmYjIgaW9jdGwiKQo+ID4gQ2M6IERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bjb2xsYWJvcmEuY29t
Pgo+ID4gQ2M6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT4KPiA+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogQmFzIE5pZXV3ZW5odWl6ZW4g
PGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+ID4gQ2M6IE1hcmVrIE9sxaHDoWsgPG1hcmFlb0Bn
bWFpbC5jb20+Cj4gPiBDYzogIldlbnRsYW5kLCBIYXJyeSIgPGhhcnJ5LndlbnRsYW5kQGFtZC5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVs
LmNvbT4KClB1c2hlZCB0byBkcm0tbWlzYy1uZXh0LCB0aGFua3MgZm9yIGFsbCB0aGUgZmVlZGJh
Y2suCi1EYW5pZWwKCj4gPiAtLS0KPiA+IFNlbmRpbmcgdGhpcyBvdXQgYWdhaW4gdG8gZG91Ymxl
LWNoZWNrIHRoZXJlJ3Mgbm8gb2JqZWN0aW9ucyBvciBjb25jZXJucy4KPiA+IEZyb20gd2hhdCBJ
IHVuZGVyc3RhbmQgbG9va2luZyBhdCB0aGUgY29kZSB0aGUgbGF0ZXN0IG1vZGlmaWVyIHBhdGNo
ZXMgZm9yCj4gPiBhbWRncHUgZm9sbG93IHRoaXMgbm93Lgo+ID4KPiA+IENoZWVycywgRGFuaWVs
Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCB8IDEzICsrKysrKysr
KysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCBiL2luY2x1ZGUvZHJtL2RybV9t
b2RlX2NvbmZpZy5oCj4gPiBpbmRleCBhMThmNzNlYjNjZjYuLjVmZmJiNGVkNWIzNSAxMDA2NDQK
PiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oCj4gPiArKysgYi9pbmNsdWRl
L2RybS9kcm1fbW9kZV9jb25maWcuaAo+ID4gQEAgLTU4LDYgKzU4LDEyIEBAIHN0cnVjdCBkcm1f
bW9kZV9jb25maWdfZnVuY3Mgewo+ID4gICAgICAgICAgKiBhY3R1YWwgbW9kaWZpZXIgdXNlZCBp
ZiB0aGUgcmVxdWVzdCBkb2Vzbid0IGhhdmUgaXQgc3BlY2lmaWVkLAo+ID4gICAgICAgICAgKiBp
ZS4gd2hlbiAoQG1vZGVfY21kLT5mbGFncyAmIERSTV9NT0RFX0ZCX01PRElGSUVSUykgPT0gMC4K
PiA+ICAgICAgICAgICoKPiA+ICsgICAgICAgICogSU1QT1JUQU5UOiBUaGVzZSBpbXBsaWVkIG1v
ZGlmaWVycyBmb3IgbGVnYWN5IHVzZXJzcGFjZSBtdXN0IGJlCj4gPiArICAgICAgICAqIHN0b3Jl
ZCBpbiBzdHJ1Y3QgJmRybV9mcmFtZWJ1ZmZlciwgaW5jbHVkaW5nIGFsbCByZWxldmFudCBtZXRh
ZGF0YQo+ID4gKyAgICAgICAgKiBsaWtlICZkcm1fZnJhbWVidWZmZXIucGl0Y2hlcyBhbmQgJmRy
bV9mcmFtZWJ1ZmZlci5vZmZzZXRzIGlmIHRoZQo+ID4gKyAgICAgICAgKiBtb2RpZmllciBlbmFi
bGVzIGFkZGl0aW9uYWwgcGxhbmVzIGJleW9uZCB0aGUgZm91cmNjIHBpeGVsIGZvcm1hdAo+ID4g
KyAgICAgICAgKiBjb2RlLiBUaGlzIGlzIHJlcXVpcmVkIGJ5IHRoZSBHRVRGQjIgaW9jdGwuCj4g
PiArICAgICAgICAqCj4gPiAgICAgICAgICAqIElmIHRoZSBwYXJhbWV0ZXJzIGFyZSBkZWVtZWQg
dmFsaWQgYW5kIHRoZSBiYWNraW5nIHN0b3JhZ2Ugb2JqZWN0cyBpbgo+ID4gICAgICAgICAgKiB0
aGUgdW5kZXJseWluZyBtZW1vcnkgbWFuYWdlciBhbGwgZXhpc3QsIHRoZW4gdGhlIGRyaXZlciBh
bGxvY2F0ZXMKPiA+ICAgICAgICAgICogYSBuZXcgJmRybV9mcmFtZWJ1ZmZlciBzdHJ1Y3R1cmUs
IHN1YmNsYXNzZWQgdG8gY29udGFpbgo+ID4gQEAgLTkxNSw2ICs5MjEsMTMgQEAgc3RydWN0IGRy
bV9tb2RlX2NvbmZpZyB7Cj4gPiAgICAgICAgICAqIEBhbGxvd19mYl9tb2RpZmllcnM6Cj4gPiAg
ICAgICAgICAqCj4gPiAgICAgICAgICAqIFdoZXRoZXIgdGhlIGRyaXZlciBzdXBwb3J0cyBmYiBt
b2RpZmllcnMgaW4gdGhlIEFEREZCMi4xIGlvY3RsIGNhbGwuCj4gPiArICAgICAgICAqCj4gPiAr
ICAgICAgICAqIElNUE9SVEFOVDoKPiA+ICsgICAgICAgICoKPiA+ICsgICAgICAgICogSWYgdGhp
cyBpcyBzZXQgdGhlIGRyaXZlciBtdXN0IGZpbGwgb3V0IHRoZSBmdWxsIGltcGxpY2l0IG1vZGlm
aWVyCj4gPiArICAgICAgICAqIGluZm9ybWF0aW9uIGluIHRoZWlyICZkcm1fbW9kZV9jb25maWdf
ZnVuY3MuZmJfY3JlYXRlIGhvb2sgZm9yIGxlZ2FjeQo+ID4gKyAgICAgICAgKiB1c2Vyc3BhY2Ug
d2hpY2ggZG9lcyBub3Qgc2V0IG1vZGlmaWVycy4gT3RoZXJ3aXNlIHRoZSBHRVRGQjIgaW9jdGwg
aXMKPiA+ICsgICAgICAgICogYnJva2VuIGZvciBtb2RpZmllciBhd2FyZSB1c2Vyc3BhY2UuCj4g
PiAgICAgICAgICAqLwo+ID4gICAgICAgICBib29sIGFsbG93X2ZiX21vZGlmaWVyczsKPiA+Cj4g
PiAtLQo+ID4gMi4yOC4wCj4gPgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
