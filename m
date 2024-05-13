Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F38C458C
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 19:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08E810E8BD;
	Mon, 13 May 2024 17:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VhpXZFaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAB810E8BD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:01:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7978FCE0F22
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81117C2BD11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715619675;
 bh=KGyvwTP/UJ/VEeLB+PAW3+/uWllNnC8Klx/VYidNySA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VhpXZFaqD0Yg1rLQqXXIsUSkH6W2e/NJex/J6xX7QfovzM2WMzHRIWAECJRyk56ZX
 ijNpXel3WDSvtVDm3Hs46DXuyVXryTm8ARmqN+osdX0uhdCjn8MUxr3kc6Plooq5fF
 u9+lQR5O8Yj34KVQ2QqBijwItypCvOwt0Rzpn6uxnMoEU/2wv7eg6/7DcUlz0rKW9u
 omXdU8CugD3hh4rAci92k372APoxP9M0s5EPXSE3wb5B4cBSF+kk3sWMb2k0pzIV9R
 S3MYnOB131LdS6Q77C19rXX0Zys1OPKGWX6UdXIRM/nmnNRIClQxf9CBzNy6g9EETl
 bc04TAhEspe8Q==
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-23f29434da2so2989986fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:01:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YxPIg8dwD+pa6+sbCdj7CQiRm7oO79pacKaRruSIlmicM8lyDaB
 elbd0rx7YHqMTA1gN1acEEDDEbUlFkkaMN7U06A7ZMQC9S8XUEsi2w5JGsE0xlanS7HlL4zZZHQ
 rlVSyFZxQSKTaqgDRybQK4jCYPW/uFm2r5mCMYw==
X-Google-Smtp-Source: AGHT+IGu7vhnRl/XcOEAxLWd28fz33p1nGLj39D7Rpi2w0mE+ydXU+p+Alc2yhUBPFFZgV8n2uck9+iVSax/RO1rPoI=
X-Received: by 2002:a05:6870:71d4:b0:244:c312:4c7c with SMTP id
 586e51a60fabf-244c3125884mr6877402fac.16.1715619674792; Mon, 13 May 2024
 10:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715353572.git.jani.nikula@intel.com>
 <1463862965d76e9458551598fd4d287a08d3d264.1715353572.git.jani.nikula@intel.com>
In-Reply-To: <1463862965d76e9458551598fd4d287a08d3d264.1715353572.git.jani.nikula@intel.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 May 2024 19:01:03 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7M937W6HVrCDcxYFQNs65WYooxXH7t=deMsdtWPTr_Tg@mail.gmail.com>
Message-ID: <CAN6tsi7M937W6HVrCDcxYFQNs65WYooxXH7t=deMsdtWPTr_Tg@mail.gmail.com>
Subject: Re: [RESEND 4/6] drm/amdgpu: remove amdgpu_connector_edid() and stop
 using edid_blob_ptr
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>
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

