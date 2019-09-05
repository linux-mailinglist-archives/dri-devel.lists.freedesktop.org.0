Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA864A9B00
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161BD89D63;
	Thu,  5 Sep 2019 07:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CFB89D63
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 07:01:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 20954881343;
 Thu,  5 Sep 2019 07:01:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C502C5D9CA;
 Thu,  5 Sep 2019 07:00:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 06BEB784F; Thu,  5 Sep 2019 09:00:59 +0200 (CEST)
Date: Thu, 5 Sep 2019 09:00:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/3] ast, mgag200: Map console BO while it's being
 displayed
Message-ID: <20190905070058.ydjtkrmy5nvgqens@sirius.home.kraxel.org>
References: <20190904115644.7620-1-tzimmermann@suse.de>
 <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 05 Sep 2019 07:01:00 +0000 (UTC)
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
Cc: Feng Tang <feng.tang@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kernel test robot <rong.a.chen@intel.com>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Huang Ying <ying.huang@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gLSBpbW8gd2Ugc2hvdWxkIGZpeCB0aGlzIGJ5IHVzaW5nIHRoZSBpb19tYXBwaW5n
IHN0dWZmLCB0aGF0IGF2b2lkcwo+IHRoZSBvdmVyaGVhZCBvZiByZXBlYXRlZCBwYXQgY2hlY2tz
IGZvciBtYXAvdW5tYXAuCgpBbm90aGVyIGlkZWE6ICBJSVJDIHR0bSBoYXMgYSBtb3ZlX25vdGlm
eSBjYWxsYmFjay4gIFNvIHdlIGNvdWxkIHNpbXBseQprZWVwIG1hcHBpbmdzIGFjdGl2ZSBldmVu
IHdoZW4gdGhlIHJlZmNvdW50IGdvZXMgZG93biB0byB6ZXJvLiAgVGhlbiBkbwp0aGUgYWN0dWFs
IHVubWFwIGVpdGhlciBpbiB0aGUgbW92ZV9ub3RpZnkgb3IgaW4gdGhlIGRlc3Ryb3kgY2FsbGJh
Y2suCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
