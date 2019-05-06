Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249A214BB1
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 16:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D461891EF;
	Mon,  6 May 2019 14:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EC7891EF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 14:20:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 243BC3001809;
 Mon,  6 May 2019 14:20:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0C0E5E1A7;
 Mon,  6 May 2019 14:20:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0056911AAA; Mon,  6 May 2019 16:20:34 +0200 (CEST)
Date: Mon, 6 May 2019 16:20:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 00/19] Share TTM code among DRM framebuffer drivers
Message-ID: <20190506142034.kb3lfvw25xbkrkyq@sirius.home.kraxel.org>
References: <20190506082649.942-1-tzimmermann@suse.de>
 <20190506122233.76pya5kpdfgp4f25@sirius.home.kraxel.org>
 <fcb3efd9-64f2-ca35-e36e-83b7055f8055@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fcb3efd9-64f2-ca35-e36e-83b7055f8055@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 06 May 2019 14:20:38 +0000 (UTC)
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

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDM6MDk6MjBQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAwNi4wNS4xOSB1bSAxNDoyMiBzY2hyaWViIEdlcmQgSG9m
Zm1hbm46Cj4gPj4gR0VNIFZSQU0gY291bGQgaW1wbGVtZW50IFBSSU1FIGhlbHBlcnMsIHdoaWNo
IHdvdWxkIGFsbG93IGZvciB1c2luZwo+ID4+IHRoZSBnZW5lcmljIGZiY29uLgo+ID4gCj4gPiBi
b2Noc19nZW1fcHJpbWVfKigpIGZ1bmN0aW9ucyB3aXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQgbG9v
ayBsaWtlIHlvdSBjYW4KPiA+IGp1c3QgcmVuYW1lIHRoZW0gJiBtb3ZlIG92ZXIgdG8gdnJhbSBo
ZWxwZXJzLgo+ID4gCj4gPiBJdCdzIG5vdCBhIGZ1bGwgcHJpbWUgaW1wbGVtZW50YXRpb24sIHNw
ZWNpZmljYWxseSBhY3R1YWwgZXhwb3J0L2ltcG9ydAo+ID4gaXNuJ3QgdGhlcmUuICBCdXQgcGlu
K3ZtYXAgKG5lZWRlZCBieSBnZW5lcmljIGZiY29uKSBpcyBpbXBsZW1lbnRlZC4KPiAKPiBJIGRp
ZCBoYXZlIGEgcGF0Y2ggdG8gZG8gdGhpcywgYnV0IHRoZW4gSSByZWFkIHRoYXQgcHJpbWUgcmVx
dWlyZXMgRE1BCj4gZm9yIGJ1ZmZlciBzaGFyaW5nIGFuZCBib2NocyB3b3JrcyBvbmx5IGJlY2F1
c2UgaXQncyBlbXVsYXRlZC4KCkZvciBhY3R1YWwgYnVmZmVyIHNoYXJpbmcgd2l0aCBvdGhlciBk
cml2ZXJzIHllcyBiZWNhdXNlIGRtYS1idWZzCnR5cGljYWxseSBhcmUgYSBidW5jaCBvZiBwYWdl
cyAoc3RydWN0IHBhZ2UqKikgYW5kIGxpdmUgaW4gUkFNLgoKTm90IHN1cmUgd2hlbmV2ZXIgaXQg
aXMgcG9zc2libGUgb3IgdXNlZnVsIHRvIHBsYWNlIHRoZSB2cmFtIGluClpPTkVfREVWSUNFIHRv
IGdldCBwYWdlIHN0cnVjdHMgZm9yIGl0LCB0aGVuIGV4cG9ydCBidWZmZXJzIGxvY2F0ZWQKaW4g
dnJhbSB0aGF0IHdheSB3aXRob3V0IGNvcHlpbmcgdGhlbSBvdmVyIHRvIG1haW4gbWVtb3J5LiAg
SSBzdXNwZWN0Cm1vc3QgaW1wb3J0ZXJzIHdvdWxkIGZhaWwgdG8gcHJvcGVybHkgc2V0dXAgUENJ
LVBDSSBkbWEgaW4gdGhhdCBjYXNlLgoKPiBJZiBib2NocycgaW1wbGVtZW50YXRpb24gaXMgY29t
cGxldGUgZW5vdWdoIHRvIGJlIHVzZWZ1bCBmb3Igb3RoZXIKPiBkcml2ZXJzLCBJJ2xsIGFkZCBp
dCB0byB0aGUgcGF0Y2ggc2V0LgoKSXQncyBnb29kIGVub3VnaCBmb3IgZ2VuZXJpYyBmYmNvbi4K
CmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
