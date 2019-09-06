Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F3AB507
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 11:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822D26E216;
	Fri,  6 Sep 2019 09:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0107A6E216
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 09:39:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 600E918C893C;
 Fri,  6 Sep 2019 09:39:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D69F5D721;
 Fri,  6 Sep 2019 09:39:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 71E9A783D; Fri,  6 Sep 2019 11:39:05 +0200 (CEST)
Date: Fri, 6 Sep 2019 11:39:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/3] drm/vram: Implement lazy unmapping for GEM VRAM
 buffers
Message-ID: <20190906093905.umz4wkwn4lukg2jg@sirius.home.kraxel.org>
References: <20190906085214.11677-1-tzimmermann@suse.de>
 <20190906085214.11677-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906085214.11677-4-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 06 Sep 2019 09:39:07 +0000 (UTC)
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

PiArdm9pZCBkcm1fZ2VtX3ZyYW1fYm9fZHJpdmVyX21vdmVfbm90aWZ5KHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCj4gKwkJCQkJYm9vbCBldmljdCwKPiArCQkJCQlzdHJ1Y3QgdHRtX21l
bV9yZWcgKm5ld19tZW0pCj4gK3sKWyAuLi4gXQo+ICsJaWYgKCFrbWFwLT52aXJ0dWFsKQo+ICsJ
CXJldHVybjsKPiArCXR0bV9ib19rdW5tYXAoa21hcCk7Cj4gKwlrbWFwLT52aXJ0dWFsID0gTlVM
TDsKPiArfQoKSSB0aGluayB0dG1fYnVmZmVyX29iamVjdF9kZXN0cm95KCkgbmVlZHMgImlmIChr
bWFwLT52aXJ0dWFsKQp0dG1fYm9fa3VubWFwKCkiIHRvbywgZHVlIHRvIHRoZSBsYXp5IHVubWFw
IHlvdSBjYW4gbGFuZCB0aGVyZQp3aXRoIGFuIGFjdGl2ZSBtYXBwaW5nLgoKY2hlZXJzLAogIEdl
cmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
