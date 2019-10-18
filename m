Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A40DCEC4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D606EBC3;
	Fri, 18 Oct 2019 18:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D586EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:55:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 11:55:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; d="scan'208";a="202787884"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 18 Oct 2019 11:55:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Oct 2019 21:55:02 +0300
Date: Fri, 18 Oct 2019 21:55:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Adam Jackson <ajax@redhat.com>
Subject: Re: [PATCH] drm/fourcc: Fix undefined left shift in
 DRM_FORMAT_BIG_ENDIAN macros
Message-ID: <20191018185502.GG1208@intel.com>
References: <20191018170704.GE1208@intel.com>
 <20191018175041.613780-1-ajax@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018175041.613780-1-ajax@redhat.com>
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

T24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMDE6NTA6NDFQTSAtMDQwMCwgQWRhbSBKYWNrc29uIHdy
b3RlOgo+IDE8PDMxIGlzIHVuZGVmaW5lZCBiZWNhdXNlIGl0J3MgYSBzaWduZWQgaW50IGFuZCBD
IGlzIHRlcnJpYmxlLgo+IAo+IFJldmlld2VkLWJ5OiBFcmljIEVuZ2VzdHJvbSA8ZXJpYy5lbmdl
c3Ryb21AaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFkYW0gSmFja3NvbiA8YWpheEByZWRo
YXQuY29tPgoKVGhhbmtzLiBQdXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4KCj4gLS0tCj4gIGluY2x1
ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2Ry
bS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+IGluZGV4IDNm
ZWVhYTNmOTg3YS4uYzA2ZDM0NTU5ZmFiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0v
ZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiBAQCAt
NjksNyArNjksNyBAQCBleHRlcm4gIkMiIHsKPiAgI2RlZmluZSBmb3VyY2NfY29kZShhLCBiLCBj
LCBkKSAoKF9fdTMyKShhKSB8ICgoX191MzIpKGIpIDw8IDgpIHwgXAo+ICAJCQkJICgoX191MzIp
KGMpIDw8IDE2KSB8ICgoX191MzIpKGQpIDw8IDI0KSkKPiAgCj4gLSNkZWZpbmUgRFJNX0ZPUk1B
VF9CSUdfRU5ESUFOICgxPDwzMSkgLyogZm9ybWF0IGlzIGJpZyBlbmRpYW4gaW5zdGVhZCBvZiBs
aXR0bGUgZW5kaWFuICovCj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9CSUdfRU5ESUFOICgxVTw8MzEp
IC8qIGZvcm1hdCBpcyBiaWcgZW5kaWFuIGluc3RlYWQgb2YgbGl0dGxlIGVuZGlhbiAqLwo+ICAK
PiAgLyogUmVzZXJ2ZSAwIGZvciB0aGUgaW52YWxpZCBmb3JtYXQgc3BlY2lmaWVyICovCj4gICNk
ZWZpbmUgRFJNX0ZPUk1BVF9JTlZBTElECTAKPiAtLSAKPiAyLjIzLjAKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJq
w6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
