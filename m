Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731542A05E6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 13:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1506EDE1;
	Fri, 30 Oct 2020 12:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACDD6EDD7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 12:53:19 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201030125307euoutp01e371f7625eb11b98f30d1e792b3923e9~Cxj46Xqrc0058100581euoutp01M
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 12:53:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201030125307euoutp01e371f7625eb11b98f30d1e792b3923e9~Cxj46Xqrc0058100581euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604062387;
 bh=fet2ponKEy0YryCgB52D90pw902HEnhsqFlkHJ+BVEw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g82N4CStuHohnB0OcP5opOShUqTVp9UKyx0PSs6Z8VcRZCwihq+7EGEyldtUNXF50
 fcUyf/664Xfr6VR+n7gDbS4hgD7EknC/WtriYQBVLPiALH3pMqZCo4KYvmk5YXIxe/
 o/1T3lWx+wRiLh+c3U7a46YzBgEusKOYWiqXPZZs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201030125307eucas1p261962324a2a441dccc971c9d14835091~Cxj4pR8UA1110711107eucas1p2c;
 Fri, 30 Oct 2020 12:53:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 50.16.06456.3BC0C9F5; Fri, 30
 Oct 2020 12:53:07 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201030125307eucas1p14afc8cc8828f2bc838e769b77d7e9c95~Cxj4PGG_12028320283eucas1p16;
 Fri, 30 Oct 2020 12:53:07 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201030125307eusmtrp112e4707551c707b5ca2e7e864601955a~Cxj4H7ndB0319303193eusmtrp1C;
 Fri, 30 Oct 2020 12:53:07 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-ee-5f9c0cb35a61
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 0D.3A.06314.2BC0C9F5; Fri, 30
 Oct 2020 12:53:06 +0000 (GMT)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201030125306eusmtip2a9849176234987f2c2631d75b9758f26~Cxj3cVLtp1523015230eusmtip2-;
 Fri, 30 Oct 2020 12:53:06 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Subject: [PATCH v7 5/6] ARM: dts: exynos: Add interconnects to Exynos4412 mixer
