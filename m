Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282FD2129B7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 18:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22136EB28;
	Thu,  2 Jul 2020 16:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77DA6EB28
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 16:37:58 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200702163757euoutp0134e365b3624a0532e186b5eb51a903f9~d-N7sfj7l1729817298euoutp01T
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 16:37:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200702163757euoutp0134e365b3624a0532e186b5eb51a903f9~d-N7sfj7l1729817298euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593707877;
 bh=PgZSLXZfKGDDVkfwIZQfiOnpY8SRsPagsq4j5xcQtGA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gbv830o+C01jKn4sVLVrR1UMbap7FBD35K/e/w0PvF3Ny9y9TcgoaxsfUkUnMcNlz
 JiFt2rsztasogNg98+dwFBZASY8CtCNRzL0oqaREcXaZTL78CmId5NJP1zS/hnyUZQ
 tOD3LBDF6m7p+AAkAoQ/anR9EvQ2DbN4aOV4UOXU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200702163757eucas1p172597795ac23cfee635714944eebb1bb~d-N7RQWBl0768807688eucas1p19;
 Thu,  2 Jul 2020 16:37:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 44.6A.06318.46D0EFE5; Thu,  2
 Jul 2020 17:37:57 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200702163756eucas1p282c6bc5a61f8dd7b6a5d59d92e92e2f1~d-N6zTiF12602726027eucas1p2j;
 Thu,  2 Jul 2020 16:37:56 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200702163756eusmtrp13e657d5b8537f2e413d7d2a9d6c3c8e6~d-N6yp9d_1333013330eusmtrp18;
 Thu,  2 Jul 2020 16:37:56 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-58-5efe0d64969c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 51.AB.06314.46D0EFE5; Thu,  2
 Jul 2020 17:37:56 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200702163755eusmtip28bd1b5471bd6ae156a0378be19d6b8b0~d-N6FBRho2919929199eusmtip2B;
 Thu,  2 Jul 2020 16:37:55 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: georgi.djakov@linaro.org, cw00.choi@samsung.com, krzk@kernel.org
Subject: [PATCH RFC v6 4/6] ARM: dts: exynos: Add interconnect properties to
 Exynos4412 bus nodes
