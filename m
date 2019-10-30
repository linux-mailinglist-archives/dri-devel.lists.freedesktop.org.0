Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4175CEA463
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 20:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667136ED39;
	Wed, 30 Oct 2019 19:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC8E6ED39
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 19:46:07 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55F4620874
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 19:46:07 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id t8so4940078qtc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 12:46:07 -0700 (PDT)
X-Gm-Message-State: APjAAAUT65+c0jgilYuw6DIioHQuB/Dhjqx17GCovHfS+4Y7QjKOdvQU
 34HFA67FX8Cz/hFjCLW+jXdVSQg6DfGBh6dE7g==
X-Google-Smtp-Source: APXvYqxic3f001Nha/RhMfCOtzFI8fDko70ylSwSl6gpvXdK9mqHIinODFfyG01oXuvIZaa/AXaU/LnqPIuMaMy2mj0=
X-Received: by 2002:ac8:4791:: with SMTP id k17mr1942600qtq.136.1572464766470; 
 Wed, 30 Oct 2019 12:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191024114305.15581-1-linus.walleij@linaro.org>
 <20191025192054.GA7415@bogus>
 <CACRpkdZ67mC9m6inJSfbS0NqeThfJ0tUJQTP5stX3Kzw+zhEyQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ67mC9m6inJSfbS0NqeThfJ0tUJQTP5stX3Kzw+zhEyQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 30 Oct 2019 14:45:54 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_CWkJ74ztwVgiTj5X53428bo+fNF0SGZskxy+y8mnKw@mail.gmail.com>
Message-ID: <CAL_Jsq+_CWkJ74ztwVgiTj5X53428bo+fNF0SGZskxy+y8mnKw@mail.gmail.com>
Subject: Re: [PATCH 1/3 v4] drm/panel: Add generic DSI panel YAML bindings
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572464767;
 bh=3kozLOVSWQ+1SPUKhRlrVz+bPrn3URxGxEGCG6N7IfM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KsCuU4zLIVzVKKQWpUMTDNZc3PSGy271S734Mvz7p67jOCBtuMOk4RosBSXUmv2Uc
 Wajsk4y231FcmTgm862vCkskRnUZkBLGJzhbmCvnFNkd3cAHthsWI+8l2ALwDfm3oD
 i2HHufHViOP/QmPmleOHYOEQ/3cdwlyCziU/7Ywg=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgODo1MCBBTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgOToyMCBQ
TSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPgo+ID4gW01lXQo+ID4gPiAr
ICAgIGRzaS1jb250cm9sbGVyQDU1YWE1NWFhIHsKPiA+ID4gKyAgICAgIGNvbXBhdGlibGUgPSAi
YWNtZSxmb28iOwo+ID4KPiA+IEV2ZW50dWFsbHksIEkgd2FudCB0byBzdGFydCByZXBvcnRpbmcg
aWYgY29tcGF0aWJsZSBzdHJpbmdzIGFyZW4ndAo+ID4gZG9jdW1lbnRlZCAoaS5lLiBtYXRjaGVk
IHRvIGEgc2NoZW1hKS4gVGhpcyB3aWxsIGJyZWFrIHRoZW4uLi4KPgo+IE9LIEkgZHJvcCB0aGlz
Lgo+Cj4gPiA+ICsgICAgICByZWcgPSA8MHg1NWFhNTVhYT47Cj4gPgo+ID4gVGhpcyB3aWxsIGZh
aWwgYmVjYXVzZSBhIHNpemUgY2VsbCBpcyBleHBlY3RlZC4KPgo+IERvIHlvdSBtZWFuIGl0IHdp
bGwgZmFpbCB0aGUgZGF5IHdlIGFjdHVhbGx5IGNoZWNrIHJlZyBwcm9wZXJ0aWVzIHRvCj4gYmUg
cHJvcGVybHkgZm9ybWVkIHVuZGVyIHRoZSBjaXJjdW1zdGFuY2VzPwo+Cj4gQmVjYXVzZToKPiAg
IEhPU1RMRCAgc2NyaXB0cy9kdGMvZHRjCj4gICBDSEtEVCAgIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwKPiAgIENIS0RU
ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvZHNpLWNvbnRyb2xs
ZXIueWFtbAo+ICAgU0NIRU1BICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHJv
Y2Vzc2VkLXNjaGVtYS55YW1sCj4gKC4uLikKPgo+IEl0IHBhc3NlcyBqdXN0IGZpbmUuCgpZZXMs
IGJ1dCB0aGUgZXhhbXBsZXMgYXJlIGJ1aWx0IGFuZCB2YWxpZGF0ZWQgYWZ0ZXIgdGhpcy4gV2l0
aCB0aGUKb3RoZXIgZXJyb3JzIGN1cnJlbnRseSwgeW91J3JlIGVycm9yaW5nIG91dCBiZWZvcmUg
dGhpcyBoYXBwZW5zLgoKPiBJIGdldCBhIGJpdCBuZXJ2b3VzIHNpbmNlIHRoZSBzY2hlbWEgaXMg
YWxsIGFib3V0IGJlaW5nIHN0cmljdCBhYm91dAo+IHN0dWZmIHNvIEkgZ2V0IHRoZSBmZWVsaW5n
IHRoYXQgInNob3VsZCBoYXZlIGZhaWxlZCIuCgpJdCdzIGFjdHVhbGx5IGR0YyB0aGF0IHdpbGwg
Y29tcGxhaW4gaGVyZSBiZWNhdXNlIGl0J3MgYXdhcmUgb2YKIyotY2VsbHMgdmFsdWVzLiBDYW4n
dCBkbyB0aGF0IHdpdGggc2NoZW1hLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
