Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32984230D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 12:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B298944A;
	Wed, 12 Jun 2019 10:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710E18944A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 10:52:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 03:52:57 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2019 03:52:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>, Dave
 Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: DRM/AST regression (likely 4.14 -> 4.19+),
 providing EDID manually fails
In-Reply-To: <alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi>
Date: Wed, 12 Jun 2019 13:55:55 +0300
Message-ID: <874l4vxebo.fsf@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyNiBNYXkgMjAxOSwgSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AY3MuaGVs
c2lua2kuZmk+IHdyb3RlOgo+IEhpIGFsbCwKPgo+IEkndmUgYSB3b3Jrc3RhdGlvbiB3aGljaCBo
YXMgaW50ZXJuYWwgVkdBIHRoYXQgaXMgZGV0ZWN0ZWQgYXMgQVNUIDI0MDAgYW5kIAo+IHdpdGgg
aXQgRURJRCBoYXMgYmVlbiBhbHdheXMgcXVpdGUgZmxha3kgKGV4Y2VwdCBmb3Igc29tZSB0aW1l
IGl0IHdvcmtlZCAKPiB3aXRoIDQuMTQgbG9uZyBlbm91Z2ggdGhhdCBJIHRob3VnaHQgdGhlIHBy
b2JsZW1zIHdvdWxkIGJlIHBhc3QgdW50aWwgdGhlIAo+IHByb2JsZW1zIHJlYXBwZWFyZWQgYWxz
byB3aXRoIDQuMTQpLiBUaHVzLCBJJ3ZlIHByb3ZpZGVkIG1hbnVhbGx5IHRoZSBFRElEIAo+IHRo
YXQgSSBleHRyYWN0ZWQgZnJvbSB0aGUgbW9uaXRvciB1c2luZyBvdGhlciBjb21wdXRlciAodGhl
IG1vbml0b3IgaXRzZWxmIAo+IHdvcmtlZCBqdXN0IGZpbmUgb24gdGhlIGVhcmxpZXIgY29tcHV0
ZXIgc28gaXQgaXMgbGlrZWx5IGZpbmUpLgo+Cj4gSSBzZXR1cCB0aGUgbWFudWFsIEVESUQgdXNp
bmcgZHJtX2ttc19oZWxwZXIuZWRpZF9maXJtd2FyZSwgaG93ZXZlciwKPiBhZnRlciB1cGdyYWRp
bmcgdG8gNC4xOS40NSBpdCBzdG9wcGVkIHdvcmtpbmcgKG5vICJHb3QgZXh0ZXJuYWwgRURJRCBi
YXNlIAo+IGJsb2NrIiBhcHBlYXJzIGluIGRtZXNnLCB0aGUgdGV4dCBtb2RlIGlzIGtlcHQgaW4g
dGhlIGxvd2VyIHJlcyBtb2RlLCBhbmQgCj4gWG9yZyBsb2dzIG5vIGxvbmdlciBkdW1wcyB0aGUg
RURJRCBpbmZvIGxpa2UgaXQgZGlkIHdpdGggNC4xNCkuIFNvIEkgZ3Vlc3MgCj4gdGhlIEVESUQg
SSBwcm92aWRlZCBtYW51YWxseSBvbiB0aGUgY29tbWFuZCBsaW5lIGlzIG5vdCBjb3JyZWN0bHkg
cHV0IGludG8gCj4gdXNlIHdpdGggNC4xOSsga2VybmVscy4KPgo+IFRoZSA0LjE5IGRtZXNnIGlu
ZGljYXRlZCB0aGF0IGRybV9rbXNfaGVscGVyLmVkaWRfZmlybXdhcmUgaXMgZGVwcmVjYXRlZCAK
PiBzbyBJIGFsc28gdGVzdGVkIHdpdGggZHJtLmVkaWRfZmlybXdhcmUgaXQgc3VnZ2VzdGVkIGFz
IHRoZSByZXBsYWNlbWVudCAKPiBidXQgd2l0aCBubyBsdWNrIChidXQgSSBiZWxpZXZlIGFsc28g
dGhlIGRybV9rbXNfaGVscGVyIG9uZSBzaG91bGQgaGF2ZSAKPiB3b3JrZWQgYXMgaXQgd2FzIG9u
bHkgImRlcHJlY2F0ZWQiKS4KPgo+IEkgYWxzbyB0cmllZCA1LjEuMiBidXQgaXQgZGlkIG5vdCB3
b3JrIGFueSBiZXR0ZXIgKGFuZCB3aXRoIGl0IGFsc28gdHJpZWQgCj4gcmVtb3ZpbmcgYWxsIHRo
ZSBtYW51YWwgKi5lZGlkX2Zpcm13YXJlIGZyb20gdGhlIGNvbW1hbmQgbGluZSBzbyBJIHN0aWxs
IAo+IG5lZWQgdG8gcHJvdmlkZSBvbmUgbWFudWFsbHkgdG8gaGF2ZSBpdCByZWxpYWJsZSB3b3Jr
aW5nIGl0IHNlZW1zKS4KClRoaXMgc2hvdWxkIGJlIGZpeGVkIGJ5IGNvbW1pdAoKY29tbWl0IDQ4
ZWFlYjc2NjRjNzYxMzk0Mzg3MjRkNTIwYTFlYTRhODRhM2VkOTIKQXV0aG9yOiBKYW5pIE5pa3Vs
YSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgpEYXRlOiAgIE1vbiBKdW4gMTAgMTI6MzA6NTQgMjAx
OSArMDMwMAoKICAgIGRybTogYWRkIGZhbGxiYWNrIG92ZXJyaWRlL2Zpcm13YXJlIEVESUQgbW9k
ZXMgd29ya2Fyb3VuZAoKaW4gZHJtLW1pc2MtZml4ZXMsIGNjOiBzdGFibGUgdjQuMTUuCgpUaGFu
a3MgZm9yIHRoZSByZXBvcnQuCgpCUiwKSmFuaS4KCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9w
ZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
