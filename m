Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC3103028
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDCB6EA07;
	Tue, 19 Nov 2019 23:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3976E075
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 10:58:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJAvCZN016187; Tue, 19 Nov 2019 11:57:59 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9uv748a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 11:57:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2B04100038;
 Tue, 19 Nov 2019 11:57:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0A1E2B41BE;
 Tue, 19 Nov 2019 11:57:55 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 19 Nov 2019 11:57:55
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/fb-cma-helpers: Fix include issue
Date: Tue, 19 Nov 2019 11:57:53 +0100
Message-ID: <20191119105753.32363-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_03:2019-11-15,2019-11-19 signatures=0
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=YvffzZ2WCYrAd1ijoI8QfGwR+7dHh9PU6TpCOdbzZ+o=;
 b=GNRcnyYKd16YMcP14gpYDJUQaUuLsq6OHINHs5OTyyBYczRg+c75sZKQBK1/Oev6Fj+S
 PTyeKQv/uFxawvWCYgVSEj1aGipjPd+ShsPt9fb6HNtkZKXumnd2yPZiXEFOaspky6GT
 oQrU0c3AIZls6RkuVlp05RKkaZo5332/4iJ7xz/6jWAukKfuP5tJcpWnQsdDwaXXw65w
 BT9q476Nbikc/gW6OBr0q0KS1Hboc1/4ZTMBQpgNR3wvYP7hlKjj40JF8az/K4SqSyeE
 65Rub0pOsnnMrjKl6UKp2VOYkwOK5V/fF74SgAb3HNcTV23fHvdtv8v3VBJZd6jv6n+1 3Q== 
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

RXhwb3J0ZWQgZnVuY3Rpb25zIHByb3RvdHlwZXMgYXJlIG1pc3NpbmcgaW4gZHJtX2ZiX2NtYV9o
ZWxwZXIuYwpJbmNsdWRlIGRybV9mYl9jbWFfaGVscGVyIHRvIGZpeCB0aGF0IGlzc3VlLgoKU2ln
bmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2NtYV9oZWxwZXIuYyB8IDEgKwogaW5jbHVkZS9k
cm0vZHJtX2ZiX2NtYV9oZWxwZXIuaCAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfY21hX2hlbHBl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmMKaW5kZXggYzBiMGY2MDNh
ZjYzLi45ODAxYzAzMzNlY2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfY21h
X2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfY21hX2hlbHBlci5jCkBAIC05
LDYgKzksNyBAQAogICogIENvcHlyaWdodCAoQykgMjAxMiBSZWQgSGF0CiAgKi8KIAorI2luY2x1
ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+
CiAjaW5jbHVkZSA8ZHJtL2RybV9mcmFtZWJ1ZmZlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2Vt
X2NtYV9oZWxwZXIuaD4KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mYl9jbWFfaGVscGVy
LmggYi9pbmNsdWRlL2RybS9kcm1fZmJfY21hX2hlbHBlci5oCmluZGV4IDRiZWNiMDk5NzVhNC4u
Nzk1YWVhMWQwYTI1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZmJfY21hX2hlbHBlci5o
CisrKyBiL2luY2x1ZGUvZHJtL2RybV9mYl9jbWFfaGVscGVyLmgKQEAgLTIsNiArMiw4IEBACiAj
aWZuZGVmIF9fRFJNX0ZCX0NNQV9IRUxQRVJfSF9fCiAjZGVmaW5lIF9fRFJNX0ZCX0NNQV9IRUxQ
RVJfSF9fCiAKKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgorCiBzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyOwogc3RydWN0IGRybV9wbGFuZV9zdGF0ZTsKIAotLSAKMi4xNS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
