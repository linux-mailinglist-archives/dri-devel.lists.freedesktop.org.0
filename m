Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 003651E83D6
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 18:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AC96E946;
	Fri, 29 May 2020 16:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 344 seconds by postgrey-1.36 at gabe;
 Fri, 29 May 2020 16:38:06 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B1A6E946
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 16:38:06 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200529163229euoutp0142768b0a52e5846b57e3363b43b7dbb4~TjNcos6MU1129311293euoutp01E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 16:32:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200529163229euoutp0142768b0a52e5846b57e3363b43b7dbb4~TjNcos6MU1129311293euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1590769949;
 bh=R2nTxZ8Vk3NOcRJ/akm3wcxThuA94Et9AZ9J5chxdR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NgAaYx9Yx56xTVFv/HSuWuwmq3DdZChsD42wxZXC1Fecjm8Ez01/ivrAcSvT+0W+b
 T/5HyykFcLYxynHAm2VxIEaNDR7EozABMNruY6+ZHsweGBBg2+HTnXynR3RqSs33HA
 3b/SdGgzYbuRA3ifyU9Et90EdjJYJ+7loTKCO8jA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200529163228eucas1p2445ecd81aba2c451d05fb1165ec7f3c2~TjNcOMMr61961119611eucas1p2b;
 Fri, 29 May 2020 16:32:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 04.BB.60679.C1931DE5; Fri, 29
 May 2020 17:32:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200529163228eucas1p1d05340fef9ffc724f5d3d9f5709a600f~TjNbuigW02226622266eucas1p1G;
 Fri, 29 May 2020 16:32:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200529163228eusmtrp14a2cff2cbc8cfe598faf1d864cee31b4~TjNbt9zd_2579525795eusmtrp1K;
 Fri, 29 May 2020 16:32:28 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-14-5ed1391cdf7a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 64.25.07950.C1931DE5; Fri, 29
 May 2020 17:32:28 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200529163227eusmtip1bf2e39c4ee8804bf947d863379c12603~TjNbAGEEL2038020380eusmtip1b;
 Fri, 29 May 2020 16:32:27 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Subject: [RFC PATCH v5 5/6] ARM: dts: exynos: Add interconnects to
 Exynos4412 mixer
