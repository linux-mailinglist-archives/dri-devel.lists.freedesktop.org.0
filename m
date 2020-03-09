Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FCD17DDC1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 11:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2458889F2D;
	Mon,  9 Mar 2020 10:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9935289F4A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 10:36:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 029AS0Rx032090; Mon, 9 Mar 2020 11:35:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=gkedvpgGzYuHEcUHD8aw1dQvHH53NnM4TKKriFou9hk=;
 b=04vKHHKo7UXIYWtNgQajJhGsIouZppnKUKjmjpFPMdtiowzAQ7QP1YhFI9cRmM+Y2wN+
 BG2xyiE+64jlHZYN7f13qhlUP1w8kXvWG5lia642K99C00PbL4/Z8mEb4eKUoGYCk+dt
 NxhA/mDk2pPvrViA5yiYBdxIsslvhIPI5xFsJzjPV0gA0QKZNWOL5jM+FxpzIn5eo7cW
 7L33+lyUEMEubppyOqymUaNRHWwCE4qUEDQWdUJq0rFy45bz9xduR/XHarsgR9APfuqO
 5h2+J2WZhAOEDRP3mgr1AFh1wO+kS2xHsUG6bbsCZ2Onjjw4L9ypN4ZOiN9DUiQZULrw 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym1mgkk5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2020 11:35:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB953100034;
 Mon,  9 Mar 2020 11:35:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C32E82AC95A;
 Mon,  9 Mar 2020 11:35:51 +0100 (CET)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Mar
 2020 11:35:51 +0100
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Mon, 9 Mar 2020 11:35:51 +0100
From: Yannick FERTRE <yannick.fertre@st.com>
To: Marek Vasut <marex@denx.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/stm: repair runtime power management
Thread-Topic: [PATCH] drm/stm: repair runtime power management
Thread-Index: AQHV7030VJbZ4GaETU+KrBeQ3BjZvqhAG4HQ
Date: Mon, 9 Mar 2020 10:35:51 +0000
Message-ID: <a30ad5a774004221903292871797607a@SFHDAG6NODE1.st.com>
References: <20200229221649.90813-1-marex@denx.de>
In-Reply-To: <20200229221649.90813-1-marex@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_02:2020-03-08,
 2020-03-09 signatures=0
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

