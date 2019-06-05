Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E52359C9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 11:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C0D89728;
	Wed,  5 Jun 2019 09:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD91289728
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 09:46:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C3AF330820E6;
 Wed,  5 Jun 2019 09:46:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-131.ams2.redhat.com
 [10.36.117.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E05A60C91;
 Wed,  5 Jun 2019 09:46:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 446D916E1A; Wed,  5 Jun 2019 11:46:03 +0200 (CEST)
Date: Wed, 5 Jun 2019 11:46:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/8] drm/ast: Pin framebuffer BO during dirty update
Message-ID: <20190605094603.esl35xvlktrxwxto@sirius.home.kraxel.org>
References: <20190604154201.14460-1-tzimmermann@suse.de>
 <20190604154201.14460-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190604154201.14460-5-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 05 Jun 2019 09:46:05 +0000 (UTC)
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
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, sean@poorly.run,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiArCS8qIFdlIHBpbiB0aGUgQk8gdG8gc3lzdGVtIG1lbW9yeSBzbyBpdCB3b24ndCBiZSBtb3Zl
ZCBkdXJpbmcKPiArCSAqIHRoZSB1cGRhdGUgYW5kIGRvZXNuJ3Qgd2FzdGUgdmlkZW8gcmFtLiBJ
ZiB0aGUgQk8gaXMgYWxyZWFkeQo+ICsJICogbG9jYXRlZCBpbiBWUkFNLCB0aGUgcGluIG9wZXJh
dGlvbiB3aWxsIHNpbXBseSBpbmNyZW1lbnQgdGhlCj4gKwkgKiBwaW4gY291bnQuCj4gIAkgKi8K
CnMvbG9jYXRlZC9waW5uZWQvIEkgZ3Vlc3M/CgpNYXliZSB3ZSBzaG91bGQgdXBkYXRlIGRybV9n
ZW1fdnJhbV9waW4oKSB0byBza2lwIHRoZQpkcm1fZ2VtX3ZyYW1fcGxhY2VtZW50KCkgY2FsbCBp
biBjYXNlIHBsX2ZsYWcgaXMgemVybywgc28geW91IGNhbiBwaW4KdGhlIGJvIHdoZXJlIGl0IGhh
cHBlbnMgdG8gYmUgYXQgdGhlIG1vbWVudC4KClRoaXMgd2lsbCBhdm9pZCBtb3ZpbmcgYXJvdW5k
IHRoZSBibyBmb3Igbm8gZ29vZCByZWFzb24uICBXZSBkb24ndCBjYXJlCndoZXJlIHRoZSBibyBp
cywgd2Ugb25seSB3YW50IG1ha2Ugc3VyZSBpdCBkb2Vzbid0IG1vdmUgd2hpbGUgd2UgYWNjZXNz
Cml0LgoKKHNhbWUgZ29lcyBmb3IgdGhlIGN1cnNvciBwYXRjaCwgYW5kIEkgZ3Vlc3MgdGhlIG1n
YSBwYXRjaGVzIHRvbyBidXQgSQpoYXZuJ3QgbG9va2VkIHlldCkuCgpjaGVlcnMsCiAgR2VyZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
