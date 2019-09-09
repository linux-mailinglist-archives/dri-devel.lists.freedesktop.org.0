Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D9AE41C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 08:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CE86E81E;
	Tue, 10 Sep 2019 06:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7374E89C3F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 13:52:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x89DkL4W007480; Mon, 9 Sep 2019 15:52:23 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uv212dwkt-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 09 Sep 2019 15:52:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 647564B;
 Mon,  9 Sep 2019 13:52:10 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D9F82AE7A2;
 Mon,  9 Sep 2019 15:52:10 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019
 15:52:10 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019 15:52:09
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <benjamin.gaignard@linaro.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm: include: fix W=1 warnings in struct drm_dsc_config
Date: Mon, 9 Sep 2019 15:52:04 +0200
Message-ID: <20190909135205.10277-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-09_06:2019-09-09,2019-09-09 signatures=0
X-Mailman-Approved-At: Tue, 10 Sep 2019 06:57:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=UpIhYzvB1cHNRjNJgObglIgwi0MbjP++qgONMCCM+/Q=;
 b=AHN0OFHL8lD1novtWs55nS5F9wrAx3jA8Cs59l1OSdWvPARJCbxc4yjtX7edDaKZcpDd
 xzLs7nmZO6UsGK5KXfC2msZ2+kLF20KMjCDB5iqecS3Oz0LHHNN53mvODbxtC7nI9bqF
 ig4lEQcUWJrr/a4e4xFTHNOg806qjMGIrg4zQUk6F6nMQ7H7pf/E61REPUHJ2kyaHIUi
 cTlvwLayxlqNOS1g0LVSzg47UUB535jyqm8lYlzJqAWzgeBKpNelnlBKMtoz/IsHKCe5
 fBAg2tFFJ4ufK4r1qJxJBlIK0Z7OimROGGvKrsoAYNya1xrCdTOyzroLKflngzHFRH0q gg== 
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

Q2hhbmdlIHNjYWxlX2luY3JlbWVudF9pbnRlcnZhbCBhbmQgbmZsX2JwZ19vZmZzZXQgZmllbGRz
IHRvCnUzMiB0byBhdm9pZCBXPTEgd2FybmluZ3MgYmVjYXVzZSB3ZSBhcmUgdGVzdGluZyB0aGVt
IGFnYWluc3QKNjU1MzUuCgpTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFt
aW4uZ2FpZ25hcmRAc3QuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9kc2MuaCB8IDYgKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kc2MuaCBiL2luY2x1ZGUvZHJtL2RybV9kc2MuaAppbmRl
eCA4ODc5NTRjYmZjNjAuLmU0OTUwMjRlOTAxYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X2RzYy5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kc2MuaApAQCAtMjA3LDExICsyMDcsMTMgQEAg
c3RydWN0IGRybV9kc2NfY29uZmlnIHsKIAkgKiBOdW1iZXIgb2YgZ3JvdXAgdGltZXMgYmV0d2Vl
biBpbmNyZW1lbnRpbmcgdGhlIHNjYWxlIGZhY3RvciB2YWx1ZQogCSAqIHVzZWQgYXQgdGhlIGJl
Z2lubmluZyBvZiBhIHNsaWNlLgogCSAqLwotCXUxNiBzY2FsZV9pbmNyZW1lbnRfaW50ZXJ2YWw7
CisJdTMyIHNjYWxlX2luY3JlbWVudF9pbnRlcnZhbDsKKwogCS8qKgogCSAqIEBuZmxfYnBnX29m
ZnNldDogTm9uIGZpcnN0IGxpbmUgQlBHIG9mZnNldCB0byBiZSB1c2VkCiAJICovCi0JdTE2IG5m
bF9icGdfb2Zmc2V0OworCisJdTMyIG5mbF9icGdfb2Zmc2V0OwogCS8qKgogCSAqIEBzbGljZV9i
cGdfb2Zmc2V0OiBCUEcgb2Zmc2V0IHVzZWQgdG8gZW5mb3JjZSBzbGljZSBiaXQKIAkgKi8KLS0g
CjIuMTUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
