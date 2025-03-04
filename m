Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8BBA4D9F7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF68010E261;
	Tue,  4 Mar 2025 10:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Qf3VhK8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA50010E261
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=GE3NtQzxGoEbY7sh1mp1PtR9a3XDU5STFXm+a0uxTJ8=; b=Q
 f3VhK8rVsZC9doAldFp0bX/M/2nDFybh6zxEYPKXTW3Vhy4MKaZGKO1OEjtFYnkx
 OSKUUybIkTN/FBB1U/aMD0pJHHDQ5GfgjlshB+GEF9SffYQBjPoLjqwqpH1HYN19
 JhlN13Qztvko1I1aH6eCH5hS6x1YtWgB18MeHZxRw0=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Tue, 4 Mar 2025 18:16:19 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 4 Mar 2025 18:16:19 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org,
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH 2/6] drm/bridge: synopsys: Add DW DPTX Controller
 support library
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <5g6qv47ufjfy4yvzpw3rw7xopyuikzi7k4n2habxoexor4kyb2@f7pwawo75kqu>
References: <20250223113036.74252-1-andyshrk@163.com>
 <20250223113036.74252-3-andyshrk@163.com>
 <563i7xcbbsxfezkgs4txsa6lar5tb5folp7zk7dc7sbvf54n6y@vqbtuwvj3fcw>
 <6046d805.2173.195566bd4cf.Coremail.andyshrk@163.com>
 <5g6qv47ufjfy4yvzpw3rw7xopyuikzi7k4n2habxoexor4kyb2@f7pwawo75kqu>
X-NTES-SC: AL_Qu2fA/yTvEss7yCdbekfmkcVgOw9UcO5v/Qk3oZXOJF8jCrp+T4yXHBTF1zd3fCDBzi2nQiHVRZJ0dhgcY1zcacMWpEhTnjlgbHYIAwAYR9Cjw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <17a6bdcc.a22e.19560a80576.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZCgvCgBnLF7z0sZnj7sbAA--.21137W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBUGXmfG0HZF5wABsB
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

