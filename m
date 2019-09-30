Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1241C238D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38EF6E45F;
	Mon, 30 Sep 2019 14:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9819289EBD;
 Mon, 30 Sep 2019 08:05:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 01:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,565,1559545200"; d="scan'208";a="204781826"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 30 Sep 2019 01:05:35 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 30 Sep 2019 11:05:34 +0300
Date: Mon, 30 Sep 2019 11:05:34 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [RFC PATCH] pci: prevent putting pcie devices into lower device
 states on certain intel bridges
Message-ID: <20190930080534.GS2714@lahna.fi.intel.com>
References: <20190927144421.22608-1-kherbst@redhat.com>
 <20190927214252.GA65801@google.com>
 <CACO55tuaY1jFXpJPeC9M4PoWEDyy547_tE8MpLaTDb+C+ffsbg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tuaY1jFXpJPeC9M4PoWEDyy547_tE8MpLaTDb+C+ffsbg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Mon, 30 Sep 2019 14:43:56 +0000
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2Fyb2wsCgpPbiBGcmksIFNlcCAyNywgMjAxOSBhdCAxMTo1Mzo0OFBNICswMjAwLCBLYXJv
bCBIZXJic3Qgd3JvdGU6Cj4gPiBXaGF0IGV4YWN0bHkgaXMgdGhlIHNlcmlvdXMgaXNzdWU/ICBJ
IGd1ZXNzIGl0J3MgdGhhdCB0aGUgcmVzY2FuCj4gPiBkb2Vzbid0IGRldGVjdCB0aGUgR1BVLCB3
aGljaCBtZWFucyBpdCdzIG5vdCByZXNwb25kaW5nIHRvIGNvbmZpZwo+ID4gYWNjZXNzZXM/ICBJ
cyB0aGVyZSBhbnkgdGltaW5nIGNvbXBvbmVudCBoZXJlLCBlLmcuLCBtYXliZSB3ZSdyZQo+ID4g
bWlzc2luZyBzb21lIGRlbGF5IGxpa2UgdGhlIG9uZXMgTWlrYSBpcyBhZGRpbmcgdG8gdGhlIHJl
c2V0IHBhdGhzPwo+IAo+IFdoZW4gSSB3YXMgY2hlY2tpbmcgdXAgb24gc29tZSBvZiB0aGUgUENJ
IHJlZ2lzdGVycyBvZiB0aGUgYnJpZGdlCj4gY29udHJvbGxlciwgdGhlIHNsb3QgZGV0ZWN0aW9u
IHRvbGQgbWUgdGhhdCB0aGVyZSBpcyBubyBkZXZpY2UKPiByZWNvZ25pemVkIGFueW1vcmUuIEkg
ZG9uJ3Qga25vdyB3aGljaCByZWdpc3RlciBpdCB3YXMgYW55bW9yZSwgdGhvdWdoCj4gSSBndWVz
cyBvbmUgY291bGQgcmVhZCBpdCB1cCBpbiB0aGUgU29DIHNwZWMgZG9jdW1lbnQgYnkgSW50ZWwu
Cj4gCj4gTXkgZ3Vlc3MgaXMsIHRoYXQgdGhlIGJyaWRnZSBjb250cm9sbGVyIGZhaWxzIHRvIGRl
dGVjdCB0aGUgR1BVIGJlaW5nCj4gaGVyZSBvciBhY3RpdmVseSB0aHJldyBpdCBvZiB0aGUgYnVz
IG9yIHNvbWV0aGluZy4gQnV0IGEgbm9ybWFsIHN5c3RlbQo+IHN1c3BlbmQvcmVzdW1lIGN5Y2xl
IGJyaW5ncyB0aGUgR1BVIGJhY2sgb25saW5lIChkb2luZyBhIHJlc2NhbiB2aWEKPiBzeXNmcyBn
ZXRzIHRoZSBkZXZpY2UgZGV0ZWN0ZWQgYWdhaW4pCgpDYW4geW91IGVsYWJvcmF0ZSBhIGJpdCB3
aGF0IGtpbmQgb2Ygc2NlbmFyaW8gdGhlIGlzc3VlIGhhcHBlbnMgKGUuZwpzdGVwcyBob3cgaXQg
cmVwcm9kdWNlcyk/IEl0IHdhcyBub3QgMTAwJSBjbGVhciBmcm9tIHRoZSBjaGFuZ2Vsb2cuIEFs
c28Kd2hhdCB0aGUgcmVzdWx0IHdoZW4gdGhlIGZhaWx1cmUgaGFwcGVucz8KCkkgc2VlIHRoZXJl
IGlzIGEgc2NyaXB0IHRoYXQgZG9lcyBzb21ldGhpbmcgYnV0IHVuZm9ydHVuYXRlbHkgSSdtIG5v
dApmbHVlbnQgaW4gUHl0aG9uIHNvIGNhbid0IGV4dHJhY3QgdGhlIHN0ZXBzIGhvdyB0aGUgaXNz
dWUgY2FuIGJlCnJlcHJvZHVjZWQgOy0pCgpPbmUgdGhpbmcgdGhhdCBJJ20gd29ya2luZyBvbiBp
cyB0aGF0IExpbnV4IFBDSSBzdWJzeXN0ZW0gbWlzc2VzIGNlcnRhaW4KZGVsYXlzIHRoYXQgYXJl
IG5lZWRlZCBhZnRlciBEM2NvbGQgLT4gRDAgdHJhbnNpdGlvbiwgb3RoZXJ3aXNlIHRoZQpkZXZp
Y2UgYW5kL29yIGxpbmsgbWF5IG5vdCBiZSByZWFkeSBiZWZvcmUgd2UgYWNjZXNzIGl0LiBXaGF0
IHlvdSBhcmUKZXhwZXJpZW5jaW5nIHNvdW5kcyBzaW1pbGFyLiBJIHdvbmRlciBpZiB5b3UgY291
bGQgdHJ5IHRoZSBmb2xsb3dpbmcKcGF0Y2ggYW5kIHNlZSBpZiBpdCBtYWtlcyBhbnkgZGlmZmVy
ZW5jZT8KCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExMDY2MTEvCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
