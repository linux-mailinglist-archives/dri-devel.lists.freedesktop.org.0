Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C51A967556
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 08:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD5E10E10F;
	Sun,  1 Sep 2024 06:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="l3vcwnRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id A534110E10F
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 06:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=Q5ie0SU+rwJ8jZQS1JdOylihEKeHaFZ4ykRjrQITKug=; b=l
 3vcwnRoBWRUzCkGn/19gO5ySTDgk9W04z8Ei5qzntoESm9m3SLeXlxEpfBMYv4zs
 SL/225Q302prANSPQ9MEA23OuZd1aIphORJNsADyne8KNqXYU1a+PyU19Ms3QBDi
 XwFTZXRRdj2VOcEdMuF0x7LVgQ8ve56z3PFqGV+jOk=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-139 (Coremail) ; Sun, 1 Sep 2024 14:40:11 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sun, 1 Sep 2024 14:40:11 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 "Krzysztof Kozlowski" <krzk@kernel.org>, 
 "Andrzej Hajda" <andrzej.hajda@intel.com>, 
 "Neil Armstrong" <neil.armstrong@linaro.org>, 
 "Robert Foss" <rfoss@kernel.org>, 
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, 
 "Jonas Karlman" <jonas@kwiboo.se>, 
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, 
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, 
 "Maxime Ripard" <mripard@kernel.org>, 
 "Thomas Zimmermann" <tzimmermann@suse.de>, 
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, 
 "Sandy Huang" <hjc@rock-chips.com>, "Andy Yan" <andy.yan@rock-chips.com>, 
 "Rob Herring" <robh@kernel.org>, 
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
 "Conor Dooley" <conor+dt@kernel.org>, "Mark Yao" <markyao0591@gmail.com>, 
 "Sascha Hauer" <s.hauer@pengutronix.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 kernel@collabora.com, "Alexandre ARNOUD" <aarnoud@me.com>, 
 "Luis de Arquer" <ldearquer@gmail.com>
Subject: Re:Re: [PATCH v5 1/4] dt-bindings: display: bridge: Add schema for
 Synopsys DW HDMI QP TX IP
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <aee7b364-39df-4eb4-a823-4e734f104982@collabora.com>
References: <20240831-b4-rk3588-bridge-upstream-v5-0-9503bece0136@collabora.com>
 <20240831-b4-rk3588-bridge-upstream-v5-1-9503bece0136@collabora.com>
 <57wj2vwjv7eehlix2bmvbm3z4agv5fsyp6vmwwqzotkdsadx7n@azqg2kkaeuxz>
 <10210346.L8ug28u51p@diego>
 <aee7b364-39df-4eb4-a823-4e734f104982@collabora.com>
X-NTES-SC: AL_Qu2ZB/2cvUAq5yKcYekZnEobh+Y5UcK2s/ki2YFXN5k0iSXP6y49RXxAF1DJy86vNx+nsxutfgFs+9V0RJlGc6mmbkMBNI9l1TypHVSjQ64B
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <610d9bc3.159c.191ac5005f5.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3f6dLDNRmuANTAA--.37424W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gpNXmWX0FcfugACsZ
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

