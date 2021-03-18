Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E231033FC3D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 01:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AF46E071;
	Thu, 18 Mar 2021 00:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FE96E071
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 00:31:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9531D64E74
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 00:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616027475;
 bh=kE5pzJREcMtcsKe3XXovC6KJw1unQTOB5zOB90M91cY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aiXRMyRsHS2M+eWjf+Wn1N0/Ls34dTH5PjkDM8qp4pKHGTkPKNfkBVvxUQ3ieHKQm
 7ktBkIGZKrkitb8iZB34vuFpG71MDFREvP87QSYKpiWTTWsQCsC6JaL3cb91BftWTw
 YJ/tn7EwP3FgkawTye21BoA1DQaV/6s53zrkDUWVkr455MaJflvOiWLDIIuDBLa2Zo
 UD88PoTqMCXxO8C0/dxjmGvTxnbxSFwMB+zjdPNapInqV34vbhF1I1HuUk440rTu8D
 mgPUF/rlCEywCYbStfs+iqWREKAEohcNFpOcMFtBesu97j/uVk2hLkfHbuS5KQPUg4
 RJeGZ0PI5dI3w==
Received: by mail-ej1-f43.google.com with SMTP id b7so1193521ejv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 17:31:15 -0700 (PDT)
X-Gm-Message-State: AOAM531tMyo9xSaMwbgKs4gwHYdW48Ty5Foq2b3soUOYWELDnbPV28VM
 cgLYmJSWDBCFrpjwW6RjME7fsBzkHQHvWTdN5g==
X-Google-Smtp-Source: ABdhPJyRt0/BHVBbK/+kJchk+xOcRQnGlNm6MFZSoVqqh6s/25AE46ySni1iQzV9dfexmdF4fKF39m+xGj/DSl/FVys=
X-Received: by 2002:a17:907:3e8a:: with SMTP id
 hs10mr38674530ejc.267.1616027473977; 
 Wed, 17 Mar 2021 17:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210201034755.15793-1-jitao.shi@mediatek.com>
In-Reply-To: <20210201034755.15793-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 18 Mar 2021 08:31:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_--LQxwvnmWws23OkShBiQdxumoULoLTuHeXXMqZ6aW7g@mail.gmail.com>
Message-ID: <CAAOTY_--LQxwvnmWws23OkShBiQdxumoULoLTuHeXXMqZ6aW7g@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fine tune the data lane trail by project dts
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Cawa Cheng <cawa.cheng@mediatek.com>, shuijing.li@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDLmnIgx5pelIOmAseS4gCDkuIrljYgxMTo0OOWvq+mBk++8mgo+Cj4gU29tZSBwYW5lbHMgb3Ig
YnJpZGdlcyByZXF1aXJlIGN1c3RvbWl6ZWQgaHNfZGFfdHJhaWwgdGltZS4KPiBTbyBhZGQgYSBw
cm9wZXJ0eSBpbiBkZXZpY2V0cmVlIGZvciB0aGlzIHBhbmVscyBhbmQgYnJpZGdlcy4KPgo+IFNp
Z25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDEwICsrKysrKysrKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggOGM3MGVjMzliZmUxLi42ZTcwOTJmYTJmZWUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBAQCAtMTk0LDYgKzE5NCw3IEBAIHN0
cnVjdCBtdGtfZHNpIHsKPiAgICAgICAgIHN0cnVjdCBjbGsgKmhzX2NsazsKPgo+ICAgICAgICAg
dTMyIGRhdGFfcmF0ZTsKPiArICAgICAgIHUzMiBkYV90cmFpbF9kZWx0YTsKPgo+ICAgICAgICAg
dW5zaWduZWQgbG9uZyBtb2RlX2ZsYWdzOwo+ICAgICAgICAgZW51bSBtaXBpX2RzaV9waXhlbF9m
b3JtYXQgZm9ybWF0Owo+IEBAIC0yMzQsNyArMjM1LDcgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9w
aHlfdGltY29uZmlnKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gICAgICAgICB0aW1pbmctPmRhX2hz
X3ByZXBhcmUgPSAoODAgKiBkYXRhX3JhdGVfbWh6ICsgNCAqIDEwMDApIC8gODAwMDsKPiAgICAg
ICAgIHRpbWluZy0+ZGFfaHNfemVybyA9ICgxNzAgKiBkYXRhX3JhdGVfbWh6ICsgMTAgKiAxMDAw
KSAvIDgwMDAgKyAxIC0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRpbWluZy0+ZGFf
aHNfcHJlcGFyZTsKPiAtICAgICAgIHRpbWluZy0+ZGFfaHNfdHJhaWwgPSB0aW1pbmctPmRhX2hz
X3ByZXBhcmUgKyAxOwo+ICsgICAgICAgdGltaW5nLT5kYV9oc190cmFpbCA9IHRpbWluZy0+ZGFf
aHNfcHJlcGFyZSArIDEgKyBkc2ktPmRhX3RyYWlsX2RlbHRhOwo+Cj4gICAgICAgICB0aW1pbmct
PnRhX2dvID0gNCAqIHRpbWluZy0+bHB4IC0gMjsKPiAgICAgICAgIHRpbWluZy0+dGFfc3VyZSA9
IHRpbWluZy0+bHB4ICsgMjsKPiBAQCAtMTA5NCw2ICsxMDk1LDEzIEBAIHN0YXRpYyBpbnQgbXRr
X2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAg
ICBnb3RvIGVycl91bnJlZ2lzdGVyX2hvc3Q7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIHJldCA9
IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KGRldi0+b2Zfbm9kZSwgImRhX3RyYWlsX2RlbHRh
IiwgMCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkc2ktPmRh
X3RyYWlsX2RlbHRhKTsKClRoaXMgdmFsdWUgZGVwZW5kcyBvbiBwYW5lbCwgc28gSSB0aGluayB3
ZSBzaG91bGQgZ2V0IHNvbWUgdmFsdWUgZnJvbQpwYW5lbCdzIGRldmljZSBub2RlIHRvIGNhbGN1
bGF0ZSB0aGlzIHZhbHVlLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICBpZiAocmV0
KSB7Cj4gKyAgICAgICAgICAgICAgIGRldl9pbmZvKGRldiwgIkNhbid0IGdldCBkYV90cmFpbF9k
ZWx0YSwga2VlcCBpdCBhcyAwOiAlZFxuIiwgcmV0KTsKPiArICAgICAgICAgICAgICAgZHNpLT5k
YV90cmFpbF9kZWx0YSA9IDA7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgY29tcF9pZCA9IG10
a19kZHBfY29tcF9nZXRfaWQoZGV2LT5vZl9ub2RlLCBNVEtfRFNJKTsKPiAgICAgICAgIGlmIChj
b21wX2lkIDwgMCkgewo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBp
ZGVudGlmeSBieSBhbGlhczogJWRcbiIsIGNvbXBfaWQpOwo+IC0tCj4gMi4xMi41Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
