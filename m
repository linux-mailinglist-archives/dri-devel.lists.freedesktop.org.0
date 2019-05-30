Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242452FB11
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 13:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8745E6E345;
	Thu, 30 May 2019 11:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 17B8C6E095
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 05:46:44 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 2744A8027;
 Thu, 30 May 2019 05:47:03 +0000 (UTC)
Date: Wed, 29 May 2019 22:46:40 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv6 0/4] omapdrm: DSI command mode panel support
Message-ID: <20190530054640.GQ5447@atomide.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <60c45d23-de2f-d94a-c3d7-146a2bee538f@ti.com>
 <20190527112122.GJ5447@atomide.com>
 <e507c415-38de-86fe-9265-4b0aed0d7224@ti.com>
 <20190528093952.GM5447@atomide.com>
 <14c6c702-844b-756d-2d97-44e8f5a169df@ti.com>
 <20190528101847.GN5447@atomide.com>
 <ac487765-01a3-2c82-d86e-db00451563a9@ti.com>
 <20190529081038.GP5447@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529081038.GP5447@atomide.com>
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

KiBUb255IExpbmRncmVuIDx0b255QGF0b21pZGUuY29tPiBbMTkwNTI5IDA4OjExXToKPiAqIFRv
bWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+IFsxOTA1MjkgMDc6MDZdOgo+ID4g
T24gMjgvMDUvMjAxOSAxMzoxOCwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKPiA+IAo+ID4gPiA+IE15
IGJvYXJkIGlzIHgxNSByZXYgQTMsIGF0dGFjaGVkIHRvIEFNNSBFVk0uIEkndmUgYWxzbyBhdHRh
Y2hlZCBteSBrZXJuZWwKPiA+ID4gPiBjb25maWcuCj4gPiA+IAo+ID4gPiBTdHJhbmdlIHRoYXQg
dGhpcyBpcyBub3QgYWZmZWN0aW5nIG90aGVyIHgxNT8gSSB0aGluayB0aW1lcjEyIHdvdWxkCj4g
PiA+IGJlIGJsb2NrZWQgb24gSFMgZGV2aWNlcyB0aG91Z2g/Cj4gPiAKPiA+IFNlZW1zIHRoYXQg
dGhlIGtlcm5lbCBjb25maWcgYWZmZWN0cy4gb21hcDJwbHVzX2RlZmNvbmZpZyBib290cyBvay4K
PiAKPiBPSywgdGhpcyBsaW5lIGluIHlvdXIgb29wczoKPiAKPiBVbmFibGUgdG8gaGFuZGxlIGtl
cm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgNWE1YTVhNWEKPiAKPiBQcm9i
YWJseSBtZWFucyB3ZSBoaXQgc29tZSBzbGFiIHBvaXNvbiB3aXRoIERFQlVHX1NMQUIgc2V0Lgo+
IExvb2tzIGxpa2UgeW91ciBjb25maWcgYm9vdHMgZmluZSB3aXRoIERFQlVHX1NMQUIgZGlzYWJs
ZWQKPiBmb3IgbWUuCj4gCj4gQXMgdGhpcyBvbmx5IGhhcHBlbnMgZm9yIHRpbWVyMTIsIEkgd29u
ZGVyIGlmIHdlJ3JlIGFnYWluCj4gaGl0dGluZyBzb21lIHVuY29tcHJlc3MgaXNzdWUgd2l0aCBj
b3JydXB0ZWQgZHRiLiBDaGFuZ2luZwo+IHUtYm9vdCBmdGRhZGRyIGhpZ2hlciB1cCBtaWdodCBw
b3NzaWJseSBtYWtlIGl0IGdvIGF3YXkuCj4gT3IgZWxzZSB0aGVyZSdzIGEgYnVnIGVsc2V3aGVy
ZSA6KQoKT2ggYnV0IENNX1dLVVBBT05fVElNRVIxMl9DTEtDVFJMIGhhcyBubyBDTEtTRUwgb3B0
aW9uIHVubGlrZQpDTV9XS1VQQU9OX1RJTUVSMV9DTEtDVFJMLiBCZWxvdyBpcyBvbmUgcGFydCBv
ZiB0aGUgZml4LCBidXQKaXQgc2VlbXMgbGlrZSB3ZSdyZSBtaXNzaW5nIGhhbmRsaW5nIHNvbWV3
aGVyZSBhcyB0cnlpbmcgdG8KZ2V0IGEgbm9uLWV4aXN0aW5nIGNsb2NrIHNob3VsZCBqdXN0IHBy
b2R1Y2UgLUVOT0RFViB0eXBlIGVycm9yLgoKQW5kIHRoZSBjbGtzZWwgc2hvdWxkIGJlIGp1c3Qg
aGFuZGxlZCB3aXRoIGFzc2lnbmVkLWNsb2NrcwppbiBnZW5lcmFsLCBidXQgSSB0aGluayB3ZSBz
dGlsbCBuZWVkIGl0IHRoZXJlIHVudGlsIHdlCmhhdmUgZHJpdmVycy9jbG9ja3NvdXJjZS8gdGlt
ZXIgZHJpdmVycyB1cGRhdGVkIHRvIGJvb3QKdXNpbmcgZWFybHlfcGxhdGZvcm1fZGV2aWNlLgoK
UmVnYXJkcywKClRvbnkKCjg8IC0tLS0tLS0tLS0tLS0tLQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvZHJhNy1sNC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZHJhNy1sNC5kdHNpCi0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2RyYTctbDQuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0
cy9kcmE3LWw0LmR0c2kKQEAgLTQ0NTAsOCArNDQ1MCw2IEBACiAJCQl0aW1lcjEyOiB0aW1lckAw
IHsKIAkJCQljb21wYXRpYmxlID0gInRpLG9tYXA1NDMwLXRpbWVyIjsKIAkJCQlyZWcgPSA8MHgw
IDB4ODA+OwotCQkJCWNsb2NrcyA9IDwmd2t1cGFvbl9jbGtjdHJsIERSQTdfV0tVUEFPTl9USU1F
UjEyX0NMS0NUUkwgMjQ+OwotCQkJCWNsb2NrLW5hbWVzID0gImZjayI7CiAJCQkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDkwIElSUV9UWVBFX0xFVkVMX0hJR0g+OwogCQkJCXRpLHRpbWVyLWFsd29u
OwogCQkJCXRpLHRpbWVyLXNlY3VyZTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
