Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43AFC49F2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 10:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B226E910;
	Wed,  2 Oct 2019 08:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1101B6E911
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 08:49:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 798A087630;
 Wed,  2 Oct 2019 08:49:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-252.ams2.redhat.com
 [10.36.117.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2068260624;
 Wed,  2 Oct 2019 08:49:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1A85311AAA; Wed,  2 Oct 2019 10:49:42 +0200 (CEST)
Date: Wed, 2 Oct 2019 10:49:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 2/2] [RFC] drm/virtgpu: modify uapi with
 stride/layer_stride fix
Message-ID: <20191002084942.jnm6brnuadwztonh@sirius.home.kraxel.org>
References: <20191002014935.33171-1-gurchetansingh@chromium.org>
 <20191002014935.33171-2-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002014935.33171-2-gurchetansingh@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 02 Oct 2019 08:49:43 +0000 (UTC)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDY6NDk6MzVQTSAtMDcwMCwgR3VyY2hldGFuIFNpbmdo
IHdyb3RlOgo+IFRoaXMgZG9lc24ndCByZWFsbHkgYnJlYWsgdXNlcnNwYWNlLCBzaW5jZSBpdCBh
bHdheXMgcGFzc2VzIGRvd24KPiAwIGZvciBzdHJpZGUvbGF5ZXJfc3RyaWRlIGN1cnJlbnRseS4g
V2UgY291bGQ6Cj4gCj4gKDEpIG1vZGlmeSBVQVBJIG5vdyBhbmQgYWRkIGEgVklSVEdQVV9QQVJB
TV9TVFJJREVfRklYIGZlYXR1cmUKClRoaXMgSSB0aGluay4KQnV0IElNTyBpdCdzIG5vdCBhIGZp
eCwgaXQgaXMgYW4gYWRkZWQgZmVhdHVyZSAuLi4KCkFsc28gbWlzc2luZyB0aGUgYmlnIHBpY3R1
cmUgaGVyZS4gIFdoeSBkbyB3ZSBuZWVkIHRoaXM/CgpGb3IgZ3Vlc3Qgb2JqZWN0IHdlIGRvbid0
IGhhdmUgc3RyaWRlcyAodmlydGlvX2dwdV9yZXNvdXJjZV9jcmVhdGVfM2QKZG9lc24ndCBhbGxv
dyB0aGlzKS4KCkZvciBob3N0IG9iamVjdHMgdGhlIGhvc3Qgc2hvdWxkIGtub3cgdGhlIHN0cmlk
ZXMuCgpXaGljaCBJIHRoaW5rIGlzIHRoZSByZWFzb24gd2h5IHRoZSBzdHJpZGUgYW5kIGxheWVy
X3N0cmlkZSBmaWVsZHMgaW4KdGhlIHRyYW5zZmVyIGNvbW1hbmRzIGFyZSBlZmZlY3RpdmVseSB1
bnVzZWQgLi4uCgo+IC0JLyogVE9ETzogYWRkIHRoZSBjb3JyZWN0IHN0cmlkZSAvIGxheWVyX3N0
cmlkZS4gKi8KPiAgCXZpcnRpb19ncHVfY21kX3RyYW5zZmVyX2Zyb21faG9zdF8zZAo+IC0JCSh2
Z2RldiwgdmZwcml2LT5jdHhfaWQsIG9mZnNldCwgYXJncy0+bGV2ZWwsIDAsIDAsCj4gLQkJICZi
b3gsIG9ianMsIGZlbmNlKTsKPiArCQkodmdkZXYsIHZmcHJpdi0+Y3R4X2lkLCBvZmZzZXQsIGFy
Z3MtPmxldmVsLCBhcmdzLT5zdHJpZGUsCj4gKwkJIGFyZ3MtPmxheWVyX3N0cmlkZSwgJmJveCwg
b2JqcywgZmVuY2UpOwoKV2hhdCBoYXBwZW5zIHdpdGggb2xkIHVzZXJzcGFjZSBydW5uaW5nIG9u
IGEgbmV3IGtlcm5lbD8KCkkgZG9uJ3QgdGhpbmsgd2UgY2FuIHNpbXBseSB1c2UgdGhlIGFyZ3Mg
aGVyZSB3aXRob3V0IGNoZWNraW5nIHdlCmFjdHVhbGx5IGdvdCBzb21ldGhpbmcgZnJvbSB1c2Vy
c3BhY2UgLi4uCgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3ZpcnRncHVfZHJtLmgg
Yi9pbmNsdWRlL3VhcGkvZHJtL3ZpcnRncHVfZHJtLmgKPiBpbmRleCBmMDZhNzg5ZjM0Y2QuLmIy
ZmM5MmMzZDJiZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3ZpcnRncHVfZHJtLmgK
PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3ZpcnRncHVfZHJtLmgKPiBAQCAtMTE3LDYgKzExNyw4
IEBAIHN0cnVjdCBkcm1fdmlydGdwdV8zZF90cmFuc2Zlcl90b19ob3N0IHsKPiAgCXN0cnVjdCBk
cm1fdmlydGdwdV8zZF9ib3ggYm94Owo+ICAJX191MzIgbGV2ZWw7Cj4gIAlfX3UzMiBvZmZzZXQ7
Cj4gKwlfX3UzMiBzdHJpZGU7Cj4gKwlfX3UzMiBsYXllcl9zdHJpZGU7Cj4gIH07CgpjaGVlcnMs
CiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