Date: Fri, 29 May 2020 18:31:59 +0200
Message-Id: <20200529163200.18031-6-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200529163200.18031-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOKsWRmVeSWpSXmKPExsWy7djP87oylhfjDKb2q1rcn9fKaLFxxnpW
 i+tfnrNaXPn6ns1i+t5NbBaT7k9gsTh/fgO7xabH11gtLu+aw2Yx4/w+Jou1R+6yW9xuXMFm
 cfhNO6vFjMkv2Rz4PDat6mTzuHNtD5vH/e7jTB6bl9R79G1ZxejxeZNcAFsUl01Kak5mWWqR
 vl0CV0bbqpiCbo6KLdPfMjYw3mfrYuTkkBAwkZje38TaxcjFISSwglHi9rRljBDOF0aJqZdu
 QWU+M0qcaXvCDtMy82o7E0RiOaPEgt0XmeBaLv86zgJSxSZgKNF7tI8RxBYRcJFoezqPBaSI
 WWAPk8S+2e/AioQFQiW+/voOVsQioCrxe2Yv2ApeAWuJO0t3M0Ksk5dYveEAM4jNKWAj0f1n
 BjNEjaDEyZlPwOYwA9U0b53NDLJAQuAWu8T5h9uhml0kFl/fDvWqsMSr41ugfpCROD25hwWi
 oZlRomf3bXYIZwKjxP3jC6C6gc449wuomwNohabE+l36EGFHiZY7bewgYQkBPokbbwUhjuCT
 mLRtOjNEmFeio00IolpF4veq6UwQtpRE95P/LBC2h8S+/U8ZJzAqzkLyziwk78xC2LuAkXkV
 o3hqaXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYPI6/e/4lx2Mu/4kHWIU4GBU4uGt0LoYJ8Sa
 WFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjNIcLErivMaLXsYKCaQnlqRmp6YW
 pBbBZJk4OKUaGEN7zmbPDnNZ7rfp2ELDupn2jMJt7T3XM9/5+oul7eCNPcXMmH71/m0NeUlu
 69yjKrKvVZo2hT/zz3l6zO5qY41ErdyLthdX/r7zSFXTZthhutdSUtsmdedh1srWsEWr4p7r
 G3Xxz2y0KGbg0TebUB8np/9h9YI1O39yfwjesHJSAs+i+ur5SizFGYmGWsxFxYkA0juTSVoD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xu7oylhfjDE7uZLO4P6+V0WLjjPWs
 Fte/PGe1uPL1PZvF9L2b2Cwm3Z/AYnH+/AZ2i02Pr7FaXN41h81ixvl9TBZrj9xlt7jduILN
 4vCbdlaLGZNfsjnweWxa1cnmcefaHjaP+93HmTw2L6n36NuyitHj8ya5ALYoPZui/NKSVIWM
 /OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYy2VTEF3RwVW6a/ZWxg
 vM/WxcjJISFgIjHzajtTFyMXh5DAUkaJJZPvAiU4gBJSEvNblCBqhCX+XOtig6j5xCjxacEr
 RpAEm4ChRO/RPjBbRMBD4lTrWlaQImaBE0wST3o3gm0QFgiWeDDzNyuIzSKgKvF7Zi87iM0r
 YC1xZ+luRogN8hKrNxxgBrE5BWwkuv/MALOFgGraHs9ihagXlDg58wkLyHHMAuoS6+cJgYSZ
 gVqbt85mnsAoOAtJ1SyEqllIqhYwMq9iFEktLc5Nzy020itOzC0uzUvXS87P3cQIjMZtx35u
 2cHY9S74EKMAB6MSD+8FnYtxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7E
 aAr02kRmKdHkfGCiyCuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnV
 wKggfNR7/70FOQ1Hqpdt9zj4cPluX740pqfSE5y2XhFaku4WcOHabKe/R6qFTCuOuO5ZIbhC
 Jt7V9KHerdDoFa5fWbQ6Kp+7rq3QcGI60RKwU/uUW7joVQMmSdmD78W5glwyrjOmBs6Y2DKn
 tOrc3j9Xzqu9z66+FvjinI6T+VHd88bb2oU7BJVYijMSDbWYi4oTAeYuJA3cAgAA
X-CMS-MailID: 20200529163228eucas1p1d05340fef9ffc724f5d3d9f5709a600f
X-Msg-Generator: CA
X-RootMTR: 20200529163228eucas1p1d05340fef9ffc724f5d3d9f5709a600f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200529163228eucas1p1d05340fef9ffc724f5d3d9f5709a600f
References: <20200529163200.18031-1-s.nawrocki@samsung.com>
 <CGME20200529163228eucas1p1d05340fef9ffc724f5d3d9f5709a600f@eucas1p1.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
 sw0312.kim@samsung.com, a.swigon@samsung.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, myungjoo.ham@samsung.com, s.nawrocki@samsung.com,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
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
dHVybnMgdGhlIHJpZ2h0IHBhdGguCgpTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5z
d2lnb25Ac2Ftc3VuZy5jb20+ClJldmlld2VkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBz
YW1zdW5nLmNvbT4KLS0tCkNoYW5nZXMgZm9yIHY1OgogLSBub25lLgotLS0KIGFyY2gvYXJtL2Jv
b3QvZHRzL2V4eW5vczQ0MTIuZHRzaSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpIGIvYXJj
aC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCmluZGV4IGE3NDk2ZDMuLmVlZTg2ZDIgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kKQEAgLTc3Niw2ICs3NzYsNyBAQAogCWNsb2NrLW5h
bWVzID0gIm1peGVyIiwgImhkbWkiLCAic2Nsa19oZG1pIiwgInZwIjsKIAljbG9ja3MgPSA8JmNs
b2NrIENMS19NSVhFUj4sIDwmY2xvY2sgQ0xLX0hETUk+LAogCQkgPCZjbG9jayBDTEtfU0NMS19I
RE1JPiwgPCZjbG9jayBDTEtfVlA+OworCWludGVyY29ubmVjdHMgPSA8JmJ1c19kaXNwbGF5ICZi
dXNfZG1jPjsKIH07CiAKICZwbXUgewotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
