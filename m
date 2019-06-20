Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8018E4C704
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 08:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A626E4B1;
	Thu, 20 Jun 2019 06:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB0F6E4B1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 06:01:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7461AC18B2DC;
 Thu, 20 Jun 2019 06:01:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E81CE1001DDC;
 Thu, 20 Jun 2019 06:01:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3E0AE1750A; Thu, 20 Jun 2019 08:01:07 +0200 (CEST)
Date: Thu, 20 Jun 2019 08:01:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH v3 08/12] drm/virtio: rework virtio_gpu_execbuffer_ioctl
 fencing
Message-ID: <20190620060107.tdz3nrnsczkkv2a6@sirius.home.kraxel.org>
References: <20190619090420.6667-1-kraxel@redhat.com>
 <20190619090420.6667-9-kraxel@redhat.com>
 <20190619110902.GO12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619110902.GO12905@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 20 Jun 2019 06:01:21 +0000 (UTC)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gQWxzbywgSSBzdHJvbmdseSByZWNvbW1lbmQgeW91IGRvIGEgdmVyeSBiYXNpYyBp
Z3QgdG8gZXhlcmNpc2UgdGhpcywgaS5lLgo+IGFsbG9jYXRlIHNvbWUgYnVmZmVycywgc3VibWl0
IHRoZW0gaW4gYSBkdW1tYnkgb3AsIHRoZW4gY2xvc2UgdGhlIGVudGlyZQo+IGRybWZkLiBUaGUg
b2xkIHZlcnNpb24gc2hvdWxkIGF0IGxlYXN0IGhhdmUgdHJpcHBlZCBvdmVyIGthc2FuLCBtYXli
ZSBldmVuCj4gb29wc2VzIHNvbWV3aGVyZS4KCkhtbSwgSSBzdXNwZWN0IEkgaGF2ZSB0byBleHRl
bmQgaWd0IGZvciB0aGF0IChhZGRpbmcgc3VwcG9ydCBmb3IKdmlydGlvIGlvY3RscyksIHJpZ2h0
PwoKQSBxdWljayBhbmQgZGlydHkgdGVzdCAocnVuIHdlYmdsIGRlbW8gaW4gZmlyZWZveCwgdGhl
biBraWxsIC05IGJvdGgKZmlyZWZveCBhbmQgWG9yZykgZGlkbid0IHNob3cgYW55IG5hc3R5IHN1
cnByaXNlcy4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
