Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EF7AE8D5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 13:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137236E03F;
	Tue, 10 Sep 2019 11:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331D56E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 11:06:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 702113082B40;
 Tue, 10 Sep 2019 11:06:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C6081001938;
 Tue, 10 Sep 2019 11:06:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 56A9E31F14; Tue, 10 Sep 2019 13:06:03 +0200 (CEST)
Date: Tue, 10 Sep 2019 13:06:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] Merge VRAM MM and GEM VRAM source files
Message-ID: <20190910110603.upjt34ycylscjpnf@sirius.home.kraxel.org>
References: <20190909130453.6718-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909130453.6718-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 10 Sep 2019 11:06:05 +0000 (UTC)
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
Cc: corbet@lwn.net, airlied@linux.ie, puck.chen@hisilicon.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, zourongrong@gmail.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDM6MDQ6NDlQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVlJBTSBNTSBhbmQgR0VNIFZSQU0gYXJlIG9ubHkgdXNlZCB3aXRoIGVhY2gg
b3RoZXIuIFRoaXMgcGF0Y2ggc2V0Cj4gbW92ZXMgVlJBTSBNTSBpbnRvIEdFTSBWUkFNIHNvdXJj
ZSBmaWxlcyBhbmQgY2xlYW5zIHVwIHRoZSBoZWxwZXIncwo+IHB1YmxpYyBpbnRlcmZhY2UuCj4g
Cj4gVGhvbWFzIFppbW1lcm1hbm4gKDQpOgo+ICAgZHJtL3ZyYW06IE1vdmUgVlJBTSBtZW1vcnkg
bWFuYWdlciB0byBHRU0gVlJBTSBpbXBsZW1lbnRhdGlvbgo+ICAgZHJtL3ZyYW06IEhhdmUgVlJB
TSBNTSBjYWxsIEdFTSBWUkFNIGZ1bmN0aW9ucyBkaXJlY3RseQo+ICAgZHJtL3ZyYW06IFVuZXhw
b3J0IGludGVybmFsIGZ1bmN0aW9ucyBvZiBWUkFNIE1NCj4gICBkcm0vdnJhbTogVW5jb25kaXRv
bmFsbHkgc2V0IEJPIGNhbGwtYmFjayBmdW5jdGlvbnMKCkxvb2tzIGFsbCBzYW5lLgoKQWNrZWQt
Ynk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgoKY2hlZXJzLAogIEdlcmQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
