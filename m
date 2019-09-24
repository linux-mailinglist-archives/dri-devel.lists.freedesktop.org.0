Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E96BC200
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 08:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408D96E9FB;
	Tue, 24 Sep 2019 06:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6F66E9FB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 06:47:38 +0000 (UTC)
Received: from hjc?rock-chips.com (unknown [192.168.167.138])
 by regular1.263xmail.com (Postfix) with ESMTP id 2CF5E407;
 Tue, 24 Sep 2019 14:47:36 +0800 (CST)
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
 P3195T140584704931584S1569307653531084_; 
 Tue, 24 Sep 2019 14:47:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <19d5ccf720f8c557e124fe8852f8d744>
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
 <82664d48-36de-15fd-3b30-a12907e5bfcd@rock-chips.com>
 <20190923183049.GR1208@intel.com>
From: "sandy.huang" <hjc@rock-chips.com>
Message-ID: <134414ba-536b-ad8c-8b79-4822bd311ae8@rock-chips.com>
Date: Tue, 24 Sep 2019 14:47:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923183049.GR1208@intel.com>
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

CuWcqCAyMDE5LzkvMjQg5LiK5Y2IMjozMCwgVmlsbGUgU3lyasOkbMOkIOWGmemBkzoKPiBPbiBN
b24sIFNlcCAyMywgMjAxOSBhdCAwNjowNToyMkFNIC0wNzAwLCBzYW5keS5odWFuZyB3cm90ZToK
Pj4g5ZyoIDIwMTkvOS8yMyDkuIrljYg1OjUzLCBWaWxsZSBTeXJqw6Rsw6Qg5YaZ6YGTOgo+Pj4g
T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDg6Mzg6NTBQTSArMDgwMCwgU2FuZHkgSHVhbmcgd3Jv
dGU6Cj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5j
bHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPj4+PiBpbmRleCAzZmVlYWEzLi41ZmU4OWU5IDEw
MDY0NAo+Pj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4+Pj4gKysrIGIv
aW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPj4+PiBAQCAtMjY2LDYgKzI2NiwyMSBAQCBl
eHRlcm4gIkMiIHsKPj4+PiAgICAjZGVmaW5lIERSTV9GT1JNQVRfUDAxNgkJZm91cmNjX2NvZGUo
J1AnLCAnMCcsICcxJywgJzYnKSAvKiAyeDIgc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAxNiBiaXRz
IHBlciBjaGFubmVsICovCj4+Pj4gICAgCj4+Pj4gICAgLyoKPj4+PiArICogMiBwbGFuZSBZQ2JD
ciAxMGJpdAo+Pj4+ICsgKiBpbmRleCAwID0gWSBwbGFuZSwgWzk6MF0gWQo+Pj4+ICsgKiBpbmRl
eCAxID0gQ3I6Q2IgcGxhbmUsIFsxOTowXSBDcjpDYiBsaXR0bGUgZW5kaWFuCj4+Pj4gKyAqIG9y
Cj4+Pj4gKyAqIGluZGV4IDEgPSBDYjpDciBwbGFuZSwgWzE5OjBdIENiOkNyIGxpdHRsZSBlbmRp
YW4KPj4+IFdoYXQgZG9lcyAibGl0dGxlIGVuZGlhbiIgZXZlbiBtZWFuIGZvciB0aGVzZT8KPj4g
SXQncyBJbmhlcml0ZWQgZnJvbSB0aGUgZm9sbG93aW5nIGRlZmluZSwgdGhlIGRpZmZlcmVuY2Ug
aXMgOGJpdCBhbmQgMTBiaXQuCj4+IC8qCj4+ICAgwqAqIDIgcGxhbmUgWUNiQ3IKPj4gICDCoCog
aW5kZXggMCA9IFkgcGxhbmUsIFs3OjBdIFkKPj4gICDCoCogaW5kZXggMSA9IENyOkNiIHBsYW5l
LCBbMTU6MF0gQ3I6Q2IgbGl0dGxlIGVuZGlhbgo+PiAgIMKgKiBvcgo+PiAgIMKgKiBpbmRleCAx
ID0gQ2I6Q3IgcGxhbmUsIFsxNTowXSBDYjpDciBsaXR0bGUgZW5kaWFuCj4+ICAgwqAqLwo+PiAj
ZGVmaW5lIERSTV9GT1JNQVRfTlYxMsKgwqDCoCDCoMKgwqAgZm91cmNjX2NvZGUoJ04nLCAnVics
ICcxJywgJzInKSAvKiAyeDIKPj4gc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+PiAjZGVmaW5l
IERSTV9GT1JNQVRfTlYyMcKgwqDCoCDCoMKgwqAgZm91cmNjX2NvZGUoJ04nLCAnVicsICcyJywg
JzEnKSAvKiAyeDIKPj4gc3Vic2FtcGxlZCBDYjpDciBwbGFuZSAqLwo+PiAjZGVmaW5lIERSTV9G
T1JNQVRfTlYxNsKgwqDCoCDCoMKgwqAgZm91cmNjX2NvZGUoJ04nLCAnVicsICcxJywgJzYnKSAv
KiAyeDEKPj4gc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+PiAjZGVmaW5lIERSTV9GT1JNQVRf
TlY2McKgwqDCoCDCoMKgwqAgZm91cmNjX2NvZGUoJ04nLCAnVicsICc2JywgJzEnKSAvKiAyeDEK
Pj4gc3Vic2FtcGxlZCBDYjpDciBwbGFuZSAqLwo+PiAjZGVmaW5lIERSTV9GT1JNQVRfTlYyNMKg
wqDCoCDCoMKgwqAgZm91cmNjX2NvZGUoJ04nLCAnVicsICcyJywgJzQnKSAvKgo+PiBub24tc3Vi
c2FtcGxlZCBDcjpDYiBwbGFuZSAqLwo+PiAjZGVmaW5lIERSTV9GT1JNQVRfTlY0MsKgwqDCoCDC
oMKgwqAgZm91cmNjX2NvZGUoJ04nLCAnVicsICc0JywKPiBTb21ldGhpbmcgbm90IGFsaWduZWQg
dG8gYnl0ZXMgY2FuJ3QgaGF2ZSBpdHMgZW5kaWFubmVzcyBkZWZpbmVkIHRoZQo+IHNhbWUgd2F5
IGFzIHRoZXNlLiBKdXN0IGRvZXNuJ3QgbWFrZSBzZW5zZS4KCgpHZXQgaXQgLHRoYW5rcy4KCj4+
Cj4+Cj4+Pj4gKyAqLwo+Pj4+ICsKPj4+PiArI2RlZmluZSBEUk1fRk9STUFUX05WMTJfMTAJZm91
cmNjX2NvZGUoJ04nLCAnQScsICcxJywgJzInKSAvKiAyeDIgc3Vic2FtcGxlZCBDcjpDYiBwbGFu
ZSAqLwo+Pj4+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyMV8xMAlmb3VyY2NfY29kZSgnTicsICdB
JywgJzInLCAnMScpIC8qIDJ4MiBzdWJzYW1wbGVkIENiOkNyIHBsYW5lICovCj4+Pj4gKyNkZWZp
bmUgRFJNX0ZPUk1BVF9OVjE2XzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnMScsICc2JykgLyog
MngxIHN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgKi8KPj4+PiArI2RlZmluZSBEUk1fRk9STUFUX05W
NjFfMTAJZm91cmNjX2NvZGUoJ04nLCAnQScsICc2JywgJzEnKSAvKiAyeDEgc3Vic2FtcGxlZCBD
YjpDciBwbGFuZSAqLwo+Pj4+ICsjZGVmaW5lIERSTV9GT1JNQVRfTlYyNF8xMAlmb3VyY2NfY29k
ZSgnTicsICdBJywgJzInLCAnNCcpIC8qIG5vbi1zdWJzYW1wbGVkIENyOkNiIHBsYW5lICovCj4+
Pj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9OVjQyXzEwCWZvdXJjY19jb2RlKCdOJywgJ0EnLCAnNCcs
ICcyJykgLyogbm9uLXN1YnNhbXBsZWQgQ2I6Q3IgcGxhbmUgKi8KPj4+PiArCj4+Pj4gKy8qCj4+
Pj4gICAgICogMyBwbGFuZSBZQ2JDcgo+Pj4+ICAgICAqIGluZGV4IDA6IFkgcGxhbmUsIFs3OjBd
IFkKPj4+PiAgICAgKiBpbmRleCAxOiBDYiBwbGFuZSwgWzc6MF0gQ2IKPj4+PiAtLSAKPj4+PiAy
LjcuNAo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
