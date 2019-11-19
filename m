Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 969C1103024
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507346E9E5;
	Tue, 19 Nov 2019 23:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C136E8DB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 19:59:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJJgDbS021254; Tue, 19 Nov 2019 20:59:46 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9up1knu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 20:59:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED68010002A;
 Tue, 19 Nov 2019 20:59:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4BFE2B94EE;
 Tue, 19 Nov 2019 20:59:45 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 19 Nov
 2019 20:59:45 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 19 Nov 2019 20:59:45 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: "Souza, Jose" <jose.souza@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@linux.ie"
 <airlied@linux.ie>, "sean@poorly.run" <sean@poorly.run>
Subject: Re: [PATCH] drm/crtc-helper: drm_connector_get_single_encoder
 prototype is missing
Thread-Topic: [PATCH] drm/crtc-helper: drm_connector_get_single_encoder
 prototype is missing
Thread-Index: AQHVntkBzHviK+RvC0uNrMl+exNxkaeSxriAgAASmAA=
Date: Tue, 19 Nov 2019 19:59:44 +0000
Message-ID: <6ad4ff49-240b-a665-d229-20e177fa6b2f@st.com>
References: <20191119125805.4266-1-benjamin.gaignard@st.com>
 <f6f32b4d8d8e271953f887c50793f9d64d48e7b3.camel@intel.com>
In-Reply-To: <f6f32b4d8d8e271953f887c50793f9d64d48e7b3.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <F2E1B40B3CB9EF47BBF9C0BEAC8264D5@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_06:2019-11-15,2019-11-19 signatures=0
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=cVy/bt4cw6kZCF28y2TA2VipfYUSKT4PaUvUMRbKWsA=;
 b=ip7iVbljgd/rVZRvnC8lU4dcPugz3zv+zCB5LIjUCcequSIdCl1+QkxIIb3I3JzujPQz
 9HX2neSSoTno6okF4BASO8TpaEADC0ghzhXOFLAC0HGCFda6GdUqfFE7sT6kbxulBBJ7
 tVoKmd6F5TJm/j9IbBNHLKsPzPIglqFc8l6qNm6JYiS1SpPKAmPUxdf9sGjfO5NRB2Ln
 8Jeh07ivdTmUEbOl+LP/9l7YE766GZewDuv0VyxlrOeumaVDHGFJhMPBVYWXnLNJSM6+
 2KSFQ/3LUxdnfEo1z2gdXhmY8W8WjMr3j7J23guujVTgsB05nXPFoNIqlrH7kc8uTu4o +Q== 
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAxMS8xOS8xOSA3OjUzIFBNLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gT24gVHVlLCAyMDE5
LTExLTE5IGF0IDEzOjU4ICswMTAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToNCj4+IEluY2x1
ZGUgZHJtX2NydGNfaGVscGVyX2ludGVybmFsLmggdG8gcHJvdmlkZQ0KPj4gZHJtX2Nvbm5lY3Rv
cl9nZXRfc2luZ2xlX2VuY29kZXINCj4+IHByb3RvdHlwZS4NCj4+DQo+PiBGaXhlczogYTkyNDYy
ZDZiZjQ5MyAoImRybS9jb25uZWN0b3I6IFNoYXJlIHdpdGggbm9uLWF0b21pYyBkcml2ZXJzDQo+
PiB0aGUgZnVuY3Rpb24gdG8gZ2V0IHRoZSBzaW5nbGUgZW5jb2RlciIpDQo+IGRybV9jb25uZWN0
b3JfZ2V0X3NpbmdsZV9lbmNvZGVyKCkgaXMgaW1wbGVtZW50ZWQgYmVmb3JlIHRoZSB1c2UgaW4N
Cj4gdGhpcyBmaWxlIHNvIGl0IGlzIG5vdCBicm9rZW4sIG5vIG5lZWQgb2YgYSBmaXhlcyB0YWcu
DQo+DQo+IFJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGlu
dGVsLmNvbT4NCg0KSSB3aWxsIHJlbW92ZSBmaXhlIHRhZyBiZWZvcmUgcHVzaCBpdC4NCg0KVGhh
bmtzLA0KDQpCZW5qYW1pbg0KDQo+DQo+PiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9z
ZS5zb3V6YUBpbnRlbC5jb20+DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25h
cmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2NydGNfaGVscGVyLmMgfCAyICsrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jcnRjX2hl
bHBlci5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19oZWxwZXIuYw0KPj4gaW5kZXgg
NDk5YjA1YWFjY2ZjLi45M2E0ZWVjNDI5ZTggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NydGNfaGVscGVyLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19o
ZWxwZXIuYw0KPj4gQEAgLTQ4LDYgKzQ4LDggQEANCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJp
bnQuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+DQo+PiAgIA0KPj4gKyNpbmNs
dWRlICJkcm1fY3J0Y19oZWxwZXJfaW50ZXJuYWwuaCINCj4+ICsNCj4+ICAgLyoqDQo+PiAgICAq
IERPQzogb3ZlcnZpZXcNCj4+ICAgICoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
