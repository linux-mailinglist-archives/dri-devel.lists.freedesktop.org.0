Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75D109FC6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 15:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7046E3F0;
	Tue, 26 Nov 2019 14:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5156E3F0;
 Tue, 26 Nov 2019 14:03:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 06:03:29 -0800
X-IronPort-AV: E=Sophos;i="5.69,245,1571727600"; d="scan'208";a="198830327"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.9.229])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 06:03:24 -0800
MIME-Version: 1.0
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
Message-ID: <157477700115.23972.3132021093162546497@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [RFC 00/13] drm/i915/svm: Add SVM support
Date: Tue, 26 Nov 2019 16:03:21 +0200
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

UXVvdGluZyBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhICgyMDE5LTExLTIyIDIyOjU3OjIxKQo+
IFNoYXJlZCBWaXJ0dWFsIE1lbW9yeSAoU1ZNKSBhbGxvd3MgdGhlIHByb2dyYW1tZXIgdG8gdXNl
IGEgc2luZ2xlIHZpcnR1YWwKPiBhZGRyZXNzIHNwYWNlIHdoaWNoIHdpbGwgYmUgc2hhcmVkIGJl
dHdlZW4gdGhyZWFkcyBleGVjdXRpbmcgb24gQ1BVcyBhbmQgR1BVcy4KPiBJdCBhYnN0cmFjdHMg
YXdheSBmcm9tIHRoZSB1c2VyIHRoZSBsb2NhdGlvbiBvZiB0aGUgYmFja2luZyBtZW1vcnksIGFu
ZCBoZW5jZQo+IHNpbXBsaWZpZXMgdGhlIHVzZXIgcHJvZ3JhbW1pbmcgbW9kZWwuCj4gU1ZNIHN1
cHBvcnRzIHR3byB0eXBlcyBvZiB2aXJ0dWFsIG1lbW9yeSBhbGxvY2F0aW9uIG1ldGhvZHMuCj4g
UnVudGltZSBhbGxvY2F0b3IgcmVxdWlyZXMgdGhlIGRyaXZlciB0byBwcm92aWRlIG1lbW9yeSBh
bGxvY2F0aW9uIGFuZAo+IG1hbmFnZW1lbnQgaW50ZXJmYWNlLCBsaWtlIGJ1ZmZlciBvYmplY3Qg
KEJPKSBpbnRlcmZhY2UuCj4gV2hlcmVhcyBzeXN0ZW0gYWxsb2NhdG9yIG1ha2VzIHVzZSBvZiBk
ZWZhdWx0IE9TIG1lbW9yeSBhbGxvY2F0aW9uIGFuZAo+IG1hbmFnZW1lbnQgc3VwcG9ydCBsaWtl
IG1hbGxvYygpLgo+IAo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgYm90aCBTVk0gc3lzdGVtIGFu
ZCBydW50aW1lIGFsbG9jYXRvciBzdXBwb3J0Cj4gdG8gaTkxNSBkcml2ZXIuCj4gCj4gVGhlIHBh
dGNoIHNlcmllcyBpbmNsdWRlcwo+ICAtIFNWTSBzdXBwb3J0IGZvciBib3RoIHN5c3RlbSBhbmQg
cnVudGltZSBhbGxvY2F0aW9uLgo+ICAtIFBsdWdpbiBpbiBkZXZpY2UgbWVtb3J5IHdpdGggdGhl
IExpbnV4IGtlcm5lbC4KPiAgLSBVc2VyIEFQSSBhZHZlcnRpc2luZyBTVk0gY2FwYWJpbGl0eSBh
bmQgY29uZmlndXJhdGlvbiBieSB1c2VyIG9uIHBlcgo+ICAgIHZtIGJhc2lzLgo+ICAtIFVzZXIg
QVBJIHRvIGJpbmQgYW4gYWRkcmVzcyByYW5nZSBvciBhIEJPIHdpdGggYSBkZXZpY2UgcGFnZSB0
YWJsZS4KPiAgLSBVc2VyIEFQSSB0byBtaWdyYXRlIGFuIGFkZHJlc3MgcmFuZ2UgdG8gZGV2aWNl
IG1lbW9yeS4KPiAgLSBJbXBsaWNpdCBtaWdyYXRpb24gYnkgbW92aW5nIHBhZ2VzIG9yIEJPcyBi
YWNrIGZyb20gZGV2aWNlIHRvIGhvc3QKPiAgICBtZW1vcnkgdXBvbiBDUFUgYWNjZXNzLgo+ICAt
IENQVSBjb3B5IGFuZCBibGl0dGVyIGNvcHkgc3VwcG9ydCBmb3IgbWlncmF0aW5nIHRoZSBwYWdl
cy9CT3MuCj4gIC0gTGFyZ2UgcGFnZSBtYXBwaW5nIHN1cHBvcnQKPiAgLSBQYWdlIHRhYmxlIGR1
bXAgc3VwcG9ydC4KCkxpbmsgdG8gdGhlIElHVHMsIGFueSBzZWxmdGVzdHM/CkxpbmsgdG8gdXNl
cnNwYWNlIGNoYW5nZXM/CgpSZWdhcmRzLCBKb29uYXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
