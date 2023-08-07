Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C57772CD8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7048510E35C;
	Mon,  7 Aug 2023 17:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDF710E358;
 Mon,  7 Aug 2023 17:25:39 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-565f2567422so3233862eaf.2; 
 Mon, 07 Aug 2023 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429138; x=1692033938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MT9ZoHa3QBN38VFI/biOZ0hMRuiUyTubHzewye4P1RM=;
 b=O1DRxAZ9GLVObJ/SVqp8h21UA2WiTQVFbdv1s7zTImPe9UdtKOemT2dTQX4Fnr3o8D
 IvCL0WHX1McghjNJkOYXZ/7lO9mJsg6ekXsGtakDRfzXkjvJsaLa6JfFGj29h4iGmkBI
 kjpsf42afYnlmz9egv4knpqvkRU5F8LLqw7nRfjby6PfxhF78u6J4gzZAk7CSC5h9pn7
 RgePyDz6lzMvjTLR8erI6HYN/nSlF8qRCt+N3jriURPzvJtF7TGpBS8wxMh2b1QlXbOc
 r7LnBmbtLbHT6oxk8OCGuazwSEXrbAvJTty0EnFmZB0dQDIK2zQvJsFpk4oS3V08nu/B
 d8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429138; x=1692033938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MT9ZoHa3QBN38VFI/biOZ0hMRuiUyTubHzewye4P1RM=;
 b=goyYzL1IvHie8Om1Wxng2rKRtT2BksGbpdhgcD6LhNMd1x2Vmf/nD37TCJpF3KqWbT
 s316pS9/h9G0GRINASpYqTu0f1Dhq0O4/DPF1JiD3lYjkEMHvuHpg6AV5VcDPaqTJXEH
 Ye5Q/M+G6uE0X/CDRgkDP2KKn5JW6FPpxk/cuVVVclNXsR4RY/Tv7XgDGaPHL8e1wiIY
 QwwA2c805II6sZBn3pu9wOL2hJNCiIFzkrfzbYxKfBegXzpdCjIl4OO30v8a9VtyRncF
 OUZ8Rv8FeDGhZBa0kFkw6gfWn6RrD3feRQdZGvRIjvv0HjzwQ347kscv4ebw0a64xffL
 jL/Q==
X-Gm-Message-State: AOJu0YynzcX2XHuWhAdCc1jTSuv95hbRqPPDiNPyb4867f+ym+Ov9QUh
 ubVwPgYANiu15EyOO51BgiXUGtpaLUGbGqWJnaU=
X-Google-Smtp-Source: AGHT+IHKdYJhOzFLz7sRPBkKw8b9SIdR/Y65ZOVU8mGmwuV/MU3nCqvJ7FNIUlZ07bZFuuONi/WLIqWFKqq1TdTS0R4=
X-Received: by 2002:a4a:3c5e:0:b0:56d:55b7:e99c with SMTP id
 p30-20020a4a3c5e000000b0056d55b7e99cmr9158977oof.1.1691429138564; Mon, 07 Aug
 2023 10:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230802071805.12808-1-sunran001@208suo.com>
In-Reply-To: <20230802071805.12808-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:25:27 -0400
Message-ID: <CADnq5_Oj_+k3E4Njhw-W4_YvSLb9LL9RfGsrQb6a085Dpc5iFQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in dce_v8_0.c
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

