Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F419E55C
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 16:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402F36E143;
	Sat,  4 Apr 2020 14:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718966E222
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 14:07:51 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10EAD206F5
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 14:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586009271;
 bh=/fGwNQGSGd8258j4HpL7qVgnU4jtouS/+Lk1L8UMLa0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y6kx7ZctsdH13Tn2DH/MWaklMItFSw/j1F5h0zFx9Sa4p4YGfwaQNyFCi55i9jn9n
 IXLbICIi/o6HN642XKH/oL+0gGZ6MUMnAi/f/fKnfd45Seui669+Hj7LUS3fzuq2Ng
 B2Ec4WS5K3mgCnmu+njSanerAiao94B2vW673P5Y=
Received: by mail-ed1-f51.google.com with SMTP id bd14so12838390edb.10
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Apr 2020 07:07:50 -0700 (PDT)
X-Gm-Message-State: AGi0PuaasLwnF+glGGWY3fEPqUoPLqhOHT0GaYfQ4ooN/qBzXDOIMq7a
 6Bj1sqQoQWAneXsHgy4AyoUlW8AZcikIY3ymig==
X-Google-Smtp-Source: APiQypK0S3Kzy+Z7UNvOp7SLCqBUhpNPhPvCjDCuGG8pOnT9BD/0gjPBqrnjz9yHn+AyXpA4LOucO3kSR8nPurmuA+4=
X-Received: by 2002:a17:906:fca4:: with SMTP id
 qw4mr422751ejb.324.1586009269517; 
 Sat, 04 Apr 2020 07:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200403080350.95826-1-jitao.shi@mediatek.com>
 <20200403080350.95826-4-jitao.shi@mediatek.com>
In-Reply-To: <20200403080350.95826-4-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 4 Apr 2020 22:07:37 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-FJ9LY6KwnzA+6bb0X=i1VRk8EOvtcM73rfidPhnGdnw@mail.gmail.com>
Message-ID: <CAAOTY_-FJ9LY6KwnzA+6bb0X=i1VRk8EOvtcM73rfidPhnGdnw@mail.gmail.com>
Subject: Re: [PATCH v14 3/3] drm/mediatek: set dpi pin mode to gpio low to
 avoid leakage current
