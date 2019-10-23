Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D6E1328
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 09:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB9D6E973;
	Wed, 23 Oct 2019 07:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C48F6E973;
 Wed, 23 Oct 2019 07:32:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 00:32:27 -0700
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; d="scan'208";a="191749425"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 00:32:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/dsi: rename MIPI_DCS_SET_PARTIAL_AREA to
 MIPI_DCS_SET_PARTIAL_ROWS
In-Reply-To: <406d7ec4-f5b1-2ba4-a0ae-05fef4ab38b1@lechnology.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1571738674.git.jani.nikula@intel.com>
 <c14255c3cecea4d2c593ff4edd5e8134ab7568d3.1571738674.git.jani.nikula@intel.com>
 <406d7ec4-f5b1-2ba4-a0ae-05fef4ab38b1@lechnology.com>
Date: Wed, 23 Oct 2019 10:32:21 +0300
Message-ID: <87a79rgbne.fsf@intel.com>
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
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMiBPY3QgMjAxOSwgRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+
IHdyb3RlOgo+IE9uIDEwLzIyLzE5IDU6MDkgQU0sIEphbmkgTmlrdWxhIHdyb3RlOgo+PiBUaGUg
RENTIGNvbW1hbmQgaGFzIGJlZW4gbmFtZWQgU0VUX1BBUlRJQUxfUk9XUyBpbiB0aGUgRENTIHNw
ZWMgc2luY2UKPj4gdjEuMDIsIGZvciBtb3JlIHRoYW4gYSBkZWNhZGUuIFJlbmFtZSB0aGUgZW51
bWVyYXRpb24gdG8gbWF0Y2ggdGhlIHNwZWMuCj4+IAo+PiBDYzogRGF2aWQgTGVjaG5lciA8ZGF2
aWRAbGVjaG5vbG9neS5jb20+Cj4+IENjOiBWYW5kaXRhIEt1bGthcm5pIDx2YW5kaXRhLmt1bGth
cm5pQGludGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGludGVsLmNvbT4KPj4gLS0tCj4KPiBJIGd1ZXNzIGFsbCBvZiBteSBkb2N1bWVudHMgYXJlIG9s
ZCBhbmQgc2F5IHNldF9wYXJ0aWFsX2FyZWEsIGJ1dCBJIHdpbGwKPiB0YWtlIHlvdXIgd29yZCBm
b3IgaXQuCj4KPiBJdCBjb3VsZCBiZSBoZWxwZnVsIHRvIGxlYXZlIGEgY29tbWVudCBpbiB0aGUg
Y29kZSBhYm91dCB0aGUgcmVuYW1pbmcKPiBzbyB0aGF0IGlmIHBlb3BsZSB3aXRoIG9sZCBkb2Nz
IHNlYXJjaCBmb3IgU0VUX1BBUlRJQUxfQVJFQSwgdGhleSBjYW4KPiBzdGlsbCBmaW5kIGl0LgoK
U29tZXRoaW5nIGxpa2UgdGhpcz8KCglNSVBJX0RDU19TRVRfUEFSVElBTF9ST1dTCT0gMHgzMCwJ
CS8qIGFrYSBNSVBJX0RDU19TRVRfUEFSVElBTF9BUkVBICovCgpJdCdzIGFsc28gYSBwb3NzaWJp
bGl0eSB0byBkZWZpbmUgYm90aDoKCglNSVBJX0RDU19TRVRfUEFSVElBTF9BUkVBCT0gMHgzMCwJ
CS8qIF9ST1dTIHNpbmNlIE1JUEkgRENTIDEuMDIgKi8KCU1JUElfRENTX1NFVF9QQVJUSUFMX1JP
V1MJPSAweDMwLAoKSSBkb24ndCBtaW5kIGVpdGhlciB3YXkuCgpCUiwKSmFuaS4KCgotLSAKSmFu
aSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
