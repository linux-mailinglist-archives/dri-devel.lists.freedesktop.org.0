Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4024F7608
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 15:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E3F6E1F2;
	Mon, 11 Nov 2019 14:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3E36E1F2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 14:11:09 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 06:11:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="249078567"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 11 Nov 2019 06:11:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 11 Nov 2019 16:11:03 +0200
Date: Mon, 11 Nov 2019 16:11:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] drm: Add DRM_MODE_TYPE_USERDEF flag to probed modes
 matching a video= argument
Message-ID: <20191111141103.GN1208@intel.com>
References: <20191110184055.3979-1-hdegoede@redhat.com>
 <CAKMK7uEnpH3e+B_4Z5oMTDyJMe=aETUm0C_a7U9mOLPWyVVOew@mail.gmail.com>
 <18aaecf8-d7f6-55b1-be05-7eb767abc30d@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18aaecf8-d7f6-55b1-be05-7eb767abc30d@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mathieu =?iso-8859-1?Q?Alexandre-T=E9treault?= <alexandretm@amotus.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMTA6NTA6NDJBTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBIaSwKPiAKPiBPbiAxMS0xMS0yMDE5IDEwOjI1LCBEYW5pZWwgVmV0dGVyIHdyb3Rl
Ogo+ID4gT24gU3VuLCBOb3YgMTAsIDIwMTkgYXQgNzo0MSBQTSBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPiB3cm90ZToKPiA+Pgo+ID4+IGRybV9oZWxwZXJfcHJvYmVfYWRkX2Nt
ZGxpbmVfbW9kZSgpIHByZWZlcnMgdXNpbmcgYSBwcm9iZWQgbW9kZSBtYXRjaGluZwo+ID4+IGEg
dmlkZW89IGFyZ3VtZW50IG92ZXIgY2FsY3VsYXRpbmcgb3VyIG93biB0aW1pbmdzIGZvciB0aGUg
dXNlciBzcGVjaWZpZWQKPiA+PiBtb2RlIHVzaW5nIENWVCBvciBHVEYuCj4gPj4KPiA+PiBCdXQg
dXNlcnNwYWNlIGNvZGUgd2hpY2ggaXMgYXV0by1jb25maWd1cmluZyB0aGUgbW9kZSBtYXkgd2Fu
dCB0byBrbm93IHRoYXQKPiA+PiB0aGUgdXNlciBoYXMgc3BlY2lmaWVkIHRoYXQgbW9kZSBvbiB0
aGUga2VybmVsIGNvbW1hbmRsaW5lIHNvIHRoYXQgaXQgY2FuCj4gPj4gcGljayB0aGF0IG1vZGUg
b3ZlciB0aGUgbW9kZSB3aGljaCBpcyBtYXJrZWQgYXMgRFJNX01PREVfVFlQRV9QUkVGRVJSRUQu
Cj4gPj4KPiA+PiBUaGlzIGNvbW1pdCBzZXRzIHRoZSBEUk1fTU9ERV9UWVBFX1VTRVJERUYgZmxh
ZyBvbiB0aGUgbWF0Y2hpbmcgbW9kZSwganVzdAo+ID4+IGFzIHdlIHdvdWxkIGRvIG9uIHRoZSB1
c2VyLXNwZWNpZmllZCBtb2RlIHdoZW4gbm8gbWF0Y2hpbmcgcHJvYmVkIG1vZGUgaXMKPiA+PiBm
b3VuZC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+Cj4gPiAKPiA+IFdpbGwgZXhpc3RpbmcgdXNlcnNwYWNlIGR0cnQgaGVyZSB3aXRo
IHRoaXM/IFNvbWUgbGlua3MgdG8gcG9wdWxhcgo+ID4gb25lcyB3b3VsZCBiZSBnb29kIChzaW5j
ZSBlc3NlbnRpYWxseSB0aGlzIGlzIHVhcGkgZmluZSB0dW5pbmcgd2UgbmVlZAo+ID4gdGhhdCBh
bnl3YXkpLiBXaXRoIHRoYXQgd2lsbCBnZXQgbXkgYWNrLgo+IAo+IEEgdmFsaWQgcXVlc3Rpb24s
IEkndmUgZ29uZSBvdmVyIHdoYXQgSSBjb25zaWRlciB0aGUgbWFqb3IgdXNlcnNwYWNlIGttcyB1
c2VyczoKPiAtWG9yZyB4c2VydmVyIG1vZGVzZXR0aW5nIGRyaXZlciBkb2VzIG5vdCBjaGVjayBm
b3IgdGhpczoKPiAgIFtoYW5zQHNoYWxlbSB4c2VydmVyXSQgYWNrIERSTV9NT0RFX1RZUEVfIGh3
L3hmcmVlODYvZHJpdmVycy9tb2Rlc2V0dGluZy8KPiAgIGh3L3hmcmVlODYvZHJpdmVycy9tb2Rl
c2V0dGluZy9kcm1tb2RlX2Rpc3BsYXkuYwo+ICAgMTMyMTogICAgaWYgKGttb2RlLT50eXBlICYg
RFJNX01PREVfVFlQRV9EUklWRVIpCj4gICAxMzIzOiAgICBpZiAoa21vZGUtPnR5cGUgJiBEUk1f
TU9ERV9UWVBFX1BSRUZFUlJFRCkKPiAtT3RoZXIgWG9yZyBkcml2ZXJzOgo+ICAgW2hhbnNAc2hh
bGVtIGRyaXZlcl0kIGxzIC1kIHhmODYtdmlkZW8tKgo+ICAgeGY4Ni12aWRlby1hbWRncHUgIHhm
ODYtdmlkZW8taW50ZWwgICAgICAgIHhmODYtdmlkZW8tcXhsCj4gICB4Zjg2LXZpZGVvLWFybXNv
YyAgeGY4Ni12aWRlby1tb2Rlc2V0dGluZyAgeGY4Ni12aWRlby1zaXN1c2IKPiAgIHhmODYtdmlk
ZW8tYXRpICAgICB4Zjg2LXZpZGVvLW5vdXZlYXUgICAgICB4Zjg2LXZpZGVvLXZtd2FyZQo+ICAg
eGY4Ni12aWRlby1kdW1teSAgIHhmODYtdmlkZW8tb21hcCAgICAgICAgIHhmODYtdmlkZW8tdm9v
ZG9vCj4gICB4Zjg2LXZpZGVvLWdlb2RlICAgeGY4Ni12aWRlby1vcGVudGVncmEKPiAgIFRoZXNl
IGFsbCBvbmx5IGRvIHRoZSBzYW1lIGNoZWNrcyBhcyB0aGUgWG9yZyBtb2Rlc2V0dGluZyBkcml2
ZXIKPiAtbXV0dGVyOgo+ICAgW2hhbnNAc2hhbGVtIG11dHRlcl0kIGFjayBEUk1fTU9ERV9UWVBF
Xwo+ICAgc3JjL2JhY2tlbmRzL25hdGl2ZS9tZXRhLW91dHB1dC1rbXMuYwo+ICAgMjYxOiAgICAg
IGlmIChkcm1fbW9kZS0+dHlwZSAmIERSTV9NT0RFX1RZUEVfUFJFRkVSUkVEKQo+IAo+IFNvIGl0
IHNlZW1zIG5vdGhpbmcgKHRoYXQgSSBjYW4gcXVpY2tseSBmaW5kKSBpbiB1c2Vyc3BhY2UgaXMg
dXNpbmcgdGhpcyBhdG0uCj4gCj4gVGhlIHJlYXNvbiBJIHdyb3RlIHRoaXMgcGF0Y2ggaXMgYmVj
YXVzZSBhYm91dCBhIHllYXIgYWdvIHBseW1vdXRoIHVzZWQgdG8KPiBmdWxseSByZWx5IG9uIHRo
ZSBrZXJuZWwgdG8gc2V0dXAgdGhlIG1vZGVzIG9uIG1vbml0b3JzIGFuZCB3b3VsZCBzaW1wbHkK
PiBpbmhlcml0IHRoZSBtb2RlcyBzZXR1cCBieSB0aGUga2VybmVsLiBCYXNpY2FsbHkgcGx5bW91
dGggd2FzIHJlbHlpbmcgb24KPiBmYmNvbiB0byBsb2FkIGZpcnN0IGFuZCBzZXR1cCBtb2Rlcy4K
PiAKPiBEZWZlcnJlZCBmYmNvbiB0YWtlb3ZlciAoZm9yIGZsaWNrZXJmcmVlKSBtZWFucyB0aGF0
IHRoaXMgaXMgbm8gbG9uZ2VyCj4gaGFwcGVuaW5nLiBTbyBub3cgcGx5bW91dGggcGlja3MgYSBt
b2RlIGl0c2VsZi4gV2hlbiBJIHN1Ym1pdHRlZCB0aGUKPiBwbHltb3V0aCBjaGFuZ2UgZm9yIHBs
eW1vdXRoIHRvIHBpY2sgYSBtb2RlIGl0c2VsZiB0aGUgcGx5bW91dGggbWFpbnRhaW5lcgo+IChS
YXkgU3Ryb2RlKSB3YXMgYWZyYWlkIHRoYXQgd291bGQgYnJlYWsgcGx5bW91dGggaG9ub3Jpbmcg
dmlkZW89IGFyZ3VtZW50cy4KPiBTbyBjdXJyZW50bHkgcGx5bW91dGggc3RpbGwgcmVsaWVzIG9u
IHRoZSBrZXJuZWwgdG8gZG8gdGhlIG1vZGUgc2V0dXAgaWYKPiBhIHZpZGVvPSBhcmd1bWVudCBp
cyBwcmVzZW50IG9uIHRoZSBrZXJuZWwgY29tbWFuZGxpbmUuCgpXaHkgY2FuJ3QgcGx5bW91dGgg
anVzdCBrZWVwIHVzaW5nIHRoZSBjdXJyZW50IG1vZGUgaWYgdGhlIGNydGMgaXMKYWxyZWFkeSBh
Y3RpdmUgYW5kIG90aGVyd2lzZSBwaWNrIGEgbW9kZSBpdHNlbGY/CgotLSAKVmlsbGUgU3lyasOk
bMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
