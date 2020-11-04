Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA832A61DD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 11:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C486E99A;
	Wed,  4 Nov 2020 10:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321E46E99A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:37:49 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201104103737euoutp020dbe073f0ba5c3d26568d36cbf2965ae~ER8AtZjVY2967329673euoutp02d
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:37:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201104103737euoutp020dbe073f0ba5c3d26568d36cbf2965ae~ER8AtZjVY2967329673euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604486258;
 bh=aZmZ/FoJqHoTLO4+zTXCxyBDyba175tSw0+4Qh3yg/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aj8Fz/VjAATAVd0TxfcB6g+9P5ijnIr5EY5Rd8cQXw0qdhPo9djRMKBx7v/nfWgKV
 dj50i+k8AyT2iHzUbbNEh1+V1ROsFylUNnrfXck0KPVFeJec/sBmQzMU2BZyFMs9Vm
 3CaPCoyqKSDTnqABI703ZSZiISBFf0RgbMK+Afuo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201104103728eucas1p12484f8ca9c1e09fafe1fa34a67a648ec~ER74QFEaW3078630786eucas1p1w;
 Wed,  4 Nov 2020 10:37:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 6D.8F.06456.86482AF5; Wed,  4
 Nov 2020 10:37:28 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201104103728eucas1p2f671f29ed9eb06d4c6c991b073be092e~ER731CdZL1145311453eucas1p2u;
 Wed,  4 Nov 2020 10:37:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201104103728eusmtrp1354338b1fa5706d47c202e785aaad583~ER73z6Xdg0620706207eusmtrp1E;
 Wed,  4 Nov 2020 10:37:28 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-24-5fa284683a0e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B2.85.06314.86482AF5; Wed,  4
 Nov 2020 10:37:28 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201104103727eusmtip2586e9f806ee1ec4683732c23bd18e85b~ER73BceSb0884408844eusmtip2P;
 Wed,  4 Nov 2020 10:37:27 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Subject: [PATCH v8 6/7] ARM: dts: exynos: Add interconnects to Exynos4412 mixer
Date: Wed,  4 Nov 2020 11:36:56 +0100
Message-Id: <20201104103657.18007-7-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104103657.18007-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGvZ3pdCAWh4LhgkZigw+YsCmaGzYRiam8iAlPGIQKEyCypcMi
 PCCERSxLEAwgGEA0EaoEaKFBFsPSWkiBBkGQgBYDxKAgaCFsAaQdVN7+c+53/3P+m0tigo9c
 OzI6LpGWxIljhIQ5rny/pXOKyq4LdZ0bdUX66hyAWiqauGhy7RsX1ahGuGh8fYVA5d1yApXo
 i3Gk0zXzkHxugovGOp4RyFCoAqhC946DGlWfeWg6s55AOd0qHupfeshFFaWLhK+lSC57RIhm
 JroIkT5fwxEpXj4QFbXKgMggPxNIBJt7RdAx0cm0xMUnzDzq8bKSSBgi79fsbBEZoIonBWYk
 pNxhe4MMSIE5KaDqARzWKzhssQageiofZwsDgNrcEkwKSNOVUYM3238FoGFogPh3o6FFihl9
 CcoNFqqLgFFbU/4wd6Ha5IRReRhUtpeYICvqFqxtmcKNGqfOwco3YybNpzzh9Owyzi5oD183
 95h4M8rrYHIWj2Us4eDTeRODHTBZbVWYcQCkfvHg29lmHruqP1SPnGR9rOB3Teth6NNQW1qA
 s3wWgAWd0zy2KAZQr6kFLOUJZ0a2CaMRRjnCpg4Xtn0Vdg9WHz6FBfy0bMnuYAFLlOWHbT7M
 yxWwtAPckZVzWG0H8+f3D2OJoK52DCsGZyuPpKk8kqby/9xagMmADZ3ExEbSjFscneLMiGOZ
 pLhI5/D4WDk4+GzaPc3vdrD+4W4foEggPM7vUT4PFXDFyUxqbB+AJCa05vsNa+8I+BHi1DRa
 Eh8qSYqhmT5wisSFNvyLdYshAipSnEjfo+kEWvL3lEOa2WWAoBeXbXe/MCEr9vl4kO/e6o+F
 oKnrg6v1a9zNtr3+Y4qAUfUVBTPpUDb3BEx7WCxlpXgoyhrr413ChqU3gwd8A7J73dO8Oj2/
 hjrt794oDsy0iS/TXUj/GejSeyLdb3ZjeyXFUW+bp7Jmeto5FhvXti75BNzWpmx6j4Mufnp4
 nhBnosRu5zEJI/4D7fsP5GgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xe7oZLYviDZ7/FrK4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFm07j3CbnH4TTurxYzJL9kcBD02repk87hzbQ+bx/3u40wem5fUe/RtWcXo
 8XmTXABblJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5d
 gl7GxLfb2ArOcFTM//2TrYFxNnsXIweHhICJxMXPtl2MXBxCAksZJbpuTWKBiEtJzG9R6mLk
 BDKFJf5c62KDqPnEKDHz0woWkASbgKFE79E+RhBbRMBD4lTrWlYQm1lgBrPE6VmmIHOEBfwl
 Vj9lAgmzCKhKzFpzGayVV8Ba4vaDtywQ8+UlVm84wAxicwrYAJ3TzA5iCwHVLH5+jgmiXlDi
 5MwnYKcxC6hLrJ8nBLFJXqJ562zmCYyCs5BUzUKomoWkagEj8ypGkdTS4tz03GJDveLE3OLS
 vHS95PzcTYzAON127OfmHYyXNgYfYhTgYFTi4T2wbWG8EGtiWXFl7iFGCQ5mJRFep7On44R4
 UxIrq1KL8uOLSnNSiw8xmgK9NpFZSjQ5H5hC8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQn
 lqRmp6YWpBbB9DFxcEo1MEpcEXBSeKP9YMniaPVeu5Wvzjx96Lw6xPHpeWst/5t+qm5fpHyv
 rXrDLXq4a5fKorQ5rS7vPrVluRubd7AUlc87cTfSS2qe8e6aOMYtKbJBDepb+Zv7llSnZcpw
 RXWsjdyfdk9JderGdzu9H6/0iL3vrna1NEaKzWtBMn/wAtPYON8Srj9TlViKMxINtZiLihMB
 UkZdHOkCAAA=
