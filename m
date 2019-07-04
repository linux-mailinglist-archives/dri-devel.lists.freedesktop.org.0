Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2955FD62
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7942A6E3D0;
	Thu,  4 Jul 2019 19:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2816E3D0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 19:18:00 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id s7so14594973iob.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 12:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LCuBLDKrofsuoqhEiEo5+1hJatvhFnFN7oOLzAEnyM4=;
 b=UsUIJE1sT9P7xsuNfZU0ACbn/PkGFrbISlpgROyOo5ZOW0zhErvWfxg3/xIpEQehJM
 0ycIMNAVyWVz39veJne+fVQ1MAbDdo6yi7pgfskGf+JQE4fVudiLU5pCRH41Wtjc/VXY
 YAUzFVxKsi/EQT6tr4ehN3jTqOE0YWcK4n9JUMOCB2mR0K/36iDRnSo5HpDoN15lItvS
 /JzSMCZHOkNK6PD9aqQYdb9ftq8NwEHJ7aZwu+XDbbUlTLhb/fE1ZhrcPPvsLDnn8xNH
 NTJCn+dXC9Fq7bQZxzCh4dScVbRUO2NMTppqCE6AmRzNL30eWMm0xKFt5qmc/GE4/th2
 rzzA==
X-Gm-Message-State: APjAAAURacUaWlTmkTpRxI5JfWLViFcGeF8yR7ovicNWqf7rSAhzr7j6
 K7hb4siLar3/F70xTHBF+v0zR9u+2wGin4mNcXw=
X-Google-Smtp-Source: APXvYqwsruAsuCOPhI8PglL1hWlvCc+IVuPwdgdoadncDMpAGwAlFk4w01GWSPGzZlwU1IUEHNzB3abapsoIEw3vMZY=
X-Received: by 2002:a6b:6012:: with SMTP id r18mr5966278iog.241.1562267879466; 
 Thu, 04 Jul 2019 12:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
 <20190702141903.1131-7-kraxel@redhat.com>
 <CAPaKu7RfLoB=K__wQd92=S20Mt0uqsfyU9oigr8CQ-=gH6OUuA@mail.gmail.com>
 <20190704111043.5ubc2yjrjphj2iec@sirius.home.kraxel.org>
In-Reply-To: <20190704111043.5ubc2yjrjphj2iec@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Jul 2019 12:17:48 -0700
Message-ID: <CAPaKu7S4Og7kda2ZjFtuRv=_W8gpFbD5y7s==0JB5Z34S4Hsjw@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] drm/virtio: remove ttm calls from in
 virtio_gpu_object_{reserve, unreserve}
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LCuBLDKrofsuoqhEiEo5+1hJatvhFnFN7oOLzAEnyM4=;
 b=bhvxBO8QMlxGiuh/BsyudtWPQFUjQ5R9CUOpdTYaaqZyQ8vlvu/++aMUwi7JPKLthb
 TUMk35QeF5dolWl0Sim+RKa834/lE/WsTIuTlbDF0ehQm3t97BMJEahLPFrS4EXBmrvQ
 hGtjekw2DVmTrMgyT5cq43Ydrv1tI2BXhhH3cd0rbshvREhTgk+eN0E0HZlra+7rkBII
 JQEe1bSGSfbPaEhX75Miqqh4xtrQ3u9LzWU9zuiHUi3vu+v8zyPfDbrkdvRsfhQjXdI5
 jVqTZNVX15sFR7jJRcTntloFNUV9B9Y1sW8SJF4UfOj7XMQDbr6QIZ47Tbbb+X1jaXSp
 4BDg==
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

T24gVGh1LCBKdWwgNCwgMjAxOSBhdCA0OjEwIEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+ICAgSGksCj4KPiA+ID4gLSAgICAgICByID0gdHRtX2JvX3Jlc2Vy
dmUoJmJvLT50Ym8sIHRydWUsIGZhbHNlLCBOVUxMKTsKPiA+ID4gKyAgICAgICByID0gcmVzZXJ2
YXRpb25fb2JqZWN0X2xvY2tfaW50ZXJydXB0aWJsZShiby0+Z2VtX2Jhc2UucmVzdiwgTlVMTCk7
Cj4gPiBDYW4geW91IGVsYWJvcmF0ZSBhIGJpdCBhYm91dCBob3cgVFRNIGtlZXBzIHRoZSBCT3Mg
YWxpdmUgaW4sIGZvcgo+ID4gZXhhbXBsZSwgdmlydGlvX2dwdV90cmFuc2Zlcl9mcm9tX2hvc3Rf
aW9jdGw/ICBJbiB0aGF0IGZ1bmN0aW9uLCBvbmx5Cj4gPiB0aHJlZSBUVE0gZnVuY3Rpb25zIGFy
ZSBjYWxsZWQ6IHR0bV9ib19yZXNlcnZlLCB0dG1fYm9fdmFsaWRhdGUsIGFuZAo+ID4gdHRtX2Jv
X3VucmVzZXJ2ZS4gIEkgYW0gY3VyaW91cyBob3cgdGhleSBrZWVwIHRoZSBCTyBhbGl2ZS4KPgo+
IEl0IGNhbid0IGdvIGF3YXkgYmV0d2VlbiByZXNlcnZlIGFuZCB1bnJlc2VydmUsIGFuZCBJIHRo
aW5rIGl0IGFsc28KPiBjYW4ndCBiZSBldmljdGVkIHRoZW4uICBIYXZuJ3QgY2hlY2tlZCBob3cg
dHRtIGltcGxlbWVudHMgdGhhdC4KSG0sIGJ1dCB0aGUgdmJ1ZiB1c2luZyB0aGUgQk8gb3V0bGl2
ZXMgdGhlIHJlc2VydmUvdW5yZXNlcnZlIHNlY3Rpb24uClRoZSBOT19FVklDVCBmbGFnIGFwcGxp
ZXMgb25seSB3aGVuIHRoZSBCTyBpcyBzdGlsbCBhbGl2ZS4gIFNvbWVvbmUKbmVlZHMgdG8gaG9s
ZCBhIHJlZmVyZW5jZSB0byB0aGUgQk8gdG8ga2VlcCBpdCBhbGl2ZSwgb3RoZXJ3aXNlIHRoZSBC
TwpjYW4gZ28gYXdheSBiZWZvcmUgdGhlIHZidWYgaXMgcmV0aXJlZC4KCkkgY2FuIGJlIHdyb25n
LCBidXQgb24gdGhlIG90aGVyIGhhbmQsIGl0IHNlZW1zIGZpbmUgZm9yIGEgQk8gdG8gZ28KYXdh
eSBiZWZvcmUgdGhlIHZidWYgdXNpbmcgaXQgaXMgcmV0aXJlZC4gIFdoZW4gdGhhdCBoYXBwZW5z
LCB0aGUKZHJpdmVyIGVtaXRzIGEgUkVTT1VSQ0VfVU5SRUYgdmJ1ZiB3aGljaCBpcyAqYWZ0ZXIq
IHRoZSBvcmlnaW5hbCB2YnVmLgoKCj4KPiBjaGVlcnMsCj4gICBHZXJkCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
