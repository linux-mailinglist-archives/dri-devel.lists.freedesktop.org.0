Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF77BAF2F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 10:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EAD6E22C;
	Mon, 23 Sep 2019 08:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177CF6E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 08:18:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 01:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; d="scan'208";a="203076855"
Received: from dwitkows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.38.137])
 by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2019 01:18:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/i915: switch to
 drm_fb_helper_remove_conflicting_pci_framebuffers
In-Reply-To: <20190823090236.etu5xvekfu4jsuzp@sirius.home.kraxel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190822090645.25410-1-kraxel@redhat.com>
 <20190822090645.25410-4-kraxel@redhat.com>
 <20190822131314.GX11147@phenom.ffwll.local>
 <20190823081427.hukub5ozdyqodfia@sirius.home.kraxel.org>
 <CAKMK7uET5HhoVmiTyUma1rdK67-w9GrnGwiy5W9XQKP+OLx3jg@mail.gmail.com>
 <20190823090236.etu5xvekfu4jsuzp@sirius.home.kraxel.org>
Date: Mon, 23 Sep 2019 11:18:49 +0300
Message-ID: <87v9tjh1cm.fsf@intel.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMyBBdWcgMjAxOSwgR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+IHdy
b3RlOgo+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDEwOjMwOjM1QU0gKzAyMDAsIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDEwOjE0IEFNIEdlcmQgSG9m
Zm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiB3cm90ZToKPj4gPgo+PiA+IFdob2xlIHNlcmllcyBv
ciBqdXN0IHRoZSBpOTE1IHBhdGNoPwo+PiAKPj4gT2sgSSBqdXN0IGNoZWNrZWQgYW5kIHRoaXMg
YWxsIGxhbmRlZCBpbiA1LjEgYWxyZWFkeSwgSSB0aG91Z2h0IGl0IHdhcwo+PiBtb3JlIHJlY2Vu
dC4gSSB0aGluayB0aGF0J3MgZ29vZCBlbm91Z2gsIHB1c2ggaXQgYWxsIHdpdGhvdXQgbW9yZQo+
PiB3YWl0aW5nLgo+Cj4gUHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgpBZnRlci10aGUtZmFjdCBu
aXRwaWNrOiBpOTE1IG1haW50YWluZXJzIHdlcmUgQ2MnZCBvbiB0aGUgb3JpZ2luYWwKcGF0Y2gs
IGJ1dCBub3Qgb24gdGhlIHN1YnNlcXVlbnQgZGlzY3Vzc2lvbiBvbiBtZXJnaW5nLCBvciB3aGVy
ZSB0bwptZXJnZS4gaW50ZWwtZ2Z4QCBtYWlsaW5nIGxpc3Qgd2Fzbid0IENjJ2QgYXQgYWxsLCB3
aGljaCBtZWFucyB0aGlzCmRpZG4ndCBnZXQgYW55IHByZS1tZXJnZSBDSSBjb3ZlcmFnZSB3ZSBl
eHBlY3Qgb24gZXZlcnkgcGF0Y2guIEkgZm91bmQKYWJvdXQgdGhpcyBoYXZpbmcgYmVlbiBtZXJn
ZWQgdGhyb3VnaCBhIG1lcmdlIGNvbmZsaWN0LgoKSWYgeW91IGRvbid0IHNlZSB0aGUgYWNrIGZy
b20gdGhlIG1haW50YWluZXJzLCBwbGVhc2UgYXNrLgoKCkJSLApKYW5pLgoKLS0gCkphbmkgTmlr
dWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
