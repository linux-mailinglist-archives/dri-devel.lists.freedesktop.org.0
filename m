Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1A7EFBF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02B26ED62;
	Fri,  2 Aug 2019 09:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C246ED62
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 09:01:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x728uPH7020972; Fri, 2 Aug 2019 11:01:38 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u3vd066y2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 11:01:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3543B9E;
 Fri,  2 Aug 2019 09:01:33 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0897820758E;
 Fri,  2 Aug 2019 11:01:33 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 2 Aug
 2019 11:01:32 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Fri, 2 Aug 2019 11:01:32 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Philippe CORNU <philippe.cornu@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] ARM: dts: stm32: add phy-dsi-supply property on
 stm32mp157c
Thread-Topic: [PATCH v2 3/5] ARM: dts: stm32: add phy-dsi-supply property on
 stm32mp157c
Thread-Index: AQHVBzuHnoXkFoKaJ0KNORzeHQAWuKbn8cMA
Date: Fri, 2 Aug 2019 09:01:32 +0000
Message-ID: <e381b766-c576-828b-49a5-f13990b9d49f@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
 <1557498023-10766-4-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1557498023-10766-4-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <F7623D89E5834A4A9837C0DAEEC4B353@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_04:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=7Ej80Sr2nn1J/pVdAmFrBTdwivNSAGDRJ4LALs/pRAs=;
 b=l0u03LtRL7CpucxVBeTS3YFUYZQGLytOdi8EdVq6foN/tQEYIvUfC3pjHxo/bGWuRBrB
 Q/WNb1Nht4/tfu/jce/IqebD1BFZLHmjAXMK0Tx0lj2IUbC4IE1y8fPMFrPVl/r1f/dx
 9d3lSrSa+lDHJyqbglyHC2qFY9sMo6ELxrhMNE2uH2Qyf1cIN3LJVsheH3+GSbbLHgTQ
 cpx5w65R42yLlKLtRVqeDgOfRuALrm6mhciP3rLWFYzTEuENIREC7KmkIhR0Tq10fLCT
 BvEXVYYS3Ed9goUF+JsoFGRYUOdo+uzb4ZKV2fYWkhXng1o5L7AM9KWwAlAqhheMXo1+ dQ== 
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

SGkgQWxleGFuZHJlLA0KDQp0aGlzIHBhdGNoIGNhbiBiZSBhYmFuZG9uZWQuDQoNCkJSDQoNCi0t
IA0KWWFubmljayBGZXJ0csOpIHwgVElOQTogMTY2IDcxNTIgfCBUZWw6ICszMyAyNDQwMjcxNTIg
fCBNb2JpbGU6ICszMyA2MjA2MDAyNzANCk1pY3JvY29udHJvbGxlcnMgYW5kIERpZ2l0YWwgSUNz
IEdyb3VwIHwgTWljcm9jb250cm9sbGV1cnMgRGl2aXNpb24NCg0KDQpPbiA1LzEwLzE5IDQ6MjAg
UE0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToNCg0KPiBUaGUgZHNpIHBoeXNpY2FsIGxheWVyIGlz
IHBvd2VyZWQgYnkgdGhlIDF2OCBwb3dlciBjb250cm9sbGVyIHN1cHBseS4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+DQo+IC0tLQ0K
PiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLmR0c2kgfCAxICsNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNTdjLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5kdHNp
DQo+IGluZGV4IDJhZmVlZTYuLjZiMTRmMWUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNTdjLmR0c2kNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
N2MuZHRzaQ0KPiBAQCAtMTE1Niw2ICsxMTU2LDcgQEANCj4gICAJCQljbG9jay1uYW1lcyA9ICJw
Y2xrIiwgInJlZiIsICJweF9jbGsiOw0KPiAgIAkJCXJlc2V0cyA9IDwmcmNjIERTSV9SPjsNCj4g
ICAJCQlyZXNldC1uYW1lcyA9ICJhcGIiOw0KPiArCQkJcGh5LWRzaS1zdXBwbHkgPSA8JnJlZzE4
PjsNCj4gICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiAgIAkJfTsNCj4gICANCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
