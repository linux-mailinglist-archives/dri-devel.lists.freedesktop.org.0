Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7987112A5B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423036E8BE;
	Wed,  4 Dec 2019 11:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 318 seconds by postgrey-1.36 at gabe;
 Wed, 04 Dec 2019 11:39:27 UTC
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk
 [IPv6:2a01:4f9:c010:4572::81:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3726E8BB;
 Wed,  4 Dec 2019 11:39:27 +0000 (UTC)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk
 [IPv6:2a01:4f9:c010:4572::80:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id A041F634C87;
 Wed,  4 Dec 2019 13:33:16 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
 (envelope-from <sakari.ailus@retiisi.org.uk>)
 id 1icSuC-0001W4-B2; Wed, 04 Dec 2019 13:33:16 +0200
Date: Wed, 4 Dec 2019 13:33:16 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 10/12] media: constify fb ops across all drivers
Message-ID: <20191204113315.GG5282@valkosipuli.retiisi.org.uk>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <71794337f8611271f2c1fdb3882119a58e743a87.1575390741.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71794337f8611271f2c1fdb3882119a58e743a87.1575390741.git.jani.nikula@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Andy Walls <awalls@md.metrocast.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDY6Mzg6NTJQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gTm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25z
dCwgd2UgY2FuIHN0YXJ0Cj4gbWFraW5nIHRoZSBvcHMgY29uc3QgYXMgd2VsbC4KPiAKPiBSZW1v
dmUgdGhlIHJlZHVuZGFudCBmYm9wcyBhc3NpZ25tZW50cyB3aGlsZSBhdCBpdC4KPiAKPiB2MjoK
PiAtIGFjdHVhbGx5IGFkZCBjb25zdCBpbiB2aXZpZAo+IC0gZml4IHR5cG8gKENocmlzdG9waGUg
ZGUgRGluZWNoaW4pCj4gCj4gQ2M6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5sPgo+
IENjOiBBbmR5IFdhbGxzIDxhd2FsbHNAbWQubWV0cm9jYXN0Lm5ldD4KPiBDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGl2dHYtZGV2ZWxAaXZ0dmRyaXZlci5vcmcKPiBSZXZp
ZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBTaWduZWQt
b2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6
IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4KCi0tIApTYWthcmkg
QWlsdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
