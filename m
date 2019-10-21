Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95530DF1E9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 17:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CD26E0BC;
	Mon, 21 Oct 2019 15:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C115B6E0BC;
 Mon, 21 Oct 2019 15:46:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 08:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,324,1566889200"; d="scan'208";a="209463506"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 08:46:07 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Oct 2019 18:46:06 +0300
Date: Mon, 21 Oct 2019 18:46:06 +0300
From: Mika Westerberg <mika.westerberg@intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191021154606.GT2819@lahna.fi.intel.com>
References: <CACO55ttOJaXKWmKQQbMAQRJHLXF-VtNn58n4BZhFKYmAdfiJjA@mail.gmail.com>
 <20191016213722.GA72810@google.com>
 <CACO55tuXck7vqGVLmMBGFg6A2pr3h8koRuvvWHLNDH8XvBVxew@mail.gmail.com>
 <20191021133328.GI2819@lahna.fi.intel.com>
 <CACO55tujUZr+rKkyrkfN+wkNOJWdNEVhVc-eZ3RCXJD+G1z=7A@mail.gmail.com>
 <20191021140852.GM2819@lahna.fi.intel.com>
 <CACO55tvp6n2ahizwhc70xRJ1uTohs2ep962vwtHGQK-MkcLmsw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tvp6n2ahizwhc70xRJ1uTohs2ep962vwtHGQK-MkcLmsw@mail.gmail.com>
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

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDQ6NDk6MDlQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDQ6MDkgUE0gTWlrYSBXZXN0ZXJiZXJnCj4g
PG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgT2N0IDIx
LCAyMDE5IGF0IDAzOjU0OjA5UE0gKzAyMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+ID4gPiBJ
IHJlYWxseSB3b3VsZCBsaWtlIHRvIHByb3ZpZGUgeW91IG1vcmUgaW5mb3JtYXRpb24gYWJvdXQg
c3VjaAo+ID4gPiA+IHdvcmthcm91bmQgYnV0IEknbSBub3QgYXdhcmUgb2YgYW55IDstKSBJIGhh
dmUgbm90IHNlZW4gYW55IGlzc3VlcyBsaWtlCj4gPiA+ID4gdGhpcyB3aGVuIEQzY29sZCBpcyBw
cm9wZXJseSBpbXBsZW1lbnRlZCBpbiB0aGUgcGxhdGZvcm0uICBUaGF0J3Mgd2h5Cj4gPiA+ID4g
SSdtIGJpdCBza2VwdGljYWwgdGhhdCB0aGlzIGhhcyBhbnl0aGluZyB0byBkbyB3aXRoIHNwZWNp
ZmljIEludGVsIFBDSWUKPiA+ID4gPiBwb3J0cy4gTW9yZSBsaWtlbHkgaXQgaXMgc29tZSBwb3dl
ciBzZXF1ZW5jZSBpbiB0aGUgX09OL19PRkYoKSBtZXRob2RzCj4gPiA+ID4gdGhhdCBpcyBydW4g
ZGlmZmVyZW50bHkgb24gV2luZG93cy4KPiA+ID4KPiA+ID4geWVhaC4uIG1heWJlLiBJIHJlYWxs
eSBkb24ndCBrbm93IHdoYXQncyB0aGUgYWN0dWFsIHJvb3QgY2F1c2UuIEkganVzdAo+ID4gPiBr
bm93IHRoYXQgd2l0aCB0aGlzIHdvcmthcm91bmQgaXQgd29ya3MgcGVyZmVjdGx5IGZpbmUgb24g
bXkgYW5kIHNvbWUKPiA+ID4gb3RoZXIgc3lzdGVtcyBpdCB3YXMgdGVzdGVkIG9uLiBEbyB5b3Ug
a25vdyB3aG8gd291bGQgYmUgYmVzdCB0bwo+ID4gPiBhcHByb2FjaCB0byBnZXQgcHJvcGVyIGRv
Y3VtZW50YXRpb24gYWJvdXQgdGhvc2UgbWV0aG9kcyBhbmQgd2hhdCBhcmUKPiA+ID4gdGhlIGFj
dHVhbCBwcmVyZXF1aXNpdGVzIG9mIHRob3NlIG1ldGhvZHM/Cj4gPgo+ID4gVGhvc2Ugc2hvdWxk
IGJlIGRvY3VtZW50ZWQgaW4gdGhlIEFDUEkgc3BlYy4gQ2hhcHRlciA3IHNob3VsZCBleHBsYWlu
Cj4gPiBwb3dlciByZXNvdXJjZXMgYW5kIHRoZSBkZXZpY2UgcG93ZXIgbWV0aG9kcyBpbiBkZXRh
aWwuCj4gCj4gZWl0aGVyIEkgbG9va2VkIHVwIHRoZSB3cm9uZyBzcGVjIG9yIHRoZSBkb2N1bWVu
dGF0aW9uIGlzbid0IHJlYWxseQo+IHNheWluZyBtdWNoIHRoZXJlLgoKV2VsbCBpdCBleHBsYWlu
cyB0aG9zZSBtZXRob2RzLCBfUFN4LCBfUFJ4IGFuZCBfT04oKS9fT0ZGKCkuIEluIGNhc2Ugb2YK
UENJZSBkZXZpY2UgeW91IGFsc28gd2FudCB0byBjaGVjayBQQ0llIHNwZWMuIFBDSWUgNS4wIHNl
Y3Rpb24gNS44ICJQQ0kKRnVuY3Rpb24gUG93ZXIgU3RhdGUgVHJhbnNpdGlvbnMiIGhhcyBhIHBp
Y3R1cmUgYWJvdXQgdGhlIHN1cHBvcnRlZApwb3dlciBzdGF0ZSB0cmFuc2l0aW9ucyBhbmQgdGhl
cmUgd2UgY2FuIGZpbmQgdGhhdCBmdW5jdGlvbiBtdXN0IGJlIGluCkQzaG90IGJlZm9yZSBpdCBj
YW4gYmUgdHJhbnNpdGlvbmVkIGludG8gRDNjb2xkIHNvIGlmIHRoZSBfT0ZGKCkgZm9yCmV4YW1w
bGUgYmxpbmRseSBhc3N1bWVzIHRoYXQgdGhlIGRldmljZSBpcyBpbiBEMCB3aGVuIGl0IGlzIGNh
bGxlZCwgaXQKaXMgYSBidWcgaW4gdGhlIEJJT1MuCgpCVFcsIHdoZXJlIGNhbiBJIGZpbmQgYWNw
aWR1bXAgb2Ygc3VjaCBzeXN0ZW0/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
