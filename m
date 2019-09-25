Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C97BDC93
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 13:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F096EB95;
	Wed, 25 Sep 2019 11:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90BD6E828
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 11:01:48 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.206])
 by regular1.263xmail.com (Postfix) with ESMTP id 724E839F;
 Wed, 25 Sep 2019 19:01:46 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.10.69] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P28189T140160207415040S1569409303280888_; 
 Wed, 25 Sep 2019 19:01:46 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f6fb2099e410f931f416b4a03bb97f8e>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: linux-kernel@vger.kernel.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: [PATCH 1/3] drm: Add some new format DRM_FORMAT_NVXX_10
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <1569398801-92201-1-git-send-email-hjc@rock-chips.com>
 <1569398801-92201-2-git-send-email-hjc@rock-chips.com>
 <8cd915d3-9f61-abdc-7fd1-a9241777f29a@linux.intel.com>
 <e0c272ff-5ef9-f5db-4dad-477ecae2e6ca@rock-chips.com>
 <434dc7ec-5029-4609-f6f3-0766091315ec@linux.intel.com>
From: "sandy.huang" <hjc@rock-chips.com>
Message-ID: <406cb41b-1840-df9d-a893-8ab9da8d6f4f@rock-chips.com>
Date: Wed, 25 Sep 2019 19:01:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <434dc7ec-5029-4609-f6f3-0766091315ec@linux.intel.com>
Content-Language: en-US
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
Cc: Ayan.Halder@arm.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CuWcqCAyMDE5LzkvMjUg5LiL5Y2INToyMywgTWFhcnRlbiBMYW5raG9yc3Qg5YaZ6YGTOgo+IE9w
IDI1LTA5LTIwMTkgb20gMTA6MzIgc2NocmVlZiBzYW5keS5odWFuZzoKPj4g5ZyoIDIwMTkvOS8y
NSDkuIvljYg0OjE3LCBNYWFydGVuIExhbmtob3JzdCDlhpnpgZM6Cj4+PiBPcCAyNS0wOS0yMDE5
IG9tIDEwOjA2IHNjaHJlZWYgU2FuZHkgSHVhbmc6Cj4+Pj4gVGhlc2UgbmV3IGZvcm1hdCBpcyBz
dXBwb3J0ZWQgYnkgc29tZSByb2NrY2hpcCBzb2NzOgo+Pj4+Cj4+Pj4gRFJNX0ZPUk1BVF9OVjEy
XzEwL0RSTV9GT1JNQVRfTlYyMV8xMAo+Pj4+IERSTV9GT1JNQVRfTlYxNl8xMC9EUk1fRk9STUFU
X05WNjFfMTAKPj4+PiBEUk1fRk9STUFUX05WMjRfMTAvRFJNX0ZPUk1BVF9OVjQyXzEwCj4+Pj4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgo+Pj4+
IC0tLQo+Pj4+ICDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jwqAgfCAxOCArKysrKysr
KysrKysrKysrKysKPj4+PiAgwqAgaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggfCAxNCAr
KysrKysrKysrKysrKwo+Pj4+ICDCoCAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYwo+Pj4+IGluZGV4IGM2MzAwNjQuLmYyNWZhODEgMTAw
NjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYwo+Pj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKPj4+PiBAQCAtMjc0LDYgKzI3NCwyNCBAQCBjb25z
dCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpfX2RybV9mb3JtYXRfaW5mbyh1MzIgZm9ybWF0KQo+
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9ZVVY0MjBfMTBC
SVQswqDCoMKgIC5kZXB0aCA9IDAsCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLm51bV9w
bGFuZXMgPSAxLCAuY3BwID0geyAwLCAwLCAwIH0sIC5oc3ViID0gMiwgLnZzdWIgPSAyLAo+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5pc195dXYgPSB0cnVlIH0sCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHsgLmZvcm1hdCA9IERSTV9GT1JNQVRfTlYxMl8xMCzCoMKgwqDCoMKgwqDCoCAuZGVw
dGggPSAwLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLm51bV9wbGFuZXMgPSAyLCAuY3BwID0g
eyAwLCAwLCAwIH0sIC5oc3ViID0gMiwgLnZzdWIgPSAyLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqAgLmlzX3l1diA9IHRydWUgfSwKPj4+PiArwqDCoMKgwqDCoMKgwqAgeyAuZm9ybWF0ID0gRFJN
X0ZPUk1BVF9OVjIxXzEwLMKgwqDCoMKgwqDCoMKgIC5kZXB0aCA9IDAsCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoCAubnVtX3BsYW5lcyA9IDIsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAy
LCAudnN1YiA9IDIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAuaXNfeXV2ID0gdHJ1ZSB9LAo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCB7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WMTZfMTAswqDCoMKg
wqDCoMKgwqAgLmRlcHRoID0gMCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC5udW1fcGxhbmVz
ID0gMiwgLmNwcCA9IHsgMCwgMCwgMCB9LCAuaHN1YiA9IDIsIC52c3ViID0gMSwKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgIC5pc195dXYgPSB0cnVlIH0sCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHsg
LmZvcm1hdCA9IERSTV9GT1JNQVRfTlY2MV8xMCzCoMKgwqDCoMKgwqDCoCAuZGVwdGggPSAwLAo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLm51bV9wbGFuZXMgPSAyLCAuY3BwID0geyAwLCAwLCAw
IH0sIC5oc3ViID0gMiwgLnZzdWIgPSAxLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLmlzX3l1
diA9IHRydWUgfSwKPj4+PiArwqDCoMKgwqDCoMKgwqAgeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9O
VjI0XzEwLMKgwqDCoMKgwqDCoMKgIC5kZXB0aCA9IDAsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oCAubnVtX3BsYW5lcyA9IDIsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAxLCAudnN1YiA9
IDEsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAuaXNfeXV2ID0gdHJ1ZSB9LAo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCB7IC5mb3JtYXQgPSBEUk1fRk9STUFUX05WNDJfMTAswqDCoMKgwqDCoMKgwqAg
LmRlcHRoID0gMCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC5udW1fcGxhbmVzID0gMiwgLmNw
cCA9IHsgMCwgMCwgMCB9LCAuaHN1YiA9IDEsIC52c3ViID0gMSwKPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgIC5pc195dXYgPSB0cnVlIH0sCj4+Pj4gIMKgwqDCoMKgwqAgfTsKPj4+PiAgwqAgwqDC
oMKgwqDCoCB1bnNpZ25lZCBpbnQgaTsKPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2Ry
bS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+Pj4+IGluZGV4
IDNmZWVhYTMuLjA0NzlmNDcgMTAwNjQ0Cj4+Pj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1f
Zm91cmNjLmgKPj4+PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+Pj4+IEBA
IC0yMzgsNiArMjM4LDIwIEBAIGV4dGVybiAiQyIgewo+Pj4+ICDCoCAjZGVmaW5lIERSTV9GT1JN
QVRfTlY0MsKgwqDCoMKgwqDCoMKgIGZvdXJjY19jb2RlKCdOJywgJ1YnLCAnNCcsICcyJykgLyog
bm9uLXN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KPj4+PiAgwqAgwqAgLyoKPj4+PiArICogMiBw
bGFuZSBZQ2JDciAxMGJpdAo+Pj4+ICsgKiBpbmRleCAwID0gWSBwbGFuZSwgWzk6MF0gWQo+Pj4+
ICsgKiBpbmRleCAxID0gQ3I6Q2IgcGxhbmUsIFsxOTowXQo+Pj4+ICsgKiBvcgo+Pj4+ICsgKiBp
bmRleCAxID0gQ2I6Q3IgcGxhbmUsIFsxOTowXQo+Pj4+ICsgKi8KPj4+PiArI2RlZmluZSBEUk1f
Rk9STUFUX05WMTJfMTDCoMKgwqAgZm91cmNjX2NvZGUoJ04nLCAnQScsICcxJywgJzInKSAvKiAy
eDIgc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+Pj4+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYy
MV8xMMKgwqDCoCBmb3VyY2NfY29kZSgnTicsICdBJywgJzInLCAnMScpIC8qIDJ4MiBzdWJzYW1w
bGVkIENiOkNyIHBsYW5lICovCj4+Pj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjE2XzEwwqDCoMKg
IGZvdXJjY19jb2RlKCdOJywgJ0EnLCAnMScsICc2JykgLyogMngxIHN1YnNhbXBsZWQgQ3I6Q2Ig
cGxhbmUgKi8KPj4+PiArI2RlZmluZSBEUk1fRk9STUFUX05WNjFfMTDCoMKgwqAgZm91cmNjX2Nv
ZGUoJ04nLCAnQScsICc2JywgJzEnKSAvKiAyeDEgc3Vic2FtcGxlZCBDYjpDciBwbGFuZSAqLwo+
Pj4+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyNF8xMMKgwqDCoCBmb3VyY2NfY29kZSgnTicsICdB
JywgJzInLCAnNCcpIC8qIG5vbi1zdWJzYW1wbGVkIENyOkNiIHBsYW5lICovCj4+Pj4gKyNkZWZp
bmUgRFJNX0ZPUk1BVF9OVjQyXzEwwqDCoMKgIGZvdXJjY19jb2RlKCdOJywgJ0EnLCAnNCcsICcy
JykgLyogbm9uLXN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KPj4+PiArCj4+Pj4gKy8qCj4+Pj4g
IMKgwqAgKiAyIHBsYW5lIFlDYkNyIE1TQiBhbGlnbmVkCj4+Pj4gIMKgwqAgKiBpbmRleCAwID0g
WSBwbGFuZSwgWzE1OjBdIFk6eCBbMTA6Nl0gbGl0dGxlIGVuZGlhbgo+Pj4+ICDCoMKgICogaW5k
ZXggMSA9IENyOkNiIHBsYW5lLCBbMzE6MF0gQ3I6eDpDYjp4IFsxMDo2OjEwOjZdIGxpdHRsZSBl
bmRpYW4KPj4+IFdoYXQgYXJlIHRoZSBvdGhlciBiaXRzLCB0aGV5IGFyZSBub3QgbWVudGlvbmVk
Pwo+PiBJdCdzIGNvbXBhY3QgbGF5b3V0Cj4+Cj4+IFlwbGFuZToKPj4KPj4gIMKgwqDCoCBZMFs5
OjBdWTFbOTowXVkyWzk6MF1ZM1s5OjBdLi4uCj4+Cj4+IFVWcGxhbmU6Cj4+Cj4+ICDCoMKgwqAg
VTBbOTowXVYwWzk6MF1VMVs5OjBdVjFbOTowXS4uLgo+IFRoaXMgc2hvdWxkIGJlIHB1dCBpbiB0
aGUgY29tbWVudCB0aGVuLCBmb3IgY2xhcml0eS4gOikgUHJvYmFibHkgbmVlZHMgNCBwaXhlbHMg
dG8gZGVzY3JpYmUgaG93IGl0IGZpdHMgaW4gNSAob3IgMTAgZm9yIGNiY3IpIGJ5dGVzLgo+Cj4g
Q2hlZXJzLAo+Cj4gTWFhcnRlbgpPSywgSSB3aWxsIGFkZCB0aGlzIGRlc2NyaWJlIGF0IG5leHQg
dmVyc2lvbi4KPgo+Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
