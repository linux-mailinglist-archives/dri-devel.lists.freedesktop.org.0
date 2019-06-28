Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00845593A6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 07:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1006E84D;
	Fri, 28 Jun 2019 05:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073606E84D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 05:50:19 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id k13so2074143pgq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 22:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=xbpQAYAfjyjoMDDuLtpqjMT1F1sFH7826ZzTz/6Eg7M=;
 b=sA9KfaIJhddEKnPrIodOABOSd178VbVu4uqyEkjscU4x7S6wRmqPgy2do+cLWvIX2q
 N0YWBTzNP+disPP8kLfNvq9g3kTJHD6OmPQWpOqlwTWvD/YifNj0ifgfyvQSD3RQ59OJ
 7kanfJquWwVFviX7t7Bu9groQyjRWOU6eneMtx79XFXka1uD/3glGtLAovSknC/yQNTZ
 2Be+N5kdIhcySANNZwW4sU9WlokxVgV5PpUqXK4ln+A1gU3KO2gjHUQfscyjxYUK6YKJ
 DxYLKqoW7VblpZ0jBGEvyrqHG182GEhMj8umkQqIYAI9lYxC4/IrP6sGYYLFNiEoa1H/
 w1YQ==
X-Gm-Message-State: APjAAAVQE/7Dw8Uz1t3Ov+HA5W4JEeu/+GaPZ2MtGN7dmMZlg3EsZAJu
 gJDSF/bLCEGUumkSnTGoegSav0PE
X-Google-Smtp-Source: APXvYqzgw/8wuWG+WuTQBp4hYNRYShg5QTTEVCWWBpWSbXf28XwMbhz39DkDwz/PRD6nsFKyvtwKbw==
X-Received: by 2002:a17:90a:2706:: with SMTP id
 o6mr11134402pje.62.1561701018502; 
 Thu, 27 Jun 2019 22:50:18 -0700 (PDT)
Received: from PSXP216MB0662.KORP216.PROD.OUTLOOK.COM ([40.100.44.181])
 by smtp.gmail.com with ESMTPSA id o95sm902089pjb.4.2019.06.27.22.50.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 22:50:17 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] video: fbdev: s3c-fb: fix sparse warnings about using
 incorrect types
Thread-Topic: [PATCH] video: fbdev: s3c-fb: fix sparse warnings about using
 incorrect types
Thread-Index: ATVhYXAyfWPTBNepn2TaTOmvIy9arGI0M2NlvIaGNxM=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Fri, 28 Jun 2019 05:50:12 +0000
Message-ID: <PSXP216MB0662D369EFFABF260394F179AAFC0@PSXP216MB0662.KORP216.PROD.OUTLOOK.COM>
References: <CGME20190627125803eucas1p1eb6a37f5fa96fd732e41ab1501367de5@eucas1p1.samsung.com>
 <908fc26e-3bfa-c204-6c32-7d814fdcb37b@samsung.com>
