Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA93731ECE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 19:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A5510E528;
	Thu, 15 Jun 2023 17:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3A510E528;
 Thu, 15 Jun 2023 17:16:20 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-558c8a109bdso701142eaf.1; 
 Thu, 15 Jun 2023 10:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686849379; x=1689441379;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Zvw/N0cOumXbbZ81vLKyTA+j5vgM9L3CnYOXhhTKaA=;
 b=ijhz1/xnH8dq1iakUnwQbeOxnXjZBMiAAYtuoan8SWXDq/WOPkwFs4Xp3NAkAAroN4
 9eJFKpKHG5YX7tlOBJez8FN9WrZPgoQfijxj/WIWjN70W7C2VpEwoAHGo+8I84J/nCag
 vCX86oNRio6Ycin2NT3v25Sp5OrYi+K8KytPGlj4uIvIDhNAATsbiqISEWeGaXvUkboi
 EjqGHJjuRCUoEVLaeH7cVd5RykxG/S4R2E1lfuv8xDfTNBG59MMZgdAMbe/9TH3DOCg3
 HKvy3KWlyn5rcH2f2ba6gM77JQYQl7vGptKNFkgqGLE5ZSb9+DH400Hcm6m8XM4eEhKs
 Z2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686849379; x=1689441379;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Zvw/N0cOumXbbZ81vLKyTA+j5vgM9L3CnYOXhhTKaA=;
 b=XUQhLC5u4vTmvP2RvXIB3wzQF1BhtCBRf7V1aQNBhEz3Cz0S09VBW9tCMkXt5rEX7V
 uyRQNX723n7nlLzvu7yE1bKlFGkJXvtN/kZO2sHpiXDFruMIpms51vuPv7loVcyQlr79
 gfU9MO9r2U3VD1dwPmGAYd3woQe91vnNCRX+seIGDozjHDeFzSD73X4hQdADOVG5xNfh
 TN1+0xvHsNm4/cYr9GS4PdXHWEUwpdK8if837VLSZiQRTPLa+D0CHhkeY7WZ/HsPsCnp
 Xvpjq3yNgx/QDIQRBr43cmv7Lcd8rE08a33Dpkv3kD2JKnAEQzgd7BAty6sJQXadIJz2
 QyWQ==
X-Gm-Message-State: AC+VfDzmd1DDpcazLqI8MdzzPxawnokV4+oKBKlVmg+YVs8LLufWoF0w
 cB6zc1WOvUI6pitLaDstggCWKz33zoac7bslMB4=
X-Google-Smtp-Source: ACHHUZ4POIy+0PaqoiRrlH+MGs2QaSUATqPRf+VEjZEiymlcK6iI+rWJT9kn6NVhbnZfSGfv8AV4QAtMVWTwq6/VmWA=
X-Received: by 2002:a4a:e70a:0:b0:558:cd46:6104 with SMTP id
 y10-20020a4ae70a000000b00558cd466104mr3323508oou.0.1686849378850; Thu, 15 Jun
 2023 10:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230614022440.33828-1-luojianhong@cdjrlc.com>
 <1ccd72cc9fa4b0f1c5acceef0c21d9fb@208suo.com>
In-Reply-To: <1ccd72cc9fa4b0f1c5acceef0c21d9fb@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Jun 2023 13:16:07 -0400
Message-ID: <CADnq5_OEWo7cS=kUPQRyjfx-j=vR27hme5TG8SvOUUu1mJ3Qug@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unneeded variable
To: baomingtong001@208suo.com
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 14, 2023 at 3:20=E2=80=AFAM <baomingtong001@208suo.com> wrote:
>
> fix the following coccicheck warning:
>
> drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c:1156:5-11:
> Unneeded variable: "result".
>

This variable is used and the code fails to compile with it removed.

Alex

> Signed-off-by: Mingtong Bao <baomingtong001@208suo.com>
> ---
>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> index 21be23ec3c79..36aa7657c66d 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_powertune.c
> @@ -1153,7 +1153,6 @@ int smu7_enable_power_containment(struct pp_hwmgr
> *hwmgr)
>       struct phm_ppt_v1_information *table_info =3D
>               (struct phm_ppt_v1_information *)(hwmgr->pptable);
>       int smc_result;
> -    int result =3D 0;
>       struct phm_cac_tdp_table *cac_table;
>
>       data->power_containment_features =3D 0;
> @@ -1191,7 +1190,7 @@ int smu7_enable_power_containment(struct pp_hwmgr
> *hwmgr)
>               }
>           }
>       }
> -    return result;
> +    return 0;
>   }
>
>   int smu7_disable_power_containment(struct pp_hwmgr *hwmgr)
