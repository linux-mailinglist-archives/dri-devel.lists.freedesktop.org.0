Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B010D124152
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225F56EA48;
	Wed, 18 Dec 2019 08:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 11395 seconds by postgrey-1.36 at gabe;
 Wed, 18 Dec 2019 06:27:04 UTC
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58896E225
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 06:27:04 +0000 (UTC)
Received: from localhost (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id 828F21058;
 Wed, 18 Dec 2019 14:27:00 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.186] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P31326T140475205932800S1576650418872469_; 
 Wed, 18 Dec 2019 14:26:59 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6b66a3096eb34e37649fb219da334bf2>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: huangtao@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: [PATCH 09/12] drm/rockchip: lvds: Add PX30 support
From: "sandy.huang" <hjc@rock-chips.com>
To: Maxime Ripard <maxime@cerno.tech>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-10-miquel.raynal@bootlin.com>
 <20191216105827.rxkfbwemkqw446jx@gilmour.lan> <20191216120312.4aa478da@xps13>
 <20191216111436.wzoq33gvt42w6gqj@gilmour.lan>
 <64f6c582-8ffd-1082-f161-1e8c1a8dda44@rock-chips.com>
Message-ID: <cdf3ee27-b099-b119-483b-af4fe4a75de4@rock-chips.com>
Date: Wed, 18 Dec 2019 14:26:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <64f6c582-8ffd-1082-f161-1e8c1a8dda44@rock-chips.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:03 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, andy.yan@rock-chips.com,
 tao.huang@rock-chips.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCiDCoMKgwqAgc29tZSBtaXN0YWtlcyB3aXRoIGxhc3QgbWFpbCwgc28gcmVzZW5kIHRoaXMg
