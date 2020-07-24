Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF65422D049
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 23:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C906E88D;
	Fri, 24 Jul 2020 21:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7CE6E88D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 21:08:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 095049FF;
 Fri, 24 Jul 2020 23:08:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595624914;
 bh=RWgfsaNaXBKlEjSJeeYacZJ4lQTAbrL1znMpTTUyZ+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RX5GdFVmhdBaCU1aIUMdIBiDYFj2xNO59UeoAIU59A8AG7KEP+xNJ3olUMfc+mS2m
 jc0q4FxPrJ8iND6TKluz+SH18BkrvyZ0HSIL874YF/vVyL46YNo1Hxq0IuwwTQDARx
 xPzru/gb82n9DHtzs3iXisrneT9B/4NjoBz4NyfA=
Date: Sat, 25 Jul 2020 00:08:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: warning in omap_connector
Message-ID: <20200724210827.GD5921@pendragon.ideasonboard.com>
References: <CAPM=9tz7E5rmRdqWwGQCsS+q+UcPU7XTxsGgkCggQXA8ktn0pw@mail.gmail.com>
 <20200630141505.GE6112@intel.com>
 <CADnq5_PdqNjD2OnWGWJxv-Q-YUN4ymLUxTdT9km_ESS2cwm68A@mail.gmail.com>
 <20200630143902.GG6112@intel.com>
 <20200630144132.GH5850@pendragon.ideasonboard.com>
 <20200630150757.GH6112@intel.com>
 <CAPM=9twEeFjzLHsweUz5be_Sc7TRVp0Foh_Os+RypeSW9SAH1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9twEeFjzLHsweUz5be_Sc7TRVp0Foh_Os+RypeSW9SAH1g@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKCk9uIFRodSwgSnVsIDIzLCAyMDIwIGF0IDAyOjI4OjIyUE0gKzEwMDAsIERhdmUg
