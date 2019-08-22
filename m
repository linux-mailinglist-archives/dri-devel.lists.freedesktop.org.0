Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE8398C80
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 09:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718FD6EA67;
	Thu, 22 Aug 2019 07:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6EA6EA67
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 07:42:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 00:42:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,415,1559545200"; d="scan'208";a="196177461"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2019 00:42:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: fix module name in edid_firmware log message
In-Reply-To: <20190821154955.GM11147@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190821094312.5514-1-jani.nikula@intel.com>
 <20190821154955.GM11147@phenom.ffwll.local>
Date: Thu, 22 Aug 2019 10:42:33 +0300
Message-ID: <87zhk1d4t2.fsf@intel.com>
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
Cc: =?utf-8?Q?G=C3=B6ran?= Uddeborg <goeran@uddeborg.se>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMSBBdWcgMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90
ZToKPiBPbiBXZWQsIEF1ZyAyMSwgMjAxOSBhdCAxMjo0MzoxMlBNICswMzAwLCBKYW5pIE5pa3Vs
YSB3cm90ZToKPj4gVGhlIG1vZHVsZSBpcyBkcm1fa21zX2hlbHBlciwgbm90IGRybV9rbXNfZmly
bXdhcmUuCj4+IAo+PiBCdWd6aWxsYTogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3df
YnVnLmNnaT9pZD0yMDQ1NDkKPj4gUmVwb3J0ZWQtYnk6IEfDtnJhbiBVZGRlYm9yZyA8Z29lcmFu
QHVkZGVib3JnLnNlPgo+PiBGaXhlczogYWM2YzM1YTRkOGM3ICgiZHJtOiBhZGQgYmFja3dhcmRz
IGNvbXBhdGliaWxpdHkgc3VwcG9ydCBmb3IgZHJtX2ttc19oZWxwZXIuZWRpZF9maXJtd2FyZSIp
Cj4+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4K
PiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KClRo
YW5rcywgcHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgpCUiwKSmFuaS4KCj4KPj4gLS0tCj4+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2ttc19oZWxwZXJfY29tbW9uLmMgfCAyICstCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ttc19oZWxwZXJfY29tbW9uLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ttc19oZWxwZXJfY29tbW9uLmMKPj4gaW5kZXggZDlhNWFjODE5NDllLi4yMjFhODUy
OGM5OTMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fa21zX2hlbHBlcl9jb21t
b24uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ttc19oZWxwZXJfY29tbW9uLmMKPj4g
QEAgLTQwLDcgKzQwLDcgQEAgTU9EVUxFX0xJQ0VOU0UoIkdQTCBhbmQgYWRkaXRpb25hbCByaWdo
dHMiKTsKPj4gIC8qIEJhY2t3YXJkIGNvbXBhdGliaWxpdHkgZm9yIGRybV9rbXNfaGVscGVyLmVk
aWRfZmlybXdhcmUgKi8KPj4gIHN0YXRpYyBpbnQgZWRpZF9maXJtd2FyZV9zZXQoY29uc3QgY2hh
ciAqdmFsLCBjb25zdCBzdHJ1Y3Qga2VybmVsX3BhcmFtICprcCkKPj4gIHsKPj4gLQlEUk1fTk9U
RSgiZHJtX2ttc19maXJtd2FyZS5lZGlkX2Zpcm13YXJlIGlzIGRlcHJlY2F0ZWQsIHBsZWFzZSB1
c2UgZHJtLmVkaWRfZmlybXdhcmUgaW5zdGVhZC5cbiIpOwo+PiArCURSTV9OT1RFKCJkcm1fa21z
X2hlbHBlci5lZGlkX2Zpcm13YXJlIGlzIGRlcHJlY2F0ZWQsIHBsZWFzZSB1c2UgZHJtLmVkaWRf
ZmlybXdhcmUgaW5zdGVhZC5cbiIpOwo+PiAgCj4+ICAJcmV0dXJuIF9fZHJtX3NldF9lZGlkX2Zp
cm13YXJlX3BhdGgodmFsKTsKPj4gIH0KPj4gLS0gCj4+IDIuMjAuMQo+PiAKPj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKSmFuaSBO
aWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
