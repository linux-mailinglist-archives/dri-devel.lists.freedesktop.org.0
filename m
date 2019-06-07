Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8927F38684
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 10:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B23389C59;
	Fri,  7 Jun 2019 08:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF57D89C59
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 08:51:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x578lkLW020863; Fri, 7 Jun 2019 10:51:48 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sxqyag6ke-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 07 Jun 2019 10:51:48 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 838C631;
 Fri,  7 Jun 2019 08:51:47 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 392C92418;
 Fri,  7 Jun 2019 08:51:47 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 7 Jun
 2019 10:51:46 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Fri, 7 Jun 2019 10:51:46 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/stm: ltdc: No message if probe
Thread-Topic: [PATCH] drm/stm: ltdc: No message if probe
Thread-Index: AQHVGebHlINPLriVvEmsaJiAOSjopaaPxxgA
Date: Fri, 7 Jun 2019 08:51:46 +0000
Message-ID: <ca5d4bcf-6020-e924-5577-d7cf9134958b@st.com>
References: <1559550694-14042-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1559550694-14042-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <7B55EC5FADFCC44EAE136C92B3552228@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-07_04:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=289jIq72HReUea+FJ6403zWGNXEwuJ8Avm9se1eRFVs=;
 b=bZMIS76bzCEimOuzXsuwDBL0euXeiX+OBUVUOd5Ebyd+ng9zQBLaAbMIjGQld/J10TJV
 pOrSSJQzh9IpsrACyKc+FXSxyYEyT8l1eckxQ7zXW7weVyysLiE5GNtU6LRkqmGEkzGX
 qXYGxj3Bnx28NG78BdGiO+3ZeP/Jd7PzjEnrlM7kgZdRb0l41uJMECiRA3+1MMhvNa+R
 fXtBnQ9qYu0bzkGYyPaHHzH4qOu39N+GUm7o4wvlio+feXH26jCAO1wHW8kAy9yukqvv
 1geBMYSzZWtxHT63GmDdP1HgbyyI6yDOzzc5Z7JNV22UaoqbjIJe3iNRRq9KLRLKLcZt BQ== 
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

SGkgWWFubmljaywNCg0KVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoDQoNCkFja2VkLWJ5OiBQaGls
aXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KDQpQaGlsaXBwZSA6LSkNCg0KT24g
Ni8zLzE5IDEwOjMxIEFNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6DQo+IFByaW50IGRpc3BsYXkg
Y29udHJvbGxlciBoYXJkd2FyZSB2ZXJzaW9uIGluIGRlYnVnIG1vZGUgb25seS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+
IGluZGV4IGE0MDg3MGIuLjJmZTZjNGEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+IEBAIC0xMjI5
LDcgKzEyMjksNyBAQCBpbnQgbHRkY19sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQ0KPiAg
IAkJZ290byBlcnI7DQo+ICAgCX0NCj4gICANCj4gLQlEUk1fSU5GTygibHRkYyBodyB2ZXJzaW9u
IDB4JTA4eCAtIHJlYWR5XG4iLCBsZGV2LT5jYXBzLmh3X3ZlcnNpb24pOw0KPiArCURSTV9ERUJV
R19EUklWRVIoImx0ZGMgaHcgdmVyc2lvbiAweCUwOHhcbiIsIGxkZXYtPmNhcHMuaHdfdmVyc2lv
bik7DQo+ICAgDQo+ICAgCS8qIEFkZCBlbmRwb2ludHMgcGFuZWxzIG9yIGJyaWRnZXMgaWYgYW55
ICovDQo+ICAgCWZvciAoaSA9IDA7IGkgPCBNQVhfRU5EUE9JTlRTOyBpKyspIHsNCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
