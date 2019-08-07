Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E212D849B7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 12:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE836E693;
	Wed,  7 Aug 2019 10:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071926E693
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 10:36:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 69E694C95D;
 Wed,  7 Aug 2019 10:36:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCBE5600C6;
 Wed,  7 Aug 2019 10:36:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8B82716E32; Wed,  7 Aug 2019 12:36:49 +0200 (CEST)
Date: Wed, 7 Aug 2019 12:36:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/3] drm: add gem ttm helpers
Message-ID: <20190807103649.aedmac63eop6ktlk@sirius.home.kraxel.org>
References: <20190806133454.8254-1-kraxel@redhat.com>
 <20190806133454.8254-2-kraxel@redhat.com>
 <20190806135426.GA7444@phenom.ffwll.local>
 <20190807072654.arqvx37p4yxhegcu@sirius.home.kraxel.org>
 <CAKMK7uFyKd71w4H8nFk=WPSHL3KMwQ6kLwAMXTd_TAkrkJ++KQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFyKd71w4H8nFk=WPSHL3KMwQ6kLwAMXTd_TAkrkJ++KQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 07 Aug 2019 10:36:51 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiA+IFNhbWUgZm9yIHRoaXMsIHlvdSdyZSBqdXN0IHVwY2FzdGluZyB0byB0dG1f
Ym8gYW5kIHRoZW4gZG93bmNhc3RpbmcgdG8KPiA+ID4gZ2VtX2JvIGFnYWluIC4uLiBJIHRoaW5r
IGp1c3QgYSBzZXJpZXMgdG8gcm9sbCBvdXQgdGhlIGV4aXN0aW5nIGdlbQo+ID4gPiBoZWxwZXJz
IGV2ZXJ5d2hlcmUgc2hvdWxkIHdvcms/Cj4gPgo+ID4gSSBkb24ndCB0aGluayBzby4gIGRybV9n
ZW1fZHVtYl9tYXBfb2Zmc2V0KCkgY2FsbHMKPiA+IGRybV9nZW1fY3JlYXRlX21tYXBfb2Zmc2V0
KCksIHdoaWNoIEkgdGhpbmsgaXMgbm90IGNvcnJlY3QgZm9yIHR0bQo+ID4gb2JqZWN0cyBiZWNh
dXNlIHR0bV9ib19pbml0KCkgaGFuZGxlcyB2bWFfbm9kZSBpbml0aWFsaXphdGlvbi4KPiAKPiBN
b3JlIGNvZGUgdG8gdW5pZnkgZmlyc3Q/IFRoaXMgc2hvdWxkIHdvcmsgZXhhY3RseSB0aGUgc2Ft
ZSB3YXkgZm9yCj4gYWxsIGdlbSBiYXNlZCBkcml2ZXJzIEkgdGhpbmsgLi4uIE9ubHkgdHJpY2t5
IGJpdCBpcyBtYWtpbmcgc3VyZQo+IHZtd2dmeCBrZWVwcyB3b3JraW5nIGNvcnJlY3RseS4KClll
YS4gIFVuaWZ5aW5nIG9uIHRoZSBnZW0gd2F5IG9mIGRvaW5nIHRoaW5ncyBpc24ndCBnb2luZyB0
byB3b3JrIHZlcnkKd2VsbC4gIFdlIHdvdWxkIGhhdmUgdG8ga2VlcCB0aGUgY3VycmVudCB3YXkg
b2YgZG9pbmcgdGhpbmdzIGluIHRoZSB0dG0KY29kZSwgd3JhcHBlZCBpbnRvICJpZiAodHRtX2Jv
X3VzZXNfZW1iZWRkZWRfZ2VtX29iamVjdCgpKSB7IC4uLiB9IiwgdG8Kbm90IGJyZWFrIHZtd2dm
eC4KClNvIGFkZGluZyBnZW0gdHRtIGhlbHBlcnMgKHdoZXJlIGdlbSt0dG0gZHJpdmVycyBjYW4g
b3B0LWluKSBsb29rZWQgbGlrZQp0aGUgYmV0dGVyIHdheSBvZiBoYW5kbGluZyB0aGlzIHRvIG1l
IC4uLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
