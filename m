Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8543D2B202
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 12:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CEE89870;
	Mon, 27 May 2019 10:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FB489861
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 10:21:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RAGdv9031349; Mon, 27 May 2019 12:21:47 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sptu9jjhg-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 12:21:47 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 636BB31;
 Mon, 27 May 2019 10:21:46 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 347112804;
 Mon, 27 May 2019 10:21:46 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May
 2019 12:21:46 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May 2019 12:21:45
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>,
 Yannick Fertre <yannick.fertre@st.com>, Nickey
 Yang <nickey.yang@rock-chips.com>, Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou
 <vincent.abriou@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] dw-mipi-dsi: add power on & off optional phy ops and
 update stm
Date: Mon, 27 May 2019 12:21:37 +0200
Message-ID: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=ixDf88IcNb3TU6tNgq8bjWEyDdaEJ144CZTxviT3UTE=;
 b=ff8ILc4ioPMsKqkyweSlcBLsWP3MVx7APoWrr8IMFcUnhQbUOuM2cSK01jfzckrRQ1P3
 zPxU1nT7zO+zDGVsWWXKJFTD44GvrXet2j92zvpt0KVP6IL0QAnCbl5Amb26cx42FGLn
 PnlqIWbZ84Axixb93FC6KYocoPJ2V8J0yTda2eYpj2dsn1y0LZVIYqYknBlaWeJ0vI0c
 t/pm1I8WOT1U82e2h4eiizrCIWdso8nk3tmOCxkrl471FgxRc9gKBFos8alVZkxI10f8
 7FVl3dipDCqPhYVREzJd6YTFhU8UyVGdDuwpuhxNGoBAjXytNIT4M4SHcpZSNNJVDlNS kA== 
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

VGhlc2UgcGF0Y2hlcyBmaXggYSBidWcgY29uY2VybmluZyBhbiBhY2Nlc3MgaXNzdWUgdG8gZGlz
cGxheSBjb250cm9sZXIgKGx0ZGMpCnJlZ2lzdGVycy4KSWYgdGhlIHBoeXNpY2FsIGxheWVyIG9m
IHRoZSBEU0kgaXMgc3RhcnRlZCB0b28gZWFybHkgdGhlbiB0aGUgZmlmbyBEU0kgYXJlIGZ1bGwK
dmVyeSBxdWlja2x5IHdoaWNoIGltcGxpZXMgbHRkYyByZWdpc3RlcidzIGFjY2VzcyBoYW5nIHVw
LiBUbyBhdm9pZCB0aGlzCnByb2JsZW0sIGl0IGlzIG5lY2Vzc2FyeSB0byBzdGFydCB0aGUgRFNJ
IHBoeXNpY2FsIGxheWVyIG9ubHkgd2hlbiB0aGUgYnJpZGdlCmlzIGVuYWJsZS4KCllhbm5pY2sg
RmVydHLDqSAoMik6CiAgZHJtL2JyaWRnZS9zeW5vcHN5czogZHNpOiBhZGQgcG93ZXIgb24vb2Zm
IG9wdGlvbmFsIHBoeSBvcHMKICBkcm0vc3RtOiBkc2k6IGFkZCBwb3dlciBvbi9vZmYgcGh5IG9w
cwoKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8ICA4ICsr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jICAgICAgICAgfCAy
MSArKysrKysrKysrKysrKysrKysrKy0KIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5o
ICAgICAgICAgICAgICB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