Ckhp77yMCgrlnKggMjAyNC0wOS0wMSAwNTo1MzozOe+8jCJDcmlzdGlhbiBDaW9jYWx0ZWEiIDxj
cmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4g5YaZ6YGT77yaCj5PbiA4LzMxLzI0IDQ6
NTggUE0sIEhlaWtvIFN0w7xibmVyIHdyb3RlOgo+PiBIaSwKPj4gCj4+IEFtIFNhbXN0YWcsIDMx
LiBBdWd1c3QgMjAyNCwgMDg6MTY6MjYgQ0VTVCBzY2hyaWViIEtyenlzenRvZiBLb3psb3dza2k6
Cj4+PiBPbiBTYXQsIEF1ZyAzMSwgMjAyNCBhdCAxMjo1NToyOUFNICswMzAwLCBDcmlzdGlhbiBD
aW9jYWx0ZWEgd3JvdGU6Cj4+IAo+Pj4+ICsgIGNsb2NrczoKPj4+PiArICAgIG1pbkl0ZW1zOiA0
Cj4+Pj4gKyAgICBtYXhJdGVtczogNgo+Pj4+ICsgICAgaXRlbXM6Cj4+Pj4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IFBlcmlwaGVyYWwvQVBCIGJ1cyBjbG9jawo+Pj4+ICsgICAgICAtIGRlc2NyaXB0
aW9uOiBFQVJDIFJYIGJpcGhhc2UgY2xvY2sKPj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogUmVm
ZXJlbmNlIGNsb2NrCj4+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEF1ZGlvIGludGVyZmFjZSBj
bG9jawo+Pj4+ICsgICAgYWRkaXRpb25hbEl0ZW1zOiB0cnVlCj4+Pgo+Pj4gV2hhdCBpcyB0aGUg
dXNlZnVsbmVzcyBvZiBhbGwgdGhpcz8gSG93IGNhbiB5b3UgZXZlbiBiZSBzdXJlIHRoYXQgZWFj
aAo+Pj4gaW1wbGVtZW50YXRpb24gb2YgdGhpcyBjb3JlIHdpbGwgaGF2ZSBleGFjdGx5IHRoZXNl
IGNsb2Nrcz8KPj4+Cj4+Pj4gKwo+Pj4+ICsgIGNsb2NrLW5hbWVzOgo+Pj4+ICsgICAgbWluSXRl
bXM6IDQKPj4+PiArICAgIG1heEl0ZW1zOiA2Cj4+Pj4gKyAgICBpdGVtczoKPj4+PiArICAgICAg
LSBjb25zdDogcGNsawo+Pj4+ICsgICAgICAtIGNvbnN0OiBlYXJjCj4+Pj4gKyAgICAgIC0gY29u
c3Q6IHJlZgo+Pj4+ICsgICAgICAtIGNvbnN0OiBhdWQKPj4+PiArICAgIGFkZGl0aW9uYWxJdGVt
czogdHJ1ZQo+Pj4+ICsKPj4+PiArICBpbnRlcnJ1cHRzOgo+Pj4+ICsgICAgbWluSXRlbXM6IDQK
Pj4+PiArICAgIG1heEl0ZW1zOiA1Cj4+Pj4gKyAgICBpdGVtczoKPj4+PiArICAgICAgLSBkZXNj
cmlwdGlvbjogQVZQIFVuaXQgaW50ZXJydXB0Cj4+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IENF
QyBpbnRlcnJ1cHQKPj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogZUFSQyBSWCBpbnRlcnJ1cHQK
Pj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogTWFpbiBVbml0IGludGVycnVwdAo+Pj4KPj4+IElm
IHRoZXNlIGFyZSByZWFsIHBpbnMsIHRoZW4gdGhpcyBzZWVtcyBtb3JlIHBvc3NpYmxlLCBidXQK
Pj4+IGFkZGl0aW9uYWxJdGVtcyBkb2VzIG5vdCBtYWtlIG1lIGhhcHB5Lgo+PiAKPj4gU28gd2hp
bGUgbm90ICJwaW5zIiwgdGhlIGludGVycnVwdHMgYXJlIHNlcGFyYXRlbHkgc3BlY2lmaWVkIGlu
IHRoZQo+PiBTb0MncyBsaXN0IG9mIGludGVycnVwdHMgaW4gdGhlIEdJQzoKPj4gCj4+IFJLMzU4
OCBoYXM6Cj4+IAo+PiAyMDEgIGlycV9oZG1pdHgwX29hdnAKPj4gMjAyICBpcnFfaGRtaXR4MF9v
Y2VjCj4+IDIwMyAgaXJxX2hkbWl0eDBfb2VhcmNyeAo+PiAyMDQgIGlycV9oZG1pdHgwX29tYWlu
Cj4+IDM5MiAgaXJxX2hkbWl0eDBfaHBkCj4+IAo+PiBhbmQgYW5vdGhlciBzZXQgb2YgYWxsIG9m
IHRoZW0gZm9yIGhkbWl0eDEKPj4gCj4+IGFuZCBSSzM1NzYgdXNpbmcgdGhlIHNhbWUgaGRtaSBJ
UCBoYXM6Cj4+IAo+PiAzNzAgIGlycV9oZG1pdHhfb2F2cAo+PiAzNzEgIGlycV9oZG1pdHhfb2Nl
Ywo+PiAzNzIgIGlycV9oZG1pdHhfb2VhcmNyeAo+PiAzNzMgIGlycV9oZG1pdHhfb21haW4KPj4g
Mzk5ICBpcnFfaGRtaXR4X2hwZAoKVGhlIGZpcnN0IGZvdXIgaW50ZXJydXB0cyBhcmUgZXhwb3J0
IGZyb20gdGhlIERXLUhETUktUVAgSVAgY29yZeOAggpUaGUgZmlmdGggSFBEIGludGVycnVwdHMg
aXMgYSByb2NrY2hpcCBkZXNpZ27jgIIKCj4+IAo+PiBzbyBJIGd1ZXNzIHRoZSBmaWZ0aCBpbnRl
cnJ1cHQgaXMgbWVhbnQgdG8gYmUgdGhlIGhvdHBsdWc/Cj4KPlllcCwgdGhhdCdzIGZvciB0aGUg
aG90cGx1ZyBkZXRlY3Rpb24uCj4KPj4gVGhvdWdoIEkgZ3Vlc3MgdGhpcyBzaG91bGQgYmUgc3Bl
Y2lmaWNlZCBpbiB0aGUgbmFtZS1saXN0IHRvby4KPgo+TXkgdW5kZXJzdGFuZGluZyBmcm9tIEFu
ZHkgd2FzIHRoYXQgSFBEIGludGVycnVwdCBpcyBSb2NrY2hpcCBwbGF0Zm9ybQo+c3BlY2lmaWMs
IGhlbmNlIEkgbWFkZSBpdCBwYXJ0IG9mIHJvY2tjaGlwLHJrMzU4OC1kdy1oZG1pLXFwLnlhbWwu
Cj4KPj4gRnJvbSB0aGUgU29DJ3MgbWFudWFsIGl0IGxvb2tzIGxpa2UgdGhlIGNvbnRyb2xsZXIg
aXMgc2V0IHVwIGZyb20KPj4gZGlmZmVyZW50IG1vZHVsZXMuCj4+IExpa2UgQVZQIGlzIHRoZSBh
dWRpby12aWRlby1wYWNrZXQtbW9kdWxlLCB0aGVyZSBpcyBhIE1haW4gYW5kIENFQyBNb2R1bGUK
Pj4gYXMgd2VsbCBhcyBhIGVBUkMgUlggY29udHJvbGxlciBpbnNpZGUuIEknZCBndWVzcyBpdCBt
aWdodCBiZSBwb3NzaWJsZQo+PiBvdGhlciBTb0MgdmVuZG9ycyBjb3VsZCBsZWF2ZSBvdXQgc3Bl
Y2lmaWMgbW9kdWxlcz8KPj4gCj4+IAo+PiBUTDtEUiBJIHRoaW5rIHRob3NlIGNsb2NrcyBhbmQg
aW50ZXJydXB0cyBhcmUgZGVwZW5kZW50IG9uIGhvdyB0aGUKPj4gSVAgY29yZSB3YXMgc3ludGhl
c2l6ZWQsIHNvIGZvciBub3cgSSdkIHRoaW5rIHdlIGNhbiBvbmx5IGd1YXJhbnRlZQo+PiB0aGF0
IHRoZXkgYXJlIHRydWUgZm9yIHJrMzU4OCBhbmQgcmszNTc2Lgo+PiAKPj4gU28gSSBndWVzcyB0
aGV5IHNob3VsZCBtb3ZlIHRvIHRoZSByb2NrY2hpcC1zcGVjaWZpYyBwYXJ0IG9mIHRoZSBiaW5k
aW5nCj4+IHVudGlsIHdlIGhhdmUgbW9yZSBoZG1pLXFwIGNvbnRyb2xsZXJzIGluIHRoZSBmaWVs
ZD8KPgo+SWYgdGhhdCdzIHRoZSBjYXNlLCB0aGVuIHdlIHNob3VsZCBzaW1wbHkgZHJvcCB0aGUg
Y29tbW9uIGJpbmRpbmcKPmFsdG9nZXRoZXIgZm9yIG5vdy4KPgo+VGhhbmtzLAo+Q3Jpc3RpYW4K
Pgo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPkxpbnV4
LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+TGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2Nr
Y2hpcAo=
