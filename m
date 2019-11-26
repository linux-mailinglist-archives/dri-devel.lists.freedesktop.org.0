Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D1C109F71
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C066E3DB;
	Tue, 26 Nov 2019 13:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4966E3DB;
 Tue, 26 Nov 2019 13:44:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 05:44:33 -0800
X-IronPort-AV: E=Sophos;i="5.69,245,1571727600"; d="scan'208";a="198825471"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.9.229])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 05:44:29 -0800
MIME-Version: 1.0
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20191122205734.15925-3-niranjana.vishwanathapura@intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-3-niranjana.vishwanathapura@intel.com>
Message-ID: <157477586596.23972.14568027684962332897@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [RFC 02/13] drm/i915/svm: Define SVM UAPI
Date: Tue, 26 Nov 2019 15:44:26 +0200
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
Cc: sanjay.k.kumar@intel.com, sudeep.dutt@intel.com,
 dri-devel@lists.freedesktop.org, dave.hansen@intel.com, jglisse@redhat.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, dan.j.williams@intel.com,
 ira.weiny@intel.com, jgg@mellanox.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhICgyMDE5LTExLTIyIDIyOjU3OjIzKQo+
IERlZmluZSBVQVBJIGZvciBTaGFyZWQgVmlydHVhbCBNZW1vcnkgKFNWTSkgZnVjbnRpb25hbGl0
eSBpbmNsdWRpbmcKPiBTVk0gY2FwYWJpbGl0eSBhbmQgY29uZmlndXJhYmlsaXR5Lgo+IFdoZW4g
dGhlcmUgaXMgbm8gR1BVIHBhZ2UgZmF1bHQgc3VwcG9ydCBhdmFpbGFibGUsIGFkZCBpb2N0bHMK
PiB0byBleHBsaWNpdGx5IGJpbmQgYW5kIG1pZ3JhdGUgdmlydHVhbCBhZGRyZXNzIHJhbmdlcy4K
PiAKPiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29t
Pgo+IENjOiBKb24gQmxvb21maWVsZCA8am9uLmJsb29tZmllbGRAaW50ZWwuY29tPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogU3VkZWVwIER1dHQg
PHN1ZGVlcC5kdXR0QGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdh
bmF0aGFwdXJhIDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBWZW5rYXRhIFNhbmRlZXAgRGhhbmFsYWtvdGEgPHZlbmthdGEucy5kaGFuYWxha290
YUBpbnRlbC5jb20+CgpIYXZpbmcgdGhpcyBhcyBhIHNlcGFyYXRlIGNvbW1pdCBhaGVhZCBvZiB0
aGUgZnVuY3Rpb25hbGl0eSBicmVha3MKYmlzZWN0aW5nLgoKVGhlIHVBUEkgc2hvdWxkIGJlIGV4
cG9zZWQgaW4gc2ltaWxhciBzaXplZCBjaHVua3MgYXMgaXQncyBpbXBsZW1lbnRlZC4KSWYgaXQg
aGFzIHRvIGdvIGluIGFzIHNpbmdsZSBwYXRjaCwgdGhhdCBzaG91bGQgYmUgYWZ0ZXIgYWxsIHRo
ZQpwbHVtYmluZyBpcyBhbHJlYWR5IGluIHBsYWNlLgoKVGhhdCBhbHNvIGdpdmVzIGEgY2xlYXIg
aW5kaWNhdGlvbiB0byBhbnlib2R5IGJhY2twb3J0aW5nIHRoYXQgeW91Cm5lZWQgdG8gYmFja3Bv
cnQgdW50aWwgdGhlIHVBUEkgcGF0Y2guCgpSZWdhcmRzLCBKb29uYXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
