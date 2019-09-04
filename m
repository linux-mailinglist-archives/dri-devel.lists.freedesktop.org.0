Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82409A9B63
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 09:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1359989E0D;
	Thu,  5 Sep 2019 07:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A294893EA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 17:14:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C8B2AF78;
 Wed,  4 Sep 2019 17:14:24 +0000 (UTC)
Date: Wed, 4 Sep 2019 10:14:15 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/3] ast, mgag200: Map console BO while it's being
 displayed
Message-ID: <20190904171415.6kn6t2kvct3663us@linux-r8p5>
References: <20190904115644.7620-1-tzimmermann@suse.de>
 <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHsmnT307hTOgfQ42erN9Kh7w9hBw2i-dJp6CJHxqomUw@mail.gmail.com>
User-Agent: NeoMutt/20180323
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:13:21 +0000
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
Cc: Feng Tang <feng.tang@intel.com>, kernel test robot <rong.a.chen@intel.com>,
 Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Huang Ying <ying.huang@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAwNCBTZXAgMjAxOSwgRGFuaWVsIFZldHRlciB3cm90ZToKPkknbSBhbHNvIG5vdCBz
dXJlIHdoZXRoZXIgd2UgaGF2ZSBhIHJlYWwgcHJvYmxlbSBoZXJlLCBpdCdzIGp1c3QgZGVidWcK
Pm5vaXNlIHRoYXQgd2UncmUgZmlnaHRpbmcgaGVyZT8KCkl0IGlzIG5vbiBzdG9wIGRlYnVnIG5v
aXNlIGFzIHRoZSBtZW1vcnkgcmFuZ2UgaW4gcXVlc3Rpb24gaXMgYmVpbmcgYWRkZWQgKwpkZWxl
dGVkIG92ZXIgYW5kIG92ZXIuIEkgZG91YnQgd2Ugd2FudCB0byBiZSBidXJuaW5nIGN5Y2xlcyBs
aWtlIHRoaXMuCgpUaGFua3MsCkRhdmlkbG9ocgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
