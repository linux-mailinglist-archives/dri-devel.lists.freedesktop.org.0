Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE1B8BDC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93EC6F4FE;
	Fri, 20 Sep 2019 07:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56B56F975
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:23:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190919142330euoutp01498a49cbb497dc11cb661b0072d93748~F3PnKoJ3Q2320923209euoutp01H
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:23:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190919142330euoutp01498a49cbb497dc11cb661b0072d93748~F3PnKoJ3Q2320923209euoutp01H
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190919142330eucas1p1f715b753b2134f8715c31ad53ceeba37~F3PmtgJcX1885218852eucas1p1c;
 Thu, 19 Sep 2019 14:23:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id AB.0C.04469.16F838D5; Thu, 19
 Sep 2019 15:23:29 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190919142329eucas1p299762f99dd55a5d625633ceec84219f9~F3PlxHo1y3081230812eucas1p2m;
 Thu, 19 Sep 2019 14:23:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190919142328eusmtrp1e7e9e485ce2ebd973b537efbd222d550~F3Plimzbc0555105551eusmtrp1g;
 Thu, 19 Sep 2019 14:23:28 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-17-5d838f6124d1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 25.65.04117.06F838D5; Thu, 19
 Sep 2019 15:23:28 +0100 (BST)
Received: from AMDC3555.digital.local (unknown [106.120.51.67]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190919142328eusmtip15930d3c33f56712647f28e35c4242502~F3Pkv2Ktx3032330323eusmtip14;
 Thu, 19 Sep 2019 14:23:27 +0000 (GMT)
From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 08/11] arm: dts: exynos: Add parents and
 #interconnect-cells to Exynos4412
Date: Thu, 19 Sep 2019 16:22:33 +0200
Message-Id: <20190919142236.4071-9-a.swigon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919142236.4071-1-a.swigon@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+93X7qTJdQqeTHqsgl66yoJfGJYUcaF/gkohk1p609JZ7frI
 +qOlGFnOTPOtKWW2pqJOywdWtoZLfAwrLUib9CAUUktFBZWc1x7/fc453+95wGFJpYP2Ys/G
 xAq6GE20inGhnrbN2H00t5NDt7V3qrGl7YkMO+6lIFybV03j9xPfaVxi7abxu8lRBuc+MzM4
 05FBYbu9RoaNAz9pbP7SR+O3zUUMHjdYEc6zPydwlXVAhj9eMzI4L2uI2efGm02pDN/f18Lw
 jls2gq8ru8rXjjQS/MuRFoJPrzchfty86jB73GVPuBB9Nl7QqQNOuUSO9HfTF6wrLjVM3af1
 KMPjJpKzwO2ENP0UcRO5sErOiOBB5iAjBRMIXtytJaVgHIHeYif+WHobDUuWRwgMhiryr2Wk
 q5xyqhguEDKzB2XOggdnRZBVOko5A5IrIyC90E46Ve5cGJjSpheZ4jaAqb+cdrKCw1Az1stI
 81ZDRU3rokbO7YaJ5yWUpHGD9vyvi0wuaJKfFJKSPpWF8mfnJD4AX/p7lvq4w7CtXiaxN3Rk
 pVESi/CtyUE7lwNOj8Bcbl1q5A+vbD0LBXZhwCaoblZL6UC4Xpkrc6aBc4UPP9ykFVwh82ku
 KaUVcOO6UkIVNOe7SkaApIq+pd48TKZ2EhlobcF/txT8d0vBv7GliDQhTyFO1EYI4vYYIcFX
 1GjFuJgI37DzWjNaeLuOeduvRjT55rQFcSxSLVesSUgOVdKaeDFRa0HAkioPRdGupFClIlyT
 eFnQnT+pi4sWRAtayVIqT8WVZYMhSi5CEytECcIFQfenSrByLz3au784I33w4Py6uxWd3Kr0
 1zNbPx36uT4o6chQ8MYmuJiDWw5u3nKsWjtXeWf2RMq09Y1vXXjrXPFD/6MB96YbgoN2B+Z/
 19oeljxOaugzqtunBD+f4AfyyrYzMKYO0WUb5DrTax+Pz+0nc2aj56NWdyHuQN1n7wSvmTJj
 4LDfjmAVJUZqtm8mdaLmN5oPPI9yAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xu7oJ/c2xBj82G1ocOraV3eL+vFZG
 i40z1rNaXP/ynNVi/pFzrBZXvr5ns5i+dxObxaT7E1gszp/fwG6x4u5HVotNj6+xWlzeNYfN
 4nPvEUaLGef3MVmsPXKX3eJ24wo2ixmTX7I5CHpsWtXJ5nHn2h42j/vdx5k8Ni+p99j4bgeT
 x8F3e5g8+rasYvT4vEkugCNKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnf
 ziYlNSezLLVI3y5BL+PdnXOsBUckK7Z/X8TawDhBpIuRk0NCwETi6o5epi5GLg4hgaWMEqde
 vmaHSEhIfFx/gxXCFpb4c62LDaLoE6PE7UnPWUASbAKOEpOmPmAHSYgInGKU2Lr8HFgVs8AG
 JonlT18CtXNwCAskStw/4QDSwCKgKrHqzjKwqbwCFhIbPlxlg9ggL7F6wwFmEJtTwFLiy775
 YAuEgGrmPp7LCFEvKHFy5hMWkJHMAuoS6+cJgYSZgVqbt85mnsAoOAtJ1SyEqllIqhYwMq9i
 FEktLc5Nzy020itOzC0uzUvXS87P3cQIjOFtx35u2cHY9S74EKMAB6MSD69CeXOsEGtiWXFl
 7iFGCQ5mJRHeOaZNsUK8KYmVValF+fFFpTmpxYcYTYFem8gsJZqcD0wveSXxhqaG5haWhubG
 5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGDl1WDT+Rb83zPa1cft/o/25Z94rkxOP
 Vlgz2l/Xyjb8vnYK+7nzd3lF1ifM33SisXpWyXP9d7kz+f/JBxoyT41ZdcDRWmJq0Ztg2W1F
 vy+es5tted1I4Fqw5kzRe5N12qLf5CaGODvwTwpYFX63kXv6pk8HdX48CDi29VhqhJtJ7sLd
 BzM+qyuxFGckGmoxFxUnAgAbkcaK9wIAAA==
