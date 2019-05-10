Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1B51A0DC
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 18:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F6A88905;
	Fri, 10 May 2019 16:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF84588905
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 16:00:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AFuhES008206; Fri, 10 May 2019 18:00:01 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2scbkajhc4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:00:00 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E98131;
 Fri, 10 May 2019 16:00:00 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 025342BC7;
 Fri, 10 May 2019 16:00:00 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 May
 2019 17:59:59 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Fri, 10 May 2019 17:59:59 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
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
Subject: Re: [PATCH v2 1/5] dt-bindings: display: stm32: add supply property
 to DSI controller
Thread-Topic: [PATCH v2 1/5] dt-bindings: display: stm32: add supply property
 to DSI controller
Thread-Index: AQHVBzuF9L+c6jD/yE6vZXdpGT1GuKZkYtcA
Date: Fri, 10 May 2019 15:59:59 +0000
Message-ID: <2a00b710-9c7d-bd87-5a33-a39d13d6f71a@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
 <1557498023-10766-2-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1557498023-10766-2-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <6C07FBD58C6BDA4B933A6AEECCC7475C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ZmiWqi3VRYjxFBJXXYMyU0w/ZkHFGAKvuSRuq9pwhv4=;
 b=gt61CDietdxz9kd9zEFodPSYxuHdjr0bFywMo5ZgslzblZQkEqGi0dcPtU6CWmpMIT1D
 DwHtmKcUG+eaUrN7BJq1HbnwcvQF8PGbTIv91glzzSYTb4q+FeuKA+zvJdSPxG2QDZJq
 xSLDUNgFjk2O1H9vLubkC6HbPxT16GC8a2XP/UC6QB70LCzbvIbO2tz3BvCFu6uoBu36
 v5tQsRBoXKQl3JcXjHkp04ksp3LWueLLiDcBxdebOnue7SQA3QriFcbv8x0H/46L7aQF
 Tk/nNshG/oCX98XPdvXuaEfASKHtAijojPKq3l++VjzMZVsiXhEMdhlVB+8xqQHdR0ca pg== 
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

RGVhciBZYW5uaWNrLA0KVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLA0KDQooYWxyZWFkeSA7LSkN
ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KDQpQ
aGlsaXBwZSA6KQ0KDQoNCk9uIDUvMTAvMTkgNDoyMCBQTSwgWWFubmljayBGZXJ0csOpIHdyb3Rl
Og0KPiBUaGlzIHBhdGNoIGFkZHMgZG9jdW1lbnRhdGlvbiBvZiBhIG5ldyBwcm9wZXJ0eSBwaHkt
ZHNpLXN1cHBseSB0byB0aGUNCj4gU1RNMzIgRFNJIGNvbnRyb2xsZXIuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gLS0tDQo+
ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRk
Yy50eHQgfCAzICsrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9z
dCxzdG0zMi1sdGRjLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3N0LHN0bTMyLWx0ZGMudHh0DQo+IGluZGV4IDNlYjFiNDguLjYwYzU0ZGEgMTAwNjQ0DQo+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMy
LWx0ZGMudHh0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3N0LHN0bTMyLWx0ZGMudHh0DQo+IEBAIC00MCw2ICs0MCw4IEBAIE1hbmRhdG9yeSBub2Rl
cyBzcGVjaWZpYyB0byBTVE0zMiBEU0k6DQo+ICAgLSBwYW5lbCBvciBicmlkZ2Ugbm9kZTogQSBu
b2RlIGNvbnRhaW5pbmcgdGhlIHBhbmVsIG9yIGJyaWRnZSBkZXNjcmlwdGlvbiBhcw0KPiAgICAg
ZG9jdW1lbnRlZCBpbiBbNl0uDQo+ICAgICAtIHBvcnQ6IHBhbmVsIG9yIGJyaWRnZSBwb3J0IG5v
ZGUsIGNvbm5lY3RlZCB0byB0aGUgRFNJIG91dHB1dCBwb3J0IChwb3J0QDEpLg0KPiArT3B0aW9u
YWwgcHJvcGVydGllczoNCj4gKy0gcGh5LWRzaS1zdXBwbHk6IHBoYW5kbGUgb2YgdGhlIHJlZ3Vs
YXRvciB0aGF0IHByb3ZpZGVzIHRoZSBzdXBwbHkgdm9sdGFnZS4NCj4gICANCj4gICBOb3RlOiBZ
b3UgY2FuIGZpbmQgbW9yZSBkb2N1bWVudGF0aW9uIGluIHRoZSBmb2xsb3dpbmcgcmVmZXJlbmNl
cw0KPiAgIFsxXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2st
YmluZGluZ3MudHh0DQo+IEBAIC0xMDEsNiArMTAzLDcgQEAgRXhhbXBsZSAyOiBEU0kgcGFuZWwN
Cj4gICAJCQljbG9jay1uYW1lcyA9ICJwY2xrIiwgInJlZiI7DQo+ICAgCQkJcmVzZXRzID0gPCZy
Y2MgU1RNMzJGNF9BUEIyX1JFU0VUKERTSSk+Ow0KPiAgIAkJCXJlc2V0LW5hbWVzID0gImFwYiI7
DQo+ICsJCQlwaHktZHNpLXN1cHBseSA9IDwmcmVnMTg+Ow0KPiAgIA0KPiAgIAkJCXBvcnRzIHsN
Cj4gICAJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
