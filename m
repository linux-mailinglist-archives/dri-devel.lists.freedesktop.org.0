Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B69E03CA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 14:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534276E14E;
	Tue, 22 Oct 2019 12:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AFC6E14E;
 Tue, 22 Oct 2019 12:25:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 05:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,327,1566889200"; d="scan'208";a="227684673"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 22 Oct 2019 05:25:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 22 Oct 2019 15:25:11 +0300
Date: Tue, 22 Oct 2019 15:25:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Sharma, Shashank" <shashank.sharma@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm: Introduce scaling filter mode
 property
Message-ID: <20191022122511.GK1208@intel.com>
References: <20191022095946.29354-1-shashank.sharma@intel.com>
 <20191022095946.29354-2-shashank.sharma@intel.com>
 <20191022100844.GI11828@phenom.ffwll.local>
 <FF3DDC77922A8A4BB08A3BC48A1EA8CB8E03C761@BGSMSX101.gar.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FF3DDC77922A8A4BB08A3BC48A1EA8CB8E03C761@BGSMSX101.gar.corp.intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTA6MTI6MjlBTSArMDAwMCwgU2hhcm1hLCBTaGFzaGFu
ayB3cm90ZToKPiBIZXkgRGFuaWVsLCAKPiAKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4gPiBGcm9tOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPiBPbiBCZWhh
bGYgT2YgRGFuaWVsIFZldHRlcgo+ID4gU2VudDogVHVlc2RheSwgT2N0b2JlciAyMiwgMjAxOSAz
OjM5IFBNCj4gPiBUbzogU2hhcm1hLCBTaGFzaGFuayA8c2hhc2hhbmsuc2hhcm1hQGludGVsLmNv
bT4KPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1BBVENIIDEv
M10gZHJtOiBJbnRyb2R1Y2Ugc2NhbGluZyBmaWx0ZXIgbW9kZSBwcm9wZXJ0eQo+ID4gCj4gPiBP
biBUdWUsIE9jdCAyMiwgMjAxOSBhdCAwMzoyOTo0NFBNICswNTMwLCBTaGFzaGFuayBTaGFybWEg
d3JvdGU6Cj4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBhIHNjYWxpbmcgZmlsdGVyIG1vZGUgcG9ycGVy
dHkgdG8gYWxsb3c6Cj4gPiA+IC0gQSBkcml2ZXIvSFcgdG8gc2hvd2Nhc2UgaXQncyBzY2FsaW5n
IGZpbHRlciBjYXBhYmlsaXRpZXMuCj4gPiA+IC0gQSB1c2Vyc3BhY2UgdG8gcGljayBhIGRlc2ly
ZWQgZWZmZWN0IHdoaWxlIHNjYWxpbmcuCj4gPiA+Cj4gPiA+IFRoaXMgb3B0aW9uIHdpbGwgYmUg
cGFydGljdWxhcmx5IHVzZWZ1bCBpbiB0aGUgc2NlbmFyaW9zIHdoZXJlIEludGVnZXIKPiA+ID4g
bW9kZSBzY2FsaW5nIGlzIHBvc3NpYmxlLCBhbmQgYSBVSSBjbGllbnQgd2FudHMgdG8gcGljayBm
aWx0ZXJzIGxpa2UKPiA+ID4gTmVhcmVzdC1uZWlnaGJvciBhcHBsaWVkIGZvciBub24tYmx1cnJ5
IG91dHB1dHMuCj4gPiA+Cj4gPiA+IFRoZXJlIHdhcyBhIFJGQyBwYXRjaCBzZXJpZXMgcHVibGlz
aGVkLCB0byBkaXNjdXMgdGhlIHJlcXVlc3QgdG8KPiA+ID4gZW5hYmxlIEludGVnZXIgbW9kZSBz
Y2FsaW5nIGJ5IHNvbWUgb2YgdGhlIGdhbWluZyBjb21tdW5pdGllcywgd2hpY2gKPiA+ID4gY2Fu
IGJlIGZvdW5kIGhlcmU6Cj4gPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvNjYxNzUvCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNoYXNoYW5rIFNoYXJtYSA8
c2hhc2hhbmsuc2hhcm1hQGludGVsLmNvbT4KPiA+IAo+ID4gVHdvIHRoaW5nczoKPiA+IAo+ID4g
LSBuZWVkcyByZWFsIHByb3BlcnR5IGRvY3MgZm9yIHRoaXMgaW4gdGhlIGttcyBwcm9wZXJ0eSBj
aGFwdGVyCj4gR290IGl0LCAKPiA+IC0gd291bGQgYmUgZ29vZCBpZiB3ZSBjb3VsZCBzb21laG93
IHN1YnN1bWUgdGhlIHBhbmVsIGZpdHRlciBwcm9wIGludG8KPiA+ICAgdGhpcz8gT3IgYXQgbGVh
c3QgZG9jdW1lbnQgcG9zc2libGUgaW50ZXJhY3Rpb25zIHdpdGggdGhhdC4KPiA+IAo+IFN1cmUs
IGxldCBtZSBzZWUgd2hhdCBjYW4gSSBkbyBoZXJlLiAKClRoZSBzY2FsaW5nIG1vZGUgcHJvcCBo
YXMgbm90aGluZyByZWFsbHkgdG8gZG8gd2l0aCB0aGUgZmlsdGVyIGJlaW5nCnVzZWQuIFRoZSBz
Y2FsaW5nIG1vZGUgcHJvcCBqdXN0IHByb3ZpZGVzIGEgYmFkIG1lY2hhbmlzbSBmb3IKY29uZmln
dXJpbmcgdGhlIGRlc3RpbmF0aW9uIGNvb3JkaW5hdGVzIG9mIHRoZSBzY2FsZXIuCgpUcnlpbmcg
dG8gc2hvZWhvcm4gdGhlc2UgdGhpbmdzIGludG8gb25lIHByb3Agd291bGQgYmUgYSBtaXN0YWtl
IElNTy4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
