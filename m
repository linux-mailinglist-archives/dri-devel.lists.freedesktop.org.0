Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B8826239
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 12:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959FC89113;
	Wed, 22 May 2019 10:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE19B89113
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:49:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F00CE308622B;
 Wed, 22 May 2019 10:49:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
 [10.36.117.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BA9A1975E;
 Wed, 22 May 2019 10:49:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3AD6111AB5; Wed, 22 May 2019 12:49:18 +0200 (CEST)
Date: Wed, 22 May 2019 12:49:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/3] Various clean-up patches for GEM VRAM
Message-ID: <20190522104918.6fxfrusqsqkg3zre@sirius.home.kraxel.org>
References: <20190521110831.20200-1-tzimmermann@suse.de>
 <20190521124022.GL21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521124022.GL21222@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 22 May 2019 10:49:23 +0000 (UTC)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDI6NDA6MjJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAwMTowODoyOFBNICswMjAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToKPiA+IFJlcGxhY2luZyBkcm1fZ2VtX3ZyYW1fcHVzaF90b19zeXN0
ZW0oKSBtb3ZlcyBwb2xpY3kgZnJvbSBkcml2ZXJzIGJhY2sKPiA+IHRvIHRoZSBtZW1vcnkgbWFu
YWdlci4gTm93LCB1bnVzZWQgQk9zIGFyZSBvbmx5IGV2aWN0ZWQgd2hlbiB0aGUgc3BhY2UKPiA+
IGlzIHJlcXVpcmVkLgo+ID4gCj4gPiBUaGUgbG9jay91bmxvY2stcmVuYW1pbmcgcGF0Y2ggYWxp
Z25zIHRoZSBpbnRlcmZhY2Ugd2l0aCBvdGhlciBuYW1lcwo+ID4gaW4gRFJNLiBObyBmdW5jdGlv
bmFsIGNoYW5nZXMgYXJlIGRvbmUuCj4gPiAKPiA+IEZpbmFsbHksIHRoZXJlJ3Mgbm93IGEgbG9j
a2RlcCBhc3NlcnQgdGhhdCBlbnN1cmVzIHdlIGRvbid0IGNhbGwgdGhlCj4gPiBHRU0gVlJBTSBf
bG9ja2VkKCkgZnVuY3Rpb25zIHdpdGggYW4gdW5sb2NrZWQgQk8uCj4gPiAKPiA+IFBhdGNoZXMg
YXJlIGFnYWluc3QgYSByZWNlbnQgZHJtLXRpcCBhbmQgdGVzdGVkIG9uIG1nYWcyMDAgYW5kIGFz
dCBIVy4KPiA+IAo+ID4gVGhvbWFzIFppbW1lcm1hbm4gKDMpOgo+ID4gICBkcm06IFJlcGxhY2Ug
ZHJtX2dlbV92cmFtX3B1c2hfdG9fc3lzdGVtKCkgd2l0aCBrdW5tYXAgKyB1bnBpbgo+ID4gICBk
cm06IFJlbmFtZSByZXNlcnZlL3VucmVzZXJ2ZSB0byBsb2NrL3VubG9jayBpbiBHRU0gVlJBTSBo
ZWxwZXJzCj4gPiAgIGRybTogQXNzZXJ0IHRoYXQgQk8gaXMgbG9ja2VkIGluIGRybV9nZW1fdnJh
bV97cGluLHVucGlufV9sb2NrZWQoKQo+IAo+IEF3ZXNvbWUsIHRoYW5rcyBhIGxvdCBmb3IgcXVp
Y2tseSB3b3JraW5nIG9uIHRoaXMuIE9uIHRoZSBzZXJpZXM6Cj4gCj4gQWNrZWQtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gCj4gQnV0IGRlZmluaXRlbHkgZ2V0
IHNvbWVvbmUgd2l0aCBtb3JlIGtub3dsZWRnZSBvZiB0aGUgZGV0YWlscyB0byBjaGVjawo+IHRo
aXMgYWxsIGFnYWluLgoKRG9uZSAmIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0LgoKdGhhbmtzLAog
IEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
