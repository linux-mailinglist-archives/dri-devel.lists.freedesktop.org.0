Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FC1B2ACEC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5988610E0F3;
	Mon, 18 Aug 2025 15:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B79gdOAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695E910E0F3;
 Mon, 18 Aug 2025 15:39:37 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-244581eab34so6710675ad.2; 
 Mon, 18 Aug 2025 08:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755531577; x=1756136377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JfnjYmDvi00kKX9ijywUbzGRAHiyS/deinjfiKUZLgs=;
 b=B79gdOAMM/5vSg5BZa0TAE+ck//RgezxgExeIFCA109hgc8NLO6T03iz6Bm/LMGezW
 lFrhfyOUqkLuSXc7d5laBVobG2cvDInXtJnkm7v+/ddkQu7vgZ4Vk95AJvKhv0XS+NnN
 +jJbPURcEO8UyjZ+m07bUNsFkoZY20w0qYeBVolgYCo2W0JCwpnOnHO7AwXqIaQpEEvf
 CxF1ymUzS/FJewA5dOUO9OzubbmvDQLvFsSzOpsdq9OGpholoUUGmi0Z9aX+ykInmWZS
 7J/8JPQ7z/NAsMjTt+hYemWVJF/WjRawmd/bBeifHH87DAHl3KvbphwY7FPj/9FQ8W1J
 s4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755531577; x=1756136377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JfnjYmDvi00kKX9ijywUbzGRAHiyS/deinjfiKUZLgs=;
 b=hAHSXAzBaXAZ36ugpLg9adeUkB7V4wCXEGnjZ461NwuFdYirN4VayeWxLXmuatlcsx
 irEK1V3+2swAFqfDJH3HskfOUoMOnn3A4g2IJzDqWFwVgqArf432tE0hG3zsI/UsWGWL
 epmvjsG8iAph+jiLlbQSOjvcIVf7JIFOdxJpGmWKllm8fGgERrQHjrTfmf5vXq8+3wd7
 GHrwQsS/2Cvi1ToNSjz/rwMBWTPVA/eiSgWQsdryQYAVjGkdsbr8q2cnjP9E+LHXA9C9
 Wys+nkrmI1t9CsU39j/gYnp6Hbxi7aG3XBoFBlzVA2aBVXB+O47AyihioqZx0dKKZH9a
 bqKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmbhEAVOhVmU+PBj5UerqDE6ODpgD4txM4vheuw9C9c54+6uscf8sgBaZtL3+ZJ8Z4kvoP99L5GD0/@lists.freedesktop.org,
 AJvYcCXVKp9HzKLvozDis3+GyFNdbHjb5vR+nFuFIhU1IQVxF49K6zW6U/sOp5jrUCaRqj7cYOalvDv3@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6wRBICkRY6Q+BUTWM2E+8nFlXsNAhac5C9gOY5UBd0tC+0ODZ
 d7BMeKRZ5iECjvPhzL6sJ9RnCmJEDgHZI9ahWAO9pdzLXWmT1JzFaLEhXH3ukirhiJqmXedlog9
 4MPZtxTKFZyzJcvDTrifdgskekww1pGg=
X-Gm-Gg: ASbGncuH7tc2MjBoyGckc+sb0zA29Chtb0A68Z2UrYYxVuJD0eauegWznIKycqodrtD
 wUI/fzEN79m26BEP4nyV/LgfU/UjQI9ZBPllDtKZ/OIm8qj15tMvU7xDwa6THSIRDwkVciwE9MF
 EwChSehui8g40oRPahw8m3mTQH265VSEb3zKYxlRQ6ARnrFk/E/NdXUm+8I7e72yibBcusM9oCQ
 ONwrUGfRnxbIR4qyg==
X-Google-Smtp-Source: AGHT+IGlBBr60eEbVg+cyrKDQeXKdn03ukayzCoYut2ij9XXvWFExe6ybSIht++TyMeCrw7fNNqpAsNO0VXJEYzuY60=
X-Received: by 2002:a17:902:f541:b0:240:9ab5:4cae with SMTP id
 d9443c01a7336-2446d5d6193mr75967755ad.1.1755531576879; Mon, 18 Aug 2025
 08:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_E5B1CAABB0320691EB730CDB19E55EA85E05@qq.com>
In-Reply-To: <tencent_E5B1CAABB0320691EB730CDB19E55EA85E05@qq.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Aug 2025 11:39:23 -0400
X-Gm-Features: Ac12FXwUP180FjaCeVT5J4NoIEAVhWgK5DTtLaA6rivx92DVvZ_oACTVYjptjCA
Message-ID: <CADnq5_NbWeLRvXGtb5sSKOwN+do=hbPo5iWiwB9Y9Q-vPV9YEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fixed an issue where audio did not turn off
 properly after unplugging HDMI
