Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEEF602AB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE366E452;
	Fri,  5 Jul 2019 08:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85AD6E452
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 08:53:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3AE463079B68;
 Fri,  5 Jul 2019 08:53:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-90.ams2.redhat.com
 [10.36.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D935C1001B20;
 Fri,  5 Jul 2019 08:53:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 10B3216E32; Fri,  5 Jul 2019 10:53:25 +0200 (CEST)
Date: Fri, 5 Jul 2019 10:53:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 06/18] drm/virtio: remove ttm calls from in
 virtio_gpu_object_{reserve,unreserve}
Message-ID: <20190705085325.am2reucblvxc6qpg@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-7-kraxel@redhat.com>
 <CAPaKu7RfLoB=K__wQd92=S20Mt0uqsfyU9oigr8CQ-=gH6OUuA@mail.gmail.com>
 <20190704111043.5ubc2yjrjphj2iec@sirius.home.kraxel.org>
 <CAPaKu7S4Og7kda2ZjFtuRv=_W8gpFbD5y7s==0JB5Z34S4Hsjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7S4Og7kda2ZjFtuRv=_W8gpFbD5y7s==0JB5Z34S4Hsjw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 05 Jul 2019 08:53:36 +0000 (UTC)
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

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMTI6MTc6NDhQTSAtMDcwMCwgQ2hpYS1JIFd1IHdyb3Rl
Ogo+IE9uIFRodSwgSnVsIDQsIDIwMTkgYXQgNDoxMCBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gICBIaSwKPiA+Cj4gPiA+ID4gLSAgICAgICByID0g
dHRtX2JvX3Jlc2VydmUoJmJvLT50Ym8sIHRydWUsIGZhbHNlLCBOVUxMKTsKPiA+ID4gPiArICAg
ICAgIHIgPSByZXNlcnZhdGlvbl9vYmplY3RfbG9ja19pbnRlcnJ1cHRpYmxlKGJvLT5nZW1fYmFz
ZS5yZXN2LCBOVUxMKTsKPiA+ID4gQ2FuIHlvdSBlbGFib3JhdGUgYSBiaXQgYWJvdXQgaG93IFRU
TSBrZWVwcyB0aGUgQk9zIGFsaXZlIGluLCBmb3IKPiA+ID4gZXhhbXBsZSwgdmlydGlvX2dwdV90
cmFuc2Zlcl9mcm9tX2hvc3RfaW9jdGw/ICBJbiB0aGF0IGZ1bmN0aW9uLCBvbmx5Cj4gPiA+IHRo
cmVlIFRUTSBmdW5jdGlvbnMgYXJlIGNhbGxlZDogdHRtX2JvX3Jlc2VydmUsIHR0bV9ib192YWxp
ZGF0ZSwgYW5kCj4gPiA+IHR0bV9ib191bnJlc2VydmUuICBJIGFtIGN1cmlvdXMgaG93IHRoZXkg
a2VlcCB0aGUgQk8gYWxpdmUuCj4gPgo+ID4gSXQgY2FuJ3QgZ28gYXdheSBiZXR3ZWVuIHJlc2Vy
dmUgYW5kIHVucmVzZXJ2ZSwgYW5kIEkgdGhpbmsgaXQgYWxzbwo+ID4gY2FuJ3QgYmUgZXZpY3Rl
ZCB0aGVuLiAgSGF2bid0IGNoZWNrZWQgaG93IHR0bSBpbXBsZW1lbnRzIHRoYXQuCj4gSG0sIGJ1
dCB0aGUgdmJ1ZiB1c2luZyB0aGUgQk8gb3V0bGl2ZXMgdGhlIHJlc2VydmUvdW5yZXNlcnZlIHNl
Y3Rpb24uCj4gVGhlIE5PX0VWSUNUIGZsYWcgYXBwbGllcyBvbmx5IHdoZW4gdGhlIEJPIGlzIHN0
aWxsIGFsaXZlLiAgU29tZW9uZQo+IG5lZWRzIHRvIGhvbGQgYSByZWZlcmVuY2UgdG8gdGhlIEJP
IHRvIGtlZXAgaXQgYWxpdmUsIG90aGVyd2lzZSB0aGUgQk8KPiBjYW4gZ28gYXdheSBiZWZvcmUg
dGhlIHZidWYgaXMgcmV0aXJlZC4KCk5vdGUgdGhhdCBwYXRjaGVzIDE0KzE1IHJld29yayB2aXJ0
aW9fZ3B1X3RyYW5zZmVyXypfaW9jdGwgdG8ga2VlcApnZW0gcmVmZXJlbmNlIHVudGlsIHRoZSBj
b21tYW5kIGlzIGZpbmlzaGVkIGFuZCBwYXRjaCAxNyBkcm9wcwp2aXJ0aW9fZ3B1X29iamVjdF97
cmVzZXJ2ZSx1bnJlc2VydmV9IGFsdG9nZXRoZXIuCgpNYXliZSBJIHNob3VsZCB0cnkgdG8gcmVv
cmRlciB0aGUgc2VyaWVzLCB0aGVuIHNxdWFzaCA2KzE3IHRvIHJlZHVjZQpjb25mdXNpb24uICBJ
IHN1c3BlY3QgdGhhdCdsbCBjYXVzZSBxdWl0ZSBhIGZldyBjb25mbGljdHMgdGhvdWdoIC4uLgoK
Y2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
