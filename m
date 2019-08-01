Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9405A7DC1A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 15:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0446E5CC;
	Thu,  1 Aug 2019 13:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506586E5CC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 13:03:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 70F143DE22;
 Thu,  1 Aug 2019 13:03:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-54.ams2.redhat.com
 [10.36.116.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E097B5D9CD;
 Thu,  1 Aug 2019 13:03:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ED1D316E1A; Thu,  1 Aug 2019 15:03:48 +0200 (CEST)
Date: Thu, 1 Aug 2019 15:03:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/6] Unmappable DRM client buffers for fbdev emulation
Message-ID: <20190801130348.7kj374g534fle7wu@sirius.home.kraxel.org>
References: <20190705092613.7621-1-tzimmermann@suse.de>
 <20190801070452.wi3xxu22kq2vxovp@sirius.home.kraxel.org>
 <CAKMK7uFTYJxF_JHwRjAN_nV=OCuFtx376H_7ku2H_0S-r9nRPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFTYJxF_JHwRjAN_nV=OCuFtx376H_7ku2H_0S-r9nRPg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 01 Aug 2019 13:03:50 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDE6Mzg6MThQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIEF1ZyAxLCAyMDE5IGF0IDk6MDQgQU0gR2VyZCBIb2ZmbWFubiA8a3Jh
eGVsQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+ICAgSGksCj4gPgo+ID4gPiBhbmQgcmVtb3Zl
cyBhIGxhcmdlIGFtb3VudCBvZiBmcmFtZWJ1ZmZlciBjb2RlIGZyb20gdGhlc2UgZHJpdmVycy4g
Rm9yCj4gPiA+IGJvY2hzLCBhIHByb2JsZW0gd2FzIHJlcG9ydGVkIHdoZXJlIHRoZSBkcml2ZXIg
Y291bGQgbm90IGRpc3BsYXkgdGhlIGNvbnNvbGUKPiA+ID4gYmVjYXVzZSBpdCB3YXMgcGlubmVk
IGluIHN5c3RlbSBtZW1vcnkuIFsxXSBUaGUgcGF0Y2ggc2V0IGZpeGVzIHRoaXMgYnVnCj4gPiA+
IGJ5IGNvbnZlcnRpbmcgYm9jaHMgdG8gdXNlIHRoZSBzaGFkb3cgZmIuCj4gPgo+ID4gU28sIGJv
Y2hzIGluIDUuMy1yY1ggaXMgYnJva2VuLCBhbmQgcGF0Y2hlcyAxKzIrMys1IG9mIHRoaXMgc2Vy
aWVzIHVuYnJlYWsKPiA+IGl0LiAgU2VyaWVzIGFscmVhZHkgbGFuZGVkIGluIGRybS1taXNjLW5l
eHQsIGJ1dCB0aGF0IGRvZXNuJ3QgaGVscCBib2Nocwo+ID4gaW4gNS4zLgo+ID4KPiA+IFdoYXQg
aXMgdGhlIHVzdWFsIHdheSB0byBoYW5kbGUgdGhpcz8KPiA+IEp1c3QgY2hlcnJ5LXBpY2sgdGhl
IGZvdXIgcGF0Y2hlcyBpbnRvIGRybS1taXNjLWZpeGVzIGFuZCBwdXNoPwo+IAo+IEJlc3Qgd291
bGQgYmUgdG8gcHV0IHRoZSBwYXRjaGVzIGludG8gLWZpeGVzIGZyb20gdGhlIHN0YXJ0LgoKU3Vy
ZSwgYnV0IHRoYXQgc2hpcCBpcyBzYWlsZWQgaW4gdGhpcyBjYXNlLgoKPiBDaGVycnkgcGljayB3
b3JrcyB0b28sIGlmIGl0J3Mgbm90IHRvbyBpbnZhc2l2ZS4KCkFsbCA0IHBhdGNoZXMgYXJlIGNs
ZWFuIGNoZXJyeS1waWNrcywgc28gSSBkaWQgdGhhdC4KCnRoYW5rcywKICBHZXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
