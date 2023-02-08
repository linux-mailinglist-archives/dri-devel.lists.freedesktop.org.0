Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D923E68F41A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 18:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCCC10E7C4;
	Wed,  8 Feb 2023 17:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA78E10E7C4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 17:14:01 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ud5so52856197ejc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 09:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CNCNsQd95KkPPYVE5Xn6suXE13YKHSzEDImJA4YDVGk=;
 b=Crlcgrcx5e/Hl3G9vyX8MSvRJdSOZgNN67aBRcQZzZJ3f1M+kTzLTUL0L7J8W7NAqO
 QcwnIlGMqgY//2VLb5IjsH8hMGQbnUEOTEZv+hhuVpzXmqfunzAvlUjKWta6LPZVaegU
 aBS/AKq3HlszzzrRPLpvP9ityCtmkH9DrBbzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CNCNsQd95KkPPYVE5Xn6suXE13YKHSzEDImJA4YDVGk=;
 b=hJCho0K3XKrDsFQcCBdTtIk3+ofEdAmbSIPTdHoQUfxlRNBWEPH6CvmsPvGLtCu0Rh
 3BRdA+U12BxtKuvHTCHM8huFLzXjBGA4RJrxET+bZb3YGxdPuxI4C5A9301bHms0lh0j
 RnVaWnPDIIU8SCi49+XAxOq9xlz6KI5JPUTIkGGxM3z4zia14u0VLdZDAJhaNFZpQT+7
 76dZafCQxs7oXyD4K5gaYSekbIr+ifDbSUM12yQe6kWBLylTEixf+M+hNOYykFyqdx26
 s/2t7NacJaE4GAg3ofy5Vbi46Tg/KQ7YG8I4CubKGs9j10eLlWm91CrO8ayjPykvQ1Gt
 9P/A==
X-Gm-Message-State: AO0yUKUfe6uWqzOEKLhC++GFfdfJTr4gyCBlxDKoewwtb+xwgV3/DGvH
 xrmHjWhQSavoK9eLzepShS5RHUwRzSuNcJrANzo=
X-Google-Smtp-Source: AK7set/mV6MGHlL9MgSGlszNuIxNbxNVWylPZwdK4r6w3Fh7ynb8z63ERGWBawd0qYdzwPxEBLMe0A==
X-Received: by 2002:a17:907:9619:b0:8ae:ea17:bae4 with SMTP id
 gb25-20020a170907961900b008aeea17bae4mr2449645ejc.30.1675876440331; 
 Wed, 08 Feb 2023 09:14:00 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 la3-20020a170906ad8300b0084d381d0528sm8531604ejb.180.2023.02.08.09.13.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 09:13:57 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id o18so17494844wrj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 09:13:57 -0800 (PST)
X-Received: by 2002:adf:da42:0:b0:2c3:d98e:21 with SMTP id
 r2-20020adfda42000000b002c3d98e0021mr161800wrl.690.1675876437492; 
 Wed, 08 Feb 2023 09:13:57 -0800 (PST)
MIME-Version: 1.0
References: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Feb 2023 09:13:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WbzmF_Jkwrcm27eqXaqNhGq_D=8yfCKqELET+=+EaLAA@mail.gmail.com>
Message-ID: <CAD=FV=WbzmF_Jkwrcm27eqXaqNhGq_D=8yfCKqELET+=+EaLAA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Reserve DSPPs based on user request
To: Kalyan Thota <quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, quic_vpolimer@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 8, 2023 at 5:42 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> This series will enable color features on sc7280 target which has
> primary panel as eDP
>
> The series removes DSPP allocation based on encoder type and allows
> the DSPP reservation based on user request via CTM.
>
> The series will release/reserve the dpu resources when ever there is
> a topology change to suit the new requirements.
>
> Kalyan Thota (4):
>   drm/msm/dpu: clear DSPP reservations in rm release
>   drm/msm/dpu: add DSPPs into reservation upon a CTM request
>   drm/msm/dpu: avoid unnecessary check in DPU reservations
>   drm/msm/dpu: reserve the resources on topology change
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 58 ++++++++++++++++-------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  2 +
>  3 files changed, 37 insertions(+), 25 deletions(-)

I tried out your changes, but unfortunately it seems like there's
something wrong. :( I did this:

1. Picked your 5 patches to the chromeos-5.15 tree (this series plus [1])

2. Put them on herobrine villager.

3. Booted up with no external display plugged in.

4. Tried to enable night light in the ChromeOS UI.

5. Night light didn't turn on for the internal display.


I also tried applying them to the top of msm-next (had to resolve some
small conflicts). Same thing, night light didn't work.


I thought maybe this was because the Chrome browser hasn't been
updated to properly use atomic_check for testing for night light, so I
hacked my herobrine device tree to not mark "mdss_dp" as "okay". Now
there's _only_ an eDP display. Same thing, night light didn't work.


I could only get night light to work for the internal display if I
plugged and unplugged an external display in.


Is the above the behavior that's expected right now?


[1] https://lore.kernel.org/all/1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com/
