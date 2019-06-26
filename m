Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C595B56E89
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 18:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5C96E49A;
	Wed, 26 Jun 2019 16:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB6B6E49A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 16:16:16 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k21so4119109edq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 09:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=lF6v0IWJ/meV6jMdQrTEV8UKmUJTABenSJ/qMYoG38U=;
 b=AdqYHZg6z4GvtA25SvHC/HEr+DkXeBoEXa6c/HOsue1xF+QilfMpmxRJFSy58NTq9Z
 +6C58uwqiNNpNM5IKNKl2D/Ds/l4aO6MhikDASYcOuTfzpHUXPpUwDY8NIj7bB61akHT
 hO9avdt1beVrkL/wkh5wMss/mPdOZ3HYfeWByQ5aI5WO5zeGV3arY+1A5DH9suPP5jnv
 sARwmsCJk0W1wevXp9vN7GiPAyRf2zXuei74B834IBDZVH5sfDJP2U8V6QsIT3pcOyxK
 x/vfITpt4wCgSmxTSa4TBYHevK3sWCsgZiQoyt9+s9gaCO59Gg/Jk0Xf1Jv91P/k846E
 G3wQ==
X-Gm-Message-State: APjAAAV/cthtnQh+vhiKlD92xcEw8jJhugtGZqlz/F8kaOrAPNcKThuV
 MUP2tjpIcm7vlat60eLX8iamNw==
X-Google-Smtp-Source: APXvYqyePUpHxh/ltcY4LJZQK+1XHArMzcRsG8OJv07lLh+s2834/Tlhgyx+rSibQ8RA9ZDXeh+s9g==
X-Received: by 2002:a50:8828:: with SMTP id b37mr6452459edb.266.1561565775508; 
 Wed, 26 Jun 2019 09:16:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id c16sm5988825edc.58.2019.06.26.09.16.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 09:16:14 -0700 (PDT)
Date: Wed, 26 Jun 2019 18:16:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <Kenny.Ho@amd.com>
Subject: Re: [RFC PATCH v3 08/11] drm, cgroup: Add TTM buffer peak usage stats
Message-ID: <20190626161612.GT12905@phenom.ffwll.local>
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-9-Kenny.Ho@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626150522.11618-9-Kenny.Ho@amd.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lF6v0IWJ/meV6jMdQrTEV8UKmUJTABenSJ/qMYoG38U=;
 b=Gts3vRBWisopLQjynefMBig4B3OAbdINOM9VFgw3mm1kkZBwjhAcPz673NP0shl2Fr
 9PumjMR1KOdECTssPoixU8CQu+/2N50HNjAIaPFA9382AcMfJjAT66lNwE1ON1hJhjwA
 kx6Ax1OlbVdlnJ6cBNThKfr2YIIOLE3NtQhys=
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
Cc: jsparks@cray.com, amd-gfx@lists.freedesktop.org, lkaplan@cray.com,
 alexander.deucher@amd.com, y2kenny@gmail.com, dri-devel@lists.freedesktop.org,
 joseph.greathouse@amd.com, tj@kernel.org, cgroups@vger.kernel.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTE6MDU6MTlBTSAtMDQwMCwgS2VubnkgSG8gd3JvdGU6
