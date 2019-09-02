Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8A3A56EC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 15:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FEA896E7;
	Mon,  2 Sep 2019 13:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A128D896E7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 13:01:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y23so1698277lje.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 06:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5NR6SvqKZT8L7ZtanApWaNMwb/LKNTFMGGSxMB6t2dk=;
 b=m2xs27uMyp1lTomhxwca5EyJCIlq6EOgcw8VqMPJuTpulYup3YnEUnZqmUTjsu5osr
 VOkNf+DRNxcmmpn9D2sKGarxro1r15END7sqqs5SoJfWe9xa7XpYpXD8Uetwwi1KAeZD
 pfInAMDSNEjQNR+zeFWMGUIqATNt600EcYaQF4hGj+G4l7BAYL0itbb8kvrR12bokpr2
 0wdAZ/+jfTZPOuXGKNFS+O374XMneGoXpUnr0Czq3UoOxrSyA+sCyC8Y7wVLdlMBbbUw
 JUvhDQmh+NDfXYVgWoO/KL0JpYWSuGFX0mMAJ4wkE4a1a1jJIcL/tinGQhvLi4KyZar6
 vtUA==
X-Gm-Message-State: APjAAAVmq4kFkLX+KS/UwHN6vLUm5rdc3MY94qlVQduTduy8FUlc0kIr
 IY2YY9VNV2LplJnbMFDRfS0WjlzZpMk5HWQaF3oZzw==
X-Google-Smtp-Source: APXvYqxF27ULThXbJYCc6j0IIoVfgOfuo8St/uOkqnhFcc5aJJkkUk/jebNzy01Hbjqux/cfhiZnA41Nn6YMdw1FVf8=
X-Received: by 2002:a05:651c:28c:: with SMTP id
 b12mr16399878ljo.69.1567429300022; 
 Mon, 02 Sep 2019 06:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190823073448.8385-1-linus.walleij@linaro.org>
 <20190823073448.8385-5-linus.walleij@linaro.org>
 <CAF6AEGvPtoEfAsB0KSP3ydmHGTdwnnM--Ru+dUY+7EEpw_8v_g@mail.gmail.com>
In-Reply-To: <CAF6AEGvPtoEfAsB0KSP3ydmHGTdwnnM--Ru+dUY+7EEpw_8v_g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2019 15:01:28 +0200
Message-ID: <CACRpkdYVwBsr+_vpFPytYZ+432ofm50RWZcGPTVvm-vnXp57fg@mail.gmail.com>
Subject: Re: [PATCH 5/6 v2] drm/msm/hdmi: Bring up HDMI connector OFF
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5NR6SvqKZT8L7ZtanApWaNMwb/LKNTFMGGSxMB6t2dk=;
 b=bGuiQvFbYJWc9O7OONGeyRj9kfrDmMmvY/nKW221nA3ldxyh17lVPvcxl+/ltWNeXg
 jENWFnEjUX3HX5mWR4sBd4vwTZN8334r1qqD2Dmvv9JgSUm/LLekdNCq9rjSWoHF4xY/
 VDH0VIXtFW+rA1Sqb2VEakMkCmN4BsSi5LvumP88szkjYrIXLy+R+FSwzqlPWig4ohGK
 AOH4A1E8uf3g7Jg4wlGXZ8kEALQNREsvqAmPKLTLSJhPLp8IGS3r2nLGgpn5bMK9Vswe
 Pqrzl+dqNvqtb/Ie4ZtE1B6y2QNvW9f/fi1tgKgn8gwDmPOQTnP3OazT7cA2+UEfDi+H
 MFKw==
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMSwgMjAxOSBhdCA2OjI4IFBNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4gd3JvdGU6Cgo+IEknbSBwaWNraW5nIHVwIHRoZSBlYXJsaWVyIHBhdGNoZXMgaW4gdGhp
cyBzZXJpZXMuLgoKVGhhbmtzIGEgbG90IDopCgo+IGFsdGhvdWdoIEkgd29uJ3QKPiBoYXZlIGEg
Z29vZCB3YXkgdG8gdGVzdCBvbiBkZXZpY2VzIHdoaWNoIHVzZSB0aGUgaGRtaSBibG9jayBmb3Ig
YSBmZXcKPiB3ZWVrcyAod2hlbiBJIGNvbXBsZXRlIG15IG1vdmUsIGFuZCBnZXQgYmFjayBhIGJ1
bmNoIG9mIGJvYXJkcyB0aGF0Cj4gYXJlIGluIGJveGVzIHJpZ2h0IG5vdykgc28gSSdtIGdvaW5n
IHRvIHdhaXQgb24gdGhlIGxhc3QgdHdvIEkgdGhpbmsuCgpUaGF0J3MgZmluZS4gSXQgaXMganVz
dCBvY2Nhc2lvbmFsIGRyaXZlLWJ5IGNvZGluZyBhbnl3YXkuCgpZb3VycywKTGludXMgV2FsbGVp
agpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
