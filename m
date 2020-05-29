Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43511E83D7
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 18:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AD66E94A;
	Fri, 29 May 2020 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F836E949
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 16:38:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200529163227euoutp018eacad6c0e377c9256107f457a2c41b7~TjNa2OvKm0993009930euoutp011
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 16:32:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200529163227euoutp018eacad6c0e377c9256107f457a2c41b7~TjNa2OvKm0993009930euoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1590769947;
 bh=aOkXOEugUHwjOCVLx2Nrtt8w2k9Ic4QcV2hJ3HCE3tk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QzCT6Xl28JPgpyIgi2ldcaogHlrj0C0YSN1qpZVrjMOkax//hbbm1Z8VJJ0Ob8cbz
 F9v+uGBEVwsfLgRa7o3vDGr1bFdC/LWYEKa93Exgpow5dNkO3bfMStLuZrXAT5Wde8
 zLIg9fC+uq7nv5Oxpqr7CANFMI+cQvOR77fXo71g=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200529163226eucas1p24f7eae2628271288993939d46f242a77~TjNaoPgPU2034120341eucas1p2d;
 Fri, 29 May 2020 16:32:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 5B.5D.61286.A1931DE5; Fri, 29
 May 2020 17:32:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200529163226eucas1p15bea74bed9cc5d22727c9ba732a5cbb9~TjNaXhaFB2234422344eucas1p19;
 Fri, 29 May 2020 16:32:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200529163226eusmtrp20b7c58a0710616ddbb4d667991b9a436~TjNaW6c4h0733307333eusmtrp2T;
 Fri, 29 May 2020 16:32:26 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-59-5ed1391a1013
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D1.EA.08375.A1931DE5; Fri, 29
 May 2020 17:32:26 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200529163225eusmtip1f1572a53cc7b48b492dbee6981a4b114~TjNZpb7hR1868718687eusmtip1O;
 Fri, 29 May 2020 16:32:25 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Subject: [RFC PATCH v5 4/6] ARM: dts: exynos: Add interconnect properties to
 Exynos4412 bus nodes
Date: Fri, 29 May 2020 18:31:58 +0200
Message-Id: <20200529163200.18031-5-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200529163200.18031-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTcRjG+e9s5xxHk9MUfJmVOArKUhODjijdlJh9yagMxNvUg0rblM15
 i8q75g0zwjlFV3SxiTnnBfOGl1REalmmgpeVWaFUlpcPmZecR9Fvz/u8v4f/+8CfxIS9PBEZ
 rYhjlAqpTIzzuU19f03OIo+h4JNFZg/aXJGJ6DpNLY8eXfrOo4eX53G6pN2I08XmIi5tMhkI
 2vhlhEd/aCnHaY2pg0PXvJ4k6PHUKpzu+ZHNozUPZvFz1hKj/h4umRhpwyXmvH6OpP7JXUlh
 gx5JFo2H/PAAvlcEI4uOZ5SuZ0L5URkPXxCxWkFidplDCprg5yIrEqhTcL++h5OL+KSQqkLQ
 MJlNsMMSgum6z4gdFhGkaVI4O5HVqcztyHMEhUupu5G1ucYtCqfcoKC3EFm0LeUDWV8ruBYI
 o9o40FH2i2tZ2FDhMKYzbaZJkksdgZe/3Sy2gPIEQ10dl33NAaoNnZhFW1FekLeqwVhmPwyU
 zmwx2CaT3liGsfwUAQbDJVb7QOajzu2rbWCuv4Fg9QHYeFW51QCodAT5reMEOxQhMPfrEEt5
 wsTbFdxyHEYdg9oWV9Y+D/mFrTyLDZQ1jP3cz95gDcVNJRhrCyAnS8jSh+GfvmT7BBHkzWxs
 15LAaLUJL0KO2j1ttHvaaHff1SFMj+wYtUoeyajcFEyCi0oqV6kVkS7hMXIj2vxcg+v9C81o
 +X1YN6JIJN4nSHQaChbypPGqJHk3AhIT2wouvBkMFgoipEnJjDImRKmWMapuZE9yxXYC98ez
 QUIqUhrH3GSYWEa5s+WQVqIUdHTSvqnUv0qdKFnMCAyb9vdG1aGfdEHqpI2Jyuvf+q46J9wY
 9qtZk+fILnoftL3d7jg/Xq4lGgOFC+5pw50zg4qI4NXulo2YE/oqQcHSujHh6TNRwEDQOxt6
 JctweersHU/ngWt/ZGFdybd8A5IcR/M/huC+DceJK2Fdp3N5xmYxVxUldXPClCrpf5Z4tshY
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xu7pSlhfjDPYdULW4P6+V0WLjjPWs
 Fte/PGe1uPL1PZvF9L2b2Cwm3Z/AYnH+/AZ2i02Pr7FaXN41h81ixvl9TBZrj9xlt7jduILN
 4vCbdlaLGZNfsjnweWxa1cnmcefaHjaP+93HmTw2L6n36NuyitHj8ya5ALYoPZui/NKSVIWM
 /OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYyWqSvZC2bxVrTPlm9g
 vMPVxcjJISFgIvHnXitTFyMXh5DAUkaJzq+LWLsYOYASUhLzW5QgaoQl/lzrYoOo+cQosfHW
 X0aQBJuAoUTv0T4wW0TAQ+JU61pWkCJmgRNMEk96N7KBJIQFEiUevF3JDDKURUBVYt0HQ5Aw
 r4C1xIaNG1kgFshLrN5wgBnE5hSwkej+MwPMFgKqaXs8ixWiXlDi5MwnLCBjmAXUJdbPEwIJ
 MwO1Nm+dzTyBUXAWkqpZCFWzkFQtYGRexSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERiL2479
 3LyD8dLG4EOMAhyMSjy8F3QuxgmxJpYVV+YeYpTgYFYS4XU6ezpOiDclsbIqtSg/vqg0J7X4
 EKMp0GcTmaVEk/OBaSKvJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwen
 VAOjR9czHpcaW4a1ySo+O6/uEZgzOdudzX/q6dDKR+0e2/ZJp8zNjf71LItH5f3JZyc8vRlc
 qi5fnL3qzu3nBn8CSl03qDXPZdpfI1AkodRpwW1S2qV9PbHY48Rs1zCrHS+kO29MT5TLDHv8
 b4FK0J3fPU4X8g883/fKYktMZow7i8GRsmMvtZKUWIozEg21mIuKEwGC+1hJ2wIAAA==