Date: Thu,  2 Jul 2020 18:37:22 +0200
Message-Id: <20200702163724.2218-5-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702163724.2218-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SazBUYRjH591z2WNnl2O3yYPS2DKNpsRomnfSmGpMsx/7SFNqy5kldtMe
 l/KhCxEbtfGBVkUXk7YLNkkKtVZbI3ZMSEMpMWhSoU10dTq6fPs9z/P/v//nmXkZQvmU8mMS
 DCmc0aBNUtMysu7hjGsVp/gRG3olCA+cy0a4pqSKws8+jVC4zNFB4S73BxoXN9poXDhgJrHL
 VS3Ftjc9FH7acIbGUwUOhEtcTRJ83fFCivuOVNI4u9EhxS3vjlG4pGiM3uCtsVnzaE1/zz1a
 M3DcKdHcvHRIc6LWijRTtoAt9FbZ+jguKSGNM66O3CmL763uJJJveO1vfllDHEYNchPyYIBd
 A6PT48iEGEbJViKoDTQh2Rx+QlBzbYIWiykEg50nqT+GR6OvkDi4jOD2yB301zJbdFMiqGg2
 DApaTyCBF7BRkDN8jhREBJtLQF19ISEMVOxuON/bQgpMskFw9sZ7qcAKdh08f5iHxLglcLX6
 PiHs58FGQMuUQpR4w+PTQ7+txJwk61YpIbwPrFsKF5+YSNEbBe1vy+ZZBW+dtVKRF0FbUT4p
 GrIQ5N/tk4qFGcGAs3w+OQL6O2ZpIZlgg6GqYbXY3gjdX9xSoQ2sJ/SOe4tLeEJhXTEhthWQ
 m6MU1cvgq7VYIrIfHB/6Ob+OBvJLJkkzCrT8d47lv3Ms/3LLEWFFPlwqr9dxfLiBSw/htXo+
 1aAL2b1Xb0NzX63th9Ndj5q+7bIjlkFquWL08fdYJaVN4w/o7QgYQr1Asam9LVapiNMeyOCM
 e3cYU5M43o78GVLtowi/MLZdyeq0KVwixyVzxj9TCePhdxiZV23D0+3xhHzPRHTw2IfI1syE
 O8MqtnGfrCmaqg7tlw+u5GNUVfJW265Mw3JHT2JFptfB5qMPFs5YlgbGdYy8Miwr6yxWN7hK
 J7Vhrz3OBAR1mXzyvlboTmWkL41eu9i/a9PyUVVWkd1/XNlz5XP55MyKkM0xR7rNMb7Jvhkf
 w9UkH68NW0EYee0v6L6xymYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xe7opvP/iDLYulrO4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbbHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFm07j3CbnH4TTurxYzJL9kcBD02repk87hzbQ+bx/3u40wem5fUe/RtWcXo
 8XmTXABblJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5d
 gl7GjQ0XmQvW8Vfsv7eRuYFxF08XIyeHhICJxIkXDxi7GLk4hASWMkr8fvoMyOEASkhJzG9R
 gqgRlvhzrYsNouYTo8TjDx9YQBJsAoYSvUf7GEFsEQEPiVOta1lBbGaBGcwSp2eZgswRFkiU
 mLlAECTMIqAqMXfdO3YQm1fASuLmsU5GiPnyEqs3HGAGKecUsJY4/JkXJCwEVHKsfwFUuaDE
 yZlPWEBKmAXUJdbPE4JYJC/RvHU28wRGwVlIqmYhVM1CUrWAkXkVo0hqaXFuem6xoV5xYm5x
 aV66XnJ+7iZGYJxuO/Zz8w7GSxuDDzEKcDAq8fBOOP43Tog1say4MvcQowQHs5IIr9PZ03FC
 vCmJlVWpRfnxRaU5qcWHGE2BPpvILCWanA9MIXkl8YamhuYWlobmxubGZhZK4rwdAgdjhATS
 E0tSs1NTC1KLYPqYODilGhizGNdceVzJ/NCANzkzy8d5tY5cmweDubvi59n8F0oqT2cxCK9W
 m6TCXOeffv7h6XSh+j+WDq5CmhoTTnG7crlu1OsWsU722ZK8+e//hxWOol+1Pn3PfrBQ9tY6
 uzlBi8/ctbH6N7fG7dIqy8QHzV5H2mp0U3y1Ilj7F5758+TItKufp3QZblJiKc5INNRiLipO
 BABsxMos6QIAAA==
X-CMS-MailID: 20200702163756eucas1p282c6bc5a61f8dd7b6a5d59d92e92e2f1
X-Msg-Generator: CA
X-RootMTR: 20200702163756eucas1p282c6bc5a61f8dd7b6a5d59d92e92e2f1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200702163756eucas1p282c6bc5a61f8dd7b6a5d59d92e92e2f1
References: <20200702163724.2218-1-s.nawrocki@samsung.com>
 <CGME20200702163756eucas1p282c6bc5a61f8dd7b6a5d59d92e92e2f1@eucas1p2.samsung.com>
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

VGhpcyBwYXRjaCBhZGRzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyBmb3IgRXh5bm9zNDQxMiBp
bnRlcmNvbm5lY3QKYnVzIG5vZGVzOgogLSBzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQ6IHRv
IGRlY2xhcmUgY29ubmVjdGlvbnMgYmV0d2VlbgogICBub2RlcyBpbiBvcmRlciB0byBndWFyYW50
ZWUgUE0gUW9TIHJlcXVpcmVtZW50cyBiZXR3ZWVuIG5vZGVzLAogLSAjaW50ZXJjb25uZWN0LWNl
bGxzOiByZXF1aXJlZCBieSB0aGUgaW50ZXJjb25uZWN0IGZyYW1ld29yaywKIC0gYnVzLXdpZHRo
OiB0aGUgYnVzIHdpZHRoIGluIGJpdHMsIHJlcXVpcmVkIHRvIHByb3Blcmx5IGRlcml2ZQogICBt
aW5pbXVtIGJ1cyBjbG9jayBmcmVxdWVuY3kgZnJvbSByZXF1ZXN0ZWQgYmFuZHdpZHRoIGZvciBl
YWNoCiAgIGJ1cy4KCk5vdGUgdGhhdCAjaW50ZXJjb25uZWN0LWNlbGxzIGlzIGFsd2F5cyB6ZXJv
IGFuZCBub2RlIElEcyBhcmUgbm90CmhhcmRjb2RlZCBhbnl3aGVyZS4KClNpZ25lZC1vZmYtYnk6
IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogU3ls
d2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgpSZXZpZXdlZC1ieTogQ2hh
bndvbyBDaG9pIDxjdzAwLmNob2lAc2Ftc3VuZy5jb20+Ci0tLQpDaGFuZ2VzIGZvciB2NjoKIC0g
YWRkZWQgYnVzLXdpZHRoIHByb3BlcnR5IGluIGJ1c19kbWMgbm9kZS4KCkNoYW5nZXMgZm9yIHY1
OgogLSBhZGp1c3QgdG8gcmVuYW1lZCBleHlub3MsaW50ZXJjb25uZWN0LXBhcmVudC1ub2RlIHBy
b3BlcnR5LAogLSBhZGQgcHJvcGVydGllcyBpbiBjb21tb24gZXh5bm9zNDQxMi5kdHNpIGZpbGUg
cmF0aGVyIHRoYW4KICAgaW4gT2Ryb2lkIHNwZWNpZmljIG9kcm9pZDQ0MTItb2Ryb2lkLWNvbW1v
bi5kdHNpLgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTIuZHRzaSB8IDYgKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvZXh5bm9zNDQxMi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi5k
dHNpCmluZGV4IDQ4ODY4OTQuLjI0NTI5ZDQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczQ0MTIuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLmR0c2kK
QEAgLTM4MSw2ICszODEsOCBAQAogCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfRElWX0RNQz47CiAJ
CQljbG9jay1uYW1lcyA9ICJidXMiOwogCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmYnVzX2Rt
Y19vcHBfdGFibGU+OworCQkJYnVzLXdpZHRoID0gPDQ+OworCQkJI2ludGVyY29ubmVjdC1jZWxs
cyA9IDwwPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CgpAQCAtNDUwLDYgKzQ1Miw4
IEBACiAJCQljbG9ja3MgPSA8JmNsb2NrIENMS19ESVZfR0RMPjsKIAkJCWNsb2NrLW5hbWVzID0g
ImJ1cyI7CiAJCQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZidXNfbGVmdGJ1c19vcHBfdGFibGU+
OworCQkJc2Ftc3VuZyxpbnRlcmNvbm5lY3QtcGFyZW50ID0gPCZidXNfZG1jPjsKKwkJCSNpbnRl
cmNvbm5lY3QtY2VsbHMgPSA8MD47CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9OwoKQEAg
LTQ2Niw2ICs0NzAsOCBAQAogCQkJY2xvY2tzID0gPCZjbG9jayBDTEtfQUNMSzE2MD47CiAJCQlj
bG9jay1uYW1lcyA9ICJidXMiOwogCQkJb3BlcmF0aW5nLXBvaW50cy12MiA9IDwmYnVzX2Rpc3Bs
YXlfb3BwX3RhYmxlPjsKKwkJCXNhbXN1bmcsaW50ZXJjb25uZWN0LXBhcmVudCA9IDwmYnVzX2xl
ZnRidXM+OworCQkJI2ludGVyY29ubmVjdC1jZWxscyA9IDwwPjsKIAkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7CiAJCX07CgotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
