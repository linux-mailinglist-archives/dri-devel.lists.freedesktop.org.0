Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1EF9EB130
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 13:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315D710E076;
	Tue, 10 Dec 2024 12:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="CvozP1XJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B61610E076
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 12:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=nw/CxItkTnCd0XnlMACUyCY4DU5/yrHaEShv6qcL0LQ=; b=C
 vozP1XJLUbudLGiQHIMaho1wOOeqDo/imAVQUh8/zcrpsdMvRwukD+KnHoXezWlX
 binZcnTdeEUv6DCCZ8xCnGMuiaDunznjdabiidjqcn6JwTiHyYP0Poqy7G8d7yuP
 /yGWiZC187PcU1htJkiXsm0GXj97U48L90+Zmybaa4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-102 (Coremail) ; Tue, 10 Dec 2024 20:48:12 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 10 Dec 2024 20:48:12 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 "Daniel Semkowicz" <dse@thaumatec.com>, 
 "Diederik de Haas" <didi.debian@cknow.org>, andy.yan@rock-chips.com, 
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, 
 jonas@kwiboo.se, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 neil.armstrong@linaro.org, quentin.schulz@cherry.de, 
 rfoss@kernel.org, robh@kernel.org, tzimmermann@suse.de
Subject: Re:Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <jl5obi7rd4h6ywozeqruxq2vx62sx5yf4wwpksrq3prdleps2k@d3zbr5ttquvn>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <20241209150619.33998-1-dse@thaumatec.com>
 <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org> <2203458.KiezcSG77Q@diego>
 <4e015ea9.960.193ae0c236a.Coremail.andyshrk@163.com>
 <ay5hbnqqjhopaqof6z7j2rzm2bc6xa2vbzan2ak3if6wzmyip2@kqh7gtrajnm2>
 <33e2c5db.1300.193ae284b6d.Coremail.andyshrk@163.com>
 <CAA8EJprLA09NP0KAztc5eoAMkGcrom84jg_pcbNcwN0FAaSLrw@mail.gmail.com>
 <2d68155e.1e5b.193ae4616b9.Coremail.andyshrk@163.com>
 <jl5obi7rd4h6ywozeqruxq2vx62sx5yf4wwpksrq3prdleps2k@d3zbr5ttquvn>
X-NTES-SC: AL_Qu2YAfSYu0Ai5COQbOkZnEobh+Y5UcK2s/ki2YFXN5k0tCTI0SYQW29KGUD2y86DDiKsoAirUQVL5MpFRpJHY45QxyzaS0hvthPy8V40pXsw
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <78e7b8e.b5ee.193b09ce46d.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZigvCgD3f7eMOFhn7N07AA--.52128W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMxWxXmdYMSCOHwABs3
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