SGVsbG8gTWFyZWssDQpUaGFuayBmb3IgeW91ciBwYXRjaC4gUG1fcnVudGltZV9wdXRfc3luYyBp
cyBhbHNvIGRvbmUgaW50byBmdW5jdGlvbiBsdGRjX2NydGNfbW9kZV9maXh1cC4NClRvIGF2b2lk
IHNldmVyYWwgY2FsbCBvZiBQbV9ydW50aW1lX3B1dF9zeW5jLCBpdCBjb3VsZCBiZSBiZXR0ZXIg
dG8gY2hlY2sgcG1fcnVudGltZSBhY3Rpdml0eToNCg0KKwlpbnQgcmV0Ow0KIA0KIAlEUk1fREVC
VUdfRFJJVkVSKCJcbiIpOw0KIA0KKwlpZiAoIXBtX3J1bnRpbWVfYWN0aXZlKGRkZXYtPmRldikp
IHsNCisJCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoZGRldi0+ZGV2KTsNCisJCWlmIChyZXQp
IHsNCisJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBlbmFibGUgY3J0YywgY2Fubm90IGdldCBzeW5j
XG4iKTsNCisJCQlyZXR1cm47DQorCQl9DQorCX0NCisNCg0KIEJlc3QgcmVnYXJkcw0KDQpZYW5u
aWNrIEZlcnRyw6kNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWFyZWsg
VmFzdXQgPG1hcmV4QGRlbnguZGU+IA0KU2VudDogc2FtZWRpIDI5IGbDqXZyaWVyIDIwMjAgMjM6
MTcNClRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTWFyZWsgVmFzdXQg
PG1hcmV4QGRlbnguZGU+OyBZYW5uaWNrIEZFUlRSRSA8eWFubmljay5mZXJ0cmVAc3QuY29tPjsg
UGhpbGlwcGUgQ09STlUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT47IEJlbmphbWluIEdhaWduYXJk
IDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPjsgVmluY2VudCBBQlJJT1UgPHZpbmNlbnQu
YWJyaW91QHN0LmNvbT47IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNv
bT47IEFsZXhhbmRyZSBUT1JHVUUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPjsgbGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbTsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnDQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9zdG06IHJlcGFpciBydW50aW1lIHBv
d2VyIG1hbmFnZW1lbnQNCg0KQWRkIG1pc3NpbmcgcG1fcnVudGltZV9nZXRfc3luYygpIGludG8g
bHRkY19jcnRjX2F0b21pY19lbmFibGUoKSB0byBtYXRjaCBwbV9ydW50aW1lX3B1dF9zeW5jKCkg
aW4gbHRkY19jcnRjX2F0b21pY19kaXNhYmxlKCksIG90aGVyd2lzZSB0aGUgTFREQyBtaWdodCBz
dXNwZW5kIHZpYSBydW50aW1lIFBNLCBkaXNhYmxlIGNsb2NrLCBhbmQgdGhlbiBmYWlsIHRvIHJl
c3VtZSBsYXRlciBvbi4NCg0KVGhlIHRlc3Qgd2hpY2ggdHJpZ2dlcnMgaXQgaXMgcm91Z2hseSAt
LSBydW4gcXQ1IGFwcGxpY2F0aW9uIHdoaWNoIHVzZXMgZWdsZnMgcGxhdGZvcm0gYW5kIGV0bmF2
aXYsIHN0b3AgdGhlIGFwcGxpY2F0aW9uLCBzbGVlcCBmb3IgMTUgbWludXRlcywgcnVuIHRoZSBh
cHBsaWNhdGlvbiBhZ2Fpbi4gVGhpcyBsZWFkcyB0byBhIHRpbWVvdXQgd2FpdGluZyBmb3IgdnN5
bmMsIGJlY2F1c2UgdGhlIExUREMgaGFzIHN1c3BlbmRlZCwgYnV0IGRpZCBub3QgcmVzdW1lLg0K
DQpGaXhlczogMzVhYjZjZmJmMjExICgiZHJtL3N0bTogc3VwcG9ydCBydW50aW1lIHBvd2VyIG1h
bmFnZW1lbnQiKQ0KU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQpD
YzogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+DQpDYzogUGhpbGlwcGUg
Q29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4NCkNjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVu
amFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4NCkNjOiBWaW5jZW50IEFicmlvdSA8dmluY2VudC5h
YnJpb3VAc3QuY29tPg0KQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWls
LmNvbT4NCkNjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4NClRv
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogbGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQ0KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZw0KLS0tDQotLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCldBUk5J
Tkc6IENQVTogMCBQSUQ6IDI5NyBhdCBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIu
YzoxNDk0IGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX3ZibGFua3MrMHgxZGMvMHgyMDANCltD
UlRDOjM1OmNydGMtMF0gdmJsYW5rIHdhaXQgdGltZWQgb3V0DQpNb2R1bGVzIGxpbmtlZCBpbjoN
CkNQVTogMCBQSUQ6IDI5NyBDb21tOiBRU0dSZW5kZXJUaHJlYWQgTm90IHRhaW50ZWQgNS42LjAt
cmMzLW5leHQtMjAyMDAyMjgtMDAwMTAtZzMxOGJmMGZjMDhlZiAjMiBIYXJkd2FyZSBuYW1lOiBT
VE0zMiAoRGV2aWNlIFRyZWUgU3VwcG9ydCkgWzxjMDEwZjE4Yz5dICh1bndpbmRfYmFja3RyYWNl
KSBmcm9tIFs8YzAxMGFmYjg+XSAoc2hvd19zdGFjaysweDEwLzB4MTQpIFs8YzAxMGFmYjg+XSAo
c2hvd19zdGFjaykgZnJvbSBbPGMwN2IxZDNjPl0gKGR1bXBfc3RhY2srMHhiNC8weGQwKSBbPGMw
N2IxZDNjPl0gKGR1bXBfc3RhY2spIGZyb20gWzxjMDExZDhiOD5dIChfX3dhcm4rMHhkNC8weGYw
KSBbPGMwMTFkOGI4Pl0gKF9fd2FybikgZnJvbSBbPGMwMTFkYzRjPl0gKHdhcm5fc2xvd3BhdGhf
Zm10KzB4NzgvMHhhOCkgWzxjMDExZGM0Yz5dICh3YXJuX3Nsb3dwYXRoX2ZtdCkgZnJvbSBbPGMw
NGEyNjZjPl0gKGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX3ZibGFua3MrMHgxZGMvMHgyMDAp
DQpbPGMwNGEyNjZjPl0gKGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX3ZibGFua3MpIGZyb20g
WzxjMDRhNTEwYz5dIChkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbCswDQp4NTAvMHg2MCkN
Cls8YzA0YTUxMGM+XSAoZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWwpIGZyb20gWzxjMDRh
NTJhOD5dIChjb21taXRfdGFpbCsweDEyYy8weDEzYykgWzxjMDRhNTJhOD5dIChjb21taXRfdGFp
bCkgZnJvbSBbPGMwNGE1M2I0Pl0gKGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCsweGY0LzB4MTAw
KQ0KWzxjMDRhNTNiND5dIChkcm1fYXRvbWljX2hlbHBlcl9jb21taXQpIGZyb20gWzxjMDRhMmQz
OD5dIChkcm1fYXRvbWljX2hlbHBlcl9zZXRfY29uZmlnKzB4NTgvMHg2YykNCls8YzA0YTJkMzg+
XSAoZHJtX2F0b21pY19oZWxwZXJfc2V0X2NvbmZpZykgZnJvbSBbPGMwNGIxOTk0Pl0gKGRybV9t
b2RlX3NldGNydGMrMHg0NTAvMHg1NTApIFs8YzA0YjE5OTQ+XSAoZHJtX21vZGVfc2V0Y3J0Yykg
ZnJvbSBbPGMwNGFkNTcwPl0gKGRybV9pb2N0bF9rZXJuZWwrMHg5MC8weGU4KSBbPGMwNGFkNTcw
Pl0gKGRybV9pb2N0bF9rZXJuZWwpIGZyb20gWzxjMDRhZDhhYz5dIChkcm1faW9jdGwrMHgyZTQv
MHgzMmMpIFs8YzA0YWQ4YWM+XSAoZHJtX2lvY3RsKSBmcm9tIFs8YzAyNDY3ODQ+XSAodmZzX2lv
Y3RsKzB4MjAvMHgzOCkgWzxjMDI0Njc4ND5dICh2ZnNfaW9jdGwpIGZyb20gWzxjMDI0NzBmMD5d
IChrc3lzX2lvY3RsKzB4YmMvMHg3YjApIFs8YzAyNDcwZjA+XSAoa3N5c19pb2N0bCkgZnJvbSBb
PGMwMTAxMDAwPl0gKHJldF9mYXN0X3N5c2NhbGwrMHgwLzB4NTQpIEV4Y2VwdGlvbiBzdGFjaygw
eGVlOGYzZmE4IHRvIDB4ZWU4ZjNmZjApDQozZmEwOiAgICAgICAgICAgICAgICAgICAwMDAwMDAw
NSBhZGNiZWIxOCAwMDAwMDAwNSBjMDY4NjRhMiBhZGNiZWIxOCAwMDAwMDAwMQ0KM2ZjMDogMDAw
MDAwMDUgYWRjYmViMTggYzA2ODY0YTIgMDAwMDAwMzYgMDAwMDAwMjkgMDAwMDAwMjMgMDAwMDAw
MjMgMDAwMDAwMDcNCjNmZTA6IGIxMTNiMDk4IGFkY2JlYWZjIGIxMTI1NDEzIGI2MTU1Y2Y4IC0t
LVsgZW5kIHRyYWNlIDJhZDViYTk1NGNlYjc2N2EgXS0tLQ0KLS0tDQogZHJpdmVycy9ncHUvZHJt
L3N0bS9sdGRjLmMgfCAzICsrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJt
L3N0bS9sdGRjLmMgaW5kZXggOTliZjkzZThiMzZmLi4zMDFkZTA0OTgwNzggMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9s
dGRjLmMNCkBAIC00MjUsOSArNDI1LDEyIEBAIHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19hdG9taWNf
ZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCiAJCQkJICAgIHN0cnVjdCBkcm1fY3J0Y19z
dGF0ZSAqb2xkX3N0YXRlKSAgew0KIAlzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBjcnRjX3Rv
X2x0ZGMoY3J0Yyk7DQorCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gY3J0Yy0+ZGV2Ow0KIA0K
IAlEUk1fREVCVUdfRFJJVkVSKCJcbiIpOw0KIA0KKwlwbV9ydW50aW1lX2dldF9zeW5jKGRkZXYt
PmRldik7DQorDQogCS8qIFNldHMgdGhlIGJhY2tncm91bmQgY29sb3IgdmFsdWUgKi8NCiAJcmVn
X3dyaXRlKGxkZXYtPnJlZ3MsIExURENfQkNDUiwgQkNDUl9CQ0JMQUNLKTsNCiANCi0tDQoyLjI1
LjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
