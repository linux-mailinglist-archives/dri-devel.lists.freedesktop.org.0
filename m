Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026174D19F3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 15:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA5810E06C;
	Tue,  8 Mar 2022 14:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3545510E06C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 14:04:26 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id u61so37937281ybi.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 06:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ztuy8VhVTaaw8Ilxr41jLiszCCDbp/SzK9cYm0UCZmU=;
 b=me7lBTWMjyab9fr0cxTAY81lZo+cHm694XLNEmD5jhegCxY6uQbWXpx5UCo2C4LUH8
 ctgFG+r3QAluGcdRvQIC6PoKQDzLqGapT5hwPe1kpUIt58umsTLmfSje2U8TM8PPUx3k
 75+P3yrEVFjv5YlN/UtN4JYH6nZiYrkylxa6w3OmJ36qfXmlaXeiemuNwgNUHHNSF8Q4
 IRTK8KfsIXmP/okRhFZ6okucVk/UJnFEa74RDvM5DchIBk94NYMa+mbchfCqZAJkIkbw
 JuFyA4YPjMLpQwQxbj+hUIHlOn1kNBAu5iV+VYOrhcZ8YCpTjDfsv56UgSwuLdYlP8TP
 XIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ztuy8VhVTaaw8Ilxr41jLiszCCDbp/SzK9cYm0UCZmU=;
 b=YPFgWiSASlb4st8PLlZDFBRrKCsYsbs9m69n4AHZWlIjgLGZq1nZIFeJ3MztLk6F5B
 JbbGTlm8IaKtC4O6g9ky+UvhTopdowqnztlP9HSdeDblQXYcJbq8GYu5LxNSOI/zcan+
 Ux+oKwwpYFcAGeMrmHHtob3tEtWUCC43fbq/zO61br60+uk0AyuoS3d0p+J+NuN8djcf
 W6VmH5bKRxOcg4ySNnABLHz7qtueGHpSzS04g3sn+3jzu6EJjneg097VSj+E7L3WzQMN
 rNhvvZuzbrlSH0HVZTujmjy28sgEz/NnLl0KXW6UyKiS5kkD/5YRezSBMYUvOfvWWGrN
 eKMQ==
X-Gm-Message-State: AOAM5302KW1h3oYyEuRfChimtOlPMM5P0UPFIuZ8zJr7DYgS29wtDl+H
 J3vmE0PdthonpkPgn0gD9WnGOpyQWMKpoDs59AkQgQ==
X-Google-Smtp-Source: ABdhPJw/jICR5t36ye8bP3B/l9rTbY4oei1RUuRxkwrS0Jj3llULUf6q6zkgPTpEoQRi2ubiZajn8QhRgVsXFd322Ms=
X-Received: by 2002:a25:ac98:0:b0:628:6e4b:66f0 with SMTP id
 x24-20020a25ac98000000b006286e4b66f0mr11867056ybi.28.1646748263827; Tue, 08
 Mar 2022 06:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-23-s.hauer@pengutronix.de>
 <bb077f34-333e-a07a-1fcb-702a6807f941@rock-chips.com>
 <CAPj87rO2sztocJrE-CeSQWry9j_cSe2uv9F1Yf81pGnBXdu2Ag@mail.gmail.com>
 <ae4314db-09c0-049b-ccc9-f6b1c3003dcb@rock-chips.com>
In-Reply-To: <ae4314db-09c0-049b-ccc9-f6b1c3003dcb@rock-chips.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 8 Mar 2022 14:04:12 +0000
Message-ID: <CAPj87rOanNE1wca3ijJx1zXYZkKX1ta9F145GCXM15Nv=POicA@mail.gmail.com>
Subject: Re: [PATCH v7 22/24] drm: rockchip: Add VOP2 driver
To: Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Mar 2022 at 08:42, Andy Yan <andy.yan@rock-chips.com> wrote:
> On 3/7/22 21:09, Daniel Stone wrote:
> > On Mon, 7 Mar 2022 at 12:18, Andy Yan <andy.yan@rock-chips.com> wrote:
> >> When run a weston 10.0.0:
> >>
> >>    # export XDG_RUNTIME_DIR=/tmp
> >>    # weston --backend=drm-backend.so --use-pixma --tty=2
> >> --continue=without-input
> >>
> >> I got the following error:
> >>
> >> drm_atomic_check_only [PLANE:31:Smart0-win0] CRTC set but no FB
> > Can you please start Weston with --logger-scopes=log,drm-backend and
> > attach the output?
>
> Please see the weston ouput here[0]

Are you running with musl perhaps? Either way, please make sure your
libdrm build includes commit 79fa377c8bdc84fde99c6a6ac17e554971c617be.

Cheers,
Daniel
