Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0CBBD9EB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 10:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A3C6E81C;
	Wed, 25 Sep 2019 08:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AEB6E81C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 08:33:05 +0000 (UTC)
Received: from localhost (unknown [192.168.167.223])
 by regular1.263xmail.com (Postfix) with ESMTP id E900E25A;
 Wed, 25 Sep 2019 16:33:02 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.10.69] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P8268T140247138543360S1569400380603435_; 
 Wed, 25 Sep 2019 16:33:01 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <567e49f44f60ab6af7dc24948813d994>
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
From: "sandy.huang" <hjc@rock-chips.com>
Message-ID: <e0c272ff-5ef9-f5db-4dad-477ecae2e6ca@rock-chips.com>
Date: Wed, 25 Sep 2019 16:32:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8cd915d3-9f61-abdc-7fd1-a9241777f29a@linux.intel.com>
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

CuWcqCAyMDE5LzkvMjUg5LiL5Y2INDoxNywgTWFhcnRlbiBMYW5raG9yc3Qg5YaZ6YGTOgo+IE9w
IDI1LTA5LTIwMTkgb20gMTA6MDYgc2NocmVlZiBTYW5keSBIdWFuZzoKPj4gVGhlc2UgbmV3IGZv
cm1hdCBpcyBzdXBwb3J0ZWQgYnkgc29tZSByb2NrY2hpcCBzb2NzOgo+Pgo+PiBEUk1fRk9STUFU
X05WMTJfMTAvRFJNX0ZPUk1BVF9OVjIxXzEwCj4+IERSTV9GT1JNQVRfTlYxNl8xMC9EUk1fRk9S
TUFUX05WNjFfMTAKPj4gRFJNX0ZPUk1BVF9OVjI0XzEwL0RSTV9GT1JNQVRfTlY0Ml8xMAo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgo+PiAtLS0K
Pj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jICB8IDE4ICsrKysrKysrKysrKysrKysr
Kwo+PiAgIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTQgKysrKysrKysrKysrKysK
Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJj
Yy5jCj4+IGluZGV4IGM2MzAwNjQuLmYyNWZhODEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZm91cmNjLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYwo+
PiBAQCAtMjc0LDYgKzI3NCwyNCBAQCBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpfX2Ry
bV9mb3JtYXRfaW5mbyh1MzIgZm9ybWF0KQo+PiAgIAkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9Z
VVY0MjBfMTBCSVQsICAgIC5kZXB0aCA9IDAsCj4+ICAgCQkgIC5udW1fcGxhbmVzID0gMSwgLmNw
cCA9IHsgMCwgMCwgMCB9LCAuaHN1YiA9IDIsIC52c3ViID0gMiwKPj4gICAJCSAgLmlzX3l1diA9
IHRydWUgfSwKPj4gKwkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjEyXzEwLAkJLmRlcHRoID0g
MCwKPj4gKwkJICAubnVtX3BsYW5lcyA9IDIsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAy
LCAudnN1YiA9IDIsCj4+ICsJCSAgLmlzX3l1diA9IHRydWUgfSwKPj4gKwkJeyAuZm9ybWF0ID0g
RFJNX0ZPUk1BVF9OVjIxXzEwLAkJLmRlcHRoID0gMCwKPj4gKwkJICAubnVtX3BsYW5lcyA9IDIs
IC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAyLCAudnN1YiA9IDIsCj4+ICsJCSAgLmlzX3l1
diA9IHRydWUgfSwKPj4gKwkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjE2XzEwLAkJLmRlcHRo
ID0gMCwKPj4gKwkJICAubnVtX3BsYW5lcyA9IDIsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIg
PSAyLCAudnN1YiA9IDEsCj4+ICsJCSAgLmlzX3l1diA9IHRydWUgfSwKPj4gKwkJeyAuZm9ybWF0
ID0gRFJNX0ZPUk1BVF9OVjYxXzEwLAkJLmRlcHRoID0gMCwKPj4gKwkJICAubnVtX3BsYW5lcyA9
IDIsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAyLCAudnN1YiA9IDEsCj4+ICsJCSAgLmlz
X3l1diA9IHRydWUgfSwKPj4gKwkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjI0XzEwLAkJLmRl
cHRoID0gMCwKPj4gKwkJICAubnVtX3BsYW5lcyA9IDIsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhz
dWIgPSAxLCAudnN1YiA9IDEsCj4+ICsJCSAgLmlzX3l1diA9IHRydWUgfSwKPj4gKwkJeyAuZm9y
bWF0ID0gRFJNX0ZPUk1BVF9OVjQyXzEwLAkJLmRlcHRoID0gMCwKPj4gKwkJICAubnVtX3BsYW5l
cyA9IDIsIC5jcHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAxLCAudnN1YiA9IDEsCj4+ICsJCSAg
LmlzX3l1diA9IHRydWUgfSwKPj4gICAJfTsKPj4gICAKPj4gICAJdW5zaWduZWQgaW50IGk7Cj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCBiL2luY2x1ZGUvdWFw
aS9kcm0vZHJtX2ZvdXJjYy5oCj4+IGluZGV4IDNmZWVhYTMuLjA0NzlmNDcgMTAwNjQ0Cj4+IC0t
LSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4+ICsrKyBiL2luY2x1ZGUvdWFwaS9k
cm0vZHJtX2ZvdXJjYy5oCj4+IEBAIC0yMzgsNiArMjM4LDIwIEBAIGV4dGVybiAiQyIgewo+PiAg
ICNkZWZpbmUgRFJNX0ZPUk1BVF9OVjQyCQlmb3VyY2NfY29kZSgnTicsICdWJywgJzQnLCAnMicp
IC8qIG5vbi1zdWJzYW1wbGVkIENiOkNyIHBsYW5lICovCj4+ICAgCj4+ICAgLyoKPj4gKyAqIDIg
cGxhbmUgWUNiQ3IgMTBiaXQKPj4gKyAqIGluZGV4IDAgPSBZIHBsYW5lLCBbOTowXSBZCj4+ICsg
KiBpbmRleCAxID0gQ3I6Q2IgcGxhbmUsIFsxOTowXQo+PiArICogb3IKPj4gKyAqIGluZGV4IDEg
PSBDYjpDciBwbGFuZSwgWzE5OjBdCj4+ICsgKi8KPj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjEy
XzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnMScsICcyJykgLyogMngyIHN1YnNhbXBsZWQgQ3I6
Q2IgcGxhbmUgKi8KPj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjIxXzEwCWZvdXJjY19jb2RlKCdO
JywgJ0EnLCAnMicsICcxJykgLyogMngyIHN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KPj4gKyNk
ZWZpbmUgRFJNX0ZPUk1BVF9OVjE2XzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnMScsICc2Jykg
LyogMngxIHN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8KPj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9O
VjYxXzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnNicsICcxJykgLyogMngxIHN1YnNhbXBsZWQg
Q2I6Q3IgcGxhbmUgKi8KPj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjI0XzEwCWZvdXJjY19jb2Rl
KCdOJywgJ0EnLCAnMicsICc0JykgLyogbm9uLXN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8KPj4g
KyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjQyXzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnNCcsICcy
JykgLyogbm9uLXN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KPj4gKwo+PiArLyoKPj4gICAgKiAy
IHBsYW5lIFlDYkNyIE1TQiBhbGlnbmVkCj4+ICAgICogaW5kZXggMCA9IFkgcGxhbmUsIFsxNTow
XSBZOnggWzEwOjZdIGxpdHRsZSBlbmRpYW4KPj4gICAgKiBpbmRleCAxID0gQ3I6Q2IgcGxhbmUs
IFszMTowXSBDcjp4OkNiOnggWzEwOjY6MTA6Nl0gbGl0dGxlIGVuZGlhbgo+IFdoYXQgYXJlIHRo
ZSBvdGhlciBiaXRzLCB0aGV5IGFyZSBub3QgbWVudGlvbmVkPwoKSXQncyBjb21wYWN0IGxheW91
dAoKWXBsYW5lOgoKIMKgwqDCoCBZMFs5OjBdWTFbOTowXVkyWzk6MF1ZM1s5OjBdLi4uCgpVVnBs
YW5lOgoKIMKgwqDCoCBVMFs5OjBdVjBbOTowXVUxWzk6MF1WMVs5OjBdLi4uCgoKCj4KPgo+Cj4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
