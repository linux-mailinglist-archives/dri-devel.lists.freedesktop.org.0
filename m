Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB3DC40572
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6E210EAE8;
	Fri,  7 Nov 2025 14:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cqnIgslP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB82E10EAE8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:28:03 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b9da0ae5763so98821a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762525683; x=1763130483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kcr2kLbrccmHXR0DwVI5+Z3TJTG76QtAID5voxoGTP0=;
 b=cqnIgslPeyOIi01jm9TYaooiGf4U0IF5M11SORUrQ8xdV09pOECuTs9+hIG0rY1N0n
 uyy6pFJKy9EtPXSdpsQAVz/zpThM2az0NvlTCFk7WLblgv5OMIPovLkWD1GL1dIxS2Gx
 roY7ljJhmxfiZ6MalDMCWh1ZPi2lQREycyHvE+2zNtUlYvvFD9+Ckmxk/CS6fRz0qB2j
 ZH8wY5sj0V5FO3tfO6G4sP/PGGXC5+mXnpBwK83OSUYfIpkQkMRVaUibj3WXupG7idTF
 q8z4LsV7DAlu/POPdiBWff9PaSkH8N4ai5WxlXelCfSYpXFjIeZN7BjweaQ9x30+qjw8
 grmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762525683; x=1763130483;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Kcr2kLbrccmHXR0DwVI5+Z3TJTG76QtAID5voxoGTP0=;
 b=OwR1t7Lb/LYsJ+EPGvyM05T8Y8VyB0wFW+mGnDIgo8rpUHKGYSgQegSHEgw0F0AJ1+
 sParCpetxmt/IbJP0F1EvenJ7FnbyurGRGEwZns/BnSlBAdCh88mAxFArI2ZFqZn15Q8
 3iv9xYPOyKp/e+jOCjbtBj5z9zQygf6EykTNj+Ap7QJE8ntu3iQG0NHvh1OJRyk5xP+u
 8wxdcH3eFPTDneiol6MNZWd7ZyO9tTbLHF1k1uHC5GKmQTLyAzcAbOGaKfsEUPCIY0hz
 y7wR8IghXvAcbQ94OKJPduSCYCX1D8vnFs1nVhlxO02k+/jRoE59TfVJkaCL8rG3jfuQ
 ZNyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO+gpe+btJYXl5PLSPk2L66UkVTyimF4BH/OkpLAGoQT5HjjbG1H464EgMJ9VNzLB1Ef7voSl1nIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4hr0bnENYEq5noSqBM96/VhxfukS3xccmw0KCXJz8qoiIjKCO
 C4Q+s6wSCAXTT8sjyQPgscWBooeUHHmrHqOwxbANo1rlEO50ALphc4he+frq0U5+9b+iKST4dSJ
 y9COmjlfqggUDB5+W6UONN56BcgEB08w=
X-Gm-Gg: ASbGncsjCgez7kFWwueUJC+BqDWk2USllqljyix76R50wNwwxmB+S9wnyGojwN4tIOt
 dTFgNdEvBqqXPNPMTL0NE/NW8BM3vQe+0RC6EKjAC2NzVOrmeQznXR540peT2ytGKcasWUSBkG0
 uDFjGvMkNPg58EyaAof50pKvv1MMgJDmI78ZqocB38zvUzs/DjixKAW+3pRZoeoPc1OlD2dA3fX
 SDKYFGJWC5Zom0LdTlEDUAPhR9/vJ6Lhtv6LnIDAt7myJggHpVGAwMvGDmI
X-Google-Smtp-Source: AGHT+IHJ5X/g1j6lP0qjmOU4fOvCAdiC/VauUcbEb9ArOxo0iWsIHd4S90gC3AXBySoCa7I9XEUlm2stEllCzQdtg9A=
X-Received: by 2002:a17:902:f547:b0:297:d825:bf22 with SMTP id
 d9443c01a7336-297d825c0a6mr5657375ad.5.1762525683404; Fri, 07 Nov 2025
 06:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20251107125508.235449-2-phasta@kernel.org>
In-Reply-To: <20251107125508.235449-2-phasta@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Nov 2025 09:27:52 -0500
X-Gm-Features: AWmQ_bnq3Wjs0A3GFqnWs08XLNXM4-zvBTMXOBrzQDPdNRTyq7GOqJeUCRwyZMQ
Message-ID: <CADnq5_OU_bxHctMD5KjMfzsW4gaq8kC7fsO8TdgJr9kzLOCh5A@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Don't crash kernel on wrong params
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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

On Fri, Nov 7, 2025 at 8:01=E2=80=AFAM Philipp Stanner <phasta@kernel.org> =
wrote:
>
> drm_sched_job_arm() just panics the kernel with BUG_ON() in case of an
> entity being NULL. While drm_sched_job_arm() crashing or not effectively
> arming jobs is certainly a huge issue that needs to be noticed,
> completely shooting down the kernel reduces the probability of reaching
> and debugging a system to 0.
>
> Moreover, the checkpatch script by now strongly discourages all new uses
> of BUG_ON() for this reason.
>
> Replace the BUG_ON() in drm_sched_job_arm() with a WARN_ON().
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 1d4f1b822e7b..3bf4ae0ca4bc 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -857,7 +857,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>         struct drm_gpu_scheduler *sched;
>         struct drm_sched_entity *entity =3D job->entity;
>
> -       BUG_ON(!entity);
> +       WARN_ON(!entity);
>         drm_sched_entity_select_rq(entity);
>         sched =3D entity->rq->sched;
>
> --
> 2.49.0
>
