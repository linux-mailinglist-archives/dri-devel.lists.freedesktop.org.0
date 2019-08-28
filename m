Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656EA0683
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 17:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5075689D77;
	Wed, 28 Aug 2019 15:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8C088F61;
 Wed, 28 Aug 2019 15:41:41 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 08:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; d="scan'208";a="197580979"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 28 Aug 2019 08:41:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 28 Aug 2019 18:41:37 +0300
Date: Wed, 28 Aug 2019 18:41:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] [PATCH v3 5/7] drm/nouveau: utilize subconnector
 property for DP
Message-ID: <20190828154137.GG7482@intel.com>
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
 <20190826132216.2823-6-oleg.vasilev@intel.com>
 <CAKb7UviahO6HWbxOoLyqN2X6WFw_GyucQuMs7Wj-MrKVNP1n_g@mail.gmail.com>
 <20190828143821.GD7482@intel.com>
 <CAKb7Uvg=5BrQmLsq_=Cv1D_-baQ_crWRDePbnXXKy-jCVXtvsA@mail.gmail.com>
 <20190828145404.GE7482@intel.com>
 <CAKb7UviDZZkOAQWu+_Lqw3TbhnKq138XM5HXNRUzoc5GCCZGNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UviDZZkOAQWu+_Lqw3TbhnKq138XM5HXNRUzoc5GCCZGNA@mail.gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Oleg Vasilev <oleg.vasilev@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTE6MTE6NDFBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTA6NTQgQU0gVmlsbGUgU3lyasOkbMOkCj4g
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEF1
ZyAyOCwgMjAxOSBhdCAxMDo0NzowOEFNIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+ID4g
T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTA6MzggQU0gVmlsbGUgU3lyasOkbMOkCj4gPiA+IDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBN
b24sIEF1ZyAyNiwgMjAxOSBhdCAwOTozNjo1MEFNIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToK
PiA+ID4gPiA+IFRoaXMgc2hvdWxkIHByb2JhYmx5IGJlIGZpeGVkIHRvIGFjY291bnQgZm9yIHRo
ZSBzY2VuYXJpbyB3aGVyZSBhbgo+ID4gPiA+ID4gSERNSSBjb25uZWN0b3IgaXMgcGx1Z2dlZCBk
aXJlY3RseSBpbnRvIHRoZSBEUCsrIHBvcnQuIEkgZG9uJ3QgdGhpbmsKPiA+ID4gPiA+IHRoZSBk
cC5zdWJjb25uZWN0b3IgcHJvcGVydHkgd2lsbCBiZSB2YWxpZCBpbiB0aGF0IGNhc2UuCj4gPiA+
ID4gPiAoVW5mb3J0dW5hdGVseSBJIGRvbid0IHJlbWVtYmVyIGhvdyBvbmUgZGV0ZWN0cyB0aGF0
IHBhcnRpY3VsYXIKPiA+ID4gPiA+IHNpdHVhdGlvbi4pCj4gPiA+ID4KPiA+ID4gPiBPbmUgbWF5
IG9yIG1heSBub3QgYmUgYWJsZSB0byBkZXRlY3QgaXQgdmVyeSB3ZWxsLiBJJ3ZlIHNlZW4gZG9u
Z2xlcwo+ID4gPiA+IHRoYXQgYXV0b21hZ2ljYWxseSBjaGFuZ2UgdGhlIERGUCB0eXBlIGZyb20g
RFArKyB0byBEUC9IRE1JIGRlcGVuZGluZwo+ID4gPiA+IG9uIHdoYXQncyBwbHVnZ2VkIGluLCBh
bmQgSSd2ZSBhbHNvIHNlZW4gZG9uZ2xlcyB0aGF0IGxlYXZlIHRoZSBERlAKPiA+ID4gPiB0eXBl
IHRvIERQKysuCj4gPiA+Cj4gPiA+IFdlbGwsIG91ciBpbnRlcm5hbCBsb2dpYyBjZXJ0YWlubHkg
a25vd3MgaWYgaXQncyBkcml2aW5nIERQIG9yIFRNRFMuIEkKPiA+ID4ganVzdCBkb24ndCByZW1l
bWJlciBob3cgaXQga25vd3MgdGhpcy4KPiA+Cj4gPiBZb3UnbGwgYmUgZHJpdmluZyBEUCBpbiB0
aGlzIGNhc2UuIFRoZSBERlAgd2lsbCBiZSB0aGUgb25lIGRyaXZpbmcKPiA+IERQIG9yIFRNRFMg
ZGVwZW5kaW5nIG9uIHdoYXQncyBwbHVnZ2VkIGluLgo+IAo+IE9LLiBUaGF0J3Mgbm90IHRoZSBj
YXNlIEkgd2FzIHdvcnJpZWQgYWJvdXQgdGhvdWdoIDopCj4gCj4gSSdtIHdvcnJpZWQgYWJvdXQg
dGhlIGNhc2Ugd2hlcmUgeW91IHBsdWcgYSB0cnVlIEhETUkgdGhpbmcgaW50byB0aGUKPiBEUCBw
b3J0LCB3aGljaCB3aWxsIHRoZW4gYmUgZHJpdmVuIGJ5IEhETUkgYW5kIG5vbmUgb2YgdGhlIGRw
LiogdGhpbmdzCj4gd2lsbCBiZSBzZXQgKEkgZG9uJ3QgcmVtZW1iZXIsIGJ1dCB0aGV5IG1pZ2h0
IGV2ZW4gYmUgaW4gYSB1bmlvbikuIEkKPiB0aGluayBJbnRlbCBtdWx0aXBsaWVzIGNvbm5lY3Rv
cnMgZm9yIHRoaXMsIGJ1dCBub3V2ZWF1L2FtZCBqdXN0IGhhdmUKPiBhIHNpbmdsZSBjb25uZWN0
b3IgdGhhdCBoYW5kbGVzIGJvdGguCgpBaC4gWWVhaCwgdGhhdCdzIGEgYml0IG1vcmUgY29uZnVz
aW5nIHNpbmNlIHlvdSBraW5kYSBub3cgaGF2ZSB0d28KbGV2ZWxzIG9mIHN1YmNvbm5lY3RvcnMu
IE5vdCBzdXJlIGhvdyB0byBkZWFsIHdpdGggdGhhdCB0YmguCgotLSAKVmlsbGUgU3lyasOkbMOk
CkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
