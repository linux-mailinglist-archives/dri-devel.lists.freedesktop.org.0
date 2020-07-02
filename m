Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A90E2129B9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 18:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FB26EB2A;
	Thu,  2 Jul 2020 16:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6D26EB2A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 16:38:00 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200702163758euoutp016fed5257b82af91bc505d8bddc4ba9be~d-N9C_Ft61548815488euoutp01A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 16:37:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200702163758euoutp016fed5257b82af91bc505d8bddc4ba9be~d-N9C_Ft61548815488euoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593707879;
 bh=qN7gRsF1kjmKcFbEWpr933ax6DRMuFS/ibl+GWK81pU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SkFRU1pomKmHhR5zOgR6egnfekASSD1Hbl+mEbjPUwBdRmZeQJ/onBVx1MIEHCMsK
 t2I+IgXY9r2thmn7DEmMZWM3dlsVfuC/uhasNNI/esEC2B8gNH9X0irVzb5V4bljMI
 a5g68HhyCSnY0azsFCOBw28a5z9UNFHza/yyI/8s=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200702163758eucas1p117788b2c4926de912805887398959a09~d-N8kvwYH0768907689eucas1p1v;
 Thu,  2 Jul 2020 16:37:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 65.6A.06318.66D0EFE5; Thu,  2
 Jul 2020 17:37:58 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200702163758eucas1p1e18d95f3dce34df1f4334da5462a04a2~d-N8Oyjjf0151101511eucas1p1H;
 Thu,  2 Jul 2020 16:37:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200702163758eusmtrp1addaf8abf74460dba058d495bbc01255~d-N8OIIX61333013330eusmtrp1-;
 Thu,  2 Jul 2020 16:37:58 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-5b-5efe0d66a914
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id EE.F9.06017.66D0EFE5; Thu,  2
 Jul 2020 17:37:58 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200702163757eusmtip2c12b8db80e1ebc176525229fcd1bac83~d-N7efCvU2919929199eusmtip2C;
 Thu,  2 Jul 2020 16:37:57 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Subject: [PATCH RFC v6 5/6] ARM: dts: exynos: Add interconnects to
 Exynos4412 mixer
