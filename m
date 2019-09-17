Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B93EDB576B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 23:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5136ED75;
	Tue, 17 Sep 2019 21:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97CE6E88B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 10:38:01 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190917103800euoutp026aad45c21c8d638ad8c4e5bd8ecaef62~FM4Ji04Et2913829138euoutp02h
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 10:38:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190917103800euoutp026aad45c21c8d638ad8c4e5bd8ecaef62~FM4Ji04Et2913829138euoutp02h
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190917103759eucas1p1f8df25325e4754c12a823f7263e2296a~FM4IrGNUy1434014340eucas1p1G;
 Tue, 17 Sep 2019 10:37:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 48.3B.04309.687B08D5; Tue, 17
 Sep 2019 11:37:58 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190917103758eucas1p10793e499209137630681186a10a4b7bd~FM4Hoz1pO1434014340eucas1p1D;
 Tue, 17 Sep 2019 10:37:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190917103758eusmtrp2ef805a9a7986ed995556f76690e3f0df~FM4HaqEit1908519085eusmtrp2O;
 Tue, 17 Sep 2019 10:37:58 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-12-5d80b786928f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 3A.37.04166.587B08D5; Tue, 17
 Sep 2019 11:37:57 +0100 (BST)
Received: from AMDC2459.digital.local (unknown [106.120.51.95]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190917103757eusmtip208717cdb181c927823afc54f28fbf2a5~FM4G1vhY60082800828eusmtip2c;
 Tue, 17 Sep 2019 10:37:57 +0000 (GMT)
From: Maciej Falkowski <m.falkowski@samsung.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3] dt-bindings: gpu: Convert Samsung Image Rotator to
 dt-schema
Date: Tue, 17 Sep 2019 12:37:27 +0200
Message-Id: <20190917103727.14997-1-m.falkowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913062945.GA10283@pi3>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsWy7djPc7rt2xtiDWa+Z7S4te4cq0XvuZNM
 Fv+3TWS2mH8EyL3y9T2bxfnzG9gtLu+aw2Yx4/w+JosHzevYLNYeuctusfT6RSaL1r1H2B14
 PNbMW8PosffbAhaPTas62Ty2f3vA6nG/+ziTR9+WVYwenzfJBbBHcdmkpOZklqUW6dslcGVc
 u/CarWCmZMX/vRkNjLtFuhg5OSQETCQ+rN/B1sXIxSEksIJRYuOVE4wQzhdGiZ0bGpkhnM+M
 EpP3HWCCaXl0/QQTRGI5o8TjA5PZQRJgLQsfV4PYbAIGEv1v9rKAFIkINDFKzF91HGwus8Aa
 RolfM1vBRgkLBEmsXNzPCmKzCKhK3N6ynxHE5hWwkbh3pIMRYp28xOoNB5hBbE4BTYn2S+9Y
 QQZJCCxil/iy4gILRJGLxLr5d6EahCVeHd/CDmHLSPzfOR9oGQeQXS1x7ZssRG8Lo8T1aW/Z
 IGqsJf6smsgGUsMMtGD9Ln2IsKPErAmXoFr5JG68FQQJMwOZk7ZNZ4YI80p0tAlBmKoSbybE
 QjRKS7Su2Q91i4dEe9tnaPDUSEzo3844gVF+FsKqBYyMqxjFU0uLc9NTi43yUsv1ihNzi0vz
 0vWS83M3MQLTzOl/x7/sYNz1J+kQowAHoxIPr8G2+lgh1sSy4srcQ4wSHMxKIrwBtUAh3pTE
 yqrUovz4otKc1OJDjNIcLErivNUMD6KFBNITS1KzU1MLUotgskwcnFINjFxK9f2+ivX8Wd25
 bx/d41igIGR6quqMknJmecsBp/25CaK9mlOrLl2Uj9L0Mpp9cI6vrHexkKLMy3Ppoq8Vc3hX
 cNwQip/HeSct+PC7KwbhWqdshcQF7XlOzqlS10rUV5cINAiq/7lMYXX9pAu1V1bZ/L4qcH72
 i6a6PgZx0X7hZeqMfd1KLMUZiYZazEXFiQBgUiSKLwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42I5/e/4Pd3W7Q2xBu1nLSxurTvHatF77iST
 xf9tE5kt5h8Bcq98fc9mcf78BnaLy7vmsFnMOL+PyeJB8zo2i7VH7rJbLL1+kcmide8Rdgce
 jzXz1jB67P22gMVj06pONo/t3x6wetzvPs7k0bdlFaPH501yAexRejZF+aUlqQoZ+cUltkrR
 hhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnXLrxmK5gpWfF/b0YD426RLkZO
 DgkBE4lH108wdTFycQgJLGWUWDf5DyNEQlpi/7WP7BC2sMSfa11sEEWfGCXafkxiBUmwCRhI
 9L/ZywKSEBFoY5R4euoI2ChmgW2MErvX3mcDqRIWCJDYu+0q2CgWAVWJ21v2g63gFbCRuHek
 A2qdvMTqDQeYQWxOAU2J9kvvwDYICWhI3N+1gHUCI98CRoZVjCKppcW56bnFhnrFibnFpXnp
 esn5uZsYgcG/7djPzTsYL20MPsQowMGoxMNrsK0+Vog1say4MvcQowQHs5IIb0AtUIg3JbGy
 KrUoP76oNCe1+BCjKdBRE5mlRJPzgZGZVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7
 NbUgtQimj4mDU6qBUX/OrpMMOz88tn1Q1q93fYqxtZZBsc7F9ItWb5wCn72tmLXBaeM99qVN
 F1g9Sm3FN0v4TRK4v/6Zj6ncoYAcv/qHqxLfvbX9csJm9ct892KLFpO/z1tZ44UMde/aTfHl
 C4h6seSd1fUpHtob5W5wfDmwa8vqJToHnq/Rf114YdZ3lSwdlXrNvUosxRmJhlrMRcWJAB3p
 4vOUAgAA
