Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F64E80C929
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 13:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12AF10E3E0;
	Mon, 11 Dec 2023 12:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m1345.mail.163.com (m1345.mail.163.com [220.181.13.45])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B60910E3E0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 12:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=lEZaOA2vBpaMILd1AhiuL/u56MvtHmU4/WI7bGGCbWo=; b=n
 S7LVNS5D/nuLqajYCCJuZ5YUQx4fMMuUV5E/ldt7eDYsxza0JFgssmUt1k7+dL9J
 VioShIoL+Ssf1hWS57SgpzHdOL+miktJIVlqV8Rkvtgg9bmKeLsftZfn+TKx++Pn
 /rUsyb1hpHZsX/2a4qD3ilQmQMHiNKfBU4oNRNaSmk=
Received: from andyshrk$163.com ( [58.22.7.114] ) by ajax-webmail-wmsvr45
 (Coremail) ; Mon, 11 Dec 2023 20:13:11 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 11 Dec 2023 20:13:11 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Keith Zhao" <keith.zhao@starfivetech.com>
Subject: Re:Re: [v3 5/6] drm/vs: Add hdmi driver
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
In-Reply-To: <2dc5ea49-9a5f-484a-98dc-1b35b79d0945@starfivetech.com>
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
X-NTES-SC: AL_Qu2bAP6SuU8i5ySQZ+kXn0kXhec2W8Czvvgg34JRP5k0hynnwAEvc0JFOEPk/d2MNhKrjSWXaid/wONHUYtdeq1DMTXAp1Gpuf4Y7OS0tykj
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6f7acc9d.5648.18c58cba9be.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LcGowAD3P57X_HZlPJosAA--.56797W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAxDXmVOA45baQABss
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

