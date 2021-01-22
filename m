Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA7230143E
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F816E933;
	Sat, 23 Jan 2021 09:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B11D6E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 09:42:11 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1l2sxF-0004I2-N8; Fri, 22 Jan 2021 10:42:09 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ore@pengutronix.de>)
 id 1l2sxD-00030e-QC; Fri, 22 Jan 2021 10:42:07 +0100
Date: Fri, 22 Jan 2021 10:42:07 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 6/7] ARM: dts: imx6dl-prtvt7: fix PWM cell count for
 the backlight node.
Message-ID: <20210122094207.w2upvl5k5sad7u7p@pengutronix.de>
References: <20210121061141.23062-1-o.rempel@pengutronix.de>
 <20210121061141.23062-7-o.rempel@pengutronix.de>
 <CAOMZO5C6RM2vEMFJB-+Nen1Et8wn39JJVM1UcOcar0aMebKykQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5C6RM2vEMFJB-+Nen1Et8wn39JJVM1UcOcar0aMebKykQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:40:47 up 50 days, 23:47, 29 users,  load average: 0.09, 0.07, 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Robin van der Gracht <robin@protonic.nl>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMjEsIDIwMjEgYXQgMTE6MTc6NDJBTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToKPiBIaSBPbGVrc2lqLAo+IAo+IE9uIFRodSwgSmFuIDIxLCAyMDIxIGF0IDM6MTIgQU0g
T2xla3NpaiBSZW1wZWwgPG8ucmVtcGVsQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+Cj4gPiBB
dCBzb21lIHBvaW50IFBXTSBjZWxsIGNvdW50IHdhcyBjaGFuZ2VkLCBidXQgaXQgZGlkbid0IHRy
aWdnZXJlZCBhbnkKPiAKPiBJdCBjaGFuZ2VkIGluIHRoaXMgY29tbWl0Ogo+IAo+IGNvbW1pdCBm
YTI4ZDgyMTJlZGU5YzUzM2FlODdhNzM3NTcxYTlkM2IzZWViYjI5Cj4gQXV0aG9yOiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IERhdGU6ICAgRnJp
IEp1bCAxMCAwNzoxOTozNyAyMDIwICswMjAwCj4gCj4gICAgIEFSTTogZHRzOiBpbXg6IGRlZmF1
bHQgdG8gI3B3bS1jZWxscyA9IDwzPiBpbiB0aGUgU29DIGR0c2kgZmlsZXMKPiAKPiAgICAgVGhl
IGlteC1wd20gZHJpdmVyIHN1cHBvcnRzIDMgY2VsbHMgYW5kIHRoaXMgaXMgdGhlIG1vcmUgZmxl
eGlibGUgc2V0dGluZy4KPiAgICAgU28gdXNlIGl0IGJ5IGRlZmF1bHQgYW5kIG92ZXJ3cml0ZSBp
dCBiYWNrIHRvIHR3byBmb3IgdGhlIGZpbGVzIHRoYXQKPiAgICAgcmVmZXJlbmNlIHRoZSBQV01z
IHdpdGgganVzdCAyIGNlbGxzIHRvIG1pbmltaXplIGNoYW5nZXMuCj4gCj4gICAgIFRoaXMgYWxs
b3dzIHRvIGRyb3AgZXhwbGljaXQgc2V0dGluZyB0byAzIGNlbGxzIGZvciB0aGUgYm9hcmRzIHRo
YXQgYWxyZWFkeQo+ICAgICBkZXBlbmQgb24gdGhpcy4gVGhlIGJvYXJkcyB0aGF0IGFyZSBub3cg
dXNpbmcgMiBjZWxscyBleHBsaWNpdGx5IGNhbiBiZQo+ICAgICBjb252ZXJ0ZWQgdG8gMyBpbmRp
dmlkdWFsbHkuCj4gCj4gICAgIFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IFNoYXduIEd1
byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KCk9LLCBuaWNlLiBUaHghCgpTaG91bGQgSSByZXNlbmQg
dGhpcyBzZXJpZXMgd2l0aG91dCB0aGlzIHBhdGNoPwoKUmVnYXJkcywKT2xla3NpagotLSAKUGVu
Z3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAg
IHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFu
eSAgICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dl
cmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIw
NjkxNy01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
