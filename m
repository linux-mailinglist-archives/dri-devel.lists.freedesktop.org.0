Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5DA9846AD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 15:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED7910E1E0;
	Tue, 24 Sep 2024 13:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b40w3xBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5C410E1E0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 13:24:36 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-718ebb01fd2so1063805b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 06:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727184276; x=1727789076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvnaZJqFfXFaafjuo2tTI/OT9A98V7mgCkYmS2wx5+4=;
 b=b40w3xBe5zNnq7cowGsHel2Ei3+j3uxD8SiEKyNpxks2EsbPvMO5kOKKmV7QGoh4LI
 17X6lrracBsanzx6HWcPY6TIzjIf0+zv1YoISGEIEuU44bz3EeoGLMglrl6CbDLGMGrp
 xCMTwUbSkUXz6Fj1+8O8H/zCN5E9G9MH/gLjW3JJpTnoXAnhtNn2SU1eBlWJbTsekjxO
 BWUgi4fXRTLQqwUQOjRLt4lebCxP/FVEce6Tc7K6lUNs17aGorW6r++9V0p6oJbBf6Sc
 YO3RNgsAjujSW6tuRV2wjA2/5mZMb8nI7lyHELl3bIWsWxxRAIE8JPm6D38pJEmf3qmo
 v4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727184276; x=1727789076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XvnaZJqFfXFaafjuo2tTI/OT9A98V7mgCkYmS2wx5+4=;
 b=I1zAGo2H/rJs3L/VjRlrNczPEq9574qCa1qACp6DsnIKx9DS4L3ejh8/51YXAhyDPG
 HcSFvvDkoXV/6XcADlY+FB6jlvjb7OjYuTDIYxsqK/HRtRFPDLK/gKgT171jQrBxFaAP
 A8KSE09P+bMT/LKktHic4wLxIdckC7fET5cuvg3PpriaTqYWZTEfQRNtbb0LP+2krAyT
 gfAIX96SQoGTB4TqDzNDhKqHFuvhVqyfzUugHz/KiM4B/39NLbcBFIjegXBfnr8bNyD/
 yIoyHQ4qUpURk1G34OFDJzCe7p7AqRgT1Tu5ZWN37bVJzH0bw19OXJA5/RGeescPfwbr
 jBDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0oAcZ0lBI5MSL2P7GMqFoCdvKCtL2I/7lw10gtvdN/C3b3ILn2S2Vt4fNNPq9nuyb+ZgW3A6Pd9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/4V3bdtKGrVJmZC3AJPdwi94VQ+6eO5u6j+jnvLpL9rspfjlk
 3QjBKVwOSPq/yCYwZOXmuxA38Cmo2HSmqGycS90SkJ6i2LMrBugNWDfYG95gr8FLz5NKvhExL99
 vAQX42LZxY6MiWxgkIr37DvfEeXI=
X-Google-Smtp-Source: AGHT+IFuZIUC3y21iSVZyR2o5dKIJPPbtSxgaCOWhFfp4Hu9OWkaFu33ak//uRyXzS840sm5f+bSYekO0V5yaVv15Ng=
X-Received: by 2002:a05:6a20:2449:b0:1cf:4c3a:162a with SMTP id
 adf61e73a8af0-1d344eb8a2cmr2105535637.5.1727184276111; Tue, 24 Sep 2024
 06:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240924084227.262271-1-tzimmermann@suse.de>
In-Reply-To: <20240924084227.262271-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Sep 2024 09:24:23 -0400
Message-ID: <CADnq5_Prj5Ldi4v2md1bxZsA4_hXDk6q679Sqd43rMx7d-LgCA@mail.gmail.com>
Subject: Re: [PATCH] firmware/sysfb: Disable sysfb for firmware buffers with
 unknown parent
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, alexander.deucher@amd.com, 
 chaitanya.kumar.borah@intel.com, dri-devel@lists.freedesktop.org, 
 Helge Deller <deller@gmx.de>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 stable@vger.kernel.org
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

On Tue, Sep 24, 2024 at 4:58=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The sysfb framebuffer handling only operates on graphics devices
> that provide the system's firmware framebuffer. If that device is
> not known, assume that any graphics device has been initialized by
> firmware.
>
> Fixes a problem on i915 where sysfb does not release the firmware
> framebuffer after the native graphics driver loaded.
>
> Reported-by: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Closes: https://lore.kernel.org/dri-devel/SJ1PR11MB6129EFB8CE63D1EF6D932F=
94B96F2@SJ1PR11MB6129.namprd11.prod.outlook.com/
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12160
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b49420d6a1ae ("video/aperture: optionally match the device in sysf=
b_disable()")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis.i=
nfo>
> Cc: <stable@vger.kernel.org> # v6.11+

Thanks for fixing this.

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/firmware/sysfb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 02a07d3d0d40..a3df782fa687 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -67,9 +67,11 @@ static bool sysfb_unregister(void)
>  void sysfb_disable(struct device *dev)
>  {
>         struct screen_info *si =3D &screen_info;
> +       struct device *parent;
>
>         mutex_lock(&disable_lock);
> -       if (!dev || dev =3D=3D sysfb_parent_dev(si)) {
> +       parent =3D sysfb_parent_dev(si);
> +       if (!dev || !parent || dev =3D=3D parent) {
>                 sysfb_unregister();
>                 disabled =3D true;
>         }
> --
> 2.46.0
>
