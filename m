Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D5114ABE
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 15:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058C88991A;
	Mon,  6 May 2019 13:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EBD8991A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:17:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 92E11307D93F;
 Mon,  6 May 2019 13:17:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F2B8171B7;
 Mon,  6 May 2019 13:17:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4809B1747B; Mon,  6 May 2019 15:17:39 +0200 (CEST)
Date: Mon, 6 May 2019 15:17:39 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/19] drm: Add |struct drm_gem_vram_object| and helpers
Message-ID: <20190506131739.hmadwiqmjil2weth@sirius.home.kraxel.org>
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506082649.942-2-tzimmermann@suse.de>
 <20190506123114.hzyl2hkix7lvqjyx@sirius.home.kraxel.org>
 <0fad955f-5a9e-15b1-0dca-c5e842b297c6@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fad955f-5a9e-15b1-0dca-c5e842b297c6@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 06 May 2019 13:17:46 +0000 (UTC)
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
 zourongrong@gmail.com, sam@ravnborg.org, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gVGhpcyBtaXNzZXMgdGhlIGNhbGwgdG8gZHJtX2dlbV92cmFtX3BsYWNlbWVudCgp
LCB3aGVyZQo+IGRybV9nZW1fdnJhbV9wdXNoX3RvX3N5c3RlbSgpIGVuZm9yY2VzIHBsYWNlbWVu
dCBpbiBzeXN0ZW0gbWVtb3J5LgoKQWgsIG1pc3NlZCB0aGF0IGRldGFpbC4KCj4gV2UKPiBjb3Vs
ZCBidWlsZCBhIGNvbW1vbiBpbXBsZW1lbnRhdGlvbiBvdXQgb2YgYm90aCBpbnRlcmZhY2VzLCBi
dXQgdGhhdAo+IHdvdWxkIG9iZnVzY2F0ZSB0aGUgY29kZSBJTUhPLiBJJ2QganVzdCBsZWF2ZSBp
dCBhcyBpdCBpcy4KCk9rLgoKPiA+PiArc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3Qgewo+ID4+
ICsJLyogU3VwcG9ydGVkIHBsYWNlbWVudHMgYXJlICVUVE1fUExfVlJBTSBhbmQgJVRUTV9QTF9T
WVNURU0gKi8KPiA+PiArCXN0cnVjdCB0dG1fcGxhY2VtZW50IHBsYWNlbWVudDsKPiA+PiArCXN0
cnVjdCB0dG1fcGxhY2UgcGxhY2VtZW50c1szXTsKPiA+IAo+ID4gcGxhY2VtZW50c1syXSBzaG91
bGQgYmUgZW5vdWdoIEkgZ3Vlc3M/Cj4gCj4gVFRNX1BMX1ZSQU0gaGFzIGluZGV4IDIgYW5kIFRU
TV9QTF9TWVNURU0gaGFzIGluZGV4IDAuIFRoZXJlJ3MgVFRNX1BMX1RUCj4gYXQgaW5kZXggMS4g
V2UgZG9uJ3QgdXNlIGFsbCB0aHJlZSBhcnJheSBlbnRyaWVzIGhlcmUsIGJ1dCBJJ20gbm90IHN1
cmUKPiBpZiBzb21ldGhpbmcgaW4gVFRNIGRvZXMuIEkgdG9vayB0aGUgbGluZSBmcm9tIHRoZSBk
cml2ZXJzIGFuZCBkaWRuJ3QKPiBjaGFuZ2UgaXQgZm9yIHRoYXQgcmVhc29uLgoKVFRNX1BMXyog
aXNuJ3QgYW4gaW5kZXggaW50byB0aGF0IGFycmF5LiAgU2VlIGRybV9nZW1fdnJhbV9wbGFjZW1l
bnQoKQp3aGljaCBmaWxscyB0aGF0IGFycmF5LiAgSXQnbGwgdXNlIG9uZSBvciB0d28gZW50cmll
cyBvZiB0aGF0IGFycmF5LgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
