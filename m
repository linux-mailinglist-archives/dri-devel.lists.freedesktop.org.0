Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ACB6C985D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 00:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E58410E2E2;
	Sun, 26 Mar 2023 22:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C1F10E31F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 22:02:39 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id e65so8186793ybh.10
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 15:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679868159;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GIc/+PDO2htV2jMp3KoF29hKZ12iZrid4FdCljLl48k=;
 b=afaLl3Ha4GhPKcKshef+64lLZtACUvVS/1jAuXiJO7hdtSCrNjJ83E8oq5/9midSG1
 1fZuC5nCf/LPJoMTg1uQtioaulMia4KDC7k1qRAwPHNsW7ehCS+UcuEC+VTTrVfJTJ0A
 gA+/YGB2UnIjcaAMzIm7zjFqilwua3AeEOWAiZPEgU1k3I3+7xfpqxiF+a7YV5fNSqXE
 0jVitL1jMy/PkvR+OtowmcyL9F4gw4vNVBuOnI7LpDXbCIKwKeYtTFemF0YihbK5JwFm
 V7s87ESYtCcbmaadxyYcysQmkVdQBI/iPK6Qj+KeCaASiGYQMb5CANXTHbXwHLhEK1q3
 kvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679868159;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GIc/+PDO2htV2jMp3KoF29hKZ12iZrid4FdCljLl48k=;
 b=eWtKZhqBXSlcj1Yu5Np7ZpYfUz2EPa+lZcPzHMqC+h4PmzptttwQgCOOJkKIi0Uvps
 bQ//qJ0na8eG7AJebMQA2EfcbtphOFA2YUdfJ0/J9dDCOPPttmhyS57M4FmHAf9neRv9
 wOdB2Zws8BRlhmuCtdY2LKKbuXSUxfntkMoNxgGESF0xIS/kpK7fruXtrr7szq6nByTj
 bK1fq/F8LOh3H3gtCKat8nOX2/YHk83trfISWmMqViUBhshzuP8JulnVgk3QMVkNHDqq
 MI+cT+A/IBOVwpA0NSJpx+fLKZSMDR31jp87ivkK8Qk9il9fTtbUuf510b8NEYNNpBH2
 opkw==
X-Gm-Message-State: AAQBX9dtHQIPQpfguNXpJQmVba0f1WyVQSA+7BghHdoYdNl5HnekTT3d
 Z6dFwCemv8VW0l88RgYtXwH59AAbvnxoGNfJpbkxnw==
X-Google-Smtp-Source: AKy350Z2Qzm+5ANjsAThGZFty6IX7daVX2aW0EYjjTkzMa2fQoYReQIT8/fAf0fwdMIK93UKhsOoGxAujOSwHFJvSEg=
X-Received: by 2002:a05:6902:1201:b0:b6c:4d60:1bd6 with SMTP id
 s1-20020a056902120100b00b6c4d601bd6mr6141431ybu.9.1679868159111; Sun, 26 Mar
 2023 15:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
 <20230326162723.3lo6pnsfdwzsvbhj@ripper>
In-Reply-To: <20230326162723.3lo6pnsfdwzsvbhj@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 Mar 2023 01:02:28 +0300
Message-ID: <CAA8EJpp+gX+6zniMioBfXC95VF2qVTPidQB36zyrohhrGerK8g@mail.gmail.com>
Subject: Re: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based on PSR
 support
To: Bjorn Andersson <andersson@kernel.org>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, dianders@chromium.org, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_khsieh@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Mar 2023 at 19:24, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Thu, Mar 02, 2023 at 10:03:17PM +0530, Vinod Polimera wrote:
> > For the PSR to kick in, self_refresh_aware has to be set.
> > Initialize it based on the PSR support for the eDP interface.
> >
>
> When I boot my sc8280xp devices (CRD and X13s) to console with this
> patch included I get a login prompt, and then there are no more screen
> updates.
>
> Switching virtual terminal (ctrl+alt+fN) causes the screen to redraw.
>
> Blindly login in and launching Wayland works and from then on screen
> updates works as expected.
>
> Switching from Wayland to another virtual terminal causes the problem to
> re-appear, no updates after the initial refresh, switching back go the
> Wayland-terminal crashed the machine.
>
>
>
> Reverting this single patch resolves both the issue with the console
> updating as exected and flipping between the virtual terminal with
> Wayland and the others no longer crashes my machine.

I hope Vinod Polimera can assist in solving the issue. In the worst
case we will have to revert this commit, shortcutting the PSR until it
is properly debugged.

>
> Regards,
> Bjorn
>
> > Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_drm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> > index 029e08c..785d766 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > @@ -117,6 +117,8 @@ static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
> >       if (WARN_ON(!conn_state))
> >               return -ENODEV;
> >
> > +     conn_state->self_refresh_aware = dp->psr_supported;
> > +
> >       if (!conn_state->crtc || !crtc_state)
> >               return 0;
> >
> > --
> > 2.7.4
> >



-- 
With best wishes
Dmitry
