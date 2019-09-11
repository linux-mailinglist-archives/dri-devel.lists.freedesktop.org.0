Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99552B0930
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7086EBA6;
	Thu, 12 Sep 2019 07:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290226E1CF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 08:48:27 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8B8kp03032729; Wed, 11 Sep 2019 10:48:13 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uv2aw9qx2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 11 Sep 2019 10:48:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 239E923;
 Wed, 11 Sep 2019 08:48:05 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D7E42B59F2;
 Wed, 11 Sep 2019 10:48:05 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 11 Sep
 2019 10:48:04 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 11 Sep 2019 10:48:03
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <benjamin.gaignard@linaro.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <hwentlan@amd.com>, <manasi.d.navare@intel.com>
Subject: [PATCH] drm: fix warnings in DSC
Date: Wed, 11 Sep 2019 10:47:59 +0200
Message-ID: <20190911084759.6946-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-11_06:2019-09-10,2019-09-11 signatures=0
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=z6ENkti3uAiwejD5PjtOMXUIXSlg5W0YF9pqxoz3ApI=;
 b=AdR7PLnhq76/wCtudwip3AwQvR6m5lINU6EJdjomYgaYVBQMZ3xrdCBJGzwLkfCBnyrw
 rz3NJh0GHibY8btNQ9xiJ/7CzI7nuHheo28Kg9NHr3awMceHpKcgRT3Ktrg2jQbj3vcG
 igVXtZyrCfHZPO3DWxhh/paMG4m3cCO8DrlzILLedMwdKXR/+oMUJYi1K5HJi5S6yBeI
 oVhfbImIi0hbGnE/56tJ0YUmKAl1qD/PknYe0WhC3FSzRMy+hKwRnqFpsXIj+br0XfCc
 PTyyzPF3h+8bufyOwrcd4wB6WSO2MfAxoJc5ZmQyLv7oGlj535azzuRTYs362fKwsExV vQ== 
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIGFsd2F5cyBmYWxzZSBjb21wYXJpc29ucyBkdWUgdG8gbGltaXRlZCByYW5nZSBvZiBu
ZmxfYnBnX29mZnNldAphbmQgc2NhbGVfaW5jcmVtZW50X2ludGVydmFsIGZpZWxkcy4KV2Fybmlu
Z3MgZGV0ZWN0ZWQgd2hlbiBjb21waWxpbmcgd2l0aCBXPTEuCgpTaWduZWQtb2ZmLWJ5OiBCZW5q
YW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZHNjLmMgfCAxMSAtLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RzYy5jCmluZGV4IDc3ZjRlNWFlNDE5Ny4uMjdlNWM2MDM2NjU4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHNjLmMKQEAgLTMzNiwxMiArMzM2LDYgQEAgaW50IGRybV9kc2NfY29tcHV0ZV9yY19wYXJh
bWV0ZXJzKHN0cnVjdCBkcm1fZHNjX2NvbmZpZyAqdmRzY19jZmcpCiAJZWxzZQogCQl2ZHNjX2Nm
Zy0+bmZsX2JwZ19vZmZzZXQgPSAwOwogCi0JLyogMl4xNiAtIDEgKi8KLQlpZiAodmRzY19jZmct
Pm5mbF9icGdfb2Zmc2V0ID4gNjU1MzUpIHsKLQkJRFJNX0RFQlVHX0tNUygiTmZsQnBnT2Zmc2V0
IGlzIHRvbyBsYXJnZSBmb3IgdGhpcyBzbGljZSBoZWlnaHRcbiIpOwotCQlyZXR1cm4gLUVSQU5H
RTsKLQl9Ci0KIAkvKiBOdW1iZXIgb2YgZ3JvdXBzIHVzZWQgdG8gY29kZSB0aGUgZW50aXJlIHNs
aWNlICovCiAJZ3JvdXBzX3RvdGFsID0gZ3JvdXBzX3Blcl9saW5lICogdmRzY19jZmctPnNsaWNl
X2hlaWdodDsKIApAQCAtMzcxLDExICszNjUsNiBAQCBpbnQgZHJtX2RzY19jb21wdXRlX3JjX3Bh
cmFtZXRlcnMoc3RydWN0IGRybV9kc2NfY29uZmlnICp2ZHNjX2NmZykKIAkJdmRzY19jZmctPnNj
YWxlX2luY3JlbWVudF9pbnRlcnZhbCA9IDA7CiAJfQogCi0JaWYgKHZkc2NfY2ZnLT5zY2FsZV9p
bmNyZW1lbnRfaW50ZXJ2YWwgPiA2NTUzNSkgewotCQlEUk1fREVCVUdfS01TKCJTY2FsZUluY3Jl
bWVudEludGVydmFsIGlzIGxhcmdlIGZvciBzbGljZSBoZWlnaHRcbiIpOwotCQlyZXR1cm4gLUVS
QU5HRTsKLQl9Ci0KIAkvKgogCSAqIERTQyBzcGVjIG1lbnRpb25zIHRoYXQgYml0c19wZXJfcGl4
ZWwgc3BlY2lmaWVzIHRoZSB0YXJnZXQKIAkgKiBiaXRzL3BpeGVsIChicHApIHJhdGUgdGhhdCBp
cyB1c2VkIGJ5IHRoZSBlbmNvZGVyLAotLSAKMi4xNS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
