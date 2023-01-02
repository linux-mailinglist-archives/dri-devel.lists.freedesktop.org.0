Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342DD65AD0B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 05:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F9B10E0D1;
	Mon,  2 Jan 2023 04:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AED210E0D1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 04:58:54 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id u18so37230799eda.9
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jan 2023 20:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BD2MyA5Fl5hXV25Dz22JtwLdth8U0yqaUY4dAKEj/zo=;
 b=F7dgrvNT0HZeN/kd5R1fXwTJw4dpgidwfbkS86UL6xe3Km7UCjkd3n788jnpTPhdj9
 6aV+nLY3QmnE6ufzPQDZMkwkOtEY5OohWbsjfAG17wVAFhODoZ67i1ZJoTWnuRkHOsAU
 DvOeu2TsEKDJDvs5ibvLmWVQmRWuHXwd4RUzPi36F7BvUa0lbhPLeWd/ekARQFaHcnwC
 T634ZWuqicRQNBiJGpRLtRTS3Rke6JoPB5kg+fIexHPVjbIIzZ/6MNbzG6/4G4mSkVSM
 KUI6ZnJdjyGaoDB7Ai3ZQXZ/v5CS5KLCemyRjCPiScYKSX7aN6io2ETTRxM+STM5/9tt
 Ji3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BD2MyA5Fl5hXV25Dz22JtwLdth8U0yqaUY4dAKEj/zo=;
 b=oMijXb6fnHgACrrgZzd10wPKl7YmYvjZqy8GVCpJGU5Ua5ufsMnYiw9YJe3GZk9yob
 6WjwXCaqlXhAP7vK6BtDzB64ryq2uTh3iJ659bMHnC6jaGt2jNb4b4ja1quA8HQKkeY+
 LE3OuUSL7UeWxAvXuimx7pzqKJe1+PTBIxZ7wPKqxqRYMOMFENTHuysRsWRwlPXNkp4K
 kLuJ+TIKgVLhPEgrXGUuZjv5HMeWpzTgUtz8b7VTKuDh171utMiNQ5itGTuQB27bowFv
 yLZgY2Kis5fJWIRcYM+4+VoCjLDtfMJly8xZuve7Jp1tN2JgbisZWbUUCRU6HFCX6JJ1
 rInw==
X-Gm-Message-State: AFqh2koSuhTBqN3+j4Adm2jEv9TcST6h4zH3Du9t3YgnBmKJ0mhpRwLH
 rcH/HAo1TZ0ZBSi7EeNXhNqfriXW9FVfK9VUvU5wWw==
X-Google-Smtp-Source: AMrXdXtf10HVx31LtO2q9oRMszreTLdQ6uQ4qjQQGfRqKsHGgnl5gH5spnh46VTHSPgl0n4Orcy0tnZCQbn4bwQ26gw=
X-Received: by 2002:a05:6402:5505:b0:481:3f8:b45 with SMTP id
 fi5-20020a056402550500b0048103f80b45mr2740555edb.5.1672635533536; Sun, 01 Jan
 2023 20:58:53 -0800 (PST)
MIME-Version: 1.0
References: <20221231142721.338643-1-abel.vesa@linaro.org>
In-Reply-To: <20221231142721.338643-1-abel.vesa@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Sun, 1 Jan 2023 22:58:42 -0600
Message-ID: <CAKXuJqjiEpxnX_E=HGqEaX91YA7XUmUoaK0NQqXHJCUkcqUPoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel-edp: fix name for IVO product id 854b
To: Abel Vesa <abel.vesa@linaro.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Johan Hovold <johan@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 31, 2022 at 8:27 AM Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The actual name is R133NW4K-R0.
>
> Fixes: 0f9fa5f58c784 ("drm/panel-edp: add IVO M133NW4J-R3 panel entry")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>
> Assuming the information from here is correct:
> https://raw.githubusercontent.com/linuxhw/EDID/master/DigitalDisplay.md
>
>  drivers/gpu/drm/panel/panel-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 5cb8dc2ebe18..ef70928c3ccb 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1891,7 +1891,7 @@ static const struct edp_panel_entry edp_panels[] = {
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
>
>         EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
> -       EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "M133NW4J-R3"),
> +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R133NW4K-R0"),
>
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
> --
> 2.34.1
>

Thanks for this - when I was looking for the panel, I simply went with
what I found on panel-look.

Tested-by: Steev Klimaszewski <steev@kali.org>

--steev
