Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F437524
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 15:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBAA893B9;
	Thu,  6 Jun 2019 13:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8565893B9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 13:24:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 06:24:52 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 06 Jun 2019 06:24:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 06 Jun 2019 16:24:49 +0300
Date: Thu, 6 Jun 2019 16:24:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH 2/2] drm/edid: Ignore "DFP 1.x" bit for EDID 1.2 and
 earlier
Message-ID: <20190606132449.GW5942@intel.com>
References: <20190529110204.2384-1-ville.syrjala@linux.intel.com>
 <20190529110204.2384-2-ville.syrjala@linux.intel.com>
 <CADnq5_OC_fOj6RAagFp2-LuBYp4o3KZJ5NPScKwiu0MY1H1EVw@mail.gmail.com>
 <CAEsyxyig_2YappaFkekMEWBnG-L9pJULPWj0p-vooVV8BdqHiw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEsyxyig_2YappaFkekMEWBnG-L9pJULPWj0p-vooVV8BdqHiw@mail.gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDY6NTA6NDBQTSArMDIwMCwgTWFyaW8gS2xlaW5lciB3
cm90ZToKPiBPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCA3OjAyIEFNIFZpbGxlIFN5cmphbGEKPiA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPgo+ID4gRnJvbSBW
RVNBIEVESUQgaW1wbGVtZW50YXRpb24gZ3VpZGUgdjEuMDoKPiA+ICJGb3IgRURJRCB2ZXJzaW9u
IDEgcmV2aXNpb24gMiBvciBlYXJsaWVyIGRhdGEgc3RydWN0dXJlcyB3aGVuIG9mZnNldCAxNGgK
PiA+ICBiaXQgNyBpcyBzZXQgdG8gb25lLCB0aGUgdmFsdWUgb2YgYml0cyA2LTAgYXJlIHVuZGVm
aW5lZCwgYW5kIHRoZXJlZm9yZQo+ID4gIGNhbm5vdCBiZSBpbnRlcnByZXRlZCB0byBtZWFuIGFu
eXRoaW5nLiIKPiA+Cj4gPiBBbmQgc2luY2UgRURJRCAxLjQgcmVkZWZpbmVzIHRoYXQgYml0IGxl
dCdzIGNvbnN1bHQgaXQgb25seSBmb3IKPiA+IEVESUQgMS4zLgo+ID4KPiA+IENjOiBNYXJpbyBL
bGVpbmVyIDxtYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gWWVzLiBT
ZXJpZXMgaXM6Cj4gUmV2aWV3ZWQtYnk6IE1hcmlvIEtsZWluZXIgPG1hcmlvLmtsZWluZXIuZGVA
Z21haWwuY29tPgo+IAo+IC1tYXJpbwo+IAo+IE9uIFdlZCwgTWF5IDI5LCAyMDE5IGF0IDM6NTAg
UE0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9u
IFdlZCwgTWF5IDI5LCAyMDE5IGF0IDc6MDIgQU0gVmlsbGUgU3lyamFsYQo+ID4gPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+ID4KPiA+ID4gRnJvbSBW
RVNBIEVESUQgaW1wbGVtZW50YXRpb24gZ3VpZGUgdjEuMDoKPiA+ID4gIkZvciBFRElEIHZlcnNp
b24gMSByZXZpc2lvbiAyIG9yIGVhcmxpZXIgZGF0YSBzdHJ1Y3R1cmVzIHdoZW4gb2Zmc2V0IDE0
aAo+ID4gPiAgYml0IDcgaXMgc2V0IHRvIG9uZSwgdGhlIHZhbHVlIG9mIGJpdHMgNi0wIGFyZSB1
bmRlZmluZWQsIGFuZCB0aGVyZWZvcmUKPiA+ID4gIGNhbm5vdCBiZSBpbnRlcnByZXRlZCB0byBt
ZWFuIGFueXRoaW5nLiIKPiA+ID4KPiA+ID4gQW5kIHNpbmNlIEVESUQgMS40IHJlZGVmaW5lcyB0
aGF0IGJpdCBsZXQncyBjb25zdWx0IGl0IG9ubHkgZm9yCj4gPiA+IEVESUQgMS4zLgo+ID4gPgo+
ID4gPiBDYzogTWFyaW8gS2xlaW5lciA8bWFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+Cj4gPgo+ID4gU2VyaWVzIGlzOgo+ID4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KClRoYW5rcy4gU2VyaWVzIHB1c2hlZCB0byBkcm0t
bWlzYy1uZXh0LgoKPiA+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlk
LmMgfCA0ICsrLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gPiA+IGluZGV4IGRkNjAxZWQ2YTMw
ZS4uYzMyOTZhNzJmZmY5IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ID4gPiBAQCAtNDU2
OSw4ICs0NTY5LDggQEAgdTMyIGRybV9hZGRfZGlzcGxheV9pbmZvKHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IsIGNvbnN0IHN0cnVjdCBlZGlkICplZGkKPiA+ID4gICAgICAgICAgKiB0
ZWxscyB1cyB0byBhc3N1bWUgOCBicGMgY29sb3IgZGVwdGggaWYgdGhlIEVESUQgZG9lc24ndCBo
YXZlCj4gPiA+ICAgICAgICAgICogZXh0ZW5zaW9ucyB3aGljaCB0ZWxsIG90aGVyd2lzZS4KPiA+
ID4gICAgICAgICAgKi8KPiA+ID4gLSAgICAgICBpZiAoKGluZm8tPmJwYyA9PSAwKSAmJiAoZWRp
ZC0+cmV2aXNpb24gPCA0KSAmJgo+ID4gPiAtICAgICAgICAgICAoZWRpZC0+aW5wdXQgJiBEUk1f
RURJRF9ESUdJVEFMX0RGUF8xX1gpKSB7Cj4gPiA+ICsgICAgICAgaWYgKGluZm8tPmJwYyA9PSAw
ICYmIGVkaWQtPnJldmlzaW9uID09IDMgJiYKPiA+ID4gKyAgICAgICAgICAgZWRpZC0+aW5wdXQg
JiBEUk1fRURJRF9ESUdJVEFMX0RGUF8xX1gpIHsKPiA+ID4gICAgICAgICAgICAgICAgIGluZm8t
PmJwYyA9IDg7Cj4gPiA+ICAgICAgICAgICAgICAgICBEUk1fREVCVUcoIiVzOiBBc3NpZ25pbmcg
REZQIHNpbmsgY29sb3IgZGVwdGggYXMgJWQgYnBjLlxuIiwKPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25uZWN0b3ItPm5hbWUsIGluZm8tPmJwYyk7Cj4gPiA+IC0tCj4gPiA+IDIu
MjEuMAo+ID4gPgo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
