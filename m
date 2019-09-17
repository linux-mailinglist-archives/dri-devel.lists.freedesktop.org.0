Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EE9B48F7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 10:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E606EB49;
	Tue, 17 Sep 2019 08:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749C86EB49
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 08:14:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DE6373082B1F;
 Tue, 17 Sep 2019 08:14:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F14F60BF7;
 Tue, 17 Sep 2019 08:14:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D17C317444; Tue, 17 Sep 2019 10:14:48 +0200 (CEST)
Date: Tue, 17 Sep 2019 10:14:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 2/8] drm/shmem: switch shmem helper to
 &drm_gem_object_funcs.mmap
Message-ID: <20190917081448.zonghnqa4aoc4bmp@sirius.home.kraxel.org>
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-3-kraxel@redhat.com>
 <197fdced-cf4a-c59a-47fd-aa5dbf8e04a2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <197fdced-cf4a-c59a-47fd-aa5dbf8e04a2@arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 17 Sep 2019 08:14:51 +0000 (UTC)
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 David Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiAtCS8qIFZNX1BGTk1BUCB3YXMgc2V0IGJ5IGRybV9nZW1fbW1hcCgpICovCj4g
PiAtCXZtYS0+dm1fZmxhZ3MgJj0gflZNX1BGTk1BUDsKPiA+IC0Jdm1hLT52bV9mbGFncyB8PSBW
TV9NSVhFRE1BUDsKPiA+ICsJdm1hLT52bV9mbGFncyB8PSAoVk1fTUlYRURNQVB8Vk1fRE9OVEVY
UEFORCk7Cj4gCj4gSSdtIGZpbmRpbmcgdGhpcyBhIGJpdCBoYXJkIHRvIGZvbGxvdyAtIGJ1dCBJ
IHRoaW5rIGhlcmUgd2UndmUgbG9zdAo+IFZNX0lPIGFuZCBWTV9ET05URFVNUCB3aGljaCB1c2Vk
IHRvIGJlIHNldCBieSBkcm1fZ2VtX21tYXAoKS4KClllcC4gIEludGVudGlvbmFsLCBidXQgSSB0
aGluayBJIGJldHRlciBzcGxpdCB0aGF0IG9mZiB0byBhIHNlcGFyYXRlCnBhdGNoIHdpdGggYSBj
b21taXQgbWVzc2FnZSBleHBsYWluaW5nIHRoaW5ncy4KCj4gQWxzbyBpdCBsb29rcyBsaWtlIG5v
dGhpbmcgaXMgZmlkZGxpbmcgdm1hLT52bV9wYWdlX3Byb3QgYW55bW9yZS4KCk9vcHMsIHRoYXQg
b25lIHdhcyBub3QgaW50ZW50aW9uYWwuICBXaWxsIGZpeC4KCmNoZWVycywKICBHZXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
