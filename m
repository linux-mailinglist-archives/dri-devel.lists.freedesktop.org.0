Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD196694EF0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 19:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF4E10E680;
	Mon, 13 Feb 2023 18:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD14510E12F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 18:11:59 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id 139so13950312ybe.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 10:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sb3LshHLxSQgF3w0k9C11QJ/y6qj7sAJ3S8kmCUrATA=;
 b=c2vB7YepOv3IasRmcEsYKNTFXbAREvzH2Jzz9ZqXKc9LKKJN4DwSMLQbFzMk6jRKf7
 wjyW1FMLu6kf+tpkMB4eYPphpxFII5HbWM9MaByn+UIe1U2O+SKvSJp3t7/IPuMpSF6F
 56ECThgLIUwn0lGSUzcCICY6TlEwwarijCqBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sb3LshHLxSQgF3w0k9C11QJ/y6qj7sAJ3S8kmCUrATA=;
 b=O0PJW0HlRhWPDsUyrNecHuBY0rEJ/7Lv8l85AAFx5Qj6XCr48bCsga++IgKgieyHqk
 tTqoedCclq7QJLhc2hnL4M6vQ3eay0Uqb2AwbU8ccW+HA6cqoz7QeOh3SCEFfSN1Hq9C
 /UC1P3PtZf7o6oSl/FKDWQwWNXEOe7tq/8EUrtejmtpEcHeFOpfqkgsZrdF6c3EhTku2
 tmEitZmg+gCpD3dROvrg9oUAsZwmSwjdNnV72/BRarENkLjUkFT/cdd0+aImINvvO20A
 I2kEx95yPZ2zNpQYdRl0aAstQmsEWZNWNS6qIGLao5hSGbjXq62+c82lfRLtLORgv3AN
 oaxw==
X-Gm-Message-State: AO0yUKXB6fJmFcEVScMIVcx9h1rPDgCtoDClfylnEzYzYOXA+YFYVYPZ
 CFXerN2eo2SzmjapqQ3UDogL9Te58+fhd3Df
X-Google-Smtp-Source: AK7set9j1QNPE/Rg4HXqrRmBRXAK7MUshqOnAonBNwrJq0zetRblH5ND7QcHhB9dTMRpLMJDV1s9BQ==
X-Received: by 2002:a25:2f0f:0:b0:8ea:13f1:d49a with SMTP id
 v15-20020a252f0f000000b008ea13f1d49amr10901260ybv.6.1676311918411; 
 Mon, 13 Feb 2023 10:11:58 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52]) by smtp.gmail.com with ESMTPSA id
 z8-20020ab05648000000b005ae285f4c22sm1045918uaa.21.2023.02.13.10.11.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 10:11:57 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id g8so13961639vso.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 10:11:57 -0800 (PST)
X-Received: by 2002:a05:6102:1590:b0:411:c7ae:5b47 with SMTP id
 g16-20020a056102159000b00411c7ae5b47mr2679338vsv.68.1676311917426; Mon, 13
 Feb 2023 10:11:57 -0800 (PST)
MIME-Version: 1.0
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Feb 2023 10:11:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WdMtzHryJXxMgYqXkqtFzowqcdvWYOxn4du8mQwYKvcg@mail.gmail.com>
Message-ID: <CAD=FV=WdMtzHryJXxMgYqXkqtFzowqcdvWYOxn4du8mQwYKvcg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Reserve DSPPs based on user request
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

On Mon, Feb 13, 2023 at 3:11 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> This series will enable color features on sc7280 target which has
> primary panel as eDP
>
> The series removes DSPP allocation based on encoder type and allows
> the DSPP reservation based on user request via CTM.
>
> The series will release/reserve the dpu resources whenever there is
> a CTM enable/disable change so that DSPPs are allocated appropriately.
>
> Kalyan Thota (4):
>   drm/msm/dpu: clear DSPP reservations in rm release
>   drm/msm/dpu: add DSPPs into reservation upon a CTM request
>   drm/msm/dpu: avoid unnecessary check in DPU reservations
>   drm/msm/dpu: manage DPU resources if CTM is requested
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 38 ++++++++++++-----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  2 ++
>  drivers/gpu/drm/msm/msm_atomic.c            | 18 ++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c               |  2 +-
>  drivers/gpu/drm/msm/msm_drv.h               |  1 +
>  5 files changed, 38 insertions(+), 23 deletions(-)

For whatever reason when I use "b4 shazam" on your series it yells:

Patch failed at 0002 drm/msm/dpu: add DSPPs into reservation upon a CTM request
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: patch failed: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:573
error: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch

...but then I can apply it with `git am --show-current-patch=diff |
patch -p1` and it just applies with fuzz. Presumably Abhniav / Dmitry
can do the same but it would be nice if your patch applied cleanly to
msm-next.

In any case, I tried this patch on both a herobrine (sc7280) and
trogdor (sc7180) based board running msm-next (including the sc7280
patch [1]). In both cases the night light on the internal display
worked fine when using ChromeOS. External night light didn't work on
either of them (as expected) because we don't have the compositor
support yet.

I'm happy enough with:

Tested-by: Douglas Anderson <dianders@chromium.org>


[1] https://lore.kernel.org/r/1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com/
