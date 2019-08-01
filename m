Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A627F7D600
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 09:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D576E3A2;
	Thu,  1 Aug 2019 07:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF726E3A2
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 07:04:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D16E681120;
 Thu,  1 Aug 2019 07:04:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-54.ams2.redhat.com
 [10.36.116.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 163B160BF7;
 Thu,  1 Aug 2019 07:04:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 725F711AAA; Thu,  1 Aug 2019 09:04:52 +0200 (CEST)
Date: Thu, 1 Aug 2019 09:04:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/6] Unmappable DRM client buffers for fbdev emulation
Message-ID: <20190801070452.wi3xxu22kq2vxovp@sirius.home.kraxel.org>
References: <20190705092613.7621-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705092613.7621-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 01 Aug 2019 07:04:56 +0000 (UTC)
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
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 airlied@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gYW5kIHJlbW92ZXMgYSBsYXJnZSBhbW91bnQgb2YgZnJhbWVidWZmZXIgY29kZSBm
cm9tIHRoZXNlIGRyaXZlcnMuIEZvcgo+IGJvY2hzLCBhIHByb2JsZW0gd2FzIHJlcG9ydGVkIHdo
ZXJlIHRoZSBkcml2ZXIgY291bGQgbm90IGRpc3BsYXkgdGhlIGNvbnNvbGUKPiBiZWNhdXNlIGl0
IHdhcyBwaW5uZWQgaW4gc3lzdGVtIG1lbW9yeS4gWzFdIFRoZSBwYXRjaCBzZXQgZml4ZXMgdGhp
cyBidWcKPiBieSBjb252ZXJ0aW5nIGJvY2hzIHRvIHVzZSB0aGUgc2hhZG93IGZiLgoKU28sIGJv
Y2hzIGluIDUuMy1yY1ggaXMgYnJva2VuLCBhbmQgcGF0Y2hlcyAxKzIrMys1IG9mIHRoaXMgc2Vy
aWVzIHVuYnJlYWsKaXQuICBTZXJpZXMgYWxyZWFkeSBsYW5kZWQgaW4gZHJtLW1pc2MtbmV4dCwg
YnV0IHRoYXQgZG9lc24ndCBoZWxwIGJvY2hzCmluIDUuMy4KCldoYXQgaXMgdGhlIHVzdWFsIHdh
eSB0byBoYW5kbGUgdGhpcz8KSnVzdCBjaGVycnktcGljayB0aGUgZm91ciBwYXRjaGVzIGludG8g
ZHJtLW1pc2MtZml4ZXMgYW5kIHB1c2g/Cgp0aGFua3MsCiAgR2VyZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
