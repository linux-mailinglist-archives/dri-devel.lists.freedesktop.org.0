Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4773110302C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2BF6E9E0;
	Tue, 19 Nov 2019 23:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19276E267
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 12:59:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJCvR67009914; Tue, 19 Nov 2019 13:58:16 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9us7c2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 13:58:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 385CD100034;
 Tue, 19 Nov 2019 13:58:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C8AA2BAB69;
 Tue, 19 Nov 2019 13:58:15 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 19 Nov 2019 13:58:14
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/crtc-helper: drm_connector_get_single_encoder prototype
 is missing
Date: Tue, 19 Nov 2019 13:58:05 +0100
Message-ID: <20191119125805.4266-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_03:2019-11-15,2019-11-19 signatures=0
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=rsSDknKY44vezIAKr7/Ad6OiIvlz/nvS9k1eIRtRQbw=;
 b=Nnm32lW0E2QDBNXrlell4IP2gWD9DxTitsICS6K5n83wb6owQqSeC/sLP6l/Dc9pVKXm
 V1d4P0xUyiHPuQea5a0s3BpmJkHjDRx6YBsq2JBC4OkQhzEweIHOW/V+cztCp/D9Rvc/
 h1PSzd8LzESsLisNMqFKEyjZtq9eVlVSYl2VQhNw1aZORN94PlQjvE3wXAA8X3ubiYzV
 8wbH/EzoSkVvHME+NCUdcyLUIZcs4aR8iEoCalkZgEs66M/JXsEc6tCsq753Tq2NAjHh
 coSt6ZVwfCb3fjVlplaMRNe5aS13Ztyu9MCON4L8uQ8JsKkoHdndsjgsXPhZUgnsNPmb UA== 
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jbHVkZSBkcm1fY3J0Y19oZWxwZXJfaW50ZXJuYWwuaCB0byBwcm92aWRlIGRybV9jb25uZWN0
b3JfZ2V0X3NpbmdsZV9lbmNvZGVyCnByb3RvdHlwZS4KCkZpeGVzOiBhOTI0NjJkNmJmNDkzICgi
ZHJtL2Nvbm5lY3RvcjogU2hhcmUgd2l0aCBub24tYXRvbWljIGRyaXZlcnMgdGhlIGZ1bmN0aW9u
IHRvIGdldCB0aGUgc2luZ2xlIGVuY29kZXIiKQoKQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEg
PGpvc2Uuc291emFAaW50ZWwuY29tPgoKU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQg
PGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2NydGNf
aGVscGVyLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jcnRjX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9jcnRjX2hlbHBlci5jCmluZGV4IDQ5OWIwNWFhY2NmYy4uOTNhNGVlYzQyOWU4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NydGNfaGVscGVyLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9jcnRjX2hlbHBlci5jCkBAIC00OCw2ICs0OCw4IEBACiAjaW5jbHVkZSA8ZHJt
L2RybV9wcmludC5oPgogI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CiAKKyNpbmNsdWRlICJk
cm1fY3J0Y19oZWxwZXJfaW50ZXJuYWwuaCIKKwogLyoqCiAgKiBET0M6IG92ZXJ2aWV3CiAgKgot
LSAKMi4xNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
