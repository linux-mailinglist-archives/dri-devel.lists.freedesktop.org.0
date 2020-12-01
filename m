Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6A12CA418
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 14:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0C46E53E;
	Tue,  1 Dec 2020 13:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1165989CD8;
 Tue,  1 Dec 2020 13:43:36 +0000 (UTC)
IronPort-SDR: EbsetUgBdIx9Ej//Y/hfSZrvQBqZ9hcWk7Zo46mzmVAXcSB64fdkzZZichegRujZzlDSF8V0cw
 xNjBsMyOYJOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="169324250"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="169324250"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 05:43:32 -0800
IronPort-SDR: GNFrN36Y65wF2fqLrARYEd0sbTN1i8vLhJ3a29hGhizcdH/1GCXgZ/5xlVOEunzlePvxRk0ymb
 KbnsjR41oe7w==
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="539023946"
Received: from hpicot-mobl.ger.corp.intel.com (HELO [10.252.22.39])
 ([10.252.22.39])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 05:43:31 -0800
Subject: Re: [Intel-gfx] [RFC PATCH 092/162] drm/i915/uapi: introduce
 drm_i915_gem_create_ext
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-93-matthew.auld@intel.com>
 <160682733503.4024.12763949700807658471@build.alporthouse.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <d28dedef-a7b2-5d01-584b-9b229b434c8f@intel.com>
Date: Tue, 1 Dec 2020 13:43:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160682733503.4024.12763949700807658471@build.alporthouse.com>
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEvMTIvMjAyMCAxMjo1NSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgTWF0dGhl
dyBBdWxkICgyMDIwLTExLTI3IDEyOjA2OjA4KQo+PiBTYW1lIG9sZCBnZW1fY3JlYXRlIGJ1dCB3
aXRoIG5vdyB3aXRoIGV4dGVuc2lvbnMgc3VwcG9ydC4gVGhpcyBpcyBuZWVkZWQKPj4gdG8gc3Vw
cG9ydCB2YXJpb3VzIHVwY29taW5nIHVzZWNhc2VzLiBGb3Igbm93IHdlIHVzZSB0aGUgZXh0ZW5z
aW9ucwo+PiBtZWNoYW5pc20gdG8gc3VwcG9ydCBzZXR0aW5nIGFuIGltbXV0YWJsZS1wcmlvcml0
eS1saXN0IG9mIHBvdGVudGlhbAo+PiBwbGFjZW1lbnRzLCBhdCBjcmVhdGlvbiB0aW1lLgo+Pgo+
PiBJZiB3ZSB3aXNoIHRvIHNldCB0aGUgcGxhY2VtZW50cy9yZWdpb25zIHdlIGNhbiBzaW1wbHkg
ZG86Cj4+Cj4+IHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0X3BhcmFtIHJlZ2lvbl9wYXJhbSA9
IHsg4oCmIH07IC8qIFVuY2hhbmdlZCAqLwo+PiBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2NyZWF0ZV9l
eHRfc2V0cGFyYW0gc2V0cGFyYW1fcmVnaW9uID0gewo+PiAgICAgIC5iYXNlID0geyAubmFtZSA9
IEk5MTVfR0VNX0NSRUFURV9FWFRfU0VUUEFSQU0gfSwKPj4gICAgICAucGFyYW0gPSByZWdpb25f
cGFyYW0sCj4+IH0KPj4KPj4gc3RydWN0IGRybV9pOTE1X2dlbV9jcmVhdGVfZXh0IGNyZWF0ZV9l
eHQgPSB7Cj4+ICAgICAgICAgIC5zaXplID0gMTYgKiBQQUdFX1NJWkUsCj4+ICAgICAgICAgIC5l
eHRlbnNpb25zID0gKHVpbnRwdHJfdCkmc2V0cGFyYW1fcmVnaW9uLAo+PiB9Owo+PiBpbnQgZXJy
ID0gaW9jdGwoZmQsIERSTV9JT0NUTF9JOTE1X0dFTV9DUkVBVEVfRVhULCAmY3JlYXRlX2V4dCk7
Cj4+IGlmIChlcnIpIC4uLgo+IAo+IExvb2tpbmcgYXQgdGhlIGV4aXN0aW5nIGdlbV9jcmVhdGUs
IHRoZXJlIGlzIG5vIGRldGVjdGlvbiBvZiBhbgo+IHVuc3VwcG9ydGVkIGV4dGVuc2lvbi4gVGhh
dCBpcyB0aGVyZSBpcyBubyByZWplY3Rpb24gb2YgbmV3IHVzZXJzcGFjZQo+IGFza2luZyBmb3Ig
cGxhY2VtZW50IG9uIGFuIG9sZCBrZXJuZWwuIChBcyBlcnJvbmVvdXMgYXMgdGhhdCB3b3VsZCBi
ZQo+IGZvciBtYW55IG90aGVyIHJlYXNvbnMuKQo+IAo+IFVubGVzcyBJJ3ZlIG1pc3NlZCBzb21l
dGhpbmcsIHdlIG5lZWQgYSBuZXcgaW9jdGwgbnVtYmVyIGZvciBDUkVBVEV2Mi4KCitKb29uYXMK
ClJpZ2h0LCBhbmQgSSBndWVzcyBpdCdzIG5vdCBhIGdvb2QgaWRlYSBmb3IgdXNlcnNwYWNlIHRv
IGltcGxlbWVudCAKc29tZXRoaW5nIGxpa2UgaGFzX2dlbV9jcmVhdGVfZXh0KCk/Cgo+IC1DaHJp
cwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
