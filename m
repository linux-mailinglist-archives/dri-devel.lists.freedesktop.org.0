Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B8A68649
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 11:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63ECB89893;
	Mon, 15 Jul 2019 09:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0049789893;
 Mon, 15 Jul 2019 09:25:46 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id s22so11026186qkj.12;
 Mon, 15 Jul 2019 02:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rPkUhtxg4MFrjNr+Dr5xrJl5bg2MfLxjRYrMvZrd2ec=;
 b=o+KAnh5slmWcesFFbvlb/ZyTQDISg926/0SuSS2w3WCvfsUf3z+4BJieedKuDYImVC
 sXTR/SVbSFxc4DyN/aQLGsUncuJKx2fFcVdqWm4EkXxYOe1ZBc5Utzx4NUAA6Pos5/JH
 ZFYEO08VuRJLLv3z+TGGvZCccJwMoivKKmHZX/RAhd+7p9/oJL5DX29IqZ+Vk6vTV1wA
 VS5eeXHJ+07kc1tPZcKH4k8apCtAx0oRwrxIoqnJ5Nj2+ntW6EVS6w+ib2iIVSl54O8C
 Rg3u9MkKNoWTaQsOdWk3edddybEjT2qHQPP4tm2E8oBXNc4zw86S3Uf3WVrhBp2dIZXo
 gC2w==
X-Gm-Message-State: APjAAAVjf1rYgIcc2LF9FiR3ks4fYbWlgkOjqx0Zwl3KVaS4uwa/0qsx
 15YVJqP2vZZxJn/OUjLdS63WILN5VYm102YqUNk=
X-Google-Smtp-Source: APXvYqx2eckByQGU+dfHfehnNGjeOF0hufPzEc5ZbZv1szybdVE20KchvrVMo/4bumusNmT5/oravdpEMduU41KKuic=
X-Received: by 2002:a37:5f45:: with SMTP id t66mr15941069qkb.286.1563182746083; 
 Mon, 15 Jul 2019 02:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190704055217.45860-1-natechancellor@gmail.com>
 <20190704055217.45860-7-natechancellor@gmail.com>
