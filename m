Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1167AA020D0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 09:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9632A10E5B4;
	Mon,  6 Jan 2025 08:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="GMvFORso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7322410E5B4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 08:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=nyv3VoXL/anyyXPrEY7N6oc7RABwdtagq+YvuDaiDFk=; b=G
 MvFORsogPg0TndKi1/CUuQObw9XbfGAyL9pwnMG95tnWIMZFRVJ+tRHsoth+Yugs
 rfSg9RmiSZzfLP+8RdNGptdmIhqYZFHCBIEjQa4Sw4wqP2opiEe/rcLTL4T4GCCR
 Cz152N7n541eGpE2vx5ks7HX4IfIkm5PRJmICpQdW0=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-127 (Coremail) ; Mon, 6 Jan 2025 16:35:26 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Mon, 6 Jan 2025 16:35:26 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, mripard@kernel.org, 
 hjc@rock-chips.com, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH 1/3] drm/rockchip: dw_hdmi_qp: Add platform ctrl
 callback
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <2175680.OBFZWjSADL@diego>
References: <20241225103741.364597-1-andyshrk@163.com>
 <20241225103741.364597-2-andyshrk@163.com> <2175680.OBFZWjSADL@diego>
X-NTES-SC: AL_Qu2YBP2evU0p4CGfYOkfmkcVgOw9UcO5v/Qk3oZXOJF8jA/p6xkmTEJSJHT08860Ox+OmgmGeyZR1f9lbItUQKMqbKaIm/aA+NQIZvZd4hL8xA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2f23fa41.82d9.1943ac12d62.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: fygvCgBHzybOlXtnQnxRAA--.10876W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqB3MXmd7ju-CowABs6
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

