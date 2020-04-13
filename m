Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA331A68A0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 17:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759EB89A56;
	Mon, 13 Apr 2020 15:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF2789A56;
 Mon, 13 Apr 2020 15:17:39 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e26so9647926wmk.5;
 Mon, 13 Apr 2020 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6/tAY7sG8rHBuZ3JGryCCYr3n1OexDLH2uk6dgjjXOE=;
 b=fgn2+OLLH1broPdcc/n91zxjUbINV+YKFu4617b9ChwUBY6ku2GPh+UQi2KCrydpZB
 uRIvV/qTyrtYa4cQ1idlbrH6Ip/SgQn/5Y25JeGcMcFhD1k1oiCapG75nbieQLXwAUUr
 36RAl2O6RlM7irJ5YAyVp/c7cE/Om8fPq6/CpLkO9hWs4fKKJGfNyOoDc7eeCqHYVmhM
 R664MVppEBLiwZ38BGlII8hlYSRFZhcrqifVX4of3ZzyovydCJbhejctPy8lgwtkC6gE
 197raXN3Ci+GKsXKp+qGBwiDY4f0ymNPhfnp9JGw87hsWJRfi6jG44I6/Q2r9JM6pl96
 HRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6/tAY7sG8rHBuZ3JGryCCYr3n1OexDLH2uk6dgjjXOE=;
 b=rex7T+PLpn6PVNgU3yVV1Z5QQ6nXS4FEzqtUyGAY36EG7twjechkv/5shTO0tZAlVg
 guLtgngTXUXhH3GLseWzmS2inNnDnSmjJQyps9YQE4qQy5pouv/NkEiE5C63YrCuecXT
 wLH+qzNqQz6Lb0cXXjqpTq35kTLbGhjv+a9dzvrGEYfODhsayDMcSsNvrxIvOn6Fr/Gk
 mMmkuMi8HlOfhdQapsXcaAyEJIHP7t+MZ+jYt1WwYP5pHjXqbrmy4Lsd7NHcqA4uUpB1
 GhLmxFUpRVctXBAVktXUA2XY83AfmM28TeAl0xmEkfFoU6csJ35RN8aohaAu7NDIm0K1
 kCjQ==
X-Gm-Message-State: AGi0PubmUJ9se6vXQLi5ciD4J0qAAIoUjr1FvPLT93hjdRwiIgTbGM9Q
 cI2ZI73llA7UXgZXpIRpIFbeRlbcwl4KtmyXfoI=
X-Google-Smtp-Source: APiQypJNiuhBu6h6TpUjqMxFco+WMWQExJxvPAtxUopumix9qPR3H5TS8oFTUN/GexIoDeqyEf4Iuan45+cHdKuBg7Y=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr19446547wmb.56.1586791058036; 
 Mon, 13 Apr 2020 08:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200413143300.23244-1-yanaijie@huawei.com>
In-Reply-To: <20200413143300.23244-1-yanaijie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2020 11:17:26 -0400
Message-ID: <CADnq5_NY20m3Y4C3J6jhuzHC-pXj0pSYLgOCVKxrAOA0n=txQw@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove defined but not used variables in
 ci_dpm.c
