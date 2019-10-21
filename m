Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6871DEA70
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 13:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC23789ED3;
	Mon, 21 Oct 2019 11:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410BE89ED3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 11:09:13 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 04:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; d="scan'208";a="398626868"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 21 Oct 2019 04:08:58 -0700
Received: from andy by smile with local (Exim 4.92.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1iMVYX-0003ab-7l; Mon, 21 Oct 2019 14:08:57 +0300
Date: Mon, 21 Oct 2019 14:08:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] spi: pxa2xx: Set controller->max_transfer_size in dma mode
Message-ID: <20191021110857.GR32742@smile.fi.intel.com>
References: <20191016195721.3714-1-daniel.vetter@ffwll.ch>
 <20191017064426.30814-1-daniel.vetter@ffwll.ch>
 <20191017070638.GB32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017070638.GB32742@smile.fi.intel.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Mark Brown <broonie@kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6MDY6MzhBTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDA4OjQ0OjI2QU0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBJbiBETUEgbW9kZSB3ZSBoYXZlIGEgbWF4aW11bSB0cmFuc2Zl
ciBzaXplLCBwYXN0IHRoYXQgdGhlIGRyaXZlcgo+ID4gZmFsbHMgYmFjayB0byBQSU8gKHNlZSB0
aGUgY2hlY2sgYXQgdGhlIHRvcCBvZiBweGEyeHhfc3BpX3RyYW5zZmVyX29uZSkuCj4gPiBGYWxs
aW5nIGJhY2sgdG8gUElPIGZvciBiaWcgdHJhbnNmZXJzIGRlZmVhdHMgdGhlIHBvaW50IG9mIGEg
ZG1hIGVuZ2luZSwKPiA+IGhlbmNlIHNldCB0aGUgbWF4IHRyYW5zZmVyIHNpemUgdG8gaW5mb3Jt
IHNwaSBjbGllbnRzIHRoYXQgdGhleSBuZWVkCj4gPiB0byBkbyBzb21ldGhpbmcgc21hcnRlci4K
PiA+IAo+ID4gVGhpcyB3YXMgdW5jb3ZlcmVkIGJ5IHRoZSBkcm1fbWlwaV9kYmkgc3BpIHBhbmVs
IGNvZGUsIHdoaWNoIGRvZXMKPiA+IGxhcmdlIHNwaSB0cmFuc2ZlcnMsIGJ1dCBzdG9wcGVkIHNw
bGl0dGluZyB0aGVtIGFmdGVyOgo+ID4gCj4gPiBjb21taXQgZTE0MzM2NGI0YzE3NzRmNjhlOTIz
YTVhMGJiMGZjYTI4YWMyNTg4OAo+ID4gQXV0aG9yOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0
cm9ubmVzLm9yZz4KPiA+IERhdGU6ICAgRnJpIEp1bCAxOSAxNzo1OToxMCAyMDE5ICswMjAwCj4g
PiAKPiA+ICAgICBkcm0vdGlueWRybTogUmVtb3ZlIHRpbnlkcm1fc3BpX21heF90cmFuc2Zlcl9z
aXplKCkKPiA+IAo+ID4gQWZ0ZXIgdGhpcyBjb21taXQgdGhlIGNvZGUgcmVsaWVkIG9uIHRoZSBz
cGkgY29yZSB0byBzcGxpdCB0cmFuc2ZlcnMKPiA+IGludG8gbWF4IGRtYS1hYmxlIGJsb2Nrcywg
d2hpY2ggYWxzbyBwYXBlcmVkIG92ZXIgdGhlIFBJTyBmYWxsYmFjayBpc3N1ZS4KPiA+IAo+ID4g
Rml4IHRoaXMgYnkgc2V0dGluZyB0aGUgb3ZlcmFsbCBtYXggdHJhbnNmZXIgc2l6ZSB0byB0aGUg
RE1BIGxpbWl0LAo+ID4gYnV0IG9ubHkgd2hlbiB0aGUgY29udHJvbGxlciBydW5zIGluIERNQSBt
b2RlLgo+ID4gCj4gCj4gVGhhbmsgeW91LCBEYW5pZWwhCgpNYXJrLCBjYW4gYmUgdGhpcyBhcHBs
aWVkPwoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
