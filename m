Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED5DBB4D4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598016E8F3;
	Mon, 23 Sep 2019 13:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356FC6E8F0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:05:29 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.76])
 by regular1.263xmail.com (Postfix) with ESMTP id 774492D6;
 Mon, 23 Sep 2019 21:05:26 +0800 (CST)
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
 P32760T140634052613888S1569243921745443_; 
 Mon, 23 Sep 2019 21:05:24 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0b6fdb288fe78861d4a4f870d3f2f563>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: linux-kernel@vger.kernel.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: [PATCH 01/36] drm/fourcc: Add 2 plane YCbCr 10bit format support
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <1569242365-182133-1-git-send-email-hjc@rock-chips.com>
 <1569242365-182133-2-git-send-email-hjc@rock-chips.com>
 <20190923125314.GJ1208@intel.com>
From: "sandy.huang" <hjc@rock-chips.com>
Message-ID: <82664d48-36de-15fd-3b30-a12907e5bfcd@rock-chips.com>
Date: Mon, 23 Sep 2019 06:05:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923125314.GJ1208@intel.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CuWcqCAyMDE5LzkvMjMg5LiK5Y2INTo1MywgVmlsbGUgU3lyasOkbMOkIOWGmemBkzoKPiBPbiBN
b24sIFNlcCAyMywgMjAxOSBhdCAwODozODo1MFBNICswODAwLCBTYW5keSBIdWFuZyB3cm90ZToK
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91
YXBpL2RybS9kcm1fZm91cmNjLmgKPj4gaW5kZXggM2ZlZWFhMy4uNWZlODllOSAxMDA2NDQKPj4g
LS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPj4gKysrIGIvaW5jbHVkZS91YXBp
L2RybS9kcm1fZm91cmNjLmgKPj4gQEAgLTI2Niw2ICsyNjYsMjEgQEAgZXh0ZXJuICJDIiB7Cj4+
ICAgI2RlZmluZSBEUk1fRk9STUFUX1AwMTYJCWZvdXJjY19jb2RlKCdQJywgJzAnLCAnMScsICc2
JykgLyogMngyIHN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgMTYgYml0cyBwZXIgY2hhbm5lbCAqLwo+
PiAgIAo+PiAgIC8qCj4+ICsgKiAyIHBsYW5lIFlDYkNyIDEwYml0Cj4+ICsgKiBpbmRleCAwID0g
WSBwbGFuZSwgWzk6MF0gWQo+PiArICogaW5kZXggMSA9IENyOkNiIHBsYW5lLCBbMTk6MF0gQ3I6
Q2IgbGl0dGxlIGVuZGlhbgo+PiArICogb3IKPj4gKyAqIGluZGV4IDEgPSBDYjpDciBwbGFuZSwg
WzE5OjBdIENiOkNyIGxpdHRsZSBlbmRpYW4KPiBXaGF0IGRvZXMgImxpdHRsZSBlbmRpYW4iIGV2
ZW4gbWVhbiBmb3IgdGhlc2U/CgpJdCdzIEluaGVyaXRlZCBmcm9tIHRoZSBmb2xsb3dpbmcgZGVm
aW5lLCB0aGUgZGlmZmVyZW5jZSBpcyA4Yml0IGFuZCAxMGJpdC4KCi8qCiDCoCogMiBwbGFuZSBZ
Q2JDcgogwqAqIGluZGV4IDAgPSBZIHBsYW5lLCBbNzowXSBZCiDCoCogaW5kZXggMSA9IENyOkNi
IHBsYW5lLCBbMTU6MF0gQ3I6Q2IgbGl0dGxlIGVuZGlhbgogwqAqIG9yCiDCoCogaW5kZXggMSA9
IENiOkNyIHBsYW5lLCBbMTU6MF0gQ2I6Q3IgbGl0dGxlIGVuZGlhbgogwqAqLwojZGVmaW5lIERS
TV9GT1JNQVRfTlYxMsKgwqDCoCDCoMKgwqAgZm91cmNjX2NvZGUoJ04nLCAnVicsICcxJywgJzIn
KSAvKiAyeDIgCnN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8KI2RlZmluZSBEUk1fRk9STUFUX05W
MjHCoMKgwqAgwqDCoMKgIGZvdXJjY19jb2RlKCdOJywgJ1YnLCAnMicsICcxJykgLyogMngyIApz
dWJzYW1wbGVkIENiOkNyIHBsYW5lICovCiNkZWZpbmUgRFJNX0ZPUk1BVF9OVjE2wqDCoMKgIMKg
wqDCoCBmb3VyY2NfY29kZSgnTicsICdWJywgJzEnLCAnNicpIC8qIDJ4MSAKc3Vic2FtcGxlZCBD
cjpDYiBwbGFuZSAqLwojZGVmaW5lIERSTV9GT1JNQVRfTlY2McKgwqDCoCDCoMKgwqAgZm91cmNj
X2NvZGUoJ04nLCAnVicsICc2JywgJzEnKSAvKiAyeDEgCnN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUg
Ki8KI2RlZmluZSBEUk1fRk9STUFUX05WMjTCoMKgwqAgwqDCoMKgIGZvdXJjY19jb2RlKCdOJywg
J1YnLCAnMicsICc0JykgLyogCm5vbi1zdWJzYW1wbGVkIENyOkNiIHBsYW5lICovCiNkZWZpbmUg
RFJNX0ZPUk1BVF9OVjQywqDCoMKgIMKgwqDCoCBmb3VyY2NfY29kZSgnTicsICdWJywgJzQnLAoK
Cj4KPj4gKyAqLwo+PiArCj4+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYxMl8xMAlmb3VyY2NfY29k
ZSgnTicsICdBJywgJzEnLCAnMicpIC8qIDJ4MiBzdWJzYW1wbGVkIENyOkNiIHBsYW5lICovCj4+
ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyMV8xMAlmb3VyY2NfY29kZSgnTicsICdBJywgJzInLCAn
MScpIC8qIDJ4MiBzdWJzYW1wbGVkIENiOkNyIHBsYW5lICovCj4+ICsjZGVmaW5lIERSTV9GT1JN
QVRfTlYxNl8xMAlmb3VyY2NfY29kZSgnTicsICdBJywgJzEnLCAnNicpIC8qIDJ4MSBzdWJzYW1w
bGVkIENyOkNiIHBsYW5lICovCj4+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlY2MV8xMAlmb3VyY2Nf
Y29kZSgnTicsICdBJywgJzYnLCAnMScpIC8qIDJ4MSBzdWJzYW1wbGVkIENiOkNyIHBsYW5lICov
Cj4+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyNF8xMAlmb3VyY2NfY29kZSgnTicsICdBJywgJzIn
LCAnNCcpIC8qIG5vbi1zdWJzYW1wbGVkIENyOkNiIHBsYW5lICovCj4+ICsjZGVmaW5lIERSTV9G
T1JNQVRfTlY0Ml8xMAlmb3VyY2NfY29kZSgnTicsICdBJywgJzQnLCAnMicpIC8qIG5vbi1zdWJz
YW1wbGVkIENiOkNyIHBsYW5lICovCj4+ICsKPj4gKy8qCj4+ICAgICogMyBwbGFuZSBZQ2JDcgo+
PiAgICAqIGluZGV4IDA6IFkgcGxhbmUsIFs3OjBdIFkKPj4gICAgKiBpbmRleCAxOiBDYiBwbGFu
ZSwgWzc6MF0gQ2IKPj4gLS0gCj4+IDIuNy40Cj4+Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