Cj4gZHJtLm1lbW9yeS5wZWFrLnN0YXRzCj4gICAgICAgICBBIHJlYWQtb25seSBuZXN0ZWQta2V5
ZWQgZmlsZSB3aGljaCBleGlzdHMgb24gYWxsIGNncm91cHMuCj4gICAgICAgICBFYWNoIGVudHJ5
IGlzIGtleWVkIGJ5IHRoZSBkcm0gZGV2aWNlJ3MgbWFqb3I6bWlub3IuICBUaGUKPiAgICAgICAg
IGZvbGxvd2luZyBuZXN0ZWQga2V5cyBhcmUgZGVmaW5lZC4KPiAKPiAgICAgICAgICAgPT09PT09
ICAgICAgICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+
ICAgICAgICAgICBzeXN0ZW0gICAgICAgICBQZWFrIGhvc3QgbWVtb3J5IHVzZWQKPiAgICAgICAg
ICAgdHQgICAgICAgICAgICAgUGVhayBob3N0IG1lbW9yeSB1c2VkIGJ5IHRoZSBkZXZpY2UgKEdU
VC9HQVJUKQo+ICAgICAgICAgICB2cmFtICAgICAgICAgICBQZWFrIFZpZGVvIFJBTSB1c2VkIGJ5
IHRoZSBkcm0gZGV2aWNlCj4gICAgICAgICAgIHByaXYgICAgICAgICAgIE90aGVyIGRybSBkZXZp
Y2Ugc3BlY2lmaWMgbWVtb3J5IHBlYWsgdXNhZ2UKPiAgICAgICAgICAgPT09PT09ICAgICAgICAg
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IAo+ICAgICAg
ICAgUmVhZGluZyByZXR1cm5zIHRoZSBmb2xsb3dpbmc6Ogo+IAo+ICAgICAgICAgMjI2OjAgc3lz
dGVtPTAgdHQ9MCB2cmFtPTAgcHJpdj0wCj4gICAgICAgICAyMjY6MSBzeXN0ZW09MCB0dD05MDM1
Nzc2IHZyYW09MTc3Njg0NDggcHJpdj0xNjgwOTk4NAo+ICAgICAgICAgMjI2OjIgc3lzdGVtPTAg
dHQ9OTAzNTc3NiB2cmFtPTE3NzY4NDQ4IHByaXY9MTY4MDk5ODQKPiAKPiBDaGFuZ2UtSWQ6IEk5
ODZlNDQ1MzM4NDhmNjY0MTE0NjViZGQ1MjEwNWU3ODEwNWE3MDlhCj4gU2lnbmVkLW9mZi1ieTog
S2VubnkgSG8gPEtlbm55LkhvQGFtZC5jb20+CgpTYW1lIGNvbmNlcm5zIGFzIHdpdGggdGhlIHBy
ZXZpb3VzIHBhdGNoLCBhIGJpdCB0b28gbXVjaCB0dG0gaW4gaGVyZS4KT3RoZXJ3aXNlIGxvb2tz
IGxpa2UgdXNlZnVsIGluZm9ybWF0aW9uLCBhbmQgd29udCBuZWVkIGRyaXZlciBjaGFuZ2VzCmFu
eXdoZXJlLgotRGFuaWVsCgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaCB8ICAx
ICsKPiAga2VybmVsL2Nncm91cC9kcm0uYyAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysr
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmggYi9pbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaAo+
IGluZGV4IDE0MWJlYTA2Zjc0Yy4uOTIyNTI5NjQxZGY1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvY2dyb3VwX2RybS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgKPiBA
QCAtMjUsNiArMjUsNyBAQCBzdHJ1Y3QgZHJtY2dycF9kZXZpY2VfcmVzb3VyY2Ugewo+ICAJczY0
CQkJYm9fc3RhdHNfY291bnRfYWxsb2NhdGVkOwo+ICAKPiAgCXM2NAkJCW1lbV9zdGF0c1tUVE1f
UExfUFJJVisxXTsKPiArCXM2NAkJCW1lbV9wZWFrc1tUVE1fUExfUFJJVisxXTsKPiAgCXM2NAkJ
CW1lbV9zdGF0c19ldmljdDsKPiAgfTsKPiAgCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9jZ3JvdXAv
ZHJtLmMgYi9rZXJuZWwvY2dyb3VwL2RybS5jCj4gaW5kZXggNWFlZTQyYTYyOGMxLi41ZjVmYTZh
MmIwNjggMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2Nncm91cC9kcm0uYwo+ICsrKyBiL2tlcm5lbC9j
Z3JvdXAvZHJtLmMKPiBAQCAtMzgsNiArMzgsNyBAQCBlbnVtIGRybWNncnBfcmVzX3R5cGUgewo+
ICAJRFJNQ0dSUF9UWVBFX0JPX0NPVU5ULAo+ICAJRFJNQ0dSUF9UWVBFX01FTSwKPiAgCURSTUNH
UlBfVFlQRV9NRU1fRVZJQ1QsCj4gKwlEUk1DR1JQX1RZUEVfTUVNX1BFQUssCj4gIH07Cj4gIAo+
ICBlbnVtIGRybWNncnBfZmlsZV90eXBlIHsKPiBAQCAtMTcxLDYgKzE3MiwxMyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgZHJtY2dycF9wcmludF9zdGF0cyhzdHJ1Y3QgZHJtY2dycF9kZXZpY2VfcmVz
b3VyY2UgKmRkciwKPiAgCWNhc2UgRFJNQ0dSUF9UWVBFX01FTV9FVklDVDoKPiAgCQlzZXFfcHJp
bnRmKHNmLCAiJWxsZFxuIiwgZGRyLT5tZW1fc3RhdHNfZXZpY3QpOwo+ICAJCWJyZWFrOwo+ICsJ
Y2FzZSBEUk1DR1JQX1RZUEVfTUVNX1BFQUs6Cj4gKwkJZm9yIChpID0gMDsgaSA8PSBUVE1fUExf
UFJJVjsgaSsrKSB7Cj4gKwkJCXNlcV9wcmludGYoc2YsICIlcz0lbGxkICIsIHR0bV9wbGFjZW1l
bnRfbmFtZXNbaV0sCj4gKwkJCQkJZGRyLT5tZW1fcGVha3NbaV0pOwo+ICsJCX0KPiArCQlzZXFf
cHV0cyhzZiwgIlxuIik7Cj4gKwkJYnJlYWs7Cj4gIAlkZWZhdWx0Ogo+ICAJCXNlcV9wdXRzKHNm
LCAiXG4iKTsKPiAgCQlicmVhazsKPiBAQCAtNDQwLDYgKzQ0OCwxMiBAQCBzdHJ1Y3QgY2Z0eXBl
IGZpbGVzW10gPSB7Cj4gIAkJLnByaXZhdGUgPSBEUk1DR19DVEZfUFJJVihEUk1DR1JQX1RZUEVf
TUVNX0VWSUNULAo+ICAJCQkJCQlEUk1DR1JQX0ZUWVBFX1NUQVRTKSwKPiAgCX0sCj4gKwl7Cj4g
KwkJLm5hbWUgPSAibWVtb3J5LnBlYWtzLnN0YXRzIiwKPiArCQkuc2VxX3Nob3cgPSBkcm1jZ3Jw
X2JvX3Nob3csCj4gKwkJLnByaXZhdGUgPSBEUk1DR19DVEZfUFJJVihEUk1DR1JQX1RZUEVfTUVN
X1BFQUssCj4gKwkJCQkJCURSTUNHUlBfRlRZUEVfU1RBVFMpLAo+ICsJfSwKPiAgCXsgfQkvKiB0
ZXJtaW5hdGUgKi8KPiAgfTsKPiAgCj4gQEAgLTYwOCw2ICs2MjIsOCBAQCB2b2lkIGRybWNncnBf
Y2hnX21lbShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnRibykKPiAgCWZvciAoIDsgZHJtY2dy
cCAhPSBOVUxMOyBkcm1jZ3JwID0gcGFyZW50X2RybWNncnAoZHJtY2dycCkpIHsKPiAgCQlkZHIg
PSBkcm1jZ3JwLT5kZXZfcmVzb3VyY2VzW2RldklkeF07Cj4gIAkJZGRyLT5tZW1fc3RhdHNbbWVt
X3R5cGVdICs9IHNpemU7Cj4gKwkJZGRyLT5tZW1fcGVha3NbbWVtX3R5cGVdID0gbWF4KGRkci0+
bWVtX3BlYWtzW21lbV90eXBlXSwKPiArCQkJCWRkci0+bWVtX3N0YXRzW21lbV90eXBlXSk7Cj4g
IAl9Cj4gIAltdXRleF91bmxvY2soJmtub3duX2RybWNncnBfZGV2c1tkZXZJZHhdLT5tdXRleCk7
Cj4gIH0KPiBAQCAtNjYyLDYgKzY3OCwxMCBAQCB2b2lkIGRybWNncnBfbWVtX3RyYWNrX21vdmUo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpvbGRfYm8sIGJvb2wgZXZpY3QsCj4gIAkJZGRyLT5t
ZW1fc3RhdHNbb2xkX21lbV90eXBlXSAtPSBtb3ZlX2luX2J5dGVzOwo+ICAJCWRkci0+bWVtX3N0
YXRzW25ld19tZW1fdHlwZV0gKz0gbW92ZV9pbl9ieXRlczsKPiAgCj4gKwkJZGRyLT5tZW1fcGVh
a3NbbmV3X21lbV90eXBlXSA9IG1heCgKPiArCQkJCWRkci0+bWVtX3BlYWtzW25ld19tZW1fdHlw
ZV0sCj4gKwkJCQlkZHItPm1lbV9zdGF0c1tuZXdfbWVtX3R5cGVdKTsKPiArCj4gIAkJaWYgKGV2
aWN0KQo+ICAJCQlkZHItPm1lbV9zdGF0c19ldmljdCsrOwo+ICAJfQo+IC0tIAo+IDIuMjEuMAo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
