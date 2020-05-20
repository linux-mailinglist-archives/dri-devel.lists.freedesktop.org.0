Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6AD1DB6D6
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 16:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD4189DC7;
	Wed, 20 May 2020 14:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A49389DC7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 14:28:01 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id o8so797241vkd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 07:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v4r9BNjxZdfIwQpcjE+TERibQ9vNzZdHKAN9uSH05t4=;
 b=MjswhlVVUL6sX3ycAgLP5mNpg/bmnQ2mc7wMjTJrv910d1BxrwCDsmB8KVw3dbmyDB
 vODjy/TslGD7qLKBd04ZYud8cDLJje61DzuFLmj1c62uUJgVArmQVLGH7HmLXWEUqffj
 OopUpOKZGIj1iUwbC8F2W40iUTGWpco+OLVd1ooiTOnMUI+8Dbgre6PgCG8IB/VfOP7a
 SEfvYMZq+xH/fBbwhnr7BNNb2lfdqfI3oO7edd0WwSo8q8JMkbYw5ZpXd9mAGMdMO/2E
 Hcj6CMOtaLMuq6R9iQ+ihAJE7s+gK+ARY8W53ih2Rgu4EylSwz809i/8+6osQQAQGaDi
 i0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v4r9BNjxZdfIwQpcjE+TERibQ9vNzZdHKAN9uSH05t4=;
 b=ZlAnT01t3P1ZuPZsh1z+lF7LlSr+IY8xMcN/mPRm2nSiQINb2o2ybWtyQLzpZODosV
 LhF9T3TMvyTZTV8IH2XzNzEpuvUf06a9B0tUu9x+Ri5EhfpUfajKiELO1aOVlMN/T2EB
 sJAGzdhfgCyft1Lt23DayPWdkON8pDQDGcPAxLTvHdpjlKeEJkMbwC6XSjVoOi0yfMgs
 atLXUapxOVoRswv9i6gbOCt3FDiAYnJf3lFBj7HRe+Ac7C8Mb5ZzOf+sHfYg5Q9HFBMD
 n2/mxLc0FNIGU6l2N3gq+v9dzCEfu+3VkItV4qvPkCYWi6XDxhHTE3IzFU1hYXQZW8xf
 DASQ==
X-Gm-Message-State: AOAM533DhwIhXL3PS9yqyXPrS9msLKd490WuJvJEICFMoBPRVkckUudS
 35I7hlvdwvgdvfK4pm/SVt0Mk9gUI1y/9xy6+uEciTc1
X-Google-Smtp-Source: ABdhPJykRYiLxEkDDZKJ+ahRTCdI+mb2eakHV6Qfz3jKigSsxdwb1reqAzpB6Z5SCZzxO4eVMf8LVIZJOgZt9xuMDxs=
X-Received: by 2002:a1f:add0:: with SMTP id w199mr1436251vke.22.1589984880487; 
 Wed, 20 May 2020 07:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <CACvgo51fM1K2Fg=stC2_cz_pnJypi50Lu_OGs0utGH9QEMS3wQ@mail.gmail.com>
 <20200520142347.29060-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200520142347.29060-1-chris@chris-wilson.co.uk>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 20 May 2020 15:25:05 +0100
