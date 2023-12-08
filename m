Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FC4809756
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 01:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4774F10E0E3;
	Fri,  8 Dec 2023 00:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m13111.mail.163.com (m13111.mail.163.com [220.181.13.111])
 by gabe.freedesktop.org (Postfix) with ESMTP id C4E5810E0E3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 00:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=wVZroXje9JPyqCEI+vYosxj/dxnQewo6InLWjjZw5v8=; b=P
 kg70MCX2p3NQ7NZ3You167adVwFdeqcCQqziMjW6WIQUcW/MrnNLzvMj1Ldp5wd3
 rOwLirUh6KSFLhqN0oraOxFqEoBLHNNK8Bo35I2pzlpv0L++Hc5LKJIEvD89TEdk
 pZN5aAUK1EGX1unK97JbaCFDSoTHL70LweV1DQwAYA=
Received: from andyshrk$163.com ( [58.22.7.114] ) by ajax-webmail-wmsvr111
 (Coremail) ; Fri, 8 Dec 2023 08:37:32 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 8 Dec 2023 08:37:32 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Keith Zhao" <keith.zhao@starfivetech.com>
Subject: Re:Re: [v3 5/6] drm/vs: Add hdmi driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
In-Reply-To: <e0b84511-dbb4-46fa-9465-713369232f6f@starfivetech.com>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-6-keith.zhao@starfivetech.com>
 <esetsiqgqpk35zue4c6aq7l6zn4kezhxkqqa7ompaz2vhdy3lr@4d5awfqgs2ss>
 <94a1f9fc-82fb-4a04-a44b-f9b20c2bdfdd@starfivetech.com>
 <abdl6kmighvpwojvafq443q7grn6w3abwpvw7zwbna4jvtsvjf@fa42rv46n2wh>
 <40cdd3c7-174e-4611-9ea6-22cb56d1f62b@starfivetech.com>
 <e90142d.44b1.18c43833b63.Coremail.andyshrk@163.com>
 <e0b84511-dbb4-46fa-9465-713369232f6f@starfivetech.com>
X-NTES-SC: AL_Qu2bA/WSukAu5CmRYekXn0kXhec2W8Czvvgg34JRP5k0pSvH9zwjQkBPMHnb0fmxFwmhjyeZXxZVyNx9baRkdJ+gj36WGcDp2oT4pJM2WKDm
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <43e42269.314.18c46dbb4c5.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: b8GowAD3nyZNZXJl274QAA--.45410W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEghAXmVOA1F28AACs5
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

