Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17327704F9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DAA89CD3;
	Mon, 22 Jul 2019 16:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639AD89CD3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:06:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MG64sW016167; Mon, 22 Jul 2019 18:06:06 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ture1chdv-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 18:06:06 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F053831;
 Mon, 22 Jul 2019 16:06:05 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D3D6F52BB;
 Mon, 22 Jul 2019 16:06:05 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul
 2019 18:06:05 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul 2019 18:06:05
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
Subject: [PATCH v2 3/3] drm/bridge: sii902x: make audio mclk optional
Date: Mon, 22 Jul 2019 18:06:00 +0200
Message-ID: <1563811560-29589-4-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
References: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_12:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lMBXVdaWkpNK3eb/f1Th8IHqOU36gvkUYQ/xuGtXNQw=;
 b=LYkqkqea4BV4nkzQeT228vwRbHjFV7f7OhZhrHLXcGZtjQBUSO1GhqJWLzIVq9deWRh6
 e6b/FOCAu+HXpEBNsu4fU/Uxm8vmHwOSbqqlVY9WxcmOYaOAAIr/cNrkbi5c4iXL56UG
 gggeeJO4mxPS+kLnuKhJHiw6RpHtUyUvfasNUSZXTUf0K10bE5M5iIck+TGekRyZkWrK
 dJ3ACuS/2RfXP53EgcretzJ+9/PWgoGBkVkhCzDUpXOmgxnVD6CNbZvOUJyquRAYF7tp
 hcKTeBYuA6L3tWPpISLXPDiQvONw7p3zICdlD1/uqUsNvkPKMF8D4fOVmE/Uq8icBd6D iA== 
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
YWwuCgpTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5tb3lzYW5Ac3QuY29t
PgpSZXZpZXdlZC1ieTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KQWNrZWQtYnk6IEFuZHJ6
ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zaWk5MDJ4LmMgfCAxOSArKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3NpaTkwMnguYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCmlu
ZGV4IDk2MjkzMWMyMGVmZS4uYTMyMzgxNWFhOWI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3NpaTkwMnguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMngu
YwpAQCAtNTY4LDEzICs1NjgsMTQgQEAgc3RhdGljIGludCBzaWk5MDJ4X2F1ZGlvX2h3X3BhcmFt
cyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCXJldHVybiByZXQ7CiAJfQogCi0J
bWNsa19yYXRlID0gY2xrX2dldF9yYXRlKHNpaTkwMngtPmF1ZGlvLm1jbGspOwotCi0JcmV0ID0g
c2lpOTAyeF9zZWxlY3RfbWNsa19kaXYoJmkyc19jb25maWdfcmVnLCBwYXJhbXMtPnNhbXBsZV9y
YXRlLAotCQkJCSAgICAgIG1jbGtfcmF0ZSk7Ci0JaWYgKG1jbGtfcmF0ZSAhPSByZXQgKiBwYXJh
bXMtPnNhbXBsZV9yYXRlKQotCQlkZXZfZGJnKGRldiwgIkluYWNjdXJhdGUgcmVmZXJlbmNlIGNs
b2NrICglbGQvJWQgIT0gJXUpXG4iLAotCQkJbWNsa19yYXRlLCByZXQsIHBhcmFtcy0+c2FtcGxl
X3JhdGUpOworCWlmIChzaWk5MDJ4LT5hdWRpby5tY2xrKSB7CisJCW1jbGtfcmF0ZSA9IGNsa19n
ZXRfcmF0ZShzaWk5MDJ4LT5hdWRpby5tY2xrKTsKKwkJcmV0ID0gc2lpOTAyeF9zZWxlY3RfbWNs
a19kaXYoJmkyc19jb25maWdfcmVnLAorCQkJCQkgICAgICBwYXJhbXMtPnNhbXBsZV9yYXRlLCBt
Y2xrX3JhdGUpOworCQlpZiAobWNsa19yYXRlICE9IHJldCAqIHBhcmFtcy0+c2FtcGxlX3JhdGUp
CisJCQlkZXZfZGJnKGRldiwgIkluYWNjdXJhdGUgcmVmZXJlbmNlIGNsb2NrICglbGQvJWQgIT0g
JXUpXG4iLAorCQkJCW1jbGtfcmF0ZSwgcmV0LCBwYXJhbXMtPnNhbXBsZV9yYXRlKTsKKwl9CiAK
IAltdXRleF9sb2NrKCZzaWk5MDJ4LT5tdXRleCk7CiAKQEAgLTc1MSwxMSArNzUyLDExIEBAIHN0
YXRpYyBpbnQgc2lpOTAyeF9hdWRpb19jb2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4ICpzaWk5MDJ4
LAogCQlzaWk5MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5jZVtpXSB8PSBhdWRpb19maWZvX2lk
W2ldIHwKIAkJCWkyc19sYW5lX2lkW2xhbmVzW2ldXSB8CVNJSTkwMlhfVFBJX0kyU19GSUZPX0VO
QUJMRTsKIAotCXNpaTkwMngtPmF1ZGlvLm1jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAibWNsayIp
OworCXNpaTkwMngtPmF1ZGlvLm1jbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoZGV2LCAibWNs
ayIpOwogCWlmIChJU19FUlIoc2lpOTAyeC0+YXVkaW8ubWNsaykpIHsKIAkJZGV2X2VycihkZXYs
ICIlczogTm8gY2xvY2sgKGF1ZGlvIG1jbGspIGZvdW5kOiAlbGRcbiIsCiAJCQlfX2Z1bmNfXywg
UFRSX0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKSk7Ci0JCXJldHVybiAwOworCQlyZXR1cm4gUFRS
X0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKTsKIAl9CiAKIAlzaWk5MDJ4LT5hdWRpby5wZGV2ID0g
cGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2RhdGEoCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
