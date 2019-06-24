Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADC35093F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 12:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DBD89AB3;
	Mon, 24 Jun 2019 10:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD92897FB;
 Mon, 24 Jun 2019 10:52:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 03:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,411,1557212400"; d="scan'208";a="182612393"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 24 Jun 2019 03:52:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v1 0/2] drm: drop uapi dependencies from
 include/drm
In-Reply-To: <CACvgo53j8XEiTO3+g_692GkcvzHAViMzhh_ZuK+-6W4kHm0pgw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190622121156.17217-1-sam@ravnborg.org>
 <20190624082135.GL12905@phenom.ffwll.local>
 <CACvgo53j8XEiTO3+g_692GkcvzHAViMzhh_ZuK+-6W4kHm0pgw@mail.gmail.com>
Date: Mon, 24 Jun 2019 13:55:35 +0300
Message-ID: <87mui7s15k.fsf@intel.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyNCBKdW4gMjAxOSwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5j
b20+IHdyb3RlOgo+IE9uIE1vbiwgMjQgSnVuIDIwMTkgYXQgMDk6MjEsIERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4KPj4gPiBkcm1fbGVnYWN5LmgKPj4gPiAtIG5lZWRz
IGRybV9tYXBfdHlwZSBhbmQgZHJtX21hcF9mbGFncy4gU2VlbXMgbGVnaXQuCj4+Cj4+IGVudW0g
aW4gdWFwaSwgc3dlZXQgKG5ldmVyIGRvIHRoaXMsIGl0J3Mgbm90IHBvcnRhYmxlIGFjcm9zcyBj
b21waWxlcnMsCj4+ICNkZWZpbmVzIGFsbCB0aGUgd2F5KS4KPgo+IERvbid0IGxvb2sgdG9vIGNs
b3NlbHkgdGhlbgo+ICQgZ2l0IGdyZXAgZW51bSAtLSBpbmNsdWRlL3VhcGkvZHJtLyB8IHdjIC1s
Cj4gOTYKPgo+IEEgaGFuZGZ1bCBvZiB0aG9zZSBhcmUgbGVnYWN5IHN0dWZmLCB5ZXQgcXVpdGUg
YSBmZXcgYXJlIG5vdCA6LVwKCkVudW1zIGFyZSBqdXN0IGZpbmUgZm9yICp2YWx1ZXMqIGFzIGxv
bmcgYXMgdGhleSdyZSBub3QgdXNlZCBhcyB0eXBlcyBpbgpzdHJ1Y3QgbWVtYmVycyBvciBmdW5j
dGlvbiBwYXJhbWV0ZXJzIG9yIHJldHVybiB0eXBlcywgcmlnaHQ/CgpTbyB3ZSBkbyBoYXZlIHNv
bWUgd2UndmUgc2NyZXdlZCB1cCwgYnV0IGl0J3Mgbm90IG5lYXJseSBhcyBiYWQgYXMgdGhlCmdp
dCBncmVwIGFib3ZlIHdvdWxkIGxlYWQgeW91IHRvIGJlbGlldmUuCgpUaGUgb25lcyBpbiBxdWVz
dGlvbiBhcmUgdXNlZCBpbiBzdHJ1Y3QgZHJtX21hcCB3aGljaCBpcyB1c2VkIGluCkRSTV9JT0NU
TF9HRVRfTUFQLCBEUk1fSU9DVExfQUREX01BUCwgYW5kIERSTV9JT0NUTF9STV9NQVAuCgpCUiwK
SmFuaS4KCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
