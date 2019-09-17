Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCCAB4B56
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDD06EB9B;
	Tue, 17 Sep 2019 09:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEF56EB9B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 09:55:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DEB0D10CC1F6;
 Tue, 17 Sep 2019 09:55:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F9776012E;
 Tue, 17 Sep 2019 09:55:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6443716E05; Tue, 17 Sep 2019 11:55:19 +0200 (CEST)
Date: Tue, 17 Sep 2019 11:55:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] drm/vram: Provide GEM VRAM vmap()/vunmap/()
Message-ID: <20190917095519.2qadahlnnm2pq54x@sirius.home.kraxel.org>
References: <20190911120352.20084-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911120352.20084-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 17 Sep 2019 09:55:20 +0000 (UTC)
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDI6MDM6NDlQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGFzdCBhbmQgbWdhZzIwMCBkcml2ZXJzIHBpbigpIGFuZCBrbWFwKCkg
Y3Vyc29yIGJ1ZmZlcnM7IGVzc2VudGlhbGx5Cj4gcmVpbXBsZW1lbnRpbmcgdm1hcCgpLiBXZSBj
YW4gc2hhcmUgc29tZSBjb2RlIGJ5IHVzaW5nIHRoZSByZXNwZWN0aXZlCj4gZnVuY3Rpb25hbGl0
eSBmcm9tIEdFTSBWUkFNIGJ1ZmZlciBvYmplY3RzLgo+IAo+IFRob21hcyBaaW1tZXJtYW5uICgz
KToKPiAgIGRybS92cmFtOiBQcm92aWRlIHZtYXAgYW5kIHZ1bm1hcCBvcGVyYXRpb25zIGZvciBH
RU0gVlJBTSBvYmplY3RzCj4gICBkcm0vYXN0OiBVc2UgZHJtX2dlbV92cmFtX3t2bWFwLHZ1bm1h
cH0oKSB0byBtYXAgY3Vyc29yIHNvdXJjZSBCTwo+ICAgZHJtL21nYWcyMDA6IFVzZSBkcm1fZ2Vt
X3ZyYW1fe3ZtYXAsdnVubWFwfSgpIHRvIG1hcCBjdXJzb3Igc291cmNlIEJPCj4gCj4gIGRyaXZl
cnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyAgICAgICAgICAgfCAgMjEgKystLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyAgICB8IDEwNiArKysrKysrKysrKysrKysr
LS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jIHwgIDIy
ICsrLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaCAgICAgICAgfCAgIDUg
Ky0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkK
ClNlcmllcyBpcwpBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cgpj
aGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
