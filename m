Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6896E2DF2C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 16:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052C86E29D;
	Wed, 29 May 2019 14:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2B96E29D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 14:06:08 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r15so2167106lfm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 07:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jVklta3j//5LB66B3eG0hw8d1+X66hsT6giTfWImK0o=;
 b=i+ogKZp3mkxIiRyDrraksXzC4n2XpMfFCPsI1WRBPmOhnJ/WLvCsKumJQUtQrlcvsl
 Fa5H9DLD7OxI7t8pUQIUqZZd5ej/FQsKqd3qlKW/y+qxpzP19ucPCDkHjwOTjRXYyr/i
 JJMdQlNT7X1no5Fqx0J7YwCQ857pHTHwMqkwkNnyDnryakjrMOkF+SCC8UF1sRCa9Zh8
 26bFpopYVou2LODXF6NL+8OnW14wqWANRXJFUU38g9vOaC9d95eyWlDOIQ0EzVSjZrQm
 OrHKJJ4YC4UBxZxwg/QBJr7NLp42C0X5KPMUhBj9HDryEbs8gFF/rRHpbn2lSDuUge9G
 rnRw==
X-Gm-Message-State: APjAAAWEvsPSu3e0p/XvMj0eSFw79rESf5yFhdRZfajXpJu19jZlh8/p
 SPJF26GJa7GOQX/3yNQ4Ufi9gZJJf+HB6NEonccfRGBLdwk=
X-Google-Smtp-Source: APXvYqzrAe4NL1EQUoypcO7GL5iJ6QAM67pfo+hH5Ytn/mFSYAZZslif03A9qasGsKJtUQBGIwS410/aariEmwO1/bw=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr13174649lfh.92.1559138766312; 
 Wed, 29 May 2019 07:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190529113231.GF19119@mwanda>
