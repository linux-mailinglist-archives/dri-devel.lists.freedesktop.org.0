Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05CC2FB0F
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79D96E331;
	Thu, 30 May 2019 11:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id D584B6E0AC
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 07:02:34 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 7128D803A;
 Thu, 30 May 2019 07:02:53 +0000 (UTC)
Date: Thu, 30 May 2019 00:02:30 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Message-ID: <20190530070230.GR5447@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
 <20190528101847.GN5447@atomide.com>
 <ac487765-01a3-2c82-d86e-db00451563a9@ti.com>
 <20190529081038.GP5447@atomide.com>
 <20190530054640.GQ5447@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530054640.GQ5447@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Thu, 30 May 2019 11:39:54 +0000
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Keerthy <j-keerthy@ti.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBUb255IExpbmRncmVuIDx0b255QGF0b21pZGUuY29tPiBbMTkwNTMwIDA1OjQ3XToKPiAqIFRv
bnkgTGluZGdyZW4gPHRvbnlAYXRvbWlkZS5jb20+IFsxOTA1MjkgMDg6MTFdOgo+ID4gKiBUb21p
IFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPiBbMTkwNTI5IDA3OjA2XToKPiA+ID4g
T24gMjgvMDUvMjAxOSAxMzoxOCwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKPiA+ID4gCj4gPiA+ID4g
PiBNeSBib2FyZCBpcyB4MTUgcmV2IEEzLCBhdHRhY2hlZCB0byBBTTUgRVZNLiBJJ3ZlIGFsc28g
YXR0YWNoZWQgbXkga2VybmVsCj4gPiA+ID4gPiBjb25maWcuCj4gPiA+ID4gCj4gPiA+ID4gU3Ry
YW5nZSB0aGF0IHRoaXMgaXMgbm90IGFmZmVjdGluZyBvdGhlciB4MTU/IEkgdGhpbmsgdGltZXIx
MiB3b3VsZAo+ID4gPiA+IGJlIGJsb2NrZWQgb24gSFMgZGV2aWNlcyB0aG91Z2g/Cj4gPiA+IAo+
ID4gPiBTZWVtcyB0aGF0IHRoZSBrZXJuZWwgY29uZmlnIGFmZmVjdHMuIG9tYXAycGx1c19kZWZj
b25maWcgYm9vdHMgb2suCj4gPiAKPiA+IE9LLCB0aGlzIGxpbmUgaW4geW91ciBvb3BzOgo+ID4g
Cj4gPiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFk
ZHJlc3MgNWE1YTVhNWEKPiA+IAo+ID4gUHJvYmFibHkgbWVhbnMgd2UgaGl0IHNvbWUgc2xhYiBw
b2lzb24gd2l0aCBERUJVR19TTEFCIHNldC4KPiA+IExvb2tzIGxpa2UgeW91ciBjb25maWcgYm9v
dHMgZmluZSB3aXRoIERFQlVHX1NMQUIgZGlzYWJsZWQKPiA+IGZvciBtZS4KPiA+IAo+ID4gQXMg
dGhpcyBvbmx5IGhhcHBlbnMgZm9yIHRpbWVyMTIsIEkgd29uZGVyIGlmIHdlJ3JlIGFnYWluCj4g
PiBoaXR0aW5nIHNvbWUgdW5jb21wcmVzcyBpc3N1ZSB3aXRoIGNvcnJ1cHRlZCBkdGIuIENoYW5n
aW5nCj4gPiB1LWJvb3QgZnRkYWRkciBoaWdoZXIgdXAgbWlnaHQgcG9zc2libHkgbWFrZSBpdCBn
byBhd2F5Lgo+ID4gT3IgZWxzZSB0aGVyZSdzIGEgYnVnIGVsc2V3aGVyZSA6KQo+IAo+IE9oIGJ1
dCBDTV9XS1VQQU9OX1RJTUVSMTJfQ0xLQ1RSTCBoYXMgbm8gQ0xLU0VMIG9wdGlvbiB1bmxpa2UK
PiBDTV9XS1VQQU9OX1RJTUVSMV9DTEtDVFJMLiBCZWxvdyBpcyBvbmUgcGFydCBvZiB0aGUgZml4
LCBidXQKPiBpdCBzZWVtcyBsaWtlIHdlJ3JlIG1pc3NpbmcgaGFuZGxpbmcgc29tZXdoZXJlIGFz
IHRyeWluZyB0bwo+IGdldCBhIG5vbi1leGlzdGluZyBjbG9jayBzaG91bGQganVzdCBwcm9kdWNl
IC1FTk9ERVYgdHlwZSBlcnJvci4KPiAKPiBBbmQgdGhlIGNsa3NlbCBzaG91bGQgYmUganVzdCBo
YW5kbGVkIHdpdGggYXNzaWduZWQtY2xvY2tzCj4gaW4gZ2VuZXJhbCwgYnV0IEkgdGhpbmsgd2Ug
c3RpbGwgbmVlZCBpdCB0aGVyZSB1bnRpbCB3ZQo+IGhhdmUgZHJpdmVycy9jbG9ja3NvdXJjZS8g
dGltZXIgZHJpdmVycyB1cGRhdGVkIHRvIGJvb3QKPiB1c2luZyBlYXJseV9wbGF0Zm9ybV9kZXZp
Y2UuCgpPSyBmb3VuZCBpdCwgd2UgaGF2ZSB0aGUgY2xrY3RybCBjbG9jayBwb3RlbnRpYWxseSBy
ZXR1cm4KdW5pbml0aWFsaXplZCBkYXRhLiBJIHBvc3RlZCB0d28gZml4ZXMgZm9yIHRoZSBpc3N1
ZToKCltQQVRDSF0gY2xrOiB0aTogY2xrY3RybDogRml4IHJldHVybmluZyB1bmluaXRpYWxpemVk
IGRhdGEKW1BBVENIXSBBUk06IGR0czogRHJvcCBib2d1cyBDTEtTRUwgZm9yIHRpbWVyMTIgb24g
ZHJhNwoKUmVnYXJkcywKClRvbnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
