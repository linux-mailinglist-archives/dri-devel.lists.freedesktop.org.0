Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82A014A0A
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 14:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D179D89890;
	Mon,  6 May 2019 12:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E10289890
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 12:43:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D4B64307D86F;
 Mon,  6 May 2019 12:43:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71ED35F9A7;
 Mon,  6 May 2019 12:43:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A331A16E0A; Mon,  6 May 2019 14:43:44 +0200 (CEST)
Date: Mon, 6 May 2019 14:43:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 00/19] Share TTM code among DRM framebuffer drivers
Message-ID: <20190506124344.hltulw6e3kkcg4w3@sirius.home.kraxel.org>
References: <20190506082649.942-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506082649.942-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 06 May 2019 12:43:48 +0000 (UTC)
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
 zourongrong@gmail.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMTA6MjY6MzBBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gU2V2ZXJhbCBzaW1wbGUgZnJhbWVidWZmZXIgZHJpdmVycyBjb3B5IG1vc3Qg
b2YgdGhlIFRUTSBjb2RlIGZyb20gZWFjaAo+IG90aGVyLiBUaGUgaW1wbGVtZW50YXRpb24gaXMg
YWx3YXlzIHRoZSBzYW1lOyBleGNlcHQgZm9yIHRoZSBuYW1lIG9mCj4gc29tZSBkYXRhIHN0cnVj
dHVyZXMuCj4gCj4gQXMgcmVjZW50bHkgZGlzY3Vzc2VkLCB0aGlzIHBhdGNoIHNldCBwcm92aWRl
cyBnZW5lcmljIG1lbW9yeS1tYW5hZ2VtZW50Cj4gY29kZSBmb3Igc2ltcGxlIGZyYW1lYnVmZmVy
cyB3aXRoIGRlZGljYXRlZCB2aWRlbyBtZW1vcnkuIEl0IGZ1cnRoZXIKPiBjb252ZXJ0cyB0aGUg
cmVzcGVjdGl2ZSBkcml2ZXJzIHRvIHRoZSBnZW5lcmljIGNvZGUuIFRoZSBzaGFyZWQgY29kZQo+
IGlzIGJhc2ljYWxseSB0aGUgc2FtZSBpbXBsZW1lbnRhdGlvbiBhcyB0aGUgb25lIGNvcGllZCBh
bW9uZyBpbmRpdmlkdWFsCj4gZHJpdmVycy4KPiAKPiBUaGUgcGF0Y2ggc2V0IGNvbnRhaW5zIHR3
byBtYWpvciBjaGFuZ2VzOiBmaXJzdCwgaXQgaW50cm9kdWNlcwo+IHxzdHJ1Y3QgZHJtX2dlbV92
cmFtX29iamVjdHwgYW5kIGhlbHBlcnMgKEdFTSBWUkFNKS4gSXQncyBhIEdFTSBvYmplY3QKPiB0
aGF0IGlzIGJhY2tlZCBieSBWUkFNLiBUaGUgdHlwZSdzIHB1cnBvc2UgaXMgc29tZXdoYXQgc2lt
aWxhciB0bwo+IHxzdHJ1Y3QgZHJtX2dlbV97Y21hLCBzaG1lbX1fb2JqZWN0fDogaXQgcHJvdmlk
ZXMgYW4gY29tbW9tIGltcGxlbWVudGF0aW9uCj4gdGhhdCBoYW5kbGVzIGFsbCB0aGUgYmFzaWMg
Y2FzZXMuIFNlY29uZCwgdGhlIHBhdGNoIHNldCBpbnRyb2R1Y2VzCj4gfHN0cnVjdCBkcm1fdnJh
bV9tbXwgYW5kIGhlbHBlcnMgKFZSQU0gTU0pLiBJdCdzIGFuIGltcGxlbWVudGF0aW9uIG9mIGEK
PiBiYXNpYyBtZW1vcnkgbWFuYWdlciBmb3IgVlJBTS4KPiAKPiBCb3RoLCBHRU0gVlJBTSBhbmQg
VlJBTSBNTSwgc3VwcG9ydCBidWZmZXIgcGxhY2VtZW50IGluIFZSQU0gYW5kIHN5c3RlbQo+IG1l
bW9yeS4gQm90aCBjYW4gYmUgdXNlZCBpbmRlcGVuZGVkbHkgZnJvbSBlYWNoIG90aGVyIGlmIGRl
c2lyZWQgYnkgdGhlCj4gRFJNIGRyaXZlci4KCkxvb2tzIGdvb2QgdG8gbWUgb3ZlcmFsbCwgc29t
ZSBzbWFsbCBuaXRzIGluIHJlcGxpZXMgdG8gcGF0Y2hlcy4KCj4gQ3VycmVudGx5IGFzdCwgYm9j
aHMsIG1nYWcyMDAsIHZib3h2aWRlbyBhbmQgaGlzaWxpY29uL2hpYm1jIGNhbiB1c2UKPiB0aGVz
ZSBoZWxwZXJzLgoKSSd2ZSB0ZXN0ZWQgYm9jaHMgb24gcWVtdSwgd29ya3MgZmluZS4KV2hhdCBp
cyB0aGUgdGVzdGluZyBzdGF0dXMgb2YgdGhlIG90aGVyIGRyaXZlcnM/CgpjaGVlcnMsCiAgR2Vy
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