X-CMS-MailID: 20201104103728eucas1p2f671f29ed9eb06d4c6c991b073be092e
X-Msg-Generator: CA
X-RootMTR: 20201104103728eucas1p2f671f29ed9eb06d4c6c991b073be092e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201104103728eucas1p2f671f29ed9eb06d4c6c991b073be092e
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
 <CGME20201104103728eucas1p2f671f29ed9eb06d4c6c991b073be092e@eucas1p2.samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 myungjoo.ham@samsung.com, dri-devel@lists.freedesktop.org,
 s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHNhbXN1bmcuY29tPgoKVGhpcyBwYXRjaCBh
ZGRzIGFuICdpbnRlcmNvbm5lY3RzJyBwcm9wZXJ0eSB0byBFeHlub3M0NDEyIERUUyBpbiBvcmRl
ciB0bwpkZWNsYXJlIHRoZSBpbnRlcmNvbm5lY3QgcGF0aCB1c2VkIGJ5IHRoZSBtaXhlci4gUGxl
YXNlIG5vdGUgdGhhdCB0aGUKJ2ludGVyY29ubmVjdC1uYW1lcycgcHJvcGVydHkgaXMgbm90IG5l
ZWRlZCB3aGVuIHRoZXJlIGlzIG9ubHkgb25lIHBhdGggaW4KJ2ludGVyY29ubmVjdHMnLCBpbiB3
aGljaCBjYXNlIGNhbGxpbmcgb2ZfaWNjX2dldCgpIHdpdGggYSBOVUxMIG5hbWUgc2ltcGx5CnJl
dHVybnMgdGhlIHJpZ2h0IHBhdGguCgpSZXZpZXdlZC1ieTogQ2hhbndvbyBDaG9pIDxjdzAwLmNo
b2lAc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBz
YW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tp
QHNhbXN1bmcuY29tPgotLS0KQ2hhbmdlcyBmb3IgdjguLi52NToKIC0gbm9uZS4KLS0tCiBhcmNo
L2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRz
aSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQppbmRleCA0OTk5ZTY4Li5kMDc3
MzllIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kKKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCkBAIC03NzksNiArNzc5LDcgQEAKIAlj
bG9jay1uYW1lcyA9ICJtaXhlciIsICJoZG1pIiwgInNjbGtfaGRtaSIsICJ2cCI7CiAJY2xvY2tz
ID0gPCZjbG9jayBDTEtfTUlYRVI+LCA8JmNsb2NrIENMS19IRE1JPiwKIAkJIDwmY2xvY2sgQ0xL
X1NDTEtfSERNST4sIDwmY2xvY2sgQ0xLX1ZQPjsKKwlpbnRlcmNvbm5lY3RzID0gPCZidXNfZGlz
cGxheSAmYnVzX2RtYz47CiB9OwogCiAmcG11IHsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
