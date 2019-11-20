Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EB5103E15
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 16:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0301F6EA77;
	Wed, 20 Nov 2019 15:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36A06E781;
 Wed, 20 Nov 2019 15:15:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 07:15:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="215831473"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 20 Nov 2019 07:15:43 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 20 Nov 2019 17:15:42 +0200
Date: Wed, 20 Nov 2019 17:15:42 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191120151542.GH11621@lahna.fi.intel.com>
References: <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDE6MTE6NTJQTSArMDEwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDE6MDkgUE0gTWlrYSBXZXN0ZXJiZXJnCj4g
PG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgTm92IDIw
LCAyMDE5IGF0IDEyOjU4OjAwUE0gKzAxMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+ID4gb3Zl
cmFsbCwgd2hhdCBJIHJlYWxseSB3YW50IHRvIGtub3cgaXMsIF93aHlfIGRvZXMgaXQgd29yayBv
biB3aW5kb3dzPwo+ID4KPiA+IFNvIGRvIEkgOy0pCj4gPgo+ID4gPiBPciB3aGF0IGFyZSB3ZSBk
b2luZyBkaWZmZXJlbnRseSBvbiBMaW51eCBzbyB0aGF0IGl0IGRvZXNuJ3Qgd29yaz8gSWYKPiA+
ID4gYW55Ym9keSBoYXMgYW55IGlkZWEgb24gaG93IHdlIGNvdWxkIGRpZyBpbnRvIHRoaXMgYW5k
IGZpZ3VyZSBpdCBvdXQKPiA+ID4gb24gdGhpcyBsZXZlbCwgdGhpcyB3b3VsZCBwcm9iYWJseSBh
bGxvdyB1cyB0byBnZXQgY2xvc2VyIHRvIHRoZSByb290Cj4gPiA+IGNhdXNlPyBubz8KPiA+Cj4g
PiBIYXZlIHlvdSB0cmllZCB0byB1c2UgdGhlIGFjcGlfcmV2X292ZXJyaWRlIHBhcmFtZXRlciBp
biB5b3VyIHN5c3RlbSBhbmQKPiA+IGRvZXMgaXQgaGF2ZSBhbnkgZWZmZWN0Pwo+ID4KPiA+IEFs
c28gZGlkIHlvdSB0cnkgdG8gdHJhY2UgdGhlIEFDUEkgX09OL19PRkYoKSBtZXRob2RzPyBJIHRo
aW5rIHRoYXQKPiA+IHNob3VsZCBob3BlZnVsbHkgcmV2ZWFsIHNvbWV0aGluZy4KPiA+Cj4gCj4g
SSB0aGluayBJIGRpZCBpbiB0aGUgcGFzdCBhbmQgaXQgc2VlbWVkIHRvIGhhdmUgd29ya2VkLCB0
aGVyZSBpcyBqdXN0Cj4gb25lIGJpZyBpc3N1ZSB3aXRoIHRoaXM6IGl0J3MgYSBEZWxsIHNwZWNp
ZmljIHdvcmthcm91bmQgYWZhaWssIGFuZAo+IHRoaXMgaXNzdWUgcGxhZ3VlcyBub3QganVzdCBE
ZWxsLCBidXQgd2UndmUgc2VlbiBpdCBvbiBIUCBhbmQgTGVub3ZvCj4gbGFwdG9wcyBhcyB3ZWxs
LCBhbmQgSSd2ZSBoZWFyZCBhYm91dCB1c2VycyBoYXZpbmcgdGhlIHNhbWUgaXNzdWVzIG9uCj4g
QXN1cyBhbmQgTVNJIGxhcHRvcHMgYXMgd2VsbC4KCk1heWJlIGl0IGlzIG5vdCBhIHdvcmthcm91
bmQgYXQgYWxsIGJ1dCBpbnN0ZWFkIGl0IHNpbXBseSBkZXRlcm1pbmVzCndoZXRoZXIgdGhlIHN5
c3RlbSBzdXBwb3J0cyBSVEQzIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQgKElJUkMgV2luZG93cyA4
CnN0YXJ0ZWQgc3VwcG9ydGluZyBpdCkuIE1heWJlIERlbGwgYWRkZWQgY2hlY2sgZm9yIExpbnV4
IGJlY2F1c2UgYXQgdGhhdAp0aW1lIExpbnV4IGRpZCBub3Qgc3VwcG9ydCBpdC4KCkluIGNhc2Ug
UlREMyBpcyBzdXBwb3J0ZWQgaXQgaW52b2tlcyBMS0RTKCkgd2hpY2ggcHJvYmFibHkgZG9lcyB0
aGUgTDIKb3IgTDMgZW50cnkgYW5kIHRoaXMgaXMgZm9yIHNvbWUgcmVhc29uIGRvZXMgbm90IHdv
cmsgdGhlIHNhbWUgd2F5IGluCkxpbnV4IHRoYW4gaXQgZG9lcyB3aXRoIFdpbmRvd3MgOCsuCgpJ
IGRvbid0IHJlbWVtYmVyIGlmIHRoaXMgaGFwcGVucyBvbmx5IHdpdGggbm91dmVhdSBvciB3aXRo
IHRoZQpwcm9wcmlldGFyeSBkcml2ZXIgYXMgd2VsbCBidXQgbG9va2luZyBhdCB0aGUgbm91dmVh
dSBydW50aW1lIFBNIHN1c3BlbmQKaG9vayAoYXNzdW1pbmcgSSdtIGxvb2tpbmcgYXQgdGhlIGNv
cnJlY3QgY29kZSk6CgpzdGF0aWMgaW50Cm5vdXZlYXVfcG1vcHNfcnVudGltZV9zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldikKeyAgICAgICAKICAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9
IHRvX3BjaV9kZXYoZGV2KTsKICAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IHBj
aV9nZXRfZHJ2ZGF0YShwZGV2KTsKICAgICAgICBpbnQgcmV0OwoKICAgICAgICBpZiAoIW5vdXZl
YXVfcG1vcHNfcnVudGltZSgpKSB7CiAgICAgICAgICAgICAgICBwbV9ydW50aW1lX2ZvcmJpZChk
ZXYpOwogICAgICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsKICAgICAgICB9CgogICAgICAgIG5v
dXZlYXVfc3dpdGNoZXJvb19vcHRpbXVzX2RzbSgpOwogICAgICAgIHJldCA9IG5vdXZlYXVfZG9f
c3VzcGVuZChkcm1fZGV2LCB0cnVlKTsKICAgICAgICBwY2lfc2F2ZV9zdGF0ZShwZGV2KTsKICAg
ICAgICBwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7CiAgICAgICAgcGNpX2lnbm9yZV9ob3RwbHVn
KHBkZXYpOwogICAgICAgIHBjaV9zZXRfcG93ZXJfc3RhdGUocGRldiwgUENJX0QzY29sZCk7CiAg
ICAgICAgZHJtX2Rldi0+c3dpdGNoX3Bvd2VyX3N0YXRlID0gRFJNX1NXSVRDSF9QT1dFUl9EWU5B
TUlDX09GRjsKICAgICAgICByZXR1cm4gcmV0Owp9CgpOb3JtYWxseSBQQ0kgZHJpdmVycyBsZWF2
ZSB0aGUgUENJIGJ1cyBQTSB0aGluZ3MgdG8gUENJIGNvcmUgYnV0IGhlcmUKdGhlIGRyaXZlciBk
b2VzIHRoZXNlLiBTbyBJIHdvbmRlciBpZiBpdCBtYWtlcyBhbnkgZGlmZmVyZW5jZSBpZiB3ZSBs
ZXQKdGhlIGNvcmUgaGFuZGxlIGFsbCB0aGF0OgoKc3RhdGljIGludApub3V2ZWF1X3Btb3BzX3J1
bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCnsgICAgICAgCiAgICAgICAgc3RydWN0
IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldik7CiAgICAgICAgc3RydWN0IGRybV9kZXZp
Y2UgKmRybV9kZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CiAgICAgICAgaW50IHJldDsKCiAg
ICAgICAgaWYgKCFub3V2ZWF1X3Btb3BzX3J1bnRpbWUoKSkgewogICAgICAgICAgICAgICAgcG1f
cnVudGltZV9mb3JiaWQoZGV2KTsKICAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7CiAgICAg
ICAgfQoKICAgICAgICBub3V2ZWF1X3N3aXRjaGVyb29fb3B0aW11c19kc20oKTsKICAgICAgICBy
ZXQgPSBub3V2ZWF1X2RvX3N1c3BlbmQoZHJtX2RldiwgdHJ1ZSk7CiAgICAgICAgcGNpX2lnbm9y
ZV9ob3RwbHVnKHBkZXYpOwogICAgICAgIGRybV9kZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSA9IERS
TV9TV0lUQ0hfUE9XRVJfRFlOQU1JQ19PRkY7CiAgICAgICAgcmV0dXJuIHJldDsKfQoKYW5kIHNp
bWlsYXIgZm9yIHRoZSBub3V2ZWF1X3Btb3BzX3J1bnRpbWVfcmVzdW1lKCkuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
