Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48953B72ED
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 07:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EADB6E9B0;
	Thu, 19 Sep 2019 05:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4FF6E9B0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 05:58:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 28BD33175288;
 Thu, 19 Sep 2019 05:58:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6870D5D9CC;
 Thu, 19 Sep 2019 05:58:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 11F5F17444; Thu, 19 Sep 2019 07:58:33 +0200 (CEST)
Date: Thu, 19 Sep 2019 07:58:33 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/11] drm/vram: Add struct drm_vram_buffer to VRAM helpers
Message-ID: <20190919055833.nswf244h3wjq5e6v@sirius.home.kraxel.org>
References: <20190918142307.27127-1-tzimmermann@suse.de>
 <20190918142307.27127-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918142307.27127-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 19 Sep 2019 05:58:36 +0000 (UTC)
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
Cc: corbet@lwn.net, airlied@linux.ie, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDQ6MjI6NTdQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gRHJpdmVycyB3aXRoIGRlZGljYXRlZCB2aWRlbyBtZW1vcnkgb2NjYXNpb25h
bGx5IG5lZWQgdG8gcmVzZXJ2ZSBhIG1lbW9yeQo+IGFyZWEgZm9yIGEgc3BlY2lmaWMgcHVycG9z
ZSwgc3VjaCBhcyBjdXJzb3IgaW1hZ2VzIG9yIHNwcml0ZXMuIFVzaW5nIEdFTQo+IFZSQU0gYnVm
ZmVyIG9iamVjdHMgY2FuIGJlIHByb2JsZW1hdGljLiBGb3Igc21hbGwgYnVmZmVycywgR0VNIFZS
QU0gYnVmZmVyCj4gb2JqZWN0cyBhcmUgaW5lZmZpY2llbnQgYXMgdGhleSBhcmUgYWxpZ25lZCB0
byBwYWdlIGJvdW5kYXJpZXMuCgpJIHdvdWxkIHN0aWxsIGFsbG9jYXRlIGdlbSBvYmplY3RzIGZv
ciB0aGF0LiAgVGhlbiB1c2UgdGhlbSBhcyBwb29sCmluc3RlYWQgb2YgdXNpbmcgdGhlbSBkaXJl
Y3RseS4KCk5vdCBzdXJlIHRoaXMgaXMgd29ydGggdGhlIHRyb3VibGUganVzdCBmb3IgdGhlIGN1
cnNvcnMgdGhvdWdoIGFzIHRoZXkKYXJlIGJpZyBlbm91Z2ggdGhhdCBwYWdlLXNpemVkIGFsbG9j
YXRpb25zIGRvbid0IHdhc3RlIG1lbW9yeS4KCj4gQW5kIHRoZXkgY2Fubm90IGVhc2lseSBiZSBw
bGFjZWQgYXQgc3BlY2lmaWMgbWVtb3J5IG9mZnNldHMuIFRoaXMgY2FuCj4gbGVhZCB0byBtZW1v
cnkgZnJhZ21lbnRhdGlvbiBhbmQgaXMgYSBwcm9ibGVtIGZvciBoYXJkd2FyZSB3aXRoIG9ubHkg
YQo+IHNtYWxsIGFtb3VudCBvZiBtZW1vcnkuCgpOb3RlIHRoYXQgdGhlcmUgaXMgYSBmbGFnIHRv
IGNoYW5nZSB0aGUgYWxsb2NhdGlvbiBzdHJhdGVneQooVFRNX1BMX0ZMQUdfVE9QRE9XTikuICBZ
b3UgY291bGQgYWxsb2NhdGUgdGhlIGN1cnNvciBvYmplY3RzCndpdGggdGhlIGZsYWcgc2V0LiAg
U2hvdWxkIGJlIGdvb2QgZW5vdWdoIHRvIGF2b2lkIGZyYWdtZW50YXRpb24uCgpJIGhhdmUgYSBw
YXRjaCBkb2luZyBleGFjdGx5IHRoYXQgZm9yIHF4bCwgZm9yIHRoZSBzYW1lIHJlYXNvbjoKaHR0
cHM6Ly9naXQua3JheGVsLm9yZy9jZ2l0L2xpbnV4L2NvbW1pdC8/aWQ9ZTAwZTkxM2E2NGM2ZmJh
OTYzMGIzMTFmOGJjNzFiZDdjOTg0MjQ3OQoobm8sIHRoYXQgcGF0Y2ggd2Fzbid0IHNlbnQgdG8g
dGhlIGxpc3QgeWV0KS4KCldlIGNvdWxkIGRvIHRoZSBzYW1lIGZvciB2cmFtIGFuZCBlaXRoZXIg
bGV0IHRoZSBkcml2ZXIgZXhwbGljaXRseSBhc2sKZm9yIHRvcC1kb3duIGFsbG9jYXRpb24sIG9y
IHVzZSBzb21lIHRocmVzaG9sZCBsaWtlIHRoZSBxeGwgcGF0Y2guCgpTbywgSSdtIG5vdCBjb252
aW5jZWQgd2UgYWN0dWFsbHkgbmVlZCB0aGUgZHJtX3ZyYW1fYnVmZmVyCmluZnJhc3RydWN0dXJl
LgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