To: 2564278112@qq.com
Cc: alex.williamson@redhat.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, sunil.khatri@amd.com, alexandre.f.demers@gmail.com, 
 boyuan.zhang@amd.com, jiangwang@kylinos.cn, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 15, 2025 at 11:23=E2=80=AFAM <2564278112@qq.com> wrote:
>
> From: Wang Jiang <jiangwang@kylinos.cn>
>
> In commit 3c021931023a ("drm/amdgpu: replace drm_detect_hdmi_monitor() wi=
th drm_display_info.is_hdmi")',
> the method for determining connector types has been modified.
> After the modification, when disconnecting the monitor, the information f=
rom the previous connection cannot be retrieved,
> because display_info.is_hdmi has been reset, resulting in the connector t=
ype returned as dvi.
> On AMD Oland and other cards, the audio driver determines whether to turn=
 off audio based on connector type
> However, when the monitor is disconnected, the information from the previ=
ous connection cannot be obtained, resulting in the inability to turn off t=
he audio.
> I don't understand why this is being done, I think the right thing to do =
is to decide whether or not to enable audio based on whether the connector =
has audio.
> This commit modifies the code to retrieve audio information from the conn=
ected EDID.
> Now, the decision to turn audio on/off is based on the audio information =
in the EDID.
>
> Signed-off-by: Wang Jiang <jiangwang@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 21 ++++++++++++++++-----

This only fixes up DCE6.  I would suggest one of the following to fix this:
1. Revert the changes from 3c021931023a in atombios_encoders.c
or
2. Add amdgpu_connector->is_hdmi and set it when
connector->display_info.is_hdmi is valid and use that rather than
connector->display_info.is_hdmi.

Alex

>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v6_0.c
> index 276c025c4c03..c56b2027d53e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -3253,17 +3253,22 @@ static void dce_v6_0_encoder_mode_set(struct drm_=
encoder *encoder,
>                           struct drm_display_mode *adjusted_mode)
>  {
>         struct amdgpu_encoder *amdgpu_encoder =3D to_amdgpu_encoder(encod=
er);
> -       int em =3D amdgpu_atombios_encoder_get_encoder_mode(encoder);
> -
> +       struct drm_connector *connector;
> +       struct amdgpu_connector *amdgpu_connector =3D NULL;
>         amdgpu_encoder->pixel_clock =3D adjusted_mode->clock;
>
>         /* need to call this here rather than in prepare() since we need =
some crtc info */
>         amdgpu_atombios_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
> +       connector =3D amdgpu_get_connector_for_encoder_init(encoder);
> +       amdgpu_connector =3D to_amdgpu_connector(connector);
> +       if (!amdgpu_connector) {
> +               DRM_ERROR("Couldn't find encoder's connector\n");
> +       }
>
>         /* set scaler clears this on some chips */
>         dce_v6_0_set_interleave(encoder->crtc, mode);
>
> -       if (em =3D=3D ATOM_ENCODER_MODE_HDMI || ENCODER_MODE_IS_DP(em)) {
> +       if (drm_detect_monitor_audio(amdgpu_connector_edid(connector))) {
>                 dce_v6_0_afmt_enable(encoder, true);
>                 dce_v6_0_afmt_setmode(encoder, adjusted_mode);
>         }
> @@ -3322,12 +3327,18 @@ static void dce_v6_0_encoder_disable(struct drm_e=
ncoder *encoder)
>  {
>         struct amdgpu_encoder *amdgpu_encoder =3D to_amdgpu_encoder(encod=
er);
>         struct amdgpu_encoder_atom_dig *dig;
> -       int em =3D amdgpu_atombios_encoder_get_encoder_mode(encoder);
> +       struct drm_connector *connector;
> +       struct amdgpu_connector *amdgpu_connector =3D NULL;
>
>         amdgpu_atombios_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
> +       connector =3D amdgpu_get_connector_for_encoder_init(encoder);
> +       amdgpu_connector =3D to_amdgpu_connector(connector);
> +       if (!amdgpu_connector) {
> +               DRM_ERROR("Couldn't find encoder's connector\n");
> +       }
>
>         if (amdgpu_atombios_encoder_is_digital(encoder)) {
> -               if (em =3D=3D ATOM_ENCODER_MODE_HDMI || ENCODER_MODE_IS_D=
P(em))
> +               if (drm_detect_monitor_audio(amdgpu_connector_edid(connec=
tor)))
>                         dce_v6_0_afmt_enable(encoder, false);
>                 dig =3D amdgpu_encoder->enc_priv;
>                 dig->dig_encoder =3D -1;
> --
> 2.25.1
>
