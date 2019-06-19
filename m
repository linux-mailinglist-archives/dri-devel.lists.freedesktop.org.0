Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25CA4BE4E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 18:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3B56E442;
	Wed, 19 Jun 2019 16:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A9F6E442;
 Wed, 19 Jun 2019 16:33:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 09:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="160414971"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 19 Jun 2019 09:33:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Jun 2019 19:33:27 +0300
Date: Wed, 19 Jun 2019 19:33:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [RFC] Exposing plane type mask and handling 'all' planes
Message-ID: <20190619163327.GC5942@intel.com>
References: <20190619160353.GE1896@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619160353.GE1896@arch-x1c3>
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
Cc: intel-gfx@lists.freedesktop.org, Miguel Casas-Sanchez <mcasas@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Alexandros Frantzis <alexandros.frantzis@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDU6MDM6NTNQTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IEhpIGFsbCwKPiAKPiBSZWNlbnRseSBJIGhhdmUgYmVlbiBsb29raW5nIGF0IGk5MTUg
YW5kIGl0cyByYXRoZXIgaW50ZXJlc3RpbmcgcGxhbmVzLgo+IAo+IEluIHBhcnRpY3VsYXIgbmV3
ZXIgaGFyZHdhcmUgaXMgY2FwYWJsZSBvZiB1c2luZyAzIHVuaXZlcnNhbCBwbGFuZXMgYW5kCj4g
YSBzZXBhcmF0ZSBjdXJzb3Itb25seSBwbGFuZS4gQXQgdGhlIHNhbWUgdGltZSBvbmx5IDEgdG9w
LW1vc3QgcGxhbmUgY2FuCj4gYmUgZW5hYmxlZCAtIGxldHMgY2FsbHMgdGhvc2UgcGxhbmUzIG9y
IGN1cnNvci4KPiAKPiBIZW5jZSBjdXJyZW50bHkgdGhlIGhhcmR3YXJlIGhhcyBhbiBleHRyYSBw
bGFuZSB3aGljaCB3ZSBkbyBub3QgdXNlLgoKT25seSBza2wgKGFuZCBkZXJpdmF0aXZlcykgaGF2
ZSB0aGF0LiBNb3JlIG1vZGVybiBwbGF0Zm9ybXMgd2VudCBiYWNrIHRvCnRoZSBkZWRpY2F0ZWQg
Y3Vyc29yIHBsYW5lLiBTbyBJTU8gbm8gcG9pbnQgaW4gZXhwb3NpbmcgdGhpcyBtZXNzIGF0CmFs
bC4KCj4gCj4gVGhlIGN1cnJlbnQgRFJNIGRlc2lnbiBkb2VzIG5vdCBhbGxvdyB1cyB0byBmdWxs
eSB1dGlsaXNlIHRoZSBIVyBhbmQgSQo+IHdvdWxkIGxvdmUgdG8gYWRkcmVzcyB0aGF0LiBIZXJl
IGFyZSB0aHJlZSBhcHByb2FjaGVzIHRoYXQgY29tZSB0byBtaW5kOgo+IAo+IDEpIEV4dGVuZCB0
aGUgRFJNIHBsYW5lIFVBUEkgdG86Cj4gIC0gZXhwb3NlIGEgbWFzayBvZiBzdXBwb3J0ZWQgdHlw
ZXMsIGFuZAo+ICAtIGFsbG93IHVzZXJzcGFjZSB0byBzZWxlY3QgdGhlIHR5cGUKPiAKPiAyKSBL
ZWVwIHRoZSBleHBvc2VkIHBsYW5lcyBhcy1pcyBhbmQgbGV0IHRoZSBkcml2ZXIgb3JjaGVzdHJh
dGUgd2hpY2gKPiAgICBvbmUgZ2V0cyB1c2VkLgo+ICAtIGZsaXAgYmV0d2VlbiBjdXJzb3IvcGxh
bmUzIGJhc2VkIG9uIHRoZSB1c2UtY2FzZS9BUEkgdXNlZCwgb3IKPiAgLSBvcHQgZm9yIHBsYW5l
My9jdXJzb3IgZm9yIGF0b21pYyBhbmQgbGVnYWN5IG1vZGVzZXQgY29kZSBwYXRoLCBvcgo+ICAt
IG90aGVyCj4gCj4gMykgRXhwb3NlIHBsYW5lMyBhbmQgY3Vyc29yLCB3aGVyZWJ5IHVzaW5nIG9u
ZSBvZiB0aGVtICJtYXJrcyIgdGhlIG90aGVyCj4gICAgYXMgdXNlZC4KPiAgLSBpcyB0aGlzIGFs
bG93ZWQgYnkgdGhlIG1vZGVzZXQgc2VtYW50aWNzL3BvbGljeT8KPiAgLSBkb2VzIGV4aXN0aW5n
IHVzZXItc3BhY2UgaGF2ZSBmYWxsYmFjayBwYXRoPwo+IAo+IAo+IFBlcnNvbmFsbHksIEkgd291
bGQgbG92ZSBleGlzdGluZyB1c2VyLXNwYWNlIHRvIGp1c3Qgd29yayB3aXRob3V0Cj4gbW9kaWZp
Y2F0aW9uLiBBdCB0aGUgc2FtZSB0aW1lIG9wdGluZyBmb3IgMiB0aGlzIHdpbGwgY2F1c2UgYSBz
ZXJpb3VzCj4gYW1vdW50IG9mIGNvbXBsaWNhdGlvbiwgYW5kIGluIGNhc2Ugb2YgMyB0aGUgd2hv
bGUgdGhpbmcgd2lsbCBiZSB2ZXJ5Cj4gZnJhZ2lsZS4gU28gbXkgY3VycmVudCBpbmNsaW5hdGlv
biBpcyB0b3dhcmRzIDEuCj4gCj4gT3BlbiBxdWVzdGlvbnM6Cj4gIC0gRG8gd2Uga25vdyBvZiBv
dGhlciBoYXJkd2FyZSB3aXRoIHRoaXMgb3IgcmVsYXRlZCBkZXNpZ24gd2hpY2ggZG9lcwo+IG5v
dCBmaXQgdGhlIGN1cnJlbnQgRFJNIGRlc2lnbj8KPiAgLSBWZW5kb3IgS01TIHNwZWNpZmljIFVB
UEksIGlzIGZyb3duZWQgdXBvbi4gU28gaWYgd2UgYXJlIHRvIGV4dGVuZCB0aGUKPiBVQVBJLCBk
b2VzIHRoZSBjdXJyZW50IGFwcHJvYWNoIHNvdW5kIHVzZWZ1bCBmb3Igb3RoZXIgSFc/Cj4gIC0g
RG9lcyB0aGlzIGFwcHJvYWNoIHNvdW5kIHJlYXNvbmFibGUsIGNhbiBvdGhlciBzaGFyZSB0aGVp
ciB2aWV3IG9uIGEgCj4gYmV0dGVyIGFwcHJvYWNoLCB0aGF0IGFjaGlldmVzIHRoZSBnb2FsPwo+
IAo+IElucHV0IGFuZCBpZGVhcyBmcm9tIHRoZSBJbnRlbCB0ZWFtIGFuZCBEUk0gY29tbXVuaXR5
IGFyZSB2ZXJ5IG11Y2gKPiBhcHByZWNpYXRlZC4KPiAKPiBUaGFua3MKPiBFbWlsCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKVmlsbGUg
U3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
