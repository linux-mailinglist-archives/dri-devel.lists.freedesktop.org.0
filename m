Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99B8A9A75
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 08:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47374891FF;
	Thu,  5 Sep 2019 06:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A36891FF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 06:18:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9A7BD30860C5;
 Thu,  5 Sep 2019 06:18:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6962B5D717;
 Thu,  5 Sep 2019 06:18:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F2FAF937E; Thu,  5 Sep 2019 08:18:18 +0200 (CEST)
Date: Thu, 5 Sep 2019 08:18:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/3] drm/vram: Add kmap ref-counting to GEM VRAM objects
Message-ID: <20190905061818.qhvh6d7dozs5lxce@sirius.home.kraxel.org>
References: <20190904115644.7620-1-tzimmermann@suse.de>
 <20190904115644.7620-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904115644.7620-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 05 Sep 2019 06:18:26 +0000 (UTC)
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
Cc: feng.tang@intel.com, dave@stgolabs.net, rong.a.chen@intel.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, maxime.ripard@bootlin.com,
 ying.huang@intel.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDE6NTY6NDJQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGttYXAgYW5kIGt1bm1hcCBvcGVyYXRpb25zIG9mIEdFTSBWUkFNIGJ1
ZmZlcnMgY2FuIG5vdyBiZSBjYWxsZWQKPiBpbiBpbnRlcmxlYXZpbmcgcGFpcnMuIFRoZSBmaXJz
dCBjYWxsIHRvIGRybV9nZW1fdnJhbV9rbWFwKCkgbWFwcyB0aGUKPiBidWZmZXIncyBtZW1vcnkg
dG8ga2VybmVsIGFkZHJlc3Mgc3BhY2UgYW5kIHRoZSBmaW5hbCBjYWxsIHRvCj4gZHJtX2dlbV92
cmFtX2t1bm1hcCgpIHVubWFwcyB0aGUgbWVtb3J5LiBJbnRlcm1lZGlhdGUgY2FsbHMgdG8gdGhl
c2UKPiBmdW5jdGlvbnMgaW5jcmVtZW50IG9yIGRlY3JlbWVudCBhIHJlZmVyZW5jZSBjb3VudGVy
Lgo+IAo+IFRoaXMgY2hhbmdlIGFsbG93cyBmb3Iga2VlcGluZyBidWZmZXIgbWVtb3J5IG1hcHBl
ZCBmb3IgbG9uZ2VyIGFuZAo+IG1pbmltaXplcyB0aGUgYW1vdW50IG9mIGNoYW5nZXMgdG8gVExC
LCBwYWdlIHRhYmxlcywgZXRjLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBEYXZpZGxvaHIgQnVlc28gPGRhdmVAc3Rnb2xh
YnMubmV0PgoKUmV2aWV3ZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
