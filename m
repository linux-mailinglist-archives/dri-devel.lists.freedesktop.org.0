Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEE66AA2E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 16:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AED89E7B;
	Tue, 16 Jul 2019 14:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BB789E7B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 14:02:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y4so21116526wrm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 07:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z6WIjRctZtXUu2aVvxYap0a9R2n12Cco4aglJmpDaPw=;
 b=DFlE0Jv3lTOc7rpudEv0bWRetEScIgd1tluFMub52sSO+4KWGarXtfhSzoCfUR6amB
 Ho/NDcDMrkM61VIZfQQVj5JTF4Ka6bahvDC1T8DRXhPgeuEEizFf2g3tCq+D67eoOBsE
 +pylqZIYbAZhOvyn1EcLHBIhndB4D5W3byRp5kgXigpWFPb0SO2kXYMj+cGr3Gb/Vogy
 IubdOHwKRd3WZlsyh3bvWtsofrKg5RF/9Xd8YY1zvjavuhEu8/prhXyjBrg9noXOmZIC
 CLTucmrzvkdQwvTx/VQZK3yR1D4TAZ8WOyiSoD6aKvxu/ul3RoGkU+m+141ns9OCyr24
 Kf2Q==
X-Gm-Message-State: APjAAAUE5gNVInUcvXxicIDnit1CMYG5knNuvc9F31C2hs6hBSbsAn+v
 bQupVIQsZNU+aFRnbMXG+j4+UXchnT+CrSX48oo=
X-Google-Smtp-Source: APXvYqwSTYUiLfy0lkWoslx2bFLlDCmluQ6eX+OTLt7NXR+NKpU+dksyLHCFX5DNySQSaDc66l3nQZ02BrmA+vH9Wz0=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr35588195wrw.323.1563285728927; 
 Tue, 16 Jul 2019 07:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190716064220.18157-1-sam@ravnborg.org>
 <20190716064220.18157-8-sam@ravnborg.org>
In-Reply-To: <20190716064220.18157-8-sam@ravnborg.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Jul 2019 10:01:56 -0400
Message-ID: <CADnq5_PMDwV9_37HFMMmEOYWQzeP4b9qBjY0D6H9hyTrxQxtKg@mail.gmail.com>
Subject: Re: [PATCH v2 07/19] drm/r128: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=z6WIjRctZtXUu2aVvxYap0a9R2n12Cco4aglJmpDaPw=;
 b=u4r1Jrm48Qk3jEh/k41H7BX2vwPMtcDqhv2RIm6EK74oqAuXJSiSUU07lo8qABfpqr
 S5T840HoRNpQ8is/EnTy0B5EJoC4d4165KCfGSHXsSl9ZxctcvwMUu+53zbT+vqTs3DO
 51jsEFuqGrkVotnNpKpJSi3k2yLpxd+gt7ocC3jDInCWCcDgqLTd3+EH5Tkq72XlNCG/
 NGcMCYZv3e/vtTA+tyUcpzkfDeO7IiEi2+mjkShFLcP3Dl8j+efJAatLm+Z4YuGnPxnC
 6O0JXcmEYQtedxqdlTOwPAbdwkJlht5oNzE9jUkjdPbEepffiO5kUlylfyz2+jIaP2GG
 ErRw==
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
Cc: David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMjo0NCBBTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gUmVwbGFjZSB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhl
YWRlciBmaWxlCj4gd2l0aCByZWxldmFudCBpbmNsdWRlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBBY2tlZC1ieTogRW1pbCBWZWxpa292IDxl
bWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CgpSZXZpZXdlZC1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL3IxMjgvcjEyOF9pb2MzMi5jIHwgMyArKy0KPiAgZHJpdmVycy9ncHUvZHJt
L3IxMjgvcjEyOF9pcnEuYyAgIHwgNSArKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cjEyOC9yMTI4X2lvYzMyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2lvYzMyLmMKPiBp
bmRleCA2NTg5ZjllMDMxMGUuLjZhYzcxNzU1YzIyZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcjEyOC9yMTI4X2lvYzMyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4
X2lvYzMyLmMKPiBAQCAtMjksMTAgKzI5LDExIEBACj4gICAqIE9VVCBPRiBPUiBJTiBDT05ORUNU
SU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MKPiAgICog
SU4gVEhFIFNPRlRXQVJFLgo+ICAgKi8KPiArCj4gICNpbmNsdWRlIDxsaW51eC9jb21wYXQuaD4K
Pgo+IC0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KPiAgI2luY2x1ZGUgPGRybS9yMTI4X2RybS5oPgo+
ICsKPiAgI2luY2x1ZGUgInIxMjhfZHJ2LmgiCj4KPiAgdHlwZWRlZiBzdHJ1Y3QgZHJtX3IxMjhf
aW5pdDMyIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9pcnEuYyBi
L2RyaXZlcnMvZ3B1L2RybS9yMTI4L3IxMjhfaXJxLmMKPiBpbmRleCA5NzMwZjQ5MTg5NDQuLmQ4
NGU5Yzk2ZTIwYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcjEyOC9yMTI4X2lycS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3IxMjgvcjEyOF9pcnEuYwo+IEBAIC0zMCw4ICszMCwx
MSBAQAo+ICAgKiAgICBFcmljIEFuaG9sdCA8YW5ob2x0QEZyZWVCU0Qub3JnPgo+ICAgKi8KPgo+
IC0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+Cj4g
KyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5o
Pgo+ICAjaW5jbHVkZSA8ZHJtL3IxMjhfZHJtLmg+Cj4gKwo+ICAjaW5jbHVkZSAicjEyOF9kcnYu
aCIKPgo+ICB1MzIgcjEyOF9nZXRfdmJsYW5rX2NvdW50ZXIoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdW5zaWduZWQgaW50IHBpcGUpCj4gLS0KPiAyLjIwLjEKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