On Wed, Aug 2, 2023 at 3:18=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
> ERROR: code indent should use tabs where possible
> ERROR: space required before the open brace '{'
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c | 37 ++++++++++-----------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v8_0.c
> index d421a268c9ff..f2b3cb5ed6be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -53,8 +53,7 @@
>  static void dce_v8_0_set_display_funcs(struct amdgpu_device *adev);
>  static void dce_v8_0_set_irq_funcs(struct amdgpu_device *adev);
>
> -static const u32 crtc_offsets[6] =3D
> -{
> +static const u32 crtc_offsets[6] =3D {
>         CRTC0_REGISTER_OFFSET,
>         CRTC1_REGISTER_OFFSET,
>         CRTC2_REGISTER_OFFSET,
> @@ -63,8 +62,7 @@ static const u32 crtc_offsets[6] =3D
>         CRTC5_REGISTER_OFFSET
>  };
>
> -static const u32 hpd_offsets[] =3D
> -{
> +static const u32 hpd_offsets[] =3D {
>         HPD0_REGISTER_OFFSET,
>         HPD1_REGISTER_OFFSET,
>         HPD2_REGISTER_OFFSET,
> @@ -1345,9 +1343,9 @@ static void dce_v8_0_audio_write_sad_regs(struct dr=
m_encoder *encoder)
>                                 if (sad->channels > max_channels) {
>                                         value =3D (sad->channels <<
>                                                  AZALIA_F0_CODEC_PIN_CONT=
ROL_AUDIO_DESCRIPTOR0__MAX_CHANNELS__SHIFT) |
> -                                               (sad->byte2 <<
> +                                               (sad->byte2 <<
>                                                  AZALIA_F0_CODEC_PIN_CONT=
ROL_AUDIO_DESCRIPTOR0__DESCRIPTOR_BYTE_2__SHIFT) |
> -                                               (sad->freq <<
> +                                               (sad->freq <<
>                                                  AZALIA_F0_CODEC_PIN_CONT=
ROL_AUDIO_DESCRIPTOR0__SUPPORTED_FREQUENCIES__SHIFT);
>                                         max_channels =3D sad->channels;
>                                 }
> @@ -1379,8 +1377,7 @@ static void dce_v8_0_audio_enable(struct amdgpu_dev=
ice *adev,
>                 enable ? AZALIA_F0_CODEC_PIN_CONTROL_HOT_PLUG_CONTROL__AU=
DIO_ENABLED_MASK : 0);
>  }
>
> -static const u32 pin_offsets[7] =3D
> -{
> +static const u32 pin_offsets[7] =3D {
>         (0x1780 - 0x1780),
>         (0x1786 - 0x1780),
>         (0x178c - 0x1780),
> @@ -1740,8 +1737,7 @@ static void dce_v8_0_afmt_fini(struct amdgpu_device=
 *adev)
>         }
>  }
>
> -static const u32 vga_control_regs[6] =3D
> -{
> +static const u32 vga_control_regs[6] =3D {
>         mmD1VGA_CONTROL,
>         mmD2VGA_CONTROL,
>         mmD3VGA_CONTROL,
> @@ -1895,9 +1891,9 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crt=
c *crtc,
>         case DRM_FORMAT_XBGR8888:
>         case DRM_FORMAT_ABGR8888:
>                 fb_format =3D ((GRPH_DEPTH_32BPP << GRPH_CONTROL__GRPH_DE=
PTH__SHIFT) |
> -                            (GRPH_FORMAT_ARGB8888 << GRPH_CONTROL__GRPH_=
FORMAT__SHIFT));
> +                               (GRPH_FORMAT_ARGB8888 << GRPH_CONTROL__GR=
PH_FORMAT__SHIFT));
>                 fb_swap =3D ((GRPH_RED_SEL_B << GRPH_SWAP_CNTL__GRPH_RED_=
CROSSBAR__SHIFT) |
> -                          (GRPH_BLUE_SEL_R << GRPH_SWAP_CNTL__GRPH_BLUE_=
CROSSBAR__SHIFT));
> +                       (GRPH_BLUE_SEL_R << GRPH_SWAP_CNTL__GRPH_BLUE_CRO=
SSBAR__SHIFT));
>  #ifdef __BIG_ENDIAN
>                 fb_swap |=3D (GRPH_ENDIAN_8IN32 << GRPH_SWAP_CNTL__GRPH_E=
NDIAN_SWAP__SHIFT);
>  #endif
> @@ -3151,7 +3147,7 @@ static int dce_v8_0_pageflip_irq(struct amdgpu_devi=
ce *adev,
>
>         spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
>         works =3D amdgpu_crtc->pflip_works;
> -       if (amdgpu_crtc->pflip_status !=3D AMDGPU_FLIP_SUBMITTED){
> +       if (amdgpu_crtc->pflip_status !=3D AMDGPU_FLIP_SUBMITTED) {
>                 DRM_DEBUG_DRIVER("amdgpu_crtc->pflip_status =3D %d !=3D "
>                                                 "AMDGPU_FLIP_SUBMITTED(%d=
)\n",
>                                                 amdgpu_crtc->pflip_status=
,
> @@ -3544,8 +3540,7 @@ static void dce_v8_0_set_irq_funcs(struct amdgpu_de=
vice *adev)
>         adev->hpd_irq.funcs =3D &dce_v8_0_hpd_irq_funcs;
>  }
>
> -const struct amdgpu_ip_block_version dce_v8_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version dce_v8_0_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_DCE,
>         .major =3D 8,
>         .minor =3D 0,
> @@ -3553,8 +3548,7 @@ const struct amdgpu_ip_block_version dce_v8_0_ip_bl=
ock =3D
>         .funcs =3D &dce_v8_0_ip_funcs,
>  };
>
> -const struct amdgpu_ip_block_version dce_v8_1_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version dce_v8_1_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_DCE,
>         .major =3D 8,
>         .minor =3D 1,
> @@ -3562,8 +3556,7 @@ const struct amdgpu_ip_block_version dce_v8_1_ip_bl=
ock =3D
>         .funcs =3D &dce_v8_0_ip_funcs,
>  };
>
> -const struct amdgpu_ip_block_version dce_v8_2_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version dce_v8_2_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_DCE,
>         .major =3D 8,
>         .minor =3D 2,
> @@ -3571,8 +3564,7 @@ const struct amdgpu_ip_block_version dce_v8_2_ip_bl=
ock =3D
>         .funcs =3D &dce_v8_0_ip_funcs,
>  };
>
> -const struct amdgpu_ip_block_version dce_v8_3_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version dce_v8_3_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_DCE,
>         .major =3D 8,
>         .minor =3D 3,
> @@ -3580,8 +3572,7 @@ const struct amdgpu_ip_block_version dce_v8_3_ip_bl=
ock =3D
>         .funcs =3D &dce_v8_0_ip_funcs,
>  };
>
> -const struct amdgpu_ip_block_version dce_v8_5_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version dce_v8_5_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_DCE,
>         .major =3D 8,
>         .minor =3D 5,
> --
> 2.17.1
>
