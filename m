Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D55C9AAF7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 11:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0906EC44;
	Fri, 23 Aug 2019 09:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F237A6E043
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 09:02:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 56DDB18C8916;
 Fri, 23 Aug 2019 09:02:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 086136092D;
 Fri, 23 Aug 2019 09:02:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 062FC59EC; Fri, 23 Aug 2019 11:02:37 +0200 (CEST)
Date: Fri, 23 Aug 2019 11:02:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/i915: switch to
 drm_fb_helper_remove_conflicting_pci_framebuffers
Message-ID: <20190823090236.etu5xvekfu4jsuzp@sirius.home.kraxel.org>
References: <20190822090645.25410-1-kraxel@redhat.com>
 <20190822090645.25410-4-kraxel@redhat.com>
 <20190822131314.GX11147@phenom.ffwll.local>
 <20190823081427.hukub5ozdyqodfia@sirius.home.kraxel.org>
 <CAKMK7uET5HhoVmiTyUma1rdK67-w9GrnGwiy5W9XQKP+OLx3jg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uET5HhoVmiTyUma1rdK67-w9GrnGwiy5W9XQKP+OLx3jg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 23 Aug 2019 09:02:40 +0000 (UTC)
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6MzA6MzVBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEF1ZyAyMywgMjAxOSBhdCAxMDoxNCBBTSBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2hvbGUgc2VyaWVzIG9yIGp1c3QgdGhl
IGk5MTUgcGF0Y2g/Cj4gCj4gT2sgSSBqdXN0IGNoZWNrZWQgYW5kIHRoaXMgYWxsIGxhbmRlZCBp
biA1LjEgYWxyZWFkeSwgSSB0aG91Z2h0IGl0IHdhcwo+IG1vcmUgcmVjZW50LiBJIHRoaW5rIHRo
YXQncyBnb29kIGVub3VnaCwgcHVzaCBpdCBhbGwgd2l0aG91dCBtb3JlCj4gd2FpdGluZy4KClB1
c2hlZCB0byBkcm0tbWlzYy1uZXh0LgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
