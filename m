Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61472D0EF9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 14:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9677C89B67;
	Wed,  9 Oct 2019 12:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4A1898BF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 12:40:20 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 05:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; d="scan'208";a="197997765"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 09 Oct 2019 05:40:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 09 Oct 2019 15:40:16 +0300
Date: Wed, 9 Oct 2019 15:40:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [PATCH v2] drm/edid: Select DMT timing if EDID's display feature
 not support GTF
Message-ID: <20191009124016.GZ1208@intel.com>
References: <20190806113021.6586-1-shawn.c.lee@intel.com>
 <20191007135127.9538-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007135127.9538-1-shawn.c.lee@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Cooper Chiou <cooper.chiou@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDk6NTE6MjdQTSArMDgwMCwgTGVlIFNoYXduIEMgd3Jv
dGU6Cj4gUmVmZXIgdG8gRURJRCAxLjMgc3BlYywgZGlzcGxheSBGRUFUVVJFIChieXRlIDE4aCkg
Yml0ICMwIHNhaWQKPiAiSWYgdGhpcyBiaXQgaXMgc2V0IHRvIDEsIHRoZSBkaXNwbGF5IHN1cHBv
cnRzIHRpbWluZ3MgYmFzZWQgb24gdGhlCj4gR1RGIHN0YW5kYXJkIHVzaW5nIGRlZmF1bHQgR1RG
IHBhcmFtZXRlciB2YWx1ZXMiLgo+IAo+IEFuZCBFRElEIDEuNCBzcGVjIHNob3dzICJJZiBiaXQg
MCBpcyBzZXQgdG8gMCwgdGhlbiB0aGUgZGlzcGxheQo+IGlzIG5vbmNvbnRpbnVvdXMgZnJlcXVl
bmN5IChtdWx0aS1tb2RlKSBhbmQgaXMgb25seSBzcGVjaWZpZWQgdG8gYWNjZXB0Cj4gdGhlIHZp
ZGVvIHRpbWluZyBmb3JtYXRzIHRoYXQgYXJlIGxpc3RlZCBpbiBCQVNFIEVESUQgYW5kIGNlcnRh
aW4KPiBFWFRFTlNJT04gQmxvY2tzLgo+IAo+IFdoZW4gZGlzcGxheSBmZWF0dXJlIGRpZCBub3Qg
c3VwcG9ydCBDVlQgb3IgR0ZUMiBhbmQgbW9uaXRvcidzIEVESUQgdmVyc2lvbgo+IGdyZWF0ZXIg
dGhhbiBvciBlcXVhbCB0byAiMS4yIi4gRFJNIGRyaXZlciB3b3VsZCBzZWxlY3QgR1RGIGFzIGRl
ZmF1bHQKPiBmb3Igc3RhbmRhcmQgdGltaW5nIGNhbGN1bGF0aW9uLiBJdCBtYXkgZ2VuZXJhdGVk
IHNvbWUgdmlkZW8gdGltaW5nCj4gdGhhdCBjYW4ndCBkaXNwbGF5IHByb3Blcmx5IGJ5IGV4dGVy
bmFsIG1vbml0b3IuCj4gCj4gRm9yIGV4YW1wbGUuIFdoZW4gZHJpdmVyIHJldHJpZXZlZCAiMHhE
MSAweEZDIiAoRkhELCAxMjBIeikgYW5kCj4gIjB4RDEgMHhFOCIgKEZIRCwgMTAwSHopIGZyb20g
IlN0YW5kYXJkIFRpbWluZ3MiLiBHVEYgZm9ybXVsYQo+IHdvdWxkIGdlbmVyYXRlIHZpZGVvIHRp
bWluZyBsaWtlIGJlbG93LiBJdCBhbHJlYWR5IG92ZXIgbW9uaXRvcidzCj4gc3BlYyB0byBjYXVz
ZSBibGFjayBzY3JlZW4gaXNzdWUuCj4gIjE5MjB4MTA4MCIgMTIwIDM2ODg4MSAxOTIwIDIwNzIg
MjI4OCAyNjU2IDEwODAgMTA4MSAxMDg0IDExNTcgMHgwIDB4Ngo+ICIxOTIweDEwODAiIDEwMCAz
MDE5OTIgMTkyMCAyMDcyIDIyODAgMjY0MCAxMDgwIDEwODEgMTA4NCAxMTQ0IDB4MCAweDYKPiAK
PiB2MjogSnVzdCBjb25maXJtIEdURiBmbGFnIGFuZCBvbWl0IHRoZSByZXZpc2lvbiBjaGVjay4K
PiAKPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPiBDYzogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogQWRhbSBK
YWNrc29uIDxhamF4QHJlZGhhdC5jb20+Cj4gQ2M6IENvb3BlciBDaGlvdSA8Y29vcGVyLmNoaW91
QGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMZWUgU2hhd24gQyA8c2hhd24uYy5sZWVAaW50
ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDMgKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYwo+IGluZGV4IDVhZWUwZWJjMjAwZS4uMjZlYjA0ODIwYjUyIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlk
LmMKPiBAQCAtMjE5Myw3ICsyMTkzLDggQEAgc3RhdGljIGludCBzdGFuZGFyZF90aW1pbmdfbGV2
ZWwoc3RydWN0IGVkaWQgKmVkaWQpCj4gIAkJCXJldHVybiBMRVZFTF9DVlQ7Cj4gIAkJaWYgKGRy
bV9ndGYyX2hicmVhayhlZGlkKSkKPiAgCQkJcmV0dXJuIExFVkVMX0dURjI7Cj4gLQkJcmV0dXJu
IExFVkVMX0dURjsKPiArCQlpZiAoZWRpZC0+ZmVhdHVyZXMgJiBEUk1fRURJRF9GRUFUVVJFX0RF
RkFVTFRfR1RGKQo+ICsJCQlyZXR1cm4gTEVWRUxfR1RGOwoKbGd0bS4gVGhhbmtzLiBQdXNoZWQg
dG8gZHJtLW1pc2MtbmV4dC4KCj4gIAl9Cj4gIAlyZXR1cm4gTEVWRUxfRE1UOwo+ICB9Cj4gLS0g
Cj4gMi4xNy4xCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
