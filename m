Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEB48FC7BB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 11:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823AD10E725;
	Wed,  5 Jun 2024 09:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="CaiTNTk1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3993410E725
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 09:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=XbNrSIUGtH5s4Antd6eJbp0XqcbQ0iBo059NvamtQLc=; b=C
 aiTNTk1pEYkLZ6W2h0cuQLj6bMTuqVWhxgA0c1oLRFSD/F4GisFq/o7SoaUcdNui
 Q6m3N1rmxU9IEcv6GH87S4Tc4XGIriH/1Npt++RVBvRbiP5kUNbHbpSSzNPk56Da
 zvlxRde3CMRWGYJsBXY0z0EZtkXE9xB2DeqzJsYsTI=
Received: from andyshrk$163.com ( [103.29.142.67] ) by
 ajax-webmail-wmsvr-40-133 (Coremail) ; Wed, 5 Jun 2024 17:25:07 +0800 (CST)
X-Originating-IP: [103.29.142.67]
Date: Wed, 5 Jun 2024 17:25:07 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: neil.armstrong@linaro.org, "Heiko Stuebner" <heiko@sntech.de>, 
 "Andrzej Hajda" <andrzej.hajda@intel.com>, 
 "Robert Foss" <rfoss@kernel.org>, 
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, 
 "Jonas Karlman" <jonas@kwiboo.se>, 
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, 
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, 
 "Maxime Ripard" <mripard@kernel.org>, 
 "Thomas Zimmermann" <tzimmermann@suse.de>, 
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, 
 "Sandy Huang" <hjc@rock-chips.com>, "Rob Herring" <robh@kernel.org>, 
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
 "Conor Dooley" <conor+dt@kernel.org>, "Mark Yao" <markyao0591@gmail.com>, 
 "Andy Yan" <andy.yan@rock-chips.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 kernel@collabora.com, "Alexandre ARNOUD" <aarnoud@me.com>, 
 "Luis de Arquer" <ldearquer@gmail.com>, 
 "Algea Cao" <algea.cao@rock-chips.com>
Subject: Re:Re: [PATCH 00/14] Add initial support for the Rockchip RK3588
 HDMI TX Controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <b8066150-c147-4eb6-9f7a-2bd0268c274e@collabora.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <a4b22708-e85d-448a-8145-244b49bca053@linaro.org>
 <ab0a6372-091b-4293-8907-a4b3ff4845c0@rock-chips.com>
 <11359776.NyiUUSuA9g@phil>
 <ef60403f-078f-411a-867b-9b551e863f56@linaro.org>
 <b8066150-c147-4eb6-9f7a-2bd0268c274e@collabora.com>
X-NTES-SC: AL_Qu2aBfmctk0r4SWRZukXn0kXhec2W8Czvvgg34JRP5k0mSXX6CUwY09NEkf79cGgCSqTgCibcCB/zshrZotXco4pb8NUyXmQo3HgbM7/6SEH
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4456bc5a.9b2d.18fe7b76790.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3P0HzLmBmcJo4AA--.25537W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQj0XmVOAqkGGQABsV
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

