Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CE076273
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FB46ECE9;
	Fri, 26 Jul 2019 09:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F5189C61
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 15:26:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id D9BD968B02; Thu, 25 Jul 2019 17:26:49 +0200 (CEST)
Date: Thu, 25 Jul 2019 17:26:49 +0200
From: Torsten Duwe <duwe@lst.de>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v3 5/7] drm/bridge: Add Analogix anx6345 support
Message-ID: <20190725152649.GB4820@lst.de>
References: <20190722151154.8344568BFE@verein.lst.de>
 <CA+E=qVeSjE1i-ngJWv=GTQDM6HL-VEZWjXH_p_BXy+eP7SvWhg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+E=qVeSjE1i-ngJWv=GTQDM6HL-VEZWjXH_p_BXy+eP7SvWhg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTE6NDk6NDhBTSAtMDcwMCwgVmFzaWx5IEtob3J1emhp
Y2sgd3JvdGU6Cj4gT24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgODoxMSBBTSBUb3JzdGVuIER1d2Ug
PGR1d2VAbHN0LmRlPiB3cm90ZToKPiA+Cj4gPiArbW9kdWxlX2kyY19kcml2ZXIoYW54NjM0NV9k
cml2ZXIpOwo+ID4gKwo+ID4gK01PRFVMRV9ERVNDUklQVElPTigiQU5YNjM0NSBlRFAgVHJhbnNt
aXR0ZXIgZHJpdmVyIik7Cj4gPiArTU9EVUxFX0FVVEhPUigiRW5yaWMgQmFsbGV0Ym8gaSBTZXJy
YSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4iKTsKPiAKPiBJIGJlbGlldmUgSWNlbm93
eSBpcyB0aGUgYXV0aG9yIG9mIHRoaXMgZHJpdmVyLiBJZiB5b3UgdGhpbmsgb3RoZXJ3aXNlCj4g
cGxlYXNlIGFkZCBFbnJpYyB0byBDQyBhbmQgZ2V0IGhpcyBTaWduZWQtb2ZmLWJ5LgoKVGhpcyBo
YXMgYWxyZWFkeSBiZWVuIHF1ZXN0aW9uZWQsIGFuZCBjb25zZXF1ZW50bHkgSSBoYWQgYSBjbG9z
ZXIgbG9vay4KSWNlbm93eSBkaWQgdGhlIHdvcmsgb2YgZmluZGluZyBhbmQgc3BsaXR0aW5nIHRo
ZSBjb21tb24gcGFydHMsIGFuZCBjb3BpZWQKYW5kIG1vZGlmaWVkIHRob3NlIHRoYXQgbmVlZGVk
IGFkYXB0aW9uLgoKUGxlYXNlIHJlYWQgdGhlIGNoYW5nZSBsb2cocykgaW4gdGhlIGNvdmVyIGxl
dHRlcihzKS4KCkkgZ3Vlc3MgRW5yaWMgYWxyZWFkeSBkaWQgc2lnbiBvZmYgaGlzIGNvZGUsIHdo
aWNoIG9ubHkgZ290IG1vdmVkLCBjb3BpZWQKYW5kIG1vZGlmaWVkLgoKCVRvcnN0ZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
