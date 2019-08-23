Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1959A9E7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 10:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A706EC08;
	Fri, 23 Aug 2019 08:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF4A6EC08
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:14:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C2AD71801584;
 Fri, 23 Aug 2019 08:14:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F06A6092D;
 Fri, 23 Aug 2019 08:14:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 44A7259EC; Fri, 23 Aug 2019 10:14:27 +0200 (CEST)
Date: Fri, 23 Aug 2019 10:14:27 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/i915: switch to
 drm_fb_helper_remove_conflicting_pci_framebuffers
Message-ID: <20190823081427.hukub5ozdyqodfia@sirius.home.kraxel.org>
References: <20190822090645.25410-1-kraxel@redhat.com>
 <20190822090645.25410-4-kraxel@redhat.com>
 <20190822131314.GX11147@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822131314.GX11147@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 23 Aug 2019 08:14:28 +0000 (UTC)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMDM6MTM6MTRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAyMiwgMjAxOSBhdCAxMTowNjo0NUFNICswMjAwLCBHZXJkIEhv
ZmZtYW5uIHdyb3RlOgo+ID4gTm8gbmVlZCBmb3IgYSBob21lLWdyb3duIHZlcnNpb24sIHRoZSBn
ZW5lcmljIGhlbHBlciBzaG91bGQgd29yayBqdXN0Cj4gPiBmaW5lLiAgSXQgYWxzbyBoYW5kbGVz
IHZnYWNvbiByZW1vdmFsIHRoZXNlIGRheXMsIHNlZSBjb21taXQKPiA+IDFjNzRjYTdhMWE5YSAo
ImRybS9mYi1oZWxwZXI6IGNhbGwgdmdhX3JlbW92ZV92Z2Fjb24gYXV0b21hdGljYWxseS4iKSwK
PiA+IHNvIHRoYXQgY2FuIGJlIHJlbW92ZWQgdG9vLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBH
ZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAKPiBJIHRoaW5rIEknZCBzdGlsbCB3
YWl0IHVudGlsIDUuNC1yYzEgd2l0aCBtZXJnaW5nIHRoaXMgb25lLCBqdXN0IHRvIGdpdmUKPiBh
bm90aGVyIGZ1bGwgcmVsZWFzZSBhbmQgcGVvcGxlIHRvIHRlc3QgaXQgYmVmb3JlIHdlIHB1bGwg
dGhlIHRyaWdnZXIuCj4gT3ZlcmFidW5kYW5jZSBvZiBjYXV0aW9uIGFuZCBhbGwgdGhhdC4KCldo
b2xlIHNlcmllcyBvciBqdXN0IHRoZSBpOTE1IHBhdGNoPwoKY2hlZXJzLAogIEdlcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
