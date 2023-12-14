Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CC8812585
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 03:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CED10E17A;
	Thu, 14 Dec 2023 02:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m1383.mail.163.com (m1383.mail.163.com [220.181.13.83])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7CC2610E17A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 02:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=xV7Vx8tS0tyyHXVfhUmHe11vUeyW+o711irs3ufCGBo=; b=a
 Ktx/JTJmzrUn+k1af5pafI4jKaMB6NT6oq+g59e6ScGhXnGZyTfWbADdEe7lWQZa
 Iz1REOfMqRxaWutF044zQt5nOKznzFiC+zKAv7rjdPtl4XKBPlUko26p//McMLXL
 y94HGKqf5+AEWAaE1xzoRWXtmlcoymLAGmyWUyRajo=
Received: from andyshrk$163.com ( [58.22.7.114] ) by ajax-webmail-wmsvr83
 (Coremail) ; Thu, 14 Dec 2023 10:51:17 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 14 Dec 2023 10:51:17 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Keith Zhao" <keith.zhao@starfivetech.com>
Subject: Re:Re: [v3 5/6] drm/vs: Add hdmi driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
In-Reply-To: <10e2ab3c-950f-4a1c-8806-74e5bba2c24a@starfivetech.com>
References: <20231204123315.28456-6-keith.zhao@starfivetech.com>
 <esetsiqgqpk35zue4c6aq7l6zn4kezhxkqqa7ompaz2vhdy3lr@4d5awfqgs2ss>
 <94a1f9fc-82fb-4a04-a44b-f9b20c2bdfdd@starfivetech.com>
 <abdl6kmighvpwojvafq443q7grn6w3abwpvw7zwbna4jvtsvjf@fa42rv46n2wh>
 <40cdd3c7-174e-4611-9ea6-22cb56d1f62b@starfivetech.com>
 <e90142d.44b1.18c43833b63.Coremail.andyshrk@163.com>
 <e0b84511-dbb4-46fa-9465-713369232f6f@starfivetech.com>
 <43e42269.314.18c46dbb4c5.Coremail.andyshrk@163.com>
 <e1c362dc-8aac-4d13-9356-8b7ccae4727f@starfivetech.com>
 <5a79a4b9.1bd7.18c4773c1ea.Coremail.andyshrk@163.com>
 <xevxqusbizjfs4qt5rufhntd3vd656o2smocvivvulzceh3aeu@uuihphhat5wi>
 <2dc5ea49-9a5f-484a-98dc-1b35b79d0945@starfivetech.com>
 <6f7acc9d.5648.18c58cba9be.Coremail.andyshrk@163.com>
 <10e2ab3c-950f-4a1c-8806-74e5bba2c24a@starfivetech.com>