X-CMS-MailID: 20190917103758eucas1p10793e499209137630681186a10a4b7bd
X-Msg-Generator: CA
X-RootMTR: 20190917103758eucas1p10793e499209137630681186a10a4b7bd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190917103758eucas1p10793e499209137630681186a10a4b7bd
References: <20190913062945.GA10283@pi3>
 <CGME20190917103758eucas1p10793e499209137630681186a10a4b7bd@eucas1p1.samsung.com>
X-Mailman-Approved-At: Tue, 17 Sep 2019 21:19:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1568716680;
 bh=dMTOUiJXpryj3x6XPv0aEEYIJHqqRS47dekWk1nhjEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=skeo03LxM7QIw6XrBnswET5VrhR9S/11M60R+7zBUm3K1ZWZjjMj6NmOSgnQjlVbp
 OAQQxy7Ay0TIafz/HZRCvl0F6MVDqJWkWSfs/aQvkabBEsCoemF0enSkEa1iqAOuE4
 51NWuEAnhZDjP+U5Ja7i/PJ25Y1Kpvr0Yhx7CNtE=
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
Cc: mark.rutland@arm.com, m.falkowski@samsung.com, airlied@linux.ie,
 krzk@kernel.org, robh+dt@kernel.org, m.szyprowski@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCBTYW1zdW5nIEltYWdlIFJvdGF0b3IgdG8gbmV3ZXIgZHQtc2NoZW1hIGZvcm1hdC4K
