Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AA3369DCA
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 02:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6DA6ECD4;
	Sat, 24 Apr 2021 00:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60586ECD4
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 00:25:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B44361462
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 00:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619223948;
 bh=hhjXoFOS7MULhaH2eAbg6aq5dkXrvOaI7xjS7HFqXe0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GK0G8zXN66tUHlussUN5Vjc/K9oqAXRK0abA6s2QxZ3tq7fsDvvuIjbGa3BUDZ99N
 zitv2zz9omc0KoAjqrKMIsTu3lNQ/Ac5+39OZb6THfNzGyzgeVDL8ffkbFiyhIt/TK
 uTbPFThojEWgWHZhFvH0eIpWdYHX3xWGBDUPg86ryNd3EdzH7v6nZmANtvSW5+Kw2t
 3ZgeECGqb+I6TYT0WPYu1de7+OCaUEyBGi4vmvKtlvSY9i9kZt7Wp3M0olYVslN4UN
 8//viqJDSSgxHHdmz33CLjDjOH8tID7a4Lz3o7qOQ9P8MR2otzLTyKllx4cJ65069B
 z1gINSiwDiHNA==
Received: by mail-ed1-f50.google.com with SMTP id s15so59275973edd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 17:25:48 -0700 (PDT)
X-Gm-Message-State: AOAM5313TnXk2TYCjX3Imx1cry3pZUeQfnFqhlpS2ipWqEOnaBm3ek/h
 wOCcpKe48q0VZBHPDw5k6edFK0NgYqsblJMYBQ==
X-Google-Smtp-Source: ABdhPJxBTXib/RTXK9IEyyqRWQN2gM044cLDarwNUaBYySdbYao+uXwAkbPJ8CvcyZEI+UG1zkDReajVBv2wkbv96lQ=
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr7578022eds.166.1619223947148; 
 Fri, 23 Apr 2021 17:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
 <20210419073244.2678688-6-narmstrong@baylibre.com>
In-Reply-To: <20210419073244.2678688-6-narmstrong@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 24 Apr 2021 08:25:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PyKK4+gqiU4aP48fB-y34EdW7RULBxOfU2KU+V1toXw@mail.gmail.com>
Message-ID: <CAAOTY_9PyKK4+gqiU4aP48fB-y34EdW7RULBxOfU2KU+V1toXw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] gpu/drm: mediatek: hdmi: add MT8167 configuration
To: Neil Armstrong <narmstrong@baylibre.com>
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE5laWw6CgpOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOaWvCAy
MDIx5bm0NOaciDE55pelIOmAseS4gCDkuIvljYgzOjMz5a+r6YGT77yaCj4KPiBUaGUgTVQ4MTY3
IFNvQyBoYXZlIGEgaGFyZCBsaW1pdCBvbiB0aGUgbWF4aW1hbCBzdXBwb3J0ZWQgSERNSSBUTURT
IGNsb2NrLAo+IGFuZCBpcyBub3QgdmFsaWRhdGVkIGFuZCBzdXBwb3J0ZWQgZm9yIEhETUkgbW9k
ZXMgb3V0IG9mIEhETUkgQ0VBIG1vZGVzLAo+IHNvIGFkZCBhIGNvbmZpZ3VyYXRpb24gZW50cnkg
bGlua2VkIHRvIHRoZSBNVDgxNjcgY29tcGF0aWJsZS4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4g
UGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0
cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IGluZGV4IGJjNTBk
OTdmMjU1My4uYzE2NTFhODM3MDBkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMKPiBAQCAtMTc4NywxMCArMTc4NywxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19oZG1p
X2NvbmYgbXRrX2hkbWlfY29uZl9tdDI3MDEgPSB7Cj4gICAgICAgICAudHpfZGlzYWJsZWQgPSB0
cnVlLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2hkbWlfY29uZiBtdGtfaGRt
aV9jb25mX210ODE2NyA9IHsKPiArICAgICAgIC5tYXhfbW9kZV9jbG9jayA9IDE0ODUwMCwKPiAr
ICAgICAgIC5jZWFfbW9kZXNfb25seSA9IHRydWUsCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHJtX2hkbWlfb2ZfaWRzW10gPSB7Cj4gICAgICAgICB7
IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1oZG1pIiwKPiAgICAgICAgICAgLmRhdGEg
PSAmbXRrX2hkbWlfY29uZl9tdDI3MDEsCj4gICAgICAgICB9LAo+ICsgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctaGRtaSIsCj4gKyAgICAgICAgIC5kYXRhID0gJm10a19o
ZG1pX2NvbmZfbXQ4MTY3LAo+ICsgICAgICAgfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTczLWhkbWkiLAo+ICAgICAgICAgfSwKPiAgICAgICAgIHt9Cj4gLS0KPiAy
LjI1LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
