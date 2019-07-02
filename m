Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1395D34D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E8C6E02D;
	Tue,  2 Jul 2019 15:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B6A6E02A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 15:47:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62FkaCa002454; Tue, 2 Jul 2019 17:47:40 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tdwf0w4uy-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jul 2019 17:47:40 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B0A5334;
 Tue,  2 Jul 2019 15:47:38 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C1914891;
 Tue,  2 Jul 2019 15:47:38 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019
 17:47:38 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019 17:47:37
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
Subject: [PATCH 1/3] drm/bridge: sii902x: fix missing reference to mclk clock
Date: Tue, 2 Jul 2019 17:47:04 +0200
Message-ID: <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_08:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wsjzFOYOg3+SUAIvNOlA1VAdgNv+qv6DCsQqt2DV+dI=;
 b=Vy0sqmA3aGK+3ZfRUdzN+9BnFJKmsJHiN75j3RsI7aIoRs11wvz0VX9YIZfMKPgg6CF+
 KFHlehp2t7dbT2J9FTUgpgcRrTymRBCKonKqYemXOjS48kejRmYfD8oW+iYYAVTLSBGW
 af53uSGdFKBK8fjvmkDuxcM1SN2hvWLy/15tH1EZm1lVOtbSM3rLLTvFast6mWyRxgO6
 aQFHOVlO1dvQEVuyUpZ1ywmOx7XSp/tOAvURCRp+zuth63xcoBTODIJxVzHlRMBTJkZ8
 IXOYGVHl18a9AEvRFWuP09oV+0HjxjM/Rgz253TziwBCvFB0Gu6AolOsfOB/+dvaX2wO eQ== 
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
dmllci5tb3lzYW5Ac3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5j
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lp
OTAyeC5jCmluZGV4IGRkN2FhNDY2YjI4MC4uMzZhY2MyNTZlNjdlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3NpaTkwMnguYwpAQCAtNzUwLDYgKzc1MCw3IEBAIHN0YXRpYyBpbnQgc2lpOTAyeF9hdWRpb19j
b2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4ICpzaWk5MDJ4LAogCQlzaWk5MDJ4LT5hdWRpby5pMnNf
Zmlmb19zZXF1ZW5jZVtpXSB8PSBhdWRpb19maWZvX2lkW2ldIHwKIAkJCWkyc19sYW5lX2lkW2xh
bmVzW2ldXSB8CVNJSTkwMlhfVFBJX0kyU19GSUZPX0VOQUJMRTsKIAorCXNpaTkwMngtPmF1ZGlv
Lm1jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAibWNsayIpOwogCWlmIChJU19FUlIoc2lpOTAyeC0+
YXVkaW8ubWNsaykpIHsKIAkJZGV2X2VycihkZXYsICIlczogTm8gY2xvY2sgKGF1ZGlvIG1jbGsp
IGZvdW5kOiAlbGRcbiIsCiAJCQlfX2Z1bmNfXywgUFRSX0VSUihzaWk5MDJ4LT5hdWRpby5tY2xr
KSk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
