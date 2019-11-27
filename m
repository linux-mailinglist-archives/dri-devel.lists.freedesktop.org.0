Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A0110AB20
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 08:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997F26E215;
	Wed, 27 Nov 2019 07:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9286E0E1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 07:23:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 23:23:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,248,1571727600"; d="scan'208";a="383413228"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.13.128])
 by orsmga005.jf.intel.com with ESMTP; 26 Nov 2019 23:23:46 -0800
Date: Wed, 27 Nov 2019 15:30:54 +0800
From: Philip Li <philip.li@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: 2989f64510 ("dma-buf: Add selftests for dma-fence"): WARNING:
 CPU: 0 PID: 1 at lib/debugobjects.c:524 __debug_object_init
Message-ID: <20191127073054.GG30842@intel.com>
References: <5dd63a8f.BFdOlqs/XZAJHDfR%lkp@intel.com>
 <157432116576.24852.2065478066028556019@skylake-alporthouse-com>
 <20191122013244.GC313@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122013244.GC313@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 LKP <lkp@lists.01.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMDk6MzI6NDVBTSArMDgwMCwgUGhpbGlwIExpIHdyb3Rl
Ogo+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDA3OjI2OjA1QU0gKzAwMDAsIENocmlzIFdpbHNv
biB3cm90ZToKPiA+IFF1b3Rpbmcga2VybmVsIHRlc3Qgcm9ib3QgKDIwMTktMTEtMjEgMDc6MTk6
NDMpCj4gPiA+IEdyZWV0aW5ncywKPiA+ID4gCj4gPiA+IDBkYXkga2VybmVsIHRlc3Rpbmcgcm9i
b3QgZ290IHRoZSBiZWxvdyBkbWVzZyBhbmQgdGhlIGZpcnN0IGJhZCBjb21taXQgaXMKPiA+ID4g
Cj4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdCBtYXN0ZXIKPiA+ID4gCj4gPiA+IGNvbW1pdCAyOTg5ZjY0NTEwODRh
ZWQzZjhjYzk5OTI0NzdmN2E5YmY1N2EzNzE2Cj4gPiA+IEF1dGhvcjogICAgIENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gPiBBdXRob3JEYXRlOiBNb24gQXVnIDE5
IDEwOjU5OjI3IDIwMTkgKzAxMDAKPiA+ID4gQ29tbWl0OiAgICAgQ2hyaXMgV2lsc29uIDxjaHJp
c0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiA+IENvbW1pdERhdGU6IE1vbiBBdWcgMTkgMTg6MDk6
NDYgMjAxOSArMDEwMAo+ID4gCj4gPiBUaGF0J3MgYSBiZWxhdGVkIHJlcG9ydCwgZml4ZWQgYnkK
PiBIaSBDaHJpcywgdGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssIHdlIHdpbGwgZG91YmxlIGNoZWNr
IHRoaXMgcmVwb3J0IGFuZAo+IHByb3ZpZGUgdXBkYXRlIGxhdGVyLgpIaSBDaHJpcywgaXQgaXMg
Y29uZmlybWVkIHRoYXQgdGhpcyByZXBvcnQgaXMgZmFsc2UgcG9zaXRpdmUuIDZhYzNhMGUgaGFk
CmZpeGVkIHRoZSBpc3N1ZS4gU29ycnkgZm9yIGluY29udmVuaWVuY2UuCgo+IAo+ID4gCj4gPiBj
b21taXQgNmFjM2EwZWJmY2MyZjBjNzVjYTBjYTY5NzQzODljZTQyMWFhNWNiZAo+ID4gQXV0aG9y
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+IERhdGU6ICAgVHVl
IEF1ZyAyMCAxMzoyMToxOCAyMDE5ICswMTAwCj4gPiAKPiA+IAlkbWFidWY6IE1hcmsgdXAgb25z
dGFjayB0aW1lciBmb3Igc2VsZnRlc3RzCj4gPiAKPiA+IE5vPwo+ID4gLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
