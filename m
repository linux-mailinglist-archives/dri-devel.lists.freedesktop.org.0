Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719B6127EF7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 16:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEC06E044;
	Fri, 20 Dec 2019 15:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 609 seconds by postgrey-1.36 at gabe;
 Fri, 20 Dec 2019 15:04:48 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467E46E044
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 15:04:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBKEmluw018721; Fri, 20 Dec 2019 15:54:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=OAxh9OFylBS1O2i0AQYBqRnIJ6+wfj/Z3JUs1ONnn4g=;
 b=nofuJvmUhaDKuc4aDMIWsJ/XfhwDRmh+T/2HeRWc71I+0qh6iYMPwK1hPfko7orM6bml
 Py1Uha+fbVQUW3jtOp8aIJkqgUph+NwC7VU4DpKTyMYY3+aPvVFNQAlHORGQYLGB9LOe
 G24ddTjYo+gUiPZrLviv0mEqPs0OlRs08DoWKczLU4xN9HcqdpCIwBE9gYZYEt4RXwOw
 ZluGbcwYMex83E7KCOsKzd18u77xPr8nz8DJCOfyCWoRH/KQVPnCgcxz90+hnMmxZdzA
 W49Ep6YlnIoS31NNd6Vg5zn/5fhhcyTkiO+FaZ0z8lLTyHV3+OcS9tCebtegBQoI4pj3 dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvp37fu37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2019 15:54:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DEF3D10003E;
 Fri, 20 Dec 2019 15:54:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC7392FF5DF;
 Fri, 20 Dec 2019 15:54:26 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 20 Dec 2019 15:54:26 +0100
From: Yannick Fertre <yannick.fertre@st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Benjamin Gaignard
 <benjamin.gaignard@st.com>, Philippe Cornu <philippe.cornu@st.com>, Thierry
 Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: display: Convert raydium,
 rm68200 panel to DT schema
