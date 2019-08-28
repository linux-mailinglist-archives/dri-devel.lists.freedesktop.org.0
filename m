Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F01A132A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD616E027;
	Thu, 29 Aug 2019 08:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11C089B61
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 12:38:15 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id x4so5381815iog.13
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 05:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z9ub6dj8BakJd5JJrKLeLyNZnt+cLi7XQzPxfXn1B/Y=;
 b=KP5mSEqI7upnrmG1+LgasKEgsY+fu+zlbImSTkQcdnYP9m4FpK5k7cBSFNTbcOW6+i
 8Os84CPQHRI7DGqtJeGAk2VB/bYTUK1r+s79snbhtz8rGUvqStH1dhTEwf2b/aGx6wVl
 85wKdxhEtq+VvhKx2b6pVz7TwQ7A7D0AUpfMnLs58hBu/KiPLoLdv0EdORAh/mOvmuC8
 W+eH+xmYRerCzikPd/qeGXiijDmAp8dLbqLzXux8zT4Ywuxy0okWdE/YPslAHUckOZZ6
 tf8AhEJcYsM15snmrsPI3DVJ53zESKvA2dWvFIcOJN/5v7GeMNItboar7oVwAFicFgV7
 BH3g==
X-Gm-Message-State: APjAAAXI5NXTBlR/MfuDtW9o75CsPKBseh3tAQIitvPvlZVgF2hN5gCI
 C8/HpAvfKfRLnt1Q1Rw5MVsEnssNoQJKJZ9wjw1zyQ==
X-Google-Smtp-Source: APXvYqxbmqQHdWluIFStqQGMBY9/BhbwVz+UeYCfBFj2T06LLlJsyfJiSeDsrC/N2EuGpd3vnE0wVob9VErTw280+4w=
X-Received: by 2002:a02:3446:: with SMTP id z6mr4201108jaz.105.1566995894846; 
 Wed, 28 Aug 2019 05:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
 <CGME20190814104630epcas3p44755443f37e78b2613f7dda35d71bb71@epcas3p4.samsung.com>
 <20190814104520.6001-10-darekm@google.com>
 <6bbfb6f8-15c2-9ad2-8857-898f4c6435a3@samsung.com>
In-Reply-To: <6bbfb6f8-15c2-9ad2-8857-898f4c6435a3@samsung.com>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Wed, 28 Aug 2019 14:38:02 +0200
Message-ID: <CALFZZQHZrVSaKhTSH6suOc0epMQzcgxAHddoJGxvtdhSp1tW0Q@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] drm: exynos: exynos_hdmi: use
 cec_notifier_conn_(un)register
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=z9ub6dj8BakJd5JJrKLeLyNZnt+cLi7XQzPxfXn1B/Y=;
 b=ol+VAJf+uEe+pW+OLeIh97TD4/T+F5ti0j1SOXt8p3g3+9AxRgrzHA2mKJ5vaZU8VN
 Mtw2wgGYnnDXzVmxqToGtF2nfMvHrJsaRTKUm6NFeBvnBEL/AE1VgB2U4A+TnFgGlFJv
 N3OutN+gjpK3Rrv6OQryvih8Y47Q1kTDwWl9GUwd8SvcwKziaGAnwe7nyHPNsvpwQUma
 IX11hff05i2Q3HWy3nNHliuIoVJgJZC4rPy7abvo469srBQp9xh3rCEfMD2lAM1jknIq
 8/zI0DqvJJeFJiUb98QaHvF8wwP/1clSTYqlKYm6UCHQpY3oSvVrXFAXBEEbPpXvHWuI
 boiA==
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
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkuCgpPbiBXZWQsIEF1ZyAyOCwgMjAxOSBhdCAxMDozOSBBTSBTeWx3ZXN0ZXIgTmF3cm9ja2kK
PHMubmF3cm9ja2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gbml0OiBJIHRoaW5rIGVycl9ycG1f
ZGlzYWJsZSBvciBlcnJfcG1fcnVudGltZV9kaXNhYmxlIGNvdWxkIGJlIGJldHRlcgo+ICAgICAg
bGFiZWwgbmFtZXMuCj4KU3VibWl0dGVkIHY3LjEgd2hpY2ggcmVwbGFjZXMgZXJyX3J1bnRpbWVf
ZGlzYWJsZSB3aXRoIGVycl9ycG1fZGlzYWJsZS4KClRoYW5rIHlvdS4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
