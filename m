Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D47D010DA33
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 20:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F7E6EE75;
	Fri, 29 Nov 2019 19:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF1A6EE75
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 19:43:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 11:43:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,258,1571727600"; d="scan'208";a="207412632"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 29 Nov 2019 11:43:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 29 Nov 2019 21:43:45 +0200
Date: Fri, 29 Nov 2019 21:43:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] drm/panfrost: Document base field location constraint
 in panfrost_gem_object
Message-ID: <20191129194345.GG1208@intel.com>
References: <20191129135614.2439058-1-boris.brezillon@collabora.com>
 <b603bc00-832c-ae0d-8dfa-57a0b791d6f9@arm.com>
 <20191129151936.5fb18d2e@collabora.com>
 <20191129184038.GK624164@phenom.ffwll.local>
 <20191129202437.0a3c6c25@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129202437.0a3c6c25@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDg6MjQ6MzdQTSArMDEwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IE9uIEZyaSwgMjkgTm92IDIwMTkgMTk6NDA6MzggKzAxMDAKPiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+IAo+ID4gT24gRnJpLCBOb3YgMjksIDIwMTkg
YXQgMDM6MTk6MzZQTSArMDEwMCwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+ID4gPiBPbiBGcmks
IDI5IE5vdiAyMDE5IDE0OjEzOjMzICswMDAwCj4gPiA+IFN0ZXZlbiBQcmljZSA8c3RldmVuLnBy
aWNlQGFybS5jb20+IHdyb3RlOgo+ID4gPiAgIAo+ID4gPiA+IE9uIDI5LzExLzIwMTkgMTM6NTYs
IEJvcmlzIEJyZXppbGxvbiB3cm90ZTogIAo+ID4gPiA+ID4gSSd2ZSBzcGVudCBob3VycyBjaGFz
aW5nIGEgbWVtb3J5IGNvcnJ1cHRpb24gdGhhdCB3YXMgY2F1c2VkIGJ5Cj4gPiA+ID4gPiBpbnNl
cnRpb24gb2YgYW4gZXh0cmEgZmllbGQgZmllbGQgYmVmb3JlIC0+YmFzZS4gTGV0J3MgZG9jdW1l
bnQgdGhlCj4gPiA+ID4gPiBmYWN0IHRoYXQgYmFzZSBoYXMgdG8gYmUgdGhlIGZpcnN0IGZpZWxk
IGluIHBhbmZyb3N0X2dlbV9vYmplY3QuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+ICAgIAo+
ID4gPiA+IAo+ID4gPiA+IFRoaXMgc2VlbXMgdG8gYmUgYSBsaW1pdGF0aW9uIGltcG9zZWQgYnkg
dGhlIGdlbV9jcmVhdGVfb2JqZWN0KCkKPiA+ID4gPiBjYWxsYmFjayAtIGUuZy4gaXQncyBhc3N1
bWVkIHRoYXQga2ZyZWUoKSBjYW4gYmUgZGlyZWN0bHkgY2FsbGVkIG9uIHRoZQo+ID4gPiA+IHJl
c3VsdC4gVXNlZnVsIHRvIGhhdmUgdGhlIGRvY3VtZW50YXRpb24gdGhvdWdoLiAgCj4gPiA+IAo+
ID4gPiBPaCwgeW91J3JlIHJpZ2h0LCBJIGRpZG4ndCBjYXRjaCB0aGF0IG9uZS4gIAo+ID4gCj4g
PiBBcyBhIGdlbmVyYWwgcnVsZSBvZiB0aHVtYiwgbmV2ZXIgaW5zZXJ0IGFueXRoaW5nIGJlZm9y
ZSBhIHN0cnVjdCBtZW1iZXIKPiA+IGNhbGxlZCBiYXNlLiBFdmVuIG1vcmUgc28gaWYgaXQncyBv
ZiB0aGUgc2FtZSBraW5kIG9mICR0aGluZywgYnV0IGxlc3MKPiA+IHNwZXppYWxlZC4gVGhpcyBw
YXR0ZXJuIGlzIHNvIGNvbW1vbiBpdCdzIGZhaXJseSBvZnRlbiBub3QgZG9jdW1lbnRlZAo+ID4g
YW55d2hlcmUuCj4gCj4gSSBjb3VsZCBhcmd1ZSB0aGF0IGFueXRoaW5nIHVzaW5nIGNvbnRhaW5l
cl9vZigpIGluIGl0cyB0b194eHgoKSBoZWxwZXIKPiBpcyBtaXNsZWFkaW5nIHRoZSB1c2VyIGlu
dG8gdGhpbmtpbmcgdGhlIHBvc2l0aW9uIG9mIHRoZSBiYXNlIGZpZWxkCj4gZG9lc24ndCBtYXR0
ZXIgKHdoaWNoIGlzIGV4YWN0bHkgd2hhdCBoYXBwZW5lZCBoZXJlKSwgYnV0IEkgZmVlbCBsaWtl
IEkKPiBhbHJlYWR5IGxvc3QgdGhpcyBiYXR0bGUsIHNvIEknbGwgc2ltcGx5IGRyb3AgdGhlIHBh
dGNoLgoKSSBhZ3JlZSB0aGF0IHRoaXMgaXMgYSBiaXQgYW5ub3lpbmcuIEFwYXJ0IGZyb20gdGhl
ICJsZXQncyBwYXNzCnRoZSB3cm9uZyB0aGluZyB0byBrZnJlZSgpIiBpc3N1ZSB0aGUgb3RoZXIg
cHJvYmxlbSBpcyBOVUxMCnBvaW50ZXJzLiBJZiB0aG9zZSBkb24ndCBnZXQgcHJlc2VydmVkIHdo
ZW4gZ29pbmcgYmV0d2VlbiB0aGUKYmFzZSBhbmQgZGVyaXZlZCBjbGFzcyB0aGUgY29kZSB3aWxs
IHR1cm4gdG8gYmFkIHNwYWdoZXR0aS4KCk5vdCBhIHByb2JsZW0gZm9yIHRoZSB0eXBpY2FsIHRv
X2Zvb19jcnRjKCkgc2luY2Ugd2UgY291bGQKaGlkZSBhbiBleHBsaWNpdCBOVUxMIGNoZWNrIGlu
IHRoZXJlLiBCdXQgdGhlIG90aGVyIGRpcmVjdGlvbgpnZW5lcmFsbHkganVzdCB1c2VzICZmb29f
Y3J0Yy0+YmFzZSBzbyBub3QgZ29pbmcgdG8gd29yay4KU2hvdWxkbid0IGJlIGFuIGltcG9zc2li
bGUgdGFzayB0byB3cmFwIGFsbCBvZiB0aG9zZSBhcyB3ZWxsLApidXQgSSBndWVzcyBubyBvbmUn
cyBtb3RpdmF0ZWQgZW5vdWdoIHRvIGFjdHVhbGx5IGRvIGl0LgoKLS0gClZpbGxlIFN5cmrDpGzD
pApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