Date: Fri, 30 Oct 2020 13:51:48 +0100
Message-Id: <20201030125149.8227-6-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201030125149.8227-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNKsWRmVeSWpSXmKPExsWy7djPc7qbeebEG/w5KGNxf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C3uLxrDpvF594jjBYzzu9jslh75C67
 xe3GFWwWrXuPsFscftPOajFj8ks2BwGPTas62TzuXNvD5nG/+ziTR9+WVYwenzfJBbBGcdmk
 pOZklqUW6dslcGX8fHCSuWAyR8WsDw9ZGxifsnUxcnJICJhIfGmdwNTFyMUhJLCCUaJlw39W
 COcLo8SOactZIJzPjBJfdq1igWn5fHQ5VNVyoMSnhUxwLac33werYhMwlOg92scIYosIuEi0
 PZ0HFmcWeMQk0TyfGcQWFgiUaDq4E6yGRUBV4s7EC2BH8QpYSRw6N4UJYpu8xOoNB8DqOQWs
 Jbo6bzBB1AhKnJz5BGqmvETz1tnMIEdICLxkl2icCrKYA8hxkZjREQkxR1ji1fEt7BC2jMTp
 yT0sEPXNjBI9u2+zQzgTGCXuH1/ACFFlLXHn3C82kEHMApoS63fpQ8x0lLgwXxTC5JO48VYQ
 4gQ+iUnbpjNDhHklOtqEIGaoSPxeNR3qEymJ7if/oWHoIfFi1XnWCYyKs5A8MwvJM7MQ1i5g
 ZF7FKJ5aWpybnlpsmJdarlecmFtcmpeul5yfu4kRmMRO/zv+aQfj10tJhxgFOBiVeHgd5GfH
 C7EmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQozQHi5I4r/Gil7FCAumJJanZ
 qakFqUUwWSYOTqkGxpy/qf6hCbvjHHeov3B7arul8WqrMLP08gLTwmUBDTwxT+rWT4059P8i
 X0jW2kqOZfPu69+121b975rNvcl1ztPrmCJOWM19k253StDUgO33/PsWYfrzFFZWH7Yykbja
 Lq4n1Dd12/X1Cy8bxq1wl4+3tgzg/LP35ZK7Vgy3Kuvlgk4/auj8qcRSnJFoqMVcVJwIAJt+
 ou5eAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsVy+t/xe7qbeObEGxx9bmNxf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C3uLxrDpvF594jjBYzzu9jslh75C67
 xe3GFWwWrXuPsFscftPOajFj8ks2BwGPTas62TzuXNvD5nG/+ziTR9+WVYwenzfJBbBG6dkU
 5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GX8fHCSuWAy
 R8WsDw9ZGxifsnUxcnJICJhIfD66nBXEFhJYyigx53VxFyMHUFxKYn6LEkSJsMSfa11A5VxA
 JZ8YJXYu7mUBSbAJGEr0Hu1jBLFFBDwkTrWuZQUpYhb4wCSx9kEvWEJYwF9i/b5vYA0sAqoS
 dyZeAFvMK2AlcejcFCaIDfISqzccYAaxOQWsJbo6bzCBHCEEVPP2QBVEuaDEyZlPWEDCzALq
 EuvnCYGEmYE6m7fOZp7AKDgLSdUshKpZSKoWMDKvYhRJLS3OTc8tNtQrTswtLs1L10vOz93E
 CIzLbcd+bt7BeGlj8CFGAQ5GJR5eB/nZ8UKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqP
 LyrNSS0+xGgK9NlEZinR5HxgysgriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBa
 BNPHxMEp1cBYbXM2em/v1N0qGcdnvniteso04KfhswUl57POXj502/WnY4K7/Mvyqk9KvwXX
 TzxV53a69EXB+xKJTA3FA2Yl4TYFPxXOdCwL3xMXV8ZXHuo6QXXVHoXAPec2S3cfP2u2onjl
 tr8P0jiTLbjkJtVMfZy4P+BnzeNjPleSfdPdn6xYPPHyvJz/SizFGYmGWsxFxYkAyWvH7uEC
 AAA=
X-CMS-MailID: 20201030125307eucas1p14afc8cc8828f2bc838e769b77d7e9c95
X-Msg-Generator: CA
X-RootMTR: 20201030125307eucas1p14afc8cc8828f2bc838e769b77d7e9c95
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201030125307eucas1p14afc8cc8828f2bc838e769b77d7e9c95
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125307eucas1p14afc8cc8828f2bc838e769b77d7e9c95@eucas1p1.samsung.com>
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
 s.nawrocki@samsung.com, m.szyprowski@samsung.com
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
YW1zdW5nLmNvbT4KLS0tCkNoYW5nZXMgZm9yIHY3LCB2NiwgdjU6CiAtIG5vbmUuCi0tLQogYXJj
aC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0
c2kgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kKaW5kZXggNDk5OWU2OC4uZDA3
NzM5ZSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCisrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQpAQCAtNzc5LDYgKzc3OSw3IEBACiAJ
Y2xvY2stbmFtZXMgPSAibWl4ZXIiLCAiaGRtaSIsICJzY2xrX2hkbWkiLCAidnAiOwogCWNsb2Nr
cyA9IDwmY2xvY2sgQ0xLX01JWEVSPiwgPCZjbG9jayBDTEtfSERNST4sCiAJCSA8JmNsb2NrIENM
S19TQ0xLX0hETUk+LCA8JmNsb2NrIENMS19WUD47CisJaW50ZXJjb25uZWN0cyA9IDwmYnVzX2Rp
c3BsYXkgJmJ1c19kbWM+OwogfTsKIAogJnBtdSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
