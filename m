Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEECB348B18
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 09:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014D86ECCE;
	Thu, 25 Mar 2021 08:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EA66ECCE;
 Thu, 25 Mar 2021 08:05:22 +0000 (UTC)
IronPort-SDR: Vi9Ufp+Og1lHQ4NHSphBgKOWgRorNhm/H+SXPf+A37Q3K4mYbPoVb6QaDNNbZwCD1puhG+1tZ8
 Iz62xo3jlOZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="190904511"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="190904511"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 01:05:21 -0700
IronPort-SDR: YSlh8X6JrYCAgcFAjL5XZMs9hqgR3pcWRIp1+nLDHbTGxn8DfB0UC8NvUc6Fyh2eKqFMEpwwEz
 JeibtqsaiX5Q==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="415886752"
Received: from jweber-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.244])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 01:05:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Martin Sebor <msebor@gcc.gnu.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 11/11] [RFC] drm/i915/dp: fix array overflow warning
In-Reply-To: <20210322160253.4032422-12-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-12-arnd@kernel.org>
Date: Thu, 25 Mar 2021 10:05:06 +0200
Message-ID: <87wntv3bgt.fsf@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 Animesh Manna <animesh.manna@intel.com>, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Uma Shankar <uma.shankar@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, ath11k@lists.infradead.org,
 Serge Hallyn <serge@hallyn.com>, Arnd Bergmann <arnd@arndb.de>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, Sean Paul <seanpaul@chromium.org>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 Manasi Navare <manasi.d.navare@intel.com>,
 linux-security-module@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMiBNYXIgMjAyMSwgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90
ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4gZ2NjLTExIHdhcm5z
IHRoYXQgaW50ZWxfZHBfY2hlY2tfbXN0X3N0YXR1cygpIGhhcyBhIGxvY2FsIGFycmF5IG9mCj4g
Zm91cnRlZW4gYnl0ZXMgYW5kIHBhc3NlcyB0aGUgbGFzdCBmb3VyIGJ5dGVzIGludG8gYSBmdW5j
dGlvbiB0aGF0Cj4gZXhwZWN0cyBhIHNpeC1ieXRlIGFycmF5Ogo+Cj4gZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jOiBJbiBmdW5jdGlvbiDigJhpbnRlbF9kcF9jaGVja19t
c3Rfc3RhdHVz4oCZOgo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYzo0
NTU2OjIyOiBlcnJvcjog4oCYZHJtX2RwX2NoYW5uZWxfZXFfb2vigJkgcmVhZGluZyA2IGJ5dGVz
IGZyb20gYSByZWdpb24gb2Ygc2l6ZSA0IFstV2Vycm9yPXN0cmluZ29wLW92ZXJyZWFkXQo+ICA0
NTU2IHwgICAgICAgICAgICAgICAgICAgICAhZHJtX2RwX2NoYW5uZWxfZXFfb2soJmVzaVsxMF0s
IGludGVsX2RwLT5sYW5lX2NvdW50KSkgewo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYzo0NTU2OjIyOiBub3RlOiByZWZl
cmVuY2luZyBhcmd1bWVudCAxIG9mIHR5cGUg4oCYY29uc3QgdTggKuKAmSB7YWthIOKAmGNvbnN0
IHVuc2lnbmVkIGNoYXIgKuKAmX0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jOjM4Ogo+IGluY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaDoxNDU5OjY6IG5vdGU6IGluIGEgY2FsbCB0byBmdW5jdGlvbiDigJhkcm1fZHBfY2hhbm5l
bF9lcV9va+KAmQo+ICAxNDU5IHwgYm9vbCBkcm1fZHBfY2hhbm5lbF9lcV9vayhjb25zdCB1OCBs
aW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSwKPiAgICAgICB8ICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn4KPgo+IENsZWFybHkgc29tZXRoaW5nIGlzIHdyb25nIGhlcmUsIGJ1dCBJIGNh
bid0IHF1aXRlIGZpZ3VyZSBvdXQgd2hhdC4KPiBDaGFuZ2luZyB0aGUgYXJyYXkgc2l6ZSB0byAx
NiBieXRlcyBhdm9pZHMgdGhlIHdhcm5pbmcsIGJ1dCBpcwo+IHByb2JhYmx5IHRoZSB3cm9uZyBz
b2x1dGlvbiBoZXJlLgoKVWdoLiBkcm1fZHBfY2hhbm5lbF9lcV9vaygpIGRvZXMgbm90IGFjdHVh
bGx5IHJlcXVpcmUgbW9yZSB0aGFuCkRQX0xJTktfU1RBVFVTX1NJWkUgLSAyIGVsZW1lbnRzIGlu
IHRoZSBsaW5rX3N0YXR1cy4gSXQncyBzb21lIG90aGVyCnJlbGF0ZWQgZnVuY3Rpb25zIHRoYXQg
ZG8sIGFuZCBpbiBtb3N0IGNhc2VzIGl0J3MgY29udmVuaWVudCB0byByZWFkIGFsbAp0aG9zZSBE
UF9MSU5LX1NUQVRVU19TSVpFIGJ5dGVzLgoKSG93ZXZlciwgaGVyZSB0aGUgY2FzZSBpcyBzbGln
aHRseSBkaWZmZXJlbnQgZm9yIERQIE1TVCwgYW5kIHRoZSBjaGFuZ2UKY2F1c2VzIHJlc2VydmVk
IERQQ0QgYWRkcmVzc2VzIHRvIGJlIHJlYWQuIE5vdCBzdXJlIGl0IG1hdHRlcnMsIGJ1dApyZWFs
bHkgSSB0aGluayB0aGUgcHJvYmxlbSBpcyB3aGF0IGRybV9kcF9jaGFubmVsX2VxX29rKCkgYWR2
ZXJ0aXplcy4KCkkgYWxzbyBkb24ndCBsaWtlIHRoZSBhcnJheSBub3RhdGlvbiB3aXRoIHNpemVz
IGluIGZ1bmN0aW9uIHBhcmFtZXRlcnMKaW4gZ2VuZXJhbCwgYmVjYXVzZSBJIHRoaW5rIGl0J3Mg
bWlzbGVhZGluZy4gV291bGQgZ2NjLTExIHdhcm4gaWYgYQpmdW5jdGlvbiBhY3R1YWxseSBhY2Nl
c3NlcyB0aGUgbWVtb3J5IG91dCBvZiBib3VuZHMgb2YgdGhlIHNpemU/CgpBbnl3YXkuIEkgZG9u
J3QgdGhpbmsgd2UncmUgZ29pbmcgdG8gZ2V0IHJpZCBvZiB0aGUgYXJyYXkgbm90YXRpb24KYW55
dGltZSBzb29uLCBpZiBldmVyLCBubyBtYXR0ZXIgaG93IG11Y2ggSSBkaXNsaWtlIGl0LCBzbyBJ
IHRoaW5rIHRoZQpyaWdodCBmaXggd291bGQgYmUgdG8gYXQgbGVhc3Qgc3RhdGUgdGhlIGNvcnJl
Y3QgcmVxdWlyZWQgc2l6ZSBpbgpkcm1fZHBfY2hhbm5lbF9lcV9vaygpLgoKCkJSLApKYW5pLgoK
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+IGluZGV4IDhjMTJkNTM3NTYwNy4uODMwZTI1MTVm
MTE5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+IEBAIC02
NSw3ICs2NSw3IEBACj4gICNpbmNsdWRlICJpbnRlbF92ZHNjLmgiCj4gICNpbmNsdWRlICJpbnRl
bF92cnIuaCIKPiAgCj4gLSNkZWZpbmUgRFBfRFBSWF9FU0lfTEVOIDE0Cj4gKyNkZWZpbmUgRFBf
RFBSWF9FU0lfTEVOIDE2Cj4gIAo+ICAvKiBEUCBEU0MgdGhyb3VnaHB1dCB2YWx1ZXMgdXNlZCBm
b3Igc2xpY2UgY291bnQgY2FsY3VsYXRpb25zIEtQaXhlbHMvcyAqLwo+ICAjZGVmaW5lIERQX0RT
Q19QRUFLX1BJWEVMX1JBVEUJCQkyNzIwMDAwCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4g
U291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
