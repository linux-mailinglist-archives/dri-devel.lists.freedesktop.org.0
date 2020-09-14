Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE21269897
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDD86E5D5;
	Mon, 14 Sep 2020 22:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654BB6E5D5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 22:09:37 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB30921D43
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 22:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600121377;
 bh=Nz7gGQ+J/ilhJdHLM4BsmqhATykFw0LEpRBTDA8GVOk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vcdsExYa08FePhjPFL/B5tV+UlxmRi0Dt3qUnKHypkDv/qhVr8oRIH0/ZDlgoanh+
 29ZTRj2HAFMritc/hyC2IL6dnmTKAdsl6rnasfKf2sCXvjnHAp8zgRsSkPRX/IGO8Q
 dMjY3XH6toV6vEqTpZUk3JOYmtS00w/dbnKAhXVo=
Received: by mail-ej1-f50.google.com with SMTP id z22so2132984ejl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 15:09:36 -0700 (PDT)
X-Gm-Message-State: AOAM533sK6X1rswXxCd/lMYaPKVsEN5bNn9Jt4T1QFSd9z2ShhvSdz8L
 zLj/Vi9lf6v/5s3tUHYl7H0oeJeGzHv2MGM9bg==
X-Google-Smtp-Source: ABdhPJzJGzLWfXMkzj/uZwj/GppT/VN4DVF+j5uKOZfH5SCyReE4lyC/KudDVVDW7AFmoqKRghaV4EK54CnHc9xzmBw=
X-Received: by 2002:a17:906:7102:: with SMTP id
 x2mr16660250ejj.260.1600121375444; 
 Mon, 14 Sep 2020 15:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200904110002.88966-1-linux@fw-web.de>
 <20200904110002.88966-2-linux@fw-web.de>
In-Reply-To: <20200904110002.88966-2-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Sep 2020 06:09:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__TNsteFiTxdXfnKns4jkz62NNG7joUtsu0XVV8MwhhRQ@mail.gmail.com>
Message-ID: <CAAOTY__TNsteFiTxdXfnKns4jkz62NNG7joUtsu0XVV8MwhhRQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] drm/mediatek: disable tmds on mt2701
To: Frank Wunderlich <linux@fw-web.de>, Jitao Shi <jitao.shi@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 chunhui dai <chunhui.dai@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8bGludXhAZnctd2ViLmRlPiDmlrwgMjAyMOW5
tDnmnIg05pelIOmAseS6lCDkuIvljYg3OjAx5a+r6YGT77yaCj4KPiBGcm9tOiBjaHVuaHVpIGRh
aSA8Y2h1bmh1aS5kYWlAbWVkaWF0ZWsuY29tPgo+Cj4gV2l0aG91dCB0aGF0IHBhdGNoIGlmIHlv
dSB1c2Ugc3BlY2lmaWMgcmVzb2x1dGlvbnMgbGlrZSAxMjgweDEwMjQsCj4gSSBjYW4gc2VlIGRp
c3RvcnRpb24gaW4gdGhlIG91dHB1dC4gSXQgc2VlbXMgYXMgaWYgdGhlCj4gZnJlcXVlbmN5IGZv
ciB1cGRhdGluZyB0aGUgcGl4ZWwgb2YgdGhlIGltYWdlIGlzIG91dCBvZiBzeW5jLgo+Cj4gRm9y
IGluaXRpYWxpemF0aW9uIHRtZHMgbmVlZHMgdG8gYmUgYWN0aXZlLCBidXQgY2FuIGJlIGRpc2Fi
bGVkIGFmdGVyIGluaXQKPiB0byBmaXggYmx1cnJ5IGRpc3BsYXkKCkFzIGRpc2N1c3NlZCB3aXRo
IEppdGFvIG9mZmxpbmUsIGhlIGFncmVlIHRoaXMgcGF0Y2gsIHNvIEkgYXBwbGllZAp0aGlzIHBh
dGNoIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQv
bG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFNpZ25l
ZC1vZmYtYnk6IGNodW5odWkgZGFpIDxjaHVuaHVpLmRhaUBtZWRpYXRlay5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+Cj4gVGVz
dGVkLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4KPiAtLS0K
PiAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLW10MjcwMS5jIHwgMSArCj4gIGRy
aXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5jICAgICAgICB8IDMgKysrCj4gIGRyaXZl
cnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5oICAgICAgICB8IDEgKwo+ICAzIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L21lZGlh
dGVrL3BoeS1tdGstaGRtaS1tdDI3MDEuYyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGst
aGRtaS1tdDI3MDEuYwo+IGluZGV4IGE2Y2IxZGVhM2QwYy4uYjc0YzY1YTE3NjJjIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS1tdDI3MDEuYwo+ICsrKyBi
L2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS1tdDI3MDEuYwo+IEBAIC0yMzgsNiAr
MjM4LDcgQEAgc3RhdGljIHZvaWQgbXRrX2hkbWlfcGh5X2Rpc2FibGVfdG1kcyhzdHJ1Y3QgbXRr
X2hkbWlfcGh5ICpoZG1pX3BoeSkKPgo+ICBzdHJ1Y3QgbXRrX2hkbWlfcGh5X2NvbmYgbXRrX2hk
bWlfcGh5XzI3MDFfY29uZiA9IHsKPiAgICAgICAgIC5mbGFncyA9IENMS19TRVRfUkFURV9HQVRF
LAo+ICsgICAgICAgLnBsbF9kZWZhdWx0X29mZiA9IHRydWUsCj4gICAgICAgICAuaGRtaV9waHlf
Y2xrX29wcyA9ICZtdGtfaGRtaV9waHlfcGxsX29wcywKPiAgICAgICAgIC5oZG1pX3BoeV9lbmFi
bGVfdG1kcyA9IG10a19oZG1pX3BoeV9lbmFibGVfdG1kcywKPiAgICAgICAgIC5oZG1pX3BoeV9k
aXNhYmxlX3RtZHMgPSBtdGtfaGRtaV9waHlfZGlzYWJsZV90bWRzLAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuYyBiL2RyaXZlcnMvcGh5L21lZGlhdGVr
L3BoeS1tdGstaGRtaS5jCj4gaW5kZXggOGZjODNmMDFhNzIwLi40N2MwMjlkNGIyNzAgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLmMKPiArKysgYi9kcml2
ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuYwo+IEBAIC0xODQsNiArMTg0LDkgQEAgc3Rh
dGljIGludCBtdGtfaGRtaV9waHlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocGh5X3Byb3ZpZGVyKTsKPiAgICAgICAg
IH0KPgo+ICsgICAgICAgaWYgKGhkbWlfcGh5LT5jb25mLT5wbGxfZGVmYXVsdF9vZmYpCj4gKyAg
ICAgICAgICAgICAgIGhkbWlfcGh5LT5jb25mLT5oZG1pX3BoeV9kaXNhYmxlX3RtZHMoaGRtaV9w
aHkpOwo+ICsKPiAgICAgICAgIHJldHVybiBvZl9jbGtfYWRkX3Byb3ZpZGVyKGRldi0+b2Zfbm9k
ZSwgb2ZfY2xrX3NyY19zaW1wbGVfZ2V0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaGRtaV9waHktPnBsbCk7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvbWVk
aWF0ZWsvcGh5LW10ay1oZG1pLmggYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWhkbWku
aAo+IGluZGV4IGIxM2UxZDVmOGU3OC4uZGNmOWJiMTM2OTliIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5oCj4gKysrIGIvZHJpdmVycy9waHkvbWVkaWF0
ZWsvcGh5LW10ay1oZG1pLmgKPiBAQCAtMjEsNiArMjEsNyBAQCBzdHJ1Y3QgbXRrX2hkbWlfcGh5
Owo+Cj4gIHN0cnVjdCBtdGtfaGRtaV9waHlfY29uZiB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25n
IGZsYWdzOwo+ICsgICAgICAgYm9vbCBwbGxfZGVmYXVsdF9vZmY7Cj4gICAgICAgICBjb25zdCBz
dHJ1Y3QgY2xrX29wcyAqaGRtaV9waHlfY2xrX29wczsKPiAgICAgICAgIHZvaWQgKCpoZG1pX3Bo
eV9lbmFibGVfdG1kcykoc3RydWN0IG10a19oZG1pX3BoeSAqaGRtaV9waHkpOwo+ICAgICAgICAg
dm9pZCAoKmhkbWlfcGh5X2Rpc2FibGVfdG1kcykoc3RydWN0IG10a19oZG1pX3BoeSAqaGRtaV9w
aHkpOwo+IC0tCj4gMi4yNS4xCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