bWFpbC4KCuWcqCAyMDE5LzEyLzE4IOS4iuWNiDExOjE3LCBzYW5keS5odWFuZyDlhpnpgZM6Cj4g
SGkgTWF4aW1lICYgTWlxdWVsLAo+Cj4g5ZyoIDIwMTkvMTIvMTYg5LiL5Y2INzoxNCwgTWF4aW1l
IFJpcGFyZCDlhpnpgZM6Cj4+IE9uIE1vbiwgRGVjIDE2LCAyMDE5IGF0IDEyOjAzOjEyUE0gKzAx
MDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8u
dGVjaD4gd3JvdGUgb24gTW9uLCAxNiBEZWMgMjAxOSAxMTo1ODoyNyAKPj4+ICswMTAwOgo+Pj4+
IEhpLAo+Pj4+Cj4+Pj4gT24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDc6MTA6NDhQTSArMDEwMCwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4gK3N0YXRpYyBpbnQgcHgzMF9sdmRzX2dyZl9jb25m
aWcoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQo+Pj4+PiArewo+Pj4+
PiArwqDCoMKgIHN0cnVjdCByb2NrY2hpcF9sdmRzICpsdmRzID0gZW5jb2Rlcl90b19sdmRzKGVu
Y29kZXIpOwo+Pj4+PiArwqDCoMKgIHU4IG5oc3luYyA9ICEobW9kZS0+ZmxhZ3MgJiBEUk1fTU9E
RV9GTEFHX1BIU1lOQyk7Cj4+Pj4+ICvCoMKgwqAgdTggbnZzeW5jID0gIShtb2RlLT5mbGFncyAm
IERSTV9NT0RFX0ZMQUdfUFZTWU5DKTsKPj4+Pj4gK8KgwqDCoCB1OCBuZGNsayA9ICEobW9kZS0+
ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX1BDU1lOQyk7Cj4+Pj4+ICvCoMKgwqAgaW50IHJldDsKPj4+
Pj4gKwo+Pj4+PiArwqDCoMKgIGlmIChsdmRzLT5vdXRwdXQgIT0gRElTUExBWV9PVVRQVVRfTFZE
Uykgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgRFJNX0RFVl9FUlJPUihsdmRzLT5kZXYsICJVbnN1
cHBvcnRlZCBkaXNwbGF5IG91dHB1dCAlZFxuIiwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbHZkcy0+b3V0cHV0KTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biAtRUlOVkFMOwo+Pj4+PiArwqDCoMKgIH0KPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIGlmIChuaHN5
bmMgXiBudnN5bmMpIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIERSTV9ERVZfRVJST1IobHZkcy0+
ZGV2LCAiVW5zdXBwb3J0ZWQgSHN5bmMvVnN5bmMgCj4+Pj4+IHBvbGFyaXR5XG4iKTsKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+PiArwqDCoMKgIH0KPj4+Pj4gKwo+
Pj4+PiArwqDCoMKgIC8qIFNldCBmb3JtYXQgKi8KPj4+Pj4gK8KgwqDCoCByZXQgPSByZWdtYXBf
dXBkYXRlX2JpdHMobHZkcy0+Z3JmLCBQWDMwX0xWRFNfR1JGX1BEX1ZPX0NPTjEsCj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQWDMwX0xWRFNfRk9STUFUKGx2ZHMtPmZv
cm1hdCksCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQWDMwX0xWRFNf
Rk9STUFUKGx2ZHMtPmZvcm1hdCkpOwo+Pj4+PiArwqDCoMKgIGlmIChyZXQpCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgLyogQ29udHJvbCBI
c3luYy9Wc3luYyBwb2xhcml0eSAqLwo+Pj4+PiArwqDCoMKgIHJldCA9IHJlZ21hcF91cGRhdGVf
Yml0cyhsdmRzLT5ncmYsIFBYMzBfTFZEU19HUkZfUERfVk9fQ09OMCwKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBYMzBfTFZEU19USUVfQ0xLUygxKSwKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBYMzBfTFZEU19USUVfQ0xLUygxKSk7Cj4+
Pj4+ICvCoMKgwqAgaWYgKHJldCkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+
Pj4+ICsKPj4+Pj4gK8KgwqDCoCAvKiBTZXQgSHN5bmMvVnN5bmMgcG9sYXJpdHkgKi8KPj4+Pj4g
K8KgwqDCoCByZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMobHZkcy0+Z3JmLCBQWDMwX0xWRFNfR1JG
X1BEX1ZPX0NPTjAsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQWDMw
X0xWRFNfSU5WRVJUX0NMS1MoMSksCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBQWDMwX0xWRFNfSU5WRVJUX0NMS1MobmhzeW5jKSk7Cj4+Pj4+ICvCoMKgwqAgaWYgKHJl
dCkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4gSSBkb24ndCBrbm93IHRo
ZSBoYXJkd2FyZSBidXQgaXQgc2VlbXMgcHJldHR5IHdlaXJkIHRvIG1lLiBoc3luYyBhbmQKPj4+
PiB2c3luYyBpbiBMVkRTIGFyZSBub3QgY2xvY2tzIChvciBldmVuIHNpZ25hbHMpLCB0aGV5J3Jl
IGEgYml0IGluIHRoZQo+Pj4+IHBheWxvYWQuIElzIHRoZXJlIGFueSBleHBsYW5hdGlvbiBpbiB0
aGUgZGF0YXNoZWV0IChvciBldmVuIGEKPj4+PiBkYXRhc2hlZXQgaW4gdGhlIGZpcnN0IHBsYWNl
KT8KPj4+IFRoZXJlIGlzIG5vIGV4cGxhbmF0aW9uIGFib3V0IHRoaXMgaW4gdGhlIFBYMzAgVFJN
IHBhcnQgMSAocHVibGljKS4gQnV0Cj4+PiB5b3UgYXJlIHJpZ2h0IHRoZSBuYW1pbmcgaXMgd2Vp
cmQuIENvdWxkIHRoZSAidGllIGNsb2NrcyIgdGhpbmcgYWJvdmUKPj4+IG1lYW4gc29tZXRoaW5n
IHRvIHlvdS9wZW9wbGUga25vd2luZyB0aGUgTFZEUyB3b3JsZD8KPj4gSSBoYXZlIG5vIGlkZWEg
d2hhdCB0aGF0IGNvdWxkIG1lYW4gOikKPgo+IFRoaXMgdHdvIGJpdChHUkZfQ09OMFs5LDhdKSBp
cyBub3QgZm9yIGhzeW5jL3ZzeW5jIHBvbGFyaXR5IGNvbmZpZywgCj4gdGhlIHBvbGFyaXR5IGlz
IGRvbmUgYXQgdm9wX2NydGNfYXRvbWljX2VuYWJsZUByb2NrY2hpcF9kcm1fdm9wLmMuCj4KPiBC
ZWZvcmUgcHgzMCwgYWxsIHJvY2tjaGlwIHBsYXRmb3JtIGx2ZHMgb3V0cHV0IHBheWxvYWQgaXMg
aW5jbHVkZSAKPiBoc3luYyx2c3luYyBhbmQgZGVuIGNsb2NrIHNpZ25hbC4gQWJvdXQgeWVhcnMg
YWdvLCB3ZSBtZWV0IGEgbHZkcyAKPiBwYW5lbCBjYW4ndCB3b3JrIG5vcm1hbGx5IGF0IHJrMzI4
OCzCoCBmcm9tIHRoZSBwYW5lbCBzcGVjIHdlIGtub3cgdGhlIAo+IHBhbmVsIG5lZWQgbHZkcyB3
b3JrIGRlbiBtb2RlIG9ubHksIHRoZSBoc3luYy92c3luYyBuZWVkIHRvIHNldCAwIGF0IAo+IGJs
YW5rIHRpbWUsIHNvIHdlIGFkZCB0aGlzIHR3byBiaXQoR1JGX0NPTjBbOSw4XSkgZm9yIHRoaXMg
bW9kZS4KPgo+IGJ1dCBub3cgd2UgY2FuJ3QgZ2V0IGluIHRvdWNoIHdpdGggdGhlIGN1c3RvbWVy
IGFuZCBnZXQgdGhlIHBhbmVsIHRvIAo+IHRlc3QgdGhpcyBmdW5jdGlvbiwgc28gd2UgY2FuJ3Qg
dmVyaWZ5IHRoZSBwYW5lbCB3b3JrIHVubm9ybWFsbHkgaXMgCj4gYmVjYXVzZSBvZsKgIHRoZSBk
ZW4gbW9kZSBvbmx5IGFuZCB0aGUgaHN5bmMgdnN5bmMgc2lnbmFsIGxldmVsIGF0IAo+IGJsYW5r
IHRpbWUuCj4KPiBJIHJlY29tbWVuZCBub3QgaW5jbHVkaW5nIHRoaXMgcGFydCBvZiBjb25maWd1
cmF0aW9uIGJlZm9yZSB3ZSB0ZXN0IAo+IHRoaXMgZnVuY2lvbiBhdCBkZW4gbW9kZSBvbmx5IGx2
ZHMgcGFuZWwsdGhhbmtzLgo+Cj4+Cj4+IE1heGltZQo+Pgo+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1yb2NrY2hpcCBtYWlsaW5nIGxp
c3QKPj4gTGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJvY2tjaGlwCj4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
