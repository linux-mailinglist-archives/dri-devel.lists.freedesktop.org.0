Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 119E28B6749
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 03:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FC810EE6F;
	Tue, 30 Apr 2024 01:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 145393 seconds by postgrey-1.36 at gabe;
 Tue, 30 Apr 2024 01:16:17 UTC
Received: from zg8tmty3ljk5ljewns4xndka.icoremail.net
 (zg8tmty3ljk5ljewns4xndka.icoremail.net [167.99.105.149])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2FF3E10EE6F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 01:16:16 +0000 (UTC)
Received: from suijingfeng$bosc.ac.cn ( [219.141.235.82] ) by
 ajax-webmail-mail (Coremail) ; Tue, 30 Apr 2024 09:15:49 +0800 (GMT+08:00)
X-Originating-IP: [219.141.235.82]
Date: Tue, 30 Apr 2024 09:15:49 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6ZqL5pmv5bOw?= <suijingfeng@bosc.ac.cn>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: "Sui Jingfeng" <sui.jingfeng@linux.dev>, 
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, 
 "Thomas Zimmermann" <tzimmermann@suse.de>, 
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, 
 "Douglas Anderson" <dianders@chromium.org>, 
 "Biju Das" <biju.das.jz@bp.renesas.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: Re: drm/debugfs: Drop conditionals around of_node pointers
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.1-cmXT5 build
 20230627(00751abc) Copyright (c) 2002-2024 www.mailtech.cn
 mispb-4edfefde-e422-4ddc-8a36-c3f99eb8cd32-icoremail.net
In-Reply-To: <20240429-enchanted-cooperative-jacamar-cf2902@houat>
References: <20240321222258.1440130-1-sui.jingfeng@linux.dev>
 <caa6fb05-8080-444a-93c3-2d9283ccb74d@bosc.ac.cn>
 <20240429-enchanted-cooperative-jacamar-cf2902@houat>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6db82a3f.c7.18f2c927d9f.Coremail.suijingfeng@bosc.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwD3p9hFRjBmHUEjAA--.593W
X-CM-SenderInfo: xvxlyxpqjiv03j6e02nfoduhdfq/1tbiAQAEAWYvsboF9QABs3
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
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

SGksCgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiTWF4aW1lIFJpcGFy
ZCIgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiDlj5HpgIHml7bpl7Q6IDIwMjQtMDQtMjkgMTk6MzA6
MjQgKOaYn+acn+S4gCkKPiDmlLbku7bkuro6ICJTdWkgSmluZ2ZlbmciIDxzdWlqaW5nZmVuZ0Bi
b3NjLmFjLmNuPgo+IOaKhOmAgTogIlN1aSBKaW5nZmVuZyIgPHN1aS5qaW5nZmVuZ0BsaW51eC5k
ZXY+LCAiTWFhcnRlbiBMYW5raG9yc3QiIDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5j
b20+LCAiVGhvbWFzIFppbW1lcm1hbm4iIDx0emltbWVybWFubkBzdXNlLmRlPiwgIkRhdmlkIEFp
cmxpZSIgPGFpcmxpZWRAZ21haWwuY29tPiwgIkRhbmllbCBWZXR0ZXIiIDxkYW5pZWxAZmZ3bGwu
Y2g+LCAiRG91Z2xhcyBBbmRlcnNvbiIgPGRpYW5kZXJzQGNocm9taXVtLm9yZz4sICJMYXVyZW50
IFBpbmNoYXJ0IiA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+LCAi
QmlqdSBEYXMiIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4sIGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiDkuLvpopg6IFJl
OiBkcm0vZGVidWdmczogRHJvcCBjb25kaXRpb25hbHMgYXJvdW5kIG9mX25vZGUgcG9pbnRlcnMK
PiAKPiBPbiBTdW4sIEFwciAyOCwgMjAyNCBhdCAwNDo1MjoxM1BNICswODAwLCBTdWkgSmluZ2Zl
bmcgd3JvdGU6Cj4gPiBwaW5nCj4gPiAKPiA+IOWcqCAyMDI0LzMvMjIgMDY6MjIsIFN1aSBKaW5n
ZmVuZyDlhpnpgZM6Cj4gPiA+IEhhdmluZyBjb25kaXRpb25hbCBhcm91bmQgdGhlIG9mX25vZGUg
cG9pbnRlciBvZiB0aGUgZHJtX2JyaWRnZSBzdHJ1Y3R1cmUKPiA+ID4gdHVybnMgb3V0IHRvIG1h
a2UgZHJpdmVyIGNvZGUgdXNlIHVnbHkgI2lmZGVmIGJsb2Nrcy4KPiAKPiBUaGUgY29kZSBiZWlu
ZyB1Z2x5IGlzIGFuIG9waW5pb24sIHdoYXQgcHJvYmxlbSBpcyBpdCBjYXVzaW5nIGV4YWN0bHk/
Cj4gCj4gPiBEcm9wIHRoZSBjb25kaXRpb25hbHMgdG8gc2ltcGxpZnkgZGVidWdmcy4KPiAKPiBX
aGF0IGRvZXMgaXQgc2ltcGxpZmllcz8KPiAKPiA+ID4gCj4gPiA+IEZpeGVzOiBkOGRmY2NkZTI3
MDkgKCJkcm0vYnJpZGdlOiBEcm9wIGNvbmRpdGlvbmFscyBhcm91bmQgb2Zfbm9kZSBwb2ludGVy
cyIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFN1aSBKaW5nZmVuZyA8c3VpLmppbmdmZW5nQGxpbnV4
LmRldj4KPiAKPiBXaHkgZG8gd2Ugd2FudCB0byBiYWNrcG9ydCB0aGF0IHBhdGNoIHRvIHN0YWJs
ZT8KCk15IGNvbW1pdCBtZXNzYWdlIGlzIHdyaXR0ZW4gYmFzZWQgb24gY29tbWl0IG9mIGQ4ZGZj
Y2RlMjcwOQoKJCBnaXQgc2hvdyBjOWUzNThkZmM0YTgKICAgIAogICAgVGhpcyBwYXRjaCBpcyBi
YXNlZCBvbiBjb21taXQgYzllMzU4ZGZjNGE4ICgiZHJpdmVyLWNvcmU6IHJlbW92ZQogICAgY29u
ZGl0aW9uYWxzIGFyb3VuZCBkZXZpY2V0cmVlIHBvaW50ZXJzIikuCiAgICAKICAgIEhhdmluZyBj
b25kaXRpb25hbCBhcm91bmQgdGhlIG9mX25vZGUgcG9pbnRlciBvZiB0aGUgZHJtX2JyaWRnZQog
ICAgc3RydWN0dXJlIHR1cm5zIG91dCB0byBtYWtlIGRyaXZlciBjb2RlIHVzZSB1Z2x5ICNpZmRl
ZiBibG9ja3MuIERyb3AgdGhlCiAgICBjb25kaXRpb25hbHMgdG8gc2ltcGxpZnkgZHJpdmVycy4g
V2hpbGUgdGhpcyBzbGlnaHRseSBpbmNyZWFzZXMgdGhlIHNpemUKICAgIG9mIHN0cnVjdCBkcm1f
YnJpZGdlIG9uIG5vbi1PRiBzeXN0ZW0sIHRoZSBudW1iZXIgb2YgYnJpZGdlcyB1c2VkIHRvZGF5
CiAgICBhbmQgZm9yZXNlZW4gdG9tb3Jyb3cgb24gdGhvc2Ugc3lzdGVtcyBpcyB2ZXJ5IGxvdywg
c28gdGhpcyBzaG91bGRuJ3QgYmUKICAgIGFuIGlzc3VlLgogICAgCiAgICBTbyBkcm9wICNpZiBj
b25kaXRpb25hbHMgYnkgYWRkaW5nIHN0cnVjdCBkZXZpY2Vfbm9kZSBmb3J3YXJkIGRlY2xhcmF0
aW9uLgoKPiBNYXhpbWUKCkknbSBqdXN0IHN0YXJ0IHRvIGNvbnRyaWJ1dGUgYnkgbWltaWMgb3Ro
ZXIgcGVvcGxlJ3MgdG9uZSwgdGhlcmUgc2VlbXMgbm8gbmVlZAp0byBvdmVyIHJlYWQu