Date: Thu,  2 Jul 2020 18:37:23 +0200
Message-Id: <20200702163724.2218-6-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702163724.2218-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTmt3t3d10tr1PwYNJj5B891MzCHzkie8D+qBBBoiht6m2aTm1X
 LfdHbytbiqjko7B3iVHa0lHWVOZqmuQkXUUayxe5yAVtJlpazrse/33nO993vnPg0IS0VxhE
 p2XmsJpMZYaMEpOGF1PW0IOS2YS1122A7TUFCD+srBfit+5PQnzV3C3EfRNfKVxh1FO41F5C
 Yqu1QYT1w2+EuLf5CoVdRWaEK60tAnzf/EGE+0/WUrjAaBbh9i/nhLiyzEFt9lPo6wopxcCb
 Z5TCrrMIFI9uHVcUN9YhhUu/JJbaK5ansBlpeawmfNMBceq98mPZRfRR3eSeE2iIuoB8aGDW
 Q890EXkBiWkpU4tAV95C8YUbQVNbq4AvXAhaB43CP5Y7BZe8lrsI+p8Mkn8tbluHyKOimAgo
 el6MPDiA2QZnR2vmRQRzngDD41LC0/Bn4sHRPjQ/lmRCYKamcJ6XMBuh1jYu4uOWwr2Gtjme
 pn2YaGh3SXiJH3RWjZAeTMxJTjddJjzzgRkXgfuj2+vdBvfPOEke+8NnS6OXD4ausoskbziN
 4OLTfhFflCCwW64hXhUNA93TlCeZYFZCfXO4BwITAx12NQ8XwbtxP36HRVBqqCB4WgLnz0r5
 GSvgR12FgMdBoBv55d1GAbVlk4IStLz6v2uq/7um+l/sNUTUoUA2l1OrWC4ykz0SxinVXG6m
 Kiw5S61Hc6/WNWuZeIxafiaZEEMj2ULJWOdMglSozOPy1SYENCELkGx51ZUglaQo87WsJitR
 k5vBcia0mCZlgZLIG479UkalzGHTWTab1fzpCmifoBOIKWk0v6wvDpdTocZdx5NWhGstC4LF
 vuQ+o0OeWvWa3l0adsOZHvGt+vDtvo5lcRvytvjKU9es21NlitrB7TQQ1pj0eEqV/GDml8kY
 dCo2zhnVHaP+MZT//tTNAVqbaKBXjw6PTTmfLJk9NKS0fb8aGZKicZQzPYR4wrI1a7tWRnKp
 yohVhIZT/gZWTv82ZgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xe7ppvP/iDFr7mC3uz2tltNg4Yz2r
 xfUvz1kt5h85x2px5et7NovpezexWUy6P4HF4vz5DewWmx5fY7W4vGsOm8Xn3iOMFjPO72Oy
 WHvkLrvF7cYVbBate4+wWxx+085qMWPySzYHQY9NqzrZPO5c28Pmcb/7OJPH5iX1Hn1bVjF6
 fN4kF8AWpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+X
 oJexekpdQS9HRff3yAbGR2xdjJwcEgImEstap7F0MXJxCAksZZT4+XgVkMMBlJCSmN+iBFEj
 LPHnWhcbRM0nRomrj1cwgiTYBAwleo/2gdkiAh4Sp1rXsoLYzAIzmCVOzzIFsYUFgiXmPeph
 BrFZBFQl/s7rBLN5BawkVlx9yw6xQF5i9YYDzCB7OQWsJQ5/5gUJCwGVHOtfwA5RLihxcuYT
 sNOYBdQl1s8TgtgkL9G8dTbzBEbBWUiqZiFUzUJStYCReRWjSGppcW56brGRXnFibnFpXrpe
 cn7uJkZglG479nPLDsaud8GHGAU4GJV4eCcc/xsnxJpYVlyZe4hRgoNZSYTX6ezpOCHelMTK
 qtSi/Pii0pzU4kOMpkCfTWSWEk3OByaQvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZ
 qakFqUUwfUwcnFINjJs/7t9Zse3uM//0g66qbnXulxn3ahTwzi922CV2hr/sTOmFJ2zv+bK1
 vhko/0/my/nNMN/2YYWOj/iesHuPp1RPsI0POjg7me+RGssDd3n2ab52rx1mTOH+VnszeJVV
 nZr/V/4Au8izMZIzOPdZ1KZ1rj67S4rdXzNUkcsyur/hju1px3+FSizFGYmGWsxFxYkAe7DS
 GugCAAA=
X-CMS-MailID: 20200702163758eucas1p1e18d95f3dce34df1f4334da5462a04a2
X-Msg-Generator: CA
X-RootMTR: 20200702163758eucas1p1e18d95f3dce34df1f4334da5462a04a2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200702163758eucas1p1e18d95f3dce34df1f4334da5462a04a2
References: <20200702163724.2218-1-s.nawrocki@samsung.com>
 <CGME20200702163758eucas1p1e18d95f3dce34df1f4334da5462a04a2@eucas1p1.samsung.com>
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
dHVybnMgdGhlIHJpZ2h0IHBhdGguCgpTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5z
d2lnb25Ac2Ftc3VuZy5jb20+ClJldmlld2VkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBz
YW1zdW5nLmNvbT4KLS0tCkNoYW5nZXMgZm9yIHY1LCB2NjoKIC0gbm9uZS4KLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaSBi
L2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQppbmRleCAyNDUyOWQ0Li5lMGJlMTkz
IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kKKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCkBAIC03NzcsNiArNzc3LDcgQEAKIAljbG9j
ay1uYW1lcyA9ICJtaXhlciIsICJoZG1pIiwgInNjbGtfaGRtaSIsICJ2cCI7CiAJY2xvY2tzID0g
PCZjbG9jayBDTEtfTUlYRVI+LCA8JmNsb2NrIENMS19IRE1JPiwKIAkJIDwmY2xvY2sgQ0xLX1ND
TEtfSERNST4sIDwmY2xvY2sgQ0xLX1ZQPjsKKwlpbnRlcmNvbm5lY3RzID0gPCZidXNfZGlzcGxh
eSAmYnVzX2RtYz47CiB9OwoKICZwbXUgewotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
