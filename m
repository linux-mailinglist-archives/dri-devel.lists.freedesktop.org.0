Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D92545DA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 15:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0436E44C;
	Thu, 27 Aug 2020 13:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC556E2B2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 13:24:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k20so5096004wmi.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 06:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/AAEtDxneAp6k++c1GtdGKMY1SnclV196QHGvO+XtPk=;
 b=YZv+oMzRpSbF+es2mPVsheYNbFRBtNd0g8BTCzFa/8uGg6k5jN+FIDOvvL+nY6dgtM
 UPtNTXJpBFdWEfryLdbyO7Sukj9fu+r/2bDbwA1oUwWPQsRqkEHQDIIZs9ItXJB4DJM0
 PVGUR0Y6FCmKyNlFCbgaI9k5SYIqrPMfV2KVZVjbCAU3VQewULFlNd4EFJ1Zfi5mWCha
 5lzCbvR/63hp1UKOLZLqapSfVp1qXz4Xul+sLWquSyG3P/szcGUkod8o4NR459Y4lpTR
 wSC0PWVu5KBXN+83j9au6j8Wj83hD9nCWNZcfZuRTuoLmzgMo4I7ARRlmkYxiYNS0sHo
 mo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/AAEtDxneAp6k++c1GtdGKMY1SnclV196QHGvO+XtPk=;
 b=sNxcNI5WS99fTcyS9VGR6Cv1r+c1wP3W+y1nmIcpXu6zj/B7102jqn89iTBdQZdAcm
 VBWbz4GrcUJxgIb6zcrOYEtnirf/PGxsYzQd23loymSANDpbKIzX2imaA3KnSG9FC3VP
 YYDMfyhPV5oET3LnW48pULmY7N/I/qxcYfdCSqsvfKPLnhXnQd7JxQPUJKSpI3Wrlwy/
 zmHNUkyXxh/i0xu1NKnwEOsTrmkHddlZBZDeyQ6KCKDUF0TDzyC669PxbSOf/YGjjorR
 7dmd7DNoe5MuIBXApJ4d7dO0t8IizyxLtXcOAdXqRO4e1HUibA8spdQMquDlot2eeRAr
 vp9Q==
X-Gm-Message-State: AOAM5331GnaQxqYC5HLIYBBuie0/nsFc/bob2XPXqWDbhiTdk+XhJHUO
 HuCsd/7BsReo37HrM0HBp4Dglm2qICJp25lXeuE=
X-Google-Smtp-Source: ABdhPJy1krtxTNHJ7vvLzCNIuCidzmdqnnEpQuOvtbVnzn2s11UR+PZaLsUeQ9aG8bBgCB88faqbyl8wQVpJbUjZd9A=
X-Received: by 2002:a1c:ed15:: with SMTP id l21mr12001857wmh.56.1598534695584; 
 Thu, 27 Aug 2020 06:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <ca1c416e-50b9-e436-c1c9-90a85cf481ec@gmail.com>
In-Reply-To: <ca1c416e-50b9-e436-c1c9-90a85cf481ec@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Aug 2020 09:24:44 -0400
Message-ID: <CADnq5_N48Mt2Wn6HNCd3uLV0H+YoAFvc1VEPrfkTQJtJEe=nMQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] AMDGPU : Fix bug in reporting voltage for CIK
To: Sandeep Raghuraman <sandy.8925@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied with some minor whitespace fixes.  Thanks!

Alex

On Thu, Aug 27, 2020 at 9:13 AM Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
>
> On my R9 390, the voltage was reported as a constant 1000 mV. This was due to a bug in smu7_hwmgr.c, in the smu7_read_sensor() function, where some magic constants were used in a condition, to determine whether the voltage should be read from PLANE2_VID or PLANE1_VID. The VDDC mask was incorrectly used, instead of the VDDGFX mask.
>
> This patch changes the code to use the correct defined constants (and apply the correct bitshift), thus resulting in correct voltage reporting.
>
> Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> index 753cb2cf6b77..2be006dd2eb3 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> @@ -3587,7 +3587,7 @@ static int smu7_read_sensor(struct pp_hwmgr *hwmgr, int idx,
>         case AMDGPU_PP_SENSOR_GPU_POWER:
>                 return smu7_get_gpu_power(hwmgr, (uint32_t *)value);
>         case AMDGPU_PP_SENSOR_VDDGFX:
> -               if ((data->vr_config & 0xff) == 0x2)
> +               if ((data->vr_config & VRCONF_VDDGFX_MASK) == VR_SVI2_PLANE_2<<VRCONF_VDDGFX_SHIFT)
>                         val_vid = PHM_READ_INDIRECT_FIELD(hwmgr->device,
>                                         CGS_IND_REG__SMC, PWR_SVI2_STATUS, PLANE2_VID);
>                 else
> --
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
