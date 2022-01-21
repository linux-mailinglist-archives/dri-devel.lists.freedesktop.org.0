Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F449669D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 21:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3F010E44C;
	Fri, 21 Jan 2022 20:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD1610E367;
 Fri, 21 Jan 2022 20:50:11 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id m9so818690oia.12;
 Fri, 21 Jan 2022 12:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DIhTTjelyXp1scIWoIHum/L+8mNJoJDG0RuZ6neQWBQ=;
 b=S77186CnyZMQUQqsNQ9+TmBwqAbtNfrjvvjCAAiIeT6ZZ4bYkyEhMV+NQHdB9vWhZA
 yV4LN7S8S/VpiOQwOYSkltT0g0NGMKmErw9/x5WhSzwfHsS9uHkQKi0it/i6VauNx1JC
 7vbubAvJ2qyO2mxbF8rXjx1swIiD44GaHvqYFUy2jT45AbsU7FMsOCOeBeuD05FaFAa/
 w7PcFrdWNUiuk6Nyo0xca6Wy+/Fv4Lqdamoo7NOwBlQzQPRoKdHLcHinvh1T+oK/PTlY
 6/fkIX9RqbCw295MMLrjpRTuYxrvMWJM3oBdXsiqQIFxJsRcTqm104GF0eNsFRroov/M
 DzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DIhTTjelyXp1scIWoIHum/L+8mNJoJDG0RuZ6neQWBQ=;
 b=BiZ2LtwuNKYBHHL5QQTcDcpLn7rboWzet7e1jPVdbipus77Yp9elEKUFt4y/IP7PsB
 0t+/7jE+6iN0/eoQwiTe0U75EsEKlSQXOmfED6koidSYQWDuxECEMv1OCZjeWBG5qMeW
 sRpQTUdmH0wfALf4mLqhf1odQ39snbcczf8iNaFG+LZ82p00vhZFeUQqPDILFcT4PE0w
 WypuO6XYakPWnGMliw1odK4ViJ+I5ec/UOUxlzuSCA7emhLdIFI8ujjLallgseBOnRZY
 9MnMpi+3PfvV23qXqCCXCp8v1M/Z9SfQMLa4T1A3S2TmZKFc7gv0CGE93k6BOXFiGquP
 wvIg==
X-Gm-Message-State: AOAM532hxN49seeHsVrt3fQqmJ4kOExLbNlzZT6m0eMQ3NDgj4FEI/B/
 YnuwfYaoNiKyeOV8GOcP2xO8URHyCVtgpO0bGag=
X-Google-Smtp-Source: ABdhPJyHg9DnOVLj3GXek1xX/4z2+Ys+ETYkAEGri9PQIVx4le2XsjzS4hGXn/Nystf1LQWIU/w3nB3UXfPeSOn92HQ=
X-Received: by 2002:a05:6808:ab2:: with SMTP id
 r18mr1994063oij.123.1642798210665; 
 Fri, 21 Jan 2022 12:50:10 -0800 (PST)
MIME-Version: 1.0
References: <20220121114800.95459-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220121114800.95459-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Jan 2022 15:49:59 -0500
Message-ID: <CADnq5_NbnutwnzOttGtj37dH9eMBT3KUM=i8v=JTZ3cqCh6hoA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: remove useless if
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 Abaci Robot <abaci@linux.alibaba.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Jan 21, 2022 at 6:48 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Clean the following coccicheck warning:
>
> ./drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c:7035:2-4: WARNING: possible
> condition with no effect (if == else).
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> index 23ff0d812e4b..7427c50409d4 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> @@ -7032,10 +7032,7 @@ static int si_power_control_set_level(struct amdgpu_device *adev)
>         ret = si_resume_smc(adev);
>         if (ret)
>                 return ret;
> -       ret = si_set_sw_state(adev);
> -       if (ret)
> -               return ret;
> -       return 0;
> +       return si_set_sw_state(adev);
>  }
>
>  static void si_set_vce_clock(struct amdgpu_device *adev,
> --
> 2.20.1.7.g153144c
>