In-Reply-To: <20190529113231.GF19119@mwanda>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 May 2019 16:05:53 +0200
Message-ID: <CACRpkdbDTzTcZEXURHsvHpByZX2df_ADeD13pPzYfBgNFuurhg@mail.gmail.com>
Subject: Re: [bug report] drm/mcde: Add new driver for ST-Ericsson MCDE
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=jVklta3j//5LB66B3eG0hw8d1+X66hsT6giTfWImK0o=;
 b=FJEk1rxGqndNaMXSDMXTv02SQM6tv/BUhxzsFBGUw+ZrBiKKSDWrzkfO41fPTOQ7XW
 lhMlO1Ir3C/estujgY3orcz1TCAth/silg059D8jqtl2dPHAVeUWCKyt/P+I+WlQmynM
 i9gg2EMlwVThwxvi440CHSPVyu5DoEmV1mc0oEQX9sMaGmtR19iw0p9h02NWudASYQIm
 SXqATyLl83CXlbUOQ1nIZxCmZU7SC6jtGq4amB2h7zlbQmGwMDejfLhIu+vlDMwHSATE
 ynJbmbPENgIkJe0PgaXaNKzO936QJMWjmDlw+31ziNsm4chAXG7HHuwGouFfK3+GQu7j
 mY1Q==
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTozMiBQTSBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOgoKPiAgICAgICAgIGRyaXZlcnMvZ3B1L2RybS9tY2RlL21j
ZGVfZHJ2LmM6NDg4IG1jZGVfcHJvYmUoKQo+ICAgICAgICAgZXJyb3I6IHVuaW5pdGlhbGl6ZWQg
c3ltYm9sICdtYXRjaCcuCiguLi4pCj4gICAgNDgwICAgICAgICAgICAgICAgICAgd2hpbGUgKChk
ID0gYnVzX2ZpbmRfZGV2aWNlKCZwbGF0Zm9ybV9idXNfdHlwZSwgcCwgZHJ2LAo+ICAgIDQ4MSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKXBsYXRm
b3JtX2J1c190eXBlLm1hdGNoKSkpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgo+IFRo
ZSBjb25jZXJuIHdvdWxkIGJlIHRoYXQgdGhpcyBjb25kaW50aW9uIGlzIG5ldmVyIG1ldC4gIEkg
c3VzcGV0IHRoYXQncwo+IG5vdCBwb3NzaWJsZT8KCkNvbXBvbmVudCBkcml2ZXJzIGhhdmUgdGhp
cyBwcm9wZXJ0eSwgdGhleSByZWx5IG9uIHRoZSBzdWJjb21wb25lbnRzIHRvCmJlIHRoZXJlIGZv
ciB0aGUgZnVuY3Rpb25hbCB3aG9sZSB0byB3b3JrLiBJZiBpdCdzIG5vdCwgYWxsIGhlbGwgYnJl
YWsgbG9vc2UgaW4KZGlmZmVyZW50IHdheXMuIFNvIGF0IGxlYXN0IG9uZSBzdWJjb21wb25lbnQg
KERTSSBpbiB0aGlzIGNhc2UpIG5lZWRzCnRvIGJlIGZvdW5kLgoKQnV0IGl0J3MgZmluZSB0byBp
bml0aWFsaXplIG1hdGNoIHRvIE5VTEwgaWYgaXQgbWFrZXMgdGhlIHN0YXRpYyBjaGVja3MKaGFw
cGllciEKCkJ1dCB0aGF0IGp1c3QgbWFza3MgdGhlIGRlZXBlciBwcm9ibGVtLCB3aGljaCBJIGZv
dW5kIGluIHRoZSBxY29tCmRyaXZlcjogY29tcG9uZW50X21hc3Rlcl9hZGRfd2l0aF9tYXRjaCgp
IGNhbiBiZSBjYWxsZWQKd2l0aCBtYXRjaCBzZXQgdG8gTlVMTCwgd2hpY2ggaXQgYWN0dWFsbHkg
Y2Fubm90IGhhbmRsZS4KVGhpcyBpcyBhIGdlbmVyaWMgcHJvYmxlbSBpbiBEUk0gYW5kIG5lZWRz
IHRvIGJlIGZpeGVkIGV2ZXJ5d2hlcmUuCgpJIG1hZGUgYSBwYXRjaCBsaWtlIHRoaXM6CgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tY2RlL21jZGVfZHJ2LmMKaW5kZXggYmFmNjNmYjY4NTBhLi5iYzExYzQ0NmU1OTQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21jZGUvbWNkZV9kcnYuYwpAQCAtMzE5LDcgKzMxOSw3IEBAIHN0YXRpYyBpbnQgbWNkZV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogICAgICAgIHN0cnVjdCBkZXZpY2Ug
KmRldiA9ICZwZGV2LT5kZXY7CiAgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybTsKICAgICAg
ICBzdHJ1Y3QgbWNkZSAqbWNkZTsKLSAgICAgICBzdHJ1Y3QgY29tcG9uZW50X21hdGNoICptYXRj
aDsKKyAgICAgICBzdHJ1Y3QgY29tcG9uZW50X21hdGNoICptYXRjaCA9IE5VTEw7CiAgICAgICAg
c3RydWN0IHJlc291cmNlICpyZXM7CiAgICAgICAgdTMyIHBpZDsKICAgICAgICB1MzIgdmFsOwpA
QCAtNDg1LDcgKzQ4NSw3IEBAIHN0YXRpYyBpbnQgbWNkZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgcHV0X2Rldmlj
ZShwKTsKICAgICAgICB9Ci0gICAgICAgaWYgKElTX0VSUihtYXRjaCkpIHsKKyAgICAgICBpZiAo
SVNfRVJSX09SX05VTEwobWF0Y2gpKSB7CiAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImNv
dWxkIG5vdCBjcmVhdGUgY29tcG9uZW50IG1hdGNoXG4iKTsKICAgICAgICAgICAgICAgIHJldCA9
IFBUUl9FUlIobWF0Y2gpOwogICAgICAgICAgICAgICAgZ290byBjbGtfZGlzYWJsZTsKCkJ1dCBJ
IG5lZWQgdG8gdGVzdCB0aGF0IG9uIHJlYWwgaGFyZHdhcmUgYmVmb3JlIEkgc3VibWl0IGl0LgoK
VGhhbmtzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
