Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB9A996A3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 16:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33686EB64;
	Thu, 22 Aug 2019 14:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63DE6EB68;
 Thu, 22 Aug 2019 14:31:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 05:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="178835488"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 22 Aug 2019 05:20:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 22 Aug 2019 15:20:38 +0300
Date: Thu, 22 Aug 2019 15:20:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/crc: Actually allow to change the crc source
Message-ID: <20190822122038.GK5942@intel.com>
References: <20190821203835.18314-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821203835.18314-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMTA6Mzg6MzVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPb3BzLgo+IAo+IEZpeGVzOiA5ZWRiZjFmYTYwMGEgKCJkcm06IEFkZCBBUEkgZm9y
IGNhcHR1cmluZyBmcmFtZSBDUkNzIikKPiBDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29A
Y29sbGFib3JhLmNvbT4KPiBDYzogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3Jh
LmNvbT4KPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZGVidWdmc19jcmMuYwo+IGluZGV4IGJlMWI3YmE5MmZmZS4uNmZlNjkzZWUxNWY5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwo+IEBAIC0zNjksNyArMzY5LDcgQEAgdm9p
ZCBkcm1fZGVidWdmc19jcnRjX2NyY19hZGQoc3RydWN0IGRybV9jcnRjICpjcnRjKQo+ICAKPiAg
CWNyY19lbnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImNyYyIsIGNydGMtPmRlYnVnZnNfZW50cnkp
Owo+ICAKPiAtCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImNvbnRyb2wiLCBTX0lSVUdPLCBjcmNfZW50
LCBjcnRjLAo+ICsJZGVidWdmc19jcmVhdGVfZmlsZSgiY29udHJvbCIsIFNfSVJVR08gfCBTX0lX
VVNSLCBjcmNfZW50LCBjcnRjLAo+ICAJCQkgICAgJmRybV9jcnRjX2NyY19jb250cm9sX2ZvcHMp
OwoKUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+CgpCdXQgY291bGQgd2UgcGxlYXNlIGdvIG9jdGFsPyBNeSBicmFpbiBjYW4ndCBkZWNv
ZGUgdGhhdCBhbHBoYWJldCBzb3VwLgoKPiAgCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImRhdGEiLCBT
X0lSVUdPLCBjcmNfZW50LCBjcnRjLAo+ICAJCQkgICAgJmRybV9jcnRjX2NyY19kYXRhX2ZvcHMp
Owo+IC0tIAo+IDIuMjMuMC5yYzEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
