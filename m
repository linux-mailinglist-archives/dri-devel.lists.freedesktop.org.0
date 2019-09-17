Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDD4B4B4E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CC86EB9F;
	Tue, 17 Sep 2019 09:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEE46EB9F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 09:54:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5ED8A307D90E;
 Tue, 17 Sep 2019 09:54:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 103925C21A;
 Tue, 17 Sep 2019 09:54:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5865C16E05; Tue, 17 Sep 2019 11:54:35 +0200 (CEST)
Date: Tue, 17 Sep 2019 11:54:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/8] drm/ttm: factor out ttm_bo_mmap_vma_setup
Message-ID: <20190917095435.oenv4a6ryhvkfmtv@sirius.home.kraxel.org>
References: <20190913122908.784-1-kraxel@redhat.com>
 <20190913122908.784-5-kraxel@redhat.com>
 <88d5a253-ef9e-c998-6353-5ba8680129f2@suse.de>
 <20190917083425.kwwqyn463gn3mghf@sirius.home.kraxel.org>
 <8b8ce387-1b3c-0a9c-3aaf-6294b3b81018@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b8ce387-1b3c-0a9c-3aaf-6294b3b81018@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 17 Sep 2019 09:54:37 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJdCBtYXkgbm90IGJlIHdvcnRoIGJsb2NraW5nIG9uIHRoaXMsIHNvCj4gCj4gICBBY2tlZC1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gCj4gQnV0IEkgc3Rp
bGwgdGhpbmsgaXQncyBub3QgYSBnb29kIGludGVyZmFjZSBiZWNhdXNlIGl0IGV4cG9zZXMgaW50
ZXJuYWwKPiBkZXRhaWxzLgo+IAo+IFBsZWFzZSBjb25zaWRlciBhbm90aGVyIGlkZWE6IGhvdyBh
Ym91dCBzcGxpdHRpbmcgb2ZmIHRoZSB0dG1fYm9fZ2V0KCkKPiBhbmQgdm1hLWZsYWdzIHNldHVw
IG9mIHR0bV9mYmRldl9tbWFwKCkgaW50byBhIHNlcGFyYXRlIGZ1bmN0aW9uLCBsaWtlIHRoaXM6
Cj4gCj4gdm9pZCB0dG1fYm9fbW1hcF9yZWZlZCh2bWEsIGJvKQo+IHsKPiAJdHRtX2JvX2dldChi
bykKPiAJdHRtX2JvX21tYXBfdm1hX3NldHVwKHZtYSk7Cj4gfQo+IEVYUE9SVF9TWU1CT0wodHRt
X2JvX21tYXBfcmVmZWQpCgp0dG1fYm9fbW1hcF9yZWZlZCBhbmQgdHRtX2JvX21tYXBfdm1hX3Nl
dHVwIGFyZSBhbG1vc3QgaWRlbnRpY2FsIC4uLgoKQnV0LCB5ZXMsIG1vdmluZyB0aGUgdHRtX2Jv
X2dldCBjYWxsIHRvIHR0bV9ib19tbWFwX3ZtYV9zZXR1cCBwcm9iYWJseQptYWtlcyBzZW5zZSBh
bmQgaGlkZXMgdGhpcyBsaXR0bGUgZGV0YWlsIHRvIHRoZSBvdXRzaWRlLgoKPiB0dG1fZmJkZXZf
bW1hcCgpIHNvdW5kcyBsaWtlIGl0IGlzIG9ubHkgZm9yIGZiZGV2IGFuZCB0aGUgb25seSB1c2Vy
IGlzCj4gYW1kZ3B1LiBDYW4gaXQgYmUgbW92ZWQgb3V0IG9mIHR0bSBlbnRpcmVseT8KCkV4cG9y
dGluZyB0dG1fYm9fbW1hcF92bWFfc2V0dXAoKSBhbGxvd3MgdG8gZG8gdGhhdCA7KQoKY2hlZXJz
LAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