Date: Fri, 20 Dec 2019 15:54:20 +0100
Message-ID: <1576853660-2083-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-20_03:2019-12-17,2019-12-20 signatures=0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CgpDb252ZXJ0IHRo
ZSByYXlkaXVtLHJtNjgyMDAgcGFuZWwgYmluZGluZyB0byBEVCBzY2hlbWEuCgpTaWduZWQtb2Zm
LWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIC4uLi9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02ODIwMC50eHQgICAgIHwgMjUgLS0tLS0tLS0t
CiAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjgyMDAueWFtbCAgICB8IDYx
ICsrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygr
KSwgMjUgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY4MjAwLnR4dAogY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3JheWRpdW0scm02ODIwMC55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY4MjAwLnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02ODIw
MC50eHQKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGNiYjc5ZWYuLjAwMDAwMDAKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1
bSxybTY4MjAwLnR4dAorKysgL2Rldi9udWxsCkBAIC0xLDI1ICswLDAgQEAKLVJheWRpdW0gU2Vt
aWNvbmR1Y3RvciBDb3Jwb3JhdGlvbiBSTTY4MjAwIDUuNSIgNzIwcCBNSVBJLURTSSBURlQgTENE
IHBhbmVsCi0KLVRoZSBSYXlkaXVtIFNlbWljb25kdWN0b3IgQ29ycG9yYXRpb24gUk02ODIwMCBp
cyBhIDUuNSIgNzIweDEyODAgVEZUIExDRAotcGFuZWwgY29ubmVjdGVkIHVzaW5nIGEgTUlQSS1E
U0kgdmlkZW8gaW50ZXJmYWNlLgotCi1SZXF1aXJlZCBwcm9wZXJ0aWVzOgotICAtIGNvbXBhdGli
bGU6ICJyYXlkaXVtLHJtNjgyMDAiCi0gIC0gcmVnOiB0aGUgdmlydHVhbCBjaGFubmVsIG51bWJl
ciBvZiBhIERTSSBwZXJpcGhlcmFsCi0KLU9wdGlvbmFsIHByb3BlcnRpZXM6Ci0gIC0gcmVzZXQt
Z3Bpb3M6IGEgR1BJTyBzcGVjIGZvciB0aGUgcmVzZXQgcGluIChhY3RpdmUgbG93KS4KLSAgLSBw
b3dlci1zdXBwbHk6IHBoYW5kbGUgb2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIHRoZSBz
dXBwbHkgdm9sdGFnZS4KLSAgLSBiYWNrbGlnaHQ6IHBoYW5kbGUgb2YgdGhlIGJhY2tsaWdodCBk
ZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVsLgotCi1FeGFtcGxlOgotJmRzaSB7Ci0JLi4uCi0J
cGFuZWxAMCB7Ci0JCWNvbXBhdGlibGUgPSAicmF5ZGl1bSxybTY4MjAwIjsKLQkJcmVnID0gPDA+
OwotCQlyZXNldC1ncGlvcyA9IDwmZ3Bpb2YgMTUgR1BJT19BQ1RJVkVfTE9XPjsKLQkJcG93ZXIt
c3VwcGx5ID0gPCZ2MXY4PjsKLQkJYmFja2xpZ2h0ID0gPCZwd21fYmFja2xpZ2h0PjsKLQl9Owot
fTsKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3BhbmVsL3JheWRpdW0scm02ODIwMC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY4MjAwLnlhbWwKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMC4uZmZlNTQ5ZgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02ODIwMC55
YW1sCkBAIC0wLDAgKzEsNjEgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjgyMDAueWFtbCMKKyRz
Y2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0
aXRsZTogUmF5ZGl1bSBSTTY4MjAwIDUuNSIgNzIweDEyODAgcGFuZWwKKworbWFpbnRhaW5lcnM6
CisgIC0gWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KKworZGVzY3JpcHRp
b246CisgIFRoZSBSYXlkaXVtIFNlbWljb25kdWN0b3IgQ29ycG9yYXRpb24gUk02ODIwMCBpcyBh
IDUuNSIgNzIweDEyODAgVEZUIExDRAorICBwYW5lbCBjb25uZWN0ZWQgdXNpbmcgYSBNSVBJLURT
SSB2aWRlbyBpbnRlcmZhY2UuCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29u
c3Q6IHJheWRpdW0scm02ODIwMAorCisgIHBvd2VyLXN1cHBseToKKyAgICBtYXhJdGVtczogMQor
CisgIHJlc2V0LWdwaW9zOgorICAgIG1heEl0ZW1zOiAxCisKKyAgYmFja2xpZ2h0OgorICAgIG1h
eEl0ZW1zOiAxCisKKyAgcG9ydDoKKyAgICBtYXhJdGVtczogMQorCisgIHJlZzoKKyAgICBtYXhJ
dGVtczogMQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisgIC0gcG9ydAor
CithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KKyAgICBkaXNwbGF5MDogZGlzcGxheSB7
CisgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKKyAgICAgICNzaXplLWNlbGxzID0gPDA+Owor
ICAgICAgcGFuZWwgeworICAgICAgICBjb21wYXRpYmxlID0gInJheWRpdW0scm02ODIwMCI7Cisg
ICAgICAgIHJlZyA9IDwwPjsKKyAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JmdwaW9mIDE1IEdQSU9f
QUNUSVZFX0xPVz47CisgICAgICAgIHBvd2VyLXN1cHBseSA9IDwmdjF2OD47CisgICAgICAgIHBv
cnQgeworICAgICAgICAgIHBhbmVsX2luX2RzaTogZW5kcG9pbnQgeworICAgICAgICAgICAgcmVt
b3RlLWVuZHBvaW50ID0gPCZjb250cm9sbGVyX291dF9kc2k+OworICAgICAgICAgIH07CisgICAg
ICAgIH07CisgICAgICB9OworICAgIH07CisKKy4uLgotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
