Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9FE7EFCF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B7C6ED63;
	Fri,  2 Aug 2019 09:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40F26ED63
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 09:03:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x728vM3B018928; Fri, 2 Aug 2019 11:03:31 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4tg5t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 11:03:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB20E31;
 Fri,  2 Aug 2019 09:02:32 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD126207592;
 Fri,  2 Aug 2019 11:02:32 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 2 Aug
 2019 11:02:32 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Fri, 2 Aug 2019 11:02:32 +0200
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
Subject: Re: [PATCH v2 5/5] ARM: dts: stm32: remove phy-dsi-supply property on
 stm32mp157c-dk2 board
Thread-Topic: [PATCH v2 5/5] ARM: dts: stm32: remove phy-dsi-supply property
 on stm32mp157c-dk2 board
Thread-Index: AQHVBzuIMmPsAzot0Uq2UP5LkBXpTqbn8gqA
Date: Fri, 2 Aug 2019 09:02:31 +0000
Message-ID: <3a0f3e01-3c02-c28b-a6ca-0114a84358fb@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
 <1557498023-10766-6-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1557498023-10766-6-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <B5D0500FA370C842AC6FEF97802FF46B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_04:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=C0m8VOSuji3KX8hrNViWDPsFJD/vhzuK4BKhEhxzv3U=;
 b=KyjNicjskzH4krtA0JDwg6IgaiV1pfOfcYgWD88pmlAS7c2wDfWBim/pyFkjzlfLvKRQ
 wxx/OawyZyv6SWHEdvSyOaQ3yUBzeKnhm8CO4d4aOYfxE/t+50EvhW48vCBAZDIn6mG5
 ++SGCMFsU2CGGTn5nD/D9NSb4QjnD78WiZCCTs22xoZ9ppEGLi20j63t9WBgHEd8+xOg
 Y5KRFnAs2a+Wfyz+muARZcmGgJKfLTGzOMQNZinozGFfMr6X45mCxWul9uhAjRju+Qdl
 XXWlxjSZCf9u9O33Ix2bERc4bj+0n4kwLXI/gzmPBMRAOmfwSiA6uk7FckWP2nj609CV Bg== 
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
IEdyb3VwIHwgTWljcm9jb250cm9sbGV1cnMgRGl2aXNpb24NCk9uIDUvMTAvMTkgNDoyMCBQTSwg
WWFubmljayBGZXJ0csOpIHdyb3RlOg0KPiBUaGlzIHByb3BlcnR5IGlzIGFscmVhZHkgZGVmaW5l
ZCBpbnRvIHN0bTMybXAxNTdjLmR0c2kgZmlsZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFubmlj
ayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMgfCAxIC0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBk
ZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
N2MtZGsyLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMNCj4gaW5k
ZXggMDIwZWEwZi4uMDlmNmU3YiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1N2MtZGsyLmR0cw0KPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1k
azIuZHRzDQo+IEBAIC0xNyw3ICsxNyw2IEBADQo+ICAgCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
PiAgIAkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gICAJc3RhdHVzID0gIm9rYXkiOw0KPiAtCXBoeS1k
c2ktc3VwcGx5ID0gPCZyZWcxOD47DQo+ICAgDQo+ICAgCXBvcnRzIHsNCj4gICAJCSNhZGRyZXNz
LWNlbGxzID0gPDE+OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
