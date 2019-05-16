Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 397FE20826
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 15:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB66C8959D;
	Thu, 16 May 2019 13:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343AC89590;
 Thu, 16 May 2019 13:28:10 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2019 06:28:09 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 16 May 2019 06:28:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 16 May 2019 16:28:03 +0300
Date: Thu, 16 May 2019 16:28:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 04/10] drm: Convert
 connector_helper_funcs->atomic_check to accept drm_atomic_state
Message-ID: <20190516132803.GM24299@intel.com>
References: <20190502194956.218441-1-sean@poorly.run>
 <20190502194956.218441-5-sean@poorly.run>
 <20190511191202.GL13043@pendragon.ideasonboard.com>
 <20190513144747.GR17751@phenom.ffwll.local>
 <20190516120221.GI14820@pendragon.ideasonboard.com>
 <CAKMK7uG_TmzZBgVkJ+j9C53KRp1OgswYuxpFV77+eU6BPWwGgw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG_TmzZBgVkJ+j9C53KRp1OgswYuxpFV77+eU6BPWwGgw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDI6MDc6MzRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAyOjAyIFBNIExhdXJlbnQgUGluY2hhcnQK
PiA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBE
YW5pZWwsCj4gPgo+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6NDc6NDdQTSArMDIwMCwg
RGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gT24gU2F0LCBNYXkgMTEsIDIwMTkgYXQgMTA6MTI6
MDJQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE1heSAw
MiwgMjAxOSBhdCAwMzo0OTo0NlBNIC0wNDAwLCBTZWFuIFBhdWwgd3JvdGU6Cj4gPiA+ID4+IEZy
b206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+ID4gPiA+Pgo+ID4gPiA+PiBF
dmVyeW9uZSB3aG8gaW1wbGVtZW50cyBjb25uZWN0b3JfaGVscGVyX2Z1bmNzLT5hdG9taWNfY2hl
Y2sgcmVhY2hlcwo+ID4gPiA+PiBpbnRvIHRoZSBjb25uZWN0b3Igc3RhdGUgdG8gZ2V0IHRoZSBh
dG9taWMgc3RhdGUuIEluc3RlYWQgb2YgY29udGludWluZwo+ID4gPiA+PiB0aGlzIHBhdHRlcm4s
IGNoYW5nZSB0aGUgY2FsbGJhY2sgc2lnbmF0dXJlIHRvIGp1c3QgZ2l2ZSBhdG9taWMgc3RhdGUK
PiA+ID4gPj4gYW5kIGxldCB0aGUgZHJpdmVyIGRldGVybWluZSB3aGF0IGl0IGRvZXMgYW5kIGRv
ZXMgbm90IG5lZWQgZnJvbSBpdC4KPiA+ID4gPj4KPiA+ID4gPj4gRXZlbnR1YWxseSBhbGwgYXRv
bWljIGZ1bmN0aW9ucyBzaG91bGQgZG8gdGhpcywgYnV0IHRoYXQncyBqdXN0IHRvbyBtdWNoCj4g
PiA+ID4+IGJ1c3kgd29yayBmb3IgbWUuCj4gPiA+ID4KPiA+ID4gPiBHaXZlbiB0aGF0IGRyaXZl
cnMgYWxzbyBhY2Nlc3MgdGhlIGNvbm5lY3RvciBzdGF0ZSwgaXNuJ3QgdGhpcyBzbGlnaHRseQo+
ID4gPiA+IG1vcmUgaW5lZmZpY2llbnQgPwo+ID4gPgo+ID4gPiBJdCdzIGF0b21pYyBjb2RlLCB3
ZSdyZSB0cnlpbmcgdG8gb3B0aW1pemUgZm9yIGNsZWFuIGNvZGUgYXQgdGhlIGV4cGVuc2UKPiA+
ID4gb2YgYSBiaXQgb2YgcnVudGltZSBvdmVyaGVhZCBkdWUgdG8gbW9yZSBwb2ludGVyIGNoYXNp
bmcuIEFuZCBJIGFncmVlIHdpdGgKPiA+ID4gdGhlIGdlbmVyYWwgcHVzaCwgdGhlIHBpbGUgb2Yg
b2xkL25ld19zdGF0ZSBwb2ludGVycyBvZiB2YXJpb3VzIG9iamVjdHMKPiA+ID4gd2UncmUgcGFz
c2luZyBhcm91bmQgaXMgY29uZnVzaW5nLiBQYXNzaW5nIHRoZSBvdmVyYWxsIGRybV9hdG9taWNf
c3RhdGUKPiA+ID4gc2VlbXMgbXVjaCBtb3JlIHJlYXNvbmFibGUsIGFuZCB3aXRoIHRoYXQgd2Ug
Y2FuIGdldCBldmVyeXRoaW5nIGVsc2UuIFBsdXMKPiA+ID4gaXQncyBtdWNoIG1vcmUgb2J2aW91
cyB3aGV0aGVyIHlvdSBoYXZlIHRoZSBvbGQvbmV3IHN0YXRlIChzaW5jZSB0aGF0J3MKPiA+ID4g
ZXhwbGljaXQgd2hlbiB5b3UgbG9vayBpdCB1cCBmcm9tIHRoZSBkcm1fYXRvbWljX3N0YXRlKS4K
PiA+Cj4gPiBZZXMsIEkgYWdyZWUgaXQncyBjbGVhbmVyLiBJIGp1c3QgaG9wZSB0aGUgYXRvbWlj
IHN0YXRlIHRyYWNraW5nIGNvc3QKPiA+IGNhbiBiZSBrZXB0IHVuZGVyIGNvbnRyb2wgOi0pCj4g
Pgo+ID4gQnkgdGhlIHdheSwgdGhpcyBpcyBsaWtlbHkgbm90IGdvaW5nIHRvIGhhcHBlbiBhcyBp
dCB3b3VsZCBiZSB3YXkgdG9vCj4gPiBpbnRydXNpdmUsIGJ1dCBpdCB3b3VsZCBiZSBuaWNlIHRv
IHJlbmFtZSBkcm1fYXRvbWljX3N0YXRlIHRvCj4gPiBkcm1fYXRvbWljX3RyYW5zYWN0aW9uIChv
ciBzb21ldGhpbmcgc2ltaWxhcikuIEl0IGRvZXNuJ3QgbW9kZWwgYSBzdGF0ZSwKPiA+IGJ1dCBh
IGNoYW5nZSBiZXR3ZWVuIGFuIG9sZCBzdGF0ZSB0byBhIG5ldyBzdGF0ZS4gVGhpcyBjb25mdXNl
ZCBtZSBpbgo+ID4gdGhlIHBhc3QsIGFuZCBJJ20gc3VyZSBpdCBjYW4gc3RpbGwgYmUgY29uZnVz
aW5nIHRvIG5ld2NvbWVycy4KPiAKPiBXaHkgYXJlIHlvdSB0aGUgZmlyc3QgdG8gc3VnZ2VzdCB0
aGlzLCB0aGlzIGlzIGF3ZXNvbWUhCgpDYW4ndCBxdWl0ZSB0ZWxsIGlmIHRoYXQncyBpcm9ueSBv
ciBub3QuIEFueXdheXMsIHRoaXMgaGFzIGJlZW4Kc3VnZ2VzdGVkIGJlZm9yZSBidXQgbm8gdm9s
dW50ZWVycyBzdGVwcGVkIGZvcndhcmQuCgo+IGRybV9hdG9taWNfc3RhdGUgaXMgaW5kZWVkIG5v
dCBhIHN0YXRlLCBidXQgYSB0cmFuc2FjdGlvbiByZXByZXNlbnRpbmcKPiBob3cgd2UgZ28gZnJv
bSB0aGUgb2xkIHRvIHRoZSBuZXcgc3RhdGUuCgpPbiBhIHNlbWktcmVsYXRlZCB0b3BpYywgSSd2
ZSBvY2Nhc2lvbmFsbHkgcG9uZGVyZWQgYWJvdXQgbW92aW5nCm1vZGVfY2hhbmdlZCAmIGNvLiBm
cm9tIHRoZSBvYmogc3RhdGVzIHRvIHRoZSB0b3AgbGV2ZWwKc3RhdGUvdHJhbnNhY3Rpb24gKG1h
eWJlIHN0b3JlZCBhcyBhIGJpdG1hc2spLiBCdXQgdGhhdCB3b3VsZApkZWZpbml0ZWx5IG5vdCBi
ZSBhIHRyaXZpYWwgc2VkIGpvYi4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
