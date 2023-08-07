Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185E772BEE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3131C10E30C;
	Mon,  7 Aug 2023 17:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26CA10E30A;
 Mon,  7 Aug 2023 17:01:56 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-56c685b7e91so3113672eaf.2; 
 Mon, 07 Aug 2023 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427716; x=1692032516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0sPbbuQHjUxy7oDdnPJjchuEOxUnF5YIqG/ENh0PvEY=;
 b=m2cV+XgsH/1HSspbcpCMx+3r5uswy4jWSGM9tllwSpxcWEdFFaullwKWraLSzrdu9R
 sm4rdsKfU2pLAKdAL7bwbq42jsH+UbIOhoOgKCbEdrM2UWJOA7f3S9w30HyQHw97ikqj
 06xYa2nUfu94x/XMPH2tIHbccwxFHP+pMi6VDOwh6XAIX2kRT25yUWsIvDlX+W4w7mB0
 R+7zI3lEMUIhxvgqmkv2zoNai8VVgAea2KvSmOAqJGzBr0WIz/Ot0oeD1R99quCiyr4F
 7/Ic98LILCIMDYJ3+Ph/DfrjsLELA9yWOX6BJQPJPQCMQQaIu4vtulz+988gXJO6eNpv
 zO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427716; x=1692032516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0sPbbuQHjUxy7oDdnPJjchuEOxUnF5YIqG/ENh0PvEY=;
 b=i2hCGtKlNexbZjucVgaiz0TQJMkbtU4wV2NyxMEmMEPzachtzZrZ/WNlw3n2XgWJHH
 a3AQP3sedlInlBAPOePdsz4xMP37iCKH9ACVlB44RGyXTHWpSSYcEBrq1UIR9Uh5Z3qP
 wNbA/+vNejHDuFQUNgmgyMcZIh8TTGQz99Tf59vJ32PPOz+pAHfQp7NSzM2NzrEexA7+
 CcZqJMSeOpdVuS1uzIasCNZ3BZXBU1XxcrWFER0ZlwSOf0YgJXMZSo+cm5QauQu19Iho
 ADI0vmLMoxr0XySinq7bXP9i+92wMhHqYiE4/getv+TaXY7ozOJ4Hto7C2NbsOEYWgNx
 i1Tw==
X-Gm-Message-State: AOJu0Yx0RgiPPpqRfnRndFlz8l/L4c7py/BtPc0H0k4O2SHciREM/UQ4
 Rpj2rEb33aQCtCnDafP8foz7Mms+mjmiVEjEkfs=
X-Google-Smtp-Source: AGHT+IF5QIcbT5+WCBnJ293rhtM/BzGfjCnE0duO5lX0GFVyhqKv0D57sO0c17AF/nWdnhkUJWf7lGgBSQM//mLkwuw=
X-Received: by 2002:a4a:6c5b:0:b0:56c:e928:2889 with SMTP id
 u27-20020a4a6c5b000000b0056ce9282889mr8692494oof.3.1691427715991; Mon, 07 Aug
 2023 10:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230802020312.9233-1-sunran001@208suo.com>
In-Reply-To: <20230802020312.9233-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:01:45 -0400
Message-ID: <CADnq5_MmwoaF-rprRfsAV86kYjkjRDV2BBgWkgXDLFifnnK6Sw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu8_smumgr.h
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

Need to be careful with these changes to make sure we aren't changing
the size calculations somewhere.

Alex

On Tue, Aug 1, 2023 at 10:03=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: Use C99 flexible arrays
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h b/driv=
ers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> index c7b61222d258..475ffcf743d2 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> @@ -73,7 +73,7 @@ struct smu8_register_index_data_pair {
>
>  struct smu8_ih_meta_data {
>         uint32_t command;
> -       struct smu8_register_index_data_pair register_index_value_pair[1]=
;
> +       struct smu8_register_index_data_pair register_index_value_pair[0]=
;
>  };
>
>  struct smu8_smumgr {
> --
> 2.17.1
>
