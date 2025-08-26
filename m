Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC1FB35F15
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 14:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C05210E636;
	Tue, 26 Aug 2025 12:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="KGsGTbFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B2210E636
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 12:25:19 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7e8706491ecso797707285a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 05:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756211119; x=1756815919;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4hO3ALaftqFmH4oH4pH+kk6zISTsy/rbnhx2jQsr7Dw=;
 b=KGsGTbFzXv9g/i+QbxWFa/70uRfSJJKdPpQo8gOhL5B6zEpJ98HguFCdie05QrGouN
 qXYctlvy0WRx7IU5aAoGGczKNZ8mTeV9NF9xtMIRDR+anRdWjm1psiJ5Wz7oVKJq2qd5
 W7HopVdLxhPrtoDNwxAwAIFMXcnRdnkBZ9XZ/nX4/kRgWhQF6L4sx3xpdo0A4uIktQnc
 +5wmUyYzmb6NAyz6Yf/Xdw0bXKwntPywVSOenhJu6DHgaGACMx/t4jKoiIgit5UeHh7s
 EK+B7JFr3+Fd8K4og20pTFKKUl1jZc/PH9wlqjfiQb2iuWMlGHPwLC89rSLC3gpsX71Z
 +xQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756211119; x=1756815919;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4hO3ALaftqFmH4oH4pH+kk6zISTsy/rbnhx2jQsr7Dw=;
 b=TxYQcQIWIzKMnqhnHs84oOSUc8Qubc6cTjKEv0YoPwbRd+tV1pajONFo6djhd/bVtp
 dRCHE606Vwj+keHu0FfP1bpI/aHvUK/01uCgePEgw6YvboU75Mq738s1La8vzyaGtzll
 ERiQOFec6x36+xdYpLg2b0uZXzdsIPEEyGA7cNcmr7Tu7oAos+Bd73A78+ecHNfdEOJb
 fL/ylKNfi+P+4MYFx/RxE5+OlPYMF17kfMVoYpz6FhpqsXIJjOvT1OyTZ7LboRekjagk
 9qpKTG7cyo8WAbnRadpPONxlS3VGQ+ETAlhyBOEsVviN9cKOHuJQKDz6jE+rg6U2BJZE
 WSsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkS75zA9tC0wK/8rwCY7SeJQ/OGm4z25ixGra8QjEQro1wVKXVW4quACPwfa+PdpaBjbslA8jZPFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkbFmBUndmBMNeAgxQ4sM2EUlLWAmx8ZZVVWL8MAGAQRfRKmfS
 WVEIZT+TTE7NC8QpSKBApCA7Nd3rlzD3KJk2+E2UdaMmFzM820iemZn0sbjANLKLL1esYpFAaMz
 I0d9zCo2LVoL9EDJKMhmSV23vFcxCNXHoZxnhH8WBcw==
X-Gm-Gg: ASbGncv8Vz2NHluq3eiLsdLoA1hfBAKOWK2dNUohx6JK3y+WSS3AZYMz/R0aTw4xSmI
 5TxAJqbEjQ/Vg8KbAtFPUvhb1gdjI0I5PoSgF+Whzu5IKBBuJXTfeXwXO/iS7PC98zsLCXrxVDv
 Tx/0kV6CptQ5jkfVBl9TPKiXrs9ueLovuBzpvd5AqHDA2zImlykoy3XkJSlFB0HmFW8bpglfcPn
 hZT4dGZ8xDwu8GD
X-Google-Smtp-Source: AGHT+IFgi8Q9hHqPvEtovjl/Iou25u0OhOejPE9XEDWvvY8QwIuVfSOpzRV+vwb4VBRl5Im89zG6tFcD4jX2gBQishU=
X-Received: by 2002:a05:620a:4149:b0:7e8:6a84:e82e with SMTP id
 af79cd13be357-7ea10fdbed6mr1861144585a.32.1756211118444; Tue, 26 Aug 2025
 05:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
 <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
In-Reply-To: <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 26 Aug 2025 13:25:05 +0100
X-Gm-Features: Ac12FXxHW5zk0HB8cp7qpDLRzhJSLilNkY6mrjMA15E-TnryutF26kuEp3eSmiI
Message-ID: <CAPj87rMTOD3_tC70QX4xz3G4zdG=tmwt5VgPhq6jNyf8bbW49Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: Xaver Hugl <xaver.hugl@gmail.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
 Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
 kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 25 Aug 2025 at 19:45, Xaver Hugl <xaver.hugl@gmail.com> wrote:
> > > @@ -416,6 +417,24 @@ int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
> > > +               if (post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> > > +                       struct drm_crtc *crtc = obj_to_crtc(obj);
> > > +                       struct drm_mode_config mode_config = crtc->dev->mode_config;
> > > +
> > > +                       if (prop == mode_config.gamma_lut_property ||
> > > +                           prop == mode_config.degamma_lut_property ||
> > > +                           prop == mode_config.gamma_lut_size_property ||
> > > +                           prop == mode_config.ctm_property)
> > > +                               continue;
> > > +               }
> > > +
> > > +               if (!post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> > > +                       struct drm_crtc *crtc = obj_to_crtc(obj);
> > > +
> > > +                       if (prop == crtc->color_pipeline_property)
> > > +                               continue;
> > > +               }
> >
> > Hmmm. One issue with this is that it makes things like drm_info
> > harder: if drm_info opted into the client cap, it would no longer be
> > able to see any GAMMA_LUT/etc programmed by the prior userspace. So I
> > think allowing at least read-only access would be reasonable here.
>
> FWIW the cap for per-plane pipelines also hides COLOR_RANGE and
> COLOR_ENCODING properties from the client.
>
> From a compositor POV, I slightly prefer hiding the properties
> entirely, but ignoring them on the compositor side when a color
> pipeline is available would also be trivial.

It makes it impossible to do smooth transitions from legacy clients,
as the old (current) properties can't be read back.

I assume the atomic state would also carry the old values (even if the
drivers are specified to have to ignore them), so there would be an
odd transition:
* pre-colorop userspace sets GAMMA_LUT to invert brightness
* colorop userspace takes over, does not set any colorops on the CRTC,
brightness is no longer inverted (presumably? depends on what the
default set of colorops is? and what the drivers do?), but the atomic
state still carries the old gamma_lut blob
* pre-colorop userspace takes over, does not touch GAMMA_LUT,
brightness is inverted as the colorop from the previous atomic state
is ignored and the pre-atomic one now takes precedence

This isn't necessarily wrong per se, but does seem kind of janky and
error-prone: like should the old state be reset to zero/bypass for
commits from colorop-aware clients? Or should we explicitly allow 0
but no other value?

Cheers,
Daniel
