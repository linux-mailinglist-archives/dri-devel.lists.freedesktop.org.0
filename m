Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0D4EA17
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 16:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0EF6E8C7;
	Fri, 21 Jun 2019 14:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFD36E8C6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 14:01:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDuf6Q019584; Fri, 21 Jun 2019 16:01:34 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813qkj6-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 16:01:34 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61B093D;
 Fri, 21 Jun 2019 14:01:32 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F072E2B25;
 Fri, 21 Jun 2019 14:01:31 +0000 (GMT)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 21 Jun
 2019 16:01:31 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1347.000; Fri, 21 Jun 2019 16:01:31 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/3] drm/stm: drv: fix suspend/resume
Thread-Topic: [PATCH 1/3] drm/stm: drv: fix suspend/resume
Thread-Index: AQHVJNzXIA8cZ3x1+kCqnLPAiEBAX6akq10AgAFdCYA=
Date: Fri, 21 Jun 2019 14:01:31 +0000
Message-ID: <2c169739-febb-12a9-0fa1-d5da053ded67@st.com>
References: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
 <CACvgo50vSNCTTTKp9D_07tazOE9YkU-zKAsDywvWe6h0NgcEmQ@mail.gmail.com>
In-Reply-To: <CACvgo50vSNCTTTKp9D_07tazOE9YkU-zKAsDywvWe6h0NgcEmQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <662427F63BD55B4D8D5465D3980AEB62@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_10:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ExRPSHAf2oaqoI/rvhpwZf2rtDMJg0QWAnnvxeZLPVI=;
 b=f+Jx5nMQp4ZRubCQ1iz1vgxfPg7ERoECkB6K/IN0XgRRT/rzSCYsGsuNV0haltz+9XcH
 7pfn75dECHZantSm1xIcyiRmj304+sDrc4Xbnf+AkVgjVDCU/AC6vVvmI+9Z+vvfz1U4
 Vct4KACAeBV/SiwjzYInOXtsLPVvnjG2JDO7ENsXOmLQeJFkW8nMFIS1FYPdLCHBRGAb
 59dzPvK4mrlqnbATvgSRS7wFLxY/QQgw/fVHwreLtGToEg6LXf6iDFY3rMduZL+7K6tN
 mMs+XrgYhVUzXUgY0TkJ5fI8o4m4SCqzHvlDfdVa2VF9LaaE9uNVv+xZAgWzz4Zr0XZ0 Eg== 
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
Cc: David Airlie <airlied@linux.ie>, Philippe CORNU <philippe.cornu@st.com>, ML
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbCwNCg0KVGhlIG1zbSBkcml2ZXIgdGVzdHMgdGhlIHJldHVybiB2YWx1ZSAmIHNldCBz
dGF0ZSB0byBOVUxMIGlmIG5vIGVycm9yIGlzIA0KZGV0ZWN0ZWQuDQoNCnRoZSBsdGRjIGRyaXZl
ciB0ZXN0cyB0aGUgcmV0dXJuIHZhbHVlICYgZm9yY2UgdG8gc3VzcGVuZCBpZiBhbiBlcnJvciBp
cyANCmRldGVjdGVkLg0KDQpJdCdzIG5vdCBleGFjdGx5IHRoZSBzYW1lLg0KDQpCZXN0IHJlZ2Fy
ZHMNCg0KDQotLSANCllhbm5pY2sgRmVydHLDqSB8IFRJTkE6IDE2NiA3MTUyIHwgVGVsOiArMzMg
MjQ0MDI3MTUyIHwgTW9iaWxlOiArMzMgNjIwNjAwMjcwDQpNaWNyb2NvbnRyb2xsZXJzIGFuZCBE
aWdpdGFsIElDcyBHcm91cCB8IE1pY3JvY29udHJvbGxldXJzIERpdmlzaW9uDQoNCk9uIDYvMjAv
MTkgNzoxMiBQTSwgRW1pbCBWZWxpa292IHdyb3RlOg0KPiBIaSBZYW5uaWNrLA0KPg0KPiBPbiBN
b24sIDE3IEp1biAyMDE5IGF0IDA4OjE4LCBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJl
QHN0LmNvbT4gd3JvdGU6DQo+DQo+PiBAQCAtMTU1LDE1ICsxNTQsMTcgQEAgc3RhdGljIF9fbWF5
YmVfdW51c2VkIGludCBkcnZfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+ICAgICAgICAg
IHN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGRkZXYtPmRldl9wcml2YXRlOw0KPj4gICAgICAg
ICAgaW50IHJldDsNCj4+DQo+PiArICAgICAgIGlmIChXQVJOX09OKCFsZGV2LT5zdXNwZW5kX3N0
YXRlKSkNCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsNCj4+ICsNCj4+ICAgICAg
ICAgIHBtX3J1bnRpbWVfZm9yY2VfcmVzdW1lKGRldik7DQo+PiAgICAgICAgICByZXQgPSBkcm1f
YXRvbWljX2hlbHBlcl9yZXN1bWUoZGRldiwgbGRldi0+c3VzcGVuZF9zdGF0ZSk7DQo+PiAtICAg
ICAgIGlmIChyZXQpIHsNCj4+ICsgICAgICAgaWYgKHJldCkNCj4gSG1tIHRoZSBtc20gZHJpdmVy
IHVzZXMgIXJldCBoZXJlLiBTdXNwZWN0aW5nIHRoYXQgeW91IHdhbnQgdGhlIHNhbWUsDQo+IGFs
dGhvdWdoIEkgaGF2ZW4ndCBjaGVja2VkIGluIGRldGFpbC4NCj4NCj4gSFRIDQo+IC1FbWlsDQot
LSANCllhbm5pY2sgRmVydHLDqSB8IFRJTkE6IDE2NiA3MTUyIHwgVGVsOiArMzMgMjQ0MDI3MTUy
IHwgTW9iaWxlOiArMzMgNjIwNjAwMjcwDQpNaWNyb2NvbnRyb2xsZXJzIGFuZCBEaWdpdGFsIElD
cyBHcm91cCB8IE1pY3JvY29udHJvbGxldXJzIERpdmlzaW9uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
