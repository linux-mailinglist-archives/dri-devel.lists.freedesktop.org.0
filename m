Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4BD1BC55A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 18:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676086E84D;
	Tue, 28 Apr 2020 16:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B206E84D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 16:37:52 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A494C20B80
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 16:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588091871;
 bh=Uoj0BjFq988E2mLhmcNcRR/H4Wi47KHjYkGY/1y8N1k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rPd+xC9fjkBMimGCmyES96/SSKnGhQt9LI0DwdlzEPnKu5+Rlskf57JyKAuOOXnpx
 5FsUAe5BAtykiTvEIcBRv3rBQJhd66yhN57zAp0f+R6nm67lyZ64f3ZZQoh4Es+7bE
 kajz13CkD7WmQTXJ67ZSmIID9M0W4BqqXRZWkp+M=
Received: by mail-ej1-f49.google.com with SMTP id n17so17745957ejh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 09:37:51 -0700 (PDT)
X-Gm-Message-State: AGi0PubwkpwgzIxo6Z8w8StUzDtynel030p8qYcXGZK3VNHuHqjU4jpZ
 nzZ5dQZ4nPtj/iedTKAVa4mpm65ZKqnS2z97kw==
X-Google-Smtp-Source: APiQypJjv9YpvCUB7C9FT396wARQtk3fMbL/djWYavK0MUAWkXioud021aPhjbo3X2S0bPMMCv25azvwtbxKAXhAqrs=
X-Received: by 2002:a17:907:2168:: with SMTP id
 rl8mr24379159ejb.360.1588091870050; 
 Tue, 28 Apr 2020 09:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
 <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
 <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
In-Reply-To: <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Apr 2020 00:37:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
Message-ID: <CAAOTY_9HQTiywgzGrefDHromhXtLPyWeYUyxFU8+h8sN_fo9xw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: "Anand K. Mistry" <amistry@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEFuYW5kLAoKQW5hbmQgSy4gTWlzdHJ5IDxhbWlzdHJ5QGNocm9taXVtLm9yZz4g5pa8IDIw
MjDlubQ05pyIMjjml6Ug6YCx5LqMIOS4iuWNiDk6NTTlr6vpgZPvvJoKPgo+IE9uIFN1biwgMjYg
QXByIDIwMjAgYXQgMTg6MDQsIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Cj4gPiBIaSwgQW5hbmQ6Cj4gPgo+ID4gQW5hbmQgSyBNaXN0cnkgPGFtaXN0
cnlAY2hyb21pdW0ub3JnPiDmlrwgMjAyMOW5tDTmnIgyMOaXpSDpgLHkuIAg5LiL5Y2IMjowOeWv
q+mBk++8mgo+ID4gPgo+ID4gPiBJZiBkbWFfbWFwX3NnKCkgbWVyZ2VzIHBhZ2VzIHdoZW4gY3Jl
YXRpbmcgdGhlIG1hcHBpbmcsIG9ubHkgdGhlIGZpcnN0Cj4gPiA+IGVudHJpZXMgd2lsbCBoYXZl
IGEgdmFsaWQgc2dfZG1hX2FkZHJlc3MoKSBhbmQgc2dfZG1hX2xlbigpLCBmb2xsb3dlZCBieQo+
ID4gPiBlbnRyaWVzIHdpdGggc2dfZG1hX2xlbigpID09IDAuCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEFuYW5kIEsgTWlzdHJ5IDxhbWlzdHJ5QGdvb2dsZS5jb20+Cj4gPiA+IC0tLQo+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgfCAzICsrKwo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4gPiBpbmRleCBiMDRhM2MyYjExMWUwOS4uZjhmZDhi
OThjMzBlM2QgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2dlbS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dl
bS5jCj4gPiA+IEBAIC0yMjQsNiArMjI0LDkgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICptdGtf
Z2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4gPgo+
ID4gPiAgICAgICAgIGV4cGVjdGVkID0gc2dfZG1hX2FkZHJlc3Moc2ctPnNnbCk7Cj4gPiA+ICAg
ICAgICAgZm9yX2VhY2hfc2coc2ctPnNnbCwgcywgc2ctPm5lbnRzLCBpKSB7Cj4gPiA+ICsgICAg
ICAgICAgICAgICBpZiAoIXNnX2RtYV9sZW4ocykpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ID4KPiA+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgJ2NvbnRpbnVlJwo+Cj4g
c2NhdHRlcmxpc3QuaCBoYXMgdGhlIGNvbW1lbnQ6Cj4gLyoKPiAgKiBUaGVzZSBtYWNyb3Mgc2hv
dWxkIGJlIHVzZWQgYWZ0ZXIgYSBkbWFfbWFwX3NnIGNhbGwgaGFzIGJlZW4gZG9uZQo+ICAqIHRv
IGdldCBidXMgYWRkcmVzc2VzIG9mIGVhY2ggb2YgdGhlIFNHIGVudHJpZXMgYW5kIHRoZWlyIGxl
bmd0aHMuCj4gICogWW91IHNob3VsZCBvbmx5IHdvcmsgd2l0aCB0aGUgbnVtYmVyIG9mIHNnIGVu
dHJpZXMgZG1hX21hcF9zZwo+ICAqIHJldHVybnMsIG9yIGFsdGVybmF0aXZlbHkgc3RvcCBvbiB0
aGUgZmlyc3Qgc2dfZG1hX2xlbihzZykgd2hpY2gKPiAgKiBpcyAwLgo+ICAqLwo+Cj4gU28gYnJl
YWtpbmcgb24gdGhlIGZpcnN0IHNnX2RtYV9sZW4oc2cpID09IDAgYXBwZWFycyB0byBiZSAob25l
IG9mKQo+IHRoZSBkb2N1bWVudGVkIGFwcHJvYWNoLgo+CgpPa2F5LCB5b3UncmUgcmlnaHQuIFNv
CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+
ID4KPiA+IFJlZ2FyZHMsCj4gPiBDaHVuLUt1YW5nLgo+ID4KPiA+ID4gKwo+ID4gPiAgICAgICAg
ICAgICAgICAgaWYgKHNnX2RtYV9hZGRyZXNzKHMpICE9IGV4cGVjdGVkKSB7Cj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigic2dfdGFibGUgaXMgbm90IGNvbnRpZ3VvdXMi
KTsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+ID4gLS0K
PiA+ID4gMi4yNi4xLjMwMS5nNTViYzNlYjdjYjktZ29vZwo+ID4gPgo+ID4gPgo+ID4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKPiA+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
