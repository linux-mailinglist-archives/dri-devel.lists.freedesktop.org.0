Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7B6AC2E38
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 10:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4652A10E0B0;
	Sat, 24 May 2025 08:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="PK7rR2sm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AA1E10E0B0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 08:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=HG4jeHKiiB0ABQ8SUjqPMkyYhMmLoOjAO8m16dhU8lw=; b=P
 K7rR2smictRIbPp9o5EiSvXdSEjGdmzWlp7UFVtRXnEhnK3zeQwTwsiVDvw8yPVt
 zUUajUNbe58L6MPQQQJL7uHmWFMnaWPZz5xlxbPDXWhrNSfB1n6jdl5LBOz8nt8S
 eBiq8kPfVoYPWby+7iJyF5DdOAkxYcalxxXmyT709s=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-135 (Coremail) ; Sat, 24 May 2025 15:59:52 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sat, 24 May 2025 15:59:52 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org,
 sebastian.reichel@collabora.com, stephen@radxa.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 mripard@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 yubing.zhang@rock-chips.com, naoki@radxa.com,
 Laurent.pinchart@ideasonboard.com,
 "Andy Yan" <andy.yan@rock-chips.com>, krzk+dt@kernel.org,
 robh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re:Re: [PATCH v3 2/9] drm/bridge: synopsys: Add DW DPTX Controller
 support library
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <hsrec7lguapfxdxulyncypdx5c2rzamcxeoj2kiojw3ukvi5c3@lwr6eriwoxdy>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-3-andyshrk@163.com>
 <2f4796ad.a2e0.196ceb908b0.Coremail.andyshrk@163.com>
 <hsrec7lguapfxdxulyncypdx5c2rzamcxeoj2kiojw3ukvi5c3@lwr6eriwoxdy>
X-NTES-SC: AL_Qu2fCvycvE0i5CmbYOkfmkcVgOw9UcO5v/Qk3oZXOJF8jB7o+QsaQHlnIl7Mz/iwIAC8nDyzXwpc4+Bxdpt3U68pE8705fD6WYa0kk1KxQiX6w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7d4f2ae8.23f1.197014e386f.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hygvCgD3P9F5fDFoeC4MAA--.40552W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hNXXmgxdoFyowACs1
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

CgpIZWxsbyBEbWl0cnksCgoK5ZyoIDIwMjUtMDUtMjQgMTU6NDY6MTXvvIwiRG1pdHJ5IEJhcnlz
aGtvdiIgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4g5YaZ6YGT77yaCj5PbiBX
ZWQsIE1heSAxNCwgMjAyNSBhdCAwODoxNTo1NVBNICswODAwLCBBbmR5IFlhbiB3cm90ZToKPj4g
SGVsbG8gRG1pdHJ577yMCj4+IAo+PiAgICAgV291bGQgaXQgYmUgY29udmVuaWVudCBmb3IgeW91
IHRvIGNvbnRpbnVlIHJldmlld2luZyB0aGlzIHBhdGNoIGF0IHlvdXIgY29udmVuaWVuY2U/Cj4+
IE9yIGxldCBtZSBrbm93IHlvdXIgb3BpbmlvbiBvbiB0aGlzIHBhdGNoLgo+PiAgCj4+ICAgIFRo
ZXJlIGlzIHN0aWxsIG9uZSB1bnJlc29sdmVkIGlzc3VlIGhpZ2hsaWdodGVkIGJ5IHlvdSBpbiB0
aGUgZmlyc3QgdmVyc2lvbjogdHJ5IHRvIHVzZSBkcm1fZHBfcmVhZF9zaW5rX2NvdW50X2NhcAo+
PiBpbnN0ZWFkIG9mIGR3X2RwX2hhc19zaW5rX2NvdW50LiBCdXQgdGhlcmUgaXMgbm8gcmVzcG9u
c2Ugb24gbXkgcGF0Y2ggdHJ5IHRvIFBhc3MgZG93biBjb25uZWN0b3IgdG8gZHJtIGJyaWRnZSBk
ZXRlY3QgaG9va1swXS4KPj4gICAgSSBkb24ndCBrbm93IGhvdyB0byBwcm9jZWVkIHdpdGggdGhp
cyBwYXRjaCBhdCB0aGUgbW9tZW50Lgo+Cj5QbGVhc2UgZXhjdXNlIG1lIGZvciB0aGUgZGVsYXku
IEl0IHNlZW1zIE1heGltZSBkb2Vzbid0IGxpa2UgdGhhdCBwYXRjaCwKPmJ1dCBJIGRvIG5vdCBz
ZWUgYSB2aWFibGUgZ2VuZXJpYyBhbHRlcm5hdGl2ZS4KPgoKCkkgc3RpbGwgd2FudCB0byBleHBy
ZXNzIG15IGdyYXRpdHVkZSBmb3IgeW91ciBoZWxwLiAKU28sIGNvdWxkIHdlIHBlcmhhcHMgZmly
c3Qga2VlcCB0aGlzIHBhcnQgYXMgaXQgaXMgbm93LCBhbmQKd2UgY2FuIHN3aXRjaCB0byB0aGUg
Z2VuZXJpYyBoZWxwZXIgaW4gb25lIGRheSB3aGVuIHdlIGZpbmQgYSBwcm9wZXIgd2F5IHRvIGdl
dCB0aGUgY29ubmVjdG9yID8KCgo+PiAKPj4gCj4+IFswXWh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2RyaS1kZXZlbC8yMDI1MDMyMTA4NTM0NS4xMzYzODAtMS1hbmR5c2hya0AxNjMuY29tLwo+PiAK
Pj4gVGhhbmsgeW91Lgo+PiAgIAo+PiBBdCAyMDI1LTA0LTAzIDExOjM3OjMwLCAiQW5keSBZYW4i
IDxhbmR5c2hya0AxNjMuY29tPiB3cm90ZToKPj4gPkZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkBy
b2NrLWNoaXBzLmNvbT4KPj4gPgo=
