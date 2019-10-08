Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD8ECF5DC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 11:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7806E0FC;
	Tue,  8 Oct 2019 09:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011C06E0E0;
 Tue,  8 Oct 2019 09:19:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 02:19:29 -0700
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="187243790"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 02:19:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Adam Jackson <ajax@redhat.com>,
 "20191004215851.31446-1-shawn.c.lee\@intel.com"
 <20191004215851.31446-1-shawn.c.lee@intel.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915: customize DPCD brightness control for specific
 panel
In-Reply-To: <75105bb4d3c4ea37aaf53144be5d644f998f3626.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191004215851.31446-1-shawn.c.lee@intel.com>
 <33dcaf669eae3acfc3b716e68b69c0fe76dd2dbc.camel@redhat.com>
 <87d0fce4mh.fsf@intel.com>
 <D42A2A322A1FCA4089E30E9A9BA36AC65D6A9C66@PGSMSX111.gar.corp.intel.com>
 <877e5gj52f.fsf@intel.com>
 <75105bb4d3c4ea37aaf53144be5d644f998f3626.camel@redhat.com>
Date: Tue, 08 Oct 2019 12:19:23 +0300
Message-ID: <87pnj7h9wk.fsf@intel.com>
MIME-Version: 1.0
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
Cc: "Chiou, Cooper" <cooper.chiou@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwNyBPY3QgMjAxOSwgQWRhbSBKYWNrc29uIDxhamF4QHJlZGhhdC5jb20+IHdyb3Rl
Ogo+IE9uIE1vbiwgMjAxOS0xMC0wNyBhdCAxMjowOCArMDMwMCwgSmFuaSBOaWt1bGEgd3JvdGU6
Cj4KPj4gVGhlIHByb2JsZW0gd2l0aCB0aGUgRURJRCBxdWlya3MgaXMgdGhhdCBleHBvc2luZyB0
aGUgcXVpcmtzIHN0aWNrcyBvdXQKPj4gbGlrZSBhIHNvcmUgdGh1bWIuIFRodXMgZmFyIGFsbCBv
ZiBpdCBoYXMgYmVlbiBjb250YWluZWQgaW4gZHJtX2VkaWQuYwo+PiBhbmQgdGhleSBhZmZlY3Qg
aG93IHRoZSBFRElEIGdldHMgcGFyc2VkLCBmb3IgYWxsIGRyaXZlcnMuIE9idmlvdXNseQo+PiB0
aGlzIGNvdWxkIGJlIGNoYW5nZWQsIGJ1dCBpcyBpdCB0aGUgcmlnaHQgdGhpbmcgdG8gZG8/Cj4+
IAo+PiBXaGF0IEkgc3VnZ2VzdGVkIHdhcywgY2hlY2sgdGhlIE9VSSBvbmx5LCBhbmQgaWYgaXQg
bWF0Y2hlcywgZG8KPj4gbW9yZS4gUGVyaGFwcyB0aGVyZSdzIHNvbWV0aGluZyBpbiB0aGUgMHgz
MDAgcmFuZ2Ugb2YgRFBDRCBvZmZzZXRzIHRoYXQKPj4geW91IGNhbiByZWFkPyBPciBwZXJoYXBz
IHlvdSBuZWVkIHRvIHdyaXRlIHRoZSBzb3VyY2UgT1VJIGZpcnN0LCBhbmQKPj4gdGhlbiBkbyB0
aGF0Lgo+Cj4gTXkgaXNzdWUgaXNuJ3QgcmVhbGx5IHdpdGggaWRlbnRpZnlpbmcgdGhlIHBhbmVs
IGZyb20gRURJRCByYXRoZXIgdGhhbgo+IERQQ0QsIHdoaWNoZXZlciBpZGVudGlmaWVyIGlzIG1v
c3Qgc3BlY2lmaWMgaXMgcHJvYmFibHkgdGhlIGJlc3QgdGhpbmcKPiB0byB1c2UuIEl0J3MgbW9y
ZSB0aGF0IHRoaXMgcXVpcmsgaXMgaWRlbnRpZmllZCBpbiBjb21tb24gY29kZSBidXQgb25seQo+
IGFwcGxpZWQgaW4gb25lIGRyaXZlci4gSWYgdGhpcyBwYW5lbCB3ZXJlIGV2ZXIgdG8gYmUgYXR0
YWNoZWQgdG8gc29tZQo+IG90aGVyIHNvdXJjZSwgdGhleSBtaWdodCB3ZWxsIHdhbnQgdG8gYXBw
bHkgdGhlIHNhbWUga2luZCBvZiBmaXguIE15Cj4gKGFkbWl0dGVkbHkgbmHDr3ZlKSByZWFkaW5n
IG9mIHRoZSBPVUkgaGFuZHNoYWtlIHByb2Nlc3MgaXMgdGhhdCB3aGVuCj4gdGhlIHNvdXJjZSBk
ZXZpY2Ugd3JpdGVzIGFuIE9VSSB0byBEUF9TT1VSQ0VfT1VJIGl0IGlzIHRlbGxpbmcgdGhlIHNp
bmsKPiAiSSdtIGFib3V0IHRvIGlzc3VlIGNvbW1hbmRzIHRoYXQgY29uZm9ybSB0byBfdGhpc18g
dmVuZG9yJ3Mgb3duCj4gY29udmVudGlvbnMiLiBJZiB0aGF0IGNvbnZlbnRpb24gY29tbXVuaWNh
dGVzIGluZm9ybWF0aW9uIHRoYXQgaXMKPiBlbnRpcmVseSBjb250YWluZWQgd2l0aGluIEFVWENI
IHRyYW5zYWN0aW9ucyAoYW5kIGRvZXNuJ3QsIGZvciBleGFtcGxlLAo+IHJlcXVpcmUgbG9va2lu
ZyBhdCBzb21lIG90aGVyIHN0cmFwcGluZyBwaW4gb3IgZXh0ZXJuYWwgZGV2aWNlKSB0aGVuIGlu
Cj4gcHJpbmNpcGxlIGl0IGRvZXNuJ3QgbWF0dGVyIGlmIHRoZSBzb3VyY2UgZGV2aWNlICJtYXRj
aGVzIiB0aGF0IE9VSTsgaXQKPiB3b3VsZCBiZSBsZWdhbCBmb3IgYW4gQU1EIEdQVSB0byB3cml0
ZSB0aGUgc2FtZSBzZXF1ZW5jZSBhbmQgZXhwZWN0IHRoZQo+IHNhbWUgcmVhY3Rpb24sIHNob3Vs
ZCB0aGF0IHBhbmVsIGJlIGF0dGFjaGVkIHRvIGFuIEFNRCBHUFUuCj4KPiBTbywgaXQgd291bGQg
YmUgbmljZSB0byBrbm93IGV4YWN0bHkgd2hhdCB0aGF0IHByb3RvY29sIGlzIG1lYW50IHRvIGRv
LAo+IGlmIGl0IGFwcGxpZXMgb25seSB0byB0aGlzIHNwZWNpZmljIHBhbmVsIG9yIGFueXRoaW5n
IGVsc2Ugd2l0aCB0aGUKPiBzYW1lIFRDT04sIGhvdyBvbmUgd291bGQgaWRlbnRpZnkgc3VjaCBU
Q09OcyBpbiB0aGUgd2lsZCBvdGhlciB0aGFuCj4gRURJRCwgaWYgaXQgcmVsaWVzIG9uIGFuIGV4
dGVybmFsIFBXTSBvciBzb21ldGhpbmcsIGV0Yy4gQW5kIGl0IG1pZ2h0Cj4gbWFrZSBzZW5zZSBm
b3Igbm93IHRvIG1ha2UgdGhpcyBhIChzaHVkZGVyKSBkcml2ZXItc3BlY2lmaWMgRURJRCBxdWly
awo+IHJhdGhlciB0aGFuIG1hdGNoIGJ5IERQQ0QsIGF0IGxlYXN0IHVudGlsIHdlIGtub3cgaWYg
dGhlIHBhbmVsIGlzIGV2ZXIKPiBzZWVuIGF0dGFjaGVkIHRvIG90aGVyIHNvdXJjZSBkZXZpY2Vz
IGFuZCBpZiB0aGUgT1VJIGNvbnZlbnRpb24gaXMKPiBzZWxmLWNvbnRhaW5lZC4KClRoYW5rcyBm
b3IgY2xhcmlmeWluZy4gUHJldHR5IG11Y2ggYWdyZWVkLCB1bmZvcnR1bmF0ZWx5IGFsc28gb24g
dGhlCiJ3b3VsZCBiZSBuaWNlIHRvIGtub3cgbW9yZSIgcGFydC4uLgoKSWYgdGhpcyB3ZXJlIHRv
IGJlIGFuIEVESUQgcXVpcmsgYWZ0ZXIgYWxsLCBJIHdvbmRlciBpZiBpdCB3b3VsZCBiZQpiZXR0
ZXIgdG8gc3RvcmUgdGhlIHBhcnNlZCBxdWlya3MgdG8sIHNheSwgc3RydWN0IGRybV9kaXNwbGF5
X2luZm8sIGFuZApoYXZlIGEgZHJtX2Nvbm5lY3Rvcl9oYXNfcXVpcmsoKSBmdW5jdGlvbiBzaW1p
bGFyIHRvIGRybV9kcF9oYXNfcXVpcmsoKS4KClRoaXMgd291bGQgYWxzbyBhbGxvdyB1cyB0byBu
b3QgcmV0dXJuIHF1aXJrcyBmcm9tCmRybV9hZGRfZGlzcGxheV9pbmZvKCksIHdoaWNoIHdvdWxk
IGFyZ3VhYmx5IGNsZWFuIHVwIHRoZSBpbnRlcmZhY2UuCgpCUiwKSmFuaS4KCgotLSAKSmFuaSBO
aWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
