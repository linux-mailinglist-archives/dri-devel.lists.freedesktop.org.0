Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56718602DA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 11:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B54A6E455;
	Fri,  5 Jul 2019 09:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E4B6E455
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 09:06:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE86F30860A0;
 Fri,  5 Jul 2019 09:05:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-90.ams2.redhat.com
 [10.36.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B3281BC67;
 Fri,  5 Jul 2019 09:05:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4FE3116E32; Fri,  5 Jul 2019 11:05:53 +0200 (CEST)
Date: Fri, 5 Jul 2019 11:05:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 15/18] drm/virtio: rework
 virtio_gpu_transfer_to_host_ioctl fencing
Message-ID: <20190705090553.jx5zcdoxeimojq2i@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-16-kraxel@redhat.com>
 <CAPaKu7S0n=E7g0o2e6fEk1YjP+u=tsoV8upw7J=noSx88PgP+A@mail.gmail.com>
 <20190704115138.ou77sb3rlrex67tj@sirius.home.kraxel.org>
 <CAPaKu7SDwR1TgFQK2XGEbRqSkCO0XZYxGhcjzsAwOH42aOHEEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7SDwR1TgFQK2XGEbRqSkCO0XZYxGhcjzsAwOH42aOHEEw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 05 Jul 2019 09:06:00 +0000 (UTC)
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

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMTI6MDg6MTRQTSAtMDcwMCwgQ2hpYS1JIFd1IHdyb3Rl
Ogo+IE9uIFRodSwgSnVsIDQsIDIwMTkgYXQgNDo1MSBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gICBIaSwKPiA+Cj4gPiA+ID4gICAgICAgICBjb252
ZXJ0X3RvX2h3X2JveCgmYm94LCAmYXJncy0+Ym94KTsKPiA+ID4gPiAgICAgICAgIGlmICghdmdk
ZXYtPmhhc192aXJnbF8zZCkgewo+ID4gPiA+ICAgICAgICAgICAgICAgICB2aXJ0aW9fZ3B1X2Nt
ZF90cmFuc2Zlcl90b19ob3N0XzJkCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgKHZn
ZGV2LCBxb2JqLCBvZmZzZXQsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgKHZnZGV2
LCBnZW1fdG9fdmlydGlvX2dwdV9vYmoob2Jqcy0+b2Jqc1swXSksIG9mZnNldCwKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgYm94LncsIGJveC5oLCBib3gueCwgYm94LnksIE5VTEwp
Owo+ID4gPiA+ICsgICAgICAgICAgICAgICB2aXJ0aW9fZ3B1X2FycmF5X3B1dF9mcmVlKG9ianMp
Owo+ID4gPiBEb24ndCB3ZSBuZWVkIHRoaXMgaW4gbm9uLTNEIGNhc2UgYXMgd2VsbD8KPiA+Cj4g
PiBObywgLi4uCj4gPgo+ID4gPiA+ICAgICAgICAgICAgICAgICB2aXJ0aW9fZ3B1X2NtZF90cmFu
c2Zlcl90b19ob3N0XzNkCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgKHZnZGV2LCBx
b2JqLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICh2Z2RldiwKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgdmZwcml2ID8gdmZwcml2LT5jdHhfaWQgOiAwLCBvZmZzZXQs
Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgIGFyZ3MtPmxldmVsLCAmYm94LCBmZW5j
ZSk7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgIHJlc2VydmF0aW9uX29iamVjdF9hZGRfZXhjbF9m
ZW5jZShxb2JqLT5iYXNlLmJhc2UucmVzdiwKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZmZW5jZS0+Zik7Cj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgIGFyZ3MtPmxldmVsLCAmYm94LCBvYmpzLCBmZW5jZSk7Cj4gPgo+ID4g
Li4uIDNkIGNhc2UgcGFzc2VzIHRoZSBvYmpzIGxpc3QgdG8gdmlydGlvX2dwdV9jbWRfdHJhbnNm
ZXJfdG9faG9zdF8zZCwKPiA+IHNvIGl0IGdldHMgYWRkZWQgdG8gdGhlIHZidWYgYW5kIHJlbGVh
c2VkIHdoZW4gdGhlIGNvbW1hbmQgaXMgZmluaXNoZWQuCj4gV2h5IGRvZXNuJ3QgdGhpcyBhcHBs
eSB0byB2aXJ0aW9fZ3B1X2NtZF90cmFuc2Zlcl90b19ob3N0XzJkPwoKSG1tLCB5ZXMsIG1ha2Vz
IHNlbnNlIHRvIGhhbmRsZSBib3RoIHRoZSBzYW1lIHdheS4KCldpdGggdmlyZ2w9b2ZmIHFlbXUg
cHJvY2Vzc2VzIHRoZSBjb21tYW5kcyBmcm9tIHRoZSBndWVzdApzeW5jaHJvbm91c2x5LCBzbyBp
dCdsbCB3b3JrIGZpbmUgYXMtaXMuICBTbyB5b3UgY2FuJ3QgaGl0CnRoZSB0aGVvcmV0aWNhbCBy
YWNlIHdpbmRvdyBpbiBwcmFjdGljZS4gIEJ1dCBkZXBlbmRpbmcKb24gdGhhdCBob3N0LXNpZGUg
aW1wbGVtZW50YXRpb24gZGV0YWlsIGlzbid0IGEgZ29vZCBpZGVhCmluZGVlZC4KCmNoZWVycywK
ICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
