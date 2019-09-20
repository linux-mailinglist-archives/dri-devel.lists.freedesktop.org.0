Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF2CB885A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 02:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7BC6F556;
	Fri, 20 Sep 2019 00:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6176F556
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 00:11:22 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id q64so5287358ljb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 17:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2QirEQc5qlamFBqqvxkVBnRarU/sj3bjs59u63W/8Eg=;
 b=ais4CwvmtanaJjAH8Hy6l27dr3tYiBzGT1hklxmQ0aAy/QKYvKzx+yb2AFdOuUAVGd
 3LGLq+rc41PybO43k+lWDEnpbNUn57fyl5n3rwS1ZIzXEIxddo3HerdJC6epNGDRVv+2
 EDDRaYPmG15T0/C8GnOrFbv6ymdN5hLJQh1dSjgsmC6iYHMAybtca2pq9dKDXlVqZkhb
 DGuJGboxq9BDAJvgkhKO+mhwr6YbKIFkgqHRigJzgFEiF2O+J6nyRhWGo5L8zRK8qWi+
 Hizl96XpsrbM3EdxNNmbI+NwisLxv39OkW9HK0eBRLun4bdXaC66SxonkoIDnyaopng3
 xLtA==
X-Gm-Message-State: APjAAAXjjFm6XdpBq0DVEquuex4umNRl0UbVvJq5C7T59mxVrgyab5fo
 tJ0YQNuGQYil5E3G2O1fecpAhoFSHXPvh7NGM2s=
X-Google-Smtp-Source: APXvYqwySQBYWwyYZO8gF/0MYjFDLzMMeCGJIZyA0GeH0w63lVsIG0gF26wesF4EguvkavYeQxrt2HdHGcNDRXhw8FE=
X-Received: by 2002:a2e:9708:: with SMTP id r8mr6797597lji.58.1568938281104;
 Thu, 19 Sep 2019 17:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txTjip6SonSATB-O38TGX9ituQaw+29PnAkNJ960R1z6g@mail.gmail.com>
 <CAHk-=wjHDrmx+Rj+oJw5V4mfWjpYzpwcJbqY-L-nvsNW_d8e_g@mail.gmail.com>
In-Reply-To: <CAHk-=wjHDrmx+Rj+oJw5V4mfWjpYzpwcJbqY-L-nvsNW_d8e_g@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 20 Sep 2019 10:11:09 +1000
Message-ID: <CAPM=9tzLFenqZQo_NQqKd5xPQ5g-5WY+JxTotL7AHk_+6S89ow@mail.gmail.com>
Subject: Re: [git pull] drm tree for 5.4-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Alexandre Courbot <acourbot@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=2QirEQc5qlamFBqqvxkVBnRarU/sj3bjs59u63W/8Eg=;
 b=LYxfejZOKW0piBxjokV7xP7MYnIEo2xpdVM8iwR8MuqG5goR+tjWkPo9hmpeR9rgPA
 VGl6j/WtDdCFJhjGvMYx1BO7MZ/BPNJQPD+GeQ0mnlxtL1p/2lR8UlhRdy9IwgC+rvny
 LcFHaYuW83/7yAlmN38bnVXUOUGbxKeVIcfAg9pQyRel3d7pUp+K6mTtDDpqdyPuqffC
 gQAVcwoQGGIOl97lImxNESJOUklXk/nPITTQ1CED+EqDxBZEIdNOKJ6wpJrV69XtieAV
 U4pBWv0YOWYzYUc0t+gipYOgNuAW+QJGDXa5u7kBcAmSUhYi0OEAo6lhLxoNyGuBBhBv
 Glhw==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBIbW0uIE15IG1lcmdlIGlzbid0IGlkZW50aWNhbCB0byB0aGF0LiBJdCdzIGNsb3NlIHRob3Vn