CkhpLAoKQXQgMjAyNC0wNi0wNSAwNDozMzo1NywgIkNyaXN0aWFuIENpb2NhbHRlYSIgPGNyaXN0
aWFuLmNpb2NhbHRlYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPk9uIDYvMy8yNCA0OjA4IFBNLCBu
ZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3RlOgo+PiBIaSwKPj4gCj4+IE9uIDAzLzA2LzIw
MjQgMTU6MDMsIEhlaWtvIFN0dWVibmVyIHdyb3RlOgo+Pj4gQW0gTW9udGFnLCAzLiBKdW5pIDIw
MjQsIDE0OjE0OjE3IENFU1Qgc2NocmllYiBBbmR5IFlhbjoKPj4+PiBIaSBOZWlsOgo+Pj4+Cj4+
Pj4gT24gNi8zLzI0IDE2OjU1LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+Pj4gSGkgQ2hyaXN0
aWFuLAo+Pj4+Pgo+Pj4+PiBPbiAwMS8wNi8yMDI0IDE1OjEyLCBDcmlzdGlhbiBDaW9jYWx0ZWEg
d3JvdGU6Cj4+Pj4+PiBUaGUgUkszNTg4IFNvQyBmYW1pbHkgaW50ZWdyYXRlcyBhIFF1YWQtUGl4
ZWwgKFFQKSB2YXJpYW50IG9mIHRoZQo+Pj4+Pj4gU3lub3BzeXMgRGVzaWduV2FyZSBIRE1JIFRY
IGNvbnRyb2xsZXIgdXNlZCBpbiB0aGUgcHJldmlvdXMgU29Dcy4KPj4+Pj4+Cj4+Pj4+PiBJdCBp
cyBIRE1JIDIuMSBjb21wbGlhbnQgYW5kIHN1cHBvcnRzIHRoZSBmb2xsb3dpbmcgZmVhdHVyZXMs
IGFtb25nCj4+Pj4+PiBvdGhlcnM6Cj4+Pj4+Pgo+Pj4+PiAuCj4+Pj4+Cj4+Pj4+IC4uCj4+Pj4+
Cj4+Pj4+PiAqIFNDREMgSTJDIEREQyBhY2Nlc3MKPj4+Pj4+ICogVE1EUyBTY3JhbWJsZXIgZW5h
YmxpbmcgMjE2MHBANjBIeiB3aXRoIFJHQi9ZQ2JDcjQ6NDo0Cj4+Pj4+PiAqIFlDYkNyNDoyOjAg
ZW5hYmxpbmcgMjE2MHBANjBIeiBhdCBsb3dlciBIRE1JIGxpbmsgc3BlZWRzCj4+Pj4+PiAqIE11
bHRpLXN0cmVhbSBhdWRpbwo+Pj4+Pj4gKiBFbmhhbmNlZCBBdWRpbyBSZXR1cm4gQ2hhbm5lbCAo
RUFSQykKPj4+Pj4gLT4gVGhvc2UgZmVhdHVyZXMgd2VyZSBhbHJlYWR5IHN1cHBvcnRlZCBieSB0
aGUgSERNSSAyLjBhIGNvbXBsaWFudAo+Pj4+PiBIVywganVzdAo+Pj4+PiBsaXN0IHRoZSBfbmV3
XyBmZWF0dXJlcyBmb3IgSERNSSAyLjEKPj4+Pj4KPj4+Pj4gSSBkaWQgYSBxdWljayByZXZpZXcg
b2YgeW91ciBwYXRjaHNldCBhbmQgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3UKPj4+Pj4gbmVl
ZAo+Pj4+PiB0byBhZGQgYSBzZXBhcmF0ZSBkdy1oZG1pLXFwLmMgc2luY2UgeW91IG9ubHkgbmVl
ZCBzaW1wbGUgdmFyaWFudHMKPj4+Pj4gb2YgdGhlIEkyQwo+Pj4+PiBidXMsIGluZm9mcmFtZSBh
bmQgYnJpZGdlIHNldHVwLgo+Pj4+Pgo+Pj4+PiBDYW4geW91IGVsYWJvcmF0ZSBmdXJ0aGVyID8g
aXNuJ3QgdGhpcyBRdWFkLVBpeGVsIChRUCkgVFggY29udHJvbGxlcgo+Pj4+PiB2ZXJzaW9uCj4+
Pj4+IGRldGVjdGFibGUgYXQgcnVudGltZSA/Cj4+Pj4+Cj4+Pj4+IEkgd291bGQgcHJlZmVyIHRv
IGtlZXAgYSBzaW5nbGUgZHctaGRtaSBkcml2ZXIgaWYgcG9zc2libGUuCj4+Pj4KPj4+Pgo+Pj4+
Cj4+Pj4gVGhlIFFQIEhETUkgY29udHJvbGxlciBpcyBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IHZh
cmlhbnQgd2l0aCB0b3RhbGx5Cj4+Pj4gZGlmZmVyZW50Cj4+Pj4gcmVnaXN0ZXJzIGxheW91dCwg
c2VlIFBBVENIIDEzLzE0Lgo+Pj4+IEkgdGhpbmsgbWFrZSBpdCBhIHNlcGFyYXRlIGRyaXZlciB3
aWxsIGJlIGVhc2llciBmb3IgZGV2ZWxvcG1lbnQgYW5kCj4+Pj4gbWFpbnRlbmFuY2UuCj4+Pgo+
Pj4gSSdtIHdpdGggQW5keSBoZXJlLiBUcnlpbmcgdG8gbmF2aWdhdGUgYSBkcml2ZXIgZm9yIHR3
byBJUCBibG9ja3MgcmVhbGx5Cj4+PiBzb3VuZHMgdGF4aW5nIGVzcGVjaWFsbHkgd2hlbiBib3Ro
IGFyZSBzbyBkaWZmZXJlbnQuCj4KPlRoYW5rIHlvdSBhbGwgZm9yIHRoZSB2YWx1YWJsZSBmZWVk
YmFjayEKPgo+PiBJIGFncmVlLCBJIGp1c3Qgd2FudGVkIG1vcmUgZGV0YWlscyB0aGFuICJ2YXJp
YW50IG9mIHRoZQo+PiBTeW5vcHN5cyBEZXNpZ25XYXJlIEhETUkgVFggY29udHJvbGxlciIsIGlm
IHRoZSByZWdpc3RlciBtYXBwaW5nIGlzIDEwMCUKPj4gZGlmZmVyZW50LCBhbmQgZG9lcyBub3Qg
bWF0Y2ggYXQgYWxsIHdpdGggdGhlIG9sZCBJUCwgdGhlbiBpdCdzIGluZGVlZCB0aW1lCj4+IHRv
IG1ha2UgYSBicmFuZCBuZXcgZHJpdmVyLCBidXQgaW5zdGVhZCBvZiBkb2luZyBhIG1peCB1cCwg
aXQncyB0aW1lIHRvCj4+IGV4dHJhY3QKPj4gdGhlIGR3LWhkbWkgY29kZSB0aGF0IGNvdWxkIGJl
IGNvbW1vbiBoZWxwZXJzIGludG8gYSBkdy1oZG1pLWNvbW1vbiBtb2R1bGUKPj4gYW5kIHVzZSB0
aGVtLgo+Cj5Tb3VuZHMgZ29vZCwgd2lsbCBoYW5kbGUgdGhpcyBpbiB2Mi4KPgo+PiBBcyBJIHNl
ZSwgbm8gImRyaXZlciIgY29kZSBjYW4gYmUgc2hhcmVkLCBvbmx5IERSTSBwbHVtYmluZ3MsIHNv
IHBlcmhhcHMKPj4gdGhvc2UKPj4gcGx1bWJpbmcgY29kZSBzaG91bGQgZ28gaW50byB0aGUgRFJN
IGNvcmUgPwo+PiAKPj4gSW4gYW55IGNhc2UsIHBsZWFzZSBhZGQgbW9yZSBkZXRhaWxzIG9uIHRo
ZSBjb3ZlciBsZXR0ZXIsIGluY2x1ZGluZyB0aGUKPj4gZGV0YWlsZWQKPj4gSFcgZGlmZmVycmVu
Y2UgYW5kIHRoZSBkZXNpZ24geW91IGNob3NlIHNvIHN1cHBvcnQgdGhpcyBuZXcgSVAuCj4KPkFu
ZHksIGNvdWxkIHlvdSBwbGVhc2UgaGVscCB3aXRoIGEgc3VtbWFyeSBvZiB0aGUgSFcgY2hhbmdl
cz8KPlRoZSBpbmZvcm1hdGlvbiBJIGNvdWxkIHByb3ZpZGUgaXMgcmF0aGVyIGxpbWl0ZWQsIHNp
bmNlIEkgZG9uJ3QgaGF2ZQo+YWNjZXNzIHRvIGFueSBEVyBJUCBkYXRhc2hlZXRzIGFuZCBJJ20g
YWxzbyBub3QgZmFtaWxpYXIgZW5vdWdoIHdpdGggdGhlCj5vbGQgdmFyaWFudC4KPgogQWNjdXJh
dGVseSwgd2Ugc2hvdWxkIHJlZmVyIHRvIGl0IGFzIGFuIGVudGlyZWx5IG5ldyBJUO+8jGl0IGhh
cyBub3RoaW5nIGluIGNvbW1vbiB3aXRoCnRoZSBjdXJyZW50IG1haW5saW5lIGR3LWhkbWnjgIIg
VGhlIG9ubHkgIGNvbW1vbmFsaXR5IGlzIHRoYXQgdGhleSBib3RoIGNvbWUgZnJvbQpTeW5vcHN5
cyBEZXNpZ25XYXJl77yaCu+8iDHvvIlJdCBoYXMgYSAxMDAlIGRpZmZlcmVudCByZWdpc3RlciBt
YXBwaW5nCu+8iDLvvIlJdCBzdXBwb3J0cyBGUkwgYW5kIERTQyAK77yIM++8iWRpZmZlcmVudCBj
b25maWd1cmF0aW9uIGZsb3cgaW4gbWFueSBwbGFjZXPjgIIKClNvIEkgaGF2ZSB0aGUgc2FtZSBm
ZWVsaW5nIHdpdGggSGVpa28gYW5kIE1heGltZe+8mgpUaGUgRFdfSERNSV9RUCBzaG91bGQgaGF2
ZSBhICBzZXBhcmF0ZSBkcml2ZXIgYW5kIHdpdGggaXQncyAgb3duIENPTkZJRyAgc3VjaCBhcyBE
Uk1fRFdfSERNSV9RUCAgaW4gS2NvbmZpZy4KYW5kIHRoZSByb2NrY2hpcCBwYXJ0IHNob3VsZCBh
bHNvIGJlIHNwbGl0IGZyb20gZHdfaGRtaS1yb2NrY2hpcC5jLiAgCkkgYW0gc29ycnkgd2UgbWl4
ZWQgdGhlbSBpbiBkd19oZG1pLXJvY2tjaGlwLmMgd2hlbiB3ZSBkZXZlbG9wIHRoZSBic3AgZHJp
dmVy77yMYnV0IHdlIHJlYWxseSByZWdyZXR0ZWQgdGhpcyBkZWNpc2lvbgp3aGVuICB3ZSByZXBl
YXRlZGx5IGJyb2tlIGNvbXBhdGliaWxpdHkgd2l0aCBkdy1oZG1pIG9uIG90aGVyIHNvY3PjgIIg
CgoKCj4+IE5laWwKPj4gCj4+Pgo+Pj4gU3lub3BzaXMgYWxzbyBjcmVhdGVkIGEgbmV3IGRzaSBj
b250cm9sbGVyIGZvciB0aGUgRFNJMiBzdGFuZGFyZCwgd2l0aAo+Pj4gYSB2YXN0bHkgZGlmZmVy
ZW50IHJlZ2lzdGVycyBsYXlvdXQuCj4+Pgo+Pj4gSSBndWVzcyBhdCBzb21lIHBvaW50IHRoZXJl
IGlzIHRpbWUgdG8gc2F5IHRoaXMgcmVhbGx5IGlzIGEgbmV3IElQIDstKSAuCj4+Pgo+Pj4KPj4+
IFRob3VnaCB3aGlsZSBvbiB0aGF0IHRob3VnaHQsIEkgZG9uJ3QgZnVsbHkgdW5kZXJzdGFuZCB3
aHkgYm90aCBhCj4+PiBjb21waWxlZAo+Pj4gdW5kZXIgdGhlIGR3X2hkbWkga2NvbmZpZyBzeW1i
b2wuIFBlb3BsZSBnb2luZyBmb3IgYSBtaW5pbWFsIGtlcm5lbCBtaWdodAo+Pj4gd2FudCBvbmUg
b3IgdGhlIG90aGVyLCBidXQgbm90IGJvdGggZm9yIHRoZWlyIHNwZWNpZmljIGJvYXJkLgo+Cj5J
bmRlZWQsIGl0IG1ha2VzIHNlbnNlIHRvIGhhdmUgYSBkZWRpY2F0ZWQgS2NvbmZpZyBvcHRpb24u
IFRoaXMgaXMKPm1vc3RseSBhIGxlZnRvdmVyIGZyb20gZG93bnN0cmVhbSBpbXBsZW1lbnRhdGlv
biwgd2lsbCBmaXggaW4gdjIuCj4KPlRoYW5rcyBhZ2FpbiwKPkNyaXN0aWFuCj4KPl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj5saW51eC1hcm0ta2VybmVs
IG1haWxpbmcgbGlzdAo+bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj5odHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK

