Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648BE1B0694
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 12:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0161B6E49A;
	Mon, 20 Apr 2020 10:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FF36E29A;
 Mon, 20 Apr 2020 10:28:53 +0000 (UTC)
IronPort-SDR: gHQV3vVPmjLqfLCHFcceX84xjnZlBqFGvmsHf+2bgbp8kLbg95yPEbaTAKFDvGiahAoaWvMCyu
 GvH4weyBdOMw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 03:28:53 -0700
IronPort-SDR: nBw9rc0cJTSj1Prd6W+PnY6lodt0rR2nfxouUPx6OV+8KPmiFVeHwvzUZutezUrxz5yGCZ9ICH
 +B7+OdhoT1zQ==
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="429073035"
Received: from iastakh-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.229])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 03:28:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dpcd_bl: Unbreak enable_dpcd_backlight modparam
In-Reply-To: <20200413214407.1851002-1-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200413214407.1851002-1-lyude@redhat.com>
Date: Mon, 20 Apr 2020 13:28:46 +0300
Message-ID: <87sggy1me9.fsf@intel.com>
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAxMyBBcHIgMjAyMCwgTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gTG9va3MgbGlrZSBJIGFjY2lkZW50YWxseSBtYWRlIGl0IHNvIHlvdSBjb3VsZG4ndCBmb3Jj
ZSBEUENEIGJhY2tsaWdodAo+IHN1cHBvcnQgb24sIHdob29wcy4gRml4IHRoYXQuCgpUaGFua3Ms
IHB1c2hlZC4KCkJSLApKYW5pLgoKCgo+Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1
ZGVAcmVkaGF0LmNvbT4KPiBGaXhlczogMTdmNWQ1NzkxNWJlICgiZHJtL2k5MTU6IEZvcmNlIERQ
Q0QgYmFja2xpZ2h0IG1vZGUgb24gWDEgRXh0cmVtZSAybmQgR2VuIDRLIEFNT0xFRCBwYW5lbCIp
Cj4gQ2M6IEFkYW0gSmFja3NvbiA8YWpheEByZWRoYXQuY29tPgo+IENjOiBKYW5pIE5pa3VsYSA8
amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgo+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25h
cy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6ICJWaWxsZSBTeXJqw6Rsw6QiIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcF9hdXhfYmFja2xpZ2h0LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kcF9hdXhfYmFja2xpZ2h0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwX2F1eF9iYWNrbGlnaHQuYwo+IGluZGV4IDRiOTE2NDY4NTQwZi4uMDcyMjU0
MGQ2NGFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHBfYXV4X2JhY2tsaWdodC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcF9hdXhfYmFja2xpZ2h0LmMKPiBAQCAtMzU4LDYgKzM1OCw3IEBAIGludCBpbnRlbF9k
cF9hdXhfaW5pdF9iYWNrbGlnaHRfZnVuY3Moc3RydWN0IGludGVsX2Nvbm5lY3RvciAqaW50ZWxf
Y29ubmVjdG9yKQo+ICAJICovCj4gIAlpZiAoaTkxNS0+dmJ0LmJhY2tsaWdodC50eXBlICE9Cj4g
IAkgICAgSU5URUxfQkFDS0xJR0hUX1ZFU0FfRURQX0FVWF9JTlRFUkZBQ0UgJiYKPiArCSAgICBp
OTE1X21vZHBhcmFtcy5lbmFibGVfZHBjZF9iYWNrbGlnaHQgIT0gMSAmJgo+ICAJICAgICFkcm1f
ZHBfaGFzX3F1aXJrKCZpbnRlbF9kcC0+ZGVzYywgaW50ZWxfZHAtPmVkaWRfcXVpcmtzLAo+ICAJ
CQkgICAgICBEUF9RVUlSS19GT1JDRV9EUENEX0JBQ0tMSUdIVCkpIHsKPiAgCQlkcm1faW5mbygm
aTkxNS0+ZHJtLAoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
