Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17DB227A6B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4509489C37;
	Tue, 21 Jul 2020 08:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 60903 seconds by postgrey-1.36 at gabe;
 Tue, 21 Jul 2020 01:17:36 UTC
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14876E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 01:17:36 +0000 (UTC)
Received: from localhost (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id 3FE201173;
 Tue, 21 Jul 2020 09:17:33 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.230] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P4704T139888013862656S1595294251487593_; 
 Tue, 21 Jul 2020 09:17:32 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <fca0e68f4de44e6d9502d0de77824d86>
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_2/5=5d_drm=3a_rockchip=3a_add_missing_regi?=
 =?UTF-8?B?c3RlcnMgZm9yIFJLMzE4OOOAkOivt+azqOaEj++8jOmCruS7tueUsWxpbnV4LXJv?=
 =?UTF-8?Q?ckchip-bounces+andy=2eyan=3drock-chips=2ecom=40lists=2einfradead?=
 =?UTF-8?B?Lm9yZ+S7o+WPkeOAkQ==?=
To: Alex Bee <knaerzche@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <20200718200323.3559-1-knaerzche@gmail.com>
 <20200718200323.3559-3-knaerzche@gmail.com>
 <871ce1ac-2d5b-c0a2-60a6-6aba0f296c18@rock-chips.com>
 <12296860-d6ed-5135-7c4e-545362829051@gmail.com>
