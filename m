Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFAE2E7AC7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Dec 2020 16:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454D289807;
	Wed, 30 Dec 2020 15:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F2089807
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 15:55:52 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id e20so8728230vsr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 07:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7slKsDIdzR3Cjv1U1zSaDNq2UnX9ACN/O5uP+fwyS8g=;
 b=fDy9TS/NzqeyDF6mJH+EOgn02vlIYtXQYBYzdAkQAYR4NMPG6BdUH13BgK1J/IrcJs
 GeilsCzgGs03Znnv5oUcIrqORvrcsSGhbF9emVedWxynbZEshQUcqzzPx7Qo+4okfI0P
 Zi6QiBxP0LInI5FQninsiWxtmVTfOJYbaYGkqBGIA3Ww2iXT1ZdU0AuMEfDhsLcpWt6C
 GtVXp/mdBHQprBnXRl0+C8l4/2w86O/wvYqE8+m3nrHQ7/yd7NMFAxUXSTqGj0QGyNgO
 Ll2ch3JnjIm5IZo4RcNQcwfLJLElFOJ1aN/SYXZiPJh4IE0YkpeRpVw4RQrluLC+mdH2
 VCNA==
X-Gm-Message-State: AOAM531S1DEdMar77Y003RJwOHb4UVC4slyvK1n7hbf1qtn0G5JFH593
 FerHLzGPYWltWpAqP+5BA9aTn84SOVABBScoBIo=
X-Google-Smtp-Source: ABdhPJxQ667QoadK4vclI1VRhQKKRhBcCBhLhFrtOb5+/iMQATJjcyWcT9iXCGyner7hsTPYRV+d8VgX0OxvfhLG7Co=
X-Received: by 2002:a67:f601:: with SMTP id k1mr34657600vso.46.1609343751601; 
 Wed, 30 Dec 2020 07:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20201230080841.488345-1-lichenyang@loongson.cn>
In-Reply-To: <20201230080841.488345-1-lichenyang@loongson.cn>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 30 Dec 2020 10:55:40 -0500
Message-ID: <CAKb7Uviq6rUyAOL9wPgJ1HLZnmp4zXVUDxtYK+4V+X9d3D-==A@mail.gmail.com>
Subject: Re: [PATCH] drm/loongson: Add DRM Driver for Loongson 7A1000 bridge
 chip
To: Chenyang Li <lichenyang@loongson.cn>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 30, 2020 at 6:08 AM Chenyang Li <lichenyang@loongson.cn> wrote:
> +       switch (format->format) {
> +       case DRM_FORMAT_RGB565:
> +               lcrtc->cfg_reg |= 0x3;
> +               break;
> +       case DRM_FORMAT_RGB888:
> +       default:
> +               lcrtc->cfg_reg |= 0x4;
> +               break;
> +       }

How does the scanout engine distinguish between RGB888 (24-bit) and
XRGB8888 (32-bit)? You've listed both as supported below.

Cheers,

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
