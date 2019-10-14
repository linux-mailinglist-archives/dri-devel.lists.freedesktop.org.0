Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2619CD5DF0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5C16E149;
	Mon, 14 Oct 2019 08:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7465E6E149
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:54:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F254F800DF4;
 Mon, 14 Oct 2019 08:54:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2CC819C58;
 Mon, 14 Oct 2019 08:54:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EDE1D16E2D; Mon, 14 Oct 2019 10:54:51 +0200 (CEST)
Date: Mon, 14 Oct 2019 10:54:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/3] dma-buf: add dma_resv_ctx for deadlock handling
Message-ID: <20191014085451.jsdxfbp4oq7fikmj@sirius.home.kraxel.org>
References: <20190918175525.49441-1-christian.koenig@amd.com>
 <20191008151639.GP16989@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008151639.GP16989@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Mon, 14 Oct 2019 08:54:53 +0000 (UTC)
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
Cc: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gLSBkb2luZyB0aGlzIG92ZXIgZG1hLWJ1ZiBtZWFucyB3ZSBjYW4gb25seSB1c2Ug
dGhpcyBmb3IgdGhlIHd3X211dHgKPiAgIGRhbmNlLCBub3QgZm9yIGFueXRoaW5nIGVsc2UuIFdo
aWNoIG1lYW5zIHdlIG5lZWQgYW5vdGhlciBsYXllciBvbiB0b3AKPiAgIGZvciBzaGFyZWQgZXhl
Y2J1ZiB1dGlscyAod2hpY2ggR2VyZCBoYXMgc3RhcnRlZCBsb29raW5nIGludG8sIGJ1dCBJCj4g
ICBmZWx0IGxpa2Ugbm90IHF1aXRlIHRoZSByaWdodCBhcHByb2FjaCB5ZXQgaW4gaGlzIGZpcnN0
IGRyYWZ0IHNlcmllcykuCgpGWUk6IHRoaXMgaXMgaW4gdmlydGlvLWdwdSBmb3Igbm93LCBzZWUg
dmlydGlvX2dwdV9hcnJheV8qCmluIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9nZW0u
YwoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
