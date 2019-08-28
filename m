Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C29FE2D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 11:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE3C89487;
	Wed, 28 Aug 2019 09:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E39189487;
 Wed, 28 Aug 2019 09:15:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6C5E4800DD2;
 Wed, 28 Aug 2019 09:15:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8B4960610;
 Wed, 28 Aug 2019 09:15:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CA85D16E05; Wed, 28 Aug 2019 11:15:23 +0200 (CEST)
Date: Wed, 28 Aug 2019 11:15:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20190828091523.l6mairpwot27todz@sirius.home.kraxel.org>
References: <20190828185516.22b03da8@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190828185516.22b03da8@canb.auug.org.au>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Wed, 28 Aug 2019 09:15:25 +0000 (UTC)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBJIGFwcGxpZWQgdGhlIGZvbGxvd2luZyBmaXggcGF0Y2g6Cj4gCj4gRnJvbTogU3RlcGhlbiBS
b3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+Cj4gRGF0ZTogV2VkLCAyOCBBdWcgMjAxOSAx
ODozNzo0MCArMTAwMAo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL3ZpcnRpbzogbW9kdWxlX3BhcmFt
X25hbWVkKCkgcmVxdWlyZXMgbGludXgvbW9kdWxlcGFyYW0uaAo+IAo+IFNpZ25lZC1vZmYtYnk6
IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfb2JqZWN0LmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVj
dC5jCj4gaW5kZXggYWFiNTUzNDA1NmVjLi5iNWY4OTIzYWM2NzQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gQEAgLTIzLDYgKzIzLDggQEAKPiAgICogV0lU
SCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdB
UkUuCj4gICAqLwo+ICAKPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZXBhcmFtLmg+Cj4gKwoKRml4
IHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0LgoKdGhhbmtzLAogIEdlcmQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
