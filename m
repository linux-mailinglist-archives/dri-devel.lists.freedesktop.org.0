Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED1A772B8B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C55E10E2F5;
	Mon,  7 Aug 2023 16:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CC710E2F5;
 Mon,  7 Aug 2023 16:53:31 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1bf54f415afso2652209fac.3; 
 Mon, 07 Aug 2023 09:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427211; x=1692032011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLRoozb0+Gs5ofW34vZ6zv9jitiui+Q1IYSegK3uXaU=;
 b=Yw4WkyWsnCJUsB1QLoWXYxFXxP4HJWUK6ELdleOp2COMgHeAQYvnJPhoRW4cftlUhO
 u/V7sVOnnO50KrGOJ6TMpDCeyAKCROa8E++y+zhkmDm0RGDF19e5W+uU1iFm7zb+S9/8
 92nJV6rZ5VzOfryX01lMSxPMzr1lUsp6/+VBPy6yFbsMdotuoo/OWip56MP10wCMqorF
 hmGXhy2MbXqNl6WldWihgNxBdPogffOMOJdY40ANcViWd3EbQCP/M0sy0nrmIYrTUXj6
 gOXozOIGlAo4VTY2lMGhZli178Lebu6ZIviXQ4NckaT7h/kneM9Biz9nqXOoAGWwNj6M
 gF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427211; x=1692032011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLRoozb0+Gs5ofW34vZ6zv9jitiui+Q1IYSegK3uXaU=;
 b=D/zncSokE8IFR2ujkrUqUbijHakGG8RmNvSATR0YDfK8ExAdQ0h18wmXAgsaFjJ9d8
 MH+pPrLtk0FYytecNtkhn2vr0/e84yTMsn85zP9Q3goVIcj4Kmij7euuQkmpEQjgSdgZ
 /4gfpPo4HqntRiOlpm1PcAZb269auOCnubk5Bxt+r45UEK7hhZo0jv7jH8rABINVm6fw
 NPf7PtosZDJ+3niSKRu202joiPHRK6t/8XBxSymjaxI5Xsf/Bz2WX8yVPOmVHq6MIdfq
 aN3/V05piLWaUb28BS6bZIa9+VgHsSvEsQPkt7J8epOg9CTGQFAP1ndUZEOaMVFSI3tl
 CKRA==
X-Gm-Message-State: AOJu0Yw0cV5N9fDQFoJcIA6BMcVVotpOOCHYFVGCLQ3S6ED0KnT3yu8Q
 gbp+aUAp4cIZ9/a48wX1nIpi7dhuRPSH44K7Hj4=
X-Google-Smtp-Source: AGHT+IFq83Az3S8S2tZiqWs8mYYSFPtms9A2S2DaQFzDZtAmCStVFdHp4lMV8d34R91aGAFliySthbf+c/Ic5OIPfxE=
X-Received: by 2002:a05:6870:d252:b0:1bb:8cc2:8c3e with SMTP id
 h18-20020a056870d25200b001bb8cc28c3emr9703625oac.15.1691427211035; Mon, 07
 Aug 2023 09:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230801095056.8120-1-sunran001@208suo.com>
In-Reply-To: <20230801095056.8120-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:53:20 -0400
Message-ID: <CADnq5_N4tdXL2Fc0j5ZoYAjV=ZDfWctk1J=sOHgRB6CjHzNwgA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu9_driver_if.h
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 5:51=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space prohibited before open square bracket '['
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../drm/amd/pm/powerplay/inc/smu9_driver_if.h | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h b/driv=
ers/gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h
> index faae4b918d90..2c69a5694f94 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h
> @@ -178,20 +178,20 @@ typedef struct {
>    uint8_t      padding8_2[2];
>
>    /* SOC Frequencies */
> -  PllSetting_t GfxclkLevel        [NUM_GFXCLK_DPM_LEVELS];
> +  PllSetting_t GfxclkLevel[NUM_GFXCLK_DPM_LEVELS];
>
> -  uint8_t      SocclkDid          [NUM_SOCCLK_DPM_LEVELS];          /* D=
ID */
> -  uint8_t      SocDpmVoltageIndex [NUM_SOCCLK_DPM_LEVELS];
> +  uint8_t      SocclkDid[NUM_SOCCLK_DPM_LEVELS];          /* DID */
> +  uint8_t      SocDpmVoltageIndex[NUM_SOCCLK_DPM_LEVELS];
>
> -  uint8_t      VclkDid            [NUM_UVD_DPM_LEVELS];            /* DI=
D */
> -  uint8_t      DclkDid            [NUM_UVD_DPM_LEVELS];            /* DI=
D */
> -  uint8_t      UvdDpmVoltageIndex [NUM_UVD_DPM_LEVELS];
> +  uint8_t      VclkDid[NUM_UVD_DPM_LEVELS];            /* DID */
> +  uint8_t      DclkDid[NUM_UVD_DPM_LEVELS];            /* DID */
> +  uint8_t      UvdDpmVoltageIndex[NUM_UVD_DPM_LEVELS];
>
> -  uint8_t      EclkDid            [NUM_VCE_DPM_LEVELS];            /* DI=
D */
> -  uint8_t      VceDpmVoltageIndex [NUM_VCE_DPM_LEVELS];
> +  uint8_t      EclkDid[NUM_VCE_DPM_LEVELS];            /* DID */
> +  uint8_t      VceDpmVoltageIndex[NUM_VCE_DPM_LEVELS];
>
> -  uint8_t      Mp0clkDid          [NUM_MP0CLK_DPM_LEVELS];          /* D=
ID */
> -  uint8_t      Mp0DpmVoltageIndex [NUM_MP0CLK_DPM_LEVELS];
> +  uint8_t      Mp0clkDid[NUM_MP0CLK_DPM_LEVELS];          /* DID */
> +  uint8_t      Mp0DpmVoltageIndex[NUM_MP0CLK_DPM_LEVELS];
>
>    DisplayClockTable_t DisplayClockTable[DSPCLK_COUNT][NUM_DSPCLK_LEVELS]=
;
>    QuadraticInt_t      DisplayClock2Gfxclk[DSPCLK_COUNT];
> --
> 2.17.1
>
