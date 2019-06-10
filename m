Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D4C3B21B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 11:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78F8890E9;
	Mon, 10 Jun 2019 09:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECC6890E9;
 Mon, 10 Jun 2019 09:29:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 02:29:38 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2019 02:29:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Paul Wise <pabs3@bonedaddy.net>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm: add fallback override/firmware EDID modes
 workaround
In-Reply-To: <0667fc81810f2da5110c7da00963c93da90a6cd7.camel@bonedaddy.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190607110513.12072-1-jani.nikula@intel.com>
 <20190607110513.12072-2-jani.nikula@intel.com>
 <20190607151021.GJ21222@phenom.ffwll.local>
 <24d1a13799ae7e0331ff668d9b170c4920d7d762.camel@bonedaddy.net>
 <0667fc81810f2da5110c7da00963c93da90a6cd7.camel@bonedaddy.net>
Date: Mon, 10 Jun 2019 12:32:30 +0300
Message-ID: <87blz5zsy9.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAwOCBKdW4gMjAxOSwgUGF1bCBXaXNlIDxwYWJzM0Bib25lZGFkZHkubmV0PiB3cm90
ZToKPiBPbiBTYXQsIDIwMTktMDYtMDggYXQgMTM6MTAgKzA4MDAsIFBhdWwgV2lzZSB3cm90ZToK
Pgo+PiBJJ3ZlIHRlc3RlZCB0aGVzZSB0d28gcGF0Y2hlcyBvbiB0b3Agb2YgTGludXggdjUuMi1y
YzMgYW5kIHRoZSBFRElECj4+IG92ZXJyaWRlIHdvcmtzIGNvcnJlY3RseSBvbiBhbiBJbnRlbCBJ
cm9ubGFrZSBHUFUgd2l0aCBhIG1vbml0b3IgdGhhdAo+PiBsb3N0IGl0cyBFRElEIGEgd2hpbGUg
YWdvLgo+Cj4gV2hpbGUgdGVzdGluZyBJIG5vdGljZWQgYSBjb3VwbGUgb2YgdGhpbmdzOgo+Cj4g
V2hpbGUgZXZlcnl0aGluZyB0aGUgR1VJIGlzIHRoZSBjb3JyZWN0IHJlc29sdXRpb24sIEdOT01F
IGlzIHVuYWJsZSB0bwo+IGlkZW50aWZ5IHRoZSBtb25pdG9yIHZlbmRvciBvciBtb2RlbC4gVGhp
cyBpcyBhIHJlZ3Jlc3Npb24gZnJvbSB0aGUKPiBwcmV2aW91cyBlZGlkIG92ZXJyaWRlIGZ1bmN0
aW9uYWxpdHkuIEl0IGxvb2tzIGxpa2UgdGhpcyBpcyBiZWNhdXNlIHRoZQo+IGVkaWQgZmlsZSBp
biAvc3lzIGlzIG5vdCBwb3B1bGF0ZWQgd2l0aCB0aGUgRURJRCBvdmVycmlkZSBkYXRhLgoKUmln
aHQsIEkndmUgYWRkZWQgYSBjYWxsIHRvIGRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVy
dHkoKSBpbiB2Mgp0byBhZGRyZXNzIHRoaXMgaXNzdWUuCgo+IEkgZ290IGEgY3Jhc2ggZHVlIHRv
IG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCBvbmUgcG9pbnQsIEknbGwgdHJ5IHRvCj4gdHJh
Y2sgZG93biB3aGVuIHRoaXMgaGFwcGVucy4KCkNhbid0IHRoaW5rIG9mIHdoeSB0aGlzIHdvdWxk
IGhhcHBlbjsgdGhlIGJhY2t0cmFjZSBtaWdodCBvZmZlciBjbHVlcy4KClRoYW5rcyBmb3IgdGVz
dGluZyEKCkJSLApKYW5pLgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFw
aGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
