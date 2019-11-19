Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CB1103038
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7E96EA12;
	Tue, 19 Nov 2019 23:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BAF6E903
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 13:47:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJDgtQ1018085; Tue, 19 Nov 2019 14:47:09 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9us7m4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 14:47:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B48110002A;
 Tue, 19 Nov 2019 14:47:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4AA872BC7BB;
 Tue, 19 Nov 2019 14:47:08 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 19 Nov 2019 14:47:07
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/modes: remove unused variables
Date: Tue, 19 Nov 2019 14:47:06 +0100
Message-ID: <20191119134706.10893-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_04:2019-11-15,2019-11-19 signatures=0
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=RPNVCR00/xespK2RS0OoI2obJTyZRF5MAmRVt//oPM0=;
 b=A5fpBQZVil4S76+C6T/z24V6/kGUU7LjPcuPV0/R01F2tDdX6OHz5nOSsXZjo7LpldvE
 dYnC9wc5u/Y7TEA0ZR1O+z7TH09ID2gbTMvrDMhOM/ZoJxoylto8god6Nfg+qXS+UzmQ
 Emt6w22XW91xVWZf9/NeujIJirlVmlMuIjPQBLLjz3VukUBKhdvtJquzYSz9CpcxgMqU
 K0zWSoBgA5gRamuZ8BpcIq3ZCP230ZPyxdCwGv95SPqLja15s4iTpBq565sOiJwOGeO9
 rC/GNEnXyQcafyOkewn/7n7mjMozXFZVR8HsFdw/bhEPuIGWVAcpfi9JzkbndAA+zvsJ 1Q== 
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

