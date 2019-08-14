Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E743E8E6BF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC726E90C;
	Thu, 15 Aug 2019 08:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B520B6E591
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:49:38 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id c15so16808576oic.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 03:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X3P5HD8zFs0OenSO+igXy3w9KtmPtkhkBINw7OrTEEo=;
 b=dBZBQiWudF6flyY4YcywgcRWDpHwWah4hZS+bYjJmCRGNoqa7sE9BFl8v2b/ZfhI2e
 DbLHwMnhyivH0HGNk78y19YVN84dZUw9nF/8jsqwfkgEPJHch4ii0lEuY9amFNeATYOP
 KPIRGpOfPFEp2xo9Bqef3Zki74hHITzar91wL7V1tIN+e51uvCbBfMWPfGGnPiI4WC02
 ilDSCfbnaN9UDKnQpZR6U0fbk83tWH/zZdENdkXps14ef7uxpsb6mMdZyxCrXgEz01za
 YgorXvuJqpHcOOuPd0KpTFLY9M8XjuciB8WJJAYgmm4ob/3R/EY7JW5/6wGanZjCOtgL
 WuCg==
X-Gm-Message-State: APjAAAU6dkBv2lXt9Xp1aLGWOoYSA/q0y9rQk9Vn9L1tTNtPG/PZsjJy
 dfvct0AaSTrsYz1twRKyRYuMoDuFIWT2HoG1qpPP2A==
X-Google-Smtp-Source: APXvYqx47KLEn+2zqAfX9CwXnDqbWR0RTlkz32o6QvlqLcG9QA5bQMFDNDn0S23xNxRR/2fXsHnK9Rq1WC7fz5opueU=
X-Received: by 2002:a02:3941:: with SMTP id w1mr2690863jae.91.1565779777645;
 Wed, 14 Aug 2019 03:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
 <20190813110300.83025-8-darekm@google.com>
 <41c95313-fe39-b201-5238-24df7e72879a@xs4all.nl>
In-Reply-To: <41c95313-fe39-b201-5238-24df7e72879a@xs4all.nl>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Wed, 14 Aug 2019 12:49:26 +0200
Message-ID: <CALFZZQHw+MJo-ZRKpJqZtFi2CZfuu6rs8LJ5hsXLHBD+ASrcYQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] drm: dw-hdmi: use cec_notifier_conn_(un)register
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=X3P5HD8zFs0OenSO+igXy3w9KtmPtkhkBINw7OrTEEo=;
 b=TCIzQeUwk2KLZtCaTvQK1OrgxfSroQuRzPuMFWXvWOElOPwgv2RKWoe64433uMxHNW
 bgreSS1YIUiNaMOzMSgX/uujzlDyjEKw/1v5hsx7E74JSV88PSJBF4FA56Ufnbkj9Ft6
 bu9hn4Omp9YVMId8YSQVEtcnn15506rdySM6A6SBnco9xZPZynfQSUGqFJ/F839Qspph
 UiQ8AR189rJsZsG2ieJ80VAhABMXDpMiDH2afzvYKQoyvwDpPcw8Sbg0BowqIAyFDKyR
 Z0fI06bVUcrodZon9YIB6NiSHg999sfjWqz6Giw3PR/SwY58iNzrR9W2rHQeMleBfhqr
 zSXA==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkuCgpPbiBUdWUsIEF1ZyAxMywgMjAxOSBhdCAxOjM4IFBNIEhhbnMgVmVya3VpbCA8aHZlcmt1
aWwtY2lzY29AeHM0YWxsLm5sPiB3cm90ZToKPgo+IFJ1c3NlbGwncyByZXZpZXcgY2F1c2VkIG1l
IHRvIHRha2UgYW5vdGhlciBsb29rIGF0IHRoaXMgc2VyaWVzLCBhbmQgaXQgbWFkZQo+IHdvbmRl
ciBpZiBjZWNfbm90aWZpZXJfY29ubl91bnJlZ2lzdGVyKCkgc2hvdWxkbid0IGJlIGNhbGxlZCBm
cm9tIGJyaWRnZV9kZXRhY2g/Cj4KSSd2ZSBzZW50IG91dCB2NyBvZiB0aGUgc2VyaWVzIHdoZXJl
IHVucmVnaXN0cmF0aW9uIGlzIGRvbmUgZnJvbSBicmlkZ2UgZGV0YWNoLgoKUmVnYXJkcy4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