CkhpIEhlaWtvLAoKQXQgMjAyNS0wMS0wMiAxOTo1MTo1OCwgIkhlaWtvIFN0w7xibmVyIiA8aGVp
a29Ac250ZWNoLmRlPiB3cm90ZToKPkhpIEFuZHksCj4KPkFtIE1pdHR3b2NoLCAyNS4gRGV6ZW1i
ZXIgMjAyNCwgMTE6Mzc6MjkgQ0VUIHNjaHJpZWIgQW5keSBZYW46Cj4+IEZyb206IEFuZHkgWWFu
IDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPj4gCj4+IFRoZXJlIGFyZSBzb21lIGNvbnRyb2wg
Yml0cyBmb3IgSU8gYW5kIGludGVycnVwdHMgc3RhdHVzIHNjYXR0ZXJlZAo+PiBhY3Jvc3MgZGlm
ZmVyZW50IEdSRiBvbiBkaWZmZXJ0IFNPQy4KPj4gQWRkIHBsYXRmb3JtIGNhbGxiYWNrIGZvciB0
aGlzIElPIHNldHRpbmcgYW5kIGludGVycnVwdHMgc3RhdHVzCj4+IGhhbmRsaW5nLgo+PiAKPj4g
U2lnbmVkLW9mZi1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiAKPj4g
LS0tCj4+IAo+PiAgLi4uL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaV9xcC1yb2NrY2hpcC5jICAg
IHwgODEgKysrKysrKysrKysrLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDU0IGluc2VydGlv
bnMoKyksIDI3IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9kd19oZG1pX3FwLXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvZHdfaGRtaV9xcC1yb2NrY2hpcC5jCj4+IGluZGV4IGMzNmZjMTMwYjczNC4uYjIxZTg2OGU3
YzE2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaV9xcC1y
b2NrY2hpcC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pX3FwLXJv
Y2tjaGlwLmMKPj4gQEAgLTYyLDYgKzYyLDEyIEBAIHN0cnVjdCByb2NrY2hpcF9oZG1pX3FwIHsK
Pj4gIAlpbnQgcG9ydF9pZDsKPj4gIH07Cj4+ICAKPj4gK3N0cnVjdCByb2NrY2hpcF9oZG1pX3Fw
X2N0cmxfb3BzIHsKPj4gKwl2b2lkICgqaW9faW5pdCkoc3RydWN0IHJvY2tjaGlwX2hkbWlfcXAg
KmhkbWkpOwo+PiArCWlycXJldHVybl90ICgqaXJxX2NhbGxiYWNrKShpbnQgaXJxLCB2b2lkICpk
ZXZfaWQpOwo+PiArCWlycXJldHVybl90ICgqaGFyZGlycV9jYWxsYmFjaykoaW50IGlycSwgdm9p
ZCAqZGV2X2lkKTsKPj4gK307Cj4+ICsKPj4gIHN0YXRpYyBzdHJ1Y3Qgcm9ja2NoaXBfaGRtaV9x
cCAqdG9fcm9ja2NoaXBfaGRtaV9xcChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCj4+ICB7
Cj4+ICAJc3RydWN0IHJvY2tjaGlwX2VuY29kZXIgKnJrZW5jb2RlciA9IHRvX3JvY2tjaGlwX2Vu
Y29kZXIoZW5jb2Rlcik7Cj4+IEBAIC0yMjYsOSArMjMyLDQ3IEBAIHN0YXRpYyBpcnFyZXR1cm5f
dCBkd19oZG1pX3FwX3JrMzU4OF9pcnEoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+PiAgCXJldHVy
biBJUlFfSEFORExFRDsKPj4gIH0KPj4gIAo+PiArc3RhdGljIHZvaWQgZHdfaGRtaV9xcF9yazM1
ODhfaW9faW5pdChzdHJ1Y3Qgcm9ja2NoaXBfaGRtaV9xcCAqaGRtaSkKPj4gK3sKPj4gKwl1MzIg
dmFsOwo+PiArCj4+ICsJdmFsID0gSElXT1JEX1VQREFURShSSzM1ODhfU0NMSU5fTUFTSywgUksz
NTg4X1NDTElOX01BU0spIHwKPj4gKwkgICAgICBISVdPUkRfVVBEQVRFKFJLMzU4OF9TREFJTl9N
QVNLLCBSSzM1ODhfU0RBSU5fTUFTSykgfAo+PiArCSAgICAgIEhJV09SRF9VUERBVEUoUkszNTg4
X01PREVfTUFTSywgUkszNTg4X01PREVfTUFTSykgfAo+PiArCSAgICAgIEhJV09SRF9VUERBVEUo
UkszNTg4X0kyU19TRUxfTUFTSywgUkszNTg4X0kyU19TRUxfTUFTSyk7Cj4+ICsKPgo+bml0OiBi
ZWxvdyB2YWwgPSAuLi4gYW5kIHJlZ21hcF93cml0ZSBkb24ndCBoYXZlIGEgYmxhbmsgbGluZSBi
ZXR3ZWVuIHRoZW0KPndoaWNoIG1ha2VzIHNlbnNlIHRvIHNob3cgdGhhdCB0aGV5IGJlbG9uZyB0
b2dldGhlci4gU28gdGhlIGJsYW5rIGFib3ZlCj5jYW4gcHJvYmFibHkgYWxzbyBnbyBhd2F5LgoK
T2theSwgaXQgd2lsbCBiZSByZW1vdmVkIGluIFYyLgo+Cj4+ICsJcmVnbWFwX3dyaXRlKGhkbWkt
PnZvX3JlZ21hcCwKPj4gKwkJICAgICBoZG1pLT5wb3J0X2lkID8gUkszNTg4X0dSRl9WTzFfQ09O
NiA6IFJLMzU4OF9HUkZfVk8xX0NPTjMsCj4+ICsJCSAgICAgdmFsKTsKPj4gKwo+PiArCXZhbCA9
IEhJV09SRF9VUERBVEUoUkszNTg4X1NFVF9IUERfUEFUSF9NQVNLLCBSSzM1ODhfU0VUX0hQRF9Q
QVRIX01BU0spOwo+PiArCXJlZ21hcF93cml0ZShoZG1pLT5yZWdtYXAsIFJLMzU4OF9HUkZfU09D
X0NPTjcsIHZhbCk7Cj4+ICsKPj4gKwlpZiAoaGRtaS0+cG9ydF9pZCkKPj4gKwkJdmFsID0gSElX
T1JEX1VQREFURShSSzM1ODhfSERNSTFfR1JBTlRfU0VMLAo+PiArCQkJCVJLMzU4OF9IRE1JMV9H
UkFOVF9TRUwpOwo+PiArCWVsc2UKPj4gKwkJdmFsID0gSElXT1JEX1VQREFURShSSzM1ODhfSERN
STBfR1JBTlRfU0VMLAo+PiArCQkJCVJLMzU4OF9IRE1JMF9HUkFOVF9TRUwpOwo+PiArCXJlZ21h
cF93cml0ZShoZG1pLT52b19yZWdtYXAsIFJLMzU4OF9HUkZfVk8xX0NPTjksIHZhbCk7Cj4+ICsK
Pj4gKwlpZiAoaGRtaS0+cG9ydF9pZCkKPj4gKwkJdmFsID0gSElXT1JEX1VQREFURShSSzM1ODhf
SERNSTFfSFBEX0lOVF9NU0ssIFJLMzU4OF9IRE1JMV9IUERfSU5UX01TSyk7Cj4+ICsJZWxzZQo+
PiArCQl2YWwgPSBISVdPUkRfVVBEQVRFKFJLMzU4OF9IRE1JMF9IUERfSU5UX01TSywgUkszNTg4
X0hETUkwX0hQRF9JTlRfTVNLKTsKPj4gKwlyZWdtYXBfd3JpdGUoaGRtaS0+cmVnbWFwLCBSSzM1
ODhfR1JGX1NPQ19DT04yLCB2YWwpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IHJvY2tjaGlwX2hkbWlfcXBfY3RybF9vcHMgcmszNTg4X2hkbWlfY3RybF9vcHMgPSB7Cj4+ICsJ
LmlvX2luaXQJCT0gZHdfaGRtaV9xcF9yazM1ODhfaW9faW5pdCwKPj4gKwkuaXJxX2NhbGxiYWNr
CSAgICAgICAgPSBkd19oZG1pX3FwX3JrMzU4OF9pcnEsCj4+ICsJLmhhcmRpcnFfY2FsbGJhY2sJ
PSBkd19oZG1pX3FwX3JrMzU4OF9oYXJkaXJxLAo+PiArfTsKPj4gKwo+PiAgc3RydWN0IHJvY2tj
aGlwX2hkbWlfcXBfY2ZnIHsKPj4gIAl1bnNpZ25lZCBpbnQgbnVtX3BvcnRzOwo+PiAgCXVuc2ln
bmVkIGludCBwb3J0X2lkc1tNQVhfSERNSV9QT1JUX05VTV07Cj4+ICsJY29uc3Qgc3RydWN0IHJv
Y2tjaGlwX2hkbWlfcXBfY3RybF9vcHMgKmN0cmxfb3BzOwo+PiAgCWNvbnN0IHN0cnVjdCBkd19o
ZG1pX3FwX3BoeV9vcHMgKnBoeV9vcHM7Cj4+ICB9Owo+PiAgCj4+IEBAIC0yMzgsNiArMjgyLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCByb2NrY2hpcF9oZG1pX3FwX2NmZyByazM1ODhfaGRtaV9j
ZmcgPSB7Cj4+ICAJCTB4ZmRlODAwMDAsCj4+ICAJCTB4ZmRlYTAwMDAsCj4+ICAJfSwKPj4gKwku
Y3RybF9vcHMgPSAmcmszNTg4X2hkbWlfY3RybF9vcHMsCj4+ICAJLnBoeV9vcHMgPSAmcmszNTg4
X2hkbWlfcGh5X29wcywKPj4gIH07Cj4+ICAKPj4gQEAgLTI4Miw2ICszMjcsMTIgQEAgc3RhdGlj
IGludCBkd19oZG1pX3FwX3JvY2tjaGlwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
ZGV2aWNlICptYXN0ZXIsCj4+ICAJaWYgKCFjZmcpCj4+ICAJCXJldHVybiAtRU5PREVWOwo+PiAg
Cj4+ICsJaWYgKCFjZmctPmN0cmxfb3BzIHx8ICFjZmctPmN0cmxfb3BzLT5pb19pbml0IHx8Cj4+
ICsJICAgICFjZmctPmN0cmxfb3BzLT5pcnFfY2FsbGJhY2sgfHwgIWNmZy0+Y3RybF9vcHMtPmly
cV9jYWxsYmFjaykgewo+Cj5jZmctPmN0cmxfb3BzLT5pcnFfY2FsbGJhY2sgaXMgY2hlY2tlZCB0
d2ljZSwgSSBndWVzcyBvbmUgb2YgdGhlbQo+c2hvdWxkJ3ZlIGJlZW4gY3RybF9vcHMtPmhhcmRp
cnFfY2FsbGJhY2s/CgpZZXPvvIxUaGFuayB5b3UgZm9yIGNhdGNoaW5nIGl044CCCj4KPlBhdGNo
IGxvb2tzIGdvb2Qgb3RoZXJ3aXNlLgo+Cj5UaGFua3MKPkhlaWtvCj4KPgo+Cg==
