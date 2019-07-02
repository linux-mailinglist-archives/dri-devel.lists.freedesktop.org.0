Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A915CDEB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 12:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA7E89ABA;
	Tue,  2 Jul 2019 10:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF1989ABA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 10:53:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5676458569;
 Tue,  2 Jul 2019 10:53:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB25319C5B;
 Tue,  2 Jul 2019 10:53:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0FBF416E05; Tue,  2 Jul 2019 12:53:40 +0200 (CEST)
Date: Tue, 2 Jul 2019 12:53:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 5/5] drm/vram: Don't export driver callback functions
 for PRIME
Message-ID: <20190702105340.roogxgh4ckf5fnqa@sirius.home.kraxel.org>
References: <20190702080139.21814-1-tzimmermann@suse.de>
 <20190702080139.21814-6-tzimmermann@suse.de>
 <20190702092023.dv4sveiqb7s3k5ne@sirius.home.kraxel.org>
 <CACvgo50hk5y8xf4u9g2=h=i05vXWmQ32EyNfL+4V=049zcAd1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50hk5y8xf4u9g2=h=i05vXWmQ32EyNfL+4V=049zcAd1Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 02 Jul 2019 10:53:42 +0000 (UTC)
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
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rongrong Zou <zourongrong@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+ID4gLS8qKgo+ID4gPiAtICogZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1fZnJlZV9vYmplY3Rf
dW5sb2NrZWQoKSAtIFwKPiA+ID4gLSAgICAgSW1wbGVtZW50cyAmc3RydWN0IGRybV9kcml2ZXIu
Z2VtX2ZyZWVfb2JqZWN0X3VubG9ja2VkCj4gPiA+IC0gKiBAZ2VtOiAgICAgR0VNIG9iamVjdC4g
UmVmZXJzIHRvICZzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdC5nZW0KPiA+ID4gLSAqLwo+ID4K
PiA+IEkgdGhpbmsgd2Ugc2hvdWxkIGtlZXAgdGhlIGRvY3VtZW50YXRpb24gLi4uCj4gPgo+ID4g
PiAtRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9mcmVlX29iamVjdF91bmxv
Y2tlZCk7Cj4gPgo+ID4gQW5kIHRoZSBFWFBPUlRfU1lNQk9MIHRvby4KPiA+Cj4gPiBEcml2ZXJz
IG1pZ2h0IHdhbnQgcm9sbCB0aGVpciBvd24gdmVyc2lvbiBvZiBkcm1fZ2VtX29iamVjdF9mdW5j
cywKPiA+IHdpdGggc29tZSBvZiB0aGUgZnVuY3Rpb25zIHJlcGxhY2VkIGJ5IGRyaXZlci1zcGVj
aWZpYyB2ZXJzaW9ucyBpbgo+ID4gY2FzZSB0aGV5IGhhdmUgc29tZSBleHRyYSB3b3JrIHRvIGRv
Lgo+ID4KPiBLZWVwaW5nIHRoZSBjb21tZW50IHNvdW5kcyByZWFzb25hYmxlIElNSE8uIEFsdGhv
dWdoIEknbSBsZXNzIHN1cmUKPiBhYm91dCBFWFBPUlRfU1lNQk9MLgo+IElmIHlvdSBoYXZlIFdJ
UCBzZXJpZXMgdGhhdCBtYWtlcyB1c2Ugb2YgaXQsIHN1cmUuIE90aGVyd2lzZSBhbnkKPiBkcml2
ZXIgd2FudHMgdG8gdXNlIGl0LCB0aGV5IGNhbiB0cml2aWFsbHkgcmVpbnN0YXRlIHRoYXQuCgpO
byBwZW5kaW5nIHBhdGNoZXMuICBJdCdzIGNvbW1vbiBwcmFjdGljZSBpbiB0aGUgb3RoZXIgaGVs
cGVycyB0aG91Z2guCkJ1dCBJIGRvbid0IG1pbmQgbXVjaCBlaXRoZXIgd2F5LCBhZGRpbmcgYmFj
ayB0aGUgRVhQT1JUX1NZTUJPTCgpIGlmCm5lZWRlZCBpcyBlYXN5IGVub3VnaC4KCmNoZWVycywK
ICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
