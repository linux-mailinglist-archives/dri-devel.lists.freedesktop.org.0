Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFD95F712
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 13:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EDF6E314;
	Thu,  4 Jul 2019 11:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383516E314
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 11:10:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7D1B53082200;
 Thu,  4 Jul 2019 11:10:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-222.ams2.redhat.com
 [10.36.116.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3397917B97;
 Thu,  4 Jul 2019 11:10:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2264311AB5; Thu,  4 Jul 2019 13:10:43 +0200 (CEST)
Date: Thu, 4 Jul 2019 13:10:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 06/18] drm/virtio: remove ttm calls from in
 virtio_gpu_object_{reserve,unreserve}
Message-ID: <20190704111043.5ubc2yjrjphj2iec@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-7-kraxel@redhat.com>
 <CAPaKu7RfLoB=K__wQd92=S20Mt0uqsfyU9oigr8CQ-=gH6OUuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7RfLoB=K__wQd92=S20Mt0uqsfyU9oigr8CQ-=gH6OUuA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 04 Jul 2019 11:10:45 +0000 (UTC)
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

ICBIaSwKCj4gPiAtICAgICAgIHIgPSB0dG1fYm9fcmVzZXJ2ZSgmYm8tPnRibywgdHJ1ZSwgZmFs
c2UsIE5VTEwpOwo+ID4gKyAgICAgICByID0gcmVzZXJ2YXRpb25fb2JqZWN0X2xvY2tfaW50ZXJy
dXB0aWJsZShiby0+Z2VtX2Jhc2UucmVzdiwgTlVMTCk7Cj4gQ2FuIHlvdSBlbGFib3JhdGUgYSBi
aXQgYWJvdXQgaG93IFRUTSBrZWVwcyB0aGUgQk9zIGFsaXZlIGluLCBmb3IKPiBleGFtcGxlLCB2
aXJ0aW9fZ3B1X3RyYW5zZmVyX2Zyb21faG9zdF9pb2N0bD8gIEluIHRoYXQgZnVuY3Rpb24sIG9u
bHkKPiB0aHJlZSBUVE0gZnVuY3Rpb25zIGFyZSBjYWxsZWQ6IHR0bV9ib19yZXNlcnZlLCB0dG1f
Ym9fdmFsaWRhdGUsIGFuZAo+IHR0bV9ib191bnJlc2VydmUuICBJIGFtIGN1cmlvdXMgaG93IHRo
ZXkga2VlcCB0aGUgQk8gYWxpdmUuCgpJdCBjYW4ndCBnbyBhd2F5IGJldHdlZW4gcmVzZXJ2ZSBh
bmQgdW5yZXNlcnZlLCBhbmQgSSB0aGluayBpdCBhbHNvCmNhbid0IGJlIGV2aWN0ZWQgdGhlbi4g
IEhhdm4ndCBjaGVja2VkIGhvdyB0dG0gaW1wbGVtZW50cyB0aGF0LgoKY2hlZXJzLAogIEdlcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
