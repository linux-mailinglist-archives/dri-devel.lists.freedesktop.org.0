Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D88210AD7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 14:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815396E8A8;
	Wed,  1 Jul 2020 12:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFE36E8A7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 12:14:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061BsUu7021378; Wed, 1 Jul 2020 14:14:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ElQqRriH1QX9ILEW5cxpVwnRN26Yg1fABIoxuE8C/Pw=;
 b=I4+eqwzVPzQmrVxWPr7SQ/XzYfWPayIy9ZSs2bRvHtznblo0wq7RtHGT8mRlixiRGdeS
 qzrCN9huM8wgN9K83wAVai9m/Np8a38h5NJvEvxs3oEYpsxsPB3aG/wMKCU7xGKwUHyF
 1f+afpG/i8kEAl5OpAPE65fTrHMQzrYkvZMeiOrvBWBLwESCo15q2cFaGZhORHTit575
 EDiNM66Ya2sNOGPWlNIFkSZ2n+J3i/6Anyd+838JKFVm5WKbmRnyMaTntGxZ3cbC+wsx
 8rK7IAo8R1wEmBMFNyxsMJ7LdydL0qv73Hlp0dbFY8efuQMRgZq+6mbpCJQV6aI80bYQ Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0g9uvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 14:14:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 001E610002A;
 Wed,  1 Jul 2020 14:14:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC3B42B38F0;
 Wed,  1 Jul 2020 14:14:25 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Jul
 2020 14:14:25 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Wed, 1 Jul 2020 14:14:25 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Marek Vasut <marex@denx.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/stm: repair runtime power management
Thread-Topic: [PATCH] drm/stm: repair runtime power management
Thread-Index: AQHV7030VJbZ4GaETU+KrBeQ3BjZvqhAG4HQgAAJD4CAsx2dAA==
Date: Wed, 1 Jul 2020 12:14:25 +0000
Message-ID: <68f47008-f0ed-384c-7e21-f29b444da3ee@st.com>
References: <20200229221649.90813-1-marex@denx.de>
 <a30ad5a774004221903292871797607a@SFHDAG6NODE1.st.com>
 <64ea7f77-0a0b-ae3a-2911-5fdc8633255e@denx.de>
In-Reply-To: <64ea7f77-0a0b-ae3a-2911-5fdc8633255e@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <1772EFA3939F754A9D4C23893EC367CD@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_07:2020-07-01,
 2020-07-01 signatures=0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Philippe CORNU <philippe.cornu@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDMvOS8yMCAxMjo1NyBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+IE9uIDMvOS8yMCAx
