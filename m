Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA758253
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 14:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7329F6E183;
	Thu, 27 Jun 2019 12:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F1E6E183
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 12:16:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C895430820EA;
 Thu, 27 Jun 2019 12:16:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BB0C5D719;
 Thu, 27 Jun 2019 12:16:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 96AC711AAF; Thu, 27 Jun 2019 14:16:40 +0200 (CEST)
Date: Thu, 27 Jun 2019 14:16:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 0/7] gem_bo.resv prime unification, leftovers
Message-ID: <20190627121640.3yrpbfcynhuzblqw@sirius.home.kraxel.org>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 27 Jun 2019 12:16:46 +0000 (UTC)
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6NDI6MDFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBIaSBhbGwsCj4gCj4gSGVyZSdzIHRoZSB1bm1lcmdlZCBsZWZ0b3ZlcnMgZnJvbSBt
eSBiaWcgcHJpbWUgY2xlYW51cCBzZXJpZXM6Cj4gLSB1c2luZyB0aGUgcHJlcGFyZV9mYiBoZWxw
ZXIgaW4gdmM0Jm1zbSwgbm93IGhvcGVmdWxseSBmaXhlZCB1cC4gVGhlCj4gICBoZWxwZXIgc2hv
dWxkIGJlIG5vdyBldmVuIG1vcmUgdXNlZnVsLgo+IAo+IC0gYW1kJm52IGRyaXZlciAtPmdlbV9w
cmltZV9yZXNfb2JqIGNhbGxiYWNrIHJlbW92YWwuIEkgdGhpbmsgdGhpcyBvbmUKPiAgIG1pZ2h0
IGhhdmUgZnVuY3Rpb25hbCBjb25mbGljdHMgd2l0aCBHZXJkJ3MgcGF0Y2ggc2VyaWVzIHRvIGVt
YmVkCj4gICBkcm1fZ2VtX29iamVjdCBpbiB0dG1fYm8sIG9yIGF0IGxlYXN0IG5lZWRzIHRvIGJl
IHJlLXJldmlld2VkIGJlZm9yZSB3ZQo+ICAgbWVyZ2UgdGhlIDJuZCBzZXJpZXMuCgpMb29rcyBh
bGwgc2FuZSB0byBtZS4KCkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
