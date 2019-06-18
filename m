Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C9E49AD5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397F86E106;
	Tue, 18 Jun 2019 07:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33876E106
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:41:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 62B243091797;
 Tue, 18 Jun 2019 07:41:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D7E49839;
 Tue, 18 Jun 2019 07:41:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DE78B16E18; Tue, 18 Jun 2019 09:41:53 +0200 (CEST)
Date: Tue, 18 Jun 2019 09:41:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] drm/virtio: simplify cursor updates
Message-ID: <20190618074153.355np63i76ee24c7@sirius.home.kraxel.org>
References: <20190617111406.14765-1-kraxel@redhat.com>
 <20190617111406.14765-4-kraxel@redhat.com>
 <20190617141806.GG12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617141806.GG12905@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 18 Jun 2019 07:41:56 +0000 (UTC)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBFdmVuIG5pY2VyIHdvdWxkIGJlIHRvIGFkZCB0aGUgZmVuY2UgdXNpbmcKPiBkcm1fYXRvbWlj
X3NldF9mZW5jZV9mb3JfcGxhbmUoKSBpbiB0aGUgcHJlcGFyZV9mYiBob29rLiBBc3N1bWluZyB0
aGlzCj4gaXNuJ3QgbmVjZXNzYXJ5IGZvciBjb3JyZWN0bmVzcyAoYnV0IHRoZW4gSSBraW5kYSBo
YXZlIHF1ZXN0aW9ucyBhYm91dAo+IHJhY2VzIGFuZCBzdHVmZikuCgpJJ2xsIGhhdmUgYSBsb29r
LiAgTWF5YmUgdGhpcyB3YXkgSSBjYW4gZHJvcCBzdHJ1Y3QKdmlydGlvX2dwdV9mcmFtZWJ1ZmZl
ciAod2hlcmUgdGhlIGZlbmNlIGlzIHRoZSBvbmx5CnRoaW5nIGJlc2lkZSBzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyKS4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
