Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F013212F17
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 23:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6836E264;
	Thu,  2 Jul 2020 21:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0B26E264
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 21:57:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71E059CB;
 Thu,  2 Jul 2020 23:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593727065;
 bh=0rQwBdNpgVjmUJBgZZ/VHWFP3LetUvl+QI2ELUac7mU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IbIDz0bZ+G6GpSGb0py8qpADdYppoK/e5aRindDoi6Hncvsc65zj1F6LjYSjLpAkd
 nXAfuCUJNCT8iZntgOafWt14VQhN1Q86UCRl4NjrEiENL4amkvIcPf0bR77Q+VIjk7
 /BnuRxkic4L6eyyP9o1MZOR+bbXs/lD8ZpfiJrII=
Date: Fri, 3 Jul 2020 00:57:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [libcamera-devel] [PATCH v2] drm/fourcc: Add bayer formats and
 modifiers
Message-ID: <20200702215741.GV12562@pendragon.ideasonboard.com>
References: <20200521235201.279642-1-niklas.soderlund@ragnatech.se>
 <CACvgo50SNourym-gBG1s2UxiD4M96=rMfcd7_y=643BgveRhVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50SNourym-gBG1s2UxiD4M96=rMfcd7_y=643BgveRhVg@mail.gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 libcamera-devel@lists.libcamera.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbCwKCk9uIFRodSwgTWF5IDI4LCAyMDIwIGF0IDA0OjM2OjU5UE0gKzAxMDAsIEVtaWwg
VmVsaWtvdiB3cm90ZToKPiBPbiBGcmksIDIyIE1heSAyMDIwIGF0IDA3OjU2LCBOaWtsYXMgU8O2
ZGVybHVuZCB3cm90ZToKPiA+Cj4gPiBCYXllciBmb3JtYXRzIGFyZSB1c2VkIHdpdGggY2FtZXJh
cyBhbmQgY29udGFpbiBncmVlbiwgcmVkIGFuZCBibHVlCj4gPiBjb21wb25lbnRzLCB3aXRoIGFs
dGVybmF0aW5nIGxpbmVzIG9mIHJlZCBhbmQgZ3JlZW4sIGFuZCBibHVlIGFuZCBncmVlbgo+ID4g
cGl4ZWxzIGluIGRpZmZlcmVudCBvcmRlcnMuIEZvciBlYWNoIGJsb2NrIG9mIDJ4MiBwaXhlbHMg
dGhlcmUgaXMgb25lCj4gPiBwaXhlbCB3aXRoIGEgcmVkIGZpbHRlciwgdHdvIHdpdGggYSBncmVl
biBmaWx0ZXIsIGFuZCBvbmUgd2l0aCBhIGJsdWUKPiA+IGZpbHRlci4gVGhlIGZpbHRlcnMgY2Fu
IGJlIGFycmFuZ2VkIGluIGRpZmZlcmVudCBwYXR0ZXJucy4KPiA+Cj4gPiBBZGQgRFJNIGZvdXJj
YyBmb3JtYXRzIHRvIGRlc2NyaWJlIHRoZSBtb3N0IGNvbW1vbiBCYXllciBmb3JtYXRzLiBBbHNv
Cj4gPiBhZGQgYSBtb2RpZmllcnMgdG8gZGVzY3JpYmUgdGhlIGN1c3RvbSBwYWNraW5nIGxheW91
dHMgdXNlZCBieSB0aGUgSW50ZWwKPiA+IElQVTMgYW5kIGluIHRoZSBNSVBJIChNb2JpbGUgSW5k
dXN0cnkgUHJvY2Vzc29yIEludGVyZmFjZSkgQ1NJLTIKPiA+IHNwZWNpZmljYXRpb24uCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogTmlrbGFzIFPDtmRlcmx1bmQgPG5pa2xhcy5zb2Rlcmx1bmRAcmFn
bmF0ZWNoLnNlPgo+ID4gLS0tCj4gPiAqIENoYW5nZXMgc2luY2UgdjEKPiA+IC0gUmVuYW1lIHRo
ZSBkZWZpbmVzIGZyb20gRFJNX0ZPUk1BVF9TUkdHQjggdG8gRFJNX0ZPUk1BVF9CQVlFUl9SR0dC
OC4KPiA+IC0gVXBkYXRlIHRoZSBmb3VyY2MgY29kZXMgcGFzc2VkIHRvIGZvdXJjY19jb2RlKCkg
dG8gYXZvaWQgYSBjb25mbGljdC4KPiA+IC0gQWRkIGRpYWdyYW1zIGZvciBhbGwgQmF5ZXIgZm9y
bWF0cyBtZW1vcnkgbGF5b3V0Lgo+ID4gLSBVcGRhdGUgZG9jdW1lbnRhdGlvbi4KPiA+IC0tLQo+
ID4gIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMjA1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjA1IGluc2VydGlvbnMoKykK
Pgo+IFdoZXJlIGlzIHRoZSB1c2VyIGZvciB0aGVzZSBuZXcgZm9ybWF0cyAtIGJlIHRoYXQga2Vy
bmVsIG9yIHVzZXJzcGFjZT8KPiBEaWQgeW91IGZvcmdldCB0byB1cGRhdGUgdGhlIF9fZHJtX2Zv
cm1hdF9pbmZvKCkgaW4KPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jPwoKVGhlIHVzZXJz
cGFjZSB1c2VyIGlzIGhlcmU6IGh0dHBzOi8vZ2l0LmxpbnV4dHYub3JnL2xpYmNhbWVyYS5naXQv
dHJlZS8KClRoZSBmb3JtYXRzIGFyZSBub3QgdXNlZCBpbiB0aGUgRFJNIHN1YnN5c3RlbSwgc28g
SSBkb24ndCB0aGluayB0aGVyZSdzCmEgbmVlZCB0byB1cGRhdGUgX19kcm1fZm9ybWF0X2luZm8o
KS4KCmxpYmNhbWVyYSBpcyBzdGFuZGFyZGl6aW5nIG9uIHVzaW5nIERSTSA0Q0NzIHRvIGVhc2Ug
aW50ZXJvcGVyYWJpbGl0eQp3aXRoIGRpc3BsYXkuIFdlIHRodXMgbmVlZCB0byBiZSBhYmxlIHRv
IGV4cHJlc3MgY2FtZXJhLXNwZWNpZmljIGZvcm1hdHMKd2l0aCBEUk0gNENDcywgZXZlbiBpZiB0
aGV5J3JlIG5vdCB1c2VkIG9uIHRoZSBkaXNwbGF5IHNpZGUuIFRoZQphbHRlcm5hdGl2ZSB3b3Vs
ZCBiZSB0byBoYXZlIGN1c3RvbSA0Q0NzIGZvciB0aG9zZSBmb3JtYXRzLCBidXQgd2Ugd291bGQK
dGhlbiBlbmQgdXAgcmlza2luZyBhIDRDQyBuYW1lc3BhY2UgY2xhc2guCgotLSAKUmVnYXJkcywK
CkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
