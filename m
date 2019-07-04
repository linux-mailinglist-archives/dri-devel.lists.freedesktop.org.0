Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8095F77B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 13:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67326E32B;
	Thu,  4 Jul 2019 11:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECF46E32B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 11:51:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5B854307D85E;
 Thu,  4 Jul 2019 11:51:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-222.ams2.redhat.com
 [10.36.116.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13A5A5B2D9;
 Thu,  4 Jul 2019 11:51:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D51AE11AB8; Thu,  4 Jul 2019 13:51:38 +0200 (CEST)
Date: Thu, 4 Jul 2019 13:51:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 15/18] drm/virtio: rework
 virtio_gpu_transfer_to_host_ioctl fencing
Message-ID: <20190704115138.ou77sb3rlrex67tj@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-16-kraxel@redhat.com>
 <CAPaKu7S0n=E7g0o2e6fEk1YjP+u=tsoV8upw7J=noSx88PgP+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7S0n=E7g0o2e6fEk1YjP+u=tsoV8upw7J=noSx88PgP+A@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 04 Jul 2019 11:51:43 +0000 (UTC)
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

ICBIaSwKCj4gPiAgICAgICAgIGNvbnZlcnRfdG9faHdfYm94KCZib3gsICZhcmdzLT5ib3gpOwo+
ID4gICAgICAgICBpZiAoIXZnZGV2LT5oYXNfdmlyZ2xfM2QpIHsKPiA+ICAgICAgICAgICAgICAg
ICB2aXJ0aW9fZ3B1X2NtZF90cmFuc2Zlcl90b19ob3N0XzJkCj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAodmdkZXYsIHFvYmosIG9mZnNldCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICh2Z2RldiwgZ2VtX3RvX3ZpcnRpb19ncHVfb2JqKG9ianMtPm9ianNbMF0pLCBvZmZzZXQsCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgYm94LncsIGJveC5oLCBib3gueCwgYm94LnksIE5V
TEwpOwo+ID4gKyAgICAgICAgICAgICAgIHZpcnRpb19ncHVfYXJyYXlfcHV0X2ZyZWUob2Jqcyk7
Cj4gRG9uJ3Qgd2UgbmVlZCB0aGlzIGluIG5vbi0zRCBjYXNlIGFzIHdlbGw/CgpObywgLi4uCgo+
ID4gICAgICAgICAgICAgICAgIHZpcnRpb19ncHVfY21kX3RyYW5zZmVyX3RvX2hvc3RfM2QKPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICh2Z2RldiwgcW9iaiwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICh2Z2RldiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICB2ZnByaXYgPyB2
ZnByaXYtPmN0eF9pZCA6IDAsIG9mZnNldCwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICBh
cmdzLT5sZXZlbCwgJmJveCwgZmVuY2UpOwo+ID4gLSAgICAgICAgICAgICAgIHJlc2VydmF0aW9u
X29iamVjdF9hZGRfZXhjbF9mZW5jZShxb2JqLT5iYXNlLmJhc2UucmVzdiwKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmZlbmNlLT5mKTsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICBhcmdzLT5sZXZlbCwgJmJveCwgb2JqcywgZmVuY2Up
OwoKLi4uIDNkIGNhc2UgcGFzc2VzIHRoZSBvYmpzIGxpc3QgdG8gdmlydGlvX2dwdV9jbWRfdHJh
bnNmZXJfdG9faG9zdF8zZCwKc28gaXQgZ2V0cyBhZGRlZCB0byB0aGUgdmJ1ZiBhbmQgcmVsZWFz
ZWQgd2hlbiB0aGUgY29tbWFuZCBpcyBmaW5pc2hlZC4KCmNoZWVycywKICBHZXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
