Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018741104E9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 20:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0066EA6B;
	Tue,  3 Dec 2019 19:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9076EA6B;
 Tue,  3 Dec 2019 19:18:44 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 11:18:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,274,1571727600"; d="scan'208";a="235992677"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by fmsmga004.fm.intel.com with ESMTP; 03 Dec 2019 11:18:43 -0800
Date: Tue, 3 Dec 2019 11:07:25 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Message-ID: <20191203190725.GP14488@nvishwa1-DESK.sc.intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com>
 <20191123044417.GE14488@nvishwa1-DESK.sc.intel.com>
 <20191123235348.GD7481@mellanox.com>
 <20191124211247.GF14488@nvishwa1-DESK.sc.intel.com>
 <20191125132414.GQ7481@mellanox.com>
 <20191125163256.GG14488@nvishwa1-DESK.sc.intel.com>
 <20191126184509.GN7481@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126184509.GN7481@mellanox.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDY6NDU6MTRQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDg6MzI6NThBTSAtMDgwMCwgTmlyYW5q
YW4gVmlzaHdhbmF0aGFwdXJhIHdyb3RlOgo+PiA+IEFuZCBwdXR0aW5nIHRoZSBjcHUgUEZOIG9m
IGEgWk9ORV9ERVZJQ0UgZGV2aWNlIHBhZ2UgaW50bwo+PiA+IHNnX2RtYV9hZGRyZXNzIHN0aWxs
IGxvb2tzIHZlcnkgd3JvbmcgdG8gbWUKPj4KPj4gVGhlIGJlbG93IGNhbGwgaW4gcGF0Y2ggNyBk
b2VzIGNvbnZlcnQgYW55IGNwdSBQRk4gdG8gZGV2aWNlIGFkZHJlc3MuCj4+IFNvLCBpdCB3b24n
dCBiZSBDUFUgUEZOLgo+PiBpOTE1X2RtZW1fY29udmVydF9wZm4odm0tPmk5MTUsICZyYW5nZSk7
Cj4KPldlbGwsIHRoZW4gaXQgc2hvdWxkIGJlIGRvbmUgaGVyZSBpbiBwYXRjaCA2LCBzdXJlbHk/
Cj4KPj4gQWxzbywgb25seSByZWFzb24gdG8gdXNlIHNnbCBsaXN0IGlzIGJlY2F1c2UgaTkxNSBk
cml2ZXIgcGFnZSB0YWJsZSB1cGRhdGUKPj4gZnVuY3Rpb25zIHRha2VzIGFuIHNnbCwgb3RoZXJ3
aXNlIHdlIGNhbiBkaXJlY3RseSBkZWFsIHdpdGggcmFuZ2UucGZucyBhcnJheS4KPgo+TWF5YmUg
dGhhdCBzaG91bGQgYmUgZml4ZWQgaW5zdGVhZCBvZiBhYnVzaW5nIHNnbAo+CgpTb3JyeSwgbWlz
c2VkIHRoZXNlIGNvbW1lbnRzLgoKV2VsbCwgdGhpcyBpOTE1IFNWTSBzdXBwb3J0IGNhbiBiZSBl
eHRlbmRlZCB0byB3b3JrIG9uIGludGVsIGludGVncmF0ZWQgZ2Z4IGFsc28Kd2l0aCBob3N0IG1l
bW9yeSAobm8gWk9ORV9ERVZJQ0UpLCB0aG91Z2ggZW5hYmxpbmcgaXQgaXMgbm90IHRoZSBwcmlt
YXJ5IGZvY3VzIGZvcgp0aGlzIHBhdGNoIHNlcmllcy4KVGhlcmUgd2UgbmVlZCB0byBkbWEgbWFw
IHRoZXNlIENQVSBQRk5zIGFuZCBhc3NpZ24gdG8gdGhlIHNnX2RtYV9hZGRyZXNzLgoKRGV2aWNl
IG1lbW9yeSBwbHVnaW4gZm9yIGRpc2NyZWF0ZSBncmFwaGljcyBpcyBhZGRlZCBpbiBwYXRjaCA3
IG9mIHRoaXMgc2VyaWVzLApoZW5jZSB0aGlzIGNvbnZlcnRfcGZuIGZ1bmN0aW9uIGlzIGFkZGVk
IHRoZXJlLgoKTmlyYW5qYW5hCgo+SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
