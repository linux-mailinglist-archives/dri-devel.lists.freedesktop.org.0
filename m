Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BDAB340D3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 15:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1B310E071;
	Mon, 25 Aug 2025 13:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="fiiCfNPq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1080710E47E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 13:35:02 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7e86faa158fso589053485a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 06:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756128901; x=1756733701;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNAXqOqDA9cqjdX2o6MNVIoW7F+Slfq6PVIdvquqCX0=;
 b=fiiCfNPqLsnbFgSCkl5XQZcHVfggX0uIcgB1S68MR95XD1fdQX/iGZKxOQgPg6nS3U
 VM0dX03zWNjJpDx8i15ARpKAFaYnaPhrqTVx54ZXbfmdbZ96vx8c2E7jt1Nb7w2Yv6Zd
 qejU+pFA7h2YL1KfM794VuoL7KzbV2K0j4LOgubUuZ8Vhi4/ykaVzuLlLMktcigv1kLH
 86ClVZCDYg6dNWw5aKObTlwO2xg4+RiorwtHOPwmA2+BvVq5UW7qkvnQDrwIxm0kYsyA
 3TQiW4HuQyfOdOf7VSaskoIykJUyJ2ipNzHgFb/R/oiPF1ekDkBZl3Bq1X5eYRZ6iSXQ
 yQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756128901; x=1756733701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNAXqOqDA9cqjdX2o6MNVIoW7F+Slfq6PVIdvquqCX0=;
 b=DJj/YXdyCx7GGECfZT6Kwx05zA1W54yKXBl3iuhhinrq1znsy6s4uz/BUuOwrO6fPS
 9WFoEIpneARmpIPFaY8vR3WwQqvch/ECfciacbClu4AZCZuT9FaWF1IkZ/XKxstUJhPJ
 k0ywAZulqhfExG0DlvPebx1u65YJcxreBYChvvQextlI/gAog9iDSrzMadbma/4jEsqO
 H4fLuRZPiBISIQ6Rp1hMuI/Ndc682GIHka0FLYPZKhc9op2w8fvzG6fPwSfamPQtx4fh
 gB8tUcpC3AXuyKVZsy0G9jIAZ5MnDEFO6zDPLXTi1ZRhe8wr1l1+ElYQaXnlnueQe5ql
 4wQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9a4YaMG9dS0IHE8sCNNOVN1yI3VYj/kSyiY3LhXo6j9/xN5FnR1U09YENXXaOANZDpe9Au87CSXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydTK3TRVwL1td0RdjoOINyHYmETWm3zwSETyc5XgTtDYAducpY
 lePeZfvYvpq5CnKiOA3DK1RWpgNKrxQR281yEHBbVHzoub+g4c55ZdGCC0S2OvMPoAFlnQfVR+v
 TBHRADMO/LfbyQrdD6YVU3MX4kCtg6OpFuHOVMfPuPA==
X-Gm-Gg: ASbGncs+PkCouO15hE+Dmaf5oGs+NIPyfH4V3Pz5+l/q4lJL6JOsxqoGlLqPwIvz0VS
 Wi4POym+q7DiUdhdWlkpTkYg1zqcaan0iwZQWykx+DHNVLkHKs74s1mz3sJwl0nUNpOr85E5BtC
 i2wjc5Z5p8uVZDNIwBozQDBLqxApW+uTkEMVD2C5hDnFEL7FXZWf4U/mR/5aWwj40N8hpT7SlL3
 vT1nYTunjbFhkdrY2mJ0vzAf6VnjJcatMXHDAPiDtvmiReXI0fx
X-Google-Smtp-Source: AGHT+IGOpK3uEJnQCrmnbOgq3jE9IN0xRtPnGuzZNnzUoPGGiNaxqS5J379tibwH0bqxmCutM7cmIZBZS3IWNjGPhFY=
X-Received: by 2002:a05:620a:7109:b0:7e6:81cc:6999 with SMTP id
 af79cd13be357-7ea0948df2fmr1733993185a.32.1756128900796; Mon, 25 Aug 2025
 06:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
In-Reply-To: <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 25 Aug 2025 14:34:48 +0100
X-Gm-Features: Ac12FXydArko6F2KpO-xscTn2Bhfj39k97NaH0mQfBe9_vPNG3yvbIIh17F1fXw
Message-ID: <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alex Hung <alex.hung@amd.com>, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com, 
 victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
 Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
 kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
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

Hi Nicolas,
Thanks for doing this! It's great to see.

On Fri, 22 Aug 2025 at 19:36, N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
> -/**
> - * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> - *
> - * @dev: DRM device
> - * @colorop: The drm_colorop object to initialize
> - * @plane: The associated drm_plane
> - * @lut_size: LUT size supported by driver
> - * @lut1d_interpolation: 1D LUT interpolation type
> - * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
> - * @return zero on success, -E value on failure
> - */
> -int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
> -                                       struct drm_plane *plane, uint32_t=
 lut_size,
> -                                       enum drm_colorop_lut1d_interpolat=
ion_type lut1d_interpolation,
> -                                       uint32_t flags)
> +static int
> +drm_common_colorop_curve_1d_lut_init(struct drm_device *dev,
> +                                    struct drm_colorop *colorop,
> +                                    uint32_t lut_size,
> +                                    enum drm_colorop_lut1d_interpolation=
_type lut1d_interpolation,
> +                                    uint32_t flags)

I think these would be better in a prior commit which only moved the
plane init around.

> @@ -416,6 +417,24 @@ int drm_mode_object_get_properties(struct drm_mode_o=
bject *obj, bool atomic,
>                                 continue;
>                 }
>
> +               if (post_blend_color_pipeline && obj->type =3D=3D DRM_MOD=
E_OBJECT_CRTC) {
> +                       struct drm_crtc *crtc =3D obj_to_crtc(obj);
> +                       struct drm_mode_config mode_config =3D crtc->dev-=
>mode_config;
> +
> +                       if (prop =3D=3D mode_config.gamma_lut_property ||
> +                           prop =3D=3D mode_config.degamma_lut_property =
||
> +                           prop =3D=3D mode_config.gamma_lut_size_proper=
ty ||
> +                           prop =3D=3D mode_config.ctm_property)
> +                               continue;
> +               }
> +
> +               if (!post_blend_color_pipeline && obj->type =3D=3D DRM_MO=
DE_OBJECT_CRTC) {
> +                       struct drm_crtc *crtc =3D obj_to_crtc(obj);
> +
> +                       if (prop =3D=3D crtc->color_pipeline_property)
> +                               continue;
> +               }

Hmmm. One issue with this is that it makes things like drm_info
harder: if drm_info opted into the client cap, it would no longer be
able to see any GAMMA_LUT/etc programmed by the prior userspace. So I
think allowing at least read-only access would be reasonable here.

Having a client cap without a driver cap also puts userspace in a
difficult position. If the driver doesn't support post-blend colorops,
then enabling the client cap strictly removes support without a
replacement. And without a driver cap, the client doesn't have a way
to know which is better.

Cheers,
Daniel