Message-ID: <CACvgo509GWuekwkW9Fc7TdmWyspqMMgD8FBUESt1L4KB5EyVgQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Restore the NULL check for drm_gem_object_put()
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Nirmoy Das <nirmoy.das@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMCBNYXkgMjAyMCBhdCAxNToyNCwgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gU29tZSB1c2VycyB3YW50IHRvIHBhc3MgTlVMTCB0byBk
cm1fZ2VtX29iamVjdF9wdXQoKSwgYnV0IHRob3NlIHVzaW5nCj4gX19kcm1fZ2VtX29iamVjdF9w
dXQoKSBkaWQgbm90LiBDb21wcm9taXNlLCBoYXZlIGJvdGggYW5kIGxldCB0aGUKPiBjb21waWxl
ciBzb3J0IGl0IG91dC4KPgo+IGRybV9nZW1fZmJfZGVzdHJveSgpIGNhbGxzIGRybV9nZW1fb2Jq
ZWN0X3B1dCgpIHdpdGggTlVMTCBvYmogY2F1c2luZzoKPiBbICAgMTEuNTg0MjA5XSBCVUc6IGtl
cm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UsIGFkZHJlc3M6IDAwMDAwMDAwMDAwMDAwMDAK
PiBbICAgMTEuNTg0MjEzXSAjUEY6IHN1cGVydmlzb3Igd3JpdGUgYWNjZXNzIGluIGtlcm5lbCBt
b2RlCj4gWyAgIDExLjU4NDIxNV0gI1BGOiBlcnJvcl9jb2RlKDB4MDAwMikgLSBub3QtcHJlc2Vu
dCBwYWdlCj4gWyAgIDExLjU4NDIxNl0gUEdEIDAgUDREIDAKPiBbICAgMTEuNTg0MjIwXSBPb3Bz
OiAwMDAyIFsjMV0gU01QIE5PUFRJCj4gWyAgIDExLjU4NDIyM10gQ1BVOiA3IFBJRDogMTU3MSBD
b21tOiBnbm9tZS1zaGVsbCBUYWludGVkOiBHICAgICAgICAgICAgRSAgICAgNS43LjAtcmMxLTEt
ZGVmYXVsdCsgIzI3Cj4gWyAgIDExLjU4NDIyNV0gSGFyZHdhcmUgbmFtZTogTWljcm8tU3RhciBJ
bnRlcm5hdGlvbmFsIENvLiwgTHRkLiBNUy03QTMxL1gzNzAgWFBPV0VSIEdBTUlORyBUSVRBTklV
TSAoTVMtN0EzMSksIEJJT1MgMS5NUiAxMi8wMy8yMDE5Cj4gWyAgIDExLjU4NDIzN10gUklQOiAw
MDEwOmRybV9nZW1fZmJfZGVzdHJveSsweDI4LzB4NzAgW2RybV9rbXNfaGVscGVyXQo+IDxzbmlw
Pgo+IFsgICAxMS41ODQyNTZdIENhbGwgVHJhY2U6Cj4gWyAgIDExLjU4NDI3OV0gIGRybV9tb2Rl
X3JtZmIrMHgxODkvMHgxYzAgW2RybV0KPiBbICAgMTEuNTg0Mjk5XSAgPyBkcm1fbW9kZV9ybWZi
KzB4MWMwLzB4MWMwIFtkcm1dCj4gWyAgIDExLjU4NDMxNF0gIGRybV9pb2N0bF9rZXJuZWwrMHhh
YS8weGYwIFtkcm1dCj4gWyAgIDExLjU4NDMyOV0gIGRybV9pb2N0bCsweDFmZi8weDNiMCBbZHJt
XQo+IFsgICAxMS41ODQzNDddICA/IGRybV9tb2RlX3JtZmIrMHgxYzAvMHgxYzAgW2RybV0KPiBb
ICAgMTEuNTg0NDIxXSAgYW1kZ3B1X2RybV9pb2N0bCsweDQ5LzB4ODAgW2FtZGdwdV0KPiBbICAg
MTEuNTg0NDI3XSAga3N5c19pb2N0bCsweDg3LzB4YzAKPiBbICAgMTEuNTg0NDMwXSAgX194NjRf
c3lzX2lvY3RsKzB4MTYvMHgyMAo+IFsgICAxMS41ODQ0MzRdICBkb19zeXNjYWxsXzY0KzB4NWYv
MHgyNDAKPiBbICAgMTEuNTg0NDM4XSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4
NDQvMHhhOQo+IFsgICAxMS41ODQ0NDBdIFJJUDogMDAzMzoweDdmMGVmODBmNzIyNwo+Cj4gUmVw
b3J0ZWQtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KPiBGaXhlczogYjVkMjUw
NzQ0Y2NjICgiZHJtL2dlbTogZm9sZCBkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQgYW5kIF9f
ZHJtX2dlbV9vYmplY3RfcHV0KCkiKQo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5j
b20+Cj4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gQ2M6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4uCj4gQWNrZWQtYnk6
IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBFbWlsIFZlbGlr
b3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKSSdtIGhhbGYgd2F5IHRocm91Z2ggY2hl
Y2tpbmcgdGhlIGNhbGxlcnMgYW5kIEkndmUgbm90aWNlZCBhIGhhbmRmdWwgb2YgYnVncy4KV2ls
bCBzZW5kIHRoZSBzZXJpZXMgaW4gZHVlIHRpbWUsIGFsdGhvdWdoIHlvdXIgcGF0Y2ggaXMgYSBw
ZXJmZWN0CmludGVybWVkaWF0ZSBzb2x1dGlvbi4KClRoYW5rIHlvdQpFbWlsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
