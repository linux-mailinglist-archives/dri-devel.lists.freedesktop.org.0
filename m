Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3602A19F99
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 09:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486B510E788;
	Thu, 23 Jan 2025 08:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="qVQqZvDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5414B10E788
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 08:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=BXyofrVnYuyYwzI7LGAdKQQArMh8Hu8gMywmqLa91A0=; b=q
 VQqZvDR1/UJdOvpmORbgMSebNXA6d6tzM08WEiXHcHYkv7vXZCnCdjcvQgROPajY
 vOGmjCEaNLw5yecn3zPAZrXLDrP68s/GZSbxhykBTBkSlGwh/P5YlrJQur0TSY2t
 97pIlWyrILQiC0Md/0iCXyIyHqaZ3t3GL6Z7H6pcaw=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-141 (Coremail) ; Thu, 23 Jan 2025 16:10:05 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 23 Jan 2025 16:10:05 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, daniel@fooishbar.org, robh@kernel.org,
 sebastian.reichel@collabora.com, "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v12 12/13] dt-bindings: display: vop2: Add rk3576
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <77ea5067-deb2-41d4-ab82-ce19ac018ba3@kernel.org>
References: <20250121103254.2528004-1-andyshrk@163.com>
 <20250121103500.2528258-1-andyshrk@163.com>
 <20250122-amber-moth-of-upgrade-fa8331@krzk-bin>
 <5eb4acaa.6df6.1948d68332d.Coremail.andyshrk@163.com>
 <77ea5067-deb2-41d4-ab82-ce19ac018ba3@kernel.org>
X-NTES-SC: AL_Qu2YBfqatkAr4yOZZOkfmkcVgOw9UcO5v/Qk3oZXOJF8jCrr+CUnVkFMJFbsweeONhCLrheYTj1O48h1bZN6b5MbTaya5DqRSALoAlPBehXcjA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <11e72cc2.55fd.19492361487.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jSgvCgCnbwNd+ZFnfWZdAA--.20373W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRPdXmeR6wnIewADsd
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

