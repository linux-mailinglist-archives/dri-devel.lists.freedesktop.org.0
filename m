Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BF571288
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD436E02F;
	Tue, 23 Jul 2019 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0300899F3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 06:30:03 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z3so79517532iog.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 23:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j31K/zZs/r0C+pUWsqptIpZI42gK74CrCWxKrCU84XI=;
 b=U+uATOLnQzXs//vfMrtfg/LmqHFu+fa0JDGQGCuM4rAmL8oyJ7nrXumYk8WZyzr11x
 WP8fY2F1u9xurjfUn/ugeSqWwE9wygrp5FGSyX9C2LujQoaIwAbc54Cye8c+LRy+QEFv
 5LwOjnQoojBRQ7Rrj/bdAj2/S2WTZx3Zvm3aHO279d6vrBKARiZY142KZ8jyexEr2i3g
 MgjuOatzTaTKmDN2/tskAyUgZrsHHLJ3AdbLUwefd7EjDAwYleZ7+1gJy3kj6dI1lLd6
 X4dJpYEqpF5/nujXN7w/EwWO4votxFERBZF/jbbte0tZHHFYz2rf9lTmA4HRBWdk3biI
 /E1Q==
X-Gm-Message-State: APjAAAXbncDqQK6702c0KY3DKogQL5lhbUul7F9wVBO5H0/wxK4VVrpN
 EBbm4xlh8OI0tzVDWyyRKJ+1b80yIpIlvYzth5s=
X-Google-Smtp-Source: APXvYqyvfBNIqjWIKreeMWxm6LxZ+e3NprufUy8Guv6wiY3P0Y5Y92XxFkqxlQycu+lO//vYesMKWVBa1nEhSzksv28=
X-Received: by 2002:a02:c916:: with SMTP id t22mr21391578jao.24.1563863403112; 
 Mon, 22 Jul 2019 23:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150302.29526-1-brgl@bgdev.pl>
 <20190722150302.29526-8-brgl@bgdev.pl>
 <20190722160908.GZ9224@smile.fi.intel.com>
In-Reply-To: <20190722160908.GZ9224@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Jul 2019 08:29:52 +0200
Message-ID: <CAMRc=McGTk+i0SzWN7AvGu3deYbXX_rJX=7+dKRpKFPKM_qxDA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] backlight: gpio: use a helper variable for
 &pdev->dev
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j31K/zZs/r0C+pUWsqptIpZI42gK74CrCWxKrCU84XI=;
 b=N8Pla93TcEziqi3X9Xjj4jVFB6FXqFhyq+3mUxlpciUlrARDlvGyjeKc8SeQnuargV
 FN6ErDmNUCoDrH38zU3JHuoPpuMAZNLdPp31tlj7ewshoZqqtBcK4IcRQdbsI1CnMMnf
 5hA4bFDG/lArM1NQncuEu6rCSt6B3ndlw72yX0NSAbnaljYkk7CEAllPFu0SIId5I1sR
 U4Gz0rRgvvvgcQ0Z2hH1/E5sC3rwRaUiZNNJSe6iPAruMUZ1eoSTZcqyBloG9heNAprb
 mq31Yh74BQ+6PWAPc/rKE5g3B2XGRnySLEyQi2Wwan8kv19qIdLhvRoPKkKlTaKDka6Z
 z+Ew==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-sh@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cG9uLiwgMjIgbGlwIDIwMTkgbyAxODowOSBBbmR5IFNoZXZjaGVua28KPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4gbmFwaXNhxYIoYSk6Cj4KPiBPbiBNb24sIEp1bCAyMiwgMjAx
OSBhdCAwNTowMzowMlBNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJv
bTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiA+Cj4g
PiBJbnN0ZWFkIG9mIGRlcmVmZXJlbmNpbmcgcGRldiBlYWNoIHRpbWUsIHVzZSBhIGhlbHBlciB2
YXJpYWJsZSBmb3IKPiA+IHRoZSBhc3NvY2lhdGVkIGRldmljZSBwb2ludGVyLgo+Cj4gPiAgc3Rh
dGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ID4gIHsKPiA+IC0gICAgIHN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhICpw
ZGF0YSA9Cj4gPiAtICAgICAgICAgICAgIGRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7Cj4g
PiArICAgICBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZvcm1fZGF0YSAqcGRhdGE7Cj4gPiAg
ICAgICBzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMgcHJvcHM7Cj4gPiAgICAgICBzdHJ1Y3Qg
YmFja2xpZ2h0X2RldmljZSAqYmw7Cj4gPiAgICAgICBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdi
bDsKPiA+ICAgICAgIGVudW0gZ3Bpb2RfZmxhZ3MgZmxhZ3M7Cj4gPiArICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXY7Cj4KPiBDYW4ndCB3ZSBkbwo+Cj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlIGRldiA9
ICZwZGV2LT5kZXY7Cj4gICAgICAgICBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZvcm1fZGF0
YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7Cj4KPiA/IEl0IGZpdHMgODAgbmljZWx5
Lgo+CgpJTU8gaXQncyBtb3JlIHJlYWRhYmxlIGxpa2UgdGhhdCB3aXRoIHRoZSByZXZlcnNlIGNo
cmlzdG1hcyB0cmVlIGxheW91dC4KCkJhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
