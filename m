Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAF57670D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDC36ED48;
	Fri, 26 Jul 2019 13:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7F16ED4A;
 Fri, 26 Jul 2019 13:15:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1C3B480502;
 Fri, 26 Jul 2019 15:15:07 +0200 (CEST)
Date: Fri, 26 Jul 2019 15:15:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "dbasehore ." <dbasehore@chromium.org>
Subject: Re: [PATCH v7 2/4] drm/panel: set display info in panel attach
Message-ID: <20190726131506.GB17801@ravnborg.org>
References: <20190710021659.177950-1-dbasehore@chromium.org>
 <20190710021659.177950-3-dbasehore@chromium.org>
 <20190723091945.GD787@ravnborg.org>
 <CAGAzgsonxAcOLxPSoP6Swab+AFPxWaxmC_tg87J=6Nes_awACg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGAzgsonxAcOLxPSoP6Swab+AFPxWaxmC_tg87J=6Nes_awACg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=VwQbUJbxAAAA:8 a=CPKLS5VrouiAa9iZAqIA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGVyZWsuCgpPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCAwMzoxNToxOVBNIC0wNzAwLCBkYmFz
ZWhvcmUgLiB3cm90ZToKPiBIaSBTYW0sIHRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoZSBwb3Rl
bnRpYWwgY29uZmxpY3QuCj4gCj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMjoxOSBBTSBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIERlcmVrLgo+ID4K
PiA+IE9uIFR1ZSwgSnVsIDA5LCAyMDE5IGF0IDA3OjE2OjU3UE0gLTA3MDAsIERlcmVrIEJhc2Vo
b3JlIHdyb3RlOgo+ID4gPiBEZXZpY2V0cmVlIHN5c3RlbXMgY2FuIHNldCBwYW5lbCBvcmllbnRh
dGlvbiB2aWEgYSBwYW5lbCBiaW5kaW5nLCBidXQKPiA+ID4gdGhlcmUncyBubyB3YXksIGFzIGlz
LCB0byBwcm9wYWdhdGUgdGhpcyBzZXR0aW5nIHRvIHRoZSBjb25uZWN0b3IsCj4gPiA+IHdoZXJl
IHRoZSBwcm9wZXJ0eSBuZWVkIHRvIGJlIGFkZGVkLgo+ID4gPiBUbyBhZGRyZXNzIHRoaXMsIHRo
aXMgcGF0Y2ggc2V0cyBvcmllbnRhdGlvbiwgYXMgd2VsbCBhcyBvdGhlciBmaXhlZAo+ID4gPiB2
YWx1ZXMgZm9yIHRoZSBwYW5lbCwgaW4gdGhlIGRybV9wYW5lbF9hdHRhY2ggZnVuY3Rpb24uIFRo
ZXNlIHZhbHVlcwo+ID4gPiBhcmUgc3RvcmVkIGZyb20gcHJvYmUgaW4gdGhlIGRybV9wYW5lbCBz
dHJ1Y3QuCj4gPgo+ID4gVGhpcyBhcHByb2NoIHNlZW1zIHRvIGNvbmZsaWN0IHdpdGggd29yayBk
b25lIGJ5IExhdXJlbnQgd2hlcmUgdGhlCj4gPiBvd25lcnNoaXAvY3JlYXRpb24gb2YgdGhlIGNv
bm5lY3RvciB3aWxsIGJlIG1vdmVkIHRvIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIuCj4gPgo+ID4g
SWYgSSB1bmRlcnN0YW5kIGl0IGNvcnJlY3QgdGhlbiB0aGVyZSBzaG91bGQgbm90IGJlIGEgMTox
IHJlbGF0aW9uCj4gPiBiZXR3ZWVuIGEgcGFuZWwgYW5kIGEgY29ubmVjdG9yIGFueW1vcmUuCj4g
Cj4gCj4gQ2FuIHlvdSBwb2ludCBtZSB0byB0aGlzIHdvcms/ClBsZWFzZSB0YWtlIGEgbG9vayBh
dCB0aGUgc2VyaWVzIHdpdGggc3ViamVjdDoKIltQQVRDSCAwMC82MF0gZHJtL29tYXA6IFJlcGxh
Y2UgY3VzdG9tIGRpc3BsYXkgZHJpdmVycyB3aXRoIGRybV9icmlkZ2UKYW5kIGRybV9wYW5lbCIK
TGluazogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTAzNDE3NS8KCkxhdXJl
bnQgaGFzIGRvbmUgYSBncmVhdCBqb2IgZXhwbGFpbmluZyB0aGUgYmFja2dyb3VuZCwKSWYgeW91
IGxvb2sgaW50byB0aGUgcGF0Y2hlZCB5b3Ugd2lsbCBzZWUgdGhlIGlkZWEgaXMgdGhhdCBhIGRy
bV9wYW5lbApubyBsb25nZXIgZ2V0IGF0dGFjaGVkIHRvIGEgZHJtX2NvbnRyb2xsZXIgLSBpdCB3
aWxsIGJlIGFuIGFyZ3VtZW50IHRvCmdldF9tb2RlcygpLgoKCVNhbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
