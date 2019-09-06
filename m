Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D92CAB4CF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 11:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADB56E193;
	Fri,  6 Sep 2019 09:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860796E193
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 09:22:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x869M3lL025630; Fri, 6 Sep 2019 11:22:31 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uqec3e3w0-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 06 Sep 2019 11:22:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 84EF452;
 Fri,  6 Sep 2019 09:22:23 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C4082C7C1C;
 Fri,  6 Sep 2019 11:22:22 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 6 Sep 2019
 11:22:22 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 6 Sep 2019 11:22:21
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: ltdc: add pinctrl for DPI encoder mode
Date: Fri, 6 Sep 2019 11:21:48 +0200
Message-ID: <1567761708-31777-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-06_04:2019-09-04,2019-09-06 signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=z4f+K9FCvLJRtiC5DZZCJIIPbU+tClnqdagLmTLqx60=;
 b=LilT1R8twNVz2da+lQrKhR+6yGfpSLuCH65T3knsZqFV7MlC+TGFu9Z5eEAlhplhVyfB
 gP1/+wreD6EQzFgZ0075c+A+u2CQXtixqgoMwH6qClCBFidJExhBq7tFkUUj+5RMIyZ6
 Y3TbGiyV8iovbT+OD9BEMxvYY/ZDzjhMYzsn5bpQjAf5t+rRMr1HTe64oNb6zjEWXAJr
 ke9rUXOBngCqDLHb3/neaEC0pqO/d6YW94IQ0vpXi4e6ZHxBwwpvfvdQ7/IsEkC/HsSg
 c+j4HP/Y/uRx6FzlSv26FQcTstzzZsXjVddePSR6wxP4QyNnMzTTT2awiqywguRo9Quo FQ== 
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

VGhlIGltcGxlbWVudGF0aW9uIG9mIGZ1bmN0aW9ucyBlbmNvZGVyX2VuYWJsZSBhbmQgZW5jb2Rl
cl9kaXNhYmxlCm1ha2UgcG9zc2libGUgdG8gY29udHJvbCB0aGUgcGluY3RybCBhY2NvcmRpbmcg
dG8gdGhlIGVuY29kZXIgdHlwZS4KVGhlIHBpbmN0cmwgbXVzdCBiZSBhY3RpdmF0ZWQgb25seSBp
ZiB0aGUgZW5jb2RlciB0eXBlIGlzIERQSS4KVGhpcyBoZWxwcyB0byBtb3ZlIHRoZSBEUEktcmVs
YXRlZCBwaW5jdHJsIGNvbmZpZ3VyYXRpb24gZnJvbQphbGwgdGhlIHBhbmVsIG9yIGJyaWRnZSB0
byB0aGUgTFREQyBkdCBub2RlLgoKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBw
ZS5jb3JudUBzdC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2su
ZmVydHJlQHN0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDM1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVy
cy9ncHUvZHJtL3N0bS9sdGRjLmMKaW5kZXggM2FiNGZiZi4uMWM0ZmRlMCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRj
LmMKQEAgLTE1LDYgKzE1LDcgQEAKICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRl
IDxsaW51eC9vZl9hZGRyZXNzLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KKyNpbmNs
dWRlIDxsaW51eC9waW5jdHJsL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1ZGUgPGxpbnV4
L3Jlc2V0Lmg+CkBAIC0xMDQwLDYgKzEwNDEsMzYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
ZW5jb2Rlcl9mdW5jcyBsdGRjX2VuY29kZXJfZnVuY3MgPSB7CiAJLmRlc3Ryb3kgPSBkcm1fZW5j
b2Rlcl9jbGVhbnVwLAogfTsKIAorc3RhdGljIHZvaWQgbHRkY19lbmNvZGVyX2Rpc2FibGUoc3Ry
dWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQoreworCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0g
ZW5jb2Rlci0+ZGV2OworCisJRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsKKworCS8qIFNldCB0byBz
bGVlcCBzdGF0ZSB0aGUgcGluY3RybCB3aGF0ZXZlciB0eXBlIG9mIGVuY29kZXIgKi8KKwlwaW5j
dHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0ZShkZGV2LT5kZXYpOworfQorCitzdGF0aWMgdm9pZCBs
dGRjX2VuY29kZXJfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKK3sKKwlzdHJ1
Y3QgZHJtX2RldmljZSAqZGRldiA9IGVuY29kZXItPmRldjsKKworCURSTV9ERUJVR19EUklWRVIo
IlxuIik7CisKKwkvKgorCSAqIFNldCB0byBkZWZhdWx0IHN0YXRlIHRoZSBwaW5jdHJsIG9ubHkg
d2l0aCBEUEkgdHlwZS4KKwkgKiBPdGhlcnMgdHlwZXMgbGlrZSBEU0ksIGRvbid0IG5lZWQgcGlu
Y3RybCBkdWUgdG8KKwkgKiBpbnRlcm5hbCBicmlkZ2UgKHRoZSBzaWduYWxzIGRvIG5vdCBjb21l
IG91dCBvZiB0aGUgY2hpcHNldCkuCisJICovCisJaWYgKGVuY29kZXItPmVuY29kZXJfdHlwZSA9
PSBEUk1fTU9ERV9FTkNPREVSX0RQSSkKKwkJcGluY3RybF9wbV9zZWxlY3RfZGVmYXVsdF9zdGF0
ZShkZGV2LT5kZXYpOworfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2hlbHBl
cl9mdW5jcyBsdGRjX2VuY29kZXJfaGVscGVyX2Z1bmNzID0geworCS5kaXNhYmxlID0gbHRkY19l
bmNvZGVyX2Rpc2FibGUsCisJLmVuYWJsZSA9IGx0ZGNfZW5jb2Rlcl9lbmFibGUsCit9OworCiBz
dGF0aWMgaW50IGx0ZGNfZW5jb2Rlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2LCBzdHJ1
Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogewogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsK
QEAgLTEwNTUsNiArMTA4Niw4IEBAIHN0YXRpYyBpbnQgbHRkY19lbmNvZGVyX2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRkZXYsIHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJZHJtX2VuY29k
ZXJfaW5pdChkZGV2LCBlbmNvZGVyLCAmbHRkY19lbmNvZGVyX2Z1bmNzLAogCQkJIERSTV9NT0RF
X0VOQ09ERVJfRFBJLCBOVUxMKTsKIAorCWRybV9lbmNvZGVyX2hlbHBlcl9hZGQoZW5jb2Rlciwg
Jmx0ZGNfZW5jb2Rlcl9oZWxwZXJfZnVuY3MpOworCiAJcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2go
ZW5jb2RlciwgYnJpZGdlLCBOVUxMKTsKIAlpZiAocmV0KSB7CiAJCWRybV9lbmNvZGVyX2NsZWFu
dXAoZW5jb2Rlcik7CkBAIC0xMjgwLDYgKzEzMTMsOCBAQCBpbnQgbHRkY19sb2FkKHN0cnVjdCBk
cm1fZGV2aWNlICpkZGV2KQogCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGxkZXYtPnBpeGVsX2Ns
ayk7CiAKKwlwaW5jdHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0ZShkZGV2LT5kZXYpOworCiAJcG1f
cnVudGltZV9lbmFibGUoZGRldi0+ZGV2KTsKIAogCXJldHVybiAwOwotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
