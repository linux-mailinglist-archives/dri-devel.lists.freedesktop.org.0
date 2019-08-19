Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CB194A93
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 18:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4541B6E21B;
	Mon, 19 Aug 2019 16:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842156E21B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:39:57 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 09:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; d="scan'208";a="261891277"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 19 Aug 2019 09:39:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 19 Aug 2019 19:39:53 +0300
Date: Mon, 19 Aug 2019 19:39:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [PATCH] drm/edid: Select DMT timing if EDID's display feature
 not support GTF.
Message-ID: <20190819163953.GZ5942@intel.com>
References: <20190806113021.6586-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806113021.6586-1-shawn.c.lee@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Cooper Chiou <cooper.chiou@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MzA6MjFQTSArMDgwMCwgTGVlIFNoYXduIEMgd3Jv
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
PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPiBDYzogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogQWRhbSBK
YWNrc29uIDxhamF4QHJlZGhhdC5jb20+Cj4gQ2M6IENvb3BlciBDaGlvdSA8Y29vcGVyLmNoaW91
QGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMZWUgU2hhd24gQyA8c2hhd24uYy5sZWVAaW50
ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDQgKysrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkLmMKPiBpbmRleCA4MmE0Y2VlZDNmY2YuLmY2YTNkMmQ5OTNjNyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jCj4gQEAgLTIwODksNyArMjA4OSw5IEBAIHN0YXRpYyBpbnQgc3RhbmRhcmRfdGltaW5nX2xl
dmVsKHN0cnVjdCBlZGlkICplZGlkKQo+ICAJCQlyZXR1cm4gTEVWRUxfQ1ZUOwo+ICAJCWlmIChk
cm1fZ3RmMl9oYnJlYWsoZWRpZCkpCj4gIAkJCXJldHVybiBMRVZFTF9HVEYyOwo+IC0JCXJldHVy
biBMRVZFTF9HVEY7Cj4gKwkJaWYgKGVkaWQtPnJldmlzaW9uID09IDMgJiYgKGVkaWQtPmZlYXR1
cmVzICYgRFJNX0VESURfRkVBVFVSRV9ERUZBVUxUX0dURikpCj4gKwkJCXJldHVybiBMRVZFTF9H
VEY7CgpXaGlsZSB0aGUgb2xkZXN0IEVESUQgc3BlYyBJIGhhdmUgaXMgMS4zLCBzb3VyY2VzIG9u
IHRoZSBpbnRlcndlYnMKc3VnZ2VzdCB0aGF0IG9sZGVyIHJldmlzaW9ucyBhbHJlYWR5IGhhZCB0
aGUgImRlZmF1bHQgR1RGIiBmbGFnIGhlcmUuClNvIEkgdGhpbmsgd2UgY2FuIG9taXQgdGhlIHJl
dmlzaW9uIGNoZWNrLgoKPiArCj4gIAl9Cj4gIAlyZXR1cm4gTEVWRUxfRE1UOwo+ICB9Cj4gLS0g
Cj4gMi4xNy4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
