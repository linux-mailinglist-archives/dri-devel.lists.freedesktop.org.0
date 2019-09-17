Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A437FB49AB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 10:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984836EB65;
	Tue, 17 Sep 2019 08:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8D66EB65
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 08:39:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 28DCDC058CA4;
 Tue, 17 Sep 2019 08:39:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6259A60BF7;
 Tue, 17 Sep 2019 08:39:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4B5D816E05; Tue, 17 Sep 2019 10:39:02 +0200 (CEST)
Date: Tue, 17 Sep 2019 10:39:02 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 8/8] drm/vram: drop DRM_VRAM_MM_FILE_OPERATIONS
Message-ID: <20190917083902.fn32iznnjm3zhudl@sirius.home.kraxel.org>
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-9-kraxel@redhat.com>
 <e9712055-c6db-5515-0c11-4d7add138856@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9712055-c6db-5515-0c11-4d7add138856@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 17 Sep 2019 08:39:04 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, David Airlie <airlied@linux.ie>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+ICBpbmNsdWRlL2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuaCAgICAgICAgICAgICAgfCA4MiAr
KysrKysrKysrKysrKysrKysrCgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV92cmFt
X21tX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmgKPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gCj4gUGxlYXNlIHJlYmFzZSBvbnRvIHRoZSBsYXRlc3QgZHJtLXRp
cC4gVGhpcyBlbnRpcmUgZmlsZSBoYXMgYmVlbiByZW1vdmVkCj4gaW4gYSByZWNlbnQgcGF0Y2gu
CgpJIGRpZCByZWJhc2UgYWxyZWFkeSwgdGhlbiByZS1hZGRlZCB0aGUgZmlsZSBieSBtaXN0YWtl
LiAgRGlkbid0IHBheQplbm91Z2ggYXR0ZW50aW9uIHdoaWxlIHNvbHZpbmcgdGhlIGNvbmZsaWN0
LiAgRml4ZWQgbm93LgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
