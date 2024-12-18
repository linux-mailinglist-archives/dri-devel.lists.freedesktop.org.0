Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB71A9F5C4E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 02:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2473E10E1F3;
	Wed, 18 Dec 2024 01:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="kQBe4Lbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F52F10E1F3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 01:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=r+TsOdjME0z/pu/JkAn2+YD5ubLB/L7wlky5pQ6Uk6c=; b=k
 QBe4LboUG69fgB4KnU29/AFVoQWOtaTbgOwt2Raqpsoth+xT3OMhgaT92nX0vfcg
 VLxIbyMYy4vddnUEoSTOFaVmFcUiXQ0HrCniP8hO/Katl9UphB8zzonM2rlae9NI
 fo47TGUW1a7U+pep2XidUEBl4q649TM935O6Sdx0xg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-123 (Coremail) ; Wed, 18 Dec 2024 09:36:21 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 18 Dec 2024 09:36:21 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: "Maxime Ripard" <mripard@kernel.org>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 "Sandy Huang" <hjc@rock-chips.com>, "Andy Yan" <andy.yan@rock-chips.com>, 
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, 
 "Thomas Zimmermann" <tzimmermann@suse.de>, 
 "David Airlie" <airlied@gmail.com>, 
 "Simona Vetter" <simona@ffwll.ch>, "Rob Herring" <robh@kernel.org>, 
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
 "Conor Dooley" <conor+dt@kernel.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "FUKAUMI Naoki" <naoki@radxa.com>, "Algea Cao" <algea.cao@rock-chips.com>
Subject: Re:Re: [PATCH v2 3/5] drm/rockchip: vop2: Improve display modes
 handling on RK3588 HDMI0
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <2ba24dc6-b6e7-4964-af84-a5374903ce36@collabora.com>
References: <20241211-vop2-hdmi0-disp-modes-v2-0-471cf5001e45@collabora.com>
 <1820767.5KxKD5qtyk@diego>
 <a4ex3s23r4k6wehyoaw3aylpcexfrclrxxykjpabhdfne2jgmu@ii6riiiga2zj>
 <1756448.izSxrag8PF@diego>
 <20241217-ubiquitous-refreshing-finch-aceade@houat>
 <c45ff74a-c9a4-4cf1-8530-04087e06b07a@collabora.com>
 <20241217-zealous-boisterous-llama-52bfcc@houat>
 <2ba24dc6-b6e7-4964-af84-a5374903ce36@collabora.com>
