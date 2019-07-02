Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C555CE5C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 13:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63BD899D6;
	Tue,  2 Jul 2019 11:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CD3899D6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 11:26:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id B0A022852D9
Message-ID: <3c68bf286d8b75ac339df0eab43d276667e073c2.camel@collabora.com>
Subject: Re: [PATCH v2 0/3] RK3288 Gamma LUT
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Date: Tue, 02 Jul 2019 08:26:22 -0300
In-Reply-To: <20190621211346.1324-1-ezequiel@collabora.com>
References: <20190621211346.1324-1-ezequiel@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGVpa28sCgpPbiBGcmksIDIwMTktMDYtMjEgYXQgMTg6MTMgLTAzMDAsIEV6ZXF1aWVsIEdh
cmNpYSB3cm90ZToKPiBMZXQncyBzdXBwb3J0IEdhbW1hIExVVCBjb25maWd1cmF0aW9uIG9uIFJL
MzI4OCBTb0NzLgo+IAo+IEluIG9yZGVyIHRvIGRvIHNvLCB0aGlzIHNlcmllcyBhZGRzIGEgbmV3
IGFuZCBvcHRpb25hbAo+IGFkZHJlc3MgcmVzb3VyY2UuCj4gICAgIAo+IEEgc2VwYXJhdGUgYWRk
cmVzcyByZXNvdXJjZSBpcyByZXF1aXJlZCBiZWNhdXNlIG9uIHRoaXMgUkszMjg4LAo+IHRoZSBM
VVQgYWRkcmVzcyBpcyBhZnRlciB0aGUgTU1VIGFkZHJlc3MsIHdoaWNoIGlzIHJlcXVlc3RlZAo+
IGJ5IHRoZSBpb21tdSBkcml2ZXIuIFRoaXMgcHJldmVudHMgdGhlIERSTSBkcml2ZXIKPiBmcm9t
IHJlcXVlc3RpbmcgYW4gZW50aXJlIHJlZ2lzdGVyIHNwYWNlLgo+IAo+IFRoZSBjdXJyZW50IGlt
cGxlbWVudGF0aW9uIHdvcmtzIGZvciBSR0IgMTAtYml0IHRhYmxlcywgYXMgdGhhdAo+IGlzIHdo
YXQgc2VlbXMgdG8gd29yayBvbiBSSzMyODguCj4gCj4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgb24g
YSBSb2NrMiBTcXVhcmUgYm9hcmQsIHVzaW5nCj4gYSBoYWNrZWQgJ21vZGV0ZXN0JyB0b29sLCB3
aXRoIGxlZ2FjeSBhbmQgYXRvbWljIEFQSXMuIAo+IAo+IFRoYW5rcywKPiBFemUKPiAKPiBDaGFu
Z2VzIGZyb20gdjE6Cj4gKiBkcm9wIGV4cGxpY2l0IGxpbmVhciBMVVQgYWZ0ZXIgZmluZGluZyBh
IHByb3Blcgo+ICAgd2F5IHRvIGRpc2FibGUgZ2FtbWEgY29ycmVjdGlvbi4KPiAqIGF2b2lkIHNl
dHRpbmcgZ2FtbWEgaXMgdGhlIENSVEMgaXMgbm90IGFjdGl2ZS4KPiAqIHMvaW50L3Vuc2lnbmVk
IGludCBhcyBzdWdnZXN0ZWQgYnkgSmFjb3BvLgo+ICogb25seSBlbmFibGUgY29sb3IgbWFuYWdl
bWVudCBhbmQgc2V0IGdhbW1hIHNpemUKPiAgIGlmIGdhbW1hIExVVCBpcyBzdXBwb3J0ZWQsIHN1
Z2dlc3RlZCBieSBEb3VnLgo+ICogZHJvcCB0aGUgcmVnLW5hbWVzIHVzYWdlLCBhbmQgaW5zdGVh
ZCBqdXN0IHVzZSBpbmRleGVkIHJlZwo+ICAgc3BlY2lmaWVycywgc3VnZ2VzdGVkIGJ5IERvdWcu
Cj4gCj4gQ2hhbmdlcyBmcm9tIFJGQzoKPiAqIFJlcXVlc3QgKGFuIG9wdGlvbmFsKSBhZGRyZXNz
IHJlc291cmNlIGZvciB0aGUgTFVULgo+ICogQWRkIGRldmljZXRyZWUgY2hhbmdlcy4KPiAqIERy
b3Agc3VwcG9ydCBmb3IgUkszMzk5LCB3aGljaCBkb2Vzbid0IHNlZW0gdG8gd29yawo+ICAgb3V0
IG9mIHRoZSBib3ggYW5kIG5lZWRzIG1vcmUgcmVzZWFyY2guCj4gKiBTdXBwb3J0IHBhc3MtdGhy
dSBzZXR0aW5nIHdoZW4gR0FNTUFfTFVUIGlzIE5VTEwuCj4gKiBBZGQgYSBjaGVjayBmb3IgdGhl
IGdhbW1hIHNpemUsIGFzIHN1Z2dlc3RlZCBieSBJbGlhLgo+ICogTW92ZSBnYW1tYSBzZXR0aW5n
IHRvIGF0b21pY19jb21taXRfdGFpbCwgYXMgcG9pbnRlZAo+ICAgb3V0IGJ5IEphY29wby9MYXVy
ZW50LCBpcyB0aGUgY29ycmVjdCB3YXkuCj4gCj4gRXplcXVpZWwgR2FyY2lhICgzKToKPiAgIGR0
LWJpbmRpbmdzOiBkaXNwbGF5OiByb2NrY2hpcDogZG9jdW1lbnQgVk9QIGdhbW1hIExVVCBhZGRy
ZXNzCj4gICBkcm0vcm9ja2NoaXA6IEFkZCBvcHRpb25hbCBzdXBwb3J0IGZvciBDUlRDIGdhbW1h
IExVVAo+ICAgQVJNOiBkdHM6IHJvY2tjaGlwOiBBZGQgUkszMjg4IFZPUCBnYW1tYSBMVVQgYWRk
cmVzcwo+IAo+ICAuLi4vZGlzcGxheS9yb2NrY2hpcC9yb2NrY2hpcC12b3AudHh0ICAgICAgICAg
fCAgIDYgKy0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kgICAgICAgICAgICAgICAg
IHwgICA0ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyAg
ICB8ICAgMyArCj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMg
ICB8IDExNCArKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX2RybV92b3AuaCAgIHwgICA3ICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF92b3BfcmVnLmMgICB8ICAgMiArCj4gIDYgZmlsZXMgY2hhbmdlZCwgMTMzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCgpBbnkgb3RoZXIgZmVlZGJhY2sgb24gdGhpcyBz
ZXJpZXM/IElmIHlvdSBhcmUgaGFwcHkgd2l0aCB0aGUgYXBwcm9hY2ggbm93LApJIGFtIHdvbmRl
cmluZyBpZiB5b3UgY2FuIHRha2UgaXQgb3IgaWYgaXQncyB3YXkgdG9vIGxhdGUuCgpUaGFua3Ms
CkV6ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
