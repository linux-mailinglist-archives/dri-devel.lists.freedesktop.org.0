Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713451EB2B5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 02:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824A96E106;
	Tue,  2 Jun 2020 00:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EF16E106
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 00:31:07 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id c1so1015407vsc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 17:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ar4idMl8Pg6YhDwrxos+Hnu0lsoDCZ1LAm7LlTZuJVQ=;
 b=Ur8gLiJIlhsUZs6Gpnezf+6+nWzjf6bpkkB0LT0BS2fU4GcjFFe2817t4BZH1iYUFo
 4UvJgO53e22SnE9KUYnvMM9j2/28kH/7npQXvtssdBk7S/QPtvYLam780vUJA4WYMc/1
 FM2codHXl7uwoT6PJO3jvMkOUBIgZ32zkW8L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ar4idMl8Pg6YhDwrxos+Hnu0lsoDCZ1LAm7LlTZuJVQ=;
 b=SeCOJCZ0ZGHcoVG6GjSY4S9NU2JaoJF+mRVq5sKiyDbxzTk2ONDyVmVtbWZ+ojlpqP
 GglV00JdLb3i7km3KOv/QS+7lvicKEiia96a5Ba9lS1enpK1c8yXAJOKSyw0UH5/F++j
 npinraXFxKmrx2JHwftaaf3qwmE8ZZvAD5sUUDMeWtEfHmQoSc/N7PY95BHxwMnO9ngo
 23BVeonfx6aShRAOTvFo3Go/YA6b3kgxAPI1jivDkyO5RzKjhVUbGi3BgAND/3Avclbd
 rWq7jEhLODB1mIRq7nZ7x3yTn35G1LeRgz4RE4K5T55j+ot3vYFYvBmSXCC3o6wDxIC1
 G0dw==
X-Gm-Message-State: AOAM530EMQc2JD1prOmBABqbTSu9aGm0vmLQH7fQArRg4HSOTF+FsMcS
 +6R7/SmCfnSG6EC3NuNzFd8MtryxLFU=
X-Google-Smtp-Source: ABdhPJxisic0Md7AAC4wF6NP1dlCBSSx3U4XngCKh4EU+G+Px340tPxn2L31LckNvQQNZ2pnklrE7Q==
X-Received: by 2002:a05:6102:22ca:: with SMTP id
 a10mr15905314vsh.152.1591057866102; 
 Mon, 01 Jun 2020 17:31:06 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47])
 by smtp.gmail.com with ESMTPSA id w64sm182424vke.46.2020.06.01.17.31.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 17:31:05 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id k13so1013160vsm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 17:31:05 -0700 (PDT)
X-Received: by 2002:a67:b14b:: with SMTP id z11mr15793449vsl.109.1591057865161; 
 Mon, 01 Jun 2020 17:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200601083309.712606-1-sam@ravnborg.org>
 <20200601083309.712606-5-sam@ravnborg.org>
In-Reply-To: <20200601083309.712606-5-sam@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Jun 2020 17:30:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyErT-M=g74vyFjYHNQw9xj7ny_czHhjtUQbTDJUAjag@mail.gmail.com>
Message-ID: <CAD=FV=WyErT-M=g74vyFjYHNQw9xj7ny_czHhjtUQbTDJUAjag@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm: panel-simple: add Hitachi 3.5" QVGA panel
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 1, 2020 at 1:33 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> This panel is used on evaluation boards for Atmel at91sam9261 and
> at91sam6263.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 8624bb80108c..25c96639631f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1813,6 +1813,32 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
>         .connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>
> +static const struct drm_display_mode hitachi_tx09d71vm1cca_mode = {
> +       .clock = 4965000,

This is the pixel clock in kHz, right?  So it runs at almost 5 Terahertz?


> +       .hdisplay = 240,
> +       .hsync_start = 240 + 0,
> +       .hsync_end = 240 + 0 + 5,
> +       .htotal = 240 + 0 + 5 + 1,
> +       .vdisplay = 320,
> +       .vsync_start = 320 + 0,
> +       .vsync_end = 320 + 0 + 1,
> +       .vtotal = 320 + 0 + 1 + 1,

Some random datasheet I found has really different numbers.  If the
numbers above are what everyone is using then I suppose it's fine,
just curious why the mismatch.

Also: should you provide "vrefresh"?



-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
