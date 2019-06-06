Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF9336D79
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61499891FF;
	Thu,  6 Jun 2019 07:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3492891FF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 07:41:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 73A11C04FFF1;
 Thu,  6 Jun 2019 07:41:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-131.ams2.redhat.com
 [10.36.117.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 233192E040;
 Thu,  6 Jun 2019 07:41:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 637F511AAF; Thu,  6 Jun 2019 09:41:22 +0200 (CEST)
Date: Thu, 6 Jun 2019 09:41:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: davidriley@chromium.org
Subject: Re: [PATCH 4/4] drm/virtio: Add memory barriers for capset cache.
Message-ID: <20190606074122.csocqu6g3in7dgbj@sirius.home.kraxel.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
 <20190605234423.11348-4-davidriley@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605234423.11348-4-davidriley@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 06 Jun 2019 07:41:23 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDQ6NDQ6MjNQTSAtMDcwMCwgZGF2aWRyaWxleUBjaHJv
bWl1bS5vcmcgd3JvdGU6Cj4gRnJvbTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0u
b3JnPgo+IAo+IEFmdGVyIGRhdGEgaXMgY29waWVkIHRvIHRoZSBjYWNoZSBlbnRyeSwgYXRvbWlj
X3NldCBpcyB1c2VkIGluZGljYXRlCj4gdGhhdCB0aGUgZGF0YSBpcyB0aGUgZW50cnkgaXMgdmFs
aWQgd2l0aG91dCBhcHByb3ByaWF0ZSBtZW1vcnkgYmFycmllcnMuCj4gU2ltaWxhcmx5IHRoZSBy
ZWFkIHNpZGUgd2FzIG1pc3NpbmcgdGhlIHNhbWUgbWVtb3J5IGJhcnJpZXMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyB8IDMgKysrCj4gIGRyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jICAgIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfaW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5j
Cj4gaW5kZXggODhjMWVkNTdhM2M1Li41MDJmNWY3YzIyOTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfaW9jdGwuYwo+IEBAIC01NDIsNiArNTQyLDkgQEAgc3RhdGljIGludCB2
aXJ0aW9fZ3B1X2dldF9jYXBzX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAlpZiAo
IXJldCkKPiAgCQlyZXR1cm4gLUVCVVNZOwo+ICAKPiArCS8qIGlzX3ZhbGlkIGNoZWNrIG11c3Qg
cHJvY2VlZCBiZWZvcmUgY29weSBvZiB0aGUgY2FjaGUgZW50cnkuICovCj4gKwl2aXJ0X3JtYigp
OwoKSSBkb24ndCB0aGluayB5b3UgbmVlZCB2aXJ0X3JtYigpIGhlcmUuICBUaGlzIGlzbid0IGd1
ZXN0IDw9PiBob3N0CmNvbW11bmljYXRpb24sIHNvIGEgbm9ybWFsIGJhcnJpZXIgc2hvdWxkIGRv
LgoKVGhlIG90aGVyIHRocmVlIGZpeGVzIGFyZSBxdWV1ZWQgdXAgZm9yIGRybS1taXNjLW5leHQu
CgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
