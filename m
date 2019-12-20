Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9122127EF3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 16:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593926EC36;
	Fri, 20 Dec 2019 15:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 489 seconds by postgrey-1.36 at gabe;
 Fri, 20 Dec 2019 15:03:25 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FC66E044
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 15:03:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBKEqpTP016204; Fri, 20 Dec 2019 15:55:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=sVrTZIezbYnRiKZqMTLj6zzvZboDkSX5bAiYWhg0T7o=;
 b=NcBqpqxrKkxfyeDW+SY0cyO5g6DMetHFtAwa1fm5KWIVBAlUjHDhUvgBz9heMPbwatBJ
 xy0xpppdSlhdbtOPPW4MH9Xbqs9tE5wlg8K5gpQWbfl3La5fIsM5Zwq/a+v3MiNRThwm
 92PxGh0mHmLtedC62PRLA32GEzvN3acsPlvFzckT7vXGZUqIapKEh0z+x4SCX7is2IZX
 jI2gDRTEA/gRjFRbld+Pkvy4LeYG7TbPuwgxez2PWanoceYfdIDheqTYWS68pFvqFhDc
 Zotrtr+UC/hH76bCS6oEox8txTdYo91Fds55nJyIUgqkmCxJQwrp+IDCLh1wOVbcJM+Z /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wvnreyuer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Dec 2019 15:55:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C8F310003D;
 Fri, 20 Dec 2019 15:55:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 275E72FF5DF;
 Fri, 20 Dec 2019 15:55:04 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 20 Dec 2019 15:55:03 +0100
From: Yannick Fertre <yannick.fertre@st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Benjamin Gaignard
 <benjamin.gaignard@st.com>, Philippe Cornu <philippe.cornu@st.com>, Thierry
 Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: display: Convert orisetech,
 otm8009a panel to DT schema
Date: Fri, 20 Dec 2019 15:54:48 +0100
Message-ID: <1576853688-2143-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE1.st.com
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
ZSBvcmlzZXRlY2gsb3RtODAwOWEgcGFuZWwgYmluZGluZyB0byBEVCBzY2hlbWEuCgpTaWduZWQt
b2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIC4uLi9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS50eHQgIHwgMjMgLS0tLS0t
LS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS55YW1sIHwg
NjIgKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25z
KCspLCAyMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gsb3RtODAwOWEudHh0CiBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvb3Jpc2V0ZWNoLG90bTgwMDlhLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gsb3RtODAwOWEu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3Jp
c2V0ZWNoLG90bTgwMDlhLnR4dApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMjAzYjAz
ZS4uMDAwMDAwMAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9vcmlzZXRlY2gsb3RtODAwOWEudHh0CisrKyAvZGV2L251bGwKQEAgLTEsMjMgKzAs
MCBAQAotT3Jpc2UgVGVjaCBPVE04MDA5QSAzLjk3IiA0ODB4ODAwIFRGVCBMQ0QgcGFuZWwgKE1J
UEktRFNJIHZpZGVvIG1vZGUpCi0KLVRoZSBPcmlzZSBUZWNoIE9UTTgwMDlBIGlzIGEgMy45NyIg
NDgweDgwMCBURlQgTENEIHBhbmVsIGNvbm5lY3RlZCB1c2luZwotYSBNSVBJLURTSSB2aWRlbyBp
bnRlcmZhY2UuIEl0cyBiYWNrbGlnaHQgaXMgbWFuYWdlZCB0aHJvdWdoIHRoZSBEU0kgbGluay4K
LQotUmVxdWlyZWQgcHJvcGVydGllczoKLSAgLSBjb21wYXRpYmxlOiAib3Jpc2V0ZWNoLG90bTgw
MDlhIgotICAtIHJlZzogdGhlIHZpcnR1YWwgY2hhbm5lbCBudW1iZXIgb2YgYSBEU0kgcGVyaXBo
ZXJhbAotCi1PcHRpb25hbCBwcm9wZXJ0aWVzOgotICAtIHJlc2V0LWdwaW9zOiBhIEdQSU8gc3Bl
YyBmb3IgdGhlIHJlc2V0IHBpbiAoYWN0aXZlIGxvdykuCi0gIC0gcG93ZXItc3VwcGx5OiBwaGFu
ZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyB0aGUgc3VwcGx5IHZvbHRhZ2UuCi0K
LUV4YW1wbGU6Ci0mZHNpIHsKLQkuLi4KLQlwYW5lbEAwIHsKLQkJY29tcGF0aWJsZSA9ICJvcmlz
ZXRlY2gsb3RtODAwOWEiOwotCQlyZWcgPSA8MD47Ci0JCXJlc2V0LWdwaW9zID0gPCZncGlvaCA3
IEdQSU9fQUNUSVZFX0xPVz47Ci0JCXBvd2VyLXN1cHBseSA9IDwmdjF2OD47Ci0JfTsKLX07CmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5l
bC9vcmlzZXRlY2gsb3RtODAwOWEueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL29yaXNldGVjaCxvdG04MDA5YS55YW1sCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAuLjAyYmQ2OWUKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcmlzZXRlY2gsb3RtODAw
OWEueWFtbApAQCAtMCwwICsxLDYyIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvb3Jpc2V0ZWNoLG90bTgwMDlhLnlh
bWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMKKwordGl0bGU6IE9yaXNlIFRlY2ggT1RNODAwOUEgMy45NyIgNDgweDgwMCBwYW5lbAorCitt
YWludGFpbmVyczoKKyAgLSBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgor
CitkZXNjcmlwdGlvbjoKKyAgVGhlIE9yaXNlIFRlY2ggT1RNODAwOUEgaXMgYSAzLjk3IiA0ODB4
ODAwIFRGVCBMQ0QgcGFuZWwgY29ubmVjdGVkIHVzaW5nCisgIGEgTUlQSS1EU0kgdmlkZW8gaW50
ZXJmYWNlLiBJdHMgYmFja2xpZ2h0IGlzIG1hbmFnZWQgdGhyb3VnaCB0aGUgRFNJIGxpbmsuCisK
K3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IG9yaXNldGVjaCxvdG04MDA5
YQorCisgIHBvd2VyLXN1cHBseToKKyAgICBtYXhJdGVtczogMQorCisgIHJlc2V0LWdwaW9zOgor
ICAgIG1heEl0ZW1zOiAxCisKKyAgYmFja2xpZ2h0OgorICAgIG1heEl0ZW1zOiAxCisKKyAgcG9y
dDoKKyAgICBtYXhJdGVtczogMQorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCityZXF1aXJl
ZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisgIC0gcG9ydAorCithZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9ncGlvL2dwaW8uaD4KKyAgICBkaXNwbGF5MTogZGlzcGxheSB7CisgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKKyAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgcGFuZWwgeworICAg
ICAgICBjb21wYXRpYmxlID0gIm9yaXNldGVjaCxvdG04MDA5YSI7CisgICAgICAgIHJlZyA9IDww
PjsKKyAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JmdwaW9oIDcgR1BJT19BQ1RJVkVfTE9XPjsKKyAg
ICAgICAgcG93ZXItc3VwcGx5ID0gPCZ2MXY4PjsKKworICAgICAgICBwb3J0IHsKKyAgICAgICAg
ICBwYW5lbF9pbl9kc2k6IGVuZHBvaW50IHsKKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9
IDwmY29udHJvbGxlcl9vdXRfZHNpPjsKKyAgICAgICAgICB9OworICAgICAgICB9OworICAgICAg
fTsKKyAgICB9OworCisuLi4KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
