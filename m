Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F5648B4D
	for <lists+dri-devel@lfdr.de>; Sat, 10 Dec 2022 00:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5772110E595;
	Fri,  9 Dec 2022 23:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A1110E08F;
 Fri,  9 Dec 2022 23:16:47 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1447c7aa004so1525300fac.11; 
 Fri, 09 Dec 2022 15:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PkLQpu5eL9OZHKRdAfTyoXfk6Fj63Rxr9laOGfg5xGc=;
 b=IRlMxe/QOBYNsZOuFX2veFnSjEcbVyUfnIFUjzu7cAUBoFvhBrAaqJDzWWdVJMjMTg
 lO7d4nhXBvVfUdinsnNcocldGhGe5YBDB4BzQy54ZcIzuUscMEXv0JNrVKpZi2ppZ9bC
 /9pp1sp7Q4FiNKbgnacrziuWpvY8GNsBoRRcHcB+2DIwO1mdrAR9ECLBPG8dUAv3ciXJ
 i2fBuNWyfruZxToVdAlV23G/60j4Bbl4D52ZBnVcMfSheftPK859x3Gd/kHNw+Pbkuyn
 Iv0Ejc29hRhdSTUbIq8qtlKxf4dumHmin/ghLjPGURAMBnceWh2GMwFHjsHgjolu6e0v
 nYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PkLQpu5eL9OZHKRdAfTyoXfk6Fj63Rxr9laOGfg5xGc=;
 b=hPKt1rTqbA+lDjfVJtsAbNo7w6KkwGv7wf8UrACA3vGCapD2JHJve0YWaBEnMdlZJw
 WAKpnnmdnoGgS4UykeorVyxAA1ey33V6q+tfAMSeAr0wmQgf4wvH3HlQEtwtB1BQHoJO
 yDccMybBVQrriFMnBVcedYOqPyll6URvcI2N54ykrWG/1TdT5eLJlPb8YlFem1ToFP72
 Rhl/MZcvbnHcXcZehsN4G/vqRih8AeVPct2yAP8DUQ7Xjpke77VFSDmPo7JJ8NE48de4
 HSAsayL9sBE8cTyLnB2NQSsKIZLYOnA9PSR/9b+K8LJaq7MLDavwAbBok8wrgBe68pQx
 zXkw==
X-Gm-Message-State: ANoB5plYwWSgbzN5hEDe2jhUnCsSKBnatTCQ6tXT/toZhF7DeoS3fi2h
 QyS4lYyvaaS6wVCTdW+O2eL4jvFvf4eKdf8/8qU=
X-Google-Smtp-Source: AA0mqf6MtRxq7OjbEiJtrmZnXTvTYRNWU2BbVAy8sQApGfyusInceJkgyzbXJEi2tUHTr2CeLSl9o+U+ljlumUDckC0=
X-Received: by 2002:a05:6870:2b05:b0:12d:58c1:33f9 with SMTP id
 ld5-20020a0568702b0500b0012d58c133f9mr44331937oab.46.1670627806672; Fri, 09
 Dec 2022 15:16:46 -0800 (PST)
MIME-Version: 1.0
References: <Y5LwqRCPcYLizJFt@mail.google.com>
In-Reply-To: <Y5LwqRCPcYLizJFt@mail.google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Dec 2022 18:16:34 -0500
Message-ID: <CADnq5_NOyyLetx+wUtYL4f7ETHzVFAw_JnbGXGh5G1KYbUH3Zg@mail.gmail.com>
Subject: Re: [PATCH] [next] drm/radeon: Replace 1-element arrays with
 flexible-array members
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Dec 9, 2022 at 3:24 AM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> One-element arrays are deprecated, and we are replacing them with
> flexible array members instead. So, replace one-element array with
> flexible-array member in structs _ATOM_DISPLAY_OBJECT_PATH,
> _ATOM_DISPLAY_OBJECT_PATH_TABLE, _ATOM_OBJECT_TABLE, GOP_VBIOS_CONTENT
> _ATOM_GPIO_VOLTAGE_OBJECT_V3 and refactor the rest of the code accordingly.
>
> It's worth mentioning that doing a build before/after this patch
> results in no binary output differences.
>
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
>
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/239
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]
>
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
> Notes for the maintainer:
>
> - These are all fake-flexible arrays with references in source code for
>   the radeon driver. Given the way they are used, no change to *.c files
>   were required.
> ---
>  drivers/gpu/drm/radeon/atombios.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
> index 235e59b547a1..8a6621f1e82c 100644
> --- a/drivers/gpu/drm/radeon/atombios.h
> +++ b/drivers/gpu/drm/radeon/atombios.h
> @@ -4020,7 +4020,7 @@ typedef struct  _ATOM_DISPLAY_OBJECT_PATH
>    USHORT    usSize;                                        //the size of ATOM_DISPLAY_OBJECT_PATH
>    USHORT    usConnObjectId;                                //Connector Object ID
>    USHORT    usGPUObjectId;                                 //GPU ID
> -  USHORT    usGraphicObjIds[1];                             //1st Encoder Obj source from GPU to last Graphic Obj destinate to connector.
> +  USHORT    usGraphicObjIds[];                             //1st Encoder Obj source from GPU to last Graphic Obj destinate to connector.
>  }ATOM_DISPLAY_OBJECT_PATH;
>
>  typedef struct  _ATOM_DISPLAY_EXTERNAL_OBJECT_PATH
> @@ -4037,7 +4037,7 @@ typedef struct _ATOM_DISPLAY_OBJECT_PATH_TABLE
>    UCHAR                           ucNumOfDispPath;
>    UCHAR                           ucVersion;
>    UCHAR                           ucPadding[2];
> -  ATOM_DISPLAY_OBJECT_PATH        asDispPath[1];
> +  ATOM_DISPLAY_OBJECT_PATH        asDispPath[];
>  }ATOM_DISPLAY_OBJECT_PATH_TABLE;
>
>
> @@ -4053,7 +4053,7 @@ typedef struct _ATOM_OBJECT_TABLE                         //Above 4 object table
>  {
>    UCHAR               ucNumberOfObjects;
>    UCHAR               ucPadding[3];
> -  ATOM_OBJECT         asObjects[1];
> +  ATOM_OBJECT         asObjects[];
>  }ATOM_OBJECT_TABLE;
>
>  typedef struct _ATOM_SRC_DST_TABLE_FOR_ONE_OBJECT         //usSrcDstTableOffset pointing to this structure
> @@ -4615,7 +4615,7 @@ typedef struct  _ATOM_GPIO_VOLTAGE_OBJECT_V3
>     UCHAR    ucPhaseDelay;                // phase delay in unit of micro second
>     UCHAR    ucReserved;
>     ULONG    ulGpioMaskVal;               // GPIO Mask value
> -   VOLTAGE_LUT_ENTRY_V2 asVolGpioLut[1];
> +   VOLTAGE_LUT_ENTRY_V2 asVolGpioLut[];
>  }ATOM_GPIO_VOLTAGE_OBJECT_V3;
>
>  typedef struct  _ATOM_LEAKAGE_VOLTAGE_OBJECT_V3
> @@ -7964,7 +7964,7 @@ typedef struct {
>
>  typedef struct {
>    VFCT_IMAGE_HEADER    VbiosHeader;
> -  UCHAR        VbiosContent[1];
> +  UCHAR        VbiosContent[];
>  }GOP_VBIOS_CONTENT;
>
>  typedef struct {
> --
> 2.38.1
>
