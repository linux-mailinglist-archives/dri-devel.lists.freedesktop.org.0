Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 668D9BED67
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2D36EC20;
	Thu, 26 Sep 2019 08:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FE26EC20
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:30:22 +0000 (UTC)
Received: from localhost (unknown [192.168.167.130])
 by regular1.263xmail.com (Postfix) with ESMTP id DE672393;
 Thu, 26 Sep 2019 16:30:14 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.10.69] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P18367T139820068222720S1569486611945312_; 
 Thu, 26 Sep 2019 16:30:13 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <cb900f1e39dd0f903650b7b2dd7d8341>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: linux-kernel@vger.kernel.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: [PATCH 1/3] drm: Add some new format DRM_FORMAT_NVXX_10
To: Daniel Vetter <daniel@ffwll.ch>
References: <1569398801-92201-1-git-send-email-hjc@rock-chips.com>
 <1569398801-92201-2-git-send-email-hjc@rock-chips.com>
 <CAKMK7uFn7JqqjQPwuEA=SvoCQ5GxB148ZA3zKSTuj7Gareu7Tw@mail.gmail.com>
From: "sandy.huang" <hjc@rock-chips.com>
Message-ID: <48b7491e-5e32-bfe6-c9a3-6024f6e50b1a@rock-chips.com>
Date: Thu, 26 Sep 2019 16:30:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFn7JqqjQPwuEA=SvoCQ5GxB148ZA3zKSTuj7Gareu7Tw@mail.gmail.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Ayan Kumar Halder <Ayan.Halder@arm.com>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CuWcqCAyMDE5LzkvMjUg5LiL5Y2INzoyMCwgRGFuaWVsIFZldHRlciDlhpnpgZM6Cj4gT24gV2Vk
LCBTZXAgMjUsIDIwMTkgYXQgMTA6MDcgQU0gU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNv
bT4gd3JvdGU6Cj4+IFRoZXNlIG5ldyBmb3JtYXQgaXMgc3VwcG9ydGVkIGJ5IHNvbWUgcm9ja2No
aXAgc29jczoKPj4KPj4gRFJNX0ZPUk1BVF9OVjEyXzEwL0RSTV9GT1JNQVRfTlYyMV8xMAo+PiBE
Uk1fRk9STUFUX05WMTZfMTAvRFJNX0ZPUk1BVF9OVjYxXzEwCj4+IERSTV9GT1JNQVRfTlYyNF8x
MC9EUk1fRk9STUFUX05WNDJfMTAKPj4KPj4gU2lnbmVkLW9mZi1ieTogU2FuZHkgSHVhbmcgPGhq
Y0Byb2NrLWNoaXBzLmNvbT4KPiBBZ2FpbiwgcGxlYXNlIHVzZSB0aGUgYmxvY2sgZm9ybWF0cyB0
byBkZXNjcmliZSB0aGVzZSwgcGx1cyBwcm9wZXIKPiBjb21tZW50cyBhcyBNYWFydGVuIGFsc28g
YXNrZWQgZm9yLgo+IC1EYW5pZWwKCkhpIERhbmllbCBhbmQgTWFhcnRlbiwKCiDCoMKgwqAgVGhl
IG5ldyB2MiBwYXRjaGVzIGhhdmUgdXBkYXRlIHRvIGJsb2NrIGZvcm1hdHMsIHBsZWFzZSBoZWxw
IHRvIApyZXZpZXcsIHRoYW5rcy4KCj4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9m
b3VyY2MuYyAgfCAxOCArKysrKysrKysrKysrKysrKysKPj4gICBpbmNsdWRlL3VhcGkvZHJtL2Ry
bV9mb3VyY2MuaCB8IDE0ICsrKysrKysrKysrKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBp
bnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJj
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYwo+PiBpbmRleCBjNjMwMDY0Li5mMjVm
YTgxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKPj4gQEAgLTI3NCw2ICsyNzQsMjQgQEAgY29u
c3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqX19kcm1fZm9ybWF0X2luZm8odTMyIGZvcm1hdCkK
Pj4gICAgICAgICAgICAgICAgICB7IC5mb3JtYXQgPSBEUk1fRk9STUFUX1lVVjQyMF8xMEJJVCwg
ICAgLmRlcHRoID0gMCwKPj4gICAgICAgICAgICAgICAgICAgIC5udW1fcGxhbmVzID0gMSwgLmNw
cCA9IHsgMCwgMCwgMCB9LCAuaHN1YiA9IDIsIC52c3ViID0gMiwKPj4gICAgICAgICAgICAgICAg
ICAgIC5pc195dXYgPSB0cnVlIH0sCj4+ICsgICAgICAgICAgICAgICB7IC5mb3JtYXQgPSBEUk1f
Rk9STUFUX05WMTJfMTAsICAgICAgICAgLmRlcHRoID0gMCwKPj4gKyAgICAgICAgICAgICAgICAg
Lm51bV9wbGFuZXMgPSAyLCAuY3BwID0geyAwLCAwLCAwIH0sIC5oc3ViID0gMiwgLnZzdWIgPSAy
LAo+PiArICAgICAgICAgICAgICAgICAuaXNfeXV2ID0gdHJ1ZSB9LAo+PiArICAgICAgICAgICAg
ICAgeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjIxXzEwLCAgICAgICAgIC5kZXB0aCA9IDAsCj4+
ICsgICAgICAgICAgICAgICAgIC5udW1fcGxhbmVzID0gMiwgLmNwcCA9IHsgMCwgMCwgMCB9LCAu
aHN1YiA9IDIsIC52c3ViID0gMiwKPj4gKyAgICAgICAgICAgICAgICAgLmlzX3l1diA9IHRydWUg
fSwKPj4gKyAgICAgICAgICAgICAgIHsgLmZvcm1hdCA9IERSTV9GT1JNQVRfTlYxNl8xMCwgICAg
ICAgICAuZGVwdGggPSAwLAo+PiArICAgICAgICAgICAgICAgICAubnVtX3BsYW5lcyA9IDIsIC5j
cHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAyLCAudnN1YiA9IDEsCj4+ICsgICAgICAgICAgICAg
ICAgIC5pc195dXYgPSB0cnVlIH0sCj4+ICsgICAgICAgICAgICAgICB7IC5mb3JtYXQgPSBEUk1f
Rk9STUFUX05WNjFfMTAsICAgICAgICAgLmRlcHRoID0gMCwKPj4gKyAgICAgICAgICAgICAgICAg
Lm51bV9wbGFuZXMgPSAyLCAuY3BwID0geyAwLCAwLCAwIH0sIC5oc3ViID0gMiwgLnZzdWIgPSAx
LAo+PiArICAgICAgICAgICAgICAgICAuaXNfeXV2ID0gdHJ1ZSB9LAo+PiArICAgICAgICAgICAg
ICAgeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9OVjI0XzEwLCAgICAgICAgIC5kZXB0aCA9IDAsCj4+
ICsgICAgICAgICAgICAgICAgIC5udW1fcGxhbmVzID0gMiwgLmNwcCA9IHsgMCwgMCwgMCB9LCAu
aHN1YiA9IDEsIC52c3ViID0gMSwKPj4gKyAgICAgICAgICAgICAgICAgLmlzX3l1diA9IHRydWUg
fSwKPj4gKyAgICAgICAgICAgICAgIHsgLmZvcm1hdCA9IERSTV9GT1JNQVRfTlY0Ml8xMCwgICAg
ICAgICAuZGVwdGggPSAwLAo+PiArICAgICAgICAgICAgICAgICAubnVtX3BsYW5lcyA9IDIsIC5j
cHAgPSB7IDAsIDAsIDAgfSwgLmhzdWIgPSAxLCAudnN1YiA9IDEsCj4+ICsgICAgICAgICAgICAg
ICAgIC5pc195dXYgPSB0cnVlIH0sCj4+ICAgICAgICAgIH07Cj4+Cj4+ICAgICAgICAgIHVuc2ln
bmVkIGludCBpOwo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgg
Yi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+PiBpbmRleCAzZmVlYWEzLi4wNDc5ZjQ3
IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+PiArKysgYi9p
bmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+PiBAQCAtMjM4LDYgKzIzOCwyMCBAQCBleHRl
cm4gIkMiIHsKPj4gICAjZGVmaW5lIERSTV9GT1JNQVRfTlY0MiAgICAgICAgICAgICAgICBmb3Vy
Y2NfY29kZSgnTicsICdWJywgJzQnLCAnMicpIC8qIG5vbi1zdWJzYW1wbGVkIENiOkNyIHBsYW5l
ICovCj4+Cj4+ICAgLyoKPj4gKyAqIDIgcGxhbmUgWUNiQ3IgMTBiaXQKPj4gKyAqIGluZGV4IDAg
PSBZIHBsYW5lLCBbOTowXSBZCj4+ICsgKiBpbmRleCAxID0gQ3I6Q2IgcGxhbmUsIFsxOTowXQo+
PiArICogb3IKPj4gKyAqIGluZGV4IDEgPSBDYjpDciBwbGFuZSwgWzE5OjBdCj4+ICsgKi8KPj4g
KyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjEyXzEwICAgICBmb3VyY2NfY29kZSgnTicsICdBJywgJzEn
LCAnMicpIC8qIDJ4MiBzdWJzYW1wbGVkIENyOkNiIHBsYW5lICovCj4+ICsjZGVmaW5lIERSTV9G
T1JNQVRfTlYyMV8xMCAgICAgZm91cmNjX2NvZGUoJ04nLCAnQScsICcyJywgJzEnKSAvKiAyeDIg
c3Vic2FtcGxlZCBDYjpDciBwbGFuZSAqLwo+PiArI2RlZmluZSBEUk1fRk9STUFUX05WMTZfMTAg
ICAgIGZvdXJjY19jb2RlKCdOJywgJ0EnLCAnMScsICc2JykgLyogMngxIHN1YnNhbXBsZWQgQ3I6
Q2IgcGxhbmUgKi8KPj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjYxXzEwICAgICBmb3VyY2NfY29k
ZSgnTicsICdBJywgJzYnLCAnMScpIC8qIDJ4MSBzdWJzYW1wbGVkIENiOkNyIHBsYW5lICovCj4+
ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyNF8xMCAgICAgZm91cmNjX2NvZGUoJ04nLCAnQScsICcy
JywgJzQnKSAvKiBub24tc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+PiArI2RlZmluZSBEUk1f
Rk9STUFUX05WNDJfMTAgICAgIGZvdXJjY19jb2RlKCdOJywgJ0EnLCAnNCcsICcyJykgLyogbm9u
LXN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KPj4gKwo+PiArLyoKPj4gICAgKiAyIHBsYW5lIFlD
YkNyIE1TQiBhbGlnbmVkCj4+ICAgICogaW5kZXggMCA9IFkgcGxhbmUsIFsxNTowXSBZOnggWzEw
OjZdIGxpdHRsZSBlbmRpYW4KPj4gICAgKiBpbmRleCAxID0gQ3I6Q2IgcGxhbmUsIFszMTowXSBD
cjp4OkNiOnggWzEwOjY6MTA6Nl0gbGl0dGxlIGVuZGlhbgo+PiAtLQo+PiAyLjcuNAo+Pgo+Pgo+
Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
