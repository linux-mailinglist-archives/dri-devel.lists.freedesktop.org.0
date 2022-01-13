Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9E948D53E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 11:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E1710F145;
	Thu, 13 Jan 2022 10:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B11E10F145
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 10:14:34 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id e19so8896563plc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 02:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TkZGo4ib8VZZ8ihxuuV6YmzTOBkymNznVCB4ykbKHBg=;
 b=uODuKrRl1kYEThI/weFKqxAvCbXumiOqI9vUSZUZJXGstj2DtxeU5fADGwhPsjGE3F
 BOByd07tgtRdxlbSjo6q0kKfh3yhgF2D//MQ+HsUDDFpFasPJQjqoDUzGdpwyMPkR3vh
 WMKIaoGpV1SI8iMAY2uWbwhWDMNtji6KtkEe5Dsi5ppjmtxGSbd5tTY/FRN3RchIe6oN
 74abPUv1Cr62B4zACwpwvgkNhSNQFE6bQyR7VkCcYbAg0gswZblsr9iIcicwf6rj+ShS
 umE+eXieXXccy3jm4zcXhK1BXbRDuYG9DlUR6SvtC3tdZLWHnU/X+w5yySgkdCmUyoKA
 ePNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TkZGo4ib8VZZ8ihxuuV6YmzTOBkymNznVCB4ykbKHBg=;
 b=u3OO+VW/P+6GLWNmXbmPUEVtPxtr9dCyjfcxhb+UguJPkV4boj+VgItEvkxTAhd3zC
 +mlsBKKeH5jvAArmFFcQv2w8yUdE67oZH8RFuwciXqdKB+HVHLGRa3kERz5aXkVvR2Yi
 stZHEoXyrGS92lNOjc1mCrzTf14nhT0XY2GuT4T6zXfH+ulJ/QqmI2afhTQAk2zIiKRB
 b7piY4s1NSwUo8bUH64w+ZbmGA1eFn9FGdUrVE9Jf5WXqw5w+/4YV0A26gFKCYcLHIgY
 rsZ3tyb/yss/OWuUeWrM7EILGH8AL9NI5phNKv9VLv2D9yQNUpdQCEWRyUVshHYcgOu8
 acvg==
X-Gm-Message-State: AOAM531VZTL177N1W7JRKu91cfEDdDHZD7DXBE5vya7UhiKov+B2mA3N
 LEWtXVyzjS3sLXCdmmc+n8T7jgaTQ+P11F+2I1XBqg==
X-Google-Smtp-Source: ABdhPJyOJSTy7FXKwD4Q5dhcJsbga5MTLbhco1lMH1GPghjvgriT6iCmZrF2YwxQHVoWar3BhUS+RPW7JyVq1wUJV/g=
X-Received: by 2002:a17:90b:4b0f:: with SMTP id
 lx15mr4366831pjb.232.1642068873774; 
 Thu, 13 Jan 2022 02:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20220111034051.28913-1-lzmlzmhh@gmail.com>
In-Reply-To: <20220111034051.28913-1-lzmlzmhh@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 13 Jan 2022 11:14:22 +0100
Message-ID: <CAG3jFyuZQko8gj6NXnHQ2GoFNfHSYDwkgmb3Wi+upDZFZpPM4Q@mail.gmail.com>
Subject: Re: [PATCH] Remove extra device acquisition method of i2c client in
 lt9611 driver
To: lzmlzm <lzmlzmhh@gmail.com>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Thanks for submitting this cleanup patch.

On Tue, 11 Jan 2022 at 04:41, lzmlzm <lzmlzmhh@gmail.com> wrote:
>

A commit message is necessary for all changes, no matter how trivial.

> Signed-off-by: lzmlzm <lzmlzmhh@gmail.com>

Is your name listed correctly above? For the 'Signed-off-by' tag to be
meaningful, a real name needs to be supplied.

> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c    | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index dafb1b47c15f..e0feb4fd9780 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1090,7 +1090,7 @@ static int lt9611_probe(struct i2c_client *client,
>         if (!lt9611)
>                 return -ENOMEM;
>
> -       lt9611->dev = &client->dev;
> +       lt9611->dev = dev;
>         lt9611->client = client;
>         lt9611->sleep = false;
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 33f9716da0ee..e50e42312e82 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -860,7 +860,7 @@ static int lt9611uxc_probe(struct i2c_client *client,
>         if (!lt9611uxc)
>                 return -ENOMEM;
>
> -       lt9611uxc->dev = &client->dev;
> +       lt9611uxc->dev = dev;
>         lt9611uxc->client = client;
>         mutex_init(&lt9611uxc->ocm_lock);
>
> --

With these two issues fixed, please submit a v2 of this patch.


Rob.
