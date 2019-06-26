Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8AF5644A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367F86E2FD;
	Wed, 26 Jun 2019 08:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132326E294
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 06:50:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 2DC2D285638
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Emil Velikov <emil.velikov@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
References: <cover.1561452052.git.andrzej.p@collabora.com>
 <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
 <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
 <20190625133639.GA16031@arch-x1c3>
 <20190625140755.GT12905@phenom.ffwll.local>
 <20190625141032.5jiy2oekb3olaejd@shell.armlinux.org.uk>
 <20190625142031.GV12905@phenom.ffwll.local>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
Date: Wed, 26 Jun 2019 08:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190625142031.GV12905@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VyBkbml1IDI1LjA2LjIwMTkgb8KgMTY6MjAsIERhbmllbCBWZXR0ZXIgcGlzemU6Cj4gT24gVHVl
LCBKdW4gMjUsIDIwMTkgYXQgMDM6MTA6MzJQTSArMDEwMCwgUnVzc2VsbCBLaW5nIC0gQVJNIExp
bnV4IGFkbWluIHdyb3RlOgo+PiBPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAwNDowNzo1NVBNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4gT3RoZXJ3aXNlIEkgbGlrZSB0aGlzLiBCaWdn
ZXN0IHByb2JsZW0gSSdtIHNlZWluZyBoZXJlIGlzIHJvbGxpbmcgdGhpcyBvdXQKPj4+IGV2ZXJ5
d2hlcmUsIHRoaXMgaXMgYSBsb3Qgb2Ygd29yay4gQW5kIHdpdGhvdXQgd2lkZXNwcmVhZCBhZG9w
dGlvbnMgaXQncwo+Pj4gbm90IHRlcnJpYmx5IHVzZWZ1bCBmb3IgdXNlcnNwYWNlLgo+Pgo+PiBU
aGVyZSB3aWxsIGJlIGNhc2VzIHdoZXJlIGl0J3Mgbm90IHBvc3NpYmxlLCBiZWNhdXNlIHRoZSBJ
MkMgYnVzIGlzCj4+IGhpZGRlbiBiZWhpbmQgYSBjaGlwIHRoYXQgZG9lc24ndCBnaXZlIHlvdSBk
aXJlY3QgYWNjZXNzIHRvIHRoZSBEREMKPj4gYnVzLgo+IAo+IE9oIHN1cmUsIHBsdXMgbG90cyBv
ZiBjb25uZWN0b3JzIHdoZXJlIHRoZXJlJ3MganVzdCBub3QgZGRjIGJ1cyBhdCBhbGwuCj4gQnV0
IGlmIHdlIG9ubHkgcm9sbCB0aGlzIG91dCBmb3IgYSBoYW5kZnVsIG9mIGRyaXZlcnMgaXQncyBh
bHNvIG5vdCBncmVhdCwKPiB0aGF0J3Mgd2hhdCBJIG1lYW50LiBMb29raW5nIGF0Cj4gCj4gJCBn
aXQgZ3JlcCBkcm1fZG9fZ2V0X2VkaWQKPiAKPiB0aGVyZSdzIG9ubHkgdmVyeSBmZXcgZHJpdmVy
cyB3aGVyZSB0aGUgZGRjIGJ1cyBpcyBoaWRkZW4uIFRoZXJlJ3MgYSBsb3QKPiBtb3JlIHdoZXJl
IGl0J3Mgbm90LCBhbmQgSSB0aGluayBhIGJpZyBzZXJpZXMgdG8gdGFja2xlIHRob3NlIHdvdWxk
IHNlcnZlCj4gZXh0cmVtZWx5IHdlbGwgdG8gbWFrZSBhIGNhc2UgZm9yIHRoaXMgc3lzZnMgbGlu
ay4KPiAtRGFuaWVsCj4gCgpJIHdpbGwgcmVzcG9uZCB3aXRoIGEgdjMgdGhlbiwgaW5jbHVkaW5n
IGFzIG1hbnkgZHJpdmVycyBhcyBwb3NzaWJsZS4KVGhvc2Ugd2lsbCBiZSBjb21waWxlLXRlc3Rl
ZCBvbmx5LCB0aG91Z2guCgpBbmRyemVqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
