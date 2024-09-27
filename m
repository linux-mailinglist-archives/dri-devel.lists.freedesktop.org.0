Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E25987CF8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 04:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC2010EBF6;
	Fri, 27 Sep 2024 02:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="a4N3/6/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 65661 seconds by postgrey-1.36 at gabe;
 Fri, 27 Sep 2024 02:19:00 UTC
Received: from ironport.ite.com.tw
 (HC210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB01010EBF7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 02:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+XSd3m/YKL5NTyqHOmjTIE8xIHP4v3krEfaP+p8Oal8=;
 b=a4N3/6/K+GWCy3syI8xs4gDxbI+DfIs4PMRL4IkuZjX3oVoOJVYJhmPc
 VF7uHKCvegpGpqMmTKtrQXPaemTbsyIExfqeNUIZEwolZ+E/BRWE1Br5y
 Mpr7gbuiOQGEHEb59Fijz+ExyqVmPnJ3oyxyelE9yaZw3NE6B1v9B0xSv
 V2NjTO6X4sz0FscRavN/p4P1oTZT1yFhh5dsLbx55QpFNWPqdljWyePYb
 gw2g52RsyvRuPHCCkvZH9GE9nNQ17XC3pwDTd5SGZ+5IkBhJhJNGRNRaQ
 oE+yb2UvWBMLwjdIdfKlZeivepX8ahUbF9yjqrzvrpgAT+wp6NN4PT6fj A==;
X-CSE-ConnectionGUID: SI3+qkF0SAu7hh35SbZPVg==
X-CSE-MsgGUID: DuagwJduRomNCXxcpOu1/Q==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 27 Sep 2024 10:18:58 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48R2It2e044020;
 Fri, 27 Sep 2024 10:18:55 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 10:18:54 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Fri, 27 Sep 2024 10:18:54 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@linaro.org>
CC: <Kenneth.Hung@ite.com.tw>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 05/11] drm/bridge: it6505: increase supports of HDCP
 repeater ksv devices
Thread-Topic: [PATCH v4 05/11] drm/bridge: it6505: increase supports of HDCP
 repeater ksv devices
Thread-Index: AQHbD+sd3qzcwRskzkCj5hXUt0VncbJq5XnA
Date: Fri, 27 Sep 2024 02:18:54 +0000
Message-ID: <79e5e8479b2b4563b2ce4f4a252b2586@ite.com.tw>
References: <20240926075018.22328-1-Hermes.Wu@ite.com.tw>
 <xyi4czye2dwqmh6iaschacduwxm52oaipbt5ulvlmalamkzwbc@6gt5endjo6gl>
