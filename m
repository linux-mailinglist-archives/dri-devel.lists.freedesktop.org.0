Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1128016BF4B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 12:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375AE6EA8C;
	Tue, 25 Feb 2020 11:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0966EA8C;
 Tue, 25 Feb 2020 11:08:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 03:08:02 -0800
X-IronPort-AV: E=Sophos;i="5.70,483,1574150400"; d="scan'208";a="230984756"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 03:07:58 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Laxminarayan Bharadiya\, Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>,
 "daniel\@ffwll.ch" <daniel@ffwll.ch>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala\@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "airlied\@linux.ie" <airlied@linux.ie>,
 "maarten.lankhorst\@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tzimmermann\@suse.de" <tzimmermann@suse.de>,
 "mripard\@kernel.org" <mripard@kernel.org>,
 "mihail.atanassov\@arm.com" <mihail.atanassov@arm.com>
Subject: RE: [RFC][PATCH 1/5] drm: Introduce scaling filter property
In-Reply-To: <E92BA18FDE0A5B43B7B3DA7FCA03128605773303@BGSMSX107.gar.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200225070545.4482-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200225070545.4482-2-pankaj.laxminarayan.bharadiya@intel.com>
 <87pne3rnwu.fsf@intel.com>
 <E92BA18FDE0A5B43B7B3DA7FCA03128605773303@BGSMSX107.gar.corp.intel.com>
Date: Tue, 25 Feb 2020 13:07:55 +0200
Message-ID: <87mu96sz5g.fsf@intel.com>
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
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNSBGZWIgMjAyMCwgIkxheG1pbmFyYXlhbiBCaGFyYWRpeWEsIFBhbmthaiIJPHBh
bmthai5sYXhtaW5hcmF5YW4uYmhhcmFkaXlhQGludGVsLmNvbT4gd3JvdGU6Cj4+IE9uIFR1ZSwg
MjUgRmViIDIwMjAsIFBhbmthaiBCaGFyYWRpeWEKPj4gPHBhbmthai5sYXhtaW5hcmF5YW4uYmhh
cmFkaXlhQGludGVsLmNvbT4gd3JvdGU6Cj4+ID4gU2lnbmVkLW9mZi1ieTogUGFua2FqIEJoYXJh
ZGl5YQo+PiA+IDxwYW5rYWoubGF4bWluYXJheWFuLmJoYXJhZGl5YUBpbnRlbC5jb20+Cj4+ID4g
U2lnbmVkLW9mZi1ieTogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29t
Pgo+PiA+IFNpZ25lZC1vZmYtYnk6IEFua2l0IE5hdXRpeWFsIDxhbmtpdC5rLm5hdXRpeWFsQGlu
dGVsLmNvbT4KPj4gCj4+IFdoYXQgZGlkIFNoYXNoYW5rIGFuZCBBbmtpdCBkbywgc2hvdWxkIG9u
ZSBvciB0aGUgb3RoZXIgcGVyaGFwcyByZXRhaW4KPj4gYXV0aG9yc2hpcD8KPgo+IEkga2luZCBv
ZiByZWZhY3RvcmVkIHRoZSBjb2RlLCBhZGRlZCBwbGFuZSBzY2FsaW5nIHN1cHBvcnQgYWRkZWQg
bmV3Cj4gQVBJcyAmIGRvY3VtZW50YXRpb24gYW5kIHJld3JvdGUgdGhlIHNjYWxpbmcgZmlsdGVy
IHNldHRpbmcKPiBsb2dpYy4gU2luY2UgSSBtYWRlIHNpZ25pZmljYW50IGNoYW5nZXMgKElNSE8p
LCBJIHRob3VnaHQgb2YgY2hhbmdpbmcKPiB0aGUgYXV0aG9yc2hpcC4gSSBzcG9rZSB3aXRoIEFu
a2l0IHJlZ2FyZGluZyB0aGlzIGR1cmluZyBteSBpbml0aWFsCj4gZGlzY3Vzc2lvbiB3aXRoIGhp
bS4KPgo+IFdpbGwgeW91IHBsZWFzZSByZXZpZXcgdGhlIHByZXNlbnQgUkZDIGFuZCB0aGUgb2xk
ZXIgb25lIGFuZCBzdWdnZXN0LiAgSSBoYXZlCj4gbm8gaXNzdWVzIHdpdGggY2hhbmdpbmcgdGhl
IGF1dGhvcnNoaXAg8J+Yii4KCkl0J3MgZmluZSB3aXRoIG1lIGlmIGl0J3MgZmluZSB3aXRoIEFu
a2l0LiBUaGFua3MgZm9yIGNoZWNraW5nLgoKQlIsCkphbmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJ
bnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