SGkgS2V0aO+8mgoKCgoKCgrlnKggMjAyMy0xMi0wNyAxODo0ODoxM++8jCJLZWl0aCBaaGFvIiA8
a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPiDlhpnpgZPvvJoKPgo+Cj5PbiAyMDIzLzEyLzcg
MTc6MDIsIEFuZHkgWWFuIHdyb3RlOgo+PiAKPj4gCj4+IAo+PiAKPj4gSGkgS2VpdGjvvJoKPj4g
Cj4+IAo+PiAKPj4gCj4+IAo+PiAKPj4gCj4+IAo+PiAKPj4gCj4+IAo+PiBBdCAyMDIzLTEyLTA2
IDIyOjExOjMzLCAiS2VpdGggWmhhbyIgPGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT4gd3Jv
dGU6Cj4+Pgo+Pj4KPj4+T24gMjAyMy8xMi82IDIwOjU2LCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+
Pj4+IE9uIFdlZCwgRGVjIDA2LCAyMDIzIGF0IDA4OjAyOjU1UE0gKzA4MDAsIEtlaXRoIFpoYW8g
d3JvdGU6Cj4+Pj4+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdGFyZml2
ZV9oZG1pX2R0X2lkc1tdID0gewo+Pj4+PiA+PiArCXsgLmNvbXBhdGlibGUgPSAic3RhcmZpdmUs
amg3MTEwLWlubm8taGRtaSIsfSwKPj4+Pj4gPiAKPj4+Pj4gPiBTbyBpdCdzIGlubm8gaGRtaSwg
anVzdCBsaWtlIFJvY2tjaGlwIHRoZW4/Cj4+Pj4+ID4gCj4+Pj4+ID4gVGhpcyBzaG91bGQgYmUg
YSBjb21tb24gZHJpdmVyLgo+Pj4+Pgo+Pj4+PiBSb2NrY2hpcCBoYXMgYSBpbm5vIGhkbWkgSVAu
IGFuZCBTdGFyZml2ZSBoYXMgYSBpbm5vIGhkbWkgSVAuCj4+Pj4+IGJ1dCB0aGUgaGFyZXdhd3Jl
IGRpZmZlcmVuY2Ugb2YgdGhlbSBpcyBiaWcgLCBpdCBpcyBub3QgZWFzeSB0byB1c2UgdGhlIGNv
bW1vbiBkcml2ZXIKPj4+Pj4gbWF5YmUgaSBuZWVkIHRoZSBpbm5vIGhkbWkgdmVyc2lvbiBoZXJl
IHRvIG1ha2UgYSBkaXN0aW5jdGlvbgo+Pj4+IAo+Pj4+IEkganVzdCBoYWQgYSBsb29rIGF0IHRo
ZSByb2NrY2hpcCBoZWFkZXIgZmlsZTogYWxsIHRoZSByZWdpc3RlcnMgYnV0IHRoZQo+Pj4+IFNU
QVJGSVZFXyogb25lcyBhcmUgaWRlbnRpY2FsLgo+Pj4+IAo+Pj4+IFRoZXJlJ3Mgbm8gbmVlZCB0
byBoYXZlIHR3byBpZGVudGljYWwgZHJpdmVycyB0aGVuLCBwbGVhc2UgdXNlIHRoZQo+Pj4+IHJv
Y2tjaGlwIGRyaXZlciBpbnN0ZWFkLgo+Pj4+IAo+Pj4+IE1heGltZQo+Pj4KPj4+b2ssIGhhdmUg
YSBzaW1wbGUgdGVzdCAsIGVkaWQgY2FuIGdldCAuIGkgd2lsbCBjb250aW51ZSAKPj4gCj4+IE1h
eWJlIHlvdSBjYW4gdGFrZSBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkg
YXMgYSByZWZlcmVuY2XvvIwgdGhpcwo+PiBpcyBhbHNvIGEgaGRtaSBpcCB1c2VkIGJ5IHJvY2tj
aGlwL21lc29uL3N1bnhpL2p6L2lteOOAggo+PiBXZSBmaW5hbGx5IG1ha2UgaXQgc2hhcmUgb25l
IGRyaXZlcuOAggo+Pj4KPmhpIEFuZHk6Cj4KPmR3X2hkbWkgc2VlbXMgYSBnb29kIGNob2ljZSAs
IGl0IGNhbiBoYW5kbGUgaW5ubyBoZG1pIGhhcmR3YXJlIGJ5IGRlZmluZSBpdHMgZHdfaGRtaV9w
bGF0X2RhdGEuCj5kb2VzIGl0IG1lYW5zIGkgY2FuIHdyaXRlIG93biBkcml2ZXIgZmlsZXMgc3Vj
aCBhcyhkd19oZG1pLXN0YXJmaXZlLmMpIGJhc2VkIG9uIGR3X2hkbWkgaW5zdGVhZCBvZiBhZGQg
cGxhdF9kYXRhIGluIGlubm9faGRtaS5jCj4KCkkgdGhpbmsgdGhlIHByb2Nlc3MgbWF5YmUgbGlr
ZSB0aGlz77yaCgoxLiBzcGxpdCB0aGUgaW5ub19oZG1pLmMgdW5kZXIgcm9ja2NoaXAgdG8gIGlu
bm9faGRtaS5jKHRoZSBjb21tb24gcGFydCksIGlubm9faGRtaS1yb2NrY2hpcC5jKHRoZSBzb2Mg
c3BlY2lmaWMgcGFydCkKMi4gbW92ZSB0aGUgY29tbW9uIHBhcnQgaW5ub19oZG1pLmMgdG8gZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vc2lsaWNvbi8KMy4gYWRkIHN0YXJ0Zml2ZSBzcGVjaWZp
YyBwYXJ0LCBpbm5vX2hkbWktc3RhcnRmaXZlLmMKCmJlbGxvdyBnaXQgbG9nIGZyb20ga2VybmVs
IHRocmVlIHNob3cgaG93IHdlIGNvbnZlcnQgIGR3X2hkbWkgdG8gYSBjb21tb24gZHJpdmVyOiAK
CgoKMTJiOWYyMDRlODA0IGRybTogYnJpZGdlL2R3X2hkbWk6IGFkZCByb2NrY2hpcCByazMyODgg
c3VwcG9ydAo3NGFmOWU0ZDAzYjggZHQtYmluZGluZ3M6IEFkZCBkb2N1bWVudGF0aW9uIGZvciBy
b2NrY2hpcCBkdyBoZG1pCmQzNDZjMTRlZWVhOSBkcm06IGJyaWRnZS9kd19oZG1pOiBhZGQgZnVu
Y3Rpb24gZHdfaGRtaV9waHlfZW5hYmxlX3NwYXJlCmE0ZDNiOGIwNTBkNSBkcm06IGJyaWRnZS9k
d19oZG1pOiBjbGVhciBpMmNtcGh5X3N0YXQwIHJlZyBpbiBoZG1pX3BoeV93YWl0X2kyY19kb25l
CjYzMmQwMzViYWNlMiBkcm06IGJyaWRnZS9kd19oZG1pOiBhZGQgbW9kZV92YWxpZCBzdXBwb3J0
CjBjZDlkMTQyODMyMiBkcm06IGJyaWRnZS9kd19oZG1pOiBhZGQgc3VwcG9ydCBmb3IgbXVsdGkt
Ynl0ZSByZWdpc3RlciB3aWR0aCBhY2Nlc3MKY2QxNTIzOTM5NjdlIGR0LWJpbmRpbmdzOiBhZGQg
ZG9jdW1lbnQgZm9yIGR3X2hkbWkKYjIxZjRiNjU4ZGY4IGRybTogaW14OiBpbXgtaGRtaTogbW92
ZSBpbXgtaGRtaSB0byBicmlkZ2UvZHdfaGRtaQphYWE3NTdhMDkyYzIgZHJtOiBpbXg6IGlteC1o
ZG1pOiBzcGxpdCBwaHkgY29uZmlndXJhdGlvbiB0byBwbGF0Zm9ybSBkcml2ZXIKM2QxYjM1YTNk
OWYzIGRybTogaW14OiBpbXgtaGRtaTogY29udmVydCBpbXgtaGRtaSB0byBkcm1fYnJpZGdlIG1v
ZGUKYzJjMzg0ODg1MWE3IGRybTogaW14OiBpbXgtaGRtaTogcmV0dXJuIGRlZmVyIGlmIGNhbid0
IGdldCBkZGMgaTJjIGFkYXB0ZXIKYjU4NzgzMzkzM2RlIGRybTogaW14OiBpbXgtaGRtaTogbWFr
ZSBjaGVja3BhdGNoIGhhcHB5CgoKPlRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQhISEKPgo+
Pj4KPj4+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+PmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPj4+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo+Cj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj5saW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj5odHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