In-Reply-To: <xyi4czye2dwqmh6iaschacduwxm52oaipbt5ulvlmalamkzwbc@6gt5endjo6gl>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [223.136.245.213]
x-tm-snts-smtp: 186E9732336EDFD251D8FBBC3A07BD8ABE17C1F77E5FF22CB6D459C42C674D592002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 48R2It2e044020
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8
ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPiANCj5TZW50OiBUaHVyc2RheSwgU2VwdGVtYmVy
IDI2LCAyMDI0IDQ6MDcgUE0NCj5UbzogSGVybWVzIFd1ICinZKjOp7spIDxIZXJtZXMuV3VAaXRl
LmNvbS50dz4NCj5DYzogS2VubmV0aCBIdW5nICiseK5hrdspIDxLZW5uZXRoLkh1bmdAaXRlLmNv
bS50dz47IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsgTmVpbCBBcm1z
dHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+OyBSb2JlcnQgRm9zcyA8cmZvc3NAa2Vy
bmVsLm9yZz47IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT47IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT47IEplcm5laiBTa3JhYmVjIDxq
ZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+OyBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3Jn
PjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPjsgQWxs
ZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3PjsgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVn
bm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT47IG9wZW4gbGlzdDpE
Uk0gRFJJVkVSUyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IG9wZW4gbGlzdCA8
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4NCj5TdWJqZWN0OiBSZTogW1BBVENIIHY0IDA1
LzExXSBkcm0vYnJpZGdlOiBpdDY1MDU6IGluY3JlYXNlIHN1cHBvcnRzIG9mIEhEQ1AgcmVwZWF0
ZXIga3N2IGRldmljZXMNCj4NCj5PbiBUaHUsIFNlcCAyNiwgMjAyNCBhdCAwMzo1MDoxNFBNIEdN
VCwgSGVybWVzIFd1IHdyb3RlOg0KPj4gRnJvbTogSGVybWVzIFd1IDxIZXJtZXMud3VAaXRlLmNv
bS50dz4NCj4+IA0KPj4gQSBIRENQIHNvdXJjZSBzaGFsbCBzdXBwb3J0IG1heCBkb3duc3RyZWFt
IGRldmljZSB0byAxMjcuDQo+PiANCj4+IENoYW5nZSBkZWZpbml0aW9uIG9mIE1BWF9IRENQX0RP
V05fU1RSRUFNX0NPVU5UIHRvIDEyNw0KPg0KPlRoaXMgcmVzdWx0cyBpbiBzdHJ1Y3QgaXQ2NTA1
IGdyb3d0aCBieSB+MC41IEtpQi4gUGxlYXNlIG1lbnRpb24gaXQgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlLg0KPg0KPklzIGl0IHJlYWxseSByZXF1aXJlZCB0byBoYXZlIHNoYTFfaW5wdXQgaW4gdGhl
IGNvbnN0YW50bHkgYWxsb2NhdGVkIHN0cnVjdHVyZT8gSSB0aGluayBpdCdzIGEgdGVtcG9yYXJ5
IGRhdGEsIHdoaWNoIGlzbid0IG5lY2Vzc2FyeSBhZnRlciBwcm9jZXNzaW5nLg0KDQpDaGFuZ2Ug
c2hhMV9pbnB1dCB3aXRoIGR5bmFtaWMgbWVtb3J5IGludG8gb25lIGNvbW1pdCBvciANCg0KY2hh
bmdlIHRvIHVzZSB0ZW1wb3JhcnkgZGF0YSBpbiBvbmUgYW5kIGNoYW5nZSBkZWZpbml0aW9uIG9m
IE1BWF9IRENQX0RPV05fU1RSRUFNX0NPVU4gaW4gYW5vdGhlcj8NCg0KPj4gDQo+PiBGaXhlczog
YjVjODRhOWVkY2Q0ICgiZHJtL2JyaWRnZTogYWRkIGl0NjUwNSBkcml2ZXIiKQ0KPj4gU2lnbmVk
LW9mZi1ieTogSGVybWVzIFd1IDxIZXJtZXMud3VAaXRlLmNvbS50dz4NCj4+IC0tLQ0KPj4gIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jIHwgMiArLQ0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2NTA1LmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvaXRlLWl0NjUwNS5jDQo+PiBpbmRleCBkMWY1MjIwZTA0YTYuLjVkNWNlMTJjZDA1
NCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYw0KPj4gQEAgLTI5Niw3
ICsyOTYsNyBAQA0KPj4gICNkZWZpbmUgTUFYX0xBTkVfQ09VTlQgNA0KPj4gICNkZWZpbmUgTUFY
X0xJTktfUkFURSBIQlINCj4+ICAjZGVmaW5lIEFVVE9fVFJBSU5fUkVUUlkgMw0KPj4gLSNkZWZp
bmUgTUFYX0hEQ1BfRE9XTl9TVFJFQU1fQ09VTlQgMTANCj4+ICsjZGVmaW5lIE1BWF9IRENQX0RP
V05fU1RSRUFNX0NPVU5UIDEyNw0KPj4gICNkZWZpbmUgTUFYX0NSX0xFVkVMIDB4MDMNCj4+ICAj
ZGVmaW5lIE1BWF9FUV9MRVZFTCAweDAzDQo+PiAgI2RlZmluZSBBVVhfV0FJVF9USU1FT1VUX01T
IDE1DQo+PiAtLQ0KPj4gMi4zNC4xDQo+PiANCj4NCj4tLSANCj5XaXRoIGJlc3Qgd2lzaGVzDQo+
RG1pdHJ5DQo+DQoNCkJSLA0KSGVybWVzDQoNCg==
