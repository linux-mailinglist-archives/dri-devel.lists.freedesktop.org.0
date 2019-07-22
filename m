Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7468D704FB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC57E89CD7;
	Mon, 22 Jul 2019 16:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC09A89CD5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:06:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MG65b1016173; Mon, 22 Jul 2019 18:06:05 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ture1chdr-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 18:06:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EDCE134;
 Mon, 22 Jul 2019 16:06:03 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD08A52BD;
 Mon, 22 Jul 2019 16:06:03 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul
 2019 18:06:03 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul 2019 18:06:03
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>, <alexandre.torgue@st.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <olivier.moysan@st.com>,
 <jsarha@ti.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v2 1/3] drm/bridge: sii902x: fix missing reference to mclk
 clock
Date: Mon, 22 Jul 2019 18:05:58 +0200
Message-ID: <1563811560-29589-2-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
References: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_12:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=sRoYw+gjO4V6WYQIFcpRmA6lrUT15ghe8XN5XQ6WRiw=;
 b=ENmhN0C6R269ohYvCIwqgaPJaskoRN8XZL4LQkM79yJFsTwQpADo53fEnn+29fWz3J1g
 oKUilDC980iSXubGcBcUWfiWTPHWZ8DZ7d8LPJKY4/BxPv5X3YmzvHg6OMwtW4WGJT/f
 GTKVt/PU0FJwwZA3f75q4/1ZN49iErJ3kxI5gHkZp0tzqCYmeWFVp8qRDXwJUbOje/6D
 czNkGuUOPtKyvcgzlGfWp/REkArNZsbY4R+bBwB3Uw2LStsvsxK1uj2RnNzC9yUPHmnS
 DZeebg5mmVTLxHEv6wUaDSvBm583PwId0Iq4vhI2ugIyBQNgobrl3ErxIz6Hnbx3nexg MQ== 
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

QWRkIGRldm1fY2xrX2dldCBjYWxsIHRvIHJldHJpZXZlIHJlZmVyZW5jZSB0byBtYXN0ZXIgY2xv
Y2suCgpGaXhlczogZmY1NzgxNjM0YzQxICgiZHJtL2JyaWRnZTogc2lpOTAyeDogSW1wbGVtZW50
IEhETUkgYXVkaW8gc3VwcG9ydCIpCgpTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xp
dmllci5tb3lzYW5Ac3QuY29tPgpSZXZpZXdlZC1ieTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNv
bT4KQWNrZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwppbmRleCBjMmY5N2U1OTk3YTEuLjk2
MjkzMWMyMGVmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKQEAgLTc1MSw2ICs3NTEsNyBA
QCBzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9fY29kZWNfaW5pdChzdHJ1Y3Qgc2lpOTAyeCAqc2lp
OTAyeCwKIAkJc2lpOTAyeC0+YXVkaW8uaTJzX2ZpZm9fc2VxdWVuY2VbaV0gfD0gYXVkaW9fZmlm
b19pZFtpXSB8CiAJCQlpMnNfbGFuZV9pZFtsYW5lc1tpXV0gfAlTSUk5MDJYX1RQSV9JMlNfRklG
T19FTkFCTEU7CiAKKwlzaWk5MDJ4LT5hdWRpby5tY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgIm1j
bGsiKTsKIAlpZiAoSVNfRVJSKHNpaTkwMngtPmF1ZGlvLm1jbGspKSB7CiAJCWRldl9lcnIoZGV2
LCAiJXM6IE5vIGNsb2NrIChhdWRpbyBtY2xrKSBmb3VuZDogJWxkXG4iLAogCQkJX19mdW5jX18s
IFBUUl9FUlIoc2lpOTAyeC0+YXVkaW8ubWNsaykpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