X-CMS-MailID: 20200529163226eucas1p15bea74bed9cc5d22727c9ba732a5cbb9
X-Msg-Generator: CA
X-RootMTR: 20200529163226eucas1p15bea74bed9cc5d22727c9ba732a5cbb9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200529163226eucas1p15bea74bed9cc5d22727c9ba732a5cbb9
References: <20200529163200.18031-1-s.nawrocki@samsung.com>
 <CGME20200529163226eucas1p15bea74bed9cc5d22727c9ba732a5cbb9@eucas1p1.samsung.com>
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

VGhpcyBwYXRjaCBhZGRzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyBmb3IgRXh5bm9zNDQxMiBp
bnRlcmNvbm5lY3QKYnVzIG5vZGVzOgogLSBzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQ6IHRv
IGRlY2xhcmUgY29ubmVjdGlvbnMgYmV0d2VlbgogICBub2RlcyBpbiBvcmRlciB0byBndWFyYW50
ZWUgUE0gUW9TIHJlcXVpcmVtZW50cyBiZXR3ZWVuIG5vZGVzOwogLSAjaW50ZXJjb25uZWN0LWNl
bGxzOiByZXF1aXJlZCBieSB0aGUgaW50ZXJjb25uZWN0IGZyYW1ld29yay4KCk5vdGUgdGhhdCAj
aW50ZXJjb25uZWN0LWNlbGxzIGlzIGFsd2F5cyB6ZXJvIGFuZCBub2RlIElEcyBhcmUgbm90Cmhh
cmRjb2RlZCBhbnl3aGVyZS4KClNpZ25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdv
bkBzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3Jv
Y2tpQHNhbXN1bmcuY29tPgotLS0KQ2hhbmdlcyBmb3IgdjU6CiAtIGFkanVzdCB0byByZW5hbWVk
IGV4eW5vcyxpbnRlcmNvbm5lY3QtcGFyZW50LW5vZGUgcHJvcGVydHksCiAtIGFkZCBwcm9wZXJ0
aWVzIGluIGNvbW1vbiBleHlub3M0NDEyLmR0c2kgZmlsZSByYXRoZXIgdGhhbgogICBpbiBPZHJv
aWQgc3BlY2lmaWMgb2Ryb2lkNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kuCi0tLQogYXJjaC9hcm0v
Ym9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRz
aSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaQppbmRleCA0ODg2ODk0Li5hNzQ5
NmQzIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kKKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpCkBAIC0zODEsNiArMzgxLDcgQEAKIAkJ
CWNsb2NrcyA9IDwmY2xvY2sgQ0xLX0RJVl9ETUM+OwogCQkJY2xvY2stbmFtZXMgPSAiYnVzIjsK
IAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19kbWNfb3BwX3RhYmxlPjsKKwkJCSNpbnRl
cmNvbm5lY3QtY2VsbHMgPSA8MD47CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9OwogCkBA
IC00NTAsNiArNDUxLDggQEAKIAkJCWNsb2NrcyA9IDwmY2xvY2sgQ0xLX0RJVl9HREw+OwogCQkJ
Y2xvY2stbmFtZXMgPSAiYnVzIjsKIAkJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmJ1c19sZWZ0
YnVzX29wcF90YWJsZT47CisJCQlzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQgPSA8JmJ1c19k
bWM+OworCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7CiAJCX07CiAKQEAgLTQ2Niw2ICs0NjksOCBAQAogCQkJY2xvY2tzID0gPCZjbG9jayBDTEtf
QUNMSzE2MD47CiAJCQljbG9jay1uYW1lcyA9ICJidXMiOwogCQkJb3BlcmF0aW5nLXBvaW50cy12
MiA9IDwmYnVzX2Rpc3BsYXlfb3BwX3RhYmxlPjsKKwkJCXNhbXN1bmcsaW50ZXJjb25uZWN0LXBh
cmVudCA9IDwmYnVzX2xlZnRidXM+OworCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKIAkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
