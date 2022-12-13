Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B966164BA1E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 17:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518EA10E319;
	Tue, 13 Dec 2022 16:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C7110E35A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 16:47:32 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id e205so294606oif.11
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 08:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qSpFPtYtqwbwgpaDfxY9bLElKawGst3mkzumQCRtMZA=;
 b=wIx4THjTYQlEWvPxkWO+P3LDsGYG4ruw+vvWGQUALXmocOx0dFmaxHmpWsSyhfqF4j
 BLUoMsmXXhxOHM3/EKYxEHMN1VS6IZbZDejmkxkWCI29/Xn+2Jvt+00oJVrYzP0jXqQY
 If+RdOBdAfIiRqQyOZVPwBe9ucM7lkUBxrFQqNZi8Y6fxyOsp5LSg5rIxecI0hDNWVzX
 xjWcfbo2stwN3mao7J0SZCmpEUsBpbs1IJ9M8E+dru5YbIxa9KXFZySmG4STMiis30UV
 UvGT15tzZmbmecAMOGfyM9Bfsh488bKi/MgcdjAEqX5lqpPl8UlLeBNfUkKn9qj4Wde8
 50aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qSpFPtYtqwbwgpaDfxY9bLElKawGst3mkzumQCRtMZA=;
 b=l5ptNTB8EjkXWsdpjbCmUORUJLAI6f2/oKKBQ9uslFvdHrcyOLJv0conEtuDXaoN0N
 hTwvoa/fDADzB+Fy/Bqi3vlXxHR0c3BIzY2kwwa5DuGTpGgtxod5cAbLzSQNDE0GllgK
 9C0nfabvK45lk2A8ytlZrXYV2g7lNNaV4U3hsA5I3hpflGbj+s9SPejldn79DIYkfxvn
 jKkWQ4/Cpcg0kUfvzwYRyDYDwrKw4LK/mc7dONqLK9q9UaVjex6SvQgBAQ8cQbTfzouj
 nMi8CCpI8u8rZ2/2hrqv2lNSddB5vT0pULvDDkEnEwAQ4lLIjPWKdJ0yolvqd+m+hBDG
 Etgg==
X-Gm-Message-State: ANoB5pkl8CobGgXaF33hL6oyR6yQcr+wFNmrdKWnf2B6Oh69aDLG2TNs
 9DxHOhoAuYoGxe9+Ikc43/N9SiOdPvMOdaxBTaPA9w==
X-Google-Smtp-Source: AA0mqf6jtP/Q7Vai7aVv/JUuh7ElYcHVEWWCl+v9EAaFTC3NMUdDiFEkCdNpneIMvVEwl8DQasl6+DXuTdTgKXwAvIc=
X-Received: by 2002:a54:4018:0:b0:35c:3e72:94b7 with SMTP id
 x24-20020a544018000000b0035c3e7294b7mr259644oie.67.1670950052019; Tue, 13 Dec
 2022 08:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20221213150304.4189760-1-robert.foss@linaro.org>
In-Reply-To: <20221213150304.4189760-1-robert.foss@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 13 Dec 2022 22:16:55 +0530
Message-ID: <CAMi1Hd1Ei5SbT8DHacFq6sJXCsjWdeY3OyeE_RnWnkxNp6i9Qw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: lt9611: Fix PLL being unable to lock
To: Robert Foss <robert.foss@linaro.org>
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 stable <stable@vger.kernel.org>, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Dec 2022 at 20:33, Robert Foss <robert.foss@linaro.org> wrote:
>
> This fixes PLL being unable to lock, and is derived from an equivalent
> downstream commit.
>
> Available LT9611 documentation does not list this register, neither does
> LT9611UXC (which is a different chip).
>
> This commit has been confirmed to fix HDMI output on DragonBoard 845c.
>

Cc: <stable@vger.kernel.org>    [v5.10+]
Reviewed-by: Amit Pundir <amit.pundir@linaro.org>

> Suggested-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index ffcdc8dba3798..3ce4e495aee50 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -259,6 +259,7 @@ static int lt9611_pll_setup(struct lt9611 *lt9611, const struct drm_display_mode
>                 { 0x8126, 0x55 },
>                 { 0x8127, 0x66 },
>                 { 0x8128, 0x88 },
> +               { 0x812a, 0x20 },
>         };
>
>         regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> --
> 2.34.1
>
