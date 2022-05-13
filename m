Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 009135267A3
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 18:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7ED10EAEA;
	Fri, 13 May 2022 16:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E541210EAA1;
 Fri, 13 May 2022 16:55:26 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id v65so10783111oig.10;
 Fri, 13 May 2022 09:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TK9SPkHUxrXz76RcXOz5GQr5aMMZCUKY9fHznaMvUFc=;
 b=Y2kHX9BRB/slIAcQK8ffXtZq1gzumLjI6eAUx7m/JtKnUVA3Aq5xTbcS/nRhfTc8o3
 MEtDoDeIw1jDZHD0Ay9d2KhEZXDEdc8b9DZS+91ESMH0xfvp7Ouj8CaMvT++ur1M6u+p
 4bWWFBtPivMjtbDqupJVe1YLlJ7/j4nP3+wWyH34maheV7Rlu6bKuMptMAWpKKBdNqOw
 Qw2DQg7eGrh1pNWSxemuoe3n88sHpoK6mEDWEmHIRoe1x4B4OyPdqTRSwFpuOrVvH1rD
 McS1Vr4w7xeXgFg6h9MRccvTVroorSomHTeXERGqxoWnrX2GMLzKMnmC7UbP9KZ4lA2Q
 TxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TK9SPkHUxrXz76RcXOz5GQr5aMMZCUKY9fHznaMvUFc=;
 b=dfuEW9aJBzrNa4QVmQBfpWoe8W46i4fegOy7hdmjw2iRh/fWXn7TBD+NxsCgJS6eZ1
 F+b5UgsGpJDH9liCmfoYlrEjRLZASBUB8AbQrbuoo6U/tE8P0jJbhtuxV6rZDOBLGUNr
 2lfJmbXeHAd23K/s9DjpqUJEDP+zMRP87ceZ9ipaGXXHf7xFwlpOadBwJY1zbFm0iDrD
 7JKaWXshYQFNiEJFRA7wPUVRyyEktk2WAAuE2iq71U/FqU7MfuQLNNWwREP/UBt0xITl
 aLh7JMKz1ZotIzT+7fWkP6x1kBCJ76DAA22PeXEDKAbuLRjg7hz0DRRXk2v/iNPLToCF
 MwZA==
X-Gm-Message-State: AOAM530WEG9TMSVp4OV+x2iNsiZgQi3arVamnLdp46W56fPytsg3Az/r
 HNoeZptfnHOLML2bOZvZUtPpFkX/nIej2biOfzU=
X-Google-Smtp-Source: ABdhPJzqrHzphKSCdlocUZx8Aj+3sq2G1MgCZf/YS6GgPR1SQGjwjL113lRcVEJYHPOdnzBt5x19EnbXGJFnXfjYx1Y=
X-Received: by 2002:a05:6808:f8e:b0:328:a601:a425 with SMTP id
 o14-20020a0568080f8e00b00328a601a425mr2898988oiw.253.1652460926174; Fri, 13
 May 2022 09:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220513062045.840780-1-pengfuyuan@kylinos.cn>
In-Reply-To: <20220513062045.840780-1-pengfuyuan@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 May 2022 12:55:15 -0400
Message-ID: <CADnq5_P+ibMk_z69CxH_Q60YL259US9f7uv3MDnMgU7pX47MuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove macro DC_DEFAULT_LOG_MASK
To: pengfuyuan <pengfuyuan@kylinos.cn>
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
Cc: Leo Li <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 13, 2022 at 3:20 AM pengfuyuan <pengfuyuan@kylinos.cn> wrote:
>
> [Why]
> The DC_DEFAULT_LOG_MASK macro has not been used for a long time, so remove it.

I'm sure there are lots of macros in the driver that are not used at
the moment.  Any particular reason to remove it?  DC_MIN_LOG_MASK
doesn't appear to be used at the moment either.

Alex

>
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
> ---
>  .../drm/amd/display/include/logger_types.h    | 33 -------------------
>  1 file changed, 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/include/logger_types.h b/drivers/gpu/drm/amd/display/include/logger_types.h
> index f093b49c5e6e..1b38cfc41718 100644
> --- a/drivers/gpu/drm/amd/display/include/logger_types.h
> +++ b/drivers/gpu/drm/amd/display/include/logger_types.h
> @@ -131,37 +131,4 @@ enum dc_log_type {
>  #define DC_MIN_LOG_MASK ((1 << LOG_ERROR) | \
>                 (1 << LOG_DETECTION_EDID_PARSER))
>
> -#define DC_DEFAULT_LOG_MASK ((1ULL << LOG_ERROR) | \
> -               (1ULL << LOG_WARNING) | \
> -               (1ULL << LOG_EVENT_MODE_SET) | \
> -               (1ULL << LOG_EVENT_DETECTION) | \
> -               (1ULL << LOG_EVENT_LINK_TRAINING) | \
> -               (1ULL << LOG_EVENT_LINK_LOSS) | \
> -               (1ULL << LOG_EVENT_UNDERFLOW) | \
> -               (1ULL << LOG_RESOURCE) | \
> -               (1ULL << LOG_FEATURE_OVERRIDE) | \
> -               (1ULL << LOG_DETECTION_EDID_PARSER) | \
> -               (1ULL << LOG_DC) | \
> -               (1ULL << LOG_HW_HOTPLUG) | \
> -               (1ULL << LOG_HW_SET_MODE) | \
> -               (1ULL << LOG_HW_RESUME_S3) | \
> -               (1ULL << LOG_HW_HPD_IRQ) | \
> -               (1ULL << LOG_SYNC) | \
> -               (1ULL << LOG_BANDWIDTH_VALIDATION) | \
> -               (1ULL << LOG_MST) | \
> -               (1ULL << LOG_DETECTION_DP_CAPS) | \
> -               (1ULL << LOG_BACKLIGHT)) | \
> -               (1ULL << LOG_I2C_AUX) | \
> -               (1ULL << LOG_IF_TRACE) | \
> -               (1ULL << LOG_HDMI_FRL) | \
> -               (1ULL << LOG_SCALER) | \
> -               (1ULL << LOG_DTN) /* | \
> -               (1ULL << LOG_DEBUG) | \
> -               (1ULL << LOG_BIOS) | \
> -               (1ULL << LOG_SURFACE) | \
> -               (1ULL << LOG_DML) | \
> -               (1ULL << LOG_HW_LINK_TRAINING) | \
> -               (1ULL << LOG_HW_AUDIO)| \
> -               (1ULL << LOG_BANDWIDTH_CALCS)*/
> -
>  #endif /* __DAL_LOGGER_TYPES_H__ */
> --
> 2.25.1
>
