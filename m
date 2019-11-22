Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE71105E22
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 02:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4227F6E372;
	Fri, 22 Nov 2019 01:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8C16E372
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 01:25:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 17:25:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,228,1571727600"; d="scan'208";a="210108101"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.13.128])
 by orsmga003.jf.intel.com with ESMTP; 21 Nov 2019 17:25:46 -0800
Date: Fri, 22 Nov 2019 09:32:45 +0800
From: Philip Li <philip.li@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: 2989f64510 ("dma-buf: Add selftests for dma-fence"): WARNING:
 CPU: 0 PID: 1 at lib/debugobjects.c:524 __debug_object_init
Message-ID: <20191122013244.GC313@intel.com>
References: <5dd63a8f.BFdOlqs/XZAJHDfR%lkp@intel.com>
 <157432116576.24852.2065478066028556019@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157432116576.24852.2065478066028556019@skylake-alporthouse-com>
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

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDc6MjY6MDVBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3Rpbmcga2VybmVsIHRlc3Qgcm9ib3QgKDIwMTktMTEtMjEgMDc6MTk6NDMpCj4g
PiBHcmVldGluZ3MsCj4gPiAKPiA+IDBkYXkga2VybmVsIHRlc3Rpbmcgcm9ib3QgZ290IHRoZSBi
ZWxvdyBkbWVzZyBhbmQgdGhlIGZpcnN0IGJhZCBjb21taXQgaXMKPiA+IAo+ID4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
IG1hc3Rlcgo+ID4gCj4gPiBjb21taXQgMjk4OWY2NDUxMDg0YWVkM2Y4Y2M5OTkyNDc3ZjdhOWJm
NTdhMzcxNgo+ID4gQXV0aG9yOiAgICAgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Cj4gPiBBdXRob3JEYXRlOiBNb24gQXVnIDE5IDEwOjU5OjI3IDIwMTkgKzAxMDAKPiA+
IENvbW1pdDogICAgIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4g
Q29tbWl0RGF0ZTogTW9uIEF1ZyAxOSAxODowOTo0NiAyMDE5ICswMTAwCj4gCj4gVGhhdCdzIGEg
YmVsYXRlZCByZXBvcnQsIGZpeGVkIGJ5CkhpIENocmlzLCB0aGFua3MgZm9yIHRoZSBmZWVkYmFj
aywgd2Ugd2lsbCBkb3VibGUgY2hlY2sgdGhpcyByZXBvcnQgYW5kCnByb3ZpZGUgdXBkYXRlIGxh
dGVyLgoKPiAKPiBjb21taXQgNmFjM2EwZWJmY2MyZjBjNzVjYTBjYTY5NzQzODljZTQyMWFhNWNi
ZAo+IEF1dGhvcjogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gRGF0
ZTogICBUdWUgQXVnIDIwIDEzOjIxOjE4IDIwMTkgKzAxMDAKPiAKPiAJZG1hYnVmOiBNYXJrIHVw
IG9uc3RhY2sgdGltZXIgZm9yIHNlbGZ0ZXN0cwo+IAo+IE5vPwo+IC1DaHJpcwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
