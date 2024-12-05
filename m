Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9A99E55DC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 13:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44C110EE4C;
	Thu,  5 Dec 2024 12:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="j7RbPjAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5AB3C10EE4C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=DxzuJ+PBFBTjnuUJMTNyiYZFtvZ7pwkUk2OsNljH+Rw=; b=j
 7RbPjABJaEEtc0yrG1mU6Sn04lAI389ddLLpuWyGuwdIuaCalEyEMiH5SEeBpRRB
 7TegI8igKwhMtSpngF2S+wiYiWD54zZX3j1A+IExXJOJOuEstS2QC2WETW0ovIC9
 JyJgR87YZ+gEYyaQ2GDwBuSD28QIi2KbVhKbiF877E=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Thu, 5 Dec 2024 20:53:25 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 5 Dec 2024 20:53:25 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Piotr Zalewski" <pZ010001011111@proton.me>, 
 skhan@linuxfoundation.org, "Daniel Stone" <daniel@fooishbar.org>, 
 "Dragan Simic" <dsimic@manjaro.org>, 
 "Diederik de Haas" <didi.debian@cknow.org>
Subject: Re:Re: [PATCH v7] rockchip/drm: vop2: add support for gamma LUT
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <12938960.VsHLxoZxqI@diego>
References: <20241101185545.559090-3-pZ010001011111@proton.me>
 <9Rp0NJW2QG5qDduowVaialZWN6xTe9KJFciu7Q2LERJZQXsUgFvMGXfcFaNznIEJEBpZeOdZPuL4fxOEFduaSJLuQJ3cIvN-fx2lEzYSBKE=@proton.me>
 <12938960.VsHLxoZxqI@diego>
X-NTES-SC: AL_Qu2YAfibvEor4ySfYelS8zNM9K56MKvt5LljqcQFePgqqTHL3g4cZnlBM0vW6uLuhrF9Zm4giOWgVo9pwXcb
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7877dddf.b3b8.19396e1df66.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: digvCgD3nw5HolFn1Sw4AA--.49949W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gOsXmdRnDbFCQACsx
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

CkhpIFBpb3RyLAoKQXQgMjAyNC0xMi0wNSAxNjo1NDowOSwgIkhlaWtvIFN0w7xibmVyIiA8aGVp
a29Ac250ZWNoLmRlPiB3cm90ZToKPkhpIFBpb3RyLAo+Cj5BbSBNaXR0d29jaCwgNC4gRGV6ZW1i
ZXIgMjAyNCwgMTY6NDU6MjEgQ0VUIHNjaHJpZWIgUGlvdHIgWmFsZXdza2k6Cj4+IEkganVzdCBu
b3RpY2VkIHRoYXQgYWZ0ZXIgY29taW5nIG91dCBvZiBzdXNwZW5kIGdhbW1hIExVVCBpcyBsb3N0
IGFuZCBtdXN0Cj4+IGJlIHJld3JpdHRlbiBieSB1c2Vyc3BhY2UuCj4+IAo+PiBTbyBJIGd1ZXNz
IGl0IHdpbGwgYmUgbmVlZGVkIHRvIHNhdmUgTFVUIHRvIGEgYnVmZmVyIGFuZCByZXdyaXRlIGl0
IGFmdGVyCj4+IGdvaW5nIG91dCBvZiBzdXNwZW5kIGR1cmluZyBtb2Rlc2V0Pwo+Cj5Nb3N0IGxp
a2VseSAuLi4gdGhlIG9sZCB2b3AgZG9lcyB0aGlzIGFscmVhZHkgdG9vLCBzbyBJIGd1ZXNzIHlv
dSBjYW4KPmdldCBpbnNwaXJhdGlvbiBmcm9tIHRoZXJlLiAoZ2FtbWFfc2V0IGNhbGwgaW4gdm9w
X2NydGNfYXRvbWljX2VuYWJsZSgpKQoKSSBndWVzcyBpdCByZXR1cm5lZCBiZWNhdXNlIGNydGNf
c3RhdGUtPmNvbG9yX21nbXRfY2hhbmdlZCBpcyBmYWxzZSB3aGVuIGNhbGxlZCBmcm9tIAp2b3Ay
X2NydGNfYXRvbWljX2VuYWJsZSBmcm9tIHMyci4KCgpzdGF0aWMgdm9pZCB2b3AyX2NydGNfYXRv
bWljX3RyeV9zZXRfZ2FtbWEoc3RydWN0IHZvcDIgKnZvcDIsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm9wMl92aWRlb19wb3J0ICp2cCwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fY3J0YyAqY3J0
YywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1f
Y3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkKewogICAgICAgIGlmICghdm9wMi0+bHV0X3JlZ3MgfHwg
IWNydGNfc3RhdGUtPmNvbG9yX21nbXRfY2hhbmdlZCkKICAgICAgICAgICAgICAgIHJldHVybjsK
CiAgICAgICAgaWYgKCFjcnRjX3N0YXRlLT5nYW1tYV9sdXQpIHsKICAgICAgICAgICAgICAgIHZv
cDJfdnBfZHNwX2x1dF9kaXNhYmxlKHZwKTsKICAgICAgICAgICAgICAgIHJldHVybjsKICAgICAg
ICB9CgogICAgICAgIGlmICh2b3AyX3N1cHBvcnRzX3NlYW1sZXNzX2dhbW1hX2x1dF91cGRhdGUo
dm9wMikpCiAgICAgICAgICAgICAgICB2b3AyX2NydGNfYXRvbWljX3NldF9nYW1tYV9zZWFtbGVz
cyh2b3AyLCB2cCwgY3J0Yyk7CiAgICAgICAgZWxzZQogICAgICAgICAgICAgICAgdm9wMl9jcnRj
X2F0b21pY19zZXRfZ2FtbWFfcmszNTZ4KHZvcDIsIHZwLCBjcnRjKTsKfQo+Cj4+IEkgY2hlY2tl
ZCB0aGUgcGF0Y2ggaXNuJ3QgeWV0IGluIHRoZSAib2ZmaWNpYWwiIGxpbnV4LW5leHQuCj4KPlRo
ZSBwYXRjaCBpcyBpbiBkcm0tbWlzYy1uZXh0Ogo+aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RybS9taXNjL2tlcm5lbC8tL2NvbW1pdC80ZjUzNzc3NjM0MGRhYjJiNjgwYTRkODU1NDU2
N2Y2ODg0MjQwZDBiCj4KPnNvIHNob3VsZCB0dXJuIHVwIGluIGxpbnV4LW5leHQgYXQgc29tZSBw
b2ludC4gVGhpcyBhbHNvIG1lYW5zLCBwbGVhc2UKPnByb3ZpZGUgYSBmb2xsb3ctdXAgcGF0Y2gg
Zm9yIHRoZSBzdXNwZW5kIGhhbmRsaW5nLgo+Cj5UaGFua3MgYSBsb3QKPkhlaWtvCj4K
