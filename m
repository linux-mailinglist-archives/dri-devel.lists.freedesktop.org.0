Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D7E83B9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 10:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEBB6E152;
	Tue, 29 Oct 2019 09:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A576E14F;
 Tue, 29 Oct 2019 09:02:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 02:02:36 -0700
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="374487401"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.7.37])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 02:02:34 -0700
MIME-Version: 1.0
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <96582479e7829d92b89adb805f829e23043ca85c.1572258936.git.jani.nikula@intel.com>
References: <cover.1572258935.git.jani.nikula@intel.com>
 <96582479e7829d92b89adb805f829e23043ca85c.1572258936.git.jani.nikula@intel.com>
Message-ID: <157233975222.4967.10493169909668288037@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [Intel-gfx] [PATCH RESEND 6/8] drm/print: convert debug category
 macros into an enum
Date: Tue, 29 Oct 2019 11:02:32 +0200
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBKYW5pIE5pa3VsYSAoMjAxOS0xMC0yOCAxMjozODoyMCkKPiBNb3N0bHkgZm9yIGlt
cHJvdmVkIGRvY3VtZW50YXRpb24sIGNvbnZlcnQgdGhlIGRlYnVnIGNhdGVnb3J5IG1hY3Jvcwo+
IGludG8gYW4gZW51bS4gRHJvcCB1bnVzZWQgRFJNX1VUX05PTkUuIERvY3VtZW50IHByZXZpb3Vz
bHkgdW5kb2N1bWVudGVkCj4gY2F0ZWdvcmllcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5p
a3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgoKPFNOSVA+Cgo+ICtlbnVtIGRybV9kZWJ1Z19j
YXRlZ29yeSB7Cj4gKyAgICAgICAvKioKPiArICAgICAgICAqIEBEUk1fVVRfQ09SRTogVXNlZCBp
biB0aGUgZ2VuZXJpYyBkcm0gY29kZTogZHJtX2lvY3RsLmMsIGRybV9tbS5jLAo+ICsgICAgICAg
ICogZHJtX21lbW9yeS5jLCAuLi4KPiArICAgICAgICAqLwo+ICsgICAgICAgRFJNX1VUX0NPUkUg
ICAgICAgICAgICAgPSAweDAxLAoKV2hpbGUgaGVyZSwgd2h5IG5vdCBCSVQoKQoKUmV2aWV3ZWQt
Ynk6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KClJl
Z2FyZHMsIEpvb25hcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
