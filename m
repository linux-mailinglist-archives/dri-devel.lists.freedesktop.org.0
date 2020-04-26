Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE68C1B8DBF
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 10:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECEE6E297;
	Sun, 26 Apr 2020 08:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19286E297
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 08:04:06 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CE9F2084D
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 08:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587888246;
 bh=jphKvnWk7WVhKKU6EZqbG3syQ+XrF7hyrea1GwjpeqI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a+fJbN9EkjIpg0Jp8YBMe5XxSzh6wc36zDkMIUlYAVFDj4cmPDpLPnaYnJB1NL6dZ
 sgt8EiV/UkIQINtObub79LC4m+H6TAMe7GTo4XoSv3kpIO8xDzgGARpOY1jpcG66/h
 RuBonpceH2JmY61Gx2sMeN3BjOa/9iQhANdcu/mA=
Received: by mail-ed1-f47.google.com with SMTP id r16so11044374edw.5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 01:04:06 -0700 (PDT)
X-Gm-Message-State: AGi0PuayxsbYWUeU9fkBasG/+vjc+Uy1Gt3OUuRh6ltfjY3wyvAE3Z5S
 J7+y+zES4BhPPd5KroA7Z15OXL16pk3oP9qEPA==
X-Google-Smtp-Source: APiQypI41ZgtUmbcPsFD/aQIGzgLUAlW+VK1CXBcWhrzELEevx/EHxwq4GUoRPrYvidlr2de35GPe+5uokqoXF6ePxE=
X-Received: by 2002:a50:ea87:: with SMTP id d7mr8373594edo.48.1587888244933;
 Sun, 26 Apr 2020 01:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
In-Reply-To: <20200420060834.44461-1-amistry@google.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 26 Apr 2020 16:03:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
Message-ID: <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: Anand K Mistry <amistry@chromium.org>
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
Cc: Anand K Mistry <amistry@google.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEFuYW5kOgoKQW5hbmQgSyBNaXN0cnkgPGFtaXN0cnlAY2hyb21pdW0ub3JnPiDmlrwgMjAy
MOW5tDTmnIgyMOaXpSDpgLHkuIAg5LiL5Y2IMjowOeWvq+mBk++8mgo+Cj4gSWYgZG1hX21hcF9z
ZygpIG1lcmdlcyBwYWdlcyB3aGVuIGNyZWF0aW5nIHRoZSBtYXBwaW5nLCBvbmx5IHRoZSBmaXJz
dAo+IGVudHJpZXMgd2lsbCBoYXZlIGEgdmFsaWQgc2dfZG1hX2FkZHJlc3MoKSBhbmQgc2dfZG1h
X2xlbigpLCBmb2xsb3dlZCBieQo+IGVudHJpZXMgd2l0aCBzZ19kbWFfbGVuKCkgPT0gMC4KPgo+
IFNpZ25lZC1vZmYtYnk6IEFuYW5kIEsgTWlzdHJ5IDxhbWlzdHJ5QGdvb2dsZS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIHwgMyArKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZ2VtLmMKPiBpbmRleCBiMDRhM2MyYjExMWUwOS4uZjhmZDhiOThjMzBlM2QgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+IEBAIC0yMjQsNiArMjI0LDkg
QEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICptdGtfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+Cj4gICAgICAgICBleHBlY3RlZCA9IHNnX2RtYV9hZGRy
ZXNzKHNnLT5zZ2wpOwo+ICAgICAgICAgZm9yX2VhY2hfc2coc2ctPnNnbCwgcywgc2ctPm5lbnRz
LCBpKSB7Cj4gKyAgICAgICAgICAgICAgIGlmICghc2dfZG1hX2xlbihzKSkKPiArICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKCkkgdGhpbmsgdGhpcyBzaG91bGQgYmUgJ2NvbnRpbnVlJwoK
UmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKwo+ICAgICAgICAgICAgICAgICBpZiAoc2dfZG1hX2Fk
ZHJlc3MocykgIT0gZXhwZWN0ZWQpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fRVJS
T1IoInNnX3RhYmxlIGlzIG5vdCBjb250aWd1b3VzIik7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0ID0gLUVJTlZBTDsKPiAtLQo+IDIuMjYuMS4zMDEuZzU1YmMzZWI3Y2I5LWdvb2cKPgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