SGkgS2VpdGjvvJoKCuWcqCAyMDIzLTEyLTExIDE4OjI0OjM177yMIktlaXRoIFpoYW8iIDxrZWl0
aC56aGFvQHN0YXJmaXZldGVjaC5jb20+IOWGmemBk++8mgo+aGkgTWF4aW1lOgo+aGkgQW5keToK
Pgo+T24gMjAyMy8xMi84IDE3OjE0LCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+PiBIaSwKPj4gCj4+
IE9uIEZyaSwgRGVjIDA4LCAyMDIzIGF0IDExOjIzOjM3QU0gKzA4MDAsIEFuZHkgWWFuIHdyb3Rl
Ogo+Pj4g5ZyoIDIwMjMtMTItMDggMTE6MDA6MzHvvIwiS2VpdGggWmhhbyIgPGtlaXRoLnpoYW9A
c3RhcmZpdmV0ZWNoLmNvbT4g5YaZ6YGT77yaCj4+PiA+Cj4+PiA+Cj4+PiA+T24gMjAyMy8xMi84
IDg6MzcsIEFuZHkgWWFuIHdyb3RlOgo+Pj4gPj4gSGkgS2V0aO+8mgo+Pj4gPj4gCj4+PiA+PiAK
Pj4+ID4+IAo+Pj4gPj4gCj4+PiA+PiAKPj4+ID4+IAo+Pj4gPj4g5ZyoIDIwMjMtMTItMDcgMTg6
NDg6MTPvvIwiS2VpdGggWmhhbyIgPGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT4g5YaZ6YGT
77yaCj4+PiA+Pj4KPj4+ID4+Pgo+Pj4gPj4+T24gMjAyMy8xMi83IDE3OjAyLCBBbmR5IFlhbiB3
cm90ZToKPj4+ID4+Pj4gCj4+PiA+Pj4+IAo+Pj4gPj4+PiAKPj4+ID4+Pj4gCj4+PiA+Pj4+IEhp
IEtlaXRo77yaCj4+PiA+Pj4+IAo+Pj4gPj4+PiAKPj4+ID4+Pj4gCj4+PiA+Pj4+IAo+Pj4gPj4+
PiAKPj4+ID4+Pj4gCj4+PiA+Pj4+IAo+Pj4gPj4+PiAKPj4+ID4+Pj4gCj4+PiA+Pj4+IAo+Pj4g
Pj4+PiAKPj4+ID4+Pj4gQXQgMjAyMy0xMi0wNiAyMjoxMTozMywgIktlaXRoIFpoYW8iIDxrZWl0
aC56aGFvQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Pj4gPj4+Pj4KPj4+ID4+Pj4+Cj4+PiA+
Pj4+Pk9uIDIwMjMvMTIvNiAyMDo1NiwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPj4+ID4+Pj4+PiBP
biBXZWQsIERlYyAwNiwgMjAyMyBhdCAwODowMjo1NVBNICswODAwLCBLZWl0aCBaaGFvIHdyb3Rl
Ogo+Pj4gPj4+Pj4+PiA+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RhcmZp
dmVfaGRtaV9kdF9pZHNbXSA9IHsKPj4+ID4+Pj4+Pj4gPj4gKwl7IC5jb21wYXRpYmxlID0gInN0
YXJmaXZlLGpoNzExMC1pbm5vLWhkbWkiLH0sCj4+PiA+Pj4+Pj4+ID4gCj4+PiA+Pj4+Pj4+ID4g
U28gaXQncyBpbm5vIGhkbWksIGp1c3QgbGlrZSBSb2NrY2hpcCB0aGVuPwo+Pj4gPj4+Pj4+PiA+
IAo+Pj4gPj4+Pj4+PiA+IFRoaXMgc2hvdWxkIGJlIGEgY29tbW9uIGRyaXZlci4KPj4+ID4+Pj4+
Pj4KPj4+ID4+Pj4+Pj4gUm9ja2NoaXAgaGFzIGEgaW5ubyBoZG1pIElQLiBhbmQgU3RhcmZpdmUg
aGFzIGEgaW5ubyBoZG1pIElQLgo+Pj4gPj4+Pj4+PiBidXQgdGhlIGhhcmV3YXdyZSBkaWZmZXJl
bmNlIG9mIHRoZW0gaXMgYmlnICwgaXQgaXMgbm90IGVhc3kgdG8gdXNlIHRoZSBjb21tb24gZHJp
dmVyCj4+PiA+Pj4+Pj4+IG1heWJlIGkgbmVlZCB0aGUgaW5ubyBoZG1pIHZlcnNpb24gaGVyZSB0
byBtYWtlIGEgZGlzdGluY3Rpb24KPj4+ID4+Pj4+PiAKPj4+ID4+Pj4+PiBJIGp1c3QgaGFkIGEg
bG9vayBhdCB0aGUgcm9ja2NoaXAgaGVhZGVyIGZpbGU6IGFsbCB0aGUgcmVnaXN0ZXJzIGJ1dCB0
aGUKPj4+ID4+Pj4+PiBTVEFSRklWRV8qIG9uZXMgYXJlIGlkZW50aWNhbC4KPj4+ID4+Pj4+PiAK
Pj4+ID4+Pj4+PiBUaGVyZSdzIG5vIG5lZWQgdG8gaGF2ZSB0d28gaWRlbnRpY2FsIGRyaXZlcnMg
dGhlbiwgcGxlYXNlIHVzZSB0aGUKPj4+ID4+Pj4+PiByb2NrY2hpcCBkcml2ZXIgaW5zdGVhZC4K
Pj4+ID4+Pj4+PiAKPj4+ID4+Pj4+PiBNYXhpbWUKPj4+ID4+Pj4+Cj4+PiA+Pj4+Pm9rLCBoYXZl
IGEgc2ltcGxlIHRlc3QgLCBlZGlkIGNhbiBnZXQgLiBpIHdpbGwgY29udGludWUgCj4+PiA+Pj4+
IAo+Pj4gPj4+PiBNYXliZSB5b3UgY2FuIHRha2UgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pIGFzIGEgcmVmZXJlbmNl77yMIHRoaXMKPj4+ID4+Pj4gaXMgYWxzbyBhIGhk
bWkgaXAgdXNlZCBieSByb2NrY2hpcC9tZXNvbi9zdW54aS9qei9pbXjjgIIKPj4+ID4+Pj4gV2Ug
ZmluYWxseSBtYWtlIGl0IHNoYXJlIG9uZSBkcml2ZXLjgIIKPj4+ID4+Pj4+Cj4+PiA+Pj5oaSBB
bmR5Ogo+Pj4gPj4+Cj4+PiA+Pj5kd19oZG1pIHNlZW1zIGEgZ29vZCBjaG9pY2UgLCBpdCBjYW4g
aGFuZGxlIGlubm8gaGRtaSBoYXJkd2FyZSBieSBkZWZpbmUgaXRzIGR3X2hkbWlfcGxhdF9kYXRh
Lgo+Pj4gPj4+ZG9lcyBpdCBtZWFucyBpIGNhbiB3cml0ZSBvd24gZHJpdmVyIGZpbGVzIHN1Y2gg
YXMoZHdfaGRtaS1zdGFyZml2ZS5jKSBiYXNlZCBvbiBkd19oZG1pIGluc3RlYWQgb2YgYWRkIHBs
YXRfZGF0YSBpbiBpbm5vX2hkbWkuYwo+Pj4gPj4+Cj4+PiA+PiAKPj4+ID4+IEkgdGhpbmsgdGhl
IHByb2Nlc3MgbWF5YmUgbGlrZSB0aGlz77yaCj4+PiA+PiAKPj4+ID4+IDEuIHNwbGl0IHRoZSBp
bm5vX2hkbWkuYyB1bmRlciByb2NrY2hpcCB0byAgaW5ub19oZG1pLmModGhlIGNvbW1vbiBwYXJ0
KSwgaW5ub19oZG1pLXJvY2tjaGlwLmModGhlIHNvYyBzcGVjaWZpYyBwYXJ0KQo+Pj4gPj4gMi4g
bW92ZSB0aGUgY29tbW9uIHBhcnQgaW5ub19oZG1pLmMgdG8gZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9pbm5vc2lsaWNvbi8KPj4+ID4+IDMuIGFkZCBzdGFydGZpdmUgc3BlY2lmaWMgcGFydCwgaW5u
b19oZG1pLXN0YXJ0Zml2ZS5jCj4+PiA+PiAKPj4+ID4+IGJlbGxvdyBnaXQgbG9nIGZyb20ga2Vy
bmVsIHRocmVlIHNob3cgaG93IHdlIGNvbnZlcnQgIGR3X2hkbWkgdG8gYSBjb21tb24gZHJpdmVy
OiAKPj4+ID4+IAo+Pj4gPj4gCj4+PiA+PiAKPj4+ID4+IDEyYjlmMjA0ZTgwNCBkcm06IGJyaWRn
ZS9kd19oZG1pOiBhZGQgcm9ja2NoaXAgcmszMjg4IHN1cHBvcnQKPj4+ID4+IDc0YWY5ZTRkMDNi
OCBkdC1iaW5kaW5nczogQWRkIGRvY3VtZW50YXRpb24gZm9yIHJvY2tjaGlwIGR3IGhkbWkKPj4+
ID4+IGQzNDZjMTRlZWVhOSBkcm06IGJyaWRnZS9kd19oZG1pOiBhZGQgZnVuY3Rpb24gZHdfaGRt
aV9waHlfZW5hYmxlX3NwYXJlCj4+PiA+PiBhNGQzYjhiMDUwZDUgZHJtOiBicmlkZ2UvZHdfaGRt
aTogY2xlYXIgaTJjbXBoeV9zdGF0MCByZWcgaW4gaGRtaV9waHlfd2FpdF9pMmNfZG9uZQo+Pj4g
Pj4gNjMyZDAzNWJhY2UyIGRybTogYnJpZGdlL2R3X2hkbWk6IGFkZCBtb2RlX3ZhbGlkIHN1cHBv
cnQKPj4+ID4+IDBjZDlkMTQyODMyMiBkcm06IGJyaWRnZS9kd19oZG1pOiBhZGQgc3VwcG9ydCBm
b3IgbXVsdGktYnl0ZSByZWdpc3RlciB3aWR0aCBhY2Nlc3MKPj4+ID4+IGNkMTUyMzkzOTY3ZSBk
dC1iaW5kaW5nczogYWRkIGRvY3VtZW50IGZvciBkd19oZG1pCj4+PiA+PiBiMjFmNGI2NThkZjgg
ZHJtOiBpbXg6IGlteC1oZG1pOiBtb3ZlIGlteC1oZG1pIHRvIGJyaWRnZS9kd19oZG1pCj4+PiA+
PiBhYWE3NTdhMDkyYzIgZHJtOiBpbXg6IGlteC1oZG1pOiBzcGxpdCBwaHkgY29uZmlndXJhdGlv
biB0byBwbGF0Zm9ybSBkcml2ZXIKPj4+ID4+IDNkMWIzNWEzZDlmMyBkcm06IGlteDogaW14LWhk
bWk6IGNvbnZlcnQgaW14LWhkbWkgdG8gZHJtX2JyaWRnZSBtb2RlCj4+PiA+PiBjMmMzODQ4ODUx
YTcgZHJtOiBpbXg6IGlteC1oZG1pOiByZXR1cm4gZGVmZXIgaWYgY2FuJ3QgZ2V0IGRkYyBpMmMg
YWRhcHRlcgo+Pj4gPj4gYjU4NzgzMzkzM2RlIGRybTogaW14OiBpbXgtaGRtaTogbWFrZSBjaGVj
a3BhdGNoIGhhcHB5Cj4+PiA+PiAKPj4+ID5oaSBBbmR5Ogo+Pj4gPkkgZ290IHlvdSBtZWFucywg
Cj4+PiA+YXMgSSBkb24ndCBoYXZlIGEgcm9ja2NoaXAgYm9hcmQgb24gaGFuZCAsIHRvIHNwbGl0
IHRoZSBpbm5vX2hkbWkuYyBjYW4gbm90IGJlIHRlc3RlZC4KPj4+ID4KPj4+ID5ob3cgYWRvdXQg
dGhpcyBpZGVhOgo+Pj4gPjHjgIFzcGxpdCB0aGUgc3RhcmZpdmVfaGRtaS5jIHVuZGVyIHZlcmlz
aWxpY2lvbiB0byAgaW5ub19oZG1pLmModGhlIGNvbW1vbiBwYXJ0KSwgaW5ub19oZG1pLXN0YXJm
aXZlLmModGhlIHNvYyBzcGVjaWZpYyBwYXJ0KQo+Pj4gPjIuIG1vdmUgdGhlIGNvbW1vbiBwYXJ0
IGlubm9faGRtaS5jIHRvIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW5ub3NpbGljb24vCj4+PiA+
My4gSW4gdGhlIGZ1dHVyZSwgaW5ubyBoZG1pLmMgdW5kZXIgcm9ja2NoaXAgd2lsbCByZXVzZSB0
aGUgcHVibGljIGRyaXZlci4KPj4+IAo+Pj4gSSBhbSBub3Qgc3VyZSBpZiBkcm0gbWFpbnRhaW5l
cnMgYXJlIGhhcHB5IHdpdGggdGhpc+OAggo+PiAKPj4gTm90IHJlYWxseSwgbm8uCj4+IAo+PiBC
ZWNhdXNlIHdlIHdvdWxkIHN0aWxsIGhhdmUgdHdvIGRyaXZlcnMgZm9yIHRoZSBzYW1lIGNvbnRy
b2xsZXIsIGFuZCBhCj4+IGNvbW1vbiBvbmUgdGhhdCBoYXZlbid0IHJlYWxseSBiZWVuIHRlc3Rl
ZCBvbiBhbnl0aGluZyBidXQgYSBzaW5nbGUKPj4gcGxhdGZvcm0uIFNvIGFyZ3VhYmx5IGEgd29y
c2Ugc2l0dWF0aW9uIHRoYW4gd2hhdCB5b3Ugd2VyZSBzdWdnZXN0aW5nIGluCj4+IHRoZSBmaXJz
dCBwbGFjZS4KPj4gCj4+IFRoZSBiZXN0IHNvbHV0aW9uIHdvdWxkIGJlIHRvIGZpbmQgc29tZW9u
ZSB3aXRoIGEgUm9ja2NoaXAgYm9hcmQgdG8gdGVzdAo+PiB5b3VyIGNoYW5nZXMsIG9yIHRvIGdl
dCBvbmUgaWYgaXQncyBkb2FibGUgc28geW91IGNhbiB0ZXN0IHlvdXJzZWxmLgo+Cj5vayBJIHdp
bGwgYWxzbyB0cnkgdG8gYnV5IGEgUm9ja2NoaXAgMzAzNiBib2FyZCBmb3Igc2VsZi10ZXN0Lgo+
QWNjb3JkaW5nIHRvIHRoZSBjb21taXQgbG9nIGlkZWEgcHJvdmlkZWQgYnkgQW5keSBiZWZvcmUs
IG1ha2UgdGhlIGlubm9faGRtaSBkcml2ZXIgY29tbW9uIG1vZHVsZS4KCkkgZmluYWxseSAgbWFr
ZSBteSByazMwMzYgYmFzZWQga3lsaW4gYm9hcmQgYm9vdHVwIO+8iHVzZSBhIGxpbnV4IDQuNCBk
b3duc3RyZWFtIGJzcO+8jEkgd2lsbCBmaW5kIHRpbWUgdG8gdHJ5IGJvb3QKaXQgd2l0aCBtYWlu
bGluZe+8ieOAgiBTbyBJIGNhbiBoZWxwIGRvIHRoZSB0ZXN0IGZvciByb2NrY2hpcCBzaWRl44CC
CgpJdCBzZWVtcyBub3QgdGhhdCBlYXN5IHRvIGJ1eSBhIHJrMzAzNiBiYXNlZCBib2FyZCBmcm9t
IG1hcmtldCBub3fjgIIKCj4KPndvdWxkIHRoZSBzdGVwcyBiZSBvaz8gKGlmIEkgdGVzdGVkIHJv
Y2tjaGlwIGFuZCBzdGFyaWZ2ZSBwYXNzKQo+MS4gc3BsaXQgdGhlIGlubm9faGRtaS5jIHVuZGVy
IHJvY2tjaGlwIHRvICBpbm5vX2hkbWkuYyh0aGUgY29tbW9uIHBhcnQpLCBpbm5vX2hkbWktcm9j
a2NoaXAuYyh0aGUgc29jIHNwZWNpZmljIHBhcnQpCj4yLiBtb3ZlIHRoZSBjb21tb24gcGFydCBp
bm5vX2hkbWkuYyB0byBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm9zaWxpY29uLwo+My4gYWRk
IHN0YXJ0Zml2ZSBzcGVjaWZpYyBwYXJ0LCBpbm5vX2hkbWktc3RhcnRmaXZlLmMKPgo+VGhhbmtz
Cj4+IAo+PiBNYXhpbWUK
