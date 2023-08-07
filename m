Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC29D772BEB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9788710E304;
	Mon,  7 Aug 2023 17:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF0110E30F;
 Mon,  7 Aug 2023 17:01:05 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6bcb5df95c5so3613643a34.1; 
 Mon, 07 Aug 2023 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427665; x=1692032465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GKi/ylxygovjlPf6mua/FLxbGKNsQH3//RWonl36ciA=;
 b=dop4vKi12DYvQUGfzdjXRJMSibHsdYHfzugjMw30Qhcq8rhJ0uUxtgyLU89kfE6xBE
 cPNoBQzVg9AOxB6P8ThKPRKrc0T65ZSwdvl3hkF+hA+s/CfICmq0MnvC1p40OGckN1so
 idOP7uZg79K8T2vAD5zHeN+LbyyEZDyTTyX7Pk0XUHY30AJ1+k0j8OJiFaGJi67HZpYD
 SLx/jkZ+P/+o2lVT/P4M/iMWPzwP7G5LppwJPdwRennzPotgWzxCtuVr/0lCkf99Enmb
 3PCDUPQelwgvvP8m9nSK8r2C2J3SAkHJUDRQIuwxxp9INKYH70d3x9HBqXNkmspJc3vy
 KKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427665; x=1692032465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GKi/ylxygovjlPf6mua/FLxbGKNsQH3//RWonl36ciA=;
 b=MDlmYcketfQlvPE6eI3jvHxa+FULLKlpyFmY/7CcjWVwnCoUQeyBdouRIbWerrgLSf
 3AaG3ubUK16UoboeUy6e+uWlyI/lMM6Bv4WQzaJIw+P4QDbivZWjizvPTSzbSE8SRkHF
 cOnXP7JkLFyKrY3IEjuPR32xD0aln4lE7Dfwq8mLth+1Q9fRMisMGgUSnMaye1fSE7HN
 Ck09+AAdOEi2jKQk+eScB4oS2zRtk5POwllWSm2yM38Lgc69PFDvtYjVXXal2yEwDqIX
 vFkYgriAUHxZMtfSBWthDK4PQj18p6C4OuAS6T7xvowlowg1k2sqw/nLya0ZkunIyY91
 c10Q==
X-Gm-Message-State: AOJu0YxwGCmANb18pFfnYbYTuj5qPO4DhusXRLZ6F5dt50li0d6yqhsb
 l5aRH00U1izwGmrkv94W6Ck4bPiuQZu85KT4FjHjXTQU
X-Google-Smtp-Source: AGHT+IHXcRHl6PiCY49Vwty52gk4G0CN2uuAjoSjckBdYdUSo4qenBQADiiDq3PreabnVG+dT82n9lPqjRi88StUeTI=
X-Received: by 2002:a05:6870:524d:b0:1bb:a264:a7ba with SMTP id
 o13-20020a056870524d00b001bba264a7bamr11346535oai.56.1691427665071; Mon, 07
 Aug 2023 10:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230802015941.9124-1-sunran001@208suo.com>
In-Reply-To: <20230802015941.9124-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:00:54 -0400
Message-ID: <CADnq5_Mh7-uGDEG-WAkrUT=XjFQ_77wMMq_oaUFbZqmdQxGAcA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu75.h
To: Ran Sun <sunran001@208suo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 9:59=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space prohibited before open square bracket '['
> ERROR: "foo * bar" should be "foo *bar"
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/inc/smu75.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu75.h b/drivers/gpu/d=
rm/amd/pm/powerplay/inc/smu75.h
> index 771523001533..7d5ed7751976 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu75.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu75.h
> @@ -224,8 +224,8 @@ struct SMU7_LocalDpmScoreboard {
>         uint8_t  DteClampMode;
>         uint8_t  FpsClampMode;
>
> -       uint16_t LevelResidencyCounters [SMU75_MAX_LEVELS_GRAPHICS];
> -       uint16_t LevelSwitchCounters [SMU75_MAX_LEVELS_GRAPHICS];
> +       uint16_t LevelResidencyCounters[SMU75_MAX_LEVELS_GRAPHICS];
> +       uint16_t LevelSwitchCounters[SMU75_MAX_LEVELS_GRAPHICS];
>
>         void     (*TargetStateCalculator)(uint8_t);
>         void     (*SavedTargetStateCalculator)(uint8_t);
> @@ -316,7 +316,7 @@ struct SMU7_VoltageScoreboard {
>
>         VoltageChangeHandler_t functionLinks[6];
>
> -       uint16_t * VddcFollower1;
> +       uint16_t *VddcFollower1;
>         int16_t  Driver_OD_RequestedVidOffset1;
>         int16_t  Driver_OD_RequestedVidOffset2;
>  };
> @@ -677,9 +677,9 @@ typedef struct SCS_CELL_t SCS_CELL_t;
>
>  struct VFT_TABLE_t {
>         VFT_CELL_t    Cell[TEMP_RANGE_MAXSTEPS][NUM_VFT_COLUMNS];
> -       uint16_t      AvfsGbv [NUM_VFT_COLUMNS];
> -       uint16_t      BtcGbv  [NUM_VFT_COLUMNS];
> -       int16_t       Temperature [TEMP_RANGE_MAXSTEPS];
> +       uint16_t      AvfsGbv[NUM_VFT_COLUMNS];
> +       uint16_t      BtcGbv[NUM_VFT_COLUMNS];
> +       int16_t       Temperature[TEMP_RANGE_MAXSTEPS];
>
>  #ifdef SMU__FIRMWARE_SCKS_PRESENT__1
>         SCS_CELL_t    ScksCell[TEMP_RANGE_MAXSTEPS][NUM_VFT_COLUMNS];
> --
> 2.17.1
>
