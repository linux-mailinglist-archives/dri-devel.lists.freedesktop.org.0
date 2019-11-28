Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BFB10C232
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 03:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29DD6E5E8;
	Thu, 28 Nov 2019 02:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49D36E5E6;
 Thu, 28 Nov 2019 02:15:38 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 18:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,251,1571727600"; d="scan'208";a="383681626"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga005.jf.intel.com with ESMTP; 27 Nov 2019 18:15:37 -0800
Date: Wed, 27 Nov 2019 18:04:15 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [RFC 02/13] drm/i915/svm: Define SVM UAPI
Message-ID: <20191128020414.GL14488@nvishwa1-DESK.sc.intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-3-niranjana.vishwanathapura@intel.com>
 <157477586596.23972.14568027684962332897@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157477586596.23972.14568027684962332897@jlahtine-desk.ger.corp.intel.com>
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

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDM6NDQ6MjZQTSArMDIwMCwgSm9vbmFzIExhaHRpbmVu
IHdyb3RlOgo+UXVvdGluZyBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhICgyMDE5LTExLTIyIDIy
OjU3OjIzKQo+PiBEZWZpbmUgVUFQSSBmb3IgU2hhcmVkIFZpcnR1YWwgTWVtb3J5IChTVk0pIGZ1
Y250aW9uYWxpdHkgaW5jbHVkaW5nCj4+IFNWTSBjYXBhYmlsaXR5IGFuZCBjb25maWd1cmFiaWxp
dHkuCj4+IFdoZW4gdGhlcmUgaXMgbm8gR1BVIHBhZ2UgZmF1bHQgc3VwcG9ydCBhdmFpbGFibGUs
IGFkZCBpb2N0bHMKPj4gdG8gZXhwbGljaXRseSBiaW5kIGFuZCBtaWdyYXRlIHZpcnR1YWwgYWRk
cmVzcyByYW5nZXMuCj4+Cj4+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBs
aW51eC5pbnRlbC5jb20+Cj4+IENjOiBKb24gQmxvb21maWVsZCA8am9uLmJsb29tZmllbGRAaW50
ZWwuY29tPgo+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4+
IENjOiBTdWRlZXAgRHV0dCA8c3VkZWVwLmR1dHRAaW50ZWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGlu
dGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogVmVua2F0YSBTYW5kZWVwIERoYW5hbGFrb3RhIDx2
ZW5rYXRhLnMuZGhhbmFsYWtvdGFAaW50ZWwuY29tPgo+Cj5IYXZpbmcgdGhpcyBhcyBhIHNlcGFy
YXRlIGNvbW1pdCBhaGVhZCBvZiB0aGUgZnVuY3Rpb25hbGl0eSBicmVha3MKPmJpc2VjdGluZy4K
Pgo+VGhlIHVBUEkgc2hvdWxkIGJlIGV4cG9zZWQgaW4gc2ltaWxhciBzaXplZCBjaHVua3MgYXMg
aXQncyBpbXBsZW1lbnRlZC4KPklmIGl0IGhhcyB0byBnbyBpbiBhcyBzaW5nbGUgcGF0Y2gsIHRo
YXQgc2hvdWxkIGJlIGFmdGVyIGFsbCB0aGUKPnBsdW1iaW5nIGlzIGFscmVhZHkgaW4gcGxhY2Uu
Cj4KPlRoYXQgYWxzbyBnaXZlcyBhIGNsZWFyIGluZGljYXRpb24gdG8gYW55Ym9keSBiYWNrcG9y
dGluZyB0aGF0IHlvdQo+bmVlZCB0byBiYWNrcG9ydCB1bnRpbCB0aGUgdUFQSSBwYXRjaC4KPgoK
T2ssIHdpbGwgaW5jbHVkZSBpb2N0bHMgaW4gdGhlIHJlbGF2YW50IHBhdGNoZXMgaW5zdGVhZCBv
ZiB0aGlzIHNlcGFyYXRlIHBhdGNoLgoKVGhhbmtzLApOaXJhbmphbmEKCj5SZWdhcmRzLCBKb29u
YXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