SGkgRG1pdHJ5LAoK5ZyoIDIwMjUtMDMtMDMgMDA6MjE6MDbvvIwiRG1pdHJ5IEJhcnlzaGtvdiIg
PGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4g5YaZ6YGT77yaCj5PbiBTdW4sIE1hciAwMiwg
MjAyNSBhdCAwNjozNDoyMlBNICswODAwLCBBbmR5IFlhbiB3cm90ZToKPj4gCj4+IAo+PiBIaSBE
bWl0cnnvvIwKPj4gICAgVGhhbmsgeW91IGZvciB5b3VyIHJldmlld+OAggo+PiAgICBQbGVhc2Ug
YWxzbyByZXZpZXcgbXkgaW5saW5lIHJlcGx5Lgo+PiAgICAgICAKPj4g5ZyoIDIwMjUtMDMtMDIg
MDI6MTQ6MTnvvIwiRG1pdHJ5IEJhcnlzaGtvdiIgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9y
Zz4g5YaZ6YGT77yaCj4+ID5PbiBTdW4sIEZlYiAyMywgMjAyNSBhdCAwNzozMDoyNVBNICswODAw
LCBBbmR5IFlhbiB3cm90ZToKPj4gPj4gRnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hp
cHMuY29tPgo+PiA+PiAKPj4gPj4gVGhlIERXIERQIFRYIENvbnRyb2xsZXIgaXMgY29tcGxpYW50
IHdpdGggdGhlIERpc3BsYXlQb3J0IFNwZWNpZmljYXRpb24KPj4gPj4gVmVyc2lvbiAxLjQgd2l0
aCB0aGUgZm9sbG93aW5nIGZlYXR1cmVzOgo+PiA+PiAKPj4gPj4gKiBEaXNwbGF5UG9ydCAxLjRh
Cj4+ID4+ICogTWFpbiBMaW5rOiAxLzIvNCBsYW5lcwo+PiA+PiAqIE1haW4gTGluayBTdXBwb3J0
IDEuNjJHYnBzLCAyLjdHYnBzLCA1LjRHYnBzIGFuZCA4LjFHYnBzCj4+ID4+ICogQVVYIGNoYW5u
ZWwgMU1icHMKPj4gPj4gKiBTaW5nbGUgU3RyZWFtIFRyYW5zcG9ydChTU1QpCj4+ID4+ICogTXVs
dGlzdHJlYW0gVHJhbnNwb3J0IChNU1QpCj4+ID4+ICrvga5UeXBlLUMgc3VwcG9ydCAoYWx0ZXJu
YXRlIG1vZGUpCj4+ID4+ICogSERDUCAyLjIsIEhEQ1AgMS4zCj4+ID4+ICogU3VwcG9ydHMgdXAg
dG8gOC8xMCBiaXRzIHBlciBjb2xvciBjb21wb25lbnQKPj4gPj4gKiBTdXBwb3J0cyBSQkcsIFlD
YkNyNDo0OjQsIFlDYkNyNDoyOjIsIFlDYkNyNDoyOjAKPj4gPj4gKiBQaXhlbCBjbG9jayB1cCB0
byA1OTRNSHoKPj4gPj4gKiBJMlMsIFNQRElGIGF1ZGlvIGludGVyZmFjZQo+PiA+PiAKPj4gPj4g
QWRkIGxpYnJhcnkgd2l0aCBjb21tb24gaGVscGVycyB0byBtYWtlIGl0IGNhbiBiZSBzaGFyZWQg
d2l0aAo+PiA+PiBvdGhlciBTb0MuCj4+ID4+IAo+PiA+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFlh
biA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+ID4+IAo+PiA+PiBkcm0vYnJpZGdlOiBjbGVh
bnVwCj4+ID4KPj4gPlN0cmF5IGxpbmU/Cj4+IAo+PiBTb3JyeSwgd2lsbCBiZSByZW1vdmVkLgo+
PiAKPj4gPgo+PiA+PiAKPj4gPj4gLS0tCj4+ID4+IAo+PiA+PiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9LY29uZmlnICB8ICAgIDcgKwo+PiA+PiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9NYWtlZmlsZSB8ICAgIDEgKwo+PiA+PiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1kcC5jICB8IDIxNTUgKysrKysrKysrKysrKysrKysrKysrKwo+PiA+
PiAgaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2RwLmggICAgICAgICAgICAgICB8ICAgMTkgKwo+PiA+
PiAgNCBmaWxlcyBjaGFuZ2VkLCAyMTgyIGluc2VydGlvbnMoKykKPj4gPj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWRwLmMKPj4gPj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS9icmlkZ2UvZHdfZHAuaAo+PiA+PiAKPj4gPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvS2NvbmZpZyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvS2NvbmZpZwo+PiA+PiBpbmRleCBmM2FiMmY5
ODVmOGMuLjJjNWU1MzI0MTBkZSAxMDA2NDQKPj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9LY29uZmlnCj4+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvS2NvbmZpZwo+PiA+PiBAQCAtMSw0ICsxLDExIEBACj4+ID4+ICAjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPj4gPj4gK2NvbmZpZyBEUk1fRFdfRFAKPj4g
Pj4gKwl0cmlzdGF0ZQo+PiA+PiArCXNlbGVjdCBEUk1fRElTUExBWV9IRUxQRVIKPj4gPj4gKwlz
ZWxlY3QgRFJNX0RJU1BMQVlfRFBfSEVMUEVSCj4+ID4+ICsJc2VsZWN0IERSTV9LTVNfSEVMUEVS
Cj4+ID4+ICsJc2VsZWN0IFJFR01BUF9NTUlPCj4+ID4+ICsKPj4gPj4gIGNvbmZpZyBEUk1fRFdf
SERNSQoKCi4uLi4uLi4uLi4uLi4uCgo+PiA+PiArCQl2c2MucGl4ZWxmb3JtYXQgPSBEUF9QSVhF
TEZPUk1BVF9SR0I7Cj4+ID4+ICsJCWJyZWFrOwo+PiA+PiArCX0KPj4gPj4gKwo+PiA+PiArCWlm
ICh2aWRlby0+Y29sb3JfZm9ybWF0ID09IERSTV9DT0xPUl9GT1JNQVRfUkdCNDQ0KSB7Cj4+ID4+
ICsJCXZzYy5jb2xvcmltZXRyeSA9IERQX0NPTE9SSU1FVFJZX0RFRkFVTFQ7Cj4+ID4+ICsJCXZz
Yy5keW5hbWljX3JhbmdlID0gRFBfRFlOQU1JQ19SQU5HRV9WRVNBOwo+PiA+PiArCX0gZWxzZSB7
Cj4+ID4+ICsJCXZzYy5jb2xvcmltZXRyeSA9IERQX0NPTE9SSU1FVFJZX0JUNzA5X1lDQzsKPj4g
Pj4gKwkJdnNjLmR5bmFtaWNfcmFuZ2UgPSBEUF9EWU5BTUlDX1JBTkdFX0NUQTsKPj4gPj4gKwl9
Cj4+ID4+ICsKPj4gPj4gKwl2c2MuYnBjID0gdmlkZW8tPmJwYzsKPj4gPj4gKwl2c2MuY29udGVu
dF90eXBlID0gRFBfQ09OVEVOVF9UWVBFX05PVF9ERUZJTkVEOwo+PiA+PiArCj4+ID4+ICsJZHdf
ZHBfdnNjX3NkcF9wYWNrKCZ2c2MsICZzZHApOwo+PiA+PiArCj4+ID4+ICsJcmV0dXJuIGR3X2Rw
X3NlbmRfc2RwKGRwLCAmc2RwKTsKPj4gPj4gK30KPj4gPj4gKwo+PiA+PiArc3RhdGljIGludCBk
d19kcF92aWRlb19zZXRfcGl4ZWxfbW9kZShzdHJ1Y3QgZHdfZHAgKmRwLCB1OCBwaXhlbF9tb2Rl
KQo+PiA+PiArewo+PiA+PiArCXN3aXRjaCAocGl4ZWxfbW9kZSkgewo+PiA+PiArCWNhc2UgRFdf
RFBfTVBfU0lOR0xFX1BJWEVMOgo+PiA+PiArCWNhc2UgRFdfRFBfTVBfRFVBTF9QSVhFTDoKPj4g
Pj4gKwljYXNlIERXX0RQX01QX1FVQURfUElYRUw6Cj4+ID4+ICsJCWJyZWFrOwo+PiA+PiArCWRl
ZmF1bHQ6Cj4+ID4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiA+Cj4+ID5JcyBpdCBwb3NzaWJsZT8K
Pj4gCj4+IFRoaXMgSVAgaXMgY29uZmlndXJhYmxlIGZvciBzaW5nbGUvZHVhbC9xdWFkIHBpeGVs
IG1vZGVz44CCCj4+IEl0J3MgIHF1YWQgcGl4ZWwgbW9kZSBvbiByazM1ODggYW5kIGR1YWwgcGl4
ZWwgbW9kZSBvbiByazM1NzYsCj4+IHNvIHdlIGFkZCB0aGlzIGNoZWNrIGhlcmUuCj4KPk15IHF1
ZXN0aW9uIHdhcyBzbGlnaHRseSBkaWZmZXJlbnQ6IGlzIGl0IHBvc3NpYmxlIHRvIGVuZCB1cCBo
ZXJlIGluIHRoZQo+J2RlZmF1bHQnIGJyYW5jaD8KClNvcnJ5LCBJIHRoaW5rIEkgZGlkbid0IGdl
dCB5b3VyIGtleSBwb2ludCBoZXJlLgpJZiBzb21lb25lIGdpdmVzIGFuIGludmFsaWQgcGl4ZWwg
bW9kZShub3QgYW55IG9mIFNJTkdMRS9EVUFML1FVQURfUElYRUwgKSwgCnRoZW4gd2UgZ28gdG8g
dGhlIGRlZmF1bHQgYnJhbmNoIHJldHVybiAtRU5WSUFMLCAgdGhlbiB0aGUgZHBfYnJpZGdlX2Vu
YWJsZSAgY2FsbCBzdG9wLgpUaGlzIGlzIHdoYXQgd2Ugd2FudCBoZXJlLgoKPgo+PiAKPj4gCj4+
ID4KPj4gPj4gKwl9Cgo+PiA+PiArI2VuZGlmIC8qIF9fRFdfRFBfXyAqLwo+PiA+PiAtLSAKPj4g
Pj4gMi4zNC4xCj4+ID4+IAo+PiA+Cj4+ID4tLSAKPj4gPldpdGggYmVzdCB3aXNoZXMKPj4gPkRt
aXRyeQo+Cj4tLSAKPldpdGggYmVzdCB3aXNoZXMKPkRtaXRyeQo=
