Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3661C513B69
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 20:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD1810E43D;
	Thu, 28 Apr 2022 18:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABEA10E43D;
 Thu, 28 Apr 2022 18:20:10 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id e4so6223899oif.2;
 Thu, 28 Apr 2022 11:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSkLqqraq4ZJNQe/eZcJ3+XKx5848eMDeTMp9yd+NZM=;
 b=obYe3GbeS28Q8s3W22+uGpah48Yhjrf3iqtEBYsC2yYSMYDDkbfzvkmpRD62rdvOzG
 GoWzspgjSsB104FKymYqPB2lYKBjSDvsL02cNJC4nsbZCe8BgKv6BSdazIfFuqACk5Fp
 jYkoGdOVCyOqtTj74zy5qcochi33suJma61KdJ22oyzS7lhQRQ3iqMDPwFXFuM+eSGmj
 wvRl2NdpJImE1xNcegaHj8cAipsw0KfQJVSp3pk6ogdCMQ9xdp3VDRjo8b9JVex3Z+kF
 zLshy82k7rwKwnQwRuOysMzFy68RKxIh9AdBo0OrDZM/8E/1pw9Ko6gp53tRlehoiEWv
 LmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSkLqqraq4ZJNQe/eZcJ3+XKx5848eMDeTMp9yd+NZM=;
 b=CAmRZ+hrXpwdvuJPCe8UShLoylUbFM4m1WYH0lthgVRZ31DBsFsXyh/tx5eA7LnwRd
 bXPHWA64Ze+fO6t7lr6tIF15zz77zrOx8bucF3rntU6AsNMeOpFnUb4M8FfJ0uKkasN2
 ecjnU+hw7nSaZSp/ZBGoThCCXutt6ja+tHOZFHlchrD/Tpva7HF4QQi+QJAkEXdSjM5X
 hwF2VmX+tJoiii2M0bNBV3pXIrv0n2CzzzpWaOzQPy+KsO5vHTy39Y1IhDnnCD1J1MkZ
 xi1oSm7mwas2E3gJ+8M1vZHkfkhdclQK8n18bqZj71fQd7wc+U6Ryx9tcLCIvX68cAK8
 E8QA==
X-Gm-Message-State: AOAM531hJg3amvszAKLkQ4sIzuBC8hHoRdA9b3Tmo3oqzall24Dmb1Pz
 4evwpeaNxphmJ6TnqUrZFyvtO0HyAqM19FHbc8E=
X-Google-Smtp-Source: ABdhPJwshtYA+L5Ift7DeQosPnfBSDjxkl9c/30PQ8kqkkhv+1eC2bfEn00RvDYu/DdL1+5O4iX+glwTNv5FfFcl9Q0=
X-Received: by 2002:aca:3d88:0:b0:321:141:ce0b with SMTP id
 k130-20020aca3d88000000b003210141ce0bmr19523709oia.200.1651170009987; Thu, 28
 Apr 2022 11:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220428072000.6542-1-pengfuyuan@kylinos.cn>
In-Reply-To: <20220428072000.6542-1-pengfuyuan@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 28 Apr 2022 14:19:58 -0400
Message-ID: <CADnq5_P-TMs2f+9Bfd8MXZxxYcc1VPux4Ed1iQSkbXzFPdwPQw@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/radeon: Fix spelling typo in comments
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 28, 2022 at 3:37 AM pengfuyuan <pengfuyuan@kylinos.cn> wrote:
>
> Fix spelling typo in comments.
>
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
> ---
>  drivers/gpu/drm/radeon/atombios.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
> index bd5dc09e860f..e00d6adf7262 100644
> --- a/drivers/gpu/drm/radeon/atombios.h
> +++ b/drivers/gpu/drm/radeon/atombios.h
> @@ -3599,7 +3599,7 @@ typedef struct  _ATOM_LCD_RTS_RECORD
>    UCHAR     ucRTSValue;
>  }ATOM_LCD_RTS_RECORD;
>
> -//!! If the record below exits, it shoud always be the first record for easy use in command table!!!
> +//!! If the record below exits, it should always be the first record for easy use in command table!!!

s/exits/exists/

Other than that, it looks good to me.

Alex

>  // The record below is only used when LVDS_Info is present. From ATOM_LVDS_INFO_V12, use ucLCDPanel_SpecialHandlingCap instead.
>  typedef struct  _ATOM_LCD_MODE_CONTROL_CAP
>  {
> @@ -3823,7 +3823,7 @@ typedef struct _ATOM_DPCD_INFO
>  // Note1: This table is filled by SetBiosReservationStartInFB in CoreCommSubs.asm
>  //        at running time.
>  // note2: From RV770, the memory is more than 32bit addressable, so we will change
> -//        ucTableFormatRevision=1,ucTableContentRevision=4, the strcuture remains
> +//        ucTableFormatRevision=1,ucTableContentRevision=4, the structure remains
>  //        exactly same as 1.1 and 1.2 (1.3 is never in use), but ulStartAddrUsedByFirmware
>  //        (in offset to start of memory address) is KB aligned instead of byte aligend.
>  /***********************************************************************************/
> @@ -3858,7 +3858,7 @@ typedef struct _ATOM_VRAM_USAGE_BY_FIRMWARE
>    ATOM_FIRMWARE_VRAM_RESERVE_INFO      asFirmwareVramReserveInfo[ATOM_MAX_FIRMWARE_VRAM_USAGE_INFO];
>  }ATOM_VRAM_USAGE_BY_FIRMWARE;
>
> -// change verion to 1.5, when allow driver to allocate the vram area for command table access.
> +// change version to 1.5, when allow driver to allocate the vram area for command table access.
>  typedef struct _ATOM_FIRMWARE_VRAM_RESERVE_INFO_V1_5
>  {
>    ULONG   ulStartAddrUsedByFirmware;
> @@ -5973,7 +5973,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
>  #define CLEAR_ATOM_S7_DOS_8BIT_DAC_EN         ((ATOM_DOS_MODE_INFO_DEF << 8 )|ATOM_S7_DOS_8BIT_DAC_EN_SHIFT | ATOM_FLAG_CLEAR )
>
>  /****************************************************************************/
> -//Portion II: Definitinos only used in Driver
> +//Portion II: Definitions only used in Driver
>  /****************************************************************************/
>
>  // Macros used by driver
> @@ -7162,7 +7162,7 @@ typedef struct _DP_ENCODER_SERVICE_PARAMETERS
>
>  // ucAction
>  #define ATOM_DP_ACTION_GET_SINK_TYPE                                                   0x01
> -/* obselete */
> +/* obsolete */
>  #define ATOM_DP_ACTION_TRAINING_START                                                  0x02
>  #define ATOM_DP_ACTION_TRAINING_COMPLETE                                       0x03
>  #define ATOM_DP_ACTION_TRAINING_PATTERN_SEL                            0x04
> --
> 2.25.1
>