X-NTES-SC: AL_Qu2YBviTuk8j5yicbOkZnEobh+Y5UcK2s/ki2YFXN5k0kSTd/Q0jbG5RIFzK/PmpCAemoQmKVD9t6cdjQpdIUb/nPZvsd3a19Osazdcog6mX
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <8dff095.1555.193d768ad5e.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eygvCgDXv4EVJ2JnbhRCAA--.26583W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hy5XmdiHtiFbAAEsH
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpLAoK5ZyoIDIwMjQtMTItMTggMDA6NTk6NTfvvIwiQ3Jpc3RpYW4gQ2lvY2FsdGVhIiA8Y3Jp
c3RpYW4uY2lvY2FsdGVhQGNvbGxhYm9yYS5jb20+IOWGmemBk++8mgo+T24gMTIvMTcvMjQgNjo1
MyBQTSwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPj4gT24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgMDY6
MzY6NDFQTSArMDIwMCwgQ3Jpc3RpYW4gQ2lvY2FsdGVhIHdyb3RlOgo+Pj4gT24gMTIvMTcvMjQg
NTowMCBQTSwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPj4+PiBPbiBXZWQsIERlYyAxMSwgMjAyNCBh
dCAwNzowMToxNVBNICswMTAwLCBIZWlrbyBTdMO8Ym5lciB3cm90ZToKPj4+Pj4gQW0gTWl0dHdv
Y2gsIDExLiBEZXplbWJlciAyMDI0LCAxODo0Nzo0NCBDRVQgc2NocmllYiBNYXhpbWUgUmlwYXJk
Ogo+Pj4+Pj4gT24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMDY6MjM6MDNQTSArMDEwMCwgSGVpa28g
U3TDvGJuZXIgd3JvdGU6Cj4+Pj4+Pj4gQW0gTWl0dHdvY2gsIDExLiBEZXplbWJlciAyMDI0LCAx
ODowNzo1NyBDRVQgc2NocmllYiBNYXhpbWUgUmlwYXJkOgo+Pj4+Pj4+PiBPbiBXZWQsIERlYyAx
MSwgMjAyNCBhdCAxMjoxNTowN1BNICswMjAwLCBDcmlzdGlhbiBDaW9jYWx0ZWEgd3JvdGU6Cj4+
Pj4+Pj4+PiBUaGUgUkszNTg4IHNwZWNpZmljIGltcGxlbWVudGF0aW9uIGlzIGN1cnJlbnRseSBx
dWl0ZSBsaW1pdGVkIGluIHRlcm1zCj4+Pj4+Pj4+PiBvZiBoYW5kbGluZyB0aGUgZnVsbCByYW5n
ZSBvZiBkaXNwbGF5IG1vZGVzIHN1cHBvcnRlZCBieSB0aGUgY29ubmVjdGVkCj4+Pj4+Pj4+PiBz
Y3JlZW5zLCBlLmcuIDI1NjB4MTQ0MEA3NUh6LCAyMDQ4eDExNTJANjBIeiwgMTAyNHg3NjhANjBI
eiBhcmUganVzdCBhCj4+Pj4+Pj4+PiBmZXcgb2YgdGhlbS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBB
ZGRpdGlvbmFsbHksIGl0IGRvZXNuJ3QgY29wZSB3ZWxsIHdpdGggbm9uLWludGVnZXIgcmVmcmVz
aCByYXRlcyBsaWtlCj4+Pj4+Pj4+PiA1OS45NCwgMjkuOTcsIDIzLjk4LCBldGMuCj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4gTWFrZSB1c2Ugb2YgSERNSTAgUEhZIFBMTCBhcyBhIG1vcmUgYWNjdXJhdGUg
RENMSyBzb3VyY2UgdG8gaGFuZGxlCj4+Pj4+Pj4+PiBhbGwgZGlzcGxheSBtb2RlcyB1cCB0byA0
S0A2MEh6Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRlc3RlZC1ieTogRlVLQVVNSSBOYW9raSA8bmFv
a2lAcmFkeGEuY29tPgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ3Jpc3RpYW4gQ2lvY2FsdGVh
IDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4KPj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+
Pj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwgMzQgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBp
bnNlcnRpb25zKCspCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPj4+Pj4+Pj4+IGluZGV4IDhiMmY1M2ZmZWZkYmYxY2M4
NzM3YjNhODZlNjMwYTAzYTdmZDkzNDguLjM5M2ZlNmFhMTcwYWFlZTk2NjNjNGE2ZDk4YzFjZDZh
NWVmNzkzOTIgMTAwNjQ0Cj4+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
cm9ja2NoaXBfZHJtX3ZvcDIuYwo+Pj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPj4+Pj4+Pj4+IEBAIC0xNTgsNiArMTU4LDcgQEAgc3Ry
dWN0IHZvcDJfdmlkZW9fcG9ydCB7Cj4+Pj4+Pj4+PiAgCXN0cnVjdCBkcm1fY3J0YyBjcnRjOwo+
Pj4+Pj4+Pj4gIAlzdHJ1Y3Qgdm9wMiAqdm9wMjsKPj4+Pj4+Pj4+ICAJc3RydWN0IGNsayAqZGNs
azsKPj4+Pj4+Pj4+ICsJc3RydWN0IGNsayAqZGNsa19zcmM7Cj4+Pj4+Pj4+PiAgCXVuc2lnbmVk
IGludCBpZDsKPj4+Pj4+Pj4+ICAJY29uc3Qgc3RydWN0IHZvcDJfdmlkZW9fcG9ydF9kYXRhICpk
YXRhOwo+Pj4+Pj4+Pj4gIAo+Pj4+Pj4+Pj4gQEAgLTIxMiw2ICsyMTMsNyBAQCBzdHJ1Y3Qgdm9w
MiB7Cj4+Pj4+Pj4+PiAgCXN0cnVjdCBjbGsgKmhjbGs7Cj4+Pj4+Pj4+PiAgCXN0cnVjdCBjbGsg
KmFjbGs7Cj4+Pj4+Pj4+PiAgCXN0cnVjdCBjbGsgKnBjbGs7Cj4+Pj4+Pj4+PiArCXN0cnVjdCBj
bGsgKnBsbF9oZG1pcGh5MDsKPj4+Pj4+Pj4+ICAKPj4+Pj4+Pj4+ICAJLyogb3B0aW9uYWwgaW50
ZXJuYWwgcmdiIGVuY29kZXIgKi8KPj4+Pj4+Pj4+ICAJc3RydWN0IHJvY2tjaGlwX3JnYiAqcmdi
Owo+Pj4+Pj4+Pj4gQEAgLTIyMCw2ICsyMjIsOCBAQCBzdHJ1Y3Qgdm9wMiB7Cj4+Pj4+Pj4+PiAg
CXN0cnVjdCB2b3AyX3dpbiB3aW5bXTsKPj4+Pj4+Pj4+ICB9Owo+Pj4+Pj4+Pj4gIAo+Pj4+Pj4+
Pj4gKyNkZWZpbmUgVk9QMl9NQVhfRENMS19SQVRFCQk2MDAwMDAgLyoga0h6ICovCj4+Pj4+Pj4+
PiArCj4+Pj4+Pj4+PiAgI2RlZmluZSB2b3AyX291dHB1dF9pZl9pc19oZG1pKHgpCSgoeCkgPT0g
Uk9DS0NISVBfVk9QMl9FUF9IRE1JMCB8fCBcCj4+Pj4+Pj4+PiAgCQkJCQkgKHgpID09IFJPQ0tD
SElQX1ZPUDJfRVBfSERNSTEpCj4+Pj4+Pj4+PiAgCj4+Pj4+Pj4+PiBAQCAtMTAzMyw2ICsxMDM3
LDkgQEAgc3RhdGljIHZvaWQgdm9wMl9jcnRjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywKPj4+Pj4+Pj4+ICAKPj4+Pj4+Pj4+ICAJdm9wMl9jcnRjX2Rpc2FibGVfaXJxKHZw
LCBWUF9JTlRfRFNQX0hPTERfVkFMSUQpOwo+Pj4+Pj4+Pj4gIAo+Pj4+Pj4+Pj4gKwlpZiAodnAt
PmRjbGtfc3JjKQo+Pj4+Pj4+Pj4gKwkJY2xrX3NldF9wYXJlbnQodnAtPmRjbGssIHZwLT5kY2xr
X3NyYyk7Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiAgCWNsa19kaXNhYmxlX3VucHJlcGFyZSh2cC0+
ZGNsayk7Cj4+Pj4+Pj4+PiAgCj4+Pj4+Pj4+PiAgCXZvcDItPmVuYWJsZV9jb3VudC0tOwo+Pj4+
Pj4+Pj4gQEAgLTIwNDksNiArMjA1NiwyNyBAQCBzdGF0aWMgdm9pZCB2b3AyX2NydGNfYXRvbWlj
X2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4+Pj4+Pj4+PiAgCj4+Pj4+Pj4+PiAgCXZv
cDJfdnBfd3JpdGUodnAsIFJLMzU2OF9WUF9NSVBJX0NUUkwsIDApOwo+Pj4+Pj4+Pj4gIAo+Pj4+
Pj4+Pj4gKwkvKgo+Pj4+Pj4+Pj4gKwkgKiBTd2l0Y2ggdG8gSERNSSBQSFkgUExMIGFzIERDTEsg
c291cmNlIGZvciBkaXNwbGF5IG1vZGVzIHVwCj4+Pj4+Pj4+PiArCSAqIHRvIDRLQDYwSHosIGlm
IGF2YWlsYWJsZSwgb3RoZXJ3aXNlIGtlZXAgdXNpbmcgdGhlIHN5c3RlbSBDUlUuCj4+Pj4+Pj4+
PiArCSAqLwo+Pj4+Pj4+Pj4gKwlpZiAodm9wMi0+cGxsX2hkbWlwaHkwICYmIG1vZGUtPmNydGNf
Y2xvY2sgPD0gVk9QMl9NQVhfRENMS19SQVRFKSB7Cj4+Pj4+Pj4+PiArCQlkcm1fZm9yX2VhY2hf
ZW5jb2Rlcl9tYXNrKGVuY29kZXIsIGNydGMtPmRldiwgY3J0Y19zdGF0ZS0+ZW5jb2Rlcl9tYXNr
KSB7Cj4+Pj4+Pj4+PiArCQkJc3RydWN0IHJvY2tjaGlwX2VuY29kZXIgKnJrZW5jb2RlciA9IHRv
X3JvY2tjaGlwX2VuY29kZXIoZW5jb2Rlcik7Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArCQkJaWYg
KHJrZW5jb2Rlci0+Y3J0Y19lbmRwb2ludF9pZCA9PSBST0NLQ0hJUF9WT1AyX0VQX0hETUkwKSB7
Cj4+Pj4+Pj4+PiArCQkJCWlmICghdnAtPmRjbGtfc3JjKQo+Pj4+Pj4+Pj4gKwkJCQkJdnAtPmRj
bGtfc3JjID0gY2xrX2dldF9wYXJlbnQodnAtPmRjbGspOwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4g
KwkJCQlyZXQgPSBjbGtfc2V0X3BhcmVudCh2cC0+ZGNsaywgdm9wMi0+cGxsX2hkbWlwaHkwKTsK
Pj4+Pj4+Pj4+ICsJCQkJaWYgKHJldCA8IDApCj4+Pj4+Pj4+PiArCQkJCQlkcm1fd2Fybih2b3Ay
LT5kcm0sCj4+Pj4+Pj4+PiArCQkJCQkJICJDb3VsZCBub3Qgc3dpdGNoIHRvIEhETUkwIFBIWSBQ
TEw6ICVkXG4iLCByZXQpOwo+Pj4+Pj4+Pj4gKwkJCQlicmVhazsKPj4+Pj4+Pj4+ICsJCQl9Cj4+
Pj4+Pj4+PiArCQl9Cj4+Pj4+Pj4+PiArCX0KPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4KPj4+Pj4+Pj4g
SXQgc2VlbXMgcHJldHR5IGZyYWdpbGUgdG8gZG8gaXQgYXQgYXRvbWljX2VuYWJsZSB0aW1lLCBl
dmVuIG1vcmUgc28KPj4+Pj4+Pj4gc2luY2UgeW91IGRvbid0IGxvY2sgdGhlIHBhcmVudCBlaXRo
ZXIuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEFueSByZWFzb24gbm90IHRvIGRvIGl0IGluIHRoZSBEUk0g
b3IgY2xvY2sgZHJpdmVyIHByb2JlLCBhbmQgbWFrZSBzdXJlCj4+Pj4+Pj4+IHlvdSBuZXZlciBj
aGFuZ2UgdGhlIHBhcmVudCBzb21laG93Pwo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gcmszNTg4IHdlIGhh
dmUgMyBkY2xrX3MgYW5kIDIgaGRtaSBjb250cm9sbGVycy4gRWFjaCB2aWRlby1wb3J0IGNhbgo+
Pj4+Pj4+IHVzZSB0aGUgY2xvY2sgZ2VuZXJhdGVkIGZyb20gZWl0aGVyIHRoZSBoZG1pMHBoeSBv
ciBoZG1pMXBoeSwgZGVwZW5kaW5nCj4+Pj4+Pj4gb24gd2hpY2ggaGRtaS1jb250cm9sbGVyIGl0
IHVzZXMuCj4+Pj4+Pj4KPj4+Pj4+PiBTbyB5b3UgYWN0dWFsbHkgbmVlZCB0byBrbm93IHdoaWNo
IHZwWCB3aWxsIG91dHB1dCB0byB3aGljaCBoZG1pWSB0byB0aGVuCj4+Pj4+Pj4gcmVwYXJlbnQg
dGhhdCBkY2xrIHRvIHRoZSBoZG1pcGh5IG91dHB1dC4KPj4+Pj4+Cj4+Pj4+PiBUaGUgUm9ja2No
aXAgbm9tZW5jbGF0dXJlIGlzbid0IHN1cGVyIG9idmlvdXMgdG8gbWUsIHNvcnJ5LiBJcyB0aGVy
ZSBhCj4+Pj4+PiBkYXRhc2hlZXQgZm9yIHRoaXMgc29tZXdoZXJlPyBBbHNvLCBkb2VzIHRoaXMg
dnBYIC0+IEhETUktWSBtYXBwaW5nIG5lZWQKPj4+Pj4+IHRvIGJlIGR5bmFtaWM/Cj4+Pj4+Cj4+
Pj4+IFZQcyBhcmUgQ1JUQ3MgaW4gZHJtLWxhbmd1YWdlIGFuZCBlYWNoIG9mIHRoZW0gY2FuIGRy
aXZlIGEgZGlmZmVyaW5nCj4+Pj4+IG51bWJlciBvZiBvdXRwdXQgZW5jb2RlcnMuIFRob3NlIHZp
ZGVvLXBvcnRzIGFsc28gaGF2ZSBkaWZmZXJpbmcgb3V0cHV0Cj4+Pj4+IGNoYXJhY3RlcmlzdGlj
cyBpbiB0ZXJtcyBvZiBzdXBwb3J0ZWQgcmVzb2x1dGlvbiBhbmQgb3RoZXIgcHJvcGVydGllcy4K
Pj4+Pj4KPj4+Pj4gVGhlIHJrMzU4OCBUUk0gaGFzIGxlYWtlZCBpbiBhIG51bWJlciBvZiBwbGFj
ZXMsIGFuZCBpZiB5b3UgZmluZCBhCj4+Pj4+IFRSTS1wYXJ0MiwgdGhlcmUgaXMgYSBzZWN0aW9u
IGxhYmVsZWQgIkRpc3BsYXkgT3V0cHV0IEludGVyZmFjZSBEZXNjcmlwdGlvbiIKPj4+Pj4gdGhh
dCBoYXMgYSBuaWNlIGdyYXBoaWMgZm9yIHRoYXQuCj4+Pj4+Cj4+Pj4+IE9yIGluIHNob3J0Ogo+
Pj4+PiAtIENSVEMoVlApMCBzdXBwb3J0cyA4SyByZXNvbHV0aW9uIGFuZCBjYW4gZHJpdmUgRFAw
KzEsIEhETUkwKzEsIGVEUDArMQo+Pj4+PiAgIFtpZiBJJ20gcmVhZGluZyB0aGluZ3MgY29ycmVj
dGx5LCA4SyB0b2dldGhlciB3aXRoIENSVEMxIHNvbWVob3cpCj4+Pj4+IC0gQ1JUQyhWUCkxIHN1
cHBvcnRzIDRLIHJlc29sdXRpb24gYW5kIGNhbiBkcml2ZSBEUDArMSwgSERNSTArMSwgZURQMCsx
Cj4+Pj4+IC0gQ1JUQyhWUCkyIHN1cHBvcnRzIDRLIHJlc29sdXRpb24gYW5kIGNhbiBkcml2ZSBE
UDArMSwgSERNSTArMSwgZURQMDEsIERTSTArMQo+Pj4+PiAtIENSVEMoVlApMyBzdXBwb3J0cyAy
SyByZXNvbHV0aW9uIGFuZCBjYW4gZHJpdmUgRFNJMCsxIGFuZCBzb21lIEJUMTEyMCxCVDY1Ngo+
Pj4+Pgo+Pj4+PiBzbyBmb3IgdGhlIDMgaGlnaGVyIHJlc29sdXRpb24gQ1JUQ3MgdGhlcmUgYXJl
IGVzc2VudGlhbGx5IDYgb3IgOCBvdXRwdXQgb3B0aW9ucwo+Pj4+PiBkZXBlbmRpbmcgb24gdGhl
IGJvYXJkIGRlc2lnbgo+Pj4+Cj4+Pj4gVGhhdCdzIG11Y2ggY2xlYXJlciwgdGhhbmtzLiBJJ20g
bm90IGVudGlyZWx5IHN1cmUgaG93IHRoYXQgbGlua3MgdG8gdGhlCj4+Pj4gbmVlZCBmb3IgdGhl
IFBMTCB0byBjaGFuZ2UgaXRzIHBhcmVudCBkZXBlbmRpbmcgb24gdGhlIG91cHV0LiBEbyB5b3UK
Pj4+PiBuZWVkIHRvIGFsd2F5cyBoYXZlIGFsbCB0aGUgb3V0cHV0cyBvbiB0aGUgc2FtZSBQTEw/
Cj4+Pgo+Pj4gT25lIG9mIHRoZSBwcm9ibGVtcyBpcyB0aGF0IHRoZSBQSFkgUExMcyBjYW5ub3Qg
YmUgdXNlZCBhcyBjbG9jayBzb3VyY2VzCj4+PiBmb3IgcmVzb2x1dGlvbnMgYWJvdmUgNEtANjBI
eiwgd2hpbGUgVk9QMiBvbiBSSzM1ODggc3VwcG9ydHMgdXAgdG8gOEtANjBIeiwKPj4+IHdoaWNo
IGlzIHN1cHBvc2VkIHRvIGJlIGhhbmRsZWQgYnkgdGhlIHN5c3RlbSBDUlUuCj4+IAo+PiBCdXQg
Y2FuIHRoYXQgc3lzdGVtIENSVSBkcml2ZSByZXNvbHV0aW9ucyBsb3dlciB0aGFuIDRrQDYwPyBJ
ZiBzbywgd2h5Cj4+IGRvIHdlIGJvdGhlciB3aXRoIFBIWXM/Cj4KPkl0IGNhbiwgYnV0IGl0J3Mg
bm90IGFjY3VyYXRlIGVub3VnaCB0byBzdXBwb3J0IGFsbCBtb2RlcywgZS5nLiB0aG9zZQo+aGF2
aW5nIGZyYWN0aW9uYWwgcmVmcmVzaCByYXRlcywgYW1vbmcgb3RoZXJzLiAgVGhhdCdzIGFjdHVh
bGx5IHRoZQo+cmVhc29uIHdlJ2Qgd2FudCB0byBtYWtlIHVzZSBvZiB0aGUgUEhZIFBMTHMuCgpO
b3Qgb25seSB0aGF0LiBGb3IgcmVzb2x1dGlvbnMgbG93ZXIgdGhhbiA0a0A2MCwgaWYgd2UgdXNl
IHN5c3RlbSBjdXIgYXMgZGNsayBwYXJlbnQsCml0IGNhbid0ICBzeW5jIHdpdGggSERNSSBUTURT
IGNsb2NrICwgdGhpcyBjb3VsZCBsZWFkIHRvIHN0YWJpbGl0eS9jb21wYXRpYmlsaXR5IGkgaXNz
dWVzLAp3aGljaCBtYXkgbm90IGJlIGVhc3kgdG8gZW5jb3VudGVyLCBidXQgd2UgaGF2ZSBpbmRl
ZWQgZXhwZXJpZW5jZWQgdGhlbSAgZmV3IHRpbWVtcwppbiBhIGxhcmdlIGFtb3VudCBvZiBwcm9k
dWN0aXphdGlvbiBwcmFjdGljZS4KCj4KPj4+IE1vcmVvdmVyLCB0aGUgMiBQTExzIGFyZSBzaGFy
ZWQgYmV0d2VlbiAzIG91dCBvZiB0aGUgNCB2aWRlbyBwb3J0cyBhbHJlYWR5Cj4+PiBtZW50aW9u
ZWQgYnkgSGVpa28uICBUaGVyZSBpcyBxdWl0ZSBhIGJpdCBvZiBjb21wbGV4aXR5IGluIGRvd25z
dHJlYW0KPj4+IGRyaXZlciB0byBoYW5kbGUgYWxsIHBvc3NpYmxlIHVzZWNhc2VzIC0gc2VlIFsx
XSBmb3IgYSBicmllZiBkZXNjcmlwdGlvbiBvbgo+Pj4gaG93IHdhcyB0aGF0IGRlc2lnbmVkIHRv
IHdvcmsuCj4+IAo+PiBUaGF0J3MgYSBnZW5lcmljIGFsbG9jYXRpb24gaXNzdWUuIE11bHRpcGxl
IGRyaXZlcnMgKHZjNCBmb3IgZXhhbXBsZSkKPj4gaGFzIHRoaXMgaXNzdWUgZm9yIG90aGVyIGNv
bXBvbmVudHMuIEl0IGNhbiBiZSBmYWlybHkgZWFzaWx5IGRlYWx0IHdpdGgKPj4gYXQgYXRvbWlj
X2NoZWNrIHRpbWUuCj4+IAo+PiBNYXhpbWUKPgo=
