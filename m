Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12812113E58
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 10:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215BE6F632;
	Thu,  5 Dec 2019 09:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477036F632;
 Thu,  5 Dec 2019 09:40:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 01:40:55 -0800
X-IronPort-AV: E=Sophos;i="5.69,280,1571727600"; d="scan'208";a="205715715"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 01:40:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 10/12] media: constify fb ops across all drivers
In-Reply-To: <20191204113315.GG5282@valkosipuli.retiisi.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575390740.git.jani.nikula@intel.com>
 <71794337f8611271f2c1fdb3882119a58e743a87.1575390741.git.jani.nikula@intel.com>
 <20191204113315.GG5282@valkosipuli.retiisi.org.uk>
Date: Thu, 05 Dec 2019 11:40:49 +0200
Message-ID: <87wobbglem.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Andy Walls <awalls@md.metrocast.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAwNCBEZWMgMjAxOSwgU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAaWtpLmZpPiB3
cm90ZToKPiBPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAwNjozODo1MlBNICswMjAwLCBKYW5pIE5p
a3VsYSB3cm90ZToKPj4gTm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5m
byBpcyBjb25zdCwgd2UgY2FuIHN0YXJ0Cj4+IG1ha2luZyB0aGUgb3BzIGNvbnN0IGFzIHdlbGwu
Cj4+IAo+PiBSZW1vdmUgdGhlIHJlZHVuZGFudCBmYm9wcyBhc3NpZ25tZW50cyB3aGlsZSBhdCBp
dC4KPj4gCj4+IHYyOgo+PiAtIGFjdHVhbGx5IGFkZCBjb25zdCBpbiB2aXZpZAo+PiAtIGZpeCB0
eXBvIChDaHJpc3RvcGhlIGRlIERpbmVjaGluKQo+PiAKPj4gQ2M6IEhhbnMgVmVya3VpbCA8aHZl
cmt1aWxAeHM0YWxsLm5sPgo+PiBDYzogQW5keSBXYWxscyA8YXdhbGxzQG1kLm1ldHJvY2FzdC5u
ZXQ+Cj4+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPj4gQ2M6IGl2dHYtZGV2ZWxA
aXZ0dmRyaXZlci5vcmcKPj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+Cj4KPiBSZXZpZXdlZC1ieTogU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGlu
dXguaW50ZWwuY29tPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IQoKQW5keSwgSGFucywgbWF5IEkg
aGF2ZSB5b3VyIGFjayB0byBtZXJnZSB0aGlzIHRocm91Z2ggZHJtLW1pc2MgcGxlYXNlPwoKQlIs
CkphbmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
