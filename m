Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2301C62C
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 11:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01617891F4;
	Tue, 14 May 2019 09:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BE3891AC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 09:36:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E9VWJp023931; Tue, 14 May 2019 11:36:11 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sdn9fr6bn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 14 May 2019 11:36:11 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B94733A;
 Tue, 14 May 2019 09:36:10 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B727179A;
 Tue, 14 May 2019 09:36:10 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May
 2019 11:36:10 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May 2019 11:36:09
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
Subject: [PATCH v4 0/2] Add supply property for DSI controller
Date: Tue, 14 May 2019 11:35:54 +0200
Message-ID: <1557826556-10079-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_05:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=fsbBwl7Tthpbz/eCjykcV7x4Wlt53zxDBpGU6jlFytg=;
 b=a3a6okLrnFYL1FMWRzsSHkfi57tsWIaN+rfwa3c4BaWjsfDIezfk2tyB2jRASM/9Y01v
 vuKAII6QgFvrnA2QCM6j9fyewgn7rSNz+e5m370sE2DVWoOxxRS7cUwkCoVKw8ejV5MP
 F/jKRW24TB8CojqDIRAeHQIHZPQPWhkQt/GItKTEiJqPvw76YOntFLWC9ZgdM/u+VpS7
 NOcqdLLPCBVvQo6V/afXIfbSk+A32wbiT5qzTyHhD/r6zSdP51m6Ozk8HUQ3nnojgibE
 OTmeKk5bMvVS//dSu1MJ93cYb4/FJz/X53eCe4VO+98u0M2E//CDglHxm/u8DyDBBbNG cw== 
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
aHlzaWNhbCBsYXllci4KQmluZGluZyBoYXMgYmVlbiB1cGRhdGVkIHRvIGRvY3VtZW50IHRoaXMg
cHJvcGVydHkuCkRldmljZSB0cmVlIG9mIHN0bTMybXAxNTdjIHNvYy4KTW92ZSByZWcxOCAmIHJl
ZzExIHRvIHN0bTMybXAxNTdjIGRldmljZSB0cmVlIGZpbGUuClJlbW92ZSBwcm9wZXJ0eSBwaHkt
ZHNpLXN1cHBseSBwcm9wZXJ0eSB0byBzdG0zMm1wMTU3Yy1kazIuZHRzIGZpbGUuCgpDaGFuZ2Vz
IGluIHYyOgotIHJlbmFtZSBwYXRjaCBkcm0vc3RtOiBkc2k6IGFkZCBzdXBwb3J0IG9mIGFuIG9w
dGlvbmFsIHJlZ3VsYXRvcgotIHJld29yayBkd19taXBpX2RzaS1zdG0gcHJvYmUgc2VxdWVuY2UK
CkNoYW5nZXMgaW4gdjM6Ci0gcmVtb3ZlIGRldmljZS10cmVlIHBhdGNoZXMKLSByZXBsYWNlIHRo
ZSBvcHRpb25hbCByZWd1bGF0b3IgYnkgYSByZWd1bGF0b3IKCkNoYW5nZXMgaW4gdjQ6Ci0gdXBk
YXRlIHBhdGNoIGNvbW1pdAotIHJldHVybiBhbHdheXMgZXJyb3IgY29kZQoKWWFubmljayBGZXJ0
csOpICgyKToKICBkdC1iaW5kaW5nczogZGlzcGxheTogc3RtMzI6IGFkZCBzdXBwbHkgcHJvcGVy
dHkgdG8gRFNJIGNvbnRyb2xsZXIKICBkcm0vc3RtOiBkc2k6IGFkZCByZWd1bGF0b3Igc3VwcG9y
dAoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQgIHwg
IDMgKysKIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgICAgICAgICAgICAg
IHwgNjAgKysrKysrKysrKysrKysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
