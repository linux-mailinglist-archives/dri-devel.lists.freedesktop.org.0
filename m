Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6FE1C629
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 11:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE301891AC;
	Tue, 14 May 2019 09:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C08891F4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 09:36:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E9W0r5031412; Tue, 14 May 2019 11:36:12 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sek5aa5dp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 14 May 2019 11:36:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB19534;
 Tue, 14 May 2019 09:36:11 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 82D58179A;
 Tue, 14 May 2019 09:36:11 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May
 2019 11:36:11 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May 2019 11:36:10
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
Subject: [PATCH v4 1/2] dt-bindings: display: stm32: add supply property to
 DSI controller
Date: Tue, 14 May 2019 11:35:55 +0200
Message-ID: <1557826556-10079-2-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557826556-10079-1-git-send-email-yannick.fertre@st.com>
References: <1557826556-10079-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_06:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=LzYSQmTyf5/EQ3Y2VGObHjM41SSi7kcFjXdBikk9ZQs=;
 b=vx3HrLuhnX85QMXeDgz/T1DXa6z04dnJ2EKrOm4UEz4vgiJab7dGEgdv0Lgva2qmXbGX
 3c0i9waUV0OHFrsgZfXK8Kr6wx38f0DMwHJAUAmYkRbrxVXiR34HPhJ3u9c89EzZFaT3
 x7Y3j4+RsVnXXVM7bC7TXwPqz1JWCdBdDYcX/MK0tKLnfAOvScT3hnLVhku40mJyT3Jy
 KgtmhZDIeDpAbJIzrZaJ8orwmfUHl7/cbqvQj3ZMdeTFPPSzMBbg4ugScy7OPfmi2dLz
 x8sumPvk/YOvVolGRWbOO6WEq8ehoBwotVQli88hxSaSy7yNViUppqPQqsvaIbTQ37Pq Cg== 
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

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24gb2YgYSBuZXcgcHJvcGVydHkgcGh5LWRzaS1z
dXBwbHkgdG8gdGhlClNUTTMyIERTSSBjb250cm9sbGVyLgoKU2lnbmVkLW9mZi1ieTogWWFubmlj
ayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+ClJldmlld2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBl
LmNvcm51QHN0LmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9zdCxzdG0zMi1sdGRjLnR4dCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvc3Qsc3RtMzItbHRkYy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dAppbmRleCAzZWIxYjQ4Li42MGM1NGRhIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0z
Mi1sdGRjLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9zdCxzdG0zMi1sdGRjLnR4dApAQCAtNDAsNiArNDAsOCBAQCBNYW5kYXRvcnkgbm9kZXMgc3Bl
Y2lmaWMgdG8gU1RNMzIgRFNJOgogLSBwYW5lbCBvciBicmlkZ2Ugbm9kZTogQSBub2RlIGNvbnRh
aW5pbmcgdGhlIHBhbmVsIG9yIGJyaWRnZSBkZXNjcmlwdGlvbiBhcwogICBkb2N1bWVudGVkIGlu
IFs2XS4KICAgLSBwb3J0OiBwYW5lbCBvciBicmlkZ2UgcG9ydCBub2RlLCBjb25uZWN0ZWQgdG8g
dGhlIERTSSBvdXRwdXQgcG9ydCAocG9ydEAxKS4KK09wdGlvbmFsIHByb3BlcnRpZXM6CistIHBo
eS1kc2ktc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyB0aGUg
c3VwcGx5IHZvbHRhZ2UuCiAKIE5vdGU6IFlvdSBjYW4gZmluZCBtb3JlIGRvY3VtZW50YXRpb24g
aW4gdGhlIGZvbGxvd2luZyByZWZlcmVuY2VzCiBbMV0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4dApAQCAtMTAxLDYgKzEwMyw3IEBAIEV4
YW1wbGUgMjogRFNJIHBhbmVsCiAJCQljbG9jay1uYW1lcyA9ICJwY2xrIiwgInJlZiI7CiAJCQly
ZXNldHMgPSA8JnJjYyBTVE0zMkY0X0FQQjJfUkVTRVQoRFNJKT47CiAJCQlyZXNldC1uYW1lcyA9
ICJhcGIiOworCQkJcGh5LWRzaS1zdXBwbHkgPSA8JnJlZzE4PjsKIAogCQkJcG9ydHMgewogCQkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