MTozNSBBTSwgWWFubmljayBGRVJUUkUgd3JvdGU6DQo+PiBIZWxsbyBNYXJlaywNCj4gDQo+IEhp
LA0KPiANCj4gKHBsZWFzZSBzdG9wIHRvcC1wb3N0aW5nKQ0KPiANCj4+IFRoYW5rIGZvciB5b3Vy
IHBhdGNoLiBQbV9ydW50aW1lX3B1dF9zeW5jIGlzIGFsc28gZG9uZSBpbnRvIGZ1bmN0aW9uIGx0
ZGNfY3J0Y19tb2RlX2ZpeHVwLg0KPj4gVG8gYXZvaWQgc2V2ZXJhbCBjYWxsIG9mIFBtX3J1bnRp
bWVfcHV0X3N5bmMsIGl0IGNvdWxkIGJlIGJldHRlciB0byBjaGVjayBwbV9ydW50aW1lIGFjdGl2
aXR5Og0KPj4NCj4+ICsJaW50IHJldDsNCj4+ICAgDQo+PiAgIAlEUk1fREVCVUdfRFJJVkVSKCJc
biIpOw0KPj4gICANCj4+ICsJaWYgKCFwbV9ydW50aW1lX2FjdGl2ZShkZGV2LT5kZXYpKSB7DQo+
PiArCQlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKGRkZXYtPmRldik7DQo+PiArCQlpZiAocmV0
KSB7DQo+PiArCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gZW5hYmxlIGNydGMsIGNhbm5vdCBnZXQg
c3luY1xuIik7DQo+PiArCQkJcmV0dXJuOw0KPj4gKwkJfQ0KPj4gKwl9DQo+PiArDQo+IA0KPiBX
aGVyZSBzaG91bGQgdGhpcyBnbyA/IEFuZCB3b3VsZG4ndCB0aGF0IG9ubHkgaGlkZSBuYXN0aWVy
IFBNIGltYmFsYW5jZQ0KPiBpc3N1ZXMgPw0KSGkgTWFyZWssDQpJIHRlc3RlZCB0aGUgcGF0Y2gg
JiAgaXQgZ2VuZXJhdGUgYW4gZXJyb3Igd2hlbiBJIHRyeSB3YWtlIHVwIC8gc2xlZXAgDQp0aGUg
Ym9hcmQgU1RNMzJNUDEgREsyIHdpdGggd2VzdG9uIGFwcGxpY2F0aW9uLg0KSXQgbmVlZCBhbiBh
ZGRpdGlvbmFsIHBhdGNoIA0KZHJtLXN0bS1sdGRjLXJlbW92ZS1jYWxsLW9mLXBtLXJ1bnRpbWUt
ZnVuY3Rpb25zLg0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4NCg0KVGVzdGVkLWJ5OiBZYW5uaWNr
IEZlcnRyZSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KDQoNCj4gDQo+PiAgIEJlc3QgcmVnYXJk
cw0KPj4NCj4+IFlhbm5pY2sgRmVydHLDqQ0KPj4NCj4+DQo+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPj4gRnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+PiBTZW50OiBz
YW1lZGkgMjkgZsOpdnJpZXIgMjAyMCAyMzoxNw0KPj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4+IENjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT47IFlhbm5pY2sg
RkVSVFJFIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+OyBQaGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUu
Y29ybnVAc3QuY29tPjsgQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFy
by5vcmc+OyBWaW5jZW50IEFCUklPVSA8dmluY2VudC5hYnJpb3VAc3QuY29tPjsgTWF4aW1lIENv
cXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPjsgQWxleGFuZHJlIFRPUkdVRSA8YWxl
eGFuZHJlLnRvcmd1ZUBzdC5jb20+OyBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4+IFN1YmplY3Q6
IFtQQVRDSF0gZHJtL3N0bTogcmVwYWlyIHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudA0KPj4NCj4+
IEFkZCBtaXNzaW5nIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBpbnRvIGx0ZGNfY3J0Y19hdG9taWNf
ZW5hYmxlKCkgdG8gbWF0Y2ggcG1fcnVudGltZV9wdXRfc3luYygpIGluIGx0ZGNfY3J0Y19hdG9t
aWNfZGlzYWJsZSgpLCBvdGhlcndpc2UgdGhlIExUREMgbWlnaHQgc3VzcGVuZCB2aWEgcnVudGlt
ZSBQTSwgZGlzYWJsZSBjbG9jaywgYW5kIHRoZW4gZmFpbCB0byByZXN1bWUgbGF0ZXIgb24uDQo+
Pg0KPj4gVGhlIHRlc3Qgd2hpY2ggdHJpZ2dlcnMgaXQgaXMgcm91Z2hseSAtLSBydW4gcXQ1IGFw
cGxpY2F0aW9uIHdoaWNoIHVzZXMgZWdsZnMgcGxhdGZvcm0gYW5kIGV0bmF2aXYsIHN0b3AgdGhl
IGFwcGxpY2F0aW9uLCBzbGVlcCBmb3IgMTUgbWludXRlcywgcnVuIHRoZSBhcHBsaWNhdGlvbiBh
Z2Fpbi4gVGhpcyBsZWFkcyB0byBhIHRpbWVvdXQgd2FpdGluZyBmb3IgdnN5bmMsIGJlY2F1c2Ug
dGhlIExUREMgaGFzIHN1c3BlbmRlZCwgYnV0IGRpZCBub3QgcmVzdW1lLg0KPj4NCj4+IEZpeGVz
OiAzNWFiNmNmYmYyMTEgKCJkcm0vc3RtOiBzdXBwb3J0IHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVu
dCIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4+IENj
OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4+IENjOiBQaGlsaXBw
ZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KPj4gQ2M6IEJlbmphbWluIEdhaWduYXJk
IDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPg0KPj4gQ2M6IFZpbmNlbnQgQWJyaW91IDx2
aW5jZW50LmFicmlvdUBzdC5jb20+DQo+PiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4u
c3RtMzJAZ21haWwuY29tPg0KPj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3Jn
dWVAc3QuY29tPg0KPj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IENj
OiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tDQo+PiBDYzogbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+PiAtLS0NCj4+IC0tLS0tLS0tLS0tLVsg
Y3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPj4gV0FSTklORzogQ1BVOiAwIFBJRDogMjk3IGF0IGRy
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jOjE0OTQgZHJtX2F0b21pY19oZWxwZXJf
d2FpdF9mb3JfdmJsYW5rcysweDFkYy8weDIwMA0KPj4gW0NSVEM6MzU6Y3J0Yy0wXSB2Ymxhbmsg
d2FpdCB0aW1lZCBvdXQNCj4+IE1vZHVsZXMgbGlua2VkIGluOg0KPj4gQ1BVOiAwIFBJRDogMjk3
IENvbW06IFFTR1JlbmRlclRocmVhZCBOb3QgdGFpbnRlZCA1LjYuMC1yYzMtbmV4dC0yMDIwMDIy
OC0wMDAxMC1nMzE4YmYwZmMwOGVmICMyIEhhcmR3YXJlIG5hbWU6IFNUTTMyIChEZXZpY2UgVHJl
ZSBTdXBwb3J0KSBbPGMwMTBmMThjPl0gKHVud2luZF9iYWNrdHJhY2UpIGZyb20gWzxjMDEwYWZi
OD5dIChzaG93X3N0YWNrKzB4MTAvMHgxNCkgWzxjMDEwYWZiOD5dIChzaG93X3N0YWNrKSBmcm9t
IFs8YzA3YjFkM2M+XSAoZHVtcF9zdGFjaysweGI0LzB4ZDApIFs8YzA3YjFkM2M+XSAoZHVtcF9z
dGFjaykgZnJvbSBbPGMwMTFkOGI4Pl0gKF9fd2FybisweGQ0LzB4ZjApIFs8YzAxMWQ4Yjg+XSAo
X193YXJuKSBmcm9tIFs8YzAxMWRjNGM+XSAod2Fybl9zbG93cGF0aF9mbXQrMHg3OC8weGE4KSBb
PGMwMTFkYzRjPl0gKHdhcm5fc2xvd3BhdGhfZm10KSBmcm9tIFs8YzA0YTI2NmM+XSAoZHJtX2F0
b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcysweDFkYy8weDIwMCkNCj4+IFs8YzA0YTI2NmM+
XSAoZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcykgZnJvbSBbPGMwNGE1MTBjPl0g
KGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsKzANCj4+IHg1MC8weDYwKQ0KPj4gWzxjMDRh
NTEwYz5dIChkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbCkgZnJvbSBbPGMwNGE1MmE4Pl0g
KGNvbW1pdF90YWlsKzB4MTJjLzB4MTNjKSBbPGMwNGE1MmE4Pl0gKGNvbW1pdF90YWlsKSBmcm9t
IFs8YzA0YTUzYjQ+XSAoZHJtX2F0b21pY19oZWxwZXJfY29tbWl0KzB4ZjQvMHgxMDApDQo+PiBb
PGMwNGE1M2I0Pl0gKGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCkgZnJvbSBbPGMwNGEyZDM4Pl0g
KGRybV9hdG9taWNfaGVscGVyX3NldF9jb25maWcrMHg1OC8weDZjKQ0KPj4gWzxjMDRhMmQzOD5d
IChkcm1fYXRvbWljX2hlbHBlcl9zZXRfY29uZmlnKSBmcm9tIFs8YzA0YjE5OTQ+XSAoZHJtX21v
ZGVfc2V0Y3J0YysweDQ1MC8weDU1MCkgWzxjMDRiMTk5ND5dIChkcm1fbW9kZV9zZXRjcnRjKSBm
cm9tIFs8YzA0YWQ1NzA+XSAoZHJtX2lvY3RsX2tlcm5lbCsweDkwLzB4ZTgpIFs8YzA0YWQ1NzA+
XSAoZHJtX2lvY3RsX2tlcm5lbCkgZnJvbSBbPGMwNGFkOGFjPl0gKGRybV9pb2N0bCsweDJlNC8w
eDMyYykgWzxjMDRhZDhhYz5dIChkcm1faW9jdGwpIGZyb20gWzxjMDI0Njc4ND5dICh2ZnNfaW9j
dGwrMHgyMC8weDM4KSBbPGMwMjQ2Nzg0Pl0gKHZmc19pb2N0bCkgZnJvbSBbPGMwMjQ3MGYwPl0g
KGtzeXNfaW9jdGwrMHhiYy8weDdiMCkgWzxjMDI0NzBmMD5dIChrc3lzX2lvY3RsKSBmcm9tIFs8
YzAxMDEwMDA+XSAocmV0X2Zhc3Rfc3lzY2FsbCsweDAvMHg1NCkgRXhjZXB0aW9uIHN0YWNrKDB4
ZWU4ZjNmYTggdG8gMHhlZThmM2ZmMCkNCj4+IDNmYTA6ICAgICAgICAgICAgICAgICAgIDAwMDAw
MDA1IGFkY2JlYjE4IDAwMDAwMDA1IGMwNjg2NGEyIGFkY2JlYjE4IDAwMDAwMDAxDQo+PiAzZmMw
OiAwMDAwMDAwNSBhZGNiZWIxOCBjMDY4NjRhMiAwMDAwMDAzNiAwMDAwMDAyOSAwMDAwMDAyMyAw
MDAwMDAyMyAwMDAwMDAwNw0KPj4gM2ZlMDogYjExM2IwOTggYWRjYmVhZmMgYjExMjU0MTMgYjYx
NTVjZjggLS0tWyBlbmQgdHJhY2UgMmFkNWJhOTU0Y2ViNzY3YSBdLS0tDQo+PiAtLS0NCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAzICsrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgaW5kZXggOTliZjkzZThiMzZmLi4z
MDFkZTA0OTgwNzggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYw0K
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMNCj4+IEBAIC00MjUsOSArNDI1LDEy
IEBAIHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YywNCj4+ICAgCQkJCSAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9zdGF0ZSkgIHsN
Cj4+ICAgCXN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGNydGNfdG9fbHRkYyhjcnRjKTsNCj4+
ICsJc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBjcnRjLT5kZXY7DQo+PiAgIA0KPj4gICAJRFJN
X0RFQlVHX0RSSVZFUigiXG4iKTsNCj4+ICAgDQo+PiArCXBtX3J1bnRpbWVfZ2V0X3N5bmMoZGRl
di0+ZGV2KTsNCj4+ICsNCj4+ICAgCS8qIFNldHMgdGhlIGJhY2tncm91bmQgY29sb3IgdmFsdWUg
Ki8NCj4+ICAgCXJlZ193cml0ZShsZGV2LT5yZWdzLCBMVERDX0JDQ1IsIEJDQ1JfQkNCTEFDSyk7
DQo+PiAgIA0KPj4gLS0NCj4+IDIuMjUuMA0KPj4NCj4gDQo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
