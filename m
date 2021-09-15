Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF6C40CE7C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 23:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDE26EA49;
	Wed, 15 Sep 2021 21:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2E16EA49
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 21:00:41 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c8so9632704lfi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 14:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6051UbgrRMqDxiwjhzZkrwFi5IKkmuXa1gzwXfPNWkw=;
 b=V9NRrB2CS1yeigqK9Ue6Dtwu1U6p2jRsXG+HSc0iLZA6dsDHxkcqMA9s8nU/IAI5du
 TUzkThscVDc4LqTE0D4bNdDMJnI39D4Cvv4pin63v/fGhIgvWapPi8fM1PJ+dzbsjAJn
 4CuWWXQxZz2acwXCDbCtSfNxiAMJys+bcXLvzBz9zQWUxyV+TudQpal5XXhPQa1xysjz
 og8Ri3Hx5q3ohoNhs7msnZO3P3n63Y++vMD+ITHHGxK0DO984wKzDmfp3wcR3WghBEYB
 OUdF15j4QfzV/LVEk63ATcGIgYiomSE3zSd5hdR13ROBBRgE24iAi4MurR5fh9xiVHKa
 CPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6051UbgrRMqDxiwjhzZkrwFi5IKkmuXa1gzwXfPNWkw=;
 b=5mISH6NnD6wV07QEXEHdwHHEdHAn2dlCCR2Qqxp/clZ/E2/L3dRtWD9beH5FbXAbVs
 BJ8k//2A2+v9sCUdn9GOQQvTg9fjeScB8hq05CAP46nGXNzVRTUMKQkUN2fXvCfsTs9T
 OmQel9Zn/HbDNRoXaoyDwlT3X1TBrOpVuIyi8K3hn+lqixe0+c4xvNIcQUzOuLPZHZAq
 2vjA2oPKldw2ze99NQ8GAHt/4b71oVQ/yEfNTHAStu6ZEqMJ2wXKOu3vmyoTH9mC1yfO
 XjV5UiPDVA4JUM+8vILLwT1GJ9vrE2VEH3EgvnWvWWPtKSsq2/aGfOLHBkzH0NJcVW0h
 8+3A==
X-Gm-Message-State: AOAM532VE3ALKXJA34h0jbWgNP6hu+SZt/x/yH6BptR9DvkdrfWT3Ogx
 Ja8m/hFcCE6pt+kxs2k56XNjTBgn6MJNP4uAQS8=
X-Google-Smtp-Source: ABdhPJzwTh8ZGukPXzZsfLlsL05t09qPNouVPdAoTX8yDhkINktq09DsX8rU+3tF3qfGORyB1CbOY+VDqpFMaB7eJX8=
X-Received: by 2002:ac2:5d49:: with SMTP id w9mr1379832lfd.450.1631739639394; 
 Wed, 15 Sep 2021 14:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.3.Ibf9b125434e3806b35f9079f6d8125578d76f138@changeid>
 <CAE-0n51JFM_yYdOsCQyvdMw5xXJ7REcbOJC6qi=6nfiNcdvnWw@mail.gmail.com>
 <CA+cxXhn-gLt37oyEq3wSh3qf=UkY=H6fY3ahC=gyhKhGwu_dXw@mail.gmail.com>
In-Reply-To: <CA+cxXhn-gLt37oyEq3wSh3qf=UkY=H6fY3ahC=gyhKhGwu_dXw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 15 Sep 2021 18:00:27 -0300
Message-ID: <CAOMZO5B_J29npC+yu2freuwNLjKAmwas7gVaB6qRabAmVWy2KQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Philip Chen <philipchen@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 15, 2021 at 5:41 PM Philip Chen <philipchen@chromium.org> wrote:

> As regmap_read() should always read 1 byte at a time, should I just do:
> regmap_read(map, PAGE0_SWAUX_RDATA, (unsigned int*)(buf + i))

There is also regmap_bulk_read() if you need to read more data.
