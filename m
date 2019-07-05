Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F87605FA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 14:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BB78993B;
	Fri,  5 Jul 2019 12:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC138993B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 12:35:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65CVYTY029722; Fri, 5 Jul 2019 14:35:16 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tdwf1jhdu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 14:35:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 79C7D34;
 Fri,  5 Jul 2019 12:35:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40D982C7F;
 Fri,  5 Jul 2019 12:35:15 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 5 Jul
 2019 14:35:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 5 Jul 2019 14:35:14 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Olivier MOYSAN <olivier.moysan@st.com>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@siol.net"
 <jernej.skrabec@siol.net>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "jsarha@ti.com" <jsarha@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: sii902x: Change audio mclk
 binding
Thread-Topic: [PATCH 2/3] dt-bindings: display: sii902x: Change audio mclk
 binding
Thread-Index: AQHVMO2JtZ7sVttbMk6Xu8iqEAATraa72MyA
Date: Fri, 5 Jul 2019 12:35:14 +0000
Message-ID: <ca446f4b-d918-fe6d-f6bd-4aa07efbefac@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1562082426-14876-3-git-send-email-olivier.moysan@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <82CCEAE863094E428B349826FE92A781@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=njzQHa4+h1RnF+3DEZ8qWlHR8A0NDvMIkjMuExbOY/c=;
 b=Lms/oWpARTnfFQZUGeLLSL/L5nCtc4yzZ/CJ0qPJ0hKUMsYaYecBD/8UKtYDYaRrRHBt
 l2cG1M1ivkaqS6KPtjjDZzFp7+tv6a8Btq9SpvxDUUWWQtFHndcN96Zei+cX7Pnl17za
 lCrFTCEwLRM6Et0oiVg66e+9uElel5r76m8cdY4Uqf1hXM7kKTOSeeadR5UFlCWPcO27
 5h6salTtUNpFVrgDhLmYhcR6JrRewtugTCbL+tBa0NOfUoTAiYUAbUwhsO5ZwimFvkt3
 /6jFjyql7Bun7AVz1gsL5KWi0P8RSvHJIJ0hmG6DEEBRoIdy5bImxxgwrvn5EJ49lQ2o ig== 
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

SGkgT2xpdmllciwNCmFuZCBtYW55IHRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCkkgaGF2ZSBkb3Vi
bGUgY2hlY2tlZCBpbiB0aGUgc2lsOTAyMi8yNCBkYXRhc2hlZXQgYW5kIHlvdSBhcmUgcmlnaHQ6
DQoNCiJBcyBhbiBvcHRpb24sIHRoZSBvcmlnaW5hbCBNQ0xLIHNpZ25hbCB1c2VkIHRvIHN0cm9i
ZSB0aGUgSTJTIHNpZ25hbHMgDQpvdXQgZnJvbSB0aGUgc291cmNpbmcgY2hpcCBjYW4gYmUgdXNl
ZC4gSWYgdGhlIGludGVybmFsIFBMTCBpcyB1c2VkLCANCnRoZW4gYW4gZXh0ZXJuYWwgTUNMSyBp
bnB1dCBpcyBub3QgcmVxdWlyZWQuIg0KDQpTbywgZXZlbiBpZiAjc291bmQtZGFpLWNlbGxzIGlz
IHRoZXJlLCB0aGlzIGlzIG5vdCBtYW5kYXRvcnkgdG8gaGF2ZSBNQ0xLLg0KDQpSZXZpZXdlZC1i
eTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4NClBoaWxpcHBlIDotKQ0K
DQoNCk9uIDcvMi8xOSA1OjQ3IFBNLCBPbGl2aWVyIE1veXNhbiB3cm90ZToNCj4gQXMgc3RhdGVk
IGluIFNpTDkwMjIvMjQgZGF0YXNoZWV0LCBtYXN0ZXIgY2xvY2sgaXMgbm90IHJlcXVpcmVkIGZv
ciBJMlMuDQo+IE1ha2UgbWNsayBwcm9wZXJ0eSBvcHRpb25hbCBpbiBEVCBiaW5kaW5ncy4NCj4g
DQo+IEZpeGVzOiAzZjE4MDIxZjQzYTMgKCJkdC1iaW5kaW5nczogZGlzcGxheTogc2lpOTAyeDog
QWRkIEhETUkgYXVkaW8gYmluZGluZ3MiKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogT2xpdmllciBN
b3lzYW4gPG9saXZpZXIubW95c2FuQHN0LmNvbT4NCj4gLS0tDQo+ICAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0IHwgNSArKy0tLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL3NpaTkwMngudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL3NpaTkwMngudHh0DQo+IGluZGV4IDJkZjQ0YjdkMzgyMS4uNmUxNGUwODdj
MGQwIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2Uvc2lpOTAyeC50eHQNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0DQo+IEBAIC0yNiw5ICsyNiw4IEBA
IE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+ICAgCS0gY2xvY2tzOiBwaGFuZGxlIGFuZCBjbG9jayBz
cGVjaWZpZXIgZm9yIGVhY2ggY2xvY2sgbGlzdGVkIGluDQo+ICAgICAgICAgICAgICB0aGUgY2xv
Y2stbmFtZXMgcHJvcGVydHkNCj4gICAJLSBjbG9jay1uYW1lczogIm1jbGsiDQo+IC0JICAgRGVz
Y3JpYmVzIFNJSTkwMnggTUNMSyBpbnB1dC4gTUNMSyBpcyB1c2VkIHRvIHByb2R1Y2UNCj4gLQkg
ICBIRE1JIGF1ZGlvIENUUyB2YWx1ZXMuIFRoaXMgcHJvcGVydHkgaXMgcmVxdWlyZWQgaWYNCj4g
LQkgICAiI3NvdW5kLWRhaS1jZWxscyItcHJvcGVydHkgaXMgcHJlc2VudC4gVGhpcyBwcm9wZXJ0
eSBmb2xsb3dzDQo+ICsJICAgRGVzY3JpYmVzIFNJSTkwMnggTUNMSyBpbnB1dC4gTUNMSyBjYW4g
YmUgdXNlZCB0byBwcm9kdWNlDQo+ICsJICAgSERNSSBhdWRpbyBDVFMgdmFsdWVzLiBUaGlzIHBy
b3BlcnR5IGZvbGxvd3MNCj4gICAJICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4dA0KPiAgIAkgICBjb25zdW1lciBiaW5kaW5nLg0KPiAg
IA0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
