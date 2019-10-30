Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1765DEA3D4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 20:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BF96ECFE;
	Wed, 30 Oct 2019 19:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAC56EC54;
 Wed, 30 Oct 2019 19:09:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q70so3282428wme.1;
 Wed, 30 Oct 2019 12:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uYBiTBzZt5vgvU2mRqgnC6ae48T65098RS0JVybZs/s=;
 b=st4F4GWs4k2KWAWzPXNf23nI8rTBswopQQKH2YhSnUMSp+OKwVx+qIxF6UTPCfoQAb
 QB4b43kOfklxRJiLWlFJ4QiFQxD4Qmd1lF/nt0z0qCWfZHZ+kD3Uj7U9xVo8V/pevDRW
 1nLVp9lZiCM3r/7mu2TgcxshedLM10f2b/qZB3lMF5ZZxdLc7Cp+fy+jikWqOkX1kd+w
 i7SqyJpsEkvOTqBux8Yi+Xk1TtRutXs8CcBtvc4S25ml2U6tscepWaXJnPWkReyCwkUU
 OR8xE/r0+rWU44ooGVaB7RWFFreOZ3pGK7R+Bbh6e5Kd0KhLNmOzCLD+QbNq/iVVkSn+
 cM+Q==
X-Gm-Message-State: APjAAAVa5EYX+umohevT+wE47e6ddzFOmxrbOHF2/EWlEZGnp+G/4jFX
 yKLyqA6/SzxNIrXy+gA/BH/Vk2VZKKyBEPhEhvI=
X-Google-Smtp-Source: APXvYqy1ij+4I1Bx6v2W2ptYFfh5jfigzMHR682nMX26nuyY33Mtt7Jc4N/bGKLHG6e/DVfD8Vs0CkaXXBmohnUW7Fo=
X-Received: by 2002:a7b:c186:: with SMTP id y6mr1007516wmi.67.1572462542027;
 Wed, 30 Oct 2019 12:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191028060443.14997-1-madhuparnabhowmik04@gmail.com>
In-Reply-To: <20191028060443.14997-1-madhuparnabhowmik04@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Oct 2019 15:08:48 -0400
Message-ID: <CADnq5_PHHNYp-nfjsgRfeoaMEo+QeQD1-rtDpQhqdJeG7gMMVA@mail.gmail.com>
Subject: Re: [PATCH] Drivers: gpu: drm: amd: display: amdgpu_dm: amdgpu_dm.h:
 Fixed a documentation warning
To: madhuparnabhowmik04@gmail.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uYBiTBzZt5vgvU2mRqgnC6ae48T65098RS0JVybZs/s=;
 b=fIzW0cTv0OFE3KRoEXVVCnS4mqtonyrpX0B+jtwNkLE6FwBeqvYhUZza2h9TZ9bYqm
 tApeumreXyquaAVj0spMTUCUbbtC4adInjw6t3uIkwEy5cqYX22vfmqdMH5yM5Xp/8d/
 UN0NjxNlKlITH3a6GMCP3oXtwqarO6elrP9kKtPrpXeVZcC3LeWo4/S+H8Wq9JXma9HF
 eRroFUJslrY+g0nEQuqEUoqwOX0GgYENRZ4AI/rMx+9JOgFhFhltl2uVHKnLKwK9xco4
 ZrHscJ5STKJmh4Ye7L/bVFv/u86tKFWYogN64nCMgAX2jw9iz0UAun6i6wcHuwyGcQ7F
 G7gg==
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgNDoyNSBBTSA8bWFkaHVwYXJuYWJob3dtaWswNEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRodXBhcm5hYmhv
d21pazA0QGdtYWlsLmNvbT4KPgo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyAgd2Fy
bmluZzogSW5jb3JyZWN0IHVzZSBvZgo+ICBrZXJuZWwtZG9jIGZvcm1hdDogICAgICAgICAgKiBA
YXRvbWljX29iago+IGJ5IGFkZGluZyBhIGNvbG9uIGFmdGVyIEBhdG9taWNfb2JqLgo+Cj4gU2ln
bmVkLW9mZi1ieTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRodXBhcm5hYmhvd21pazA0QGdtYWls
LmNvbT4KClRoYW5rcyBmb3IgdGhlIHBhdGNoLiAgVGhpcyBhcyBhbHJlYWR5IGZpeGVkIGJ5IEhh
cnJ5LgoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmgKPiBpbmRleCBjOGM1MjVhMmI1MDUuLjgwZDUzZDA5NTc3MyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uaAo+IEBAIC0xMjgsNyArMTI4LDcgQEAgc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIg
ewo+ICAgICAgICAgdTE2IGRpc3BsYXlfaW5kZXhlc19udW07Cj4KPiAgICAgICAgIC8qKgo+IC0g
ICAgICAgICogQGF0b21pY19vYmoKPiArICAgICAgICAqIEBhdG9taWNfb2JqOgo+ICAgICAgICAg
ICoKPiAgICAgICAgICAqIEluIGNvbWJpbmF0aW9uIHdpdGggJmRtX2F0b21pY19zdGF0ZSBpdCBo
ZWxwcyBtYW5hZ2UKPiAgICAgICAgICAqIGdsb2JhbCBhdG9taWMgc3RhdGUgdGhhdCBkb2Vzbid0
IG1hcCBjbGVhbmx5IGludG8gZXhpc3RpbmcKPiAtLQo+IDIuMTcuMQo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