CgpIaSBLcnp5c3p0b2YsCkF0IDIwMjUtMDEtMjIgMTc6NTU6MzQsICJLcnp5c3p0b2YgS296bG93
c2tpIiA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPk9uIDIyLzAxLzIwMjUgMTA6NDYsIEFuZHkg
WWFuIHdyb3RlOgo+Pj4+IC0gICAgICBUaGUgVk9QIGludGVycnVwdCBpcyBzaGFyZWQgYnkgc2V2
ZXJhbCBpbnRlcnJ1cHQgc291cmNlcywgc3VjaCBhcwo+Pj4+IC0gICAgICBmcmFtZSBzdGFydCAo
VlNZTkMpLCBsaW5lIGZsYWcgYW5kIG90aGVyIHN0YXR1cyBpbnRlcnJ1cHRzLgo+Pj4+ICsgICAg
ICBGb3IgVk9QIHZlcnNpb24gdW5kZXIgcmszNTc2LCB0aGUgaW50ZXJydXB0IGlzIHNoYXJlZCBi
eSBzZXZlcmFsIGludGVycnVwdAo+Pj4+ICsgICAgICBzb3VyY2VzLCBzdWNoIGFzIGZyYW1lIHN0
YXJ0IChWU1lOQyksIGxpbmUgZmxhZyBhbmQgb3RoZXIgaW50ZXJydXB0IHN0YXR1cy4KPj4+PiAr
ICAgICAgRm9yIFZPUCB2ZXJzaW9uIGZyb20gcmszNTc2IHRoZXJlIGlzIGEgc3lzdGVtIGludGVy
cnVwdCBmb3IgYnVzIGVycm9yLCBhbmQKPj4+PiArICAgICAgZXZlcnkgdmlkZW8gcG9ydCBoYXMg
aXQncyBpbmRlcGVuZGVudCBpbnRlcnJ1cHRzIGZvciB2c3luYyBhbmQgb3RoZXIgdmlkZW8KPj4+
PiArICAgICAgcG9ydCByZWxhdGVkIGVycm9yIGludGVycnVwdHMuCj4+Pj4gKwo+Pj4+ICsgIGlu
dGVycnVwdC1uYW1lczoKPj4+PiArICAgIGl0ZW1zOgo+Pj4+ICsgICAgICAtIGNvbnN0OiBzeXMK
Pj4+PiArICAgICAgLSBjb25zdDogdnAwCj4+Pj4gKyAgICAgIC0gY29uc3Q6IHZwMQo+Pj4+ICsg
ICAgICAtIGNvbnN0OiB2cDIKPj4+PiAgCj4+Pj4gICAgIyBTZWUgY29tcGF0aWJsZS1zcGVjaWZp
YyBjb25zdHJhaW50cyBiZWxvdy4KPj4+PiAgICBjbG9ja3M6Cj4+Pj4gQEAgLTEzNSw2ICsxNDcs
OCBAQCBhbGxPZjoKPj4+PiAgICAgICAgICBpbnRlcnJ1cHRzOgo+Pj4+ICAgICAgICAgICAgbWF4
SXRlbXM6IDEKPj4+Cj4+PiBTbyB0aGlzIGNoYW5nZSBtb3ZlcyB0byB0aGlzIHBhdGNoLgo+Pj4K
Pj4+PiAgCj4+Pj4gKyAgICAgICAgaW50ZXJydXB0LW5hbWVzOiBmYWxzZQo+Pj4+ICsKPj4+PiAg
ICAgICAgICBwb3J0czoKPj4+PiAgICAgICAgICAgIHJlcXVpcmVkOgo+Pj4+ICAgICAgICAgICAg
ICAtIHBvcnRAMAo+Pj4+IEBAIC0xNDgsNiArMTYyLDM5IEBAIGFsbE9mOgo+Pj4+ICAgICAgICBy
ZXF1aXJlZDoKPj4+PiAgICAgICAgICAtIHJvY2tjaGlwLGdyZgo+Pj4+ICAKPj4+PiArICAtIGlm
Ogo+Pj4+ICsgICAgICBwcm9wZXJ0aWVzOgo+Pj4+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4+Pj4g
KyAgICAgICAgICBjb250YWluczoKPj4+PiArICAgICAgICAgICAgZW51bToKPj4+PiArICAgICAg
ICAgICAgICAtIHJvY2tjaGlwLHJrMzU3Ni12b3AKPj4+PiArICAgIHRoZW46Cj4+Pj4gKyAgICAg
IHByb3BlcnRpZXM6Cj4+Pj4gKyAgICAgICAgY2xvY2tzOgo+Pj4+ICsgICAgICAgICAgbWluSXRl
bXM6IDUKPj4+Cj4+PiBOby4gWW91IGRpZCBub3QgaW1wbGVtZW50IG15IGNvbW1lbnQgYXQgYWxs
Lgo+Pj4KPj4+IFNvIGFnYWluOgo+Pj4gIldoeSBtaW5JdGVtcz8gTm90aGluZyBpbiB0aGlzIHBh
dGNoIG1ha2VzIHNlbnNlIGZvciBtZS4gTmVpdGhlciBjaGFuZ2luZwo+Pj4gZXhpc3RpbmcgYmlu
ZGluZyBub3IgbmV3IGJpbmRpbmcgZm9yIHJrMzU3Ni4iCj4+IAo+PiBEbyB5b3UgbWVhbiBiZWNh
dXNlIEkgYWxyZWFkeSBkZWZpbmVkIG1pbkl0ZW1zIG9mIGNsb2NrcyBpcyA1IG9uIHRoZSB0b3As
IHNvIAo+PiB0aGVyZSBpcyBubyBuZWVkIHRvIHJlZGVmaW5lIHRoZSBzYW1lIG1pbkl0ZW1zIGhl
cmUgPwo+Cj5MaXN0cyBtdXN0IGJlIGNvbnN0cmFpbmVkLiBUaGlzIGlzIG5vdCBjb25zdHJhaW5l
ZCBmcm9tIHRoZSBtYXggaXRlbXMKPmFuZCB5b3UgcmVwZWF0IGV4aXN0aW5nIGNvbnN0cmFpbi4K
Pgo+Rm9yIGV2ZXJ5IHZhcmlhYmxlIGxpc3QgeW91IG5lZWQgdG8gcHJvdmlkZSBtaW4gYW5kIG1h
eEl0ZW1zLCBleGNlcHQgdGhlCj5lZGdlIGNhc2VzIHdoZW4gZGltZW5zaW9uIG1hdGNoZXMgdG9w
IGxldmVsIGRpbWVuc2lvbi4KPgo+U3RhbmRhcmQgZXhhbXBsZSBpczoKPgo+aHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTEtcmM2L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdWZzL3Fjb20sdWZzLnlhbWwjTDEyNwo+Cj53aGljaCBJIG1lbnRpb24g
b24gbWFpbGluZyBsaXN0cyBtdWx0aXBsZSB0aW1lcy4gQWxzbyBkZXNjcmliZWQgdGhpcwoKPmNh
c2UgZXhhY3RseSBvbiBteSB0d28gdGFsa3MuLi4KCgpEbyB5b3UgbWVhbiB0aGVzZSB0d28gdGFs
a3NbMF1bMV0gPwpbMF0gaHR0cHM6Ly9lb3NzMjQuc2NoZWQuY29tL2V2ZW50LzFhQkVmL3doYWNr
LWEtbW9sZS13aXRoLWR0cy12YWxpZGF0aW9uLWluLXRoZS1saW51eC1rZXJuZWwta3J6eXN6dG9m
LWtvemxvd3NraS1saW5hcm8/bGlua2JhY2s9Z3JpZApbMV0gaHR0cHM6Ly9lb3NzMjAyMy5zY2hl
ZC5jb20vZXZlbnQvMUxjTm8vaG93LXRvLWdldC15b3VyLWR0LXNjaGVtYS1iaW5kaW5ncy1hY2Nl
cHRlZC1pbi1sZXNzLXRoYW4tMTAtaXRlcmF0aW9ucy1rcnp5c3p0b2Yta296bG93c2tpLWxpbmFy
byAKCj4KPj4gCj4+Pgo+Pj4gVG8gYWRkcmVzcyBzdWNoIGNvbW1lbnQsIGNvbWUgd2l0aCByZWFz
b25hYmxlIGFuc3dlciB0byAid2h5Ii4gTm90IGp1c3QKPj4+IHNlbmQgdGhlIHNhbWUuIEl0J3Mg
YSB3YXN0ZSBvZiBteSB0aW1lIHRvIGtlZXAgcmV2aWV3aW5nIHRoZSBzYW1lLgo+PiAKPj4gQmVm
b3JlIHNlbmRpbmcgdGhpcyBwYXRjaCwgSSBhc2tlZCB5b3Ugd2hhdCB0aGUgbmV4dCBzdGVwIHNo
b3VsZCBiZSwgYnV0IHlvdSBkaWRuJ3QgcmVzcG9uZC4KPgo+WW91IGFza2VkIHdoZXRoZXIgc3Bs
aXR0aW5nIGlzIGNvcnJlY3QgYW5kIEkgZGlkIG5vdCBvYmplY3QgdGhhdC4gSQo+YWxyZWFkeSBz
YWlkOiAiIFlvdSBuZWVkIHRvIHNwbGl0IHJlb3JnYW5pemluZyIsIHRoZW4geW91IGFza2VkIGlm
IHlvdQo+Y2FuIHNwbGl0LCBzbyBzb3JyeSwgSSBhbSBub3QgZ29pbmcgdG8ga2VlcCByZXBlYXRp
bmcgdGhlIHNhbWUgbXVsdGlwbGUKPnRpbWVzLgo+Cj5CdXQgYW55d2F5IHRoaXMgaXMgbm90IGFi
b3V0IHRoZSBzcGxpdCwgc28geW91IGRpZCBub3QgcXVlc3Rpb24gbGFzdAo+dGltZSBob3cgdG8g
ZG8gaXQuIFlvdSBqdXN0IHNraXBwZWQgbXkgcGFyYWdyYXBoIGFza2luZyBmb3IgIldoeT8iLgo+
Cj4KPgo+QmVzdCByZWdhcmRzLAo+S3J6eXN6dG9mCg==
