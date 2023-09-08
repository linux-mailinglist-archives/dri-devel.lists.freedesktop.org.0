Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F5F799304
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 02:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EF610E218;
	Sat,  9 Sep 2023 00:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AC610E056
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 08:12:18 +0000 (UTC)
Received: from dsgsiengine01 ([10.8.1.61])
 by mail03.siengine.com with ESMTPS id 3888Bk7Y028237
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 8 Sep 2023 16:11:46 +0800 (+08)
 (envelope-from lucas.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com
 [10.8.1.33])
 by dsgsiengine01 (SkyGuard) with ESMTPS id 4RhpjX5WhVz7ZMlT;
 Fri,  8 Sep 2023 16:11:44 +0800 (CST)
Received: from SEEXMB04-2019.siengine.com (10.8.1.34) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1258.25; Fri, 8 Sep 2023 16:11:44 +0800
Received: from SEEXMB04-2019.siengine.com ([fe80::ebda:7f0d:8ee8:ab8f]) by
 SEEXMB04-2019.siengine.com ([fe80::ebda:7f0d:8ee8:ab8f%14]) with mapi id
 15.02.1258.025; Fri, 8 Sep 2023 16:11:44 +0800
From: =?gb2312?B?TGl1IEx1Y2FzL8H1saPW+Q==?= <lucas.liu@siengine.com>
To: =?gb2312?B?TGl1IEx1Y2FzL8H1saPW+Q==?= <lucas.liu@siengine.com>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBkcm0va29tZWRhOiBhZGQgTlYxMiBmb3JtYXQgdG8g?=
 =?gb2312?Q?support_writeback_layer_type?=
Thread-Topic: [PATCH] drm/komeda: add NV12 format to support writeback layer
 type
Thread-Index: AQHZ2ltn9LP8IvenzkCX2e1v2bsk4rAQoe+A
Date: Fri, 8 Sep 2023 08:11:44 +0000
Message-ID: <b393669c80274dfcbcf94c60fea8ae76@siengine.com>
References: <20230829093004.22860-1-lucas.liu@siengine.com>
In-Reply-To: <20230829093004.22860-1-lucas.liu@siengine.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.10.56]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DKIM-Results: [10.8.1.61]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: mail03.siengine.com 3888Bk7Y028237
X-Mailman-Approved-At: Sat, 09 Sep 2023 00:13:12 +0000
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgIGFsbCwNCg0KCURvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBmb3IgdGhlIHBhdGNoIEkg
c3VibWl0dGVkPyBQbGVhc2UgYWxzbyBsZXQgbWUga25vdywgdGhhbmsgeW91IQ0KDQpCZXN0IFJl
Z2FyZHMsDQpiYW96aHUubGl1DQotLS0tLdPKvP7Urbz+LS0tLS0NCreivP7IyzogYmFvemh1Lmxp
dSA8bHVjYXMubGl1QHNpZW5naW5lLmNvbT4gDQq3osvNyrG85DogMjAyM8TqONTCMjnI1SAxNzoz
MA0KytW8/sjLOiBsaXZpdS5kdWRhdUBhcm0uY29tOyBhaXJsaWVkQGdtYWlsLmNvbTsgZGFuaWVs
QGZmd2xsLmNoDQqzrcvNOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBMaXUgTHVjYXMvwfWxo9b5IDxsdWNhcy5saXVAc2llbmdp
bmUuY29tPg0K1vfM4jogW1BBVENIXSBkcm0va29tZWRhOiBhZGQgTlYxMiBmb3JtYXQgdG8gc3Vw
cG9ydCB3cml0ZWJhY2sgbGF5ZXIgdHlwZQ0KDQpXaGVuIHRlc3RpbmcgdGhlIGQ3MSB3cml0ZWJh
Y2sgbGF5ZXIgZnVuY3Rpb24sIHRoZSBvdXRwdXQgZm9ybWF0IGlzIHNldCB0byBOVjEyLCBhbmQg
dGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdlIGlzIGRpc3BsYXllZDoNCg0KW2RybTprb21lZGFf
ZmJfaXNfbGF5ZXJfc3VwcG9ydGVkXSBMYXllciBUWVBFOiA0IGRvZXNuJ3Qgc3VwcG9ydCBmYiBG
TVQ6IE5WMTIgbGl0dGxlLWVuZGlhbiAoMHgzMjMxNTY0ZSkgd2l0aCBtb2RpZmllcjogMHgwLi4N
Cg0KQ2hlY2sgdGhlIGQ3MSBkYXRhIG1hbnVhbCwgd3JpdGViYWNrIGxheWVyIG91dHB1dCBmb3Jt
YXRzIGluY2x1ZGVzIE5WMTIgZm9ybWF0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBiYW96aHUubGl1IDxs
dWNhcy5saXVAc2llbmdpbmUuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9kNzEvZDcxX2Rldi5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9kNzEvZDcxX2Rldi5jDQppbmRleCA2YzU2ZjU2NjJiYzcuLjgwOTczOTc1YmZkYiAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9k
ZXYuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rl
di5jDQpAQCAtNTIxLDcgKzUyMSw3IEBAIHN0YXRpYyBzdHJ1Y3Qga29tZWRhX2Zvcm1hdF9jYXBz
IGQ3MV9mb3JtYXRfY2Fwc190YWJsZVtdID0gew0KIAl7X19IV19JRCg1LCAxKSwJRFJNX0ZPUk1B
VF9ZVVlWLAlSSUNILAkJUm90X0FMTF9IX1YsCUxZVF9OTSwgQUZCX1RIfSwgLyogYWZiYyAqLw0K
IAl7X19IV19JRCg1LCAyKSwJRFJNX0ZPUk1BVF9ZVVlWLAlSSUNILAkJRmxpcF9IX1YsCQkwLCAw
fSwNCiAJe19fSFdfSUQoNSwgMyksCURSTV9GT1JNQVRfVVlWWSwJUklDSCwJCUZsaXBfSF9WLAkJ
MCwgMH0sDQotCXtfX0hXX0lEKDUsIDYpLAlEUk1fRk9STUFUX05WMTIsCVJJQ0gsCQlGbGlwX0hf
ViwJCTAsIDB9LA0KKwl7X19IV19JRCg1LCA2KSwJRFJNX0ZPUk1BVF9OVjEyLAlSSUNIX1dCLAlG
bGlwX0hfViwJCTAsIDB9LA0KIAl7X19IV19JRCg1LCA2KSwJRFJNX0ZPUk1BVF9ZVVY0MjBfOEJJ
VCwJUklDSCwJCVJvdF9BTExfSF9WLAlMWVRfTk0sIEFGQl9USH0sIC8qIGFmYmMgKi8NCiAJe19f
SFdfSUQoNSwgNyksCURSTV9GT1JNQVRfWVVWNDIwLAlSSUNILAkJRmxpcF9IX1YsCQkwLCAwfSwN
CiAJLyogWVVWIDEwYml0Ki8NCi0tDQoyLjE3LjENCg0K
