Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CB610F102
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D366E317;
	Mon,  2 Dec 2019 19:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE7F897D0;
 Mon,  2 Dec 2019 19:49:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 11:49:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; d="scan'208";a="411902902"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by fmsmga006.fm.intel.com with ESMTP; 02 Dec 2019 11:49:00 -0800
Date: Mon, 2 Dec 2019 11:37:41 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [RFC 00/13] drm/i915/svm: Add SVM support
Message-ID: <20191202193740.GM14488@nvishwa1-DESK.sc.intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <157477700115.23972.3132021093162546497@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157477700115.23972.3132021093162546497@jlahtine-desk.ger.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx@lists.freedesktop.org, sanjay.k.kumar@intel.com,
 sudeep.dutt@intel.com, dri-devel@lists.freedesktop.org, dave.hansen@intel.com,
 jglisse@redhat.com, jon.bloomfield@intel.com, daniel.vetter@intel.com,
 dan.j.williams@intel.com, ira.weiny@intel.com, jgg@mellanox.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDQ6MDM6MjFQTSArMDIwMCwgSm9vbmFzIExhaHRpbmVu
IHdyb3RlOgo+UXVvdGluZyBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhICgyMDE5LTExLTIyIDIy
OjU3OjIxKQo+PiBTaGFyZWQgVmlydHVhbCBNZW1vcnkgKFNWTSkgYWxsb3dzIHRoZSBwcm9ncmFt
bWVyIHRvIHVzZSBhIHNpbmdsZSB2aXJ0dWFsCj4+IGFkZHJlc3Mgc3BhY2Ugd2hpY2ggd2lsbCBi
ZSBzaGFyZWQgYmV0d2VlbiB0aHJlYWRzIGV4ZWN1dGluZyBvbiBDUFVzIGFuZCBHUFVzLgo+PiBJ
dCBhYnN0cmFjdHMgYXdheSBmcm9tIHRoZSB1c2VyIHRoZSBsb2NhdGlvbiBvZiB0aGUgYmFja2lu
ZyBtZW1vcnksIGFuZCBoZW5jZQo+PiBzaW1wbGlmaWVzIHRoZSB1c2VyIHByb2dyYW1taW5nIG1v
ZGVsLgo+PiBTVk0gc3VwcG9ydHMgdHdvIHR5cGVzIG9mIHZpcnR1YWwgbWVtb3J5IGFsbG9jYXRp
b24gbWV0aG9kcy4KPj4gUnVudGltZSBhbGxvY2F0b3IgcmVxdWlyZXMgdGhlIGRyaXZlciB0byBw
cm92aWRlIG1lbW9yeSBhbGxvY2F0aW9uIGFuZAo+PiBtYW5hZ2VtZW50IGludGVyZmFjZSwgbGlr
ZSBidWZmZXIgb2JqZWN0IChCTykgaW50ZXJmYWNlLgo+PiBXaGVyZWFzIHN5c3RlbSBhbGxvY2F0
b3IgbWFrZXMgdXNlIG9mIGRlZmF1bHQgT1MgbWVtb3J5IGFsbG9jYXRpb24gYW5kCj4+IG1hbmFn
ZW1lbnQgc3VwcG9ydCBsaWtlIG1hbGxvYygpLgo+Pgo+PiBUaGlzIHBhdGNoIHNlcmllcyBhZGRz
IGJvdGggU1ZNIHN5c3RlbSBhbmQgcnVudGltZSBhbGxvY2F0b3Igc3VwcG9ydAo+PiB0byBpOTE1
IGRyaXZlci4KPj4KPj4gVGhlIHBhdGNoIHNlcmllcyBpbmNsdWRlcwo+PiAgLSBTVk0gc3VwcG9y
dCBmb3IgYm90aCBzeXN0ZW0gYW5kIHJ1bnRpbWUgYWxsb2NhdGlvbi4KPj4gIC0gUGx1Z2luIGlu
IGRldmljZSBtZW1vcnkgd2l0aCB0aGUgTGludXgga2VybmVsLgo+PiAgLSBVc2VyIEFQSSBhZHZl
cnRpc2luZyBTVk0gY2FwYWJpbGl0eSBhbmQgY29uZmlndXJhdGlvbiBieSB1c2VyIG9uIHBlcgo+
PiAgICB2bSBiYXNpcy4KPj4gIC0gVXNlciBBUEkgdG8gYmluZCBhbiBhZGRyZXNzIHJhbmdlIG9y
IGEgQk8gd2l0aCBhIGRldmljZSBwYWdlIHRhYmxlLgo+PiAgLSBVc2VyIEFQSSB0byBtaWdyYXRl
IGFuIGFkZHJlc3MgcmFuZ2UgdG8gZGV2aWNlIG1lbW9yeS4KPj4gIC0gSW1wbGljaXQgbWlncmF0
aW9uIGJ5IG1vdmluZyBwYWdlcyBvciBCT3MgYmFjayBmcm9tIGRldmljZSB0byBob3N0Cj4+ICAg
IG1lbW9yeSB1cG9uIENQVSBhY2Nlc3MuCj4+ICAtIENQVSBjb3B5IGFuZCBibGl0dGVyIGNvcHkg
c3VwcG9ydCBmb3IgbWlncmF0aW5nIHRoZSBwYWdlcy9CT3MuCj4+ICAtIExhcmdlIHBhZ2UgbWFw
cGluZyBzdXBwb3J0Cj4+ICAtIFBhZ2UgdGFibGUgZHVtcCBzdXBwb3J0Lgo+Cj5MaW5rIHRvIHRo
ZSBJR1RzLCBhbnkgc2VsZnRlc3RzPwo+TGluayB0byB1c2Vyc3BhY2UgY2hhbmdlcz8KCkkgaGF2
ZSBzb21lIElHVCB0ZXN0cywgSSB3aWxsIHBvc3QgdGhlbSBzb29uLgoKTmlyYW5qYW5hCgo+Cj5S
ZWdhcmRzLCBKb29uYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