In-Reply-To: <908fc26e-3bfa-c204-6c32-7d814fdcb37b@samsung.com>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=xbpQAYAfjyjoMDDuLtpqjMT1F1sFH7826ZzTz/6Eg7M=;
 b=Sfyw3tVO4AFVG/7BVg2T241CKDlF/1Zid8ewZ3ulAjc2WpWrCgHwG4uBsS1HbKUy1g
 jkGCkwVmb3i1Q9ZPnTLxoLNQYG/zGomGe4ffKDzoTgDPO0pCxcRZG34k3mO5BqgQuqTy
 ejNmP+i1GtpLDU7k5QMoigeAWRFcRz/BoVX+5l/gk+PrAJDlu0U0OLgfds+wEZvUWAl2
 uNE4iByyv9YlZa8I1t8AkmJ8Rf95Nn8TeybSrLYzrwuoNo+qXAHkzqLSnm8860jef/Mf
 WpSKcTGnHHdaHj3DYI1KL/ylKYiYXNbYyirWZ7uzKsxD0CNyczo4YKRpCS2KS/U3fv7x
 07wA==
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
Cc: Han Jingoo <jingoohan1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yNy8xOSwgOTo1OCBQTSwgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPiAK
PiBVc2UgLT5zY3JlZW5fYnVmZmVyIGluc3RlYWQgb2YgLT5zY3JlZW5fYmFzZSB0byBmaXggc3Bh
cnNlIHdhcm5pbmdzLgo+Cj4gWyBQbGVhc2Ugc2VlIGNvbW1pdCAxN2E3YjBiNGQ5NzQgKCJmYi5o
OiBQcm92aWRlIGFsdGVybmF0ZSBzY3JlZW5fYmFzZQo+ICAgcG9pbnRlciIpIGZvciBkZXRhaWxz
LiBdCj4KPiBSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4g
Q2M6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgoKQWNrZWQtYnk6IEppbmdvbyBI
YW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApKaW5nb28gSGFuCgo+IFNp
Z25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1z
dW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9mYmRldi9zM2MtZmIuYyB8ICAgMTIgKysr
KysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCj4KPiBJbmRleDogYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3MzYy1mYi5jCj4gPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvczNjLWZiLmMKPiArKysgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3MzYy1mYi5jCj4gQEAgLTExMDUsMTQgKzExMDUsMTQgQEAgc3RhdGljIGludCBz
M2NfZmJfYWxsb2NfbWVtb3J5KHN0cnVjdCBzMwo+ICAKPiAgCWRldl9kYmcoc2ZiLT5kZXYsICJ3
YW50ICV1IGJ5dGVzIGZvciB3aW5kb3dcbiIsIHNpemUpOwo+ICAKPiAtCWZiaS0+c2NyZWVuX2Jh
c2UgPSBkbWFfYWxsb2Nfd2Moc2ZiLT5kZXYsIHNpemUsICZtYXBfZG1hLCBHRlBfS0VSTkVMKTsK
PiAtCWlmICghZmJpLT5zY3JlZW5fYmFzZSkKPiArCWZiaS0+c2NyZWVuX2J1ZmZlciA9IGRtYV9h
bGxvY193YyhzZmItPmRldiwgc2l6ZSwgJm1hcF9kbWEsIEdGUF9LRVJORUwpOwo+ICsJaWYgKCFm
YmktPnNjcmVlbl9idWZmZXIpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+ICAJZGV2X2RiZyhz
ZmItPmRldiwgIm1hcHBlZCAleCB0byAlcFxuIiwKPiAtCQkodW5zaWduZWQgaW50KW1hcF9kbWEs
IGZiaS0+c2NyZWVuX2Jhc2UpOwo+ICsJCSh1bnNpZ25lZCBpbnQpbWFwX2RtYSwgZmJpLT5zY3Jl
ZW5fYnVmZmVyKTsKPiAgCj4gLQltZW1zZXQoZmJpLT5zY3JlZW5fYmFzZSwgMHgwLCBzaXplKTsK
PiArCW1lbXNldChmYmktPnNjcmVlbl9idWZmZXIsIDB4MCwgc2l6ZSk7Cj4gIAlmYmktPmZpeC5z
bWVtX3N0YXJ0ID0gbWFwX2RtYTsKPiAgCj4gIAlyZXR1cm4gMDsKPiBAQCAtMTEyOSw5ICsxMTI5
LDkgQEAgc3RhdGljIHZvaWQgczNjX2ZiX2ZyZWVfbWVtb3J5KHN0cnVjdCBzMwo+ICB7Cj4gIAlz
dHJ1Y3QgZmJfaW5mbyAqZmJpID0gd2luLT5mYmluZm87Cj4gIAo+IC0JaWYgKGZiaS0+c2NyZWVu
X2Jhc2UpCj4gKwlpZiAoZmJpLT5zY3JlZW5fYnVmZmVyKQo+ICAJCWRtYV9mcmVlX3djKHNmYi0+
ZGV2LCBQQUdFX0FMSUdOKGZiaS0+Zml4LnNtZW1fbGVuKSwKPiAtCQkgICAgICAgICAgICBmYmkt
PnNjcmVlbl9iYXNlLCBmYmktPmZpeC5zbWVtX3N0YXJ0KTsKPiArCQkJICAgIGZiaS0+c2NyZWVu
X2J1ZmZlciwgZmJpLT5maXguc21lbV9zdGFydCk7Cj4gIH0KPiAgCj4gIC8qKgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