aC4gRGlmZmVyZW50Cj4gb3JkZXIgZm9yIG9uZSAjZGVmaW5lIHdoaWNoIG1pZ2h0IGJlIGp1c3Qg
ZnJvbSB5b3UgYW5kIG1lIG1lcmdpbmcKPiBkaWZmZXJlbnQgZGlyZWN0aW9ucy4KPgo+IEJ1dCBJ
IGFsc28gZW5kZWQgdXAgcmVtb3ZpbmcgdGhlIC5nZW1fcHJpbWVfZXhwb3J0IGluaXRpYWxpemF0
aW9uIHRvCj4gZHJtX2dlbV9wcmltZV9leHBvcnQsIGJlY2F1c2UgaXQncyB0aGUgZGVmYXVsdCBp
ZiBub25lIGV4aXN0cy4gVGhhdCdzCj4gdGhlIGxlZnQtb3ZlciBmcm9tCj4KPiAgICAgM2JhZWVi
MjE5ODNhICgiZHJtL210azogRHJvcCBkcm1fZ2VtX3ByaW1lX2V4cG9ydC9pbXBvcnQiKQo+Cj4g
YWZ0ZXIgdGhlIGltcG9ydCBzdGF5ZWQgYXJvdW5kIGJlY2F1c2UgaXQgZ290IHR1cm5lZCBpbnRv
IGFuIGFjdHVhbGx5Cj4gbm9uLWRlZmF1bHQgb25lLgo+Cj4gSSB0aGluayB0aGF0IGJvdGggb2Yg
b3VyIG1lcmdlcyBhcmUgcmlnaHQgLSBlcXVpdmFsZW50IGJ1dCBqdXN0Cj4gc2xpZ2h0bHkgZGlm
ZmVyZW50Lgo+Cj4gQnV0IHRoZSByZWFzb24gSSdtIHBvaW50aW5nIHRoaXMgb3V0IGlzIHRoYXQg
SSBhbHNvIGdldCB0aGUgZmVlbGluZwo+IHRoYXQgaWYgaXQgbmVlZHMgdGhhdCBkZXYtPmRldl9w
cml2YXRlIGRpZmZlcmVuY2UgZnJvbSB0aGUgZGVmYXVsdAo+IGZ1bmN0aW9uIGluIHByaW1lX2lt
cG9ydCgpLCB3b3VsZG4ndCBpdCBuZWVkIHRoZSBzYW1lIGZvciBwcmltZV9leHBvcnQKPiB0b28/
Cj4KPiBJIGRvbid0IGtub3cgdGhlIGNvZGUsIGFuZCBJIGRvbid0IGtub3cgdGhlIGhhcmR3YXJl
LCBidXQganVzdCBmcm9tIGEKPiAicGF0dGVybiBtYXRjaGluZyIgYW5nbGUgSSBqdXN0IHdhbnRl
ZCB0byBjaGVjayB3aGV0aGVyIG1heWJlIHRoZXJlJ3MKPiBuZWVkIGZvciBhIG10a19kcm1fZ2Vt
X3ByaW1lX2V4cG9ydCgpIHdyYXBwZXIgdGhhdCBkb2VzIHRoYXQgc2FtZQo+IHRoaW5nIHdpdGgK
Pgo+ICAgICAgICAgc3RydWN0IG10a19kcm1fcHJpdmF0ZSAqcHJpdmF0ZSA9IGRldi0+ZGV2X3By
aXZhdGU7Cj4KPiAgICAgICAgIC4uIHVzZSBwcml2YXRlLT5kZXYgIGluc3RlYWQgb2YgZGV2LT5k
ZXYgLi4KPgo+IFNvIEknbSBqdXN0IGFza2luZyB0aGF0IHNvbWVib2R5IHRoYXQga25vd3MgdGhh
dCBkcm0vbXRrIGNvZGUgc2hvdWxkCj4gZG91YmxlLWNoZWNrIHRoYXQgb2RkaXR5LgoKSSd2ZSBj
YydlZCBBbGV4YW5kcmUgd2hvIHdyb3RlIHRoZSBpbXBvcnQgaGFsZiBvZiB0aGlzIGNvZGUgdG8g
bG9vayBpbnRvIGl0LgoKSSd2ZSBsb29rZWQgYXQgdGhlIG90aGVyIHJlc3VsdHMgYW5kIGl0IGFs
bCBzZWVtcyBmaW5lIHRvIG1lLgoKRGF2ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
