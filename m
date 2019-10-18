Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0751DCC43
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 19:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B8B6EB73;
	Fri, 18 Oct 2019 17:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D466EB73
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 17:07:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 10:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; d="scan'208";a="208947220"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 18 Oct 2019 10:07:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Oct 2019 20:07:04 +0300
Date: Fri, 18 Oct 2019 20:07:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Adam Jackson <ajax@redhat.com>
Subject: Re: [PATCH] drm/fourcc: Fix undefined left shift in
 DRM_FORMAT_BIG_ENDIAN macros
Message-ID: <20191018170704.GE1208@intel.com>
References: <20191018163926.598570-1-ajax@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018163926.598570-1-ajax@redhat.com>
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
Cc: Eric Engestrom <eric.engestrom@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMTI6Mzk6MjZQTSAtMDQwMCwgQWRhbSBKYWNrc29uIHdy
b3RlOgo+IDE8PDMxIGlzIHVuZGVmaW5lZCBiZWNhdXNlIGl0J3MgYSBzaWduZWQgaW50IGFuZCBD
IGlzIHRlcnJpYmxlLgo+IAo+IFJldmlld2VkLWJ5OiBFcmljIEVuZ2VzdHJvbSA8ZXJpYy5lbmdl
c3Ryb21AaW50ZWwuY29tPgoKTWlzc2luZyB0ZWggc29iLgoKPiAtLS0KPiAgaW5jbHVkZS91YXBp
L2RybS9kcm1fZm91cmNjLmggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9m
b3VyY2MuaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gaW5kZXggM2ZlZWFhM2Y5
ODdhLi5jMDZkMzQ1NTlmYWIgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91
cmNjLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+IEBAIC02OSw3ICs2
OSw3IEBAIGV4dGVybiAiQyIgewo+ICAjZGVmaW5lIGZvdXJjY19jb2RlKGEsIGIsIGMsIGQpICgo
X191MzIpKGEpIHwgKChfX3UzMikoYikgPDwgOCkgfCBcCj4gIAkJCQkgKChfX3UzMikoYykgPDwg
MTYpIHwgKChfX3UzMikoZCkgPDwgMjQpKQo+ICAKPiAtI2RlZmluZSBEUk1fRk9STUFUX0JJR19F
TkRJQU4gKDE8PDMxKSAvKiBmb3JtYXQgaXMgYmlnIGVuZGlhbiBpbnN0ZWFkIG9mIGxpdHRsZSBl
bmRpYW4gKi8KPiArI2RlZmluZSBEUk1fRk9STUFUX0JJR19FTkRJQU4gKDFVPDwzMSkgLyogZm9y
bWF0IGlzIGJpZyBlbmRpYW4gaW5zdGVhZCBvZiBsaXR0bGUgZW5kaWFuICovCj4gIAo+ICAvKiBS
ZXNlcnZlIDAgZm9yIHRoZSBpbnZhbGlkIGZvcm1hdCBzcGVjaWZpZXIgKi8KPiAgI2RlZmluZSBE
Uk1fRk9STUFUX0lOVkFMSUQJMAo+IC0tIAo+IDIuMjMuMAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gClZpbGxlIFN5cmrDpGzDpApJ
bnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
