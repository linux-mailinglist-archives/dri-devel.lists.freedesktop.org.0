Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31991F675
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 16:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B0D89291;
	Wed, 15 May 2019 14:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF5689291
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 14:22:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2408F3086224;
 Wed, 15 May 2019 14:22:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
 [10.36.117.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BA6A60F81;
 Wed, 15 May 2019 14:22:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2F45DA1E1; Wed, 15 May 2019 16:22:35 +0200 (CEST)
Date: Wed, 15 May 2019 16:22:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 00/20] Share TTM code among DRM framebuffer drivers
Message-ID: <20190515142235.qfwnvsrhnogj67hz@sirius.home.kraxel.org>
References: <20190508082630.15116-1-tzimmermann@suse.de>
 <05884df3-207a-6c2f-226e-d01266f17b77@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05884df3-207a-6c2f-226e-d01266f17b77@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 15 May 2019 14:22:42 +0000 (UTC)
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

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDk6MDU6NTRBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGksCj4gCj4gbW9zdCBvZiB0aGlzIHBhdGNoIHNldCBzdGlsbCBuZWVkcyBy
ZXZpZXdzLgo+IAo+IElmIGl0J3MgdG9vIGxhcmdlIGZvciBtZXJnaW5nIG9yIHJldmlld2luZyBh
dCBvbmNlLCBJIGNvdWxkIG1vdmUgdGhlCj4gZHJpdmVyIGNoYW5nZXMgaW50byBzZXBhcmF0ZSBw
YXRjaCBzZXRzLiBUaGUgdmJveCBkcml2ZXIncyBjaGFuZ2VzIGhhdmUKPiBiZWVuIGFjY2VwdGVk
IGJ5IEhhbnMgYWxyZWFkeS4gU28gb25seSBrZWVwaW5nIHRoZSBjb3JlIGNoYW5nZXMgcGx1cwo+
IHZib3ggd291bGQgYmUgYW4gb3B0aW9uLgoKTG9va3MgYWxsIGdvb2QgdG8gbWUuICBib2NocyBz
dXJ2aXZlZCBteSB0ZXN0aW5nLCB2Ym94IGlzIHJldmlld2VkIGFuZApJSVJDIHlvdSd2ZSB0ZXN0
ZWQgdHdvIG9mIHRoZSBvdGhlciB0aHJlZSBkcml2ZXJzLiAgU28gYWxsIGJ1dCBvbmUKZHJpdmVy
IGlzIGNvdmVyZWQuCgpJJ2xsIGdvIHB1c2ggdGhpcyB0byBkcm0tbWlzYy1uZXh0IGluIGEgbW9t
ZW50LgoKPiA+IEZ1dHVyZSBkaXJlY3Rpb25zOiB3aXRoIHRoZXNlIGNoYW5nZXMsIHRoZSByZXNw
ZWN0aXZlIGRyaXZlcnMgY2FuIGFsc28KPiA+IHNoYXJlIHNvbWUgb2YgdGhlaXIgbW9kZS1zZXR0
aW5nIG9yIGZiZGV2IGNvZGUuIEdFTSBWUkFNJ3MgUFJJTUUgaGVscGVycwo+ID4gYWxsb3cgZm9y
IHVzaW5nIHRoZSBnZW5lcmljIGZiY29uIGVtdWxhdGlvbi4KClVzaW5nIGdlbmVyaWMgZmJjb24g
c2hvdWxkIGJlIGVhc3kgbm93LgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
