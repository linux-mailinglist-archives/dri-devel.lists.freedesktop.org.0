Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B375C8EE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 07:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B84D89A7A;
	Tue,  2 Jul 2019 05:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B459489BBE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 05:44:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A261430B96FC;
 Tue,  2 Jul 2019 05:44:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3FF860BF3;
 Tue,  2 Jul 2019 05:44:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CE40511AB5; Tue,  2 Jul 2019 07:44:47 +0200 (CEST)
Date: Tue, 2 Jul 2019 07:44:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/4] drm/vram: Set GEM object functions for PRIME
Message-ID: <20190702054447.7r52tkfovqk47rey@sirius.home.kraxel.org>
References: <20190628122659.31887-1-tzimmermann@suse.de>
 <20190628122659.31887-2-tzimmermann@suse.de>
 <20190701063232.pnc7ziq7tg4yqyqp@sirius.home.kraxel.org>
 <216c9142-ca8e-50ae-cb0b-f63a8b57addf@suse.de>
 <20190701084857.k7m3ysz47oes3mwj@sirius.home.kraxel.org>
 <546746eb-b8bc-dbd9-d712-3fdef01f14d0@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <546746eb-b8bc-dbd9-d712-3fdef01f14d0@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 02 Jul 2019 05:44:52 +0000 (UTC)
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
Cc: sam@ravnborg.org, maxime.ripard@bootlin.com, puck.chen@hisilicon.com,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 kong.kongxinwei@hisilicon.com, zourongrong@gmail.com, airlied@redhat.com,
 sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBCdXQgdGhlIG5ldyBhbmQgdGhlIG9sZCBvbmVzIGFyZSBpZGVudGljYWwsIHJp
Z2h0PyAgU28gd2h5IGFkZC9yZW1vdmU/Cj4gPiBXaHkgbm90IGp1c3QgcmVuYW1lIHRoZW0/Cj4g
Cj4gSG1tLCBPSy4gRG9lcyB0aGF0IHNvbWVob3cgbWFrZSBhIGRpZmZlcmVuY2UgKGUuZy4sIGVh
c2llciBiYWNrcG9ydGluZwo+IG9yIG1haW50ZW5hbmNlKT8KCkVhc2llciBwYXRjaCByZXZpZXcg
KGl0IGlzIG9idmlvdXMgdGhlbiB5b3Ugb25seSBjaGFuZ2UgdGhlIHdheSB0aGUKZnVuY3Rpb25z
IGFyZSBob29rZWQgdXAsIG5vdCB0aGUgYWN0dWFsIGNvZGUpLiAgQSBiaXQgbGVzcyBjb2RlIGNo
dXJuLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