On Fri, May 10, 2024 at 5:09=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> amdgpu_connector_edid() copies the EDID from edid_blob_ptr as a side
> effect if amdgpu_connector->edid isn't initialized. However, everywhere
> that the returned EDID is used, the EDID should have been set
> beforehands.
>
> Only the drm EDID code should look at the EDID property, anyway, so stop
> using it.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 16 ----------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h |  1 -
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c         |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c         |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c          |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c          |  4 ++--
>  6 files changed, 8 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_connectors.c
> index 9caba10315a8..cae7479c3ecf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -246,22 +246,6 @@ amdgpu_connector_find_encoder(struct drm_connector *=
connector,
>         return NULL;
>  }
>
> -struct edid *amdgpu_connector_edid(struct drm_connector *connector)
> -{
> -       struct amdgpu_connector *amdgpu_connector =3D to_amdgpu_connector=
(connector);
> -       struct drm_property_blob *edid_blob =3D connector->edid_blob_ptr;
> -
> -       if (amdgpu_connector->edid) {
> -               return amdgpu_connector->edid;
> -       } else if (edid_blob) {
> -               struct edid *edid =3D kmemdup(edid_blob->data, edid_blob-=
>length, GFP_KERNEL);
> -
> -               if (edid)
> -                       amdgpu_connector->edid =3D edid;
> -       }
> -       return amdgpu_connector->edid;
> -}
> -
>  static struct edid *
>  amdgpu_connector_get_hardcoded_edid(struct amdgpu_device *adev)
>  {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_connectors.h
> index 61fcef15ad72..eff833b6ed31 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h
> @@ -24,7 +24,6 @@
>  #ifndef __AMDGPU_CONNECTORS_H__
>  #define __AMDGPU_CONNECTORS_H__
>
> -struct edid *amdgpu_connector_edid(struct drm_connector *connector);
>  void amdgpu_connector_hotplug(struct drm_connector *connector);
>  int amdgpu_connector_get_monitor_bpc(struct drm_connector *connector);
>  u16 amdgpu_connector_encoder_get_dp_bridge_encoder_id(struct drm_connect=
or *connector);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/dce_v10_0.c
> index b44fce44c066..dddb5fe16f2c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -1299,7 +1299,7 @@ static void dce_v10_0_audio_write_speaker_allocatio=
n(struct drm_encoder *encoder
>                 return;
>         }
>
> -       sad_count =3D drm_edid_to_speaker_allocation(amdgpu_connector_edi=
d(connector), &sadb);
> +       sad_count =3D drm_edid_to_speaker_allocation(amdgpu_connector->ed=
id, &sadb);
>         if (sad_count < 0) {
>                 DRM_ERROR("Couldn't read Speaker Allocation Data Block: %=
d\n", sad_count);
>                 sad_count =3D 0;
> @@ -1369,7 +1369,7 @@ static void dce_v10_0_audio_write_sad_regs(struct d=
rm_encoder *encoder)
>                 return;
>         }
>
> -       sad_count =3D drm_edid_to_sad(amdgpu_connector_edid(connector), &=
sads);
> +       sad_count =3D drm_edid_to_sad(amdgpu_connector->edid, &sads);
>         if (sad_count < 0)
>                 DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
>         if (sad_count <=3D 0)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/dce_v11_0.c
> index 80b2e7f79acf..11780e4d7e9f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -1331,7 +1331,7 @@ static void dce_v11_0_audio_write_speaker_allocatio=
n(struct drm_encoder *encoder
>                 return;
>         }
>
> -       sad_count =3D drm_edid_to_speaker_allocation(amdgpu_connector_edi=
d(connector), &sadb);
> +       sad_count =3D drm_edid_to_speaker_allocation(amdgpu_connector->ed=
id, &sadb);
>         if (sad_count < 0) {
>                 DRM_ERROR("Couldn't read Speaker Allocation Data Block: %=
d\n", sad_count);
>                 sad_count =3D 0;
> @@ -1401,7 +1401,7 @@ static void dce_v11_0_audio_write_sad_regs(struct d=
rm_encoder *encoder)
>                 return;
>         }
>
> -       sad_count =3D drm_edid_to_sad(amdgpu_connector_edid(connector), &=
sads);
> +       sad_count =3D drm_edid_to_sad(amdgpu_connector->edid, &sads);
>         if (sad_count < 0)
>                 DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
>         if (sad_count <=3D 0)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v6_0.c
> index db20012600f5..05c0df97f01d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -1217,7 +1217,7 @@ static void dce_v6_0_audio_write_speaker_allocation=
(struct drm_encoder *encoder)
>                 return;
>         }
>
> -       sad_count =3D drm_edid_to_speaker_allocation(amdgpu_connector_edi=
d(connector), &sadb);
> +       sad_count =3D drm_edid_to_speaker_allocation(amdgpu_connector->ed=
id, &sadb);
>         if (sad_count < 0) {
>                 DRM_ERROR("Couldn't read Speaker Allocation Data Block: %=
d\n", sad_count);
>                 sad_count =3D 0;
> @@ -1292,7 +1292,7 @@ static void dce_v6_0_audio_write_sad_regs(struct dr=
m_encoder *encoder)
>                 return;
>         }
>
> -       sad_count =3D drm_edid_to_sad(amdgpu_connector_edid(connector), &=
sads);
> +       sad_count =3D drm_edid_to_sad(amdgpu_connector->edid, &sads);
>         if (sad_count < 0)
>                 DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
>         if (sad_count <=3D 0)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v8_0.c
> index 5b56100ec902..dc73e301d937 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -1272,7 +1272,7 @@ static void dce_v8_0_audio_write_speaker_allocation=
(struct drm_encoder *encoder)
>                 return;
>         }
>
> -       sad_count =3D drm_edid_to_speaker_allocation(amdgpu_connector_edi=
d(connector), &sadb);
> +       sad_count =3D drm_edid_to_speaker_allocation(amdgpu_connector->ed=
id, &sadb);
>         if (sad_count < 0) {
>                 DRM_ERROR("Couldn't read Speaker Allocation Data Block: %=
d\n", sad_count);
>                 sad_count =3D 0;
> @@ -1340,7 +1340,7 @@ static void dce_v8_0_audio_write_sad_regs(struct dr=
m_encoder *encoder)
>                 return;
>         }
>
> -       sad_count =3D drm_edid_to_sad(amdgpu_connector_edid(connector), &=
sads);
> +       sad_count =3D drm_edid_to_sad(amdgpu_connector->edid, &sads);
>         if (sad_count < 0)
>                 DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
>         if (sad_count <=3D 0)
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
