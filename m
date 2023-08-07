Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD99772AC7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C339C10E2BC;
	Mon,  7 Aug 2023 16:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4506910E2BB;
 Mon,  7 Aug 2023 16:28:47 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1bbaa549c82so3697492fac.0; 
 Mon, 07 Aug 2023 09:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425726; x=1692030526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7txj5Wr6ROoQTJqcbxYmhrpGic354WJ+C4sk8T5K6w=;
 b=dbEAIOEB9crF8/J+Mcus6nCVrdI8oNwclSIcSvnqqWrjY4PwtdCjX2cIczpYVwJ0k5
 bnGfq+uo9AB+0SzIdlluNl2Z+iDlheObJYZXziiQNbjvMAKo2uqqpAHzKfIgrD4X9Uxd
 MqD9kjtKlr9yZ6qo0Ne9LsssUzXIjLMNYRmJ/1nwmiNP4LwOOJYOfovfMnafa6fQksEX
 RGZWpmthDJubnlj9LZO371RX4wcnMRskE2Z6Yq6HVyPurMJc5hSs0moOkP19DcD1Rk6Z
 0tvgZIJO7YQ+64+xrnN88RpppP/h3gIckh6XHydbM/CVlUfIC53Ny/dblzI0hBO9klyk
 5U2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425726; x=1692030526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7txj5Wr6ROoQTJqcbxYmhrpGic354WJ+C4sk8T5K6w=;
 b=WIsGYzMv0prxmPOKb0ht5z4zDXFaYVGbYxB8OcymzZsmwukzgedFSwwz2UD7sNYFli
 KZh5f0Rkq8WcSBh7H1T8mWg9Nn+L5TuhkpQLimYWC3unx3jxTLFvisOfR2n2BJbZ9EF4
 liLfyFPDe4Cki/sA6tD87CD04fD+MsSSG9Ux0L1KyZLM/ZXP7+H10i24ly0H4YeB/rqt
 ocKaWBVTxUkocIwxMBB6IsIfaqKAaDD07fDmZUf1uIer2+LKr0fT9HE4nthi120Xq9JF
 qOH/lxeeVb5zygu3TwThgDDQ+srcIWIw2OJHL18VmQjZlApXHLBwyl7HWEmvTcdIlixO
 eE0g==
X-Gm-Message-State: AOJu0Yzs3YYAzUAyHqD1jeNYhhmyah/AbuEaCkRNyGv9HUYW62XK7ndx
 s2tkOh0jd+LqlRpkrs3DAsmKvIsj5CdpAZeQ5TQGy6Ei
X-Google-Smtp-Source: AGHT+IEemXTDlorofSCPV/fhwBN0NAX3ctlOeGGqfumAv9TOUc6Ee1Y+s9SfiwIhEQTY4DmY7UDPpj8ZvrkAFAUpKzU=
X-Received: by 2002:a05:6871:521e:b0:1bf:607:e0ed with SMTP id
 ht30-20020a056871521e00b001bf0607e0edmr13627482oac.39.1691425726300; Mon, 07
 Aug 2023 09:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230801033741.5664-1-sunran001@208suo.com>
In-Reply-To: <20230801033741.5664-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:28:35 -0400
Message-ID: <CADnq5_NinWX_SoT1B4th9A8jobkX=kH69b1EXesqAGgHPhVBuw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in vega10_powertune.c
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

