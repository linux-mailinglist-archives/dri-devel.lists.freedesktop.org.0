Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A490756588
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 11:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18EB6E33D;
	Wed, 26 Jun 2019 09:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285CF6E33C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 09:15:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9111730811C7;
 Wed, 26 Jun 2019 09:15:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04FF55C1A1;
 Wed, 26 Jun 2019 09:15:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1C01316E18; Wed, 26 Jun 2019 11:15:31 +0200 (CEST)
Date: Wed, 26 Jun 2019 11:15:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] drm/virtio: move drm_connector_update_edid_property() call
Message-ID: <20190626091531.35da5c2dsz6fuz5w@sirius.home.kraxel.org>
References: <20190405044602.2334-1-kraxel@redhat.com>
 <20190626095146.2731a2dc.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626095146.2731a2dc.cohuck@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 26 Jun 2019 09:15:34 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 jcmvbkbc@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDk6NTE6NDZBTSArMDIwMCwgQ29ybmVsaWEgSHVjayB3
cm90ZToKPiBPbiBGcmksICA1IEFwciAyMDE5IDA2OjQ2OjAyICswMjAwCj4gR2VyZCBIb2ZmbWFu
biA8a3JheGVsQHJlZGhhdC5jb20+IHdyb3RlOgo+IAo+ID4gZHJtX2Nvbm5lY3Rvcl91cGRhdGVf
ZWRpZF9wcm9wZXJ0eSBjYW4gc2xlZXAsIHdlIG11c3Qgbm90Cj4gPiBjYWxsIGl0IHdoaWxlIGhv
bGRpbmcgYSBzcGlubG9jay4gIE1vdmUgdGhlIGNhbGxzaXplLgo+IAo+IHMvY2FsbHNpemUvY2Fs
bHNpdGUvCgpGaXhlZCBvbiBjb21taXQuCgo+IFRoaXMgZ2V0cyByaWQgb2YgdGhlIHNsZWVwaW5n
IHdoaWxlIGF0b21pYyB0cmFjZXMgSSd2ZSBiZWVuIHNlZWluZyB3aXRoCj4gYW4gczM5MHggZ3Vl
c3QgKGJvdGggdmlydGlvLWdwdS1wY2kgYW5kIHZpcnRpby1ncHUtY2N3KS4KPiAKPiBUZXN0ZWQt
Ynk6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgo+IAo+IEkgaGF2ZSBhbHNvIGxv
b2tlZCBhdCB0aGUgY29kZSBhIGJpdCwgYnV0IGRvbid0IGZlZWwgY29uZmlkZW50IGVub3VnaAo+
IHRvIGdpdmUgYW4gUi1iLgo+IAo+IEFja2VkLWJ5OiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVk
aGF0LmNvbT4KClRoYW5rcy4gIFB1c2hlZCB0byBkcm0tbWlzYy1maXhlcy4KCmNoZWVycywKICBH
ZXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
