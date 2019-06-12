Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E2841E18
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 09:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8BC89385;
	Wed, 12 Jun 2019 07:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E441589385
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:44:05 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id b11so11281006lfa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 00:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FJx8u6P0hBbbSm0i3xS5/ivknGurjcnK61cV5tUoLhs=;
 b=UHJX7aGiTW3qTGfRmCNoMarIE57FqsPlSTxEoElec0+O5Ji0kq5aG2XEzdNDuvDE7L
 MU4vpRFNeXMPnc6cyjTvsRugjfED58pEQSCXN1YhzGqlyXBZj4R0XS12opdccUm1By4T
 zsnyiPdCPhSahNCLA+WZJXarWMr514zBmYAGPj0YyuDJK/gF9DmHaBbsI8T0TuD4WtWJ
 7grjHGHpnmcG9Mohq74E61XdvvymTh+etjBstfXiRwVDhHISyZwhREplGuARfXH2qLEQ
 9x34lS5vOKeZ0Nw7k1YEMUuX+yP6PV6R84lh6xdmd8WHMDqCeru0+FS0eyAixU/TJ4zi
 HQyQ==
X-Gm-Message-State: APjAAAUxizqlsFrQFcSARBe/QRA2bEQRYWb8FKeYswVxotX0JKJeT3ou
 z0X45p/tYoWNgYivivyJXccIEiUyU7PE1SzFTeM=
X-Google-Smtp-Source: APXvYqxF6hhnbaCtmV+hKyaw3zTnE02ygJ/YA3cG2hs70YnjKeXj++vsLZQrdyYYnQUsSMeN7rVTULCGrRiNHPpf3Fk=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr32791062lfk.20.1560325444170; 
 Wed, 12 Jun 2019 00:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-8-jacopo+renesas@jmondi.org>
In-Reply-To: <20190606142220.1392-8-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jun 2019 09:43:51 +0200
Message-ID: <CAMuHMdVxm8KcYr3EebKJ-DFeuE3=UW_yNvTMBbV7c6DyGr6HyQ@mail.gmail.com>
Subject: Re: [PATCH 07/20] clk: renesas: r8a77990: Add CMM clocks
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com,
 David Airlie <airlied@linux.ie>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gNiwgMjAxOSBhdCA0OjI1IFBNIEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4gd3JvdGU6Cj4gQWRkIGNsb2NrIGRlZmluaXRpb25zIGZvciBDTU0gdW5p
dHMgb24gUmVuZXNhcyBSLUNhciBHZW4zIEUzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1v
bmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgoKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CmkuZS4gd2lsbCBxdWV1ZSBpbiBjbGst
cmVuZXNhcy1mb3ItdjUuMy4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
