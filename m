Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A586D6C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 00:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915E06ECD9;
	Thu,  8 Aug 2019 22:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BB96ECD9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 22:51:49 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7ED8421773
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 22:51:49 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id s145so70248628qke.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 15:51:49 -0700 (PDT)
X-Gm-Message-State: APjAAAWo8QM1f27YbXRhB8JFRdCnMQoR043bL6z/sKZQnwY9BGv51+x+
 s9ZNnvdbde/w0raS2y0vbqOZaTdbJnN/oOIZSQ==
X-Google-Smtp-Source: APXvYqwbl/3VPMfI5y3PwG2THnJOA+RM7EdEeptDWTFIwfSk57LM3T+Yd81fZ13xvanJ+3+maiecJE8s+uVIpk4y0kM=
X-Received: by 2002:a37:a48e:: with SMTP id
 n136mr16013485qke.223.1565304708728; 
 Thu, 08 Aug 2019 15:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190808134417.10610-1-kraxel@redhat.com>
 <20190808134417.10610-8-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-8-kraxel@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Aug 2019 16:51:37 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+rqigmySoJg0iknkEJ5hzWeD3w2iSTpWoqoD67fGV3cw@mail.gmail.com>
Message-ID: <CAL_Jsq+rqigmySoJg0iknkEJ5hzWeD3w2iSTpWoqoD67fGV3cw@mail.gmail.com>
Subject: Re: [PATCH v4 07/17] drm/shmem: drop DEFINE_DRM_GEM_SHMEM_FOPS
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565304709;
 bh=8Pp17pXv2BsvdUGgrjCA+x6loADEC1HGz0lVc93J0rg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=06U/6nvMdcCkxw7UcbHXLjGLUFy4AtCl3ss9jAZ+s8AHXPinmRTOMcTOo59OHykyz
 NDe7Mf3FCFD0xA2VihjqBz2+9Gzh0S2MrDRCKUqGdaDbpNwQI3cKQrcdKw9UKGcfRT
 oJCXkcagX7UsGQTlExLl2pKFLNyApTCSDnYH2gJ0=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCA3OjQ0IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+IERFRklORV9EUk1fR0VNX1NITUVNX0ZPUFMgaXMgaWRlbnRpY2Fs
IHRvIERFRklORV9EUk1fR0VNX0ZPUFMgbm93LAo+IGRyb3AgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9kcm0v
ZHJtX2dlbV9zaG1lbV9oZWxwZXIuaCAgICAgIHwgMjYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jICAgICAgICAgfCAgMiArLQo+ICBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgfCAgMiArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vdjNkL3YzZF9kcnYuYyAgICAgICAgICAgfCAgMiArLQo+ICA0IGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCgpBY2tlZC1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
