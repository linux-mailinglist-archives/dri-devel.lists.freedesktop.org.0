Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D47A495
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 11:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE516E478;
	Tue, 30 Jul 2019 09:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CA46E478
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 09:37:20 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id k10so62414404qtq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 02:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2U2XELV6OQ7Q7usKr+BHGIyWi1o0ek672exBpyDXgPY=;
 b=rM/1DwOtUUiu52v5DbBYjzk80wTer9U172Ti9ls21n9eYuTEjJJHABy7Desxsqou7R
 A/Q5Equ/kjVWIJtFpeekeaEZanT57gTzfhWpgKs5/RGpEWsOGCqinbnpPGfzDu1fMenc
 2HrFLWRf0PrGD8qw8Q25obqs4GQKrlMEOjTJx7sjdGir6RIEHBqmCto91Nu952MJ76sj
 3oavmrOpcc+FX77PHGA51lkVJyL+rng8T6Mf+37U1rR0JnCB7B+H5gV5Kb3XK6+LDUJl
 MlYvdczArcitK4VwvsYYzIqnpTFJFCKuNvMCn5j1kF5XkLbL7LSYtyEG+IW43XAfqLKL
 /Gjg==
X-Gm-Message-State: APjAAAWINBZ7Bs4jFa+ng1pqDuBqlBugPK981FbhHyZoiDM0ivfq6+U/
 3cBnLwr0Av1u6t0R+UeP8hHomzD9DoaaPvL+BGqEIA==
X-Google-Smtp-Source: APXvYqw++xmk4Rm4JFPEbxhw5iuhrucLQNtXIKLxG9r03NlYXhGzckzRaIlD8ksq8xztS0T6so9iHAJ7x22JPWBQiLQ=
X-Received: by 2002:ac8:3364:: with SMTP id u33mr82742323qta.115.1564479439876; 
 Tue, 30 Jul 2019 02:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190729222752.GA20277@embeddedor>
In-Reply-To: <20190729222752.GA20277@embeddedor>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 30 Jul 2019 11:37:09 +0200
Message-ID: <CA+M3ks6mxV4PTWWj_0AuLcwj-SPWi85-VwXHx7iBbuo=kCPggg@mail.gmail.com>
Subject: Re: [PATCH] drm: sti: Mark expected switch fall-throughs
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2U2XELV6OQ7Q7usKr+BHGIyWi1o0ek672exBpyDXgPY=;
 b=QpvJLcejliU1b0iPLW/IKiK4O69hLE2vF90QgluyUk6DICdEnd2LBG93PM8PQBe/Vk
 IUqJlxtWwvYS6WZsKTqg/9Ge+5pcXxFUg1km6E0b3S8W66BCGquRsQvlS/DP3gSus1ku
 +Vh3Q+k38UJrLoAL18uuzM7GXmbkJLsLGmS63JpreJEPeBBPAt4BzQCB4dxTkzGTFjD6
 TzTmvsb8iQgFP6sD1sZ5Fm3f9R+Y2gbMFITXkC4cR3X/Fs6DqgHVJU2ooOZZSJs2phL4
 YeF5bmaPtiucrDm1XtYAMbpiVY1V5ZX1Dxmcs8+C+WUEaD2NYAJaost81g4p1ZlJnkoR
 2UkQ==
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
Cc: Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWFyLiAzMCBqdWlsLiAyMDE5IMOgIDAwOjI3LCBHdXN0YXZvIEEuIFIuIFNpbHZhCjxndXN0
YXZvQGVtYmVkZGVkb3IuY29tPiBhIMOpY3JpdCA6Cj4KPiBNYXJrIHN3aXRjaCBjYXNlcyB3aGVy
ZSB3ZSBhcmUgZXhwZWN0aW5nIHRvIGZhbGwgdGhyb3VnaC4KPgo+IFRoaXMgcGF0Y2ggZml4ZXMg
dGhlIGZvbGxvd2luZyB3YXJuaW5nIChCdWlsZGluZzogYXJtKToKPgo+IGRyaXZlcnMvZ3B1L2Ry
bS9zdGkvc3RpX2hkbWkuYzogSW4gZnVuY3Rpb24g4oCYaGRtaV9hdWRpb19jb25maWd1cmXigJk6
Cj4gZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jOjg1MToxMzogd2FybmluZzogdGhpcyBz
dGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAg
YXVkaW9fY2ZnIHw9IEhETUlfQVVEX0NGR19DSDc4X1ZBTElEOwo+IGRyaXZlcnMvZ3B1L2RybS9z
dGkvc3RpX2hkbWkuYzo4NTI6Mjogbm90ZTogaGVyZQo+ICAgY2FzZSA2Ogo+ICAgXn5+fgo+IGRy
aXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYzo4NTM6MTM6IHdhcm5pbmc6IHRoaXMgc3RhdGVt
ZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgIGF1ZGlv
X2NmZyB8PSBIRE1JX0FVRF9DRkdfQ0g1Nl9WQUxJRDsKPiBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0
aV9oZG1pLmM6ODU0OjI6IG5vdGU6IGhlcmUKPiAgIGNhc2UgNDoKPiAgIF5+fn4KPiBkcml2ZXJz
L2dwdS9kcm0vc3RpL3N0aV9oZG1pLmM6ODU1OjEzOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBt
YXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiAgICBhdWRpb19jZmcg
fD0gSERNSV9BVURfQ0ZHX0NIMzRfVkFMSUQgfCBIRE1JX0FVRF9DRkdfOENIOwo+IGRyaXZlcnMv
Z3B1L2RybS9zdGkvc3RpX2hkbWkuYzo4NTY6Mjogbm90ZTogaGVyZQo+ICAgY2FzZSAyOgo+ICAg
Xn5+fgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJl
ZGRlZG9yLmNvbT4KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dCwKClRoYW5rcywKCkJlbmphbWlu
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgfCAzICsrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3N0aS9zdGlfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jCj4gaW5k
ZXggZjAzZDYxN2VkYzRjLi4xNjE3YzUwOThhNTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3N0aS9zdGlfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5j
Cj4gQEAgLTg0OSwxMCArODQ5LDEzIEBAIHN0YXRpYyBpbnQgaGRtaV9hdWRpb19jb25maWd1cmUo
c3RydWN0IHN0aV9oZG1pICpoZG1pKQo+ICAgICAgICAgc3dpdGNoIChpbmZvLT5jaGFubmVscykg
ewo+ICAgICAgICAgY2FzZSA4Ogo+ICAgICAgICAgICAgICAgICBhdWRpb19jZmcgfD0gSERNSV9B
VURfQ0ZHX0NINzhfVkFMSUQ7Cj4gKyAgICAgICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwo+
ICAgICAgICAgY2FzZSA2Ogo+ICAgICAgICAgICAgICAgICBhdWRpb19jZmcgfD0gSERNSV9BVURf
Q0ZHX0NINTZfVkFMSUQ7Cj4gKyAgICAgICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwo+ICAg
ICAgICAgY2FzZSA0Ogo+ICAgICAgICAgICAgICAgICBhdWRpb19jZmcgfD0gSERNSV9BVURfQ0ZH
X0NIMzRfVkFMSUQgfCBIRE1JX0FVRF9DRkdfOENIOwo+ICsgICAgICAgICAgICAgICAvKiBmYWxs
IHRocm91Z2ggKi8KPiAgICAgICAgIGNhc2UgMjoKPiAgICAgICAgICAgICAgICAgYXVkaW9fY2Zn
IHw9IEhETUlfQVVEX0NGR19DSDEyX1ZBTElEOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAt
LQo+IDIuMjIuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
