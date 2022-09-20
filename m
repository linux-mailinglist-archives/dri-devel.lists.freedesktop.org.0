Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08015BEAD4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 18:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226B610E706;
	Tue, 20 Sep 2022 16:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A66310E704;
 Tue, 20 Sep 2022 16:09:26 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1279948d93dso4878782fac.10; 
 Tue, 20 Sep 2022 09:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Ak/BTYCEqn8/gk40fTo/S/aYr9+8Izr7lnhdGq7bmAY=;
 b=IRONn0fwCOKADd82WVLuW6to0tPKkHo5ICanCh6D+wwaYH6qRMoyszQeiyJAVvshXh
 xEE8pvuxnrDGZcJ8Ro6nDqSFB3SIgwlGSynjk5H5GNVcouMRDySniX1TqMwIZgtx4geq
 4U9wt0wbMAJU50/DfRGw4TEoi3CftW2rgvSLcbO+IYIxfN8gpbLCJlZvp9aL+pSD7rhM
 AaJpEhI2rV6TTcqZAV7I6P0nqP8pkbhs8m08AsK2Q2bAxfQSROjS+XYi5zv6ruu9N8sv
 M5pr/aw6PuI0B4hcpjn0NrjM1/WgouV0HFLvDtPWH4CCPmetbEVntmRh8D83m6MlVBzP
 sygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Ak/BTYCEqn8/gk40fTo/S/aYr9+8Izr7lnhdGq7bmAY=;
 b=tGCkjUENK8abc+rBz5z50WUaP5DHKHpmx9V3DFqoJuDRY8GMFFAFMSjlgMhB5H2uCe
 bSEzQDIZ/cd/3Ch4pkW+40JEnLOMa3aJVDwCn2ElvRNk9XUm4cprBQJF0RlNegI9oMiD
 PlH7hDGLORlFUEOQW5xJFI3ZAjPGlZF5Fa9kyXYypfSEUM0z6rAbsATSVutW2CTf60la
 3+zyUCBrDJ53L5S72Q3vqD53TtDhzcdaPIjUW0QJh4GnNlsQky/mOKEyo1bfD3oZ19eX
 5Mx5niEb19FhrUH5p+437XKf6dmNtoft1brTclqnaJKOpbNFpmLk5wI83nOvWm1itJfd
 sHow==
X-Gm-Message-State: ACrzQf3QErPdqafxttW0uZm5RnWxVfTcRKtyz8v0QITtVT0kLQfPlq05
 UFHwhmOyEq9TV5wXZ1Orpfxcc6TBqQUrj2UgDhk=
X-Google-Smtp-Source: AMsMyM7HTtAqMDQIoo+e30SxRamT6lecvmPZDgAUHviZPjloGPSN1YYmwDdxL+lJH8uBrokRWNVp4LTfI5veZ8SjIhI=
X-Received: by 2002:a05:6870:738d:b0:125:1b5:420f with SMTP id
 z13-20020a056870738d00b0012501b5420fmr2548247oam.96.1663690165330; Tue, 20
 Sep 2022 09:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220920092453.16022-1-hongao@uniontech.com>
In-Reply-To: <20220920092453.16022-1-hongao@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Sep 2022 12:09:14 -0400
Message-ID: <CADnq5_MvCho_Ue3zyNf0tBd3iYqPKyDdveK9LhZwuYGNYiqQ2A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix initial connector audio value
To: hongao <hongao@uniontech.com>
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Sep 20, 2022 at 6:34 AM hongao <hongao@uniontech.com> wrote:
>
> This got lost somewhere along the way, This fixes
> audio not working until set_property was called.
>
> Signed-off-by: hongao <hongao@uniontech.com>
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index e4054e10a2c2..5d2e3328dd83 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -1655,10 +1655,12 @@ amdgpu_connector_add(struct amdgpu_device *adev,
>                                                    adev->mode_info.dither_property,
>                                                    AMDGPU_FMT_DITHER_DISABLE);
>
> -                       if (amdgpu_audio != 0)
> +                       if (amdgpu_audio != 0) {
>                                 drm_object_attach_property(&amdgpu_connector->base.base,
>                                                            adev->mode_info.audio_property,
>                                                            AMDGPU_AUDIO_AUTO);
> +                               amdgpu_connector->audio = AMDGPU_AUDIO_AUTO;
> +                       }
>
>                         subpixel_order = SubPixelHorizontalRGB;
>                         connector->interlace_allowed = true;
> @@ -1763,6 +1765,7 @@ amdgpu_connector_add(struct amdgpu_device *adev,
>                                 drm_object_attach_property(&amdgpu_connector->base.base,
>                                                            adev->mode_info.audio_property,
>                                                            AMDGPU_AUDIO_AUTO);
> +                               amdgpu_connector->audio = AMDGPU_AUDIO_AUTO;
>                         }
>                         drm_object_attach_property(&amdgpu_connector->base.base,
>                                                    adev->mode_info.dither_property,
> @@ -1811,6 +1814,7 @@ amdgpu_connector_add(struct amdgpu_device *adev,
>                                 drm_object_attach_property(&amdgpu_connector->base.base,
>                                                            adev->mode_info.audio_property,
>                                                            AMDGPU_AUDIO_AUTO);
> +                               amdgpu_connector->audio = AMDGPU_AUDIO_AUTO;
>                         }
>                         drm_object_attach_property(&amdgpu_connector->base.base,
>                                                    adev->mode_info.dither_property,
> @@ -1856,6 +1860,7 @@ amdgpu_connector_add(struct amdgpu_device *adev,
>                                 drm_object_attach_property(&amdgpu_connector->base.base,
>                                                            adev->mode_info.audio_property,
>                                                            AMDGPU_AUDIO_AUTO);
> +                               amdgpu_connector->audio = AMDGPU_AUDIO_AUTO;
>                         }
>                         drm_object_attach_property(&amdgpu_connector->base.base,
>                                                    adev->mode_info.dither_property,
> --
> 2.20.1
>
