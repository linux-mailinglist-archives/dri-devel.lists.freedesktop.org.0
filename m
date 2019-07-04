Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7883A5F75E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 13:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A486E32A;
	Thu,  4 Jul 2019 11:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894E76E32A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 11:48:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1DDA0C057F3C;
 Thu,  4 Jul 2019 11:47:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-222.ams2.redhat.com
 [10.36.116.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE0381001925;
 Thu,  4 Jul 2019 11:47:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E47B811AB8; Thu,  4 Jul 2019 13:47:56 +0200 (CEST)
Date: Thu, 4 Jul 2019 13:47:56 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 14/18] drm/virtio: rework
 virtio_gpu_transfer_from_host_ioctl fencing
Message-ID: <20190704114756.eavkszsgsyymns3m@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-15-kraxel@redhat.com>
 <CAPaKu7T3GvYVMueYgJFhADFSFEVbHEdaupw8=mq_+i150a1mLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7T3GvYVMueYgJFhADFSFEVbHEdaupw8=mq_+i150a1mLA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 04 Jul 2019 11:48:04 +0000 (UTC)
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
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDE6MDU6MTJQTSAtMDcwMCwgQ2hpYS1JIFd1IHdyb3Rl
Ogo+IE9uIFR1ZSwgSnVsIDIsIDIwMTkgYXQgNzoxOSBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gU3dpdGNoIHRvIHRoZSB2aXJ0aW9fZ3B1X2FycmF5
XyogaGVscGVyIHdvcmtmbG93Lgo+IChqdXN0IHJlcGVhdGluZyBteSBxdWVzdGlvbiBvbiBwYXRj
aCA2KQo+IAo+IERvZXMgdGhpcyBmaXggdGhlIG9iaiByZWZjb3VudCBpc3N1ZT8gIFdoZW4gd2Fz
IHRoZSBpc3N1ZSBpbnRyb2R1Y2VkPwoKb2JqIHJlZmNvdW50IHNob3VsZCBiZSBmaW5lIGluIGJv
dGggb2xkIGFuZCBuZXcgY29kZS4KCm9sZCBjb2RlOgogIGRybV9nZW1fb2JqZWN0X2xvb2t1cAog
IGRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZAoKbmV3IGNvZGU6CiAgdmlydGlvX2dwdV9hcnJh
eV9mcm9tX2hhbmRsZXMKICB2aXJ0aW9fZ3B1X2FycmF5X3B1dF9mcmVlIChpbiB2aXJ0aW9fZ3B1
X2RlcXVldWVfY3RybF9mdW5jKS4KCk9yIGRpZCBJIG1pc3Mgc29tZXRoaW5nPwoKY2hlZXJzLAog
IEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