CkhpIEFsbCwK5ZyoIDIwMjQtMTItMTAgMjA6MzI6MDPvvIwiRG1pdHJ5IEJhcnlzaGtvdiIgPGRt
aXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4g5YaZ6YGT77yaCj5PbiBUdWUsIERlYyAxMCwgMjAy
NCBhdCAwOTo1NDowOUFNICswODAwLCBBbmR5IFlhbiB3cm90ZToKPj4gCj4+IEhpIERtaXRyeSwK
Pj4gCj4+IOWcqCAyMDI0LTEyLTEwIDA5OjQ1OjEx77yMIkRtaXRyeSBCYXJ5c2hrb3YiIDxkbWl0
cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IOWGmemBk++8mgo+PiA+T24gVHVlLCAxMCBEZWMgMjAy
NCBhdCAwMzoyMiwgQW5keSBZYW4gPGFuZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+PiA+Pgo+PiA+
Pgo+PiA+PiBIaSBEbWl0cnksCj4+ID4+Cj4+ID4+IOWcqCAyMDI0LTEyLTEwIDA5OjAxOjM477yM
IkRtaXRyeSBCYXJ5c2hrb3YiIDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IOWGmemBk++8
mgo+PiA+PiA+T24gVHVlLCBEZWMgMTAsIDIwMjQgYXQgMDg6NTA6NTFBTSArMDgwMCwgQW5keSBZ
YW4gd3JvdGU6Cj4+ID4+ID4+Cj4+ID4+ID4+Cj4+ID4+ID4+IEhpLAo+PiA+PiA+Pgo+PiA+PiA+
PiBBdCAyMDI0LTEyLTEwIDA3OjEyOjI2LCAiSGVpa28gU3TDvGJuZXIiIDxoZWlrb0BzbnRlY2gu
ZGU+IHdyb3RlOgo+PiA+PiA+PiA+QW0gTW9udGFnLCA5LiBEZXplbWJlciAyMDI0LCAxNzoxMTow
MyBDRVQgc2NocmllYiBEaWVkZXJpayBkZSBIYWFzOgo+PiA+PiA+PiA+PiBIaSwKPj4gPj4gPj4g
Pj4KPj4gPj4gPj4gPj4gT24gTW9uIERlYyA5LCAyMDI0IGF0IDQ6MDYgUE0gQ0VULCBEYW5pZWwg
U2Vta293aWN6IHdyb3RlOgo+PiA+PiA+PiA+PiA+IE9uIDAzLjEyLjI0IDIxOjU0LCBIZWlrbyBT
dHVlYm5lciB3cm90ZToKPj4gPj4gPj4gPj4gPiA+IFRoaXMgc2VyaWVzIGFkZHMgYSBicmlkZ2Ug
YW5kIGdsdWUgZHJpdmVyIGZvciB0aGUgRFNJMiBjb250cm9sbGVyIGZvdW5kCj4+ID4+ID4+ID4+
ID4gPiBpbiB0aGUgcmszNTg4IHNvYyBmcm9tIFJvY2tjaGlwLCB0aGF0IGlzIGJhc2VkIG9uIGEg
U3lub3BzaXMgSVAgYmxvY2suCj4+ID4+ID4+ID4+ID4gPgo+PiA+PiA+PiA+PiA+Cj4+ID4+ID4+
ID4+ID4gSSBkaWQgbW9yZSB0ZXN0cyB3aXRoIGRpZmZlcmVudCBMVkRTIGRpc3BsYXlzLiBJIHRl
c3RlZCBmb2xsb3dpbmcKPj4gPj4gPj4gPj4gPiBjb25maWd1cmF0aW9ucyB3aXRoIERTSS9MVkRT
IGJyaWRnZToKPj4gPj4gPj4gPj4gPiAtIDEwMjR4NjAwQDYwLjAxCj4+ID4+ID4+ID4+ID4gLSAx
MDI0eDc2OEA2MC4wMgo+PiA+PiA+PiA+PiA+IC0gMTI4MHg4MDBANjAuMDcKPj4gPj4gPj4gPj4g
PiAtIDEzNjZ4NzY4QDYwLjA2Cj4+ID4+ID4+ID4+ID4KPj4gPj4gPj4gPj4gPiBBbGwgb2YgdGhl
bSB3b3JrZWQgd2l0aG91dCBpc3N1ZXMsIGV4Y2VwdCAxMzY2eDc2OC4KPj4gPj4gPj4gPj4gPiBX
aXRoIHRoaXMgcmVzb2x1dGlvbiwgdmlkZW8gaXMgYmx1cnJ5LCBhbmQgb2Zmc2V0IGluY29ycmVj
dGx5Cj4+ID4+ID4+ID4+ID4gdG8gdGhlIGxlZnQuIFRoZXJlIGFyZSBhbHNvIHJlcGVhdGluZyBl
cnJvcnMgb24gdGhlIGNvbnNvbGU6Cj4+ID4+ID4+ID4+ID4KPj4gPj4gPj4gPj4gPiAgIHJvY2tj
aGlwLWRybSBkaXNwbGF5LXN1YnN5c3RlbTogW2RybV0gKkVSUk9SKiBQT1NUX0JVRl9FTVBUWSBp
cnEgZXJyIGF0IHZwMwo+PiA+PiA+PiA+PiA+Cj4+ID4+ID4+ID4+ID4gSW4gY29ycmVjdCBvcGVy
YXRpb24gd2l0aCBvdGhlciByZXNvbHV0aW9ucywgdGhlcmUgaXMgbm8gZXJyb3IuCj4+ID4+ID4+
ID4+ID4gSSBhbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGEgcHJvYmxlbSBpbiB5b3VyIHNlcmllcyBv
ciByYXRoZXIgaW4gVk9QMgo+PiA+PiA+PiA+PiA+IGRyaXZlci4KPj4gPj4gPj4gPgo+PiA+PiA+
PiA+VGhpcyByZWFsbHkgc291bmRzIGxpa2Ugc29tZXRoaW5nIGlzIHdyb25nIG9uIHRoZSB2b3Ag
c2lkZS4KPj4gPj4gPj4gPlRoZSBpbnRlcnJ1cHQgaXMgcGFydCBvZiB0aGUgdm9wLCB0aGUgZGl2
aXNhYmxlIGJ5IDQgdGhpbmdzIGxpa2VseSB0b28uCj4+ID4+ID4+Cj4+ID4+ID4+IFRoaXMgaXMg
YSBoYXJkd2FyZSBsaW1pdGF0aW9uIG9uIHZvcCBzaWRlOgo+PiA+PiA+PiBUaGUgaG9yaXpvbnRh
bCByZXNvbHV0aW9uIG11c3QgYmUgNCBwaXhlbCBhbGlnbmVkLgo+PiA+PiA+Cj4+ID4+ID5UaGVu
IG1vZGVfdmFsaWQoKSBhbmQgYXRvbWljX2NoZWNrKCkgbXVzdCByZWplY3QgbW9kZXMgdGhhdCBk
b24ndCBmaXQuCj4+ID4+Cj4+ID4+IFdlIHJvdW5kIGRvd24gdG8gNCBwaXhlbCBhbGlnbmVkIGlu
IG1vZGVfZml4dXAgaW4gb3VyIGJzcCBrZXJuZWwsCj4+ID4KPj4gPldoYXQgaXMgbWVhbnQgYnkg
dGhlICJic3Aga2VybmVsIiBoZXJlPyBJIGRvbid0IHNlZSBpdCBiZWluZyBwcmVzZW50Cj4+IAo+
PiBic3Aga2VybmVsIG1lYW5zIGRvd25zdHJlYW0gdmVuZG9yIGtlcm5lbC4KPj4gCj4+ID5pbiB0
aGUgbWFpbmxpbmUga2VybmVsLiBTbywgaWYgdGhlIG1vZGUgaXMgdW5zdXBwb3J0ZWQsIGl0IHNo
b3VsZCBiZQo+PiAKPj4gV2lsbCBpdCBiZSBhY2NlcHRhYmxlIHRvIGFkZCB0aGlzIHJvdW5kIGRv
d24gaW4gdGhlIG1haW5saW5lIG1vZGVfZml4dXA/Cj4KPkkgdGhpbmsgc28uCgpUaGVuIEkgY2Fu
IHdyaXRlIGEgcGF0Y2ggZm9yIGl0LgoKPgo+PiAKPj4gPnJlamVjdGVkLgo+PiA+Cj4+ID4+IGJl
Y2F1c2Ugc29tZXRpbWVzLCBzb21lIGJvYXJkcyBkbyBpbmRlZWQgY2hvb3NlIGEgc2NyZWVuIHRo
YXQgaXMgbm90IDQgcGl4ZWwgYWxpZ25lZAo+Cj4tLSAKPldpdGggYmVzdCB3aXNoZXMKPkRtaXRy
eQo=
