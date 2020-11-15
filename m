Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EC62B3A96
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 00:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54C46E9E5;
	Sun, 15 Nov 2020 23:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CD16E9E5
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 23:33:26 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9762A22409
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605483205;
 bh=AxjPWHiAXimR3BwkGu8Fq6s+JPSbGYc4j1v6w0slZqU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zNe+9BdsyFczGaIH+LDVLTlcFnYB7CoBtFB5N5EKdyKvAHRcGPsJtMLWZr5LoZHiO
 XyFg9n3dSQyNL2Ysote/LTsaY5HNlyE0fxKlA4g62mGy72Tm38E0/Pn569V51YVAk2
 74sqrbMgK1xvZsQHUmkwHR+D4jEMyKFi7ApbqoQE=
Received: by mail-ej1-f53.google.com with SMTP id dk16so21875730ejb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 15:33:25 -0800 (PST)
X-Gm-Message-State: AOAM5335IjlOGvXLusMG//hKq0f4xAEjBYUSpxSs5dlo4mC3VFjYE1ND
 SyXLZ/DGUnw34xwONRnRtQ4GmRDjWC5A7B42eg==
X-Google-Smtp-Source: ABdhPJwY5FAbz/l67tbdaapu7EKNmOwZT7Y3IG02ZWCruzVT3fqs01hVvXxojcLVUvNaQzjwOlzj809nVqGcTt86abM=
X-Received: by 2002:a17:906:5a96:: with SMTP id
 l22mr12127130ejq.303.1605483204156; 
 Sun, 15 Nov 2020 15:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20201103003422.17838-1-chunkuang.hu@kernel.org>
In-Reply-To: <20201103003422.17838-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2020 07:33:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9px2KEoEF4YrYapP0kDPct+9SwpUEF591zRRU10+BSHg@mail.gmail.com>
Message-ID: <CAAOTY_9px2KEoEF4YrYapP0kDPct+9SwpUEF591zRRU10+BSHg@mail.gmail.com>
Subject: Re: [PATCH 00/11] Decouple Mediatek DRM sub driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTHmnIgz
5pelIOmAseS6jCDkuIrljYg4OjM05a+r6YGT77yaCj4KPiBtdGsgY2NvcnIgaXMgY29udHJvbGxl
ZCBieSBEUk0gYW5kIE1EUCBbMV0uIEluIG9yZGVyIHRvIHNoYXJlCj4gbXRrX2Njb3JyIGRyaXZl
ciBmb3IgRFJNIGFuZCBNRFAsIGRlY291cGxlIE1lZGlhdGVrIERSTSBzdWIgZHJpdmVyCj4gd2hp
Y2ggaW5jbHVkZSBtdGtfY2NvcnIsIHNvIE1EUCBjb3VsZCB1c2UgdGhpcyBkZWNvdXBsZWQgbXRr
X2Njb3JyLgoKQXBwbGllZCB0aGUgd2hvbGUgc2VyaWVzIGludG8gbWVkaWF0ZWstZHJtLW5leHQg
WzFdLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRz
LApDaHVuLUt1YW5nLgoKPgo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNo
LzExMTQwNzUxLwo+Cj4gQ0sgSHUgKDkpOgo+ICAgZHJtL21lZGlhdGVrOiBNb3ZlIGNsayBpbmZv
IGZyb20gc3RydWN0IG10a19kZHBfY29tcCB0byBzdWIgZHJpdmVyCj4gICAgIHByaXZhdGUgZGF0
YQo+ICAgZHJtL21lZGlhdGVrOiBNb3ZlIHJlZ3MgaW5mbyBmcm9tIHN0cnVjdCBtdGtfZGRwX2Nv
bXAgdG8gc3ViIGRyaXZlcgo+ICAgICBwcml2YXRlIGRhdGEKPiAgIGRybS9tZWRpYXRlazogUmVt
b3ZlIGlycSBpbiBzdHJ1Y3QgbXRrX2RkcF9jb21wCj4gICBkcm0vbWVkaWF0ZWs6IFVzZSBzdHJ1
Y3QgY21kcV9jbGllbnRfcmVnIHRvIGdhdGhlciBjbWRxIHZhcmlhYmxlCj4gICBkcm0vbWVkaWF0
ZWs6IE1vdmUgY21kcV9yZWcgaW5mbyBmcm9tIHN0cnVjdCBtdGtfZGRwX2NvbXAgdG8gc3ViCj4g
ICAgIGRyaXZlciBwcml2YXRlIGRhdGEKPiAgIGRybS9tZWRpYXRlazogQ2hhbmdlIHN1YiBkcml2
ZXIgaW50ZXJmYWNlIGZyb20gbXRrX2RkcF9jb21wIHRvIGRldmljZQo+ICAgZHJtL21lZGlhdGVr
OiBSZWdpc3RlciB2YmxhbmsgY2FsbGJhY2sgZnVuY3Rpb24KPiAgIGRybS9tZWRpYXRlazogRFJN
IGRyaXZlciBkaXJlY3RseSByZWZlciB0byBzdWIgZHJpdmVyJ3MgZnVuY3Rpb24KPiAgIGRybS9t
ZWRpYXRlazogTW92ZSBtdGtfZGRwX2NvbXBfaW5pdCgpIGZyb20gc3ViIGRyaXZlciB0byBEUk0g
ZHJpdmVyCj4KPiBDaHVuLUt1YW5nIEh1ICgyKToKPiAgIGRybS9tZWRpYXRlazogR2V0IENNRFEg
Y2xpZW50IHJlZ2lzdGVyIGZvciBhbGwgZGRwIGNvbXBvbmVudAo+ICAgZHJtL21lZGlhdGVrOiBV
c2UgY29ycmVjdCBkZXZpY2UgcG9pbnRlciB0byBnZXQgQ01EUSBjbGllbnQgcmVnaXN0ZXIKPgo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYyAgIHwgIDg2ICsrLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaCAgICAgfCAgNjkgKysr
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAgIHwgMjE1ICsr
KysrKy0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgICAg
fCAxNjkgKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgICAg
ICAgICAgfCAgNDQgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
YyAgICAgfCAgNzUgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRj
LmggICAgIHwgICAxIC0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2Nv
bXAuYyB8IDM4OSArKysrKysrKysrKystLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5oIHwgMTAwICsrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jICAgICAgfCAgMzAgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmggICAgICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jICAgICAgICAgIHwgIDQ3ICstLQo+ICAxMiBmaWxlcyBjaGFuZ2VkLCA2NTgg
aW5zZXJ0aW9ucygrKSwgNTY5IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5oCj4KPiAtLQo+IDIuMTcuMQo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
