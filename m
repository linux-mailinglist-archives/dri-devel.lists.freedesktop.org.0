Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF57D0A2E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 10:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A2A8967F;
	Wed,  9 Oct 2019 08:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671018967F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 08:51:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x998pgL7035182;
 Wed, 9 Oct 2019 03:51:42 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998pgOP075823;
 Wed, 9 Oct 2019 03:51:42 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 03:51:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 03:51:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998pfuP119823;
 Wed, 9 Oct 2019 03:51:42 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v10 1/6] leds: populate the device's of_node
Date: Wed, 9 Oct 2019 10:51:22 +0200
Message-ID: <20191009085127.22843-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009085127.22843-1-jjhiblot@ti.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570611102;
 bh=X7hzJJQEkRzJAXvPctxNxtYyBZx2IAS1X6Y1pIA69ek=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=cg8Hc/XWIeQr5WklalooglsuVPEFPLxKcX4Nv1/0lW7UxGRHsh+dra9xgjWlt0jCT
 qxKpo/excvfInIG8D8r8Vu3pgKy0HMdUyoAhOGWo0sVDYRPwrm4K+bDKtMT4v3uiUG
 yzBHG3CoNynbjFZRq8U/W8lMuCtOehum18/01D4g=
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
 tomi.valkeinen@ti.com, dmurphy@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgaW5pdGlhbGl6YXRpb24gZGF0YSBpcyBhdmFpbGFibGUgYW5kIGl0cyBmd25vZGUgaXMgYWN0
dWFsbHkgYSBvZl9ub2RlLApzdG9yZSB0aGlzIGluZm9ybWF0aW9uIGluIHRoZSBsZWQgZGV2aWNl
J3Mgc3RydWN0dXJlLiBUaGlzIHdpbGwgYWxsb3cgdGhlCmRldmljZSB0byB1c2Ugb3IgcHJvdmlk
ZSBPRi1iYXNlZCBBUEkgc3VjaCAoZGV2bV94eHgpLgoKU2lnbmVkLW9mZi1ieTogSmVhbi1KYWNx
dWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgotLS0KIGRyaXZlcnMvbGVkcy9sZWQtY2xhc3Mu
YyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYyBiL2RyaXZlcnMvbGVkcy9s
ZWQtY2xhc3MuYwppbmRleCA2NDdiMTI2M2M1NzkuLmJmYTFiMTAzMzI3NCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jCisrKyBiL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYwpA
QCAtMjc2LDggKzI3NiwxMCBAQCBpbnQgbGVkX2NsYXNzZGV2X3JlZ2lzdGVyX2V4dChzdHJ1Y3Qg
ZGV2aWNlICpwYXJlbnQsCiAJCW11dGV4X3VubG9jaygmbGVkX2NkZXYtPmxlZF9hY2Nlc3MpOwog
CQlyZXR1cm4gUFRSX0VSUihsZWRfY2Rldi0+ZGV2KTsKIAl9Ci0JaWYgKGluaXRfZGF0YSAmJiBp
bml0X2RhdGEtPmZ3bm9kZSkKKwlpZiAoaW5pdF9kYXRhICYmIGluaXRfZGF0YS0+Zndub2RlKSB7
CiAJCWxlZF9jZGV2LT5kZXYtPmZ3bm9kZSA9IGluaXRfZGF0YS0+Zndub2RlOworCQlsZWRfY2Rl
di0+ZGV2LT5vZl9ub2RlID0gdG9fb2Zfbm9kZShpbml0X2RhdGEtPmZ3bm9kZSk7CisJfQogCiAJ
aWYgKHJldCkKIAkJZGV2X3dhcm4ocGFyZW50LCAiTGVkICVzIHJlbmFtZWQgdG8gJXMgZHVlIHRv
IG5hbWUgY29sbGlzaW9uIiwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
