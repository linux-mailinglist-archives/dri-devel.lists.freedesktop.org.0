Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF7F4AA9E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 21:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A0F6E21C;
	Tue, 18 Jun 2019 19:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8C56E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:05:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9939220B1F;
 Tue, 18 Jun 2019 19:05:38 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [RFT 00/10] ARM/arm64: dts: exynos: Add support for Mali
Date: Tue, 18 Jun 2019 21:05:24 +0200
Message-Id: <20190618190534.4951-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884744;
 bh=vK8tc7Kd1ER0oaq0T5vbExeB1V5IbhRIZBrXithdRSM=;
 h=From:To:Cc:Subject:Date:From;
 b=gFY5e132yO4yupLmLmnqzmDydMEQ4VP+fUPR85du/PyG0jwiZmvr1iSWYTUiTRtAK
 z4i3BdnIg3UmIccOouDtHfQ6KI/izeu1wMHR/y6EbSarhsOPoHYIYCWMjI3/wG7Hoz
 hFvxW+ldZQGwE5xx/t/7C5DY17w8/U+ekqdHTsj4=
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpJbnNwaXJlZCBieSBwYXRjaCBmcm9tIEpvc2VwaCBLb2d1dCBbMV0sIGxldCdzIGFkZCBz
dXBwb3J0IGZvciBNYWxpIEdQVXMKdG8gbW9zdCBvZiBvdGhlciBib2FyZHMuICBIb3dldmVyIGl0
IHdhcyB0ZXN0ZWQgb25seSBvbiBPZHJvaWQgVTMKKEV4eW5vczQ0MTIpIGFuZCBub3QgZnVsbHkg
YmVjYXVzZSByZXF1aXJlbWVudCBvZiBzcGVjaWFsIE1lc2EgZHJpdmVycwp3aXRoIExpbWEgc3Vw
cG9ydC4KCkV2ZW4gd2l0aG91dCB0ZXN0cyBpdCBicmluZ3MgZnVsbCBkZXNjcmlwdGlvbiBvZiBo
YXJkd2FyZSBhbmQgcmVwbGFjZXMKc29tZSBvdXQtb2YtdHJlZSBkb3duc3RyZWFtIGNvZGUgKGUu
Zy4gaW4gVGl6ZW4pLgoKQ29tbWVudHMgYW5kIHRlc3RzIGFyZSB3ZWxjb21lZC4KClsxXSBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwOTk2ODg3LwoKQmVzdCByZWdhcmRzLApL
cnp5c3p0b2YKCgpLcnp5c3p0b2YgS296bG93c2tpICgxMCk6CiAgZHQtYmluZGluZ3M6IGdwdTog
bWFsaTogQWRkIFNhbXN1bmcgY29tcGF0aWJsZXMgZm9yIE1pZGdhcmQgYW5kIFV0Z2FyZAogIGNs
azogc2Ftc3VuZzogQWRkIGJ1cyBjbG9jayBmb3IgR1BVL0czRCBvbiBFeHlub3M0NDEyCiAgQVJN
OiBkdHM6IGV4eW5vczogRml4IGxhbmd1YWdlIHR5cG8gYW5kIGluZGVudGF0aW9uCiAgQVJNOiBk
dHM6IGV4eW5vczogQWRkIEdQVS9NYWxpIDQwMCBub2RlIHRvIEV4eW5vczMyNTAKICBBUk06IGR0
czogZXh5bm9zOiBBZGQgR1BVL01hbGkgNDAwIG5vZGUgdG8gRXh5bm9zNAogIGFybTY0OiBkdHM6
IGV4eW5vczogQWRkIEdQVS9NYWxpIFQ3NjAgbm9kZSB0byBFeHlub3M1NDMzCiAgYXJtNjQ6IGR0
czogZXh5bm9zOiBBZGQgR1BVL01hbGkgVDc2MCBub2RlIHRvIEV4eW5vczcKICBBUk06IG11bHRp
X3Y3X2RlZmNvbmZpZzogRW5hYmxlIFBhbmZyb3N0IGFuZCBMSU1BIGRyaXZlcnMKICBBUk06IGV4
eW5vc19kZWZjb25maWc6IEVuYWJsZSBQYW5mcm9zdCBhbmQgTElNQSBkcml2ZXJzCiAgYXJtNjQ6
IGRlZmNvbmZpZzogRW5hYmxlIFBhbmZyb3N0IGRyaXZlcgoKIC4uLi9iaW5kaW5ncy9ncHUvYXJt
LG1hbGktbWlkZ2FyZC50eHQgICAgICAgICB8ICAxICsKIC4uLi9iaW5kaW5ncy9ncHUvYXJtLG1h
bGktdXRnYXJkLnR4dCAgICAgICAgICB8ICAxICsKIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMy
NTAtYXJ0aWs1LmR0c2kgICAgICB8ICA1ICsrCiBhcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUw
LW1vbmsuZHRzICAgICAgICAgfCAgNSArKwogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1MC1y
aW5hdG8uZHRzICAgICAgIHwgIDUgKysKIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMyNTAuZHRz
aSAgICAgICAgICAgICB8IDMzICsrKysrKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9z
NC5kdHNpICAgICAgICAgICAgICAgIHwgMjkgKysrKysrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczQyMTAtb3JpZ2VuLmR0cyAgICAgICB8ICA1ICsrCiBhcmNoL2FybS9ib290L2R0cy9l
eHlub3M0MjEwLXRyYXRzLmR0cyAgICAgICAgfCAgNCArKwogLi4uL2Jvb3QvZHRzL2V4eW5vczQy
MTAtdW5pdmVyc2FsX2MyMTAuZHRzICAgIHwgIDUgKysKIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5v
czQyMTAuZHRzaSAgICAgICAgICAgICB8IDM2ICsrKysrKysrKysrLS0KIC4uLi9ib290L2R0cy9l
eHlub3M0NDEyLWl0b3Atc2NwLWNvcmUuZHRzaSAgICB8ICA1ICsrCiBhcmNoL2FybS9ib290L2R0
cy9leHlub3M0NDEyLW1pZGFzLmR0c2kgICAgICAgfCAgNSArKwogLi4uL2Jvb3QvZHRzL2V4eW5v
czQ0MTItb2Ryb2lkLWNvbW1vbi5kdHNpICAgIHwgIDUgKysKIGFyY2gvYXJtL2Jvb3QvZHRzL2V4
eW5vczQ0MTIuZHRzaSAgICAgICAgICAgICB8IDMyICsrKysrKysrKysrKwogYXJjaC9hcm0vY29u
Zmlncy9leHlub3NfZGVmY29uZmlnICAgICAgICAgICAgIHwgIDMgKy0KIGFyY2gvYXJtL2NvbmZp
Z3MvbXVsdGlfdjdfZGVmY29uZmlnICAgICAgICAgICB8ICAzICstCiAuLi4vZHRzL2V4eW5vcy9l
eHlub3M1NDMzLXRtMi1jb21tb24uZHRzaSAgICAgfCAgNSArKwogYXJjaC9hcm02NC9ib290L2R0
cy9leHlub3MvZXh5bm9zNTQzMy5kdHNpICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKwogLi4u
L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M3LWVzcHJlc3NvLmR0cyAgICAgIHwgIDUgKysKIGFyY2gv
YXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczcuZHRzaSAgICAgICB8IDExICsrKysKIGFyY2gv
YXJtNjQvY29uZmlncy9kZWZjb25maWcgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L2Nsay9zYW1zdW5nL2Nsay1leHlub3M0LmMgICAgICAgICAgICAgfCAgMSArCiBpbmNsdWRlL2R0
LWJpbmRpbmdzL2Nsb2NrL2V4eW5vczQuaCAgICAgICAgICAgfCAgMSArCiAyNCBmaWxlcyBjaGFu
Z2VkLCAyNTEgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
