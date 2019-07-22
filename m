Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99B704FC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E1889CD8;
	Mon, 22 Jul 2019 16:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27A889CD4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 16:06:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MG1ITI002144; Mon, 22 Jul 2019 18:06:05 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tuw7w391e-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 18:06:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F02D838;
 Mon, 22 Jul 2019 16:06:04 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C484652BB;
 Mon, 22 Jul 2019 16:06:04 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul
 2019 18:06:04 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul 2019 18:06:04
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
Subject: [PATCH v2 2/3] dt-bindings: display: sii902x: Change audio mclk
 binding
Date: Mon, 22 Jul 2019 18:05:59 +0200
Message-ID: <1563811560-29589-3-git-send-email-olivier.moysan@st.com>
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
 bh=d7z0bc5ddIegrEON9PA826gu/aOX90pz7EYmNLgF1Eg=;
 b=XVkDOxOhGfHnkorsYJLRrlA5ooG84J//7fcFWzDNt/fbRXjIAludfLutY7Hse+BIRoYj
 zAFhgeWo9qYpisJwcXsmHNJkMMx5QqsknzTnW6qUNhKGmWlEMdgd1pB8ZSDLv3Hxvymz
 XvdO4Z03mO3OEnuupt2zkBQLQMRdkTO2ZuxyvVyEEGAUgG/NQZfAp7VcqVZrhsHSl55n
 x4mEh3NGr6sUi0rWohXJuDi8bBhycWjWe8MMnDB34yScZUxH9yQFqMAAfptepbDqyn7Y
 2l+Vn6vdh0bhvryI0f/zXTjELNd8JwKPGBHGo/uifBCzvbiNe2+gFKeEU8QRHAFYUQfj zg== 
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
PG9saXZpZXIubW95c2FuQHN0LmNvbT4KUmV2aWV3ZWQtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0
aS5jb20+CkFja2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0K
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4
LnR4dCB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL3NpaTkwMngudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0CmluZGV4IDJkZjQ0YjdkMzgyMS4uNmUxNGUw
ODdjMGQwIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2Uvc2lpOTAyeC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0CkBAIC0yNiw5ICsyNiw4IEBAIE9wdGlv
bmFsIHByb3BlcnRpZXM6CiAJLSBjbG9ja3M6IHBoYW5kbGUgYW5kIGNsb2NrIHNwZWNpZmllciBm
b3IgZWFjaCBjbG9jayBsaXN0ZWQgaW4KICAgICAgICAgICAgdGhlIGNsb2NrLW5hbWVzIHByb3Bl
cnR5CiAJLSBjbG9jay1uYW1lczogIm1jbGsiCi0JICAgRGVzY3JpYmVzIFNJSTkwMnggTUNMSyBp
bnB1dC4gTUNMSyBpcyB1c2VkIHRvIHByb2R1Y2UKLQkgICBIRE1JIGF1ZGlvIENUUyB2YWx1ZXMu
IFRoaXMgcHJvcGVydHkgaXMgcmVxdWlyZWQgaWYKLQkgICAiI3NvdW5kLWRhaS1jZWxscyItcHJv
cGVydHkgaXMgcHJlc2VudC4gVGhpcyBwcm9wZXJ0eSBmb2xsb3dzCisJICAgRGVzY3JpYmVzIFNJ
STkwMnggTUNMSyBpbnB1dC4gTUNMSyBjYW4gYmUgdXNlZCB0byBwcm9kdWNlCisJICAgSERNSSBh
dWRpbyBDVFMgdmFsdWVzLiBUaGlzIHByb3BlcnR5IGZvbGxvd3MKIAkgICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0CiAJICAgY29uc3Vt
ZXIgYmluZGluZy4KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
