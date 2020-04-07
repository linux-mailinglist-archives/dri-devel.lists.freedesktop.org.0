Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D531A0C6B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 13:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2DA6E82A;
	Tue,  7 Apr 2020 11:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200DD6E82A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M0IlIcVlaw7j87dHRxbQqCUdIjGoot8sVfGM/g8WtWA=; b=tEINKK7xJVGHSuM0jY5yJ4YJox
 YcBcdfcqXNWphBC+ZXHWnafFujnNwuuouboCvqaKKVhWUbemZRZTbaLToxqJvTTYzpn92wIkut0mS
 jxF97BCSuRFUl4sj47il8/ZvlKJovHMIxk6Q5ku9U8C3clUQsIWUWZJ6GiS+Q5hApUmr7P0HTARhU
 /vQZOuVsoPyW04XllxG/082wMMJwCwPg11wyf0XfQ7ceEIj/r9CfMswcmB9W+jJ7e4dTqiH1ZfMw3
 771+pC8tW+A1q4YqBgFNpj8ZR/6bggsyMeVyY9zgc50dJ19WYtjSav2kVLN+rDg0iqIZ/LpMDbcPj
 yqvDQaAw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52528
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jLm0B-0001FA-T1; Tue, 07 Apr 2020 13:02:43 +0200
Subject: Re: [PATCH 00/10] Set up generic fbdev after registering device
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul@crapouillou.net, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sean@poorly.run, hdegoede@redhat.com, kraxel@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, yc_chen@aspeedtech.com,
 tiantao6@hisilicon.com
References: <20200406134405.6232-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <879068d4-3920-b8ee-2a3c-6cd4fe9d9f88@tronnes.org>
Date: Tue, 7 Apr 2020 13:02:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406134405.6232-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDYuMDQuMjAyMCAxNS40Mywgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gR2VuZXJp
YyBmYmRldiBlbXVsYXRpb24gaXMgYSBEUk0gY2xpZW50LiBJZiBwb3NzaWJsZSwgaXQgc2hvdWxk
IGJlaGF2ZQo+IGxpa2UgdXNlcnNwYWNlIGNsaWVudHMuIFRoZXJlZm9yZSBpdCBzaG91bGQgbm90
IHJ1biBiZWZvcmUgdGhlIGRyaXZlcgo+IHJlZ2lzdGVyZWQgdGhlIG5ldyBEUk0gZGV2aWNlLiBJ
ZiB0aGUgc2V0dXAgZnVuY3Rpb24gZmFpbHMsIHRoZSBkcml2ZXIKPiBzaG91bGQgbm90IHJlcG9y
dCBhbiBlcnJvci4KPiAKPiBUaGlzIGlzIGEgZm9sbG93LXVwIHBhdGNoc2V0IHRvIHRoZSBkaXNj
dXNzaW9uIGF0IFsxXS4gIEkgd2VudAo+IHRocm91Z2ggYWxsIGNhbGxzIHRvIGRybV9mYmRldl9n
ZW5lcmljX3NldHVwKCksIG1vdmVkIHRoZW0gdG8gdGhlCj4gZmluYWwgb3BlcmF0aW9uIG9mIHRo
ZWlyIGRyaXZlcidzIHByb2JlIGZ1bmN0aW9uLCBhbmQgcmVtb3ZlZCB0aGUKPiByZXR1cm4gdmFs
dWUuCj4gCj4gQnVpbHQtdGVzdGVkIG9uIHg4Ni02NCwgYWFyY2g2NCBhbmQgYXJtLgo+IAo+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMDA0MDMxMzU4MjguMjU0Mjc3
MC0xLWRhbmllbC52ZXR0ZXJAZmZ3bGwuY2gvVC8jbTIxNmI1YjM3YWVlYjdiMjhkNTVhZDczYjdh
NzAyYjNkMWQ3YmY4NjcKPiAKClRoYW5rcyBmb3IgZG9pbmcgdGhpcywgc2VyaWVzIGlzOgoKUmV2
aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgoKV2l0aCBzbyBt
YW55IGRyaXZlcnMgdXNpbmcgZ2VuZXJpYyBmYmRldiBJIHdvbmRlcmVkIGlmIHdlIGNvdWxkIG1h
a2UgaXQKdGhlIGRlZmF1bHQgYW5kIGxldCBEUk0gY29yZSBoYW5kbGUgaXQgKHdvdWxkIHB1bGwg
ZHJtX2ZiX2hlbHBlciBpbnRvCmRybS5rbykuCgpTb21ldGhpbmcgbGlrZSB0aGlzIGF0IHRoZSBl
bmQgb2YgZHJtX2Rldl9yZWdpc3RlcigpOgoKaWYgKCFkZXYtPmZiX2hlbHBlcikKCWRybV9mYmRl
dl9nZW5lcmljX3NldHVwKGRldiwgMCk7CgpBRkFJQ1MgYWxsIGRyaXZlcnMgdGhhdCBkb24ndCB1
c2UgZ2VuZXJpYyBmYmRldiwgZG8gZmJkZXYgc2V0dXAgYmVmb3JlCmNhbGxpbmcgZHJtX2Rldl9y
ZWdpc3RlcigpIGV4Y2VwdCBtc20gc28gdGhhdCB3b3VsZCBuZWVkIHNvbWUKYWRqdXN0bWVudCwg
Y2FsbGluZyBkcm1fZmJfaGVscGVyX2luaXQoKSBiZWZvcmUgZHJtX2Rldl9yZWdpc3RlcigpIHdv
dWxkIGRvLgoKT25lIG1pc3NpbmcgcGllY2UgaXMgZm9yIGRyaXZlcnMgKGxpa2UgdmM0KSB0aGF0
IHVzZXMgMTYgYnBwIG9uIGZiZGV2IHRvCnNhdmUgb24gbWVtb3J5LCBub3Qgc3VyZSBob3cgdGhh
dCBzaG91bGQgYmUgaGFuZGxlZCwgYW4gb3B0aW9uYWwKZHJtX21vZGVfY29uZmlnLT5mYmRldl9i
cHAgbWF5YmUuCgpIYXZpbmcgRFJNIGNvcmUgdGFrZSBjYXJlIG9mIGZiZGV2IGVtdWxhdGlvbiB3
YXMgYW4gaWRlYSBMYXVyZW50IGhhZAp3aGljaCB3YXMgdGhlIHNwYXJrIHRoYXQgc2V0IG1lIG9m
ZiBtYWtpbmcgdGhlIGdlbmVyaWMgZmJkZXYgZW11bGF0aW9uLgoKTWF5YmUgaXQncyBzdGlsbCB0
b28gZWFybHkgdG8gbWFrZSB0aGlzIG1vdmUsIEkgZG9uJ3Qga25vdy4KCk5vcmFsZi4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