On Mon, Jul 31, 2023 at 11:38=E2=80=AFPM Ran Sun <sunran001@208suo.com> wro=
te:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
> ERROR: space prohibited after that open parenthesis '('
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../amd/pm/powerplay/hwmgr/vega10_powertune.c | 89 +++++++------------
>  1 file changed, 31 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c b/=
drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c
> index 309a9d3bc1b7..3007b054c873 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c
> @@ -30,8 +30,7 @@
>  #include "pp_debug.h"
>  #include "soc15_common.h"
>
> -static const struct vega10_didt_config_reg SEDiDtTuningCtrlConfig_Vega10=
[] =3D
> -{
> +static const struct vega10_didt_config_reg SEDiDtTuningCtrlConfig_Vega10=
[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -55,8 +54,7 @@ static const struct vega10_didt_config_reg SEDiDtTuning=
CtrlConfig_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SEDiDtCtrl3Config_vega10[] =
=3D
> -{
> +static const struct vega10_didt_config_reg SEDiDtCtrl3Config_vega10[] =
=3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset               Mask                                       =
              Shift                                                        =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -120,8 +118,7 @@ static const struct vega10_didt_config_reg SEDiDtCtrl=
3Config_vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SEDiDtCtrl2Config_Vega10[] =
=3D
> -{
> +static const struct vega10_didt_config_reg SEDiDtCtrl2Config_Vega10[] =
=3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                            Mask                          =
                       Shift                                               =
   Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -149,8 +146,7 @@ static const struct vega10_didt_config_reg SEDiDtCtrl=
2Config_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SEDiDtCtrl1Config_Vega10[] =
=3D
> -{
> +static const struct vega10_didt_config_reg SEDiDtCtrl1Config_Vega10[] =
=3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -172,8 +168,7 @@ static const struct vega10_didt_config_reg SEDiDtCtrl=
1Config_Vega10[] =3D
>  };
>
>
> -static const struct vega10_didt_config_reg SEDiDtWeightConfig_Vega10[] =
=3D
> -{
> +static const struct vega10_didt_config_reg SEDiDtWeightConfig_Vega10[] =
=3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                         Shift                                             =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -201,8 +196,7 @@ static const struct vega10_didt_config_reg SEDiDtWeig=
htConfig_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SEDiDtCtrl0Config_Vega10[] =
=3D
> -{
> +static const struct vega10_didt_config_reg SEDiDtCtrl0Config_Vega10[] =
=3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -260,8 +254,7 @@ static const struct vega10_didt_config_reg SEDiDtCtrl=
0Config_Vega10[] =3D
>  };
>
>
> -static const struct vega10_didt_config_reg SEDiDtStallCtrlConfig_vega10[=
] =3D
> -{
> +static const struct vega10_didt_config_reg SEDiDtStallCtrlConfig_vega10[=
] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                   Mask                                   =
                  Shift                                                    =
  Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -293,8 +286,7 @@ static const struct vega10_didt_config_reg SEDiDtStal=
lCtrlConfig_vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SEDiDtStallPatternConfig_vega=
10[] =3D
> -{
> +static const struct vega10_didt_config_reg SEDiDtStallPatternConfig_vega=
10[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                        Mask                              =
                        Shift                                              =
      Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -362,8 +354,7 @@ static const struct vega10_didt_config_reg SEDiDtStal=
lPatternConfig_vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SELCacConfig_Vega10[] =3D
> -{
> +static const struct vega10_didt_config_reg SELCacConfig_Vega10[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -401,8 +392,7 @@ static const struct vega10_didt_config_reg SELCacConf=
ig_Vega10[] =3D
>  };
>
>
> -static const struct vega10_didt_config_reg SEEDCStallPatternConfig_Vega1=
0[] =3D
> -{
> +static const struct vega10_didt_config_reg SEEDCStallPatternConfig_Vega1=
0[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -431,8 +421,7 @@ static const struct vega10_didt_config_reg SEEDCStall=
PatternConfig_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SEEDCForceStallPatternConfig_=
Vega10[] =3D
> -{
> +static const struct vega10_didt_config_reg SEEDCForceStallPatternConfig_=
Vega10[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -451,8 +440,7 @@ static const struct vega10_didt_config_reg SEEDCForce=
StallPatternConfig_Vega10[]
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SEEDCStallDelayConfig_Vega10[=
] =3D
> -{
> +static const struct vega10_didt_config_reg SEEDCStallDelayConfig_Vega10[=
] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -478,8 +466,7 @@ static const struct vega10_didt_config_reg SEEDCStall=
DelayConfig_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SEEDCThresholdConfig_Vega10[]=
 =3D
> -{
> +static const struct vega10_didt_config_reg SEEDCThresholdConfig_Vega10[]=
 =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -492,8 +479,7 @@ static const struct vega10_didt_config_reg SEEDCThres=
holdConfig_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SEEDCCtrlResetConfig_Vega10[]=
 =3D
> -{
> +static const struct vega10_didt_config_reg SEEDCCtrlResetConfig_Vega10[]=
 =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -514,8 +500,7 @@ static const struct vega10_didt_config_reg SEEDCCtrlR=
esetConfig_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SEEDCCtrlConfig_Vega10[] =3D
> -{
> +static const struct vega10_didt_config_reg SEEDCCtrlConfig_Vega10[] =3D =
{
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -536,8 +521,7 @@ static const struct vega10_didt_config_reg SEEDCCtrlC=
onfig_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg SEEDCCtrlForceStallConfig_Veg=
a10[] =3D
> -{
> +static const struct vega10_didt_config_reg SEEDCCtrlForceStallConfig_Veg=
a10[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -571,8 +555,7 @@ static const struct vega10_didt_config_reg SEEDCCtrlF=
orceStallConfig_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg    GCDiDtDroopCtrlConfig_vega=
10[] =3D
> -{
> +static const struct vega10_didt_config_reg    GCDiDtDroopCtrlConfig_vega=
10[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -586,8 +569,7 @@ static const struct vega10_didt_config_reg    GCDiDtD=
roopCtrlConfig_vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg    GCDiDtCtrl0Config_vega10[]=
 =3D
> -{
> +static const struct vega10_didt_config_reg    GCDiDtCtrl0Config_vega10[]=
 =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -601,8 +583,7 @@ static const struct vega10_didt_config_reg    GCDiDtC=
trl0Config_vega10[] =3D
>  };
>
>
> -static const struct vega10_didt_config_reg   PSMSEEDCStallPatternConfig_=
Vega10[] =3D
> -{
> +static const struct vega10_didt_config_reg   PSMSEEDCStallPatternConfig_=
Vega10[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -621,8 +602,7 @@ static const struct vega10_didt_config_reg   PSMSEEDC=
StallPatternConfig_Vega10[]
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg   PSMSEEDCStallDelayConfig_Ve=
ga10[] =3D
> -{
> +static const struct vega10_didt_config_reg   PSMSEEDCStallDelayConfig_Ve=
ga10[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -651,8 +631,7 @@ static const struct vega10_didt_config_reg   PSMSEEDC=
StallDelayConfig_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg   PSMSEEDCCtrlResetConfig_Veg=
a10[] =3D
> -{
> +static const struct vega10_didt_config_reg   PSMSEEDCCtrlResetConfig_Veg=
a10[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -673,8 +652,7 @@ static const struct vega10_didt_config_reg   PSMSEEDC=
CtrlResetConfig_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg   PSMSEEDCCtrlConfig_Vega10[]=
 =3D
> -{
> +static const struct vega10_didt_config_reg   PSMSEEDCCtrlConfig_Vega10[]=
 =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -695,8 +673,7 @@ static const struct vega10_didt_config_reg   PSMSEEDC=
CtrlConfig_Vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg   PSMGCEDCDroopCtrlConfig_veg=
a10[] =3D
> -{
> +static const struct vega10_didt_config_reg   PSMGCEDCDroopCtrlConfig_veg=
a10[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -710,8 +687,7 @@ static const struct vega10_didt_config_reg   PSMGCEDC=
DroopCtrlConfig_vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg   PSMGCEDCCtrlResetConfig_veg=
a10[] =3D
> -{
> +static const struct vega10_didt_config_reg   PSMGCEDCCtrlResetConfig_veg=
a10[] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -726,8 +702,7 @@ static const struct vega10_didt_config_reg   PSMGCEDC=
CtrlResetConfig_vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg   PSMGCEDCCtrlConfig_vega10[]=
 =3D
> -{
> +static const struct vega10_didt_config_reg   PSMGCEDCCtrlConfig_vega10[]=
 =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -742,8 +717,7 @@ static const struct vega10_didt_config_reg   PSMGCEDC=
CtrlConfig_vega10[] =3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg    AvfsPSMResetConfig_vega10[=
]=3D
> -{
> +static const struct vega10_didt_config_reg    AvfsPSMResetConfig_vega10[=
] =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -756,8 +730,7 @@ static const struct vega10_didt_config_reg    AvfsPSM=
ResetConfig_vega10[]=3D
>         {   0xFFFFFFFF  }  /* End of list */
>  };
>
> -static const struct vega10_didt_config_reg    AvfsPSMInitConfig_vega10[]=
 =3D
> -{
> +static const struct vega10_didt_config_reg    AvfsPSMInitConfig_vega10[]=
 =3D {
>  /* ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
>   *      Offset                             Mask                         =
                        Shift                                              =
    Value
>   * ---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------
> @@ -919,7 +892,7 @@ static int vega10_enable_cac_driving_se_didt_config(s=
truct pp_hwmgr *hwmgr)
>
>         mutex_lock(&adev->grbm_idx_mutex);
>         for (count =3D 0; count < num_se; count++) {
> -               data =3D GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK |=
 GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | ( count << GRBM_GFX_INDEX__SE_I=
NDEX__SHIFT);
> +               data =3D GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK |=
 GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | (count << GRBM_GFX_INDEX__SE_IN=
DEX__SHIFT);
>                 WREG32_SOC15(GC, 0, mmGRBM_GFX_INDEX, data);
>
>                 result =3D  vega10_program_didt_config_registers(hwmgr, S=
EDiDtStallCtrlConfig_vega10, VEGA10_CONFIGREG_DIDT);
> @@ -970,7 +943,7 @@ static int vega10_enable_psm_gc_didt_config(struct pp=
_hwmgr *hwmgr)
>
>         mutex_lock(&adev->grbm_idx_mutex);
>         for (count =3D 0; count < num_se; count++) {
> -               data =3D GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK |=
 GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | ( count << GRBM_GFX_INDEX__SE_I=
NDEX__SHIFT);
> +               data =3D GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK |=
 GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | (count << GRBM_GFX_INDEX__SE_IN=
DEX__SHIFT);
>                 WREG32_SOC15(GC, 0, mmGRBM_GFX_INDEX, data);
>
>                 result =3D vega10_program_didt_config_registers(hwmgr, SE=
DiDtStallCtrlConfig_vega10, VEGA10_CONFIGREG_DIDT);
> @@ -1031,7 +1004,7 @@ static int vega10_enable_se_edc_config(struct pp_hw=
mgr *hwmgr)
>
>         mutex_lock(&adev->grbm_idx_mutex);
>         for (count =3D 0; count < num_se; count++) {
> -               data =3D GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK |=
 GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | ( count << GRBM_GFX_INDEX__SE_I=
NDEX__SHIFT);
> +               data =3D GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK |=
 GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | (count << GRBM_GFX_INDEX__SE_IN=
DEX__SHIFT);
>                 WREG32_SOC15(GC, 0, mmGRBM_GFX_INDEX, data);
>                 result =3D vega10_program_didt_config_registers(hwmgr, SE=
DiDtWeightConfig_Vega10, VEGA10_CONFIGREG_DIDT);
>                 result |=3D vega10_program_didt_config_registers(hwmgr, S=
EEDCStallPatternConfig_Vega10, VEGA10_CONFIGREG_DIDT);
> @@ -1081,7 +1054,7 @@ static int vega10_enable_psm_gc_edc_config(struct p=
p_hwmgr *hwmgr)
>
>         mutex_lock(&adev->grbm_idx_mutex);
>         for (count =3D 0; count < num_se; count++) {
> -               data =3D GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK |=
 GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | ( count << GRBM_GFX_INDEX__SE_I=
NDEX__SHIFT);
> +               data =3D GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK |=
 GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | (count << GRBM_GFX_INDEX__SE_IN=
DEX__SHIFT);
>                 WREG32_SOC15(GC, 0, mmGRBM_GFX_INDEX, data);
>                 result =3D vega10_program_didt_config_registers(hwmgr, PS=
MSEEDCStallPatternConfig_Vega10, VEGA10_CONFIGREG_DIDT);
>                 result |=3D vega10_program_didt_config_registers(hwmgr, P=
SMSEEDCStallDelayConfig_Vega10, VEGA10_CONFIGREG_DIDT);
> --
> 2.17.1
>
