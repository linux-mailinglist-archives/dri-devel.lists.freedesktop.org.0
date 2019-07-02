Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601185D34F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28E06E02E;
	Tue,  2 Jul 2019 15:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7216E02A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 15:47:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62Fl4xI003868; Tue, 2 Jul 2019 17:47:42 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdw49wfwm-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jul 2019 17:47:42 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F9C331;
 Tue,  2 Jul 2019 15:47:41 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A148487E;
 Tue,  2 Jul 2019 15:47:41 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019
 17:47:41 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019 17:47:40
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>, <alexandre.torgue@st.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <olivier.moysan@st.com>,
 <jsarha@ti.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH 3/3] drm/bridge: sii902x: make audio mclk optional
Date: Tue, 2 Jul 2019 17:47:06 +0200
Message-ID: <1562082426-14876-4-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_08:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=QNrE+/1IDPSo8HmO50ipNpLfEJf8OZLuIag97CDeCZo=;
 b=DbtBWM33Xxy7Hydeg0QFgBwYitsXMTubI8ucCw89x9WjLZKbnFZ7mbxtsOSgVyluo704
 iAvWpy9uq+IUaOofmgMPubkhXIr5hsx2Gfg+X5DEVnVwYksp+gMSDZ2thmY8kEt8KKi9
 B80z/cp3KOnEq+aZojPcI08t4Lv6LaPS+XLPCN1cB9iAlUryEiG/YiLURp5Fu9vV2Mia
 Rm0cndJf6JKuSaWreaFHHR3Tk4pNhE4N0kHG4X4UjGIP9/06qjHnahTv35+yCf93rkdV
 iQZtQzqMiBOALxeSSAymLgHI2mTm5b5vB4wyIZdaY6sd2Sgf3VF6EsN1uWQcwzLP7wg0 Sg== 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG1hc3RlciBjbG9jayBvbiBpMnMgYnVzIGlzIG5vdCBtYW5kYXRvcnksCmFzIHNpaTkwMlgg
