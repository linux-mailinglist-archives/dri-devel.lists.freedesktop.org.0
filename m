Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AB53EB654
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 15:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2A86E7E5;
	Fri, 13 Aug 2021 13:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44966E7E5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 13:54:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t9so20028589lfc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=otK/iMJZAO+WUnDkESkc3mIfvbccqZxXw7/cgOsKwuY=;
 b=q68p0V6YCcitFiRzJYs8VI8mus2v9tDpwSOhqnoaIDSg7LfkH0zLNiHj4gIcFdVYvQ
 6pdjylWQI5BaGuWgWjHZ5iMzfRiDEPBXSqhek8dE5WElyuuQYfmPQiwuEX4K9IdlMd/h
 ZRnDuzLR8U8r/otEDJNYndGrqUtXnOAliPlAUoRJThsn+BDTJX0USU6zKmftAO4Bccz3
 LQChesHq/80o4S4WFPSrfbXZNlJIY6rf9HfkZs7B1FEs39+7DiXkue84G5GLOw6ukWmf
 daz9pYwB2yrZ2d5XLgizi+FTaSpz3p0gJNiKb4n0TiEjynY4jcr2gA2RT7bF6JZYwnzc
 KAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=otK/iMJZAO+WUnDkESkc3mIfvbccqZxXw7/cgOsKwuY=;
 b=YZMFj2J6TvJLFb2/K4MbMjEceLu+ehl4y6g6FiVJleR94pk7qvsPJOmRKQWr/MDkAu
 RFmrOj96kPKe2e7WnbwLAvFFGJRYe0U+ZtxSvkG/8xyuiH6OaWX3tSrch4GkugJqzxYZ
 w/y2FAf7loBwqziax34achfPdI8uV8hUi36m1lr5efc6YayIF992LkLe+SCidkN9EBd/
 2FMwg7UlHKER7zyiKXjZBAfZqsXPS+tQzX7mmREaZ1Kc2xWSD9hW8r2YtxwUgB9canr2
 F/I0xtkdrqIqyy+efuDNH0jh+6X0zmhqIXGf8xuSVgrjNEq+50jAcZ5mwIgQ4e607Atw
 LhTA==
X-Gm-Message-State: AOAM531r6QMK94mrkocKPOMv9kTGnJprfFL3Wq1Q5j1IWnQxmJlECzdy
 +kzinyJE0XhCjxVCJZH2eFckc0jey0o9bWSh4rtuug==
X-Google-Smtp-Source: ABdhPJxme3U8eSdMjqWto+v2Z1XrKuaTSSrkpLdfLgEk06SuK1WGFzHCiMQBx5H30X5MFWZEaVZ2xe/VjuI/fkr1zX4=
X-Received: by 2002:a19:ac04:: with SMTP id g4mr1835348lfc.29.1628862877070;
 Fri, 13 Aug 2021 06:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <YQw7M7OF6OZLcLjk@ravnborg.org>
 <20210807133111.5935-1-markuss.broks@gmail.com>
 <20210807133111.5935-3-markuss.broks@gmail.com>
In-Reply-To: <20210807133111.5935-3-markuss.broks@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Aug 2021 15:54:26 +0200
Message-ID: <CACRpkdaGvd+47zwJ8pwAU_Ce2N7bmBBJe-UwKNTQ9gfxPsCd_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: s6d27a1: Add driver for Samsung S6D27A1
 display panel
To: Markuss Broks <markuss.broks@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Dave Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, phone-devel@vger.kernel.org
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

On Sat, Aug 7, 2021 at 3:31 PM Markuss Broks <markuss.broks@gmail.com> wrote:

> This adds a driver for Samsung S6D27A1 display controller and panel.
> This panel is found in the Samsung GT-I8160 mobile phone,
> and possibly some other mobile phones.
>
> This display needs manufacturer commands to configure it;
> the commands used in this driver were taken from downstream driver
> by Gareth Phillips; sadly, there is almost no documentation on what they
> actually do.
>
> This driver re-uses the DBI infrastructure to communicate with the display.
>
> This driver is heavily based on WideChips WS2401 display controller
> driver by Linus Walleij and on other panel drivers for reference.
>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>
> v2 -> v3:

Both v3 patches applied to drm-misc-next and pushed.

Yours,
Linus Walleij
