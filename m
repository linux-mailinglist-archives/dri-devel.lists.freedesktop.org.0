Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179BC6BADC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 12:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4824E89CF2;
	Wed, 17 Jul 2019 10:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2497989CF2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 10:59:41 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F142F8034E;
 Wed, 17 Jul 2019 12:59:33 +0200 (CEST)
Date: Wed, 17 Jul 2019 12:59:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/19] drm: drop use of drmp.h in drm-misc
Message-ID: <20190717105932.GA5188@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
 <20190716065022.GA18452@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190716065022.GA18452@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=e1VmrhLkSVZGwi_aLusA:9 a=CjuIK1q_8ugA:10
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Deepak Sharma <deepak.sharma@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Kevin Hilman <khilman@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Robert Tarasov <tutankhamen@chromium.org>, Emil Lundmark <lndmrk@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>, Jyri Sarha <jsarha@ti.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDg6NTA6MjJBTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IENvcGllZCBhbGwgcmVjaXBpZW50cyBvbiB0aGUgY292ZXIgbGV0dGVyLgo+IEFzIHRo
ZSBsaXN0IGlzIGxvbmcgdGhpcyBtYWlsIG1heSBub3QgaGl0IHRoZSBtYWlsaW5nIGxpc3RzLgo+
IAo+IAlTYW0KPiAKPiBPbiBUdWUsIEp1bCAxNiwgMjAxOSBhdCAwODo0MjowMUFNICswMjAwLCBT
YW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIHNldCByZW1vdmVzIGEgZmFyIHNoYXJl
IG9mIHRoZSByZW1haW5pbmcgdXNlcyBvZiBkcm1QLmguCj4gPiBDb21tb24gZm9yIGFsbCBwYXRj
aGVzIGFyZSB0aGF0IHRoZSByZXNwZWN0aXZlIGZpbGVzIGFyZSBtYWludGFpbmVkCj4gPiBpbiBk
cm0tbWlzYy4KPiA+IEFsbCBwYXRjaGVzIGFyZSBpbmRlcGVuZGVudC4KPiA+IAo+ID4gUGF0Y2hl
cyBoYXZlIGFsbCBiZWVuIGJ1aWxkIHRlc3RlZCB3aXRoIHZhcmlvdXMgY29uZmlncyBhbmQgdmFy
aW91cwo+ID4gYXJjaGl0ZWN0dXJlcy4KPiA+IFRoZXJlIGFyZSBsaWtlbHkgaW50cm9kdWNlZCBh
IGZldyBidWlsZCBpc3N1ZXMgdGhhdCByYW5kY29uZmlnCj4gPiBidWlsZCB3aWxsIHJldmVhbCwg
YnV0IGZvciBhbGwgY29uZmlncyBJIGhhdmUgdXNlZCB0aGUgYnVpbGQgd2FzIE9LLgo+ID4gCj4g
PiBUaGlzIHBhdGNoc2V0IGRvZXMgbm90IGNvbmNsdWRlIHRoZSBxdWVzdCB0byBraWxsIGFsbCB1
c2VzCj4gPiBvZiBkcm1QLmgsIGJ1dCBpdCBpcyBhIG1ham9yIHN0ZXAgdG93YXJkcyB0aGUgZ29h
bC4KPiA+IAo+ID4gUGxlYXNlIHJldmlldy9hY2suCj4gPiBJIHBsYW4gdG8gYXBwbHkgdGhlIHBh
dGNoZXMgdG8gZHJtLW1pc2MsIGJ1dCBmZWVsIGZyZWUKPiA+IHRvIGRvIGl0IHlvdXJzZWxmLgo+
ID4gCj4gPiBUaGVyZSB3aWxsIGJlIGNvbmZsaWN0cyB3aXRoIHRoZSBvbmdvaW5nIHdvcmsgb24g
dHRtLCBnZW0gZXRjLgo+ID4gQnV0IGxldCdzIGRlYWwgd2l0aCB0aGUgY29uZmxpY3RzIHdoZW4g
dGhleSBoaXQgdXMgLSBpdAo+ID4gaXMgc2ltcGxlIGNvbmZsaWN0cyBpbiB0aGUgbGlzdCBvZiBp
bmNsdWRlIGZpbGVzLgo+ID4gCj4gPiB2MjoKPiA+IC0gUmVtb3ZlZCBtZXJnZWQgcGF0Y2hlcwo+
ID4gLSBBZGRlZCBhY2sgZnJvbSBFbWlsIFZlbGlrb3YgdG8gdGhlIGZ1bGwgc2VyaWVzCj4gPiAt
IFJlYmFzZWQgb24gdG9wIG9mIGRybS1taXNjLW5leHQKPiA+IC0gSGFuZC1lZGl0ZWQgdGhlIGxp
c3Qgb2YgQ2M6IGFzIGdldF9tYWludGFpbmVyLnBsIGluIHNvbWUKPiA+ICAgY2FzZXMgbG9va3Mg
dXAgdG9vIG11Y2ggcGVvcGxlLCBkdWUgdG8gY3Jvc3Mga2VybmVsIGNvbW1pdHMKCkkgaGF2ZSBj
b2xsZWN0ZWQgdGhlIGFkZGl0aW9uYWwgci1icyBhbmQgYWNrcyBhbmQgcHVzaGVkIG91dCB0aGUg
ZnVsbApzZXJpZXMuIFRoYW5rcyBmb3IgZmVlZGJhY2sgdG8gZXZlcnlvbmUhCgoJU2FtCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
