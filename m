Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88172B5E2D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 12:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783CC6E1A4;
	Tue, 17 Nov 2020 11:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16146E1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:22:55 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kez4X-0007Gt-Td; Tue, 17 Nov 2020 12:22:53 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kez4X-00088v-L0; Tue, 17 Nov 2020 12:22:53 +0100
Message-ID: <0c6a3ced0012d05bb33bb3ea765de359e480ad4a.camel@pengutronix.de>
Subject: Re: [PATCH 41/42] gpu/ipu-v3/ipu-di: Strip out 2 unused
 'di_sync_config' entries
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Date: Tue, 17 Nov 2020 12:22:53 +0100
In-Reply-To: <20201116174112.1833368-42-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-42-lee.jones@linaro.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLAoKT24gTW9uLCAyMDIwLTExLTE2IGF0IDE3OjQxICswMDAwLCBMZWUgSm9uZXMgd3Jv
dGU6Cj4gVGhleSdyZSB0YWtpbmcgdXAgdG9vIG11Y2ggc3BhY2Ugb24gdGhlIHN0YWNrLgo+IAo+
IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+IAo+ICBk
cml2ZXJzL2dwdS9pcHUtdjMvaXB1LWRpLmM6IEluIGZ1bmN0aW9uIOKAmGlwdV9kaV9zeW5jX2Nv
bmZpZ19ub25pbnRlcmxhY2Vk4oCZOgo+ICBkcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWRpLmM6Mzkx
OjE6IHdhcm5pbmc6IHRoZSBmcmFtZSBzaXplIG9mIDEwNjQgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4g
MTAyNCBieXRlcyBbLVdmcmFtZS1sYXJnZXItdGhhbj1dCj4gCj4gQ2M6IFBoaWxpcHAgWmFiZWwg
PHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5n
dXRyb25peC5kZT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2lwdS12My9pcHUtZGkuYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1kaS5jIGIv
ZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1kaS5jCj4gaW5kZXggYjRhMzFkNTA2ZmNjZi4uZTYxN2Y2
MGFmZWVhMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWRpLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWRpLmMKPiBAQCAtMzEwLDEwICszMTAsNiBAQCBzdGF0
aWMgdm9pZCBpcHVfZGlfc3luY19jb25maWdfbm9uaW50ZXJsYWNlZChzdHJ1Y3QgaXB1X2RpICpk
aSwKPiAgCQkJLyogdW51c2VkICovCj4gIAkJfSAsIHsKPiAgCQkJLyogdW51c2VkICovCj4gLQkJ
fSAsIHsKPiAtCQkJLyogdW51c2VkICovCj4gLQkJfSAsIHsKPiAtCQkJLyogdW51c2VkICovCj4g
IAkJfSwKPiAgCX07Cj4gIAkvKiBjYW4ndCB1c2UgIzcgYW5kICM4IGZvciBsaW5lIGFjdGl2ZSBh
bmQgcGl4ZWwgYWN0aXZlIGNvdW50ZXJzICovCgpUaGFuayB5b3UsIGFwcGxpZWQgdG8gaW14LWRy
bS9uZXh0LgoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