X-NTES-SC: AL_Qu2bAPmZvUos4SCaYOkXn0kXhec2W8Czvvgg34JRP5k0iirk3SMSXlxhE0v68fyvKR+9kzubTzpfw/hgfJt2Ub7ginXnRdpaOux4AXV3G4xX
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <178ec98c.140b.18c663c4ca3.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: U8GowADnL4ylbXplzy0uAA--.21822W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqARGXmVOA8NfdwACs1
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, Maxime Ripard <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 William Qiu <william.qiu@starfivetech.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIEtlaXRoOgoK5ZyoIDIwMjMtMTItMTMgMDk6NDA6MzHvvIwiS2VpdGggWmhhbyIgPGtlaXRo
LnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT4g5YaZ6YGT77yaCj4KPgo+T24gMjAyMy8xMi8xMSAyMDox
MywgQW5keSBZYW4gd3JvdGU6Cj4+IEhpIEtlaXRo77yaCj4+IAo+PiDlnKggMjAyMy0xMi0xMSAx
ODoyNDozNe+8jCJLZWl0aCBaaGFvIiA8a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPiDlhpnp
gZPvvJoKPj4+aGkgTWF4aW1lOgo+Pj5oaSBBbmR5Ogo+Pj4KPj4+T24gMjAyMy8xMi84IDE3OjE0
LCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+Pj4+IEhpLAo+Pj4+IAo+Pj4+IE9uIEZyaSwgRGVjIDA4
LCAyMDIzIGF0IDExOjIzOjM3QU0gKzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+Pj4+PiDlnKggMjAy
My0xMi0wOCAxMTowMDozMe+8jCJLZWl0aCBaaGFvIiA8a2VpdGguemhhb0BzdGFyZml2ZXRlY2gu
Y29tPiDlhpnpgZPvvJoKPj4+Pj4gPgo+Pj4+PiA+Cj4+Pj4+ID5PbiAyMDIzLzEyLzggODozNywg
QW5keSBZYW4gd3JvdGU6Cj4+Pj4+ID4+IEhpIEtldGjvvJoKPj4+Pj4gPj4gCj4+Pj4+ID4+IAo+
Pj4+PiA+PiAKPj4+Pj4gPj4gCj4+Pj4+ID4+IAo+Pj4+PiA+PiAKPj4+Pj4gPj4g5ZyoIDIwMjMt
MTItMDcgMTg6NDg6MTPvvIwiS2VpdGggWmhhbyIgPGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNv
bT4g5YaZ6YGT77yaCj4+Pj4+ID4+Pgo+Pj4+PiA+Pj4KPj4+Pj4gPj4+T24gMjAyMy8xMi83IDE3
OjAyLCBBbmR5IFlhbiB3cm90ZToKPj4+Pj4gPj4+PiAKPj4+Pj4gPj4+PiAKPj4+Pj4gPj4+PiAK
Pj4+Pj4gPj4+PiAKPj4+Pj4gPj4+PiBIaSBLZWl0aO+8mgo+Pj4+PiA+Pj4+IAo+Pj4+PiA+Pj4+
IAo+Pj4+PiA+Pj4+IAo+Pj4+PiA+Pj4+IAo+Pj4+PiA+Pj4+IAo+Pj4+PiA+Pj4+IAo+Pj4+PiA+
Pj4+IAo+Pj4+PiA+Pj4+IAo+Pj4+PiA+Pj4+IAo+Pj4+PiA+Pj4+IAo+Pj4+PiA+Pj4+IAo+Pj4+
PiA+Pj4+IEF0IDIwMjMtMTItMDYgMjI6MTE6MzMsICJLZWl0aCBaaGFvIiA8a2VpdGguemhhb0Bz
dGFyZml2ZXRlY2guY29tPiB3cm90ZToKPj4+Pj4gPj4+Pj4KPj4+Pj4gPj4+Pj4KPj4+Pj4gPj4+
Pj5PbiAyMDIzLzEyLzYgMjA6NTYsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4+Pj4+ID4+Pj4+PiBP
biBXZWQsIERlYyAwNiwgMjAyMyBhdCAwODowMjo1NVBNICswODAwLCBLZWl0aCBaaGFvIHdyb3Rl
Ogo+Pj4+PiA+Pj4+Pj4+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdGFy
Zml2ZV9oZG1pX2R0X2lkc1tdID0gewo+Pj4+PiA+Pj4+Pj4+ID4+ICsJeyAuY29tcGF0aWJsZSA9
ICJzdGFyZml2ZSxqaDcxMTAtaW5uby1oZG1pIix9LAo+Pj4+PiA+Pj4+Pj4+ID4gCj4+Pj4+ID4+
Pj4+Pj4gPiBTbyBpdCdzIGlubm8gaGRtaSwganVzdCBsaWtlIFJvY2tjaGlwIHRoZW4/Cj4+Pj4+
ID4+Pj4+Pj4gPiAKPj4+Pj4gPj4+Pj4+PiA+IFRoaXMgc2hvdWxkIGJlIGEgY29tbW9uIGRyaXZl
ci4KPj4+Pj4gPj4+Pj4+Pgo+Pj4+PiA+Pj4+Pj4+IFJvY2tjaGlwIGhhcyBhIGlubm8gaGRtaSBJ
UC4gYW5kIFN0YXJmaXZlIGhhcyBhIGlubm8gaGRtaSBJUC4KPj4+Pj4gPj4+Pj4+PiBidXQgdGhl
IGhhcmV3YXdyZSBkaWZmZXJlbmNlIG9mIHRoZW0gaXMgYmlnICwgaXQgaXMgbm90IGVhc3kgdG8g
dXNlIHRoZSBjb21tb24gZHJpdmVyCj4+Pj4+ID4+Pj4+Pj4gbWF5YmUgaSBuZWVkIHRoZSBpbm5v
IGhkbWkgdmVyc2lvbiBoZXJlIHRvIG1ha2UgYSBkaXN0aW5jdGlvbgo+Pj4+PiA+Pj4+Pj4gCj4+
Pj4+ID4+Pj4+PiBJIGp1c3QgaGFkIGEgbG9vayBhdCB0aGUgcm9ja2NoaXAgaGVhZGVyIGZpbGU6
IGFsbCB0aGUgcmVnaXN0ZXJzIGJ1dCB0aGUKPj4+Pj4gPj4+Pj4+IFNUQVJGSVZFXyogb25lcyBh
cmUgaWRlbnRpY2FsLgo+Pj4+PiA+Pj4+Pj4gCj4+Pj4+ID4+Pj4+PiBUaGVyZSdzIG5vIG5lZWQg
dG8gaGF2ZSB0d28gaWRlbnRpY2FsIGRyaXZlcnMgdGhlbiwgcGxlYXNlIHVzZSB0aGUKPj4+Pj4g
Pj4+Pj4+IHJvY2tjaGlwIGRyaXZlciBpbnN0ZWFkLgo+Pj4+PiA+Pj4+Pj4gCj4+Pj4+ID4+Pj4+
PiBNYXhpbWUKPj4+Pj4gPj4+Pj4KPj4+Pj4gPj4+Pj5vaywgaGF2ZSBhIHNpbXBsZSB0ZXN0ICwg
ZWRpZCBjYW4gZ2V0IC4gaSB3aWxsIGNvbnRpbnVlIAo+Pj4+PiA+Pj4+IAo+Pj4+PiA+Pj4+IE1h
eWJlIHlvdSBjYW4gdGFrZSBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkg
YXMgYSByZWZlcmVuY2XvvIwgdGhpcwo+Pj4+PiA+Pj4+IGlzIGFsc28gYSBoZG1pIGlwIHVzZWQg
Ynkgcm9ja2NoaXAvbWVzb24vc3VueGkvanovaW1444CCCj4+Pj4+ID4+Pj4gV2UgZmluYWxseSBt
YWtlIGl0IHNoYXJlIG9uZSBkcml2ZXLjgIIKPj4+Pj4gPj4+Pj4KPj4+Pj4gPj4+aGkgQW5keToK
Pj4+Pj4gPj4+Cj4+Pj4+ID4+PmR3X2hkbWkgc2VlbXMgYSBnb29kIGNob2ljZSAsIGl0IGNhbiBo
YW5kbGUgaW5ubyBoZG1pIGhhcmR3YXJlIGJ5IGRlZmluZSBpdHMgZHdfaGRtaV9wbGF0X2RhdGEu
Cj4+Pj4+ID4+PmRvZXMgaXQgbWVhbnMgaSBjYW4gd3JpdGUgb3duIGRyaXZlciBmaWxlcyBzdWNo
IGFzKGR3X2hkbWktc3RhcmZpdmUuYykgYmFzZWQgb24gZHdfaGRtaSBpbnN0ZWFkIG9mIGFkZCBw
bGF0X2RhdGEgaW4gaW5ub19oZG1pLmMKPj4+Pj4gPj4+Cj4+Pj4+ID4+IAo+Pj4+PiA+PiBJIHRo
aW5rIHRoZSBwcm9jZXNzIG1heWJlIGxpa2UgdGhpc++8mgo+Pj4+PiA+PiAKPj4+Pj4gPj4gMS4g
c3BsaXQgdGhlIGlubm9faGRtaS5jIHVuZGVyIHJvY2tjaGlwIHRvICBpbm5vX2hkbWkuYyh0aGUg
Y29tbW9uIHBhcnQpLCBpbm5vX2hkbWktcm9ja2NoaXAuYyh0aGUgc29jIHNwZWNpZmljIHBhcnQp
Cj4+Pj4+ID4+IDIuIG1vdmUgdGhlIGNvbW1vbiBwYXJ0IGlubm9faGRtaS5jIHRvIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvaW5ub3NpbGljb24vCj4+Pj4+ID4+IDMuIGFkZCBzdGFydGZpdmUgc3Bl
Y2lmaWMgcGFydCwgaW5ub19oZG1pLXN0YXJ0Zml2ZS5jCj4+Pj4+ID4+IAo+Pj4+PiA+PiBiZWxs
b3cgZ2l0IGxvZyBmcm9tIGtlcm5lbCB0aHJlZSBzaG93IGhvdyB3ZSBjb252ZXJ0ICBkd19oZG1p
IHRvIGEgY29tbW9uIGRyaXZlcjogCj4+Pj4+ID4+IAo+Pj4+PiA+PiAKPj4+Pj4gPj4gCj4+Pj4+
ID4+IDEyYjlmMjA0ZTgwNCBkcm06IGJyaWRnZS9kd19oZG1pOiBhZGQgcm9ja2NoaXAgcmszMjg4
IHN1cHBvcnQKPj4+Pj4gPj4gNzRhZjllNGQwM2I4IGR0LWJpbmRpbmdzOiBBZGQgZG9jdW1lbnRh
dGlvbiBmb3Igcm9ja2NoaXAgZHcgaGRtaQo+Pj4+PiA+PiBkMzQ2YzE0ZWVlYTkgZHJtOiBicmlk
Z2UvZHdfaGRtaTogYWRkIGZ1bmN0aW9uIGR3X2hkbWlfcGh5X2VuYWJsZV9zcGFyZQo+Pj4+PiA+
PiBhNGQzYjhiMDUwZDUgZHJtOiBicmlkZ2UvZHdfaGRtaTogY2xlYXIgaTJjbXBoeV9zdGF0MCBy
ZWcgaW4gaGRtaV9waHlfd2FpdF9pMmNfZG9uZQo+Pj4+PiA+PiA2MzJkMDM1YmFjZTIgZHJtOiBi
cmlkZ2UvZHdfaGRtaTogYWRkIG1vZGVfdmFsaWQgc3VwcG9ydAo+Pj4+PiA+PiAwY2Q5ZDE0Mjgz
MjIgZHJtOiBicmlkZ2UvZHdfaGRtaTogYWRkIHN1cHBvcnQgZm9yIG11bHRpLWJ5dGUgcmVnaXN0
ZXIgd2lkdGggYWNjZXNzCj4+Pj4+ID4+IGNkMTUyMzkzOTY3ZSBkdC1iaW5kaW5nczogYWRkIGRv
Y3VtZW50IGZvciBkd19oZG1pCj4+Pj4+ID4+IGIyMWY0YjY1OGRmOCBkcm06IGlteDogaW14LWhk
bWk6IG1vdmUgaW14LWhkbWkgdG8gYnJpZGdlL2R3X2hkbWkKPj4+Pj4gPj4gYWFhNzU3YTA5MmMy
IGRybTogaW14OiBpbXgtaGRtaTogc3BsaXQgcGh5IGNvbmZpZ3VyYXRpb24gdG8gcGxhdGZvcm0g
ZHJpdmVyCj4+Pj4+ID4+IDNkMWIzNWEzZDlmMyBkcm06IGlteDogaW14LWhkbWk6IGNvbnZlcnQg
aW14LWhkbWkgdG8gZHJtX2JyaWRnZSBtb2RlCj4+Pj4+ID4+IGMyYzM4NDg4NTFhNyBkcm06IGlt
eDogaW14LWhkbWk6IHJldHVybiBkZWZlciBpZiBjYW4ndCBnZXQgZGRjIGkyYyBhZGFwdGVyCj4+
Pj4+ID4+IGI1ODc4MzM5MzNkZSBkcm06IGlteDogaW14LWhkbWk6IG1ha2UgY2hlY2twYXRjaCBo
YXBweQo+Pj4+PiA+PiAKPj4+Pj4gPmhpIEFuZHk6Cj4+Pj4+ID5JIGdvdCB5b3UgbWVhbnMsIAo+
Pj4+PiA+YXMgSSBkb24ndCBoYXZlIGEgcm9ja2NoaXAgYm9hcmQgb24gaGFuZCAsIHRvIHNwbGl0
IHRoZSBpbm5vX2hkbWkuYyBjYW4gbm90IGJlIHRlc3RlZC4KPj4+Pj4gPgo+Pj4+PiA+aG93IGFk
b3V0IHRoaXMgaWRlYToKPj4+Pj4gPjHjgIFzcGxpdCB0aGUgc3RhcmZpdmVfaGRtaS5jIHVuZGVy
IHZlcmlzaWxpY2lvbiB0byAgaW5ub19oZG1pLmModGhlIGNvbW1vbiBwYXJ0KSwgaW5ub19oZG1p
LXN0YXJmaXZlLmModGhlIHNvYyBzcGVjaWZpYyBwYXJ0KQo+Pj4+PiA+Mi4gbW92ZSB0aGUgY29t
bW9uIHBhcnQgaW5ub19oZG1pLmMgdG8gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vc2lsaWNv
bi8KPj4+Pj4gPjMuIEluIHRoZSBmdXR1cmUsIGlubm8gaGRtaS5jIHVuZGVyIHJvY2tjaGlwIHdp
bGwgcmV1c2UgdGhlIHB1YmxpYyBkcml2ZXIuCj4+Pj4+IAo+Pj4+PiBJIGFtIG5vdCBzdXJlIGlm
IGRybSBtYWludGFpbmVycyBhcmUgaGFwcHkgd2l0aCB0aGlz44CCCj4+Pj4gCj4+Pj4gTm90IHJl
YWxseSwgbm8uCj4+Pj4gCj4+Pj4gQmVjYXVzZSB3ZSB3b3VsZCBzdGlsbCBoYXZlIHR3byBkcml2
ZXJzIGZvciB0aGUgc2FtZSBjb250cm9sbGVyLCBhbmQgYQo+Pj4+IGNvbW1vbiBvbmUgdGhhdCBo
YXZlbid0IHJlYWxseSBiZWVuIHRlc3RlZCBvbiBhbnl0aGluZyBidXQgYSBzaW5nbGUKPj4+PiBw
bGF0Zm9ybS4gU28gYXJndWFibHkgYSB3b3JzZSBzaXR1YXRpb24gdGhhbiB3aGF0IHlvdSB3ZXJl
IHN1Z2dlc3RpbmcgaW4KPj4+PiB0aGUgZmlyc3QgcGxhY2UuCj4+Pj4gCj4+Pj4gVGhlIGJlc3Qg
c29sdXRpb24gd291bGQgYmUgdG8gZmluZCBzb21lb25lIHdpdGggYSBSb2NrY2hpcCBib2FyZCB0
byB0ZXN0Cj4+Pj4geW91ciBjaGFuZ2VzLCBvciB0byBnZXQgb25lIGlmIGl0J3MgZG9hYmxlIHNv
IHlvdSBjYW4gdGVzdCB5b3Vyc2VsZi4KPj4+Cj4+Pm9rIEkgd2lsbCBhbHNvIHRyeSB0byBidXkg
YSBSb2NrY2hpcCAzMDM2IGJvYXJkIGZvciBzZWxmLXRlc3QuCj4+PkFjY29yZGluZyB0byB0aGUg
Y29tbWl0IGxvZyBpZGVhIHByb3ZpZGVkIGJ5IEFuZHkgYmVmb3JlLCBtYWtlIHRoZSBpbm5vX2hk
bWkgZHJpdmVyIGNvbW1vbiBtb2R1bGUuCj4+IAo+PiBJIGZpbmFsbHkgIG1ha2UgbXkgcmszMDM2
IGJhc2VkIGt5bGluIGJvYXJkIGJvb3R1cCDvvIh1c2UgYSBsaW51eCA0LjQgZG93bnN0cmVhbSBi
c3DvvIxJIHdpbGwgZmluZCB0aW1lIHRvIHRyeSBib290Cj4+IGl0IHdpdGggbWFpbmxpbmXvvInj
gIIgU28gSSBjYW4gaGVscCBkbyB0aGUgdGVzdCBmb3Igcm9ja2NoaXAgc2lkZeOAggo+PiAKPj4g
SXQgc2VlbXMgbm90IHRoYXQgZWFzeSB0byBidXkgYSByazMwMzYgYmFzZWQgYm9hcmQgZnJvbSBt
YXJrZXQgbm9344CCCj5lbiwgVGhlIG9ubGluZSBzdG9yZSBzZWVtcyB0byBoYXZlIHN0b3BwZWQg
c2VsbGluZyByazMwMzYgCj5yZWFsbHkgbm90IGVhc3kgdG8gYnV5IG9uZSAsIEkgd3JpdGUgdGhl
IGNvZGUgZmlyc3QgLCBuZWVkIGhlbHAgdGVzdGluZyByazMwMzYgaW4gdGhlIGZ1dHVyZS4KCgpJ
IGZvdW5kIEEgUkszMTI4IGJhc2VkIGJvYXJkIFhQSS0zMTI4IGlzIGZvciBzYWxlWzBdLCB3aGlj
aCBhbHNvIGhhcyBhIGlubm8taGRtaS4KQW5kIEFseCBCZWUgaXMgd29ya2luZyBvbiBhZGRpbmcg
dXBzdHJlYW0gc3VwcG9ydCBmb3IgaXRbMV0uCgpbMF0gaHR0cHM6Ly93d3cuZ2VuaWF0ZWNoLmNv
bS9wcm9kdWN0L3hwaS0zMTI4LwoKWzFdaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LWFybS1rZXJuZWwvY292ZXIvMjAyMzEyMTMxOTUxMjUuMjEyOTIzLTEta25hZXJ6
Y2hlQGdtYWlsLmNvbS8KPgo+dGhhbmtzCj4+IAo+Pj4KPj4+d291bGQgdGhlIHN0ZXBzIGJlIG9r
PyAoaWYgSSB0ZXN0ZWQgcm9ja2NoaXAgYW5kIHN0YXJpZnZlIHBhc3MpCj4+PjEuIHNwbGl0IHRo
ZSBpbm5vX2hkbWkuYyB1bmRlciByb2NrY2hpcCB0byAgaW5ub19oZG1pLmModGhlIGNvbW1vbiBw
YXJ0KSwgaW5ub19oZG1pLXJvY2tjaGlwLmModGhlIHNvYyBzcGVjaWZpYyBwYXJ0KQo+Pj4yLiBt
b3ZlIHRoZSBjb21tb24gcGFydCBpbm5vX2hkbWkuYyB0byBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2lubm9zaWxpY29uLwo+Pj4zLiBhZGQgc3RhcnRmaXZlIHNwZWNpZmljIHBhcnQsIGlubm9faGRt
aS1zdGFydGZpdmUuYwo+Pj4KPj4+VGhhbmtzCj4+Pj4gCj4+Pj4gTWF4aW1lCg==