V2hlbiBjb21waWxpbmcgd2l0aCBXPTEgZmV3IHdhcm5pbmdzIGFib3V0IHVudXNlZCB2YXJpYWJs
ZXMgc2hvdyB1cC4KVGhpcyBwYXRjaCByZW1vdmVzIGFsbCB0aGUgaW52b2x2ZWQgdmFyaWFibGVz
LgoKU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgfCAyMiArKystLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX21vZGVzLmMKaW5kZXggODgyMzI2OThkN2EwLi5hY2E5MDFhZmYwNDIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX21vZGVzLmMKQEAgLTIzMyw3ICsyMzMsNyBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAq
ZHJtX2N2dF9tb2RlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGludCBoZGlzcGxheSwKIAkJLyog
MykgTm9taW5hbCBIU3luYyB3aWR0aCAoJSBvZiBsaW5lIHBlcmlvZCkgLSBkZWZhdWx0IDggKi8K
ICNkZWZpbmUgQ1ZUX0hTWU5DX1BFUkNFTlRBR0UJOAogCQl1bnNpZ25lZCBpbnQgaGJsYW5rX3Bl
cmNlbnRhZ2U7Ci0JCWludCB2c3luY2FuZGJhY2tfcG9yY2gsIHZiYWNrX3BvcmNoLCBoYmxhbms7
CisJCWludCB2c3luY2FuZGJhY2tfcG9yY2gsIGhibGFuazsKIAogCQkvKiBlc3RpbWF0ZWQgdGhl
IGhvcml6b250YWwgcGVyaW9kICovCiAJCXRtcDEgPSBIVl9GQUNUT1IgKiAxMDAwMDAwICAtCkBA
IC0yNDksNyArMjQ5LDYgQEAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRybV9jdnRfbW9kZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQgaGRpc3BsYXksCiAJCWVsc2UKIAkJCXZzeW5jYW5k
YmFja19wb3JjaCA9IHRtcDE7CiAJCS8qIDEwLiBGaW5kIG51bWJlciBvZiBsaW5lcyBpbiBiYWNr
IHBvcmNoICovCi0JCXZiYWNrX3BvcmNoID0gdnN5bmNhbmRiYWNrX3BvcmNoIC0gdnN5bmM7CiAJ
CWRybV9tb2RlLT52dG90YWwgPSB2ZGlzcGxheV9ybmQgKyAyICogdm1hcmdpbiArCiAJCQkJdnN5
bmNhbmRiYWNrX3BvcmNoICsgQ1ZUX01JTl9WX1BPUkNIOwogCQkvKiA1KSBEZWZpbml0aW9uIG9m
IEhvcml6b250YWwgYmxhbmtpbmcgdGltZSBsaW1pdGF0aW9uICovCkBAIC0zODYsOSArMzg1LDgg
QEAgZHJtX2d0Zl9tb2RlX2NvbXBsZXgoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGhkaXNw
bGF5LCBpbnQgdmRpc3BsYXksCiAJaW50IHRvcF9tYXJnaW4sIGJvdHRvbV9tYXJnaW47CiAJaW50
IGludGVybGFjZTsKIAl1bnNpZ25lZCBpbnQgaGZyZXFfZXN0OwotCWludCB2c3luY19wbHVzX2Jw
LCB2YmFja19wb3JjaDsKLQl1bnNpZ25lZCBpbnQgdnRvdGFsX2xpbmVzLCB2ZmllbGRyYXRlX2Vz
dCwgaHBlcmlvZDsKLQl1bnNpZ25lZCBpbnQgdmZpZWxkX3JhdGUsIHZmcmFtZV9yYXRlOworCWlu
dCB2c3luY19wbHVzX2JwOworCXVuc2lnbmVkIGludCB2dG90YWxfbGluZXM7CiAJaW50IGxlZnRf
bWFyZ2luLCByaWdodF9tYXJnaW47CiAJdW5zaWduZWQgaW50IHRvdGFsX2FjdGl2ZV9waXhlbHMs
IGlkZWFsX2R1dHlfY3ljbGU7CiAJdW5zaWduZWQgaW50IGhibGFuaywgdG90YWxfcGl4ZWxzLCBw
aXhlbF9mcmVxOwpAQCAtNDUxLDIzICs0NDksOSBAQCBkcm1fZ3RmX21vZGVfY29tcGxleChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQgaGRpc3BsYXksIGludCB2ZGlzcGxheSwKIAkvKiBbViBT
WU5DK0JQXSA9IFJJTlQoKFtNSU4gVlNZTkMrQlBdICogaGZyZXFfZXN0IC8gMTAwMDAwMCkpICov
CiAJdnN5bmNfcGx1c19icCA9IE1JTl9WU1lOQ19QTFVTX0JQICogaGZyZXFfZXN0IC8gMTAwMDsK
IAl2c3luY19wbHVzX2JwID0gKHZzeW5jX3BsdXNfYnAgKyA1MDApIC8gMTAwMDsKLQkvKiAgOS4g
RmluZCB0aGUgbnVtYmVyIG9mIGxpbmVzIGluIFYgYmFjayBwb3JjaCBhbG9uZTogKi8KLQl2YmFj
a19wb3JjaCA9IHZzeW5jX3BsdXNfYnAgLSBWX1NZTkNfUlFEOwogCS8qICAxMC4gRmluZCB0aGUg
dG90YWwgbnVtYmVyIG9mIGxpbmVzIGluIFZlcnRpY2FsIGZpZWxkIHBlcmlvZDogKi8KIAl2dG90
YWxfbGluZXMgPSB2ZGlzcGxheV9ybmQgKyB0b3BfbWFyZ2luICsgYm90dG9tX21hcmdpbiArCiAJ
CQl2c3luY19wbHVzX2JwICsgR1RGX01JTl9WX1BPUkNIOwotCS8qICAxMS4gRXN0aW1hdGUgdGhl
IFZlcnRpY2FsIGZpZWxkIGZyZXF1ZW5jeTogKi8KLQl2ZmllbGRyYXRlX2VzdCA9IGhmcmVxX2Vz
dCAvIHZ0b3RhbF9saW5lczsKLQkvKiAgMTIuIEZpbmQgdGhlIGFjdHVhbCBob3Jpem9udGFsIHBl
cmlvZDogKi8KLQlocGVyaW9kID0gMTAwMDAwMCAvICh2ZmllbGRyYXRlX3JxZCAqIHZ0b3RhbF9s
aW5lcyk7Ci0KLQkvKiAgMTMuIEZpbmQgdGhlIGFjdHVhbCBWZXJ0aWNhbCBmaWVsZCBmcmVxdWVu
Y3k6ICovCi0JdmZpZWxkX3JhdGUgPSBoZnJlcV9lc3QgLyB2dG90YWxfbGluZXM7Ci0JLyogIDE0
LiBGaW5kIHRoZSBWZXJ0aWNhbCBmcmFtZSBmcmVxdWVuY3k6ICovCi0JaWYgKGludGVybGFjZWQp
Ci0JCXZmcmFtZV9yYXRlID0gdmZpZWxkX3JhdGUgLyAyOwotCWVsc2UKLQkJdmZyYW1lX3JhdGUg
PSB2ZmllbGRfcmF0ZTsKIAkvKiAgMTUuIEZpbmQgbnVtYmVyIG9mIHBpeGVscyBpbiBsZWZ0IG1h
cmdpbjogKi8KIAlpZiAobWFyZ2lucykKIAkJbGVmdF9tYXJnaW4gPSAoaGRpc3BsYXlfcm5kICog
R1RGX01BUkdJTl9QRVJDRU5UQUdFICsgNTAwKSAvCi0tIAoyLjE1LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
