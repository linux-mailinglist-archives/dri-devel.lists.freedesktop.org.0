Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231DD10C513
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530416E634;
	Thu, 28 Nov 2019 08:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83026E0E7;
 Wed, 27 Nov 2019 10:19:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARACEKl032390; Wed, 27 Nov 2019 11:19:45 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2whcxyb02g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 11:19:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3437100038;
 Wed, 27 Nov 2019 11:19:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D89A42B1204;
 Wed, 27 Nov 2019 11:19:43 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 27 Nov
 2019 11:19:43 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 27 Nov 2019 11:19:43 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/4] drm/rect: Bugfixes and selftests
Thread-Topic: [PATCH v2 0/4] drm/rect: Bugfixes and selftests
Thread-Index: AQHVoV4rvcqC7LXnL0+ymN9eOefFSqeexN0A
Date: Wed, 27 Nov 2019 10:19:43 +0000
Message-ID: <1de171dd-4f31-c941-ed7c-18be62110960@st.com>
References: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <48AB6043FB9D074BBBBFC73EEB3FEFDF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:22:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=omru2UOTLjxmL2ZzimkB3bZ5DNgfuLy5WGvEkQPlpTE=;
 b=jd8wYx50DRSN8QIQJD5K1OpRHKTAo816xUKfs6ytGDbz8+czkex8pTZJrQ9mMioNFdZL
 9O9wJSGHF7F3PZe8lsTs3b/yre9zCopg2+8Nzf4iknokxvZdg/gB8Pm7uajDbQVjMhJp
 ien7BDc3nyABiIQCOgs0GNV9WhcNXDeW6Ep+jN4Ka/V6aerEmadQULi/zvLM3oXGmMc1
 z+iJS7pNWrZxkn0rECvpzT7YjEkhzuJXiTMZn8LyckwX5LQgcIBu93koyoiJeLS9b71t
 dlCYpNQhqLgEkt7qT5bktAJgY8eye/khWaGR1DvkQeWPbmFyDfodSyX9HMPYp2+H6xFi fg== 
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAxMS8yMi8xOSA2OjU2IFBNLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0KPiBGcm9tOiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPg0KPiBNeSBlYXJs
aWVyIGZpeGVzIGZvciBkcm1fcmVjdCArIGRpdi1ieS16ZXJvIGZpeCArIHNvbWUNCj4gc2VsZnRl
c3RzIHRoYXQgRGFuaWVsIHJlcXVlc3RlZC4NCj4NCj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBCZW5qYW1pbiBHYWlnbmFy
ZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPg0KDQpUaGFua3MgdG8gaGF2ZSBoYW5kbGUgdGhpcy4NCg0KUmV2aWV3ZWQtYnk6
IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+DQo+DQo+IFZpbGxl
IFN5cmrDpGzDpCAoNCk6DQo+ICAgIGRybS9yZWN0OiBBdm9pZCBkaXZpc2lvbiBieSB6ZXJvDQo+
ICAgIGRybS9yZWN0OiBLZWVwIHRoZSBzY2FsZWQgY2xpcCBib3VuZGVkDQo+ICAgIGRybS9yZWN0
OiBLZWVwIHRoZSBjbGlwcGVkIGRzdCByZWN0YW5nbGUgaW4gcGxhY2UNCj4gICAgZHJtL3NlbGZ0
ZXN0czogQWRkIGRybV9yZWN0IHNlbGZ0ZXN0cw0KPg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
cmVjdC5jICAgICAgICAgICAgICAgICAgICB8ICAzNiArLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
c2VsZnRlc3RzL01ha2VmaWxlICAgICAgICAgICAgfCAgIDMgKy0NCj4gICAuLi4vZ3B1L2RybS9z
ZWxmdGVzdHMvZHJtX21vZGVzZXRfc2VsZnRlc3RzLmggfCAgIDQgKw0KPiAgIC4uLi9kcm0vc2Vs
ZnRlc3RzL3Rlc3QtZHJtX21vZGVzZXRfY29tbW9uLmggICB8ICAgNyArDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9yZWN0LmMgICAgIHwgMjIwICsrKysrKysrKysrKysr
KysrKw0KPiAgIGluY2x1ZGUvZHJtL2RybV9yZWN0LmggICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMiArDQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCAyNTcgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMv
dGVzdC1kcm1fcmVjdC5jDQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
