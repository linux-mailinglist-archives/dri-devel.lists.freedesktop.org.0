Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1F5D74C2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 13:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A81B6E362;
	Tue, 15 Oct 2019 11:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4B56E362
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:18:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 04:18:22 -0700
X-IronPort-AV: E=Sophos;i="5.67,299,1566889200"; d="scan'208";a="189313090"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.93.188])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 04:18:20 -0700
MIME-Version: 1.0
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20191010204823.195540-1-sean@poorly.run>
References: <20191010204823.195540-1-sean@poorly.run>
Message-ID: <157113829734.12450.4028428845410339707@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] drm: Funnel drm logs to tracepoints
Date: Tue, 15 Oct 2019 14:18:17 +0300
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTZWFuIFBhdWwgKDIwMTktMTAtMTAgMjM6NDg6MDgpCj4gRnJvbTogU2VhbiBQYXVs
IDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gCj4gKlJlY29yZCBzY3JhdGNoKiBZb3UgcmVhZCB0
aGF0IHN1YmplY3QgY29ycmVjdGx5LCBJIGJldCB5b3UncmUgd29uZGVyaW5nCj4gaG93IHdlIGdv
dCBoZXJlLiBBdCBsZWFzdCBoZWFyIG1lIG91dCBiZWZvcmUgeW91IGZsYW1lIDotKQo+IAo+IEZv
ciBhIGxvbmcgd2hpbGUgbm93LCB3ZSAoQ2hyb21lT1MpIGhhdmUgYmVlbiBzdHJ1Z2dsaW5nIGdl
dHRpbmcgYW55Cj4gdmFsdWUgb3V0IG9mIHVzZXIgZmVlZGJhY2sgcmVwb3J0cyBvZiBkaXNwbGF5
IGZhaWx1cmVzIChub3RhYmx5IGV4dGVybmFsCj4gZGlzcGxheXMgbm90IHdvcmtpbmcpLiBUaGUg
cHJvYmxlbSBpcyB0aGF0IGFsbCBsb2dnaW5nLCBldmVuIGZhdGFsCj4gZXJyb3JzICh3ZWxsLCBm
YXRhbCBpbiB0aGUgc2Vuc2UgdGhhdCBhIGRpc3BsYXkgd29uJ3QgbGlnaHQgdXApIGFyZQo+IGxv
Z2dlZCBhdCBERUJVRyBsb2cgbGV2ZWwuIFNvIGluIG9yZGVyIHRvIGV4dHJhY3QgdGhlc2UgbG9n
cywgeW91IG5lZWQKPiB0byBiZSBhYmxlIHRvIHR1cm4gb24gbG9nZ2luZywgYW5kIHJlcHJvZHVj
ZSB0aGUgaXNzdWUgd2l0aCBkZWJ1Zwo+IGVuYWJsZWQuIFVuZm9ydHVuYXRlbHksIHRoaXMgaXNu
J3QgcmVhbGx5IHNvbWV0aGluZyB3ZSBjYW4gYXNrIENyT1MgdXNlcnMKPiBJIHNwb2tlIHdpdGgg
YWlybGllZCBhYm91dCB0aGlzIGFuZCBSSEVMIGhhcyBzaW1pbGFyIGlzc3Vlcy4KPiAKPiBUaGlz
IGlzIHRoZSBwb2ludCB3aGVyZSB5b3UgYXNrIG1lLCAiU28gU2Vhbiwgd2h5IGRvbid0IHlvdSBq
dXN0IGVuYWJsZQo+IERSTV9VVF9CTEFIPyIuIEdvb2QgcXVlc3Rpb24hIEhlcmUgYXJlIHRoZSBy
ZWFzb25zIGluIGFzY2VuZGluZyBvcmRlciBvZgo+IHNldmVyaXR5Ogo+ICAxLSBQZW9wbGUgYXJl
bid0IGNvbnNpc3RlbnQgd2l0aCB0aGVpciBjYXRlZ29yaWVzLCBzbyB3ZSdkIGhhdmUgdG8KPiAg
ICAgZW5hYmxlIGEgYnVuY2ggdG8gZ2V0IHByb3BlciBjb3ZlcmFnZQo+ICAyLSBXZSBkb24ndCB3
YW50IHRvIG92ZXJ3aGVsbSBzeXNsb2cgd2l0aCBkcm0gc3BhbSwgb3RoZXJzIGhhdmUgdG8gdXNl
Cj4gICAgIGl0IHRvbwo+ICAzLSBDb25zb2xlIGxvZ2dpbmcgaXMgc2xvdwo+IAo+IEhvcGVmdWxs
eSB5b3UncmUgd2l0aCBtZSBzbyBmYXIuIEkgaGF2ZSBhIHByb2JsZW0gdGhhdCBoYXMgbm8gZXhp
c3RpbmcKPiBzb2x1dGlvbi4gV2hhdCBJIHJlYWxseSB3YW50IGlzIGEgcmluZ2J1ZmZlciBvZiB0
aGUgbW9zdCByZWNlbnQgbG9ncwo+IChpbiB0aGUgY2F0ZWdvcmllcyBJJ20gaW50ZXJlc3RlZCBp
bikgZXhwb3NlZCB2aWEgZGVidWdmcyBzbyBJIGNhbgo+IGV4dHJhY3QgaXQgd2hlbiB1c2VycyBm
aWxlIGZlZWRiYWNrLgoKQSBuaXRwaWNrLCB0cmFjZXBvaW50cyBhcmUgbm8gbG9uZ2VyIGluIGRl
YnVnZnMgYnV0IHRyYWNlZnMuIEknbSBiZWluZwp0b2xkIHRoZSByZWFzb24gaXMgYmVjYXVzZSBw
cm9kdWN0aW9uIGVudmlyb25tZW50cyB3YW50IHRvIHVzZSB0aGVtIGFuZApleHBlY3QgdGhlbSB0
byBiZSBzdGFibGUuCgo+IEl0IGp1c3Qgc28gaGFwcGVucyB0aGF0IHRoZXJlIGlzIHNvbWV0aGlu
ZyB3aGljaCBkb2VzIF9leGFjdGx5XyB0aGlzISBJCj4gY2FuIGR1bXAgdGhlIG1vc3QgcmVjZW50
IGxvZ3MgaW50byB0cmFjZXBvaW50cywgdHVybiB0aGVtIG9uIGFuZCBvZmYKPiBkZXBlbmRpbmcg
b24gd2hpY2ggY2F0ZWdvcnkgSSB3YW50LCBhbmQgcHVsbCB0aGVtIGZyb20gZGVidWdmcyBvbiBk
ZW1hbmQuCj4gCj4gIldoYXQgYWJvdXQgdHJhY2VfcHJpbnRrKCk/IiBZb3UnbGwgc2F5LiBJdCBk
b2Vzbid0IGdpdmUgdXMgdGhlIGNvbnRyb2wgd2UKPiBnZXQgZnJvbSB1c2luZyB0cmFjZXBvaW50
cyBhbmQgaXQncyBub3QgbWVhbnQgdG8gYmUgbGVmdCBzcHJpbmtsZWQgYXJvdW5kCj4gaW4gY29k
ZS4KPiAKPiBTbyB0aGF0IGlzIGhvdyB3ZSBnb3QgaGVyZSwgbm93IGl0J3MgdGltZSBmb3IgeW91
IHRvIHRlbGwgbWUgd2h5IHRoaXMgaXMKPiBhIGhvcnJpYmxlIGlkZWEgOi0pCgpCZWluZyBkZXZp
bCdzIGFkdm9jYXRlOyBIb3cgbG9uZyB1bnRpbCBhbGwgb3VyIGRlYnVnZ2luZyBtZXNzYWdlcyB3
aWxsIGJlCmtlcm5lbCBBQkk/CgpJbiB0aGUgY29udGV4dCBvZiB0aGUgRFJNIHN1YnN5c3RlbSBs
ZXZlbCB1bmlmaWVkIHRyYWNpbmcKKE1lc3NhZ2UtSWQ6IDIwMTkwMTIxMjMyMDQwLjI2MTE0LTEt
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrKQp3ZSBhbHJlYWR5IHN0cnVnZ2xlZCB0byBmaW5kIHRo
ZSBzd2VldCBzcG90IG9mIGV4cG9zaW5nIG9ubHkKaW5mb3JtYXRpb24gd2UgY2FuIG1haW50YWlu
IGxvbmcgdGVybS4KCkkgY2FuIGltYWdpbmUgdGhpcyBkZS1yYWlsaW5nIGludG8gdG8gYSBkaXJl
Y3Rpb24gd2hlbgp0aGUgdXNlcnNwYWNlIGRlYnVnZ2luZyBpbmZvcm1hdGlvbiBvZiBpbnRlcmVz
dCBpcyBleHRyYWN0ZWQKZnJvbSB0aGUga2VybmVsIGRlYnVnIG1lc3NhZ2VzLiBXaGVuIHRoYXQg
bWVzc2FnZSBmb3JtYXQKY2hhbmdlcyBhbmQgYnJlYWtzIHRoZSB1c2Vyc3BhY2UgdG9vbCwgeW91
IHByb2JhYmx5IGtub3cKdGhlIGRyaWxsLgoKSSBsaWtlIHRoZSBiYXNlIGlkZWEsIGJ1dCBpbXBs
ZW1lbnRhdGlvbiB0aHJvdWdoIHRyYWNlcG9pbnRzCmhhcyBncmVhdCBwb3RlbnRpYWwgdG8gYmVj
b21lIG1haW50ZW5hbmNlIG5pZ2h0bWFyZS4gU28gbWF5YmUKc29tZXRoaW5nIGFjdHVhbGx5IGlu
IGRlYnVnZnMgbWlnaHQgYmUgdGhlIHJpZ2h0IHNvbHV0aW9uPwoKUmVnYXJkcywgSm9vbmFzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
