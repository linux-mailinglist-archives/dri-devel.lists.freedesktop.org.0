Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB73C1B8CF
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE2C89E69;
	Mon, 13 May 2019 14:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34EE89E5B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:44:06 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4DEaZH3013863; Mon, 13 May 2019 16:44:04 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdm5tugns-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 13 May 2019 16:44:04 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8241B34;
 Mon, 13 May 2019 14:44:03 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 48C5D2899;
 Mon, 13 May 2019 14:44:03 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May
 2019 16:44:02 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May 2019 16:44:01
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
Subject: [PATCH v3 0/2] Add supply property for DSI controller
Date: Mon, 13 May 2019 16:42:17 +0200
Message-ID: <1557758539-28748-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_07:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=H7Q5/LExNO59bdn3+PatXfQylruOtLqJEDuHGFHk764=;
 b=bSJl0sDa++4vqFNqa9vdeF1fwx4x8cw4yukMVXb/JKd8yt9Bod9ExrcdTLJTaWHETQru
 wxG0SWcF/7/0wDc59hEV71nMYggiAPJSC0kmZxzl93vK9AydXW5eN3fck6u1q+jN9jEe
 FVs7c8UuilNXacCP8YlysODN9PXQWNa2R+HHo+HHXpE6C3hl2l1zLIFNyiZPM8HDz/eN
 HwyLpYP1Tp3wz8GwDpdy/YlNEPQrQk8EVTfSEE0i8Mnk5OlAqm1nEYVvkwfB9Mo57xIa
 oi6TX0CM55AjV/ApKhRuuu8v8S7fqBJERlvzty26qrmcKPGcQIkl3AfBYl0eJJyFk00q MQ== 
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

VGhlIERTSSBjb250cm9sbGVyIG5lZWRzIGEgbmV3IHByb3BlcnR5IHRoYXQgcG93ZXJzIGl0cyBw
aHlzaWNhbCBsYXllci4KQmluZGluZyBoYXMgYmVlbiB1cGRhdGVkIHRvIGRvY3VtZW50ZWQgdGhp
cyBwcm9wZXJ0eS4KRGV2aWNlIHRyZWUgb2Ygc3RtMzJtcDE1N2Mgc29jLgpNb3ZlIHJlZzE4ICYg
cmVnMTEgdG8gc3RtMzJtcDE1N2MgZGV2aWNlIHRyZWUgZmlsZS4KUmVtb3ZlIHByb3BlcnR5IHBo
eS1kc2ktc3VwcGx5IHByb3BlcnR5IHRvIHN0bTMybXAxNTdjLWRrMi5kdHMgZmlsZS4KCkNoYW5n
ZXMgaW4gdjI6Ci0gcmVuYW1lIHBhdGNoIGRybS9zdG06IGRzaTogYWRkIHN1cHBvcnQgb2YgYW4g
b3B0aW9uYWwgcmVndWxhdG9yCi0gcmV3b3JrIGR3X21pcGlfZHNpLXN0bSBwcm9iZSBzZXF1ZW5j
ZQoKQ2hhbmdlcyBpbiB2MzoKLSByZW1vdmUgZGV2aWNlLXRyZWUgcGF0Y2hlcwotIHJlcGxhY2Ug
dGhlIG9wdGlvbmFsIHJlZ3VsYXRvciBieSBhIHJlZ3VsYXRvcgoKWWFubmljayBGZXJ0csOpICgy
KToKICBkdC1iaW5kaW5nczogZGlzcGxheTogc3RtMzI6IGFkZCBzdXBwbHkgcHJvcGVydHkgdG8g
RFNJIGNvbnRyb2xsZXIKICBkcm0vc3RtOiBkc2k6IGFkZCBzdXBwb3J0IG9mIGFuIHJlZ3VsYXRv
cgoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQgIHwg
IDMgKysKIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgICAgICAgICAgICAg
IHwgNTMgKysrKysrKysrKysrKysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQoKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
