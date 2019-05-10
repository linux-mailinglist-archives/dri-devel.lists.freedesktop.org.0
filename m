Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB119EED
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 16:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3ED893B9;
	Fri, 10 May 2019 14:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D0B89339
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 14:20:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AE0wCX012866; Fri, 10 May 2019 16:20:31 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2scdjp9j1u-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 16:20:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F05134;
 Fri, 10 May 2019 14:20:30 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 698C8113A;
 Fri, 10 May 2019 14:20:30 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May
 2019 16:20:30 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May 2019 16:20:29
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: display: stm32: add supply property to
 DSI controller
Date: Fri, 10 May 2019 16:20:19 +0200
Message-ID: <1557498023-10766-2-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=mN2/PHpZiNuhQcjSMoqkU4gRq3eMnfuCHcp2OPqegSs=;
 b=lBGzwU3TpxFerllyyQkW2HmZVddGgsGoVoljjlza7UVeh/1qA+dUQORhrAEq08Xk3Oo8
 5lLAr4u/pQlE8DgeIAMo0cJLFlmotckoD0djh3Tp2ghNQlX9oZXiC5dBdM+XFr4qxQ3P
 hs6DUdhEUXPHl8jXENCmHmvhdEBJnurS6HYkJWoPwU2IW7Iy2FtIPoc93U0B3yrBBlfb
 0u6oCg6D6Dd2qfaYdIGNXDELDJ9f6iDoQQ/zeXPutlM+px+pwD5xbmcXKo8Gj4XPyPsb
 o7fGdg7lmFMoAD2wzs1FERzC2l16eCfL/rr72RR8gy9jtdszVqg1Mg4872N1FmqsKic4 rA== 
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
ayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQgfCAzICsrKwogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQKaW5kZXggM2Vi
MWI0OC4uNjBjNTRkYSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQKQEAgLTQwLDYgKzQwLDggQEAg
TWFuZGF0b3J5IG5vZGVzIHNwZWNpZmljIHRvIFNUTTMyIERTSToKIC0gcGFuZWwgb3IgYnJpZGdl
IG5vZGU6IEEgbm9kZSBjb250YWluaW5nIHRoZSBwYW5lbCBvciBicmlkZ2UgZGVzY3JpcHRpb24g
YXMKICAgZG9jdW1lbnRlZCBpbiBbNl0uCiAgIC0gcG9ydDogcGFuZWwgb3IgYnJpZGdlIHBvcnQg
bm9kZSwgY29ubmVjdGVkIHRvIHRoZSBEU0kgb3V0cHV0IHBvcnQgKHBvcnRAMSkuCitPcHRpb25h
bCBwcm9wZXJ0aWVzOgorLSBwaHktZHNpLXN1cHBseTogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9y
IHRoYXQgcHJvdmlkZXMgdGhlIHN1cHBseSB2b2x0YWdlLgogCiBOb3RlOiBZb3UgY2FuIGZpbmQg
bW9yZSBkb2N1bWVudGF0aW9uIGluIHRoZSBmb2xsb3dpbmcgcmVmZXJlbmNlcwogWzFdIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9jbG9jay1iaW5kaW5ncy50eHQKQEAg
LTEwMSw2ICsxMDMsNyBAQCBFeGFtcGxlIDI6IERTSSBwYW5lbAogCQkJY2xvY2stbmFtZXMgPSAi
cGNsayIsICJyZWYiOwogCQkJcmVzZXRzID0gPCZyY2MgU1RNMzJGNF9BUEIyX1JFU0VUKERTSSk+
OwogCQkJcmVzZXQtbmFtZXMgPSAiYXBiIjsKKwkJCXBoeS1kc2ktc3VwcGx5ID0gPCZyZWcxOD47
CiAKIAkJCXBvcnRzIHsKIAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