aW50ZXJuYWwgUExMIGNhbiBiZSB1c2VkIGluc3RlYWQuCk1ha2UgdXNlIG9mIG1jbGsgb3B0aW9u
YWwuCgpGaXhlczogZmY1NzgxNjM0YzQxICgiZHJtL2JyaWRnZTogc2lpOTAyeDogSW1wbGVtZW50
IEhETUkgYXVkaW8gc3VwcG9ydCIpCgpTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xp
dmllci5tb3lzYW5Ac3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5j
IHwgMzkgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Np
aTkwMnguYwppbmRleCAzNmFjYzI1NmU2N2UuLmEwOGJkOWZkYzA0NiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zaWk5MDJ4LmMKQEAgLTU2MiwxOSArNTYyLDIxIEBAIHN0YXRpYyBpbnQgc2lpOTAyeF9hdWRp
b19od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQl9CiAJfQogCi0J
cmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHNpaTkwMngtPmF1ZGlvLm1jbGspOwotCWlmIChyZXQp
IHsKLQkJZGV2X2VycihkZXYsICJFbmFibGluZyBtY2xrIGZhaWxlZDogJWRcbiIsIHJldCk7Ci0J
CXJldHVybiByZXQ7Ci0JfQorCWlmIChzaWk5MDJ4LT5hdWRpby5tY2xrKSB7CisJCXJldCA9IGNs
a19wcmVwYXJlX2VuYWJsZShzaWk5MDJ4LT5hdWRpby5tY2xrKTsKKwkJaWYgKHJldCkgeworCQkJ
ZGV2X2VycihkZXYsICJFbmFibGluZyBtY2xrIGZhaWxlZDogJWRcbiIsIHJldCk7CisJCQlyZXR1
cm4gcmV0OworCQl9CiAKLQltY2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUoc2lpOTAyeC0+YXVkaW8u
bWNsayk7CisJCW1jbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShzaWk5MDJ4LT5hdWRpby5tY2xrKTsK
IAotCXJldCA9IHNpaTkwMnhfc2VsZWN0X21jbGtfZGl2KCZpMnNfY29uZmlnX3JlZywgcGFyYW1z
LT5zYW1wbGVfcmF0ZSwKLQkJCQkgICAgICBtY2xrX3JhdGUpOwotCWlmIChtY2xrX3JhdGUgIT0g
cmV0ICogcGFyYW1zLT5zYW1wbGVfcmF0ZSkKLQkJZGV2X2RiZyhkZXYsICJJbmFjY3VyYXRlIHJl
ZmVyZW5jZSBjbG9jayAoJWxkLyVkICE9ICV1KVxuIiwKLQkJCW1jbGtfcmF0ZSwgcmV0LCBwYXJh
bXMtPnNhbXBsZV9yYXRlKTsKKwkJcmV0ID0gc2lpOTAyeF9zZWxlY3RfbWNsa19kaXYoJmkyc19j
b25maWdfcmVnLAorCQkJCQkgICAgICBwYXJhbXMtPnNhbXBsZV9yYXRlLCBtY2xrX3JhdGUpOwor
CQlpZiAobWNsa19yYXRlICE9IHJldCAqIHBhcmFtcy0+c2FtcGxlX3JhdGUpCisJCQlkZXZfZGJn
KGRldiwgIkluYWNjdXJhdGUgcmVmZXJlbmNlIGNsb2NrICglbGQvJWQgIT0gJXUpXG4iLAorCQkJ
CW1jbGtfcmF0ZSwgcmV0LCBwYXJhbXMtPnNhbXBsZV9yYXRlKTsKKwl9CiAKIAltdXRleF9sb2Nr
KCZzaWk5MDJ4LT5tdXRleCk7CiAKQEAgLTY0MCw3ICs2NDIsOCBAQCBzdGF0aWMgaW50IHNpaTkw
MnhfYXVkaW9faHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAltdXRl
eF91bmxvY2soJnNpaTkwMngtPm11dGV4KTsKIAogCWlmIChyZXQpIHsKLQkJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKHNpaTkwMngtPmF1ZGlvLm1jbGspOworCQlpZiAoc2lpOTAyeC0+YXVkaW8ubWNs
aykKKwkJCWNsa19kaXNhYmxlX3VucHJlcGFyZShzaWk5MDJ4LT5hdWRpby5tY2xrKTsKIAkJZGV2
X2VycihkZXYsICIlczogaGRtaSBhdWRpbyBlbmFibGUgZmFpbGVkOiAlZFxuIiwgX19mdW5jX18s
CiAJCQlyZXQpOwogCX0KQEAgLTY1OSw3ICs2NjIsOCBAQCBzdGF0aWMgdm9pZCBzaWk5MDJ4X2F1
ZGlvX3NodXRkb3duKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKIAogCW11dGV4X3Vu
bG9jaygmc2lpOTAyeC0+bXV0ZXgpOwogCi0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHNpaTkwMngt
PmF1ZGlvLm1jbGspOworCWlmIChzaWk5MDJ4LT5hdWRpby5tY2xrKQorCQljbGtfZGlzYWJsZV91
bnByZXBhcmUoc2lpOTAyeC0+YXVkaW8ubWNsayk7CiB9CiAKIGludCBzaWk5MDJ4X2F1ZGlvX2Rp
Z2l0YWxfbXV0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIGJvb2wgZW5hYmxlKQpA
QCAtNzUyLDkgKzc1NiwxMiBAQCBzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9fY29kZWNfaW5pdChz
dHJ1Y3Qgc2lpOTAyeCAqc2lpOTAyeCwKIAogCXNpaTkwMngtPmF1ZGlvLm1jbGsgPSBkZXZtX2Ns
a19nZXQoZGV2LCAibWNsayIpOwogCWlmIChJU19FUlIoc2lpOTAyeC0+YXVkaW8ubWNsaykpIHsK
LQkJZGV2X2VycihkZXYsICIlczogTm8gY2xvY2sgKGF1ZGlvIG1jbGspIGZvdW5kOiAlbGRcbiIs
Ci0JCQlfX2Z1bmNfXywgUFRSX0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKSk7Ci0JCXJldHVybiAw
OworCQlpZiAoUFRSX0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKSAhPSAtRU5PRU5UKSB7CisJCQlk
ZXZfZXJyKGRldiwgIiVzOiBObyBjbG9jayAoYXVkaW8gbWNsaykgZm91bmQ6ICVsZFxuIiwKKwkJ
CQlfX2Z1bmNfXywgUFRSX0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKSk7CisJCQlyZXR1cm4gUFRS
X0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKTsKKwkJfQorCQlzaWk5MDJ4LT5hdWRpby5tY2xrID0g
TlVMTDsKIAl9CiAKIAlzaWk5MDJ4LT5hdWRpby5wZGV2ID0gcGxhdGZvcm1fZGV2aWNlX3JlZ2lz
dGVyX2RhdGEoCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
