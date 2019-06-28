Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B095598C0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0328B6E8D6;
	Fri, 28 Jun 2019 10:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A0F896C4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:49:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1069A30BBEA6;
 Fri, 28 Jun 2019 10:49:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B44EE1001B1B;
 Fri, 28 Jun 2019 10:49:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EB20D11AA3; Fri, 28 Jun 2019 12:49:07 +0200 (CEST)
Date: Fri, 28 Jun 2019 12:49:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v4 11/12] drm/virtio: switch from ttm to gem shmem helpers
Message-ID: <20190628104907.vign7lmgftrwfisv@sirius.home.kraxel.org>
References: <20190620060726.926-1-kraxel@redhat.com>
 <20190620060726.926-12-kraxel@redhat.com>
 <CAPaKu7QXCMMKR50Oiv=CefUA4S+S3KgpJ2FKTd1WA1H2_ORqXg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7QXCMMKR50Oiv=CefUA4S+S3KgpJ2FKTd1WA1H2_ORqXg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 28 Jun 2019 10:49:15 +0000 (UTC)
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
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCoKPiA+ICB2aXJ0aW9f
Z3B1X29iamVjdF9yZWYoc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibykKCj4gVGhlIGxhc3Qg
dXNlcnMgb2YgdGhlc2UgdHdvIGhlbHBlcnMgYXJlIHJlbW92ZWQgd2l0aCB0aGlzIHBhdGNoLiAg
V2UKPiBjYW4gcmVtb3ZlIHRoZW0uCgpwYXRjaCAxMi8xMiBkb2VzIHRoYXQuCgo+ID4gKyAgICAg
ICBibyA9IGdlbV90b192aXJ0aW9fZ3B1X29iaigmc2htZW1fb2JqLT5iYXNlKTsKPiA+ICsgICAg
ICAgYm8tPmJhc2UuYmFzZS5mdW5jcyA9ICZ2aXJ0aW9fZ3B1X2dlbV9mdW5jczsKPiBNb3ZlIHRo
aXMgdG8gdmlydGlvX2dwdV9jcmVhdGVfb2JqZWN0LgoKRml4ZWQuCgo+ID4gKyAgICAgICByZXQg
PSBkcm1fZ2VtX3NobWVtX3Bpbigmb2JqLT5iYXNlLmJhc2UpOwo+IFRoZSBibyBpcyBhdHRhY2hl
ZCBmb3IgaXRzIGVudGlyZSBsaWZldGltZSwgYXQgbGVhc3QgY3VycmVudGx5LiAgTWF5YmUKPiB3
ZSBjYW4gdXNlIGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzX3NndCAoYW5kIGdldCByaWQgb2Ygb2Jq
LT5wYWdlcykuCgpBbHJlYWR5IGNoZWNrZWQgdGhpcy4KV2UgY2FuJ3QgZHVlIHRvIHRoZSBpb21t
dSBxdWlya3MuCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