To: Jason Yan <yanaijie@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Hulk Robot <hulkci@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgQXByIDEzLCAyMDIwIGF0IDEwOjA2IEFN
IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBGaXggdGhlIGZvbGxv
d2luZyBnY2Mgd2FybmluZzoKPgo+IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lfZHBtLmM6ODI6
MzY6IHdhcm5pbmc6IOKAmGRlZmF1bHRzX3NhdHVybl9wcm/igJkKPiBkZWZpbmVkIGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNp
X3B0X2RlZmF1bHRzIGRlZmF1bHRzX3NhdHVybl9wcm8gPQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL2NpX2RwbS5jOjY4OjM2OiB3YXJuaW5nOiDigJhkZWZhdWx0c19ib25haXJlX3Byb+KAmQo+
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgY2lfcHRfZGVmYXVsdHMgZGVmYXVsdHNfYm9uYWlyZV9wcm8gPQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4K
PiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gWWFuIDx5YW5haWppZUBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL2NpX2RwbS5jIHwgMTQgLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vY2lfZHBtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2NpX2RwbS5jCj4gaW5kZXggYTky
NTdiZWQzNDg0Li4xMzRhYTJiMDFmOTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9jaV9kcG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lfZHBtLmMKPiBA
QCAtNjUsMTMgKzY1LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjaV9wdF9kZWZhdWx0cyBkZWZh
dWx0c19ib25haXJlX3h0ID0KPiAgICAgICAgIHsgMHgxN0MsIDB4MTcyLCAweDE4MCwgMHgxQkMs
IDB4MUIzLCAweDFCRCwgMHgyMDYsIDB4MjAwLCAweDIwMywgMHgyNUQsIDB4MjVBLCAweDI1NSwg
MHgyQzMsIDB4MkM1LCAweDJCNCB9Cj4gIH07Cj4KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBjaV9w
dF9kZWZhdWx0cyBkZWZhdWx0c19ib25haXJlX3BybyA9Cj4gLXsKPiAtICAgICAgIDEsIDB4Riwg
MHhGRCwgMHgxOSwgNSwgNDUsIDAsIDB4NjUwNjIsCj4gLSAgICAgICB7IDB4OEMsICAweDIzRiwg
MHgyNDQsIDB4QTYsICAweDgzLCAgMHg4NSwgIDB4ODYsICAweDg2LCAgMHg4MywgIDB4REIsICAw
eERCLCAgMHhEQSwgIDB4NjcsICAweDYwLCAgMHg1RiAgfSwKPiAtICAgICAgIHsgMHgxODcsIDB4
MTkzLCAweDE5MywgMHgxQzcsIDB4MUQxLCAweDFEMSwgMHgyMTAsIDB4MjE5LCAweDIxOSwgMHgy
NjYsIDB4MjZDLCAweDI2QywgMHgyQzksIDB4MkNCLCAweDJDQiB9Cj4gLX07Cj4gLQo+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IGNpX3B0X2RlZmF1bHRzIGRlZmF1bHRzX3NhdHVybl94dCA9Cj4gIHsK
PiAgICAgICAgIDEsIDB4RiwgMHhGRCwgMHgxOSwgNSwgNTUsIDAsIDB4NzAwMDAsCj4gQEAgLTc5
LDEzICs3Miw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2lfcHRfZGVmYXVsdHMgZGVmYXVsdHNf
c2F0dXJuX3h0ID0KPiAgICAgICAgIHsgMHgxODcsIDB4MTg3LCAweDE4NywgMHgxQzcsIDB4MUM3
LCAweDFDNywgMHgyMTAsIDB4MjEwLCAweDIxMCwgMHgyNjYsIDB4MjY2LCAweDI2NiwgMHgyQzks
IDB4MkM5LCAweDJDOSB9Cj4gIH07Cj4KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBjaV9wdF9kZWZh
dWx0cyBkZWZhdWx0c19zYXR1cm5fcHJvID0KPiAtewo+IC0gICAgICAgMSwgMHhGLCAweEZELCAw
eDE5LCA1LCA1NSwgMCwgMHgzMDAwMCwKPiAtICAgICAgIHsgMHg5NiwgIDB4MjFELCAweDIzQiwg
MHhBMSwgIDB4ODUsICAweDg3LCAgMHg4MywgIDB4ODQsICAweDgxLCAgMHhFNiwgIDB4RTYsICAw
eEU2LCAgMHg3MSwgIDB4NkEsICAweDZBICB9LAo+IC0gICAgICAgeyAweDE5MywgMHgxOUUsIDB4
MTlFLCAweDFEMiwgMHgxREMsIDB4MURDLCAweDIxQSwgMHgyMjMsIDB4MjIzLCAweDI2RSwgMHgy
N0UsIDB4Mjc0LCAweDJDRiwgMHgyRDIsIDB4MkQyIH0KPiAtfTsKPiAtCj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgY2lfcHRfY29uZmlnX3JlZyBkaWR0X2NvbmZpZ19jaVtdID0KPiAgewo+ICAgICAg
ICAgeyAweDEwLCAweDAwMDAwMGZmLCAwLCAweDAsIENJU0xBTkRTX0NPTkZJR1JFR19ESURUX0lO
RCB9LAo+IC0tCj4gMi4yMS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
