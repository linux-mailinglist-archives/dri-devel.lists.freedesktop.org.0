Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A017D96F02C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 11:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170EF10E9E3;
	Fri,  6 Sep 2024 09:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="N6FGj/mA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id B981010E9E3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=yXeAZMqnPEUw1nGJDqQeQa/1NXUi1sfFmoPDpYDmFng=; b=N
 6FGj/mAXCrJKUfSF27rqnnZGudV4uz315L8d7iECTQF8BTkxxqogAN+6mOCJanti
 yAps4Kw4THUbfjD3VGnt18q4PbxavzuQJKB6OYePKzRZrFCRu2iccQX2P0eZwdhz
 Ya8l6CiRf3QVvWcuyP527ghR0ZMQjqLLjiiVSgluW4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-129 (Coremail) ; Fri, 6 Sep 2024 17:50:20 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 6 Sep 2024 17:50:20 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Diederik de Haas" <didi.debian@cknow.org>
Cc: "Min-Hua Chen" <minhuadotchen@gmail.com>,
 "Sandy Huang" <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 "Andy Yan" <andy.yan@rock-chips.com>, 
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, 
 "Maxime Ripard" <mripard@kernel.org>, 
 "Thomas Zimmermann" <tzimmermann@suse.de>, 
 "David Airlie" <airlied@gmail.com>, 
 "Daniel Vetter" <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] drm/rockchip: include rockchip_drm_drv.h
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <D3Z3FN6GARPI.197HD3V38X81T@cknow.org>
References: <20240905223852.188355-1-minhuadotchen@gmail.com>
 <6f07603.7f9.191c4c887b1.Coremail.andyshrk@163.com>
 <D3Z3FN6GARPI.197HD3V38X81T@cknow.org>
X-NTES-SC: AL_Qu2ZB/qauUop5iCYZukZnEobh+Y5UcK2s/ki2YFXN5k0mCTU0SYHcVtZP2PS1cyiLhihlDywfDNM9slef49ob7A0xWS+vmLZ6I6POgSZgSD1
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <e4ca4ac.a3fb.191c6bde766.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD3P7tc0NpmWd4jAA--.24907W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gtSXmWX0Naz1wADsG
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

CgpIae+8jApBdCAyMDI0LTA5LTA2IDE3OjI4OjMzLCAiRGllZGVyaWsgZGUgSGFhcyIgPGRpZGku
ZGViaWFuQGNrbm93Lm9yZz4gd3JvdGU6Cj5PbiBGcmkgU2VwIDYsIDIwMjQgYXQgMjo0MiBBTSBD
RVNULCBBbmR5IFlhbiB3cm90ZToKPj4gQXQgMjAyNC0wOS0wNiAwNjozODo1MCwgIk1pbi1IdWEg
Q2hlbiIgPG1pbmh1YWRvdGNoZW5AZ21haWwuY29tPiB3cm90ZToKPj4gPkluY2x1ZGUgcm9ja2No
aXBfZHJtX2Rydi5oIHRvIGZpeCB0aGUgZm9sbG93IHNwYXJzZSB3YXJuaW5nOgo+PiA+Cj4+ID5k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9wMl9yZWcuYzo1MDI6MjQ6IHNwYXJz
ZToKPj4gPndhcm5pbmc6IHN5bWJvbCAndm9wMl9wbGF0Zm9ybV9kcml2ZXInIHdhcyBub3QgZGVj
bGFyZWQuCj4+ID5TaG91bGQgaXQgYmUgc3RhdGljPwo+PiA+Cj4+ID5ObyBmdW5jdGlvbmFsIGNo
YW5nZSBpbnRlbmRlZC4KPj4gPgo+PiA+U2lnbmVkLW9mZi1ieTogTWluLUh1YSBDaGVuIDxtaW5o
dWFkb3RjaGVuQGdtYWlsLmNvbT4KPj4gPi0tLQo+PiA+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9yb2NrY2hpcF92b3AyX3JlZy5jIHwgMSArCj4+ID4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4+ID4KPj4gPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9j
a2NoaXBfdm9wMl9yZWcuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3Ay
X3JlZy5jCj4+ID5pbmRleCAxOGVmYjNmZTFjMDAuLmM2NzhkMWIwZmQ3YyAxMDA2NDQKPj4gPi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3AyX3JlZy5jCj4+ID4rKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9wMl9yZWcuYwo+PiA+QEAgLTE0
LDYgKzE0LDcgQEAKPj4gPiAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgo+PiA+IAo+PiA+ICNp
bmNsdWRlICJyb2NrY2hpcF9kcm1fdm9wMi5oIgo+PiA+KyNpbmNsdWRlICJyb2NrY2hpcF9kcm1f
ZHJ2LmgiCj4+ID4gCj4+Cj4+IFdlIGFscmVhZHkgaGF2ZSBhIHBhdGNoWzBdIGluY2x1ZGUgcm9j
a2NoaXBfZHJtX2Rydi5oIGluIHJvY2tjaGlwX2RybV92b3AyLmgKPj4KPj4gWzBdaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJvY2tjaGlwL3BhdGNoLzIwMjQwOTA0
MTIwMjM4LjM4NTY3ODItMy1hbmR5c2hya0AxNjMuY29tLyAKPgo+TWF5YmUgSSdtIG1pc3Npbmcg
c29tZXRoaW5nLCBidXQgdGhpcyBwYXRjaCBzZWVtcyB0byBmaXggYW4gYWxyZWFkeQo+ZXhpc3Rp
bmcgYnVnICh3aGljaCBzaG91bGQgaGF2ZSBhIEZpeGVzIHRhZz8pLCB3aGljaCBBbmR5IGFsc28g
Zml4ZWQKCj53aGlsZSBpbXBsZW1lbnRpbmcgYSBkaWZmZXJlbnQgKGFuZCB1bnJlbGF0ZWQpIGZl
YXR1cmU/CgoKSW4gZmFjdCwgSSBkb24ndCBrbm93IGhvdyB0byByZXByb2R1Y2UgdGhpcyBjb21w
aWxhdGlvbiBpc3N1ZS4KV2hpbGUgaW1wbGVtZW50aW5nIG15IGZlYXR1cmUsIEkgaGFwcGVuZWQg
dG8gZmluZCB0aGF0IEkgbmVlZCB0byBpbmNsdWRlIHJvY2tjaGlwX2RybV9kcnYuaCBpbiByb2Nr
Y2hpcF9kcm1fdm9wMi5oCgoKCj4KPkNoZWVycywKPiAgRGllZGVyaWsK