X-CMS-MailID: 20190919142329eucas1p299762f99dd55a5d625633ceec84219f9
X-Msg-Generator: CA
X-RootMTR: 20190919142329eucas1p299762f99dd55a5d625633ceec84219f9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190919142329eucas1p299762f99dd55a5d625633ceec84219f9
References: <20190919142236.4071-1-a.swigon@samsung.com>
 <CGME20190919142329eucas1p299762f99dd55a5d625633ceec84219f9@eucas1p2.samsung.com>
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568903010;
 bh=4kG6qE0VCmH9gQI7bgdBe+khJWWomB1XqLRfnIX4VG8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KOINmmmKaPK8aJILecaUTQWIITuNNeEWgbhCu7FUqXien5IZQybeJaViYUzuYVSIH
 +QcEdf3tdIP73znI6kvqkMFkt8wUZfj2DVUlvm+PAF5/5RTLPeP6jIXfk8vTKqGSmM
 xkaRTqJW0lC4QoxDDXSz/Zj2hqjPrywEiCi65vS0=
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
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>,
 b.zolnierkie@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 georgi.djakov@linaro.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRuZXIuc2Ftc3VuZy5jb20+CgpUaGlz
IHBhdGNoIGFkZHMgdHdvIGZpZWxkcyB0byB0aGUgRXh5bm9zNDQxMiBEVFM6CiAgLSBwYXJlbnQ6
IHRvIGRlY2xhcmUgY29ubmVjdGlvbnMgYmV0d2VlbiBub2RlcyB0aGF0IGFyZSBub3QgaW4gYQog
ICAgcGFyZW50LWNoaWxkIHJlbGF0aW9uIGluIGRldmZyZXE7CiAgLSAjaW50ZXJjb25uZWN0LWNl
bGxzOiByZXF1aXJlZCBieSB0aGUgaW50ZXJjb25uZWN0IGZyYW1ld29yay4KClBsZWFzZSBub3Rl
IHRoYXQgI2ludGVyY29ubmVjdC1jZWxscyBpcyBhbHdheXMgemVybyBhbmQgbm9kZSBJRHMgYXJl
IG5vdApoYXJkY29kZWQgYW55d2hlcmUuIFRoZSBhYm92ZS1tZW50aW9uZWQgcGFyZW50LWNoaWxk
IHJlbGF0aW9uIGluIGRldmZyZXEKbWVhbnMgdGhhdCB0aGVyZSBpcyBhIHNoYXJlZCBwb3dlciBs
aW5lICgnZGV2ZnJlcScgcHJvcGVydHkpLiBUaGUgJ3BhcmVudCcKcHJvcGVydHkgb25seSBzaWdu
aWZpZXMgYW4gaW50ZXJjb25uZWN0IGNvbm5lY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBBcnR1ciDF
mndpZ2/FhCA8YS5zd2lnb25AcGFydG5lci5zYW1zdW5nLmNvbT4KLS0tCiBhcmNoL2FybS9ib290
L2R0cy9leHlub3M0NDEyLW9kcm9pZC1jb21tb24uZHRzaSB8IDEgKwogYXJjaC9hcm0vYm9vdC9k
dHMvZXh5bm9zNDQxMi5kdHNpICAgICAgICAgICAgICAgfCA5ICsrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
ZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0
NDEyLW9kcm9pZC1jb21tb24uZHRzaQppbmRleCBlYTU1ZjM3N2QxN2MuLmJkZDYxYWU4NjEwMyAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0
c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kK
QEAgLTEwNiw2ICsxMDYsNyBAQAogJmJ1c19sZWZ0YnVzIHsKIAlkZXZmcmVxLWV2ZW50cyA9IDwm
cHBtdV9sZWZ0YnVzXzM+LCA8JnBwbXVfcmlnaHRidXNfMz47CiAJdmRkLXN1cHBseSA9IDwmYnVj
azNfcmVnPjsKKwlwYXJlbnQgPSA8JmJ1c19kbWM+OwogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAK
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQppbmRleCBkMjBkYjJkZmU4ZTIuLmE3MGE2NzFhY2Fj
ZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCisrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQpAQCAtMzkwLDYgKzM5MCw3IEBACiAJCQlj
bG9ja3MgPSA8JmNsb2NrIENMS19ESVZfRE1DPjsKIAkJCWNsb2NrLW5hbWVzID0gImJ1cyI7CiAJ
CQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZidXNfZG1jX29wcF90YWJsZT47CisJCQkjaW50ZXJj
b25uZWN0LWNlbGxzID0gPDA+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsKIApAQCAt
Mzk4LDYgKzM5OSw3IEBACiAJCQljbG9ja3MgPSA8JmNsb2NrIENMS19ESVZfQUNQPjsKIAkJCWNs
b2NrLW5hbWVzID0gImJ1cyI7CiAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZidXNfYWNwX29w
cF90YWJsZT47CisJCQkjaW50ZXJjb25uZWN0LWNlbGxzID0gPDA+OwogCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKIAkJfTsKIApAQCAtNDA2LDYgKzQwOCw3IEBACiAJCQljbG9ja3MgPSA8JmNsb2Nr
IENMS19ESVZfQzJDPjsKIAkJCWNsb2NrLW5hbWVzID0gImJ1cyI7CiAJCQlvcGVyYXRpbmctcG9p
bnRzLXYyID0gPCZidXNfZG1jX29wcF90YWJsZT47CisJCQkjaW50ZXJjb25uZWN0LWNlbGxzID0g
PDA+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsKIApAQCAtNDU5LDYgKzQ2Miw3IEBA
CiAJCQljbG9ja3MgPSA8JmNsb2NrIENMS19ESVZfR0RMPjsKIAkJCWNsb2NrLW5hbWVzID0gImJ1
cyI7CiAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZidXNfbGVmdGJ1c19vcHBfdGFibGU+Owor
CQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJ
CX07CiAKQEAgLTQ2Nyw2ICs0NzEsNyBAQAogCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfRElWX0dE
Uj47CiAJCQljbG9jay1uYW1lcyA9ICJidXMiOwogCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwm
YnVzX2xlZnRidXNfb3BwX3RhYmxlPjsKKwkJCSNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8MD47CiAJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9OwogCkBAIC00NzUsNiArNDgwLDcgQEAKIAkJCWNs
b2NrcyA9IDwmY2xvY2sgQ0xLX0FDTEsxNjA+OwogCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsKIAkJ
CW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19kaXNwbGF5X29wcF90YWJsZT47CisJCQkjaW50
ZXJjb25uZWN0LWNlbGxzID0gPDA+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsKIApA
QCAtNDgzLDYgKzQ4OSw3IEBACiAJCQljbG9ja3MgPSA8JmNsb2NrIENMS19BQ0xLMTMzPjsKIAkJ
CWNsb2NrLW5hbWVzID0gImJ1cyI7CiAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZidXNfZnN5
c19vcHBfdGFibGU+OworCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKIAkJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7CiAJCX07CiAKQEAgLTQ5MSw2ICs0OTgsNyBAQAogCQkJY2xvY2tzID0gPCZj
bG9jayBDTEtfQUNMSzEwMD47CiAJCQljbG9jay1uYW1lcyA9ICJidXMiOwogCQkJb3BlcmF0aW5n
LXBvaW50cy12MiA9IDwmYnVzX3Blcmlfb3BwX3RhYmxlPjsKKwkJCSNpbnRlcmNvbm5lY3QtY2Vs
bHMgPSA8MD47CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9OwogCkBAIC00OTksNiArNTA3
LDcgQEAKIAkJCWNsb2NrcyA9IDwmY2xvY2sgQ0xLX1NDTEtfTUZDPjsKIAkJCWNsb2NrLW5hbWVz
ID0gImJ1cyI7CiAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZidXNfbGVmdGJ1c19vcHBfdGFi
bGU+OworCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7CiAJCX07CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