From: Andy Yan <andy.yan@rock-chips.com>
Message-ID: <c53a4909-03ff-7477-fb71-1418cf97634b@rock-chips.com>
Date: Tue, 21 Jul 2020 09:17:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <12296860-d6ed-5135-7c4e-545362829051@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleDoKCk9uIDcvMjAvMjAgMTA6NDYgUE0sIEFsZXggQmVlIHdyb3RlOgo+IEhpIEFuZHks
Cj4KPiBBbSAyMC4wNy4yMCB1bSAxMDoyMiBzY2hyaWViIEFuZHkgWWFuOgo+PiBIaSBBbGV4Ogo+
Pgo+PiBPbiA3LzE5LzIwIDQ6MDMgQU0sIEFsZXggQmVlIHdyb3RlOgo+Pj4gVGhpcyBwYXRjaCBh
ZGRzIGRpdGhlcl91cCwgZHNwX2x1dF9lbiwgZGF0YV9ibGFuayBhbmQgZHNwX2RhdGFfc3dhcAo+
Pj4gcmVnaXN0ZXJzIHRvIGVuYWJsZSB0aGVpciByZXNwZWN0aXZlIGZ1bmN0aW9uYWxpdHkgZm9y
IFJLMzE4OCdzIFZPUC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlZSA8a25hZXJ6Y2hl
QGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tj
aGlwX3ZvcF9yZWcuYyB8IDQgKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfdm9wX3JlZy5jIAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9w
X3JlZy5jCj4+PiBpbmRleCBiMDQ2OTEwMTI5ZmIuLjk3MWE2YmRhNzQ1OCAxMDA2NDQKPj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3BfcmVnLmMKPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3BfcmVnLmMKPj4+IEBAIC01MTIs
NiArNTEyLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm9wX2NvbW1vbiByazMxODhfY29tbW9u
ID0gewo+Pj4gwqDCoMKgwqDCoCAuZGl0aGVyX2Rvd25fZW4gPSBWT1BfUkVHKFJLMzE4OF9EU1Bf
Q1RSTDAsIDB4MSwgMTEpLAo+Pj4gwqDCoMKgwqDCoCAuZGl0aGVyX2Rvd25fbW9kZSA9IFZPUF9S
RUcoUkszMTg4X0RTUF9DVFJMMCwgMHgxLCAxMCksCj4+PiDCoMKgwqDCoMKgIC5kc3BfYmxhbmsg
PSBWT1BfUkVHKFJLMzE4OF9EU1BfQ1RSTDEsIDB4MywgMjQpLAo+Pj4gK8KgwqDCoCAuZGl0aGVy
X3VwID0gVk9QX1JFRyhSSzMxODhfRFNQX0NUUkwwLCAweDEsIDkpLAo+Pj4gK8KgwqDCoCAuZHNw
X2x1dF9lbiA9IFZPUF9SRUcoUkszMTg4X1NZU19DVFJMLCAweDEsIDI4KSwKPj4+ICvCoMKgwqAg
LmRhdGFfYmxhbmsgPSBWT1BfUkVHKFJLMzE4OF9EU1BfQ1RSTDEsIDB4MSwgMjUpLAo+Pj4gK8Kg
wqDCoCAuZHNwX2RhdGFfc3dhcCA9IFZPUF9SRUcoUkszMTg4X0RTUF9DVFJMMSwgMHgxZiwgMjYp
LAo+Pgo+Pgo+Pgo+PiBJIGNhbid0IGZpbmQgdGhlIGRlZmluaXRpb24gb2YgZHNwX2RhdGFfc3dh
cCwgb3IgSSBtaXNzZWQgc29tZXRoaW5nPwo+Pgo+IE5vdGUgdGhhdCAuZHNwX2RhdGFfc3dhcCBp
cyBub3QgZGVmaW5lZCB3aXRoIHRoYXQgbmFtZSBpbiBUUk0gKGFzIGl0IAo+IGlzIG5vdCBpbiBS
SzMyODgvUkszMzI4KSwgc2luY2UgcG90ZW50aWFsbHkgbW9yZSB0aGUgb25lIGJpdCB3b3VsZCAK
PiBoYXZlIHRvIGJlIHNldCBmb3IgdGhpcyAoY3VycmVudGx5IG9ubHkgUkJfU1dBUCAoMHgyKSBp
cyBpbXBsZW1lbnRlZCAKPiBpbiB0aGUgVk9QIGRyaXZlcikuCj4KCkkgbWVhbiBJIGRpZG4ndCBm
aW5kIHRoZSBkZWZpbml0aW9uIG9mIGRzcF9kYXRhX3N3YXDCoCBpbiBzdHJ1Y3QgCnZvcF9jb21t
LCBJIGV2ZW4gc2VhcmNoIGRybS1taXNjLW5leHQgdHJlZS4KCgo+IFRvIGJlIHNvbWUga2luZCBv
ZiBmdXR1cmUgcHJvb2YgKGlmIEJHX1NXQVAsIFJHX1NXQVAsIERFTFRBX1NXQVAgb3IgCj4gRFVN
TVlfU1dBUCBldmVyIGdldCBpbXBsZW1lbnRlZCkgaXQgc2hvdWxkIGJlIGFsaWduZWQgd2l0aCB3
aGF0IGlzIAo+IGRlZmluZWQgZm9yIFJLMzI4OC9SSzMzMjggbm93IHRvIGF1dG9tYXRpY2FsbHkg
YmVuZWZpdCBmcm9tIHRoYXQgCj4gYWRkaXRpb25zLiBBbmQgaXQgd291bGQsIHNpbmNlIFJLMzI4
OF9EU1BfQ1RSTDAgQklUMTIsIEJJVDEzLCBCSVQxNCwgCj4gQklUMTUsIEJJVDE2IGV4YWN0bHkg
bWF0Y2hlcyB3aXRoIFJLMzE4OF9EU1BfQ1RSTDEgQklUMjYsIEJJVDI3LCAKPiBCSVQyOCwgQklU
MjksIEJJVDMwLgo+Cj4gQ3VycmVudCBpbXBsZW1lbnRhdGlvbiBzZXRzIEJJVDEzIGZvciBSSzMy
ODggYW5kIHdpdGggdGhpcyBwYXRjaCBCSVQyNyAKPiBmb3IgUkszMTg4IHRvIGVuYWJsZSBSQl9T
V0FQLgo+Cj4+Cj4+Cj4+PiDCoCB9Owo+Pj4gwqAgwqAgc3RhdGljIGNvbnN0IHN0cnVjdCB2b3Bf
d2luX2RhdGEgcmszMTg4X3ZvcF93aW5fZGF0YVtdID0gewo+Pgo+Pgo+IFJlZ2FyZHMsCj4KPiBB
bGV4Cj4KPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
