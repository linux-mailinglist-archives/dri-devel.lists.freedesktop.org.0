Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E8F614CEC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 15:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1398910E3E2;
	Tue,  1 Nov 2022 14:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B29010E3D4;
 Tue,  1 Nov 2022 14:42:27 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s206so16123996oie.3;
 Tue, 01 Nov 2022 07:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UqZRXhZ8iJLz18c+MvxYoRFq+rJsubjxLq+l9IkQCHc=;
 b=qKFPc/kz6f3nkMKSMl3PgJ4WiqQoPQvBVOh3dj4/2HGtY0pUacizp+bA07bsX+mIKB
 FAN95rJVisV2AU1C2HM1iB+wNK0BFDL29XqLIfVjq+be2MUJaJ32y37avBHQ9VPLeDhl
 nfY2li78agIuV+Ma3kgvE2qSxXc6NdbPF+3gtzTCihJ0xH08JyoKS0cX/RbRBO6TFZ+Q
 XcrGn2mFrzdA9Xz6XTEk8jOT+/cC/aJ8vgst8DoewhbiXz2A98Z/UIrtHXr6pORv8ADK
 fMZMKJOSXWF7Zqm/66APPRtFBtUeD86Nrw8HLXvHcWgp0RzFKV4Im6fftbPLCr2fO/j6
 Lnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UqZRXhZ8iJLz18c+MvxYoRFq+rJsubjxLq+l9IkQCHc=;
 b=L3cKduqiw+rhfQ22sDH8Dp6Kg3F0zdol29vK9/aMERMeYCarc1iZ9kPdfyqv9M2LrC
 /4VexrCIWli0u3f+7Gaet0OJDG+K2aKpMeYxodNil5J0ZhWhiLpDL/9BthJXyOzYW2ok
 /KWRuCF0zE3zndIhrxAXqfh+/9otFnste2u3o+0eEbNMkEkO2aP3p7IrRQpzTpMguz+N
 PianRIS3Tosdl03XxMoVIYABymAXs/6MfIVLJ+LSxIaySxHu3GbboeuuVCUfjvYOoIQI
 H1mePoSs63+IP0ip+3I4lfn3OPcLlFnkp2NbhRi9onu6h1TwGFznpRNuThPBU7bwM68U
 Yfpw==
X-Gm-Message-State: ACrzQf1hmSiYOid2zCC8HhPWlvu2J8DZim0wNJHZ2L8ClbYmgKhV0B0j
 iK8ioK15xrbT6ejpK26sGLGv53Zt4Wtv2uzkrgs=
X-Google-Smtp-Source: AMsMyM4kuFVgyWMCi4ySWY8bQ2GbqY1JyCCaGs2uhIMpeGyncIHdvM868n9C7ngoG+w9v2aGCHlk1+uKeNWzJj2svlE=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr10232550oiw.96.1667313746565; Tue, 01
 Nov 2022 07:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <Y1trhRE3nK5iAY6q@mail.google.com>
 <Y1yetX1CHsr+fibp@mail.google.com>
In-Reply-To: <Y1yetX1CHsr+fibp@mail.google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Nov 2022 10:42:14 -0400
Message-ID: <CADnq5_Mod90O=tN26+Yi74WPYxpVtss+LG_+_HZyFv2EtzR+MA@mail.gmail.com>
Subject: Re: [PATCH v2] [next] drm/radeon: Replace one-element array with
 flexible-array member
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

On Fri, Oct 28, 2022 at 11:32 PM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> One-element arrays are deprecated, and we are replacing them with
> flexible array members instead. So, replace one-element array with
> flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
> refactor the rest of the code accordingly.
>
> It's worth mentioning that doing a build before/after this patch results
> in no binary output differences.
>
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].

This seems like a worthy goal, and I'm not opposed to the patch per
se, but it seems a bit at odds with what this header represents.
atombios.h represents the memory layout of the data stored in the ROM
on the GPU.  This changes the memory layout of that ROM.  We can work
around that in the driver code, but if someone were to take this
header to try and write some standalone tool or use it for something
else in the kernel, it would not reflect reality.

Alex


>
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/239
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]
>
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
> Changelog:
>
> v2: no binary output differences patch; report binary changes findings
>     on commit log. Res: Kees Cook.
>
>     This request was made in an identical, yet different, patch but the
>     same feedback applies.
>     https://lore.kernel.org/lkml/Y1x3MtRJ8ckXxlJn@mail.google.com/
>
> v1: https://lore.kernel.org/lkml/Y1trhRE3nK5iAY6q@mail.google.com/
> ---
>  drivers/gpu/drm/radeon/atombios.h        | 2 +-
>  drivers/gpu/drm/radeon/radeon_atombios.c | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
> index da35a970fcc0..235e59b547a1 100644
> --- a/drivers/gpu/drm/radeon/atombios.h
> +++ b/drivers/gpu/drm/radeon/atombios.h
> @@ -3615,7 +3615,7 @@ typedef struct _ATOM_FAKE_EDID_PATCH_RECORD
>  {
>    UCHAR ucRecordType;
>    UCHAR ucFakeEDIDLength;
> -  UCHAR ucFakeEDIDString[1];    // This actually has ucFakeEdidLength elements.
> +  UCHAR ucFakeEDIDString[];    // This actually has ucFakeEdidLength elements.
>  } ATOM_FAKE_EDID_PATCH_RECORD;
>
>  typedef struct  _ATOM_PANEL_RESOLUTION_PATCH_RECORD
> diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
> index 204127bad89c..4ad5a328d920 100644
> --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> @@ -1727,8 +1727,11 @@ struct radeon_encoder_atom_dig *radeon_atombios_get_lvds_info(struct
>                                                 }
>                                         }
>                                         record += fake_edid_record->ucFakeEDIDLength ?
> -                                               fake_edid_record->ucFakeEDIDLength + 2 :
> -                                               sizeof(ATOM_FAKE_EDID_PATCH_RECORD);
> +                                                 struct_size(fake_edid_record,
> +                                                             ucFakeEDIDString,
> +                                                             fake_edid_record->ucFakeEDIDLength) :
> +                                                 /* empty fake edid record must be 3 bytes long */
> +                                                 sizeof(ATOM_FAKE_EDID_PATCH_RECORD) + 1;
>                                         break;
>                                 case LCD_PANEL_RESOLUTION_RECORD_TYPE:
>                                         panel_res_record = (ATOM_PANEL_RESOLUTION_PATCH_RECORD *)record;
> --
> 2.37.3
>