In-Reply-To: <20190704055217.45860-7-natechancellor@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Jul 2019 11:25:29 +0200
Message-ID: <CAK8P3a1e4xKTZc1Fcd9KLwaGG_wpcAnSNu7mrB6zw+aBJ0e0CA@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/amd/powerplay: Use proper enums in
 vega20_print_clk_levels
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA3OjUyIEFNIE5hdGhhbiBDaGFuY2VsbG9yCjxuYXRlY2hh
bmNlbGxvckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gY2xhbmcgd2FybnM6Cj4KPiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jOjk5NTozOTogd2Fybmlu
ZzoKPiBpbXBsaWNpdCBjb252ZXJzaW9uIGZyb20gZW51bWVyYXRpb24gdHlwZSAnUFBDTEtfZScg
dG8gZGlmZmVyZW50Cj4gZW51bWVyYXRpb24gdHlwZSAnZW51bSBzbXVfY2xrX3R5cGUnIFstV2Vu
dW0tY29udmVyc2lvbl0KPiAgICAgICAgICAgICAgICAgcmV0ID0gc211X2dldF9jdXJyZW50X2Ns
a19mcmVxKHNtdSwgUFBDTEtfU09DQ0xLLCAmbm93KTsKPiAgICAgICAgICAgICAgICAgICAgICAg
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fgo+IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS92ZWdhMjBfcHB0LmM6MTAxNjozOTog
d2FybmluZzoKPiBpbXBsaWNpdCBjb252ZXJzaW9uIGZyb20gZW51bWVyYXRpb24gdHlwZSAnUFBD
TEtfZScgdG8gZGlmZmVyZW50Cj4gZW51bWVyYXRpb24gdHlwZSAnZW51bSBzbXVfY2xrX3R5cGUn
IFstV2VudW0tY29udmVyc2lvbl0KPiAgICAgICAgICAgICAgICAgcmV0ID0gc211X2dldF9jdXJy
ZW50X2Nsa19mcmVxKHNtdSwgUFBDTEtfRkNMSywgJm5vdyk7Cj4gICAgICAgICAgICAgICAgICAg
ICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+Cj4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYzoxMDMxOjM5
OiB3YXJuaW5nOgo+IGltcGxpY2l0IGNvbnZlcnNpb24gZnJvbSBlbnVtZXJhdGlvbiB0eXBlICdQ
UENMS19lJyB0byBkaWZmZXJlbnQKPiBlbnVtZXJhdGlvbiB0eXBlICdlbnVtIHNtdV9jbGtfdHlw
ZScgWy1XZW51bS1jb252ZXJzaW9uXQo+ICAgICAgICAgICAgICAgICByZXQgPSBzbXVfZ2V0X2N1
cnJlbnRfY2xrX2ZyZXEoc211LCBQUENMS19EQ0VGQ0xLLCAmbm93KTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+
fn4KPgo+IFRoZSB2YWx1ZXMgYXJlIG1hcHBlZCBvbmUgdG8gb25lIGluIHZlZ2EyMF9nZXRfc211
X2Nsa19pbmRleCBzbyBqdXN0IHVzZQo+IHRoZSBwcm9wZXIgZW51bXMgaGVyZS4KPgo+IEZpeGVz
OiAwOTY3NjEwMTQyMjcgKCJkcm0vYW1kL3Bvd2VycGxheTogc3VwcG9ydCBzeXNmcyB0byBnZXQg
c29jY2xrLCBmY2xrLCBkY2VmY2xrIikKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdC
dWlsdExpbnV4L2xpbnV4L2lzc3Vlcy81ODcKPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNl
bGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tPgo+IC0tLQoKQWRkaW5nIEtldmluIFdhbmcg
Zm9yIGZ1cnRoZXIgcmV2aWV3LCBhcyBoZSBzZW50IGEgcmVsYXRlZCBwYXRjaCBpbgpkMzY4OTMz
NjJkMjIgKCJkcm0vYW1kL3Bvd2VycGxheTogZml4IHNtdSBjbG9jayB0eXBlIGNoYW5nZSBtaXNz
IGVycm9yIikKCkkgYXNzdW1lIHRoaXMgb25lIGlzIHN0aWxsIHJlcXVpcmVkIGFzIGl0IHRyaWdn
ZXJzIHRoZSBzYW1lIHdhcm5pbmcuCktldmluLCBjYW4geW91IGhhdmUgYSBsb29rPwoKICAgICAg
QXJuZAoKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIHwgNiAr
KystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKPiBpbmRleCAw
ZjE0ZmUxNGVjZDguLmU2MmRkNjkxOWIyNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS92ZWdhMjBfcHB0LmMKPiBAQCAtOTkyLDcgKzk5Miw3IEBAIHN0YXRpYyBpbnQgdmVn
YTIwX3ByaW50X2Nsa19sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gICAgICAgICAg
ICAgICAgIGJyZWFrOwo+Cj4gICAgICAgICBjYXNlIFNNVV9TT0NDTEs6Cj4gLSAgICAgICAgICAg
ICAgIHJldCA9IHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcShzbXUsIFBQQ0xLX1NPQ0NMSywgJm5v
dyk7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcShzbXUs
IFNNVV9TT0NDTEssICZub3cpOwo+ICAgICAgICAgICAgICAgICBpZiAocmV0KSB7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgcHJfZXJyKCJBdHRlbXB0IHRvIGdldCBjdXJyZW50IHNvY2NsayBG
YWlsZWQhIik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiBAQCAtMTAx
Myw3ICsxMDEzLDcgQEAgc3RhdGljIGludCB2ZWdhMjBfcHJpbnRfY2xrX2xldmVscyhzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4KPiAgICAgICAgIGNh
c2UgU01VX0ZDTEs6Cj4gLSAgICAgICAgICAgICAgIHJldCA9IHNtdV9nZXRfY3VycmVudF9jbGtf
ZnJlcShzbXUsIFBQQ0xLX0ZDTEssICZub3cpOwo+ICsgICAgICAgICAgICAgICByZXQgPSBzbXVf
Z2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBTTVVfRkNMSywgJm5vdyk7Cj4gICAgICAgICAgICAg
ICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBwcl9lcnIoIkF0dGVtcHQg
dG8gZ2V0IGN1cnJlbnQgZmNsayBGYWlsZWQhIik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIHJldDsKPiBAQCAtMTAyOCw3ICsxMDI4LDcgQEAgc3RhdGljIGludCB2ZWdhMjBfcHJp
bnRfY2xrX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4KPiAgICAgICAgIGNhc2UgU01VX0RDRUZDTEs6Cj4gLSAgICAgICAgICAgICAgIHJl
dCA9IHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcShzbXUsIFBQQ0xLX0RDRUZDTEssICZub3cpOwo+
ICsgICAgICAgICAgICAgICByZXQgPSBzbXVfZ2V0X2N1cnJlbnRfY2xrX2ZyZXEoc211LCBTTVVf
RENFRkNMSywgJm5vdyk7Cj4gICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBwcl9lcnIoIkF0dGVtcHQgdG8gZ2V0IGN1cnJlbnQgZGNlZmNsayBGYWls
ZWQhIik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
