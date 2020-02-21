Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9733A167C2E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D0A6E283;
	Fri, 21 Feb 2020 11:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5BB6E284;
 Fri, 21 Feb 2020 11:32:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 03:32:26 -0800
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="229824756"
Received: from jmiler-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.38.187])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 03:32:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Emil
 Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Intel-gfx] [PATCH 00/12] drm: Put drm_display_mode on diet
In-Reply-To: <20200220153426.GC13686@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <CACvgo50pCb4OafEs9tLm7YEPqHc+BtDAvagRnwjXtZeQDNwUwg@mail.gmail.com>
 <20200220142759.GA13686@intel.com> <20200220153426.GC13686@intel.com>
Date: Fri, 21 Feb 2020 13:32:29 +0200
Message-ID: <871rqoyy42.fsf@intel.com>
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMCBGZWIgMjAyMCwgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4gTG9va3MgbGlrZSBnZXR0aW5nIHJpZCBvZiBwcml2YXRlX2Zs
YWdzIGlzIGdvaW5nIHRvIGJlIHByZXR0eQo+IHN0cmFpZ2h0Zm9yd2FyZC4gSSdsbCBwb3N0IHBh
dGNoZXMgZm9yIHRoYXQgb25jZSB0aGlzIGZpcnN0IHNlcmllcwo+IGxhbmRzLgoKR29pbmcgYWxs
IGluIG9uIGNydGMgc3RhdGU/IEkgc3VwcG9zZSBtaWdyYXRpbmcgYXdheSBmcm9tIHByaXZhdGVf
ZmxhZ3MKY291bGQgZWFzaWx5IHN0YXJ0IGluIGk5MTUgYmVmb3JlIHRoYXQuIFNlZW1zIHJhdGhl
ciBpbmRlcGVuZGVudC4KCkkgZ3Vlc3MgaXQncyBfX2ludGVsX2dldF9jcnRjX3NjYW5saW5lKCkg
YW5kOgoKCXZibGFuayA9ICZjcnRjLT5iYXNlLmRldi0+dmJsYW5rW2RybV9jcnRjX2luZGV4KCZj
cnRjLT5iYXNlKV07Cgltb2RlID0gJnZibGFuay0+aHdtb2RlOwoKCWlmIChtb2RlLT5wcml2YXRl
X2ZsYWdzICYgSTkxNV9NT0RFX0ZMQUdfR0VUX1NDQU5MSU5FX0ZST01fVElNRVNUQU1QKQoKdGhh
dCBnaXZlcyBtZSB0aGUgY3JlZXBzIGluIHJldmlld2luZyBhbGwgdGhhdC4KClRoZXJlJ3MgYWxz
byBbMV0gYWRkaW5nIG5ldyB1c2VzIGZvciBwcml2YXRlX2ZsYWdzOyBJIHRoaW5rIHRoZXJlIHdl
cmUKaXNzdWVzIGluIGdldHRpbmcgYXQgdGhlIHJpZ2h0IGNydGMgc3RhdGUgb24gc29tZSBvZiB0
aG9zZSBwYXRocywgYnV0IEkKZm9yZ2V0IHRoZSBleGFjdCBkZXRhaWxzLiBJZGVhcz8KCkJSLApK
YW5pLgoKClsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY5Mjkw
LwoKCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
