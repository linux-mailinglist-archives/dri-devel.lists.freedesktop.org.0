Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7DED789F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D710789BAC;
	Tue, 15 Oct 2019 14:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F106E81C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:32:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 07:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; d="scan'208";a="220437673"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2019 07:32:36 -0700
Received: from andy by smile with local (Exim 4.92.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1iKNsK-0001RN-1o; Tue, 15 Oct 2019 17:32:36 +0300
Date: Tue, 15 Oct 2019 17:32:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 05/11] drm/tinydrm: Remove
 tinydrm_spi_max_transfer_size()
Message-ID: <20191015143236.GA5363@smile.fi.intel.com>
References: <20190719155916.62465-1-noralf@tronnes.org>
 <20190719155916.62465-6-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190719155916.62465-6-noralf@tronnes.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sam@ravnborg.org, david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDU6NTk6MTBQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IHNwaS1iY20yODM1IGNhbiBoYW5kbGUgPjY0a0IgYnVmZmVycyBub3cgc28gdGhl
cmUgaXMgbm8gbmVlZCB0byBjaGVjawo+IC0+bWF4X2RtYV9sZW4uIFRoZSB0aW55ZHJtX3NwaV9t
YXhfdHJhbnNmZXJfc2l6ZSgpIG1heF9sZW4gYXJndW1lbnQgaXMKPiBub3QgdXNlZCBieSBhbnkg
Y2FsbGVycywgc28gbm90IG5lZWRlZC4KPiAKPiBUaGVuIHdlIGhhdmUgdGhlIHNwaV9tYXggbW9k
dWxlIHBhcmFtZXRlci4gSXQgd2FzIGFkZGVkIGJlY2F1c2UKPiBzdGFnaW5nL2ZidGZ0IGhhcyBz
dXBwb3J0IGZvciBpdCBhbmQgdGhlcmUgd2FzIGEgcmVwb3J0IHRoYXQgc29tZW9uZSB1c2VkCj4g
aXQgdG8gc2V0IGEgc21hbGwgYnVmZmVyIHNpemUgdG8gYXZvaWQgcG9wcGluZyBvbiBhIFVTQiBz
b3VuZGNhcmQgb24gYQo+IFJhc3BiZXJyeSBQaS4gSW4gaGluZHNpZ2h0IGl0IHNob3VsZG4ndCBo
YXZlIGJlZW4gYWRkZWQsIEkgc2hvdWxkIGhhdmUKPiB3YWl0ZWQgZm9yIGl0IHRvIGJlY29tZSBh
IHByb2JsZW0gZmlyc3QuIEkgZG9uJ3Qga25vdyBpdCBhbnlvbmUgaXMKPiBhY3R1YWxseSB1c2lu
ZyBpdCwgYnV0IHNpbmNlIHRpbnlkcm1fc3BpX3RyYW5zZmVyKCkgaXMgYmVpbmcgbW92ZWQgdG8K
PiBtaXBpLWRiaSwgSSdtIHRha2luZyB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVtb3ZlIGl0LiBJJ2xs
IGFkZCBpdCBiYWNrIHRvCj4gbWlwaS1kYmkgaWYgc29tZW9uZSBjb21wbGFpbnMuCj4gCj4gV2l0
aCB0aGF0IG91dCBvZiB0aGUgd2F5LCBzcGlfbWF4X3RyYW5zZmVyX3NpemUoKSBjYW4gYmUgdXNl
ZCBpbnN0ZWFkLgo+IAo+IFRoZSBjaG9zZW4gMTZrQiBidWZmZXIgc2l6ZSBmb3IgVHlwZSBDIE9w
dGlvbiAxICg5LWJpdCkgaW50ZXJmYWNlIGlzCj4gc29tZXdoYXQgYXJiaXRyYXJ5LCBidXQgYSBi
aWdnZXIgYnVmZmVyIHdpbGwgaGF2ZSBhIG1pbmlzY3VsZSBpbXBhY3Qgb24KPiB0cmFuc2ZlciBz
cGVlZCwgc28gaXQncyBwcm9iYWJseSBmaW5lLgoKVGhpcyBicmVha3MgdGhlIFNQSSBQWEEyeHgg
Y2FzZSBJJ20gdXNpbmcuIFRoZSB3b3JsZCBpcyBub3QgYSBQaTplLgoKWyAgMzg4LjQ0NTc1Ml0g
bWkwMjgzcXQgc3BpLVBSUDAwMDE6MDE6IERNQSBkaXNhYmxlZCBmb3IgdHJhbnNmZXIgbGVuZ3Ro
IDE1MzYwMCBncmVhdGVyIHRoYW4gNjU1MzYKWyAgMzg4LjYzNDQzN10gbWkwMjgzcXQgc3BpLVBS
UDAwMDE6MDE6IERNQSBkaXNhYmxlZCBmb3IgdHJhbnNmZXIgbGVuZ3RoIDE1MzYwMCBncmVhdGVy
IHRoYW4gNjU1MzYKWyAgMzg4LjgyMjkzM10gbWkwMjgzcXQgc3BpLVBSUDAwMDE6MDE6IERNQSBk
aXNhYmxlZCBmb3IgdHJhbnNmZXIgbGVuZ3RoIDE1MzYwMCBncmVhdGVyIHRoYW4gNjU1MzYKClRo
ZSBjcnVjaWFsIHRoaW5nIGlzIHRvIGNoZWNrIHRoZSB0cmFuc2ZlciBzaXplIGFnYWluc3QgbWF4
aW11bSBETUEgbGVuZ3RoCm9mIHRoZSBtYXN0ZXIuCgpQbGVhc2UsIGZpeC4KCi0tIApXaXRoIEJl
c3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
