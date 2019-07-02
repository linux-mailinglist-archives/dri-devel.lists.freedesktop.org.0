Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8765D34B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0673889FF7;
	Tue,  2 Jul 2019 15:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD026E027
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 15:47:55 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62FkM2h018386; Tue, 2 Jul 2019 17:47:41 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tdwruw18b-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jul 2019 17:47:41 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E4843D;
 Tue,  2 Jul 2019 15:47:40 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7593487E;
 Tue,  2 Jul 2019 15:47:39 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019
 17:47:39 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019 17:47:39
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
Subject: [PATCH 2/3] dt-bindings: display: sii902x: Change audio mclk binding
Date: Tue, 2 Jul 2019 17:47:05 +0200
Message-ID: <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
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
 bh=NhsrEoJveWLgOo+1joeRhmVOkkmiBIRuZljoqUTyfqA=;
 b=u37jVT5XGv1pPt6ooAENikWSafDNGybH9HPYxmvdZ1ENAqps0XOpCzUwQwh6+uoOgj7R
 pCWourv9LZH4C5Bk2dOm1gjFeTjY0/bfs8j6EdY7rqZ3Fn23LH25QPSL68UXyatCQihc
 dH89CvDrq47a8+Ehi1PVoUVkFqj9sZuyK/KkC0+7hgE3hYVISM8qdEiCP9Z6LqN2XUos
 WItGk+H2CANCGhjEVodlc/Tv1vYeoyEcWGEw2w1funzfO6HcuRrk5fPMkKHVPoViQu9z
 bf1W/BYiwoDTmHpxQeUSsbZPzBCwSO9kAehktn/zzMB9Pj5yJIoJXILNKKHBssfaH1IW 4g== 
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

QXMgc3RhdGVkIGluIFNpTDkwMjIvMjQgZGF0YXNoZWV0LCBtYXN0ZXIgY2xvY2sgaXMgbm90IHJl
cXVpcmVkIGZvciBJMlMuCk1ha2UgbWNsayBwcm9wZXJ0eSBvcHRpb25hbCBpbiBEVCBiaW5kaW5n
cy4KCkZpeGVzOiAzZjE4MDIxZjQzYTMgKCJkdC1iaW5kaW5nczogZGlzcGxheTogc2lpOTAyeDog
QWRkIEhETUkgYXVkaW8gYmluZGluZ3MiKQoKU2lnbmVkLW9mZi1ieTogT2xpdmllciBNb3lzYW4g
PG9saXZpZXIubW95c2FuQHN0LmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4
dAppbmRleCAyZGY0NGI3ZDM4MjEuLjZlMTRlMDg3YzBkMCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0CisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4
LnR4dApAQCAtMjYsOSArMjYsOCBAQCBPcHRpb25hbCBwcm9wZXJ0aWVzOgogCS0gY2xvY2tzOiBw
aGFuZGxlIGFuZCBjbG9jayBzcGVjaWZpZXIgZm9yIGVhY2ggY2xvY2sgbGlzdGVkIGluCiAgICAg
ICAgICAgIHRoZSBjbG9jay1uYW1lcyBwcm9wZXJ0eQogCS0gY2xvY2stbmFtZXM6ICJtY2xrIgot
CSAgIERlc2NyaWJlcyBTSUk5MDJ4IE1DTEsgaW5wdXQuIE1DTEsgaXMgdXNlZCB0byBwcm9kdWNl
Ci0JICAgSERNSSBhdWRpbyBDVFMgdmFsdWVzLiBUaGlzIHByb3BlcnR5IGlzIHJlcXVpcmVkIGlm
Ci0JICAgIiNzb3VuZC1kYWktY2VsbHMiLXByb3BlcnR5IGlzIHByZXNlbnQuIFRoaXMgcHJvcGVy
dHkgZm9sbG93cworCSAgIERlc2NyaWJlcyBTSUk5MDJ4IE1DTEsgaW5wdXQuIE1DTEsgY2FuIGJl
IHVzZWQgdG8gcHJvZHVjZQorCSAgIEhETUkgYXVkaW8gQ1RTIHZhbHVlcy4gVGhpcyBwcm9wZXJ0
eSBmb2xsb3dzCiAJICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Ns
b2NrLWJpbmRpbmdzLnR4dAogCSAgIGNvbnN1bWVyIGJpbmRpbmcuCiAKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
