Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6939E720ACD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 23:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D0B10E12E;
	Fri,  2 Jun 2023 21:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444C610E12E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 21:05:41 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-ba8afcc82c0so2712205276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685739939; x=1688331939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bGtOFR2mphGb3w/SKqqatTcmK2Pjhu9d+mT6IMF2bsA=;
 b=O8cWtf9dK3IVBtCzRm56Bvob5Vhhmtc5jm/bwtrzzNg5NFGeACg0/roonLuhnaKj9w
 l9zK+/K1wWpvLNvKbUMpYKoE5GSPi2MzMfZLq2V8rYqnQdDI79ckTFzhENhOotuajVBx
 rZLnuOHFhJdTfuviF+xyrGeIZowEG6c591jS++W2CWKFRNVKmG8W4l6ucVyIz0hqICLn
 1SJduWUuUDVhlUWYgc8KpFRBJyi/pdoJtLxorMHFCbmjaHgvsxBC8jZMAsTfAOIcK9Ta
 rxXWbKQojO6qVCNjmvwICCaFkBklLVyIxuyXU1of/N+71b5mF2YPzLb5Uln13dIpUknZ
 feUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685739939; x=1688331939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bGtOFR2mphGb3w/SKqqatTcmK2Pjhu9d+mT6IMF2bsA=;
 b=XROMV+XjqOt2NNlKFSyY+8Yyds7TULKO1GtH0LLNeVVST0CUdECdSRxwGCFh3APy5k
 T65UiR1UqTTsoB0UkLvJhE/ZvUq1opOO8Qu/T0EiPbrWnTScdBAds7sYMtANHEQUlPB2
 UoaSygb/7vRLH60J2jdKzgy9y/9yauA4jma+9Qj2Jxrox/u1oTWj/FEviX9l08IwaDns
 cidAsil5/S9Hd46gBiq0x2gFa+ELAsw0BZwDTCYbbvv7rHYw6EXrNzCqHOsgg8ZWUB+u
 dMPoVV2I5lnpyu77PO2cYgQIzG6MgVSU6Nd2MgRGQ6qnY2VYz6fR3O4HjFmX0GWBRNUc
 F0Mw==
X-Gm-Message-State: AC+VfDzQwS43THwAFd9wCANZD159yCn+eoX0xm8+1xlyWgJ1jnkuhkr5
 VqWX3D6pL4IlJZY6iS0tKhQEN3AZU8T0eQ2DQmVnEA==
X-Google-Smtp-Source: ACHHUZ7Gn7c4DGB7V9sdrivTf8wBNtf7tCUcHwzPgc4kwSOC01IapgteGYaVZI1W8k3JxzfxAXKuXpFOGHc0YMbxFh8=
X-Received: by 2002:a25:768a:0:b0:ba9:6b90:e551 with SMTP id
 r132-20020a25768a000000b00ba96b90e551mr4566101ybc.50.1685739938909; Fri, 02
 Jun 2023 14:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
 <dfa12c8b-ccec-261c-9c83-54536e17c02d@linaro.org>
 <157e8219-7af2-c7ed-6d99-3caa6fbc11ba@quicinc.com>
 <CAA8EJponkEne2vVsNP=2Fxmv=Uc6i_LzAGBSEz9hPPotCEpGzg@mail.gmail.com>
 <e69f02b7-eba9-5f33-5ca1-eb0638928414@quicinc.com>
 <CAA8EJpr9dfrrEsFf8heOvG3BWRTVCY-q1QYNH_3OBeMAWEwotA@mail.gmail.com>
 <d1a320c4-d851-ba75-ef7b-80dc369d1cfd@quicinc.com>
 <CAA8EJpqzyYQAg+VXLzttan7zGWv4w+k6kgS2SbRo26hFZ_9Efg@mail.gmail.com>
 <32aa41ee-4ab0-0915-a77f-5b0d6874b3e1@quicinc.com>
In-Reply-To: <32aa41ee-4ab0-0915-a77f-5b0d6874b3e1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 3 Jun 2023 00:05:27 +0300
Message-ID: <CAA8EJpp0aWd2i4vkbURgDx+s99KNZYeEkd9RK0+fP+QfzDgZKg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm/dpu: retrieve DSI DSC struct
 at atomic_check()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: Vinod Koul <vkoul@kernel.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic note: please use reply-to-all instead of any other options to
answer the email. You have dropped all recipients (except the
freedreno@) in the message
<d1a320c4-d851-ba75-ef7b-80dc369d1cfd@quicinc.com> (and it was left
unnoticed).


On Fri, 2 Jun 2023 at 20:00, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> There is one option which is keep current
> >>
> >> 1) keep struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi
> >> *msm_dsi) at dsi.c
> >>
> >> 2) use  struct msm_display_info *disp_info saved at dpu_enc to locate
> >> struct msm_dsi from priv->dsi[] list (see item #3)
> >>
> >> 3)  info.dsc = msm_dsi_get_dsc_config(priv->dsi[info.h_tile_instance[0]]);
> >>
> >> 4) ballistically, keep original code but move  info.dsc =
> >> msm_dsi_get_dsc_config(priv->dsi[i]); to other place sush as
> >> atomic_check() and atomic_enable().
> >>
> > 5) leave drm_dsc_config handling as is, update the dsc config from the
> > DP driver as suitable. If DSC is not supported, set
> > dsc->dsc_version_major = 0 and dsc->dsc_version_minor = 0 on the DP
> > side. In DPU driver verify that dsc->dsc_version_major/_minor != 0.
>
> I am confusing with item 5)
>
> Currently, msm_dsi_get_dsc_config() of dsi side return dsc pointer if
> dsc enabled and NULL if dsc not enabled.
>
> Should checking dsc == NULL is good enough to differentiate between dsc
> is supported and not supported?

This is called a "shared memory area". Instead of either providing a
dynamic data pointer, one can provide a pointer to the static area
which is filled by DP or DSI. If there is no DSC available, one flags
'data not valid' by setting major,minor to 0.

>
> Why need to set both dsc->dsc_version_major = 0 and
> dsc->dsc_version_minor = 0 for dsc is not supported?

6) Another option (which is more in style of what is done in the
vendor kernel, if I'm not mistaken):

Enhance struct drm_display_mode to contain a pointer to the DSC
config. Use this pointer to check whether DSC should be enabled for
the particular mode or not. The panels with the static DSC
configuration can use a static data pointer.


-- 
With best wishes
Dmitry