ClNpZ25lZC1vZmYtYnk6IE1hY2llaiBGYWxrb3dza2kgPG0uZmFsa293c2tpQHNhbXN1bmcuY29t
PgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5j
b20+Ci0tLQp2MzoKLSByZW1vdmUgdW5uZWRlZCBjb21tZW50cyBhbmQgZGVzY3JpcHRpb25zCi0g
cmVtb3ZlIHVubmVkZWQgbWF4SXRlbXMgZmllbGQgZnJvbSBjbG9jay1uYW1lcyBwcm9wZXJ0eQot
LS0KIC4uLi9iaW5kaW5ncy9ncHUvc2Ftc3VuZy1yb3RhdG9yLnR4dCAgICAgICAgICB8IDI4IC0t
LS0tLS0tLS0tCiAuLi4vYmluZGluZ3MvZ3B1L3NhbXN1bmctcm90YXRvci55YW1sICAgICAgICAg
fCA0OCArKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMo
KyksIDI4IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncHUvc2Ftc3VuZy1yb3RhdG9yLnR4dAogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvc2Ftc3VuZy1yb3RhdG9y
LnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1
L3NhbXN1bmctcm90YXRvci50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Z3B1L3NhbXN1bmctcm90YXRvci50eHQKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDNh
Y2EyNTc4ZGEwYi4uMDAwMDAwMDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9ncHUvc2Ftc3VuZy1yb3RhdG9yLnR4dAorKysgL2Rldi9udWxsCkBAIC0xLDI4ICsw
LDAgQEAKLSogU2Ftc3VuZyBJbWFnZSBSb3RhdG9yCi0KLVJlcXVpcmVkIHByb3BlcnRpZXM6Ci0g
IC0gY29tcGF0aWJsZSA6IHZhbHVlIHNob3VsZCBiZSBvbmUgb2YgdGhlIGZvbGxvd2luZzoKLQkq
ICJzYW1zdW5nLHM1cHYyMTAtcm90YXRvciIgZm9yIFJvdGF0b3IgSVAgaW4gUzVQVjIxMAotCSog
InNhbXN1bmcsZXh5bm9zNDIxMC1yb3RhdG9yIiBmb3IgUm90YXRvciBJUCBpbiBFeHlub3M0MjEw
Ci0JKiAic2Ftc3VuZyxleHlub3M0MjEyLXJvdGF0b3IiIGZvciBSb3RhdG9yIElQIGluIEV4eW5v
czQyMTIvNDQxMgotCSogInNhbXN1bmcsZXh5bm9zNTI1MC1yb3RhdG9yIiBmb3IgUm90YXRvciBJ
UCBpbiBFeHlub3M1MjUwCi0KLSAgLSByZWcgOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3Mgb2YgdGhl
IElQIHJlZ2lzdGVycyBhbmQgbGVuZ3RoIG9mIG1lbW9yeQotCSAgbWFwcGVkIHJlZ2lvbi4KLQot
ICAtIGludGVycnVwdHMgOiBJbnRlcnJ1cHQgc3BlY2lmaWVyIGZvciByb3RhdG9yIGludGVycnVw
dCwgYWNjb3JkaW5nIHRvIGZvcm1hdAotCQkgc3BlY2lmaWMgdG8gaW50ZXJydXB0IHBhcmVudC4K
LQotICAtIGNsb2NrcyA6IENsb2NrIHNwZWNpZmllciBmb3Igcm90YXRvciBjbG9jaywgYWNjb3Jk
aW5nIHRvIGdlbmVyaWMgY2xvY2sKLQkgICAgIGJpbmRpbmdzLiAoU2VlIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9leHlub3MqLnR4dCkKLQotICAtIGNsb2NrLW5hbWVz
IDogTmFtZXMgb2YgY2xvY2tzLiBGb3IgZXh5bm9zIHJvdGF0b3IsIGl0IHNob3VsZCBiZSAicm90
YXRvciIuCi0KLUV4YW1wbGU6Ci0Jcm90YXRvckAxMjgxMDAwMCB7Ci0JCWNvbXBhdGlibGUgPSAi
c2Ftc3VuZyxleHlub3M0MjEwLXJvdGF0b3IiOwotCQlyZWcgPSA8MHgxMjgxMDAwMCAweDEwMDA+
OwotCQlpbnRlcnJ1cHRzID0gPDAgODMgMD47Ci0JCWNsb2NrcyA9IDwmY2xvY2sgMjc4PjsKLQkJ
Y2xvY2stbmFtZXMgPSAicm90YXRvciI7Ci0JfTsKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvc2Ftc3VuZy1yb3RhdG9yLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L3NhbXN1bmctcm90YXRvci55YW1sCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNDVjZTU2MjQzNWZhCi0tLSAvZGV2L251
bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9zYW1zdW5nLXJv
dGF0b3IueWFtbApAQCAtMCwwICsxLDQ4IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9ncHUvc2Ftc3VuZy1yb3RhdG9yLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFNhbXN1bmcgU29DIEltYWdlIFJv
dGF0b3IKKworbWFpbnRhaW5lcnM6CisgIC0gSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29t
PgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGVudW06CisgICAgICAtICJzYW1z
dW5nLHM1cHYyMTAtcm90YXRvciIKKyAgICAgIC0gInNhbXN1bmcsZXh5bm9zNDIxMC1yb3RhdG9y
IgorICAgICAgLSAic2Ftc3VuZyxleHlub3M0MjEyLXJvdGF0b3IiCisgICAgICAtICJzYW1zdW5n
LGV4eW5vczUyNTAtcm90YXRvciIKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgaW50ZXJy
dXB0czoKKyAgICBtYXhJdGVtczogMQorCisgIGNsb2NrczoKKyAgICBtYXhJdGVtczogMQorCisg
IGNsb2NrLW5hbWVzOgorICAgIGl0ZW1zOgorICAgIC0gY29uc3Q6IHJvdGF0b3IKKworcmVxdWly
ZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGludGVycnVwdHMKKyAgLSBjbG9ja3MK
KyAgLSBjbG9jay1uYW1lcworCitleGFtcGxlczoKKyAgLSB8CisgICAgcm90YXRvckAxMjgxMDAw
MCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M0MjEwLXJvdGF0b3IiOwor
ICAgICAgICByZWcgPSA8MHgxMjgxMDAwMCAweDEwMDA+OworICAgICAgICBpbnRlcnJ1cHRzID0g
PDAgODMgMD47CisgICAgICAgIGNsb2NrcyA9IDwmY2xvY2sgMjc4PjsKKyAgICAgICAgY2xvY2st
bmFtZXMgPSAicm90YXRvciI7CisgICAgfTsKKwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
