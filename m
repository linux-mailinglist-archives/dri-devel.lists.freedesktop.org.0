Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3015C4AF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B8589D5F;
	Mon,  1 Jul 2019 20:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7303E894D4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 15:14:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FETB9124733;
 Mon, 1 Jul 2019 10:14:29 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FETUC000916
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jul 2019 10:14:29 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:14:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:14:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FESg8067728;
 Mon, 1 Jul 2019 10:14:29 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH 2/4] devicetree: Update led binding
Date: Mon, 1 Jul 2019 17:14:21 +0200
Message-ID: <20190701151423.30768-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561994069;
 bh=+6v26NB+tLXJYVTGZvrfrMOfb0AGJI+ZnSI3OxEbA4o=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZLDFCZpHi00XjdBePSH2DWgCNUJhniDPDtuyT4ai5U9eIeAkcSVTqpo4aG1BI+Tp9
 dBugh0r0qdnchtxEd7enLWIiJSbAUSeRpVU0ybl5C0XK7fQqgoJPFgy03zwMbkRRVq
 Tm0i+M9qoj+BTdwE4S8PGMyZvKe5iLm19lvVxZVE=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, dmurphy@ti.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXBkYXRlIHRoZSBsZWQgYmluZGluZyB0byBkZXNjcmliZSB0aGUgcG9zc2liaWxpdHkgdG8gYWRk
IGEgImNvbXBhdGlibGUiCm9wdGlvbiB0byBjcmVhdGUgYSBjaGlsZC1kZXZpY2UsIHVzZXIgb2Yg
dGhlIExFRC4KClNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRp
LmNvbT4KQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCi0tLQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4dCB8IDMgKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9sZWRzL2NvbW1vbi50eHQKaW5kZXggNzA4NzZhYzExMzY3Li4yZjc4ODI1MjhkOTcgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2NvbW1vbi50
eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4
dApAQCAtMTEsNiArMTEsOSBAQCBoYXZlIHRvIGJlIHRpZ2h0bHkgY291cGxlZCB3aXRoIHRoZSBM
RUQgZGV2aWNlIGJpbmRpbmcuIFRoZXkgYXJlIHJlcHJlc2VudGVkCiBieSBjaGlsZCBub2RlcyBv
ZiB0aGUgcGFyZW50IExFRCBkZXZpY2UgYmluZGluZy4KIAogT3B0aW9uYWwgcHJvcGVydGllcyBm
b3IgY2hpbGQgbm9kZXM6CistIGNvbXBhdGlibGUgOiBkcml2ZXIgbmFtZSBmb3IgYSBjaGlsZC1k
ZXZpY2UuIFRoaXMgY2hpbGQtZGV2aWNlIGlzIHRoZSB1c2VyCisgICAgICAgICAgICAgICBvZiB0
aGUgTEVELiBJdCBpcyBjcmVhdGVkIHdoZW4gdGhlIExFRCBpcyByZWdpc3RlcmVkIGFuZAorCSAg
ICAgICBkZXN0cm95ZWQgd2hlbiB0aGUgTEVEIGlzIHVucmVnaXN0ZXJlZC4KIC0gbGVkLXNvdXJj
ZXMgOiBMaXN0IG9mIGRldmljZSBjdXJyZW50IG91dHB1dHMgdGhlIExFRCBpcyBjb25uZWN0ZWQg
dG8uIFRoZQogCQlvdXRwdXRzIGFyZSBpZGVudGlmaWVkIGJ5IHRoZSBudW1iZXJzIHRoYXQgbXVz
dCBiZSBkZWZpbmVkCiAJCWluIHRoZSBMRUQgZGV2aWNlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbi4K
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
