Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F843E14F3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 11:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B896E9F6;
	Wed, 23 Oct 2019 09:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4A16E9F6;
 Wed, 23 Oct 2019 09:00:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 02:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; d="scan'208";a="209878290"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 23 Oct 2019 02:00:43 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 23 Oct 2019 12:00:42 +0300
Date: Wed, 23 Oct 2019 12:00:42 +0300
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191023090042.GQ2819@lahna.fi.intel.com>
References: <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
 <20191021133328.GI2819@lahna.fi.intel.com>
 <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
 <20191021140852.GM2819@lahna.fi.intel.com>
 <CACO55tvp6n2ahizwhc70xRJ1uTohs2ep962vwtHGQK-MkcLmsw@mail.gmail.com>
 <20191021154606.GT2819@lahna.fi.intel.com>
 <CACO55tsGhvG1qapRkdu_j7R534cFa5o=Gv2s4VZDrWUrxjBFwA@mail.gmail.com>
 <CACO55ts7hivYgN7=3bcAjWx2h8FfbR5UiKiOOExYY9m-TGRNfw@mail.gmail.com>
 <20191022124453.GK2819@lahna.fi.intel.com>
 <CACO55tvxvwUqzg=jLoO6bhmcaXQwRaTv9S4pt2t0V5TUi+HsEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tvxvwUqzg=jLoO6bhmcaXQwRaTv9S4pt2t0V5TUi+HsEw@mail.gmail.com>
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDI6NTE6NTNQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IE9uIFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDI6NDUgUE0gTWlrYSBXZXN0ZXJiZXJnCj4g
PG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgT2N0IDIy
LCAyMDE5IGF0IDExOjE2OjE0QU0gKzAyMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+ID4gSSB0
aGluayB0aGVyZSBpcyBzb21ldGhpbmcgSSB0b3RhbGx5IGZvcmdvdCBhYm91dDoKPiA+ID4KPiA+
ID4gV2hlbiB0aGVyZSB3YXMgbmV2ZXIgYSBkcml2ZXIgYm91bmQgdG8gdGhlIEdQVSwgYW5kIGlm
IHJ1bnRpbWUgcG93ZXIKPiA+ID4gbWFuYWdlbWVudCBnZXRzIGVuYWJsZWQgb24gdGhhdCBkZXZp
Y2UsIHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUgd29ya3MKPiA+ID4gYXMgZXhwZWN0ZWQgKEkgYW0g
bm90IDEwMCUgc3VyZSBvbiBpZiB0aGF0IGFsd2F5cyB3b3JrcywgYnV0IEkgd2lsbAo+ID4gPiBy
ZWNoZWNrIHRoYXQpLgo+ID4KPiA+IEFGQUlLLCBpZiB0aGVyZSBpcyBubyBkcml2ZXIgYm91bmQg
dG8gdGhlIFBDSSBkZXZpY2UgaXQgaXMgbGVmdCB0byBEMAo+ID4gcmVnYXJkbGVzcyBvZiB0aGUg
cnVudGltZSBQTSBzdGF0ZSB3aGljaCBjb3VsZCBleHBsYWluIHdoeSBpdCB3b3JrcyBpbgo+ID4g
dGhhdCBjYXNlIChpdCBpcyBuZXZlciBwdXQgaW50byBEM2hvdCkuCj4gPgo+ID4gSSBsb29rZWQg
YXQgdGhlIGFjcGlkdW1wIHlvdSBzZW50IGFuZCB0aGVyZSBpcyBvbmUgdGhpbmcgdGhhdCBtYXkK
PiA+IGV4cGxhaW4gdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gV2luZG93cyBhbmQgTGludXguIE5v
dCBzdXJlIGlmIHlvdSB3ZXJlCj4gPiBhd2FyZSBvZiB0aGlzIGFscmVhZHksIHRob3VnaC4gVGhl
IHBvd2VyIHJlc291cmNlIFBHT0YoKSBtZXRob2QgaGFzCj4gPiB0aGlzOgo+ID4KPiA+ICAgIElm
ICgoKE9TWVMgPD0gMHgwN0Q5KSB8fCAoKE9TWVMgPT0gMHgwN0RGKSAmJiAoX1JFViA9PSAweDA1
KSkpKSB7Cj4gPiAgICAgICAuLi4KPiA+ICAgIH0KPiA+Cj4gCj4gSSB0aGluayB0aGlzIGlzIHRo
ZSBmYWxsYmFjayB0byBzb21lIG9sZGVyIG1ldGhvZCBvZiBydW50aW1lCj4gc3VzcGVuZGluZyB0
aGUgZGV2aWNlLCBhbmQgSSB0aGluayBpdCB3aWxsIGVuZCB1cCB0b3VjaGluZyBkaWZmZXJlbnQK
PiByZWdpc3RlcnMgb24gdGhlIGJyaWRnZSBjb250cm9sbGVyIHdoaWNoIGRvIG5vdCBzaG93IHRo
ZSBicm9rZW4KPiBiZWhhdmlvdXIuCgpJIHRoaW5rIGl0IGFjdHVhbGx5IHRyaWVzIHRvIGlkZW50
aWZ5IG9sZGVyIFdpbmRvd3MgYW5kIHRoZW4gTGludXggKHRoZQpfUkVWID09IDB4MDUgY2hlY2sg
Y29tZXMgZnJvbSB0aGF0KS4gU28gYXQgbGVhc3Qgc29tZSBwb2ludCBEZWxsIHBlb3BsZQpoYXZl
IGV4cGVyaW1lbnQgdGhpcyBvbiBMaW51eC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
