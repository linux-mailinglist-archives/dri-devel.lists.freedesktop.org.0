Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7599510302D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8E96EA0A;
	Tue, 19 Nov 2019 23:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFA86E231
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 13:35:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJDSoBs024969; Tue, 19 Nov 2019 14:34:38 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9uhyj70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 14:34:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09FB410002A;
 Tue, 19 Nov 2019 14:34:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECEE92BC103;
 Tue, 19 Nov 2019 14:34:37 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 19 Nov 2019 14:34:37
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/rect: remove useless call to clamp_t
Date: Tue, 19 Nov 2019 14:34:35 +0100
Message-ID: <20191119133435.22525-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_04:2019-11-15,2019-11-19 signatures=0
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=iRVctjJDP4VsySTwcBDAz4gTqwDw4MWcibi48UpEjC8=;
 b=eM/jA03T0mUh0nUcKYMA7qjZdWuCbnQtsSm0RJ08xgdmGPjThBTi6jqfITX0vednD69s
 wcRW5Fx9fQGaOmJ+DuOBa9RBS1+xIU5hSk3jeT9bCSBP335SLzae/FcbCvgkQjFkGpWy
 sr02JbnfMJdQK801CqUaKzy4DjdV33ZAAR/IldJWRLhLon7E0MkDV2N8vZcjm3M+fv50
 tVuf/fQSeAMbc5CQy37AlFRvfA2xhe6E36SEQYqOeTaozgYbGmw2+Niz55VDYf1KDlmQ
 tDCcjUPIp19Ifc/ygTCmrq/sDmN7VMgwhRFb5I5EakJ0Z9VEmK7cQZ8KiSH/+pgUkV4b rg== 
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

Q2xhbXBpbmcgYSB2YWx1ZSBiZXR3ZWVuIElOVF9NSU4gYW5kIElOVF9NQVggYWx3YXlzIHJldHVy
biB0aGUgdmFsdWUgaXRzZWxmCmFuZCBnZW5lcmF0ZSB3YXJuaW5ncyB3aGVuIGNvbXBpbGluZyB3
aXRoIFc9MS4KClNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWln
bmFyZEBzdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9yZWN0LmMgfCA4ICsrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9y
ZWN0LmMKaW5kZXggYjgzNjNhYWE5MDMyLi42ODFmMWZkMDkzNTcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcmVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jCkBA
IC04OSw3ICs4OSw3IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0IGRybV9yZWN0
ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAogCQl1MzIgbmV3X3NyY193ID0gY2xpcF9zY2Fs
ZWQoZHJtX3JlY3Rfd2lkdGgoc3JjKSwKIAkJCQkJICAgIGRybV9yZWN0X3dpZHRoKGRzdCksIGRp
ZmYpOwogCi0JCXNyYy0+eDEgPSBjbGFtcF90KGludDY0X3QsIHNyYy0+eDIgLSBuZXdfc3JjX3cs
IElOVF9NSU4sIElOVF9NQVgpOworCQlzcmMtPngxID0gc3JjLT54MiAtIG5ld19zcmNfdzsKIAkJ
ZHN0LT54MSA9IGNsaXAtPngxOwogCX0KIAlkaWZmID0gY2xpcC0+eTEgLSBkc3QtPnkxOwpAQCAt
OTcsNyArOTcsNyBAQCBib29sIGRybV9yZWN0X2NsaXBfc2NhbGVkKHN0cnVjdCBkcm1fcmVjdCAq
c3JjLCBzdHJ1Y3QgZHJtX3JlY3QgKmRzdCwKIAkJdTMyIG5ld19zcmNfaCA9IGNsaXBfc2NhbGVk
KGRybV9yZWN0X2hlaWdodChzcmMpLAogCQkJCQkgICAgZHJtX3JlY3RfaGVpZ2h0KGRzdCksIGRp
ZmYpOwogCi0JCXNyYy0+eTEgPSBjbGFtcF90KGludDY0X3QsIHNyYy0+eTIgLSBuZXdfc3JjX2gs
IElOVF9NSU4sIElOVF9NQVgpOworCQlzcmMtPnkxID0gc3JjLT55MiAtIG5ld19zcmNfaDsKIAkJ
ZHN0LT55MSA9IGNsaXAtPnkxOwogCX0KIAlkaWZmID0gZHN0LT54MiAtIGNsaXAtPngyOwpAQCAt
MTA1LDcgKzEwNSw3IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0IGRybV9yZWN0
ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAogCQl1MzIgbmV3X3NyY193ID0gY2xpcF9zY2Fs
ZWQoZHJtX3JlY3Rfd2lkdGgoc3JjKSwKIAkJCQkJICAgIGRybV9yZWN0X3dpZHRoKGRzdCksIGRp
ZmYpOwogCi0JCXNyYy0+eDIgPSBjbGFtcF90KGludDY0X3QsIHNyYy0+eDEgKyBuZXdfc3JjX3cs
IElOVF9NSU4sIElOVF9NQVgpOworCQlzcmMtPngyID0gc3JjLT54MSArIG5ld19zcmNfdzsKIAkJ
ZHN0LT54MiA9IGNsaXAtPngyOwogCX0KIAlkaWZmID0gZHN0LT55MiAtIGNsaXAtPnkyOwpAQCAt
MTEzLDcgKzExMyw3IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0IGRybV9yZWN0
ICpzcmMsIHN0cnVjdCBkcm1fcmVjdCAqZHN0LAogCQl1MzIgbmV3X3NyY19oID0gY2xpcF9zY2Fs
ZWQoZHJtX3JlY3RfaGVpZ2h0KHNyYyksCiAJCQkJCSAgICBkcm1fcmVjdF9oZWlnaHQoZHN0KSwg
ZGlmZik7CiAKLQkJc3JjLT55MiA9IGNsYW1wX3QoaW50NjRfdCwgc3JjLT55MSArIG5ld19zcmNf
aCwgSU5UX01JTiwgSU5UX01BWCk7CisJCXNyYy0+eTIgPSBzcmMtPnkxICsgbmV3X3NyY19oOwog
CQlkc3QtPnkyID0gY2xpcC0+eTI7CiAJfQogCi0tIAoyLjE1LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