To: Jitao Shi <jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDTmnIgz5pelIOmAseS6lCDkuIvljYg0OjA05a+r6YGT77yaCj4KPiBDb25maWcgZHBpIHBpbnMg
bW9kZSB0byBvdXRwdXQgYW5kIHB1bGwgbG93IHdoZW4gZHBpIGlzIGRpc2FibGVkLgo+IEFvdmlk
IGxlYWthZ2UgY3VycmVudCBmcm9tIHNvbWUgZHBpIHBpbnMgKEhzeW5jIFZzeW5jIERFIC4uLiAp
LgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoK
Pgo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDMxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gaW5kZXggMDg3ZjVjZTczMmUxLi4xZTAx
MjU0Nzg4ZDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGku
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBAQCAtMTAsNyAr
MTAsOSBAQAo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9v
Zi5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9v
Zl9ncGlvLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvcGluY3RybC9jb25zdW1lci5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNl
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+Cj4gQEAgLTc0LDYgKzc2LDkgQEAgc3Ry
dWN0IG10a19kcGkgewo+ICAgICAgICAgZW51bSBtdGtfZHBpX291dF95Y19tYXAgeWNfbWFwOwo+
ICAgICAgICAgZW51bSBtdGtfZHBpX291dF9iaXRfbnVtIGJpdF9udW07Cj4gICAgICAgICBlbnVt
IG10a19kcGlfb3V0X2NoYW5uZWxfc3dhcCBjaGFubmVsX3N3YXA7Cj4gKyAgICAgICBzdHJ1Y3Qg
cGluY3RybCAqcGluY3RybDsKPiArICAgICAgIHN0cnVjdCBwaW5jdHJsX3N0YXRlICpwaW5zX2dw
aW87Cj4gKyAgICAgICBzdHJ1Y3QgcGluY3RybF9zdGF0ZSAqcGluc19kcGk7Cj4gICAgICAgICBp
bnQgcmVmY291bnQ7Cj4gIH07Cj4KPiBAQCAtMzc5LDYgKzM4NCw5IEBAIHN0YXRpYyB2b2lkIG10
a19kcGlfcG93ZXJfb2ZmKHN0cnVjdCBtdGtfZHBpICpkcGkpCj4gICAgICAgICBpZiAoLS1kcGkt
PnJlZmNvdW50ICE9IDApCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+ICsgICAgICAgaWYg
KGRwaS0+cGluY3RybCAmJiBkcGktPnBpbnNfZ3BpbykKPiArICAgICAgICAgICAgICAgcGluY3Ry
bF9zZWxlY3Rfc3RhdGUoZHBpLT5waW5jdHJsLCBkcGktPnBpbnNfZ3Bpbyk7Cj4gKwo+ICAgICAg
ICAgbXRrX2RwaV9kaXNhYmxlKGRwaSk7Cj4gICAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUo
ZHBpLT5waXhlbF9jbGspOwo+ICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+ZW5n
aW5lX2Nsayk7Cj4gQEAgLTQwMyw2ICs0MTEsOSBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93ZXJf
b24oc3RydWN0IG10a19kcGkgKmRwaSkKPiAgICAgICAgICAgICAgICAgZ290byBlcnJfcGl4ZWw7
Cj4gICAgICAgICB9Cj4KPiArICAgICAgIGlmIChkcGktPnBpbmN0cmwgJiYgZHBpLT5waW5zX2Rw
aSkKPiArICAgICAgICAgICAgICAgcGluY3RybF9zZWxlY3Rfc3RhdGUoZHBpLT5waW5jdHJsLCBk
cGktPnBpbnNfZHBpKTsKPiArCj4gICAgICAgICBtdGtfZHBpX2VuYWJsZShkcGkpOwo+ICAgICAg
ICAgcmV0dXJuIDA7Cj4KPiBAQCAtNzA1LDYgKzcxNiwyNiBAQCBzdGF0aWMgaW50IG10a19kcGlf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIGRwaS0+ZGV2ID0g
ZGV2Owo+ICAgICAgICAgZHBpLT5jb25mID0gKHN0cnVjdCBtdGtfZHBpX2NvbmYgKilvZl9kZXZp
Y2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPgo+ICsgICAgICAgZHBpLT5waW5jdHJsID0gZGV2bV9w
aW5jdHJsX2dldCgmcGRldi0+ZGV2KTsKPiArICAgICAgIGlmIChJU19FUlIoZHBpLT5waW5jdHJs
KSkgewo+ICsgICAgICAgICAgICAgICBkcGktPnBpbmN0cmwgPSBOVUxMOwo+ICsgICAgICAgICAg
ICAgICBkZXZfZGJnKCZwZGV2LT5kZXYsICJDYW5ub3QgZmluZCBwaW5jdHJsIVxuIik7Cj4gKyAg
ICAgICB9Cj4gKyAgICAgICBpZiAoZHBpLT5waW5jdHJsKSB7Cj4gKyAgICAgICAgICAgICAgIGRw
aS0+cGluc19ncGlvID0gcGluY3RybF9sb29rdXBfc3RhdGUoZHBpLT5waW5jdHJsLCAic2xlZXAi
KTsKPiArICAgICAgICAgICAgICAgaWYgKElTX0VSUihkcGktPnBpbnNfZ3BpbykpIHsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBkcGktPnBpbnNfZ3BpbyA9IE5VTEw7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZGV2X2RiZygmcGRldi0+ZGV2LCAiQ2Fubm90IGZpbmQgcGluY3RybCBpZGxl
IVxuIik7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAgICAgaWYgKGRwaS0+cGlu
c19ncGlvKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHBpbmN0cmxfc2VsZWN0X3N0YXRlKGRw
aS0+cGluY3RybCwgZHBpLT5waW5zX2dwaW8pOwo+ICsKPiArICAgICAgICAgICAgICAgZHBpLT5w
aW5zX2RwaSA9IHBpbmN0cmxfbG9va3VwX3N0YXRlKGRwaS0+cGluY3RybCwgImRlZmF1bHQiKTsK
PiArICAgICAgICAgICAgICAgaWYgKElTX0VSUihkcGktPnBpbnNfZHBpKSkgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGRwaS0+cGluc19kcGkgPSBOVUxMOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGRldl9kYmcoJnBkZXYtPmRldiwgIkNhbm5vdCBmaW5kIHBpbmN0cmwgYWN0aXZlIVxu
Iik7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiAgICAgICAgIG1lbSA9IHBsYXRm
b3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4gICAgICAgICBkcGkt
PnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCBtZW0pOwo+ICAgICAgICAgaWYgKElT
X0VSUihkcGktPnJlZ3MpKSB7Cj4gLS0KPiAyLjIxLjAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
