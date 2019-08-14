Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFA58D06A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 12:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183206E4F3;
	Wed, 14 Aug 2019 10:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3346E4CF;
 Wed, 14 Aug 2019 10:14:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 498122F366E;
 Wed, 14 Aug 2019 10:14:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00501808DD;
 Wed, 14 Aug 2019 10:14:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2A5FD9D42; Wed, 14 Aug 2019 12:14:11 +0200 (CEST)
Date: Wed, 14 Aug 2019 12:14:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v6 08/17] drm/ttm: use gem vma_node
Message-ID: <20190814101411.lj3p6zjzbjvnnjf4@sirius.home.kraxel.org>
References: <20190805140119.7337-1-kraxel@redhat.com>
 <20190805140119.7337-9-kraxel@redhat.com>
 <20190813151115.GA29955@ulmo>
 <20190814055827.6hrxj6daovxxnnvw@sirius.home.kraxel.org>
 <20190814093524.GA31345@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814093524.GA31345@ulmo>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 14 Aug 2019 10:14:12 +0000 (UTC)
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
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 Ben Skeggs <bskeggs@redhat.com>, spice-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBDaGFuZ2luZyB0aGUgb3JkZXIgZG9lc24ndCBsb29rIGhhcmQuICBQYXRjaCBh
dHRhY2hlZCAodW50ZXN0ZWQsIGhhdmUgbm8KPiA+IHRlc3QgaGFyZHdhcmUpLiAgQnV0IG1heWJl
IEkgbWlzc2VkIHNvbWUgZGV0YWlsIC4uLgo+IAo+IEkgY2FtZSB1cCB3aXRoIHNvbWV0aGluZyB2
ZXJ5IHNpbWlsYXIgYnkgc3BsaXR0aW5nIHVwIG5vdXZlYXVfYm9fbmV3KCkKPiBpbnRvIGFsbG9j
YXRpb24gYW5kIGluaXRpYWxpemF0aW9uIHN0ZXBzLCBzbyB0aGF0IHdoZW4gbmVjZXNzYXJ5IHRo
ZSBHRU0KPiBvYmplY3QgY2FuIGJlIGluaXRpYWxpemVkIGluIGJldHdlZW4uIEkgdGhpbmsgdGhh
dCdzIHNsaWdodGx5IG1vcmUKPiBmbGV4aWJsZSBhbmQgZWFzaWVyIHRvIHVuZGVyc3RhbmQgdGhh
biBhIGJvb2xlYW4gZmxhZy4KClllcywgdGhhdCBzaG91bGQgd29yayB0b28uCgpBY2tlZC1ieTog
R2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpjaGVlcnMsCiAgR2VyZAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