QWlybGllIHdyb3RlOgo+IEkgdGhpbmsgSSdtIHN0aWxsIHNlZWluZyB0aGlzLgoKSSdtIHNvcnJ5
LCBJJ3ZlIGxldCBpdCBzbGlwIHRocm91Z2ggdGhlIGNyYWNrcyA6LVMgVmlsbGUgYXMgYmVhdGVu
IG1lIGF0CnN1Ym1pdHRpbmcgYSBwYXRjaCAoa2lpdG9zIHBhbGpvbiBWaWxsZSkuCgo+IE9uIFdl
ZCwgMSBKdWwgMjAyMCBhdCAwMTowOCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+ID4gT24gVHVl
LCBKdW4gMzAsIDIwMjAgYXQgMDU6NDE6MzJQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90
ZToKPiA+ID4gT24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMDU6Mzk6MDJQTSArMDMwMCwgVmlsbGUg
U3lyasOkbMOkIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDEwOjE5OjIz
QU0gLTA0MDAsIEFsZXggRGV1Y2hlciB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgSnVuIDMwLCAy
MDIwIGF0IDEwOjE1IEFNIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gT24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMDQ6MzM6MzdQTSArMTAwMCwgRGF2ZSBBaXJs
aWUgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gSGV5IExhdXJlbnQsCj4gPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gPiBJIG1lcmdlZCBkcm0tbWlzYy1uZXh0IGFuZCBub3RpY2VkIHRoaXMsIEknbSBub3Qg
c3VyZSBpZiBpdCdzCj4gPiA+ID4gPiA+ID4gY29sbGF0ZXJhbCBkYW1hZ2UgZnJvbSBzb21ldGhp
bmcgZWxzZSBjaGFuZ2luZyBvciBJJ3ZlIGp1c3QgbWlzc2VkIGl0Cj4gPiA+ID4gPiA+ID4gcHJl
dmlvdXNseS4gMzItYml0IGFybSBidWlsZC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gL2hvbWUvYWlybGllZC9kZXZlbC9rZXJuZWwvZGltL3NyYy9kcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rvci5jOgo+ID4gPiA+ID4gPiA+IEluIGZ1bmN0aW9u
IOKAmG9tYXBfY29ubmVjdG9yX21vZGVfdmFsaWTigJk6Cj4gPiA+ID4gPiA+ID4gL2hvbWUvYWly
bGllZC9kZXZlbC9rZXJuZWwvZGltL3NyYy9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Nv
bm5lY3Rvci5jOjkyOjk6Cj4gPiA+ID4gPiA+ID4gd2FybmluZzogYnJhY2VzIGFyb3VuZCBzY2Fs
YXIgaW5pdGlhbGl6ZXIKPiA+ID4gPiA+ID4gPiAgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG5l
d19tb2RlID0geyB7IDAgfSB9Owo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBQcm9iYWJseSBmYWxs
b3V0IGZyb20gbXkgZHJtX2Rpc3BsYXlfbW9kZSBzaHJpbmthZ2UuCj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IEdvaW5nIHRvIHJlcGVhdCBteSB1c3VhbCAianVzdCB1c2Uge30gd2hlbiB6ZXJvIGlu
aXRpYWxpemluZwo+ID4gPiA+ID4gPiBzdHJ1Y3RzIiByZWNvbW1lbmRhdGlvbi4gQXZvaWRzIHRo
ZXNlIHN0dXBpZCB3YXJuaW5ncywgYW5kIElNTwo+ID4gPiA+ID4gPiBhbHNvIGNvbnZleXMgdGhl
IG1lYW5pbmcgYmV0dGVyIHNpbmNlIHRoZXJlJ3Mgbm8gYW1iaWd1aXR5Cj4gPiA+ID4gPiA+IGJl
dHdlZW4gemVybyBpbml0aWFsaXppbmcgdGhlIHdob2xlIHN0cnVjdCB2cy4gemVybyBpbml0aWFs
aXppbmcKPiA+ID4gPiA+ID4ganVzdCB0aGUgZmlyc3QgbWVtYmVyLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IElJUkMsIExMVk0gYW5kIEdDQyB0cmVhdCB0aGVzZSBzbGlnaHRseSBkaWZmZXJlbnRseS4g
IFdlJ3ZlIGdlbmVyYWxseQo+ID4gPiA+ID4ganVzdCBtb3ZlZCB0byB1c2luZyBtZW1zZXQgdG8g
YXZvaWQgZGlmZmVyZW50IGNvbXBpbGVyIGNvbXBsYWludHMgd2hlbgo+ID4gPiA+ID4gdXNpbmcg
dGhlc2UuCj4gPiA+ID4KPiA+ID4gPiBJIGRvbid0IHBhcnRpY3VsYXJseSBsaWtlIG1lbXNldCgp
IHNpbmNlIHRoZSByZXF1aXJlbWVudCB0bwo+ID4gPiA+IHBhc3MgdGhlIHNpemUganVzdCBhZGRz
IGFub3RoZXIgd2F5IHRvIHNjcmV3IHRoaW5ncyB1cC4gVGhlCj4gPiA+ID4gdXN1YWwgJ3NpemVv
ZigqdGhpbmcpJyBtYWtlcyB0aGF0IHNsaWdodGx5IGxlc3Mgb2YgYW4gaXNzdWUsCj4gPiA+ID4g
YnV0IEkndmUgbm90aWNlZCB0aGF0IHBlb3BsZSBvZnRlbiBkb24ndCB1c2UgdGhhdC4KPiA+ID4g
Pgo+ID4gPiA+IEFub3RoZXIgaXNzdWUgd2l0aCBtZW1zZXQoKSBpcyB0aGF0IHlvdSB0aGVuIGNh
biBlbmQgdXAgd2l0aAo+ID4gPiA+IGEgYmxvY2sgb2Ygc2VlbWluZ2x5IHJhbmRvbSBjb2xsZWN0
aW9uIG9mIG1lbXNldHMoKXMgYmV0d2Vlbgo+ID4gPiA+IHRoZSB2YXJpYWJsZSBkZWNsYXJhdGlv
bnMgYW5kIHRoZSByZXN0IG9mIHRoZSBjb2RlLiBJIHN1cHBvc2UKPiA+ID4gPiBpZiB3ZSBjb3Vs
ZCBkZWNsYXJlIHZhcmlhYmxlcyBhbnl3aGVyZSB3ZSBjb3VsZCBhbHdheXMga2VlcAo+ID4gPiA+
IHRoZSB0d28gdG9nZXRoZXIgc28gaXQgd291bGRuJ3QgbG9vayBzbyB3ZWlyZCwgYnV0IGNhbid0
IGRvCj4gPiA+ID4gdGhhdCBmb3IgdGhlIHRpbWUgYmVpbmcuIEFuZCBldmVuIHdpdGggdGhhdCBp
dCB3b3VsZCBzdGlsbAo+ID4gPiA+IGxlYWQgdG8gbGVzcyBzdWNjaW5jdCBjb2RlLCB3aGljaCBJ
IGdlbmVyYWxseSBkaXNsaWtlLgo+ID4gPgo+ID4gPiBJJ2QgcHJlZmVyIHsgfSBvdmVyIG1lbXNl
dCwgYXNzdW1pbmcgY2xhbmcgYW5kIGdjYyB3b3VsZCB0cmVhdCBpdAo+ID4gPiBjb3JyZWN0bHku
IFZpbGxlLCBJIGNhbiBzdWJtaXQgYSBwYXRjaCwgdW5sZXNzIHlvdSB3YW50IHRvIGRvIGl0Cj4g
PiA+IHlvdXJzZWxmIGFzIGl0J3MgYSBmYWxsb3V0IGZyb20gZHJtX2Rpc3BsYXlfbW9kZSBzaHJp
bmthZ2UgOy0pCj4gPiA+IChzZXJpb3VzbHkgc3BlYWtpbmcsIG5vdCBwdXNoaW5nIHlvdSwgSSBq
dXN0IHdhbnQgdG8gYXZvaWQgZHVwbGljYXRpbmcKPiA+ID4gd29yaykuCj4gPgo+ID4gR28gYWhl
YWQgaWYgeW91IHdhbnQgdG8uIEknbSBpbiBtaWRkbGUgb2YgYSBiaWdnZXIgcmViYXNlIGF0bQo+
ID4gc28gY2FuJ3QgZG8gaXQgcmlnaHQgdGhpcyBtaW51dGUgbXlzZWxmLgoKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
