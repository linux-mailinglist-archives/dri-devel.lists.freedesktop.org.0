Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621114974
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 14:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0C0894C9;
	Mon,  6 May 2019 12:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1FA894C9
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 12:22:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5202B0ADF;
 Mon,  6 May 2019 12:22:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C97C91758C;
 Mon,  6 May 2019 12:22:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B483B16E0A; Mon,  6 May 2019 14:22:33 +0200 (CEST)
Date: Mon, 6 May 2019 14:22:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 00/19] Share TTM code among DRM framebuffer drivers
Message-ID: <20190506122233.76pya5kpdfgp4f25@sirius.home.kraxel.org>
References: <20190506082649.942-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506082649.942-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 06 May 2019 12:22:36 +0000 (UTC)
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

PiBHRU0gVlJBTSBjb3VsZCBpbXBsZW1lbnQgUFJJTUUgaGVscGVycywgd2hpY2ggd291bGQgYWxs
b3cgZm9yIHVzaW5nCj4gdGhlIGdlbmVyaWMgZmJjb24uCgpib2Noc19nZW1fcHJpbWVfKigpIGZ1
bmN0aW9ucyB3aXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQgbG9vayBsaWtlIHlvdSBjYW4KanVzdCBy
ZW5hbWUgdGhlbSAmIG1vdmUgb3ZlciB0byB2cmFtIGhlbHBlcnMuCgpJdCdzIG5vdCBhIGZ1bGwg
cHJpbWUgaW1wbGVtZW50YXRpb24sIHNwZWNpZmljYWxseSBhY3R1YWwgZXhwb3J0L2ltcG9ydApp
c24ndCB0aGVyZS4gIEJ1dCBwaW4rdm1hcCAobmVlZGVkIGJ5IGdlbmVyaWMgZmJjb24pIGlzIGlt
cGxlbWVudGVkLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
