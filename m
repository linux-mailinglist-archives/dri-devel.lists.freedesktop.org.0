Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C87871DC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A70410E566;
	Thu, 24 Aug 2023 14:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C2C10E566;
 Thu, 24 Aug 2023 14:39:30 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3a7d7df4e67so4636843b6e.1; 
 Thu, 24 Aug 2023 07:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692887969; x=1693492769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jrK71RvaQ7b4OCylU/4LUKFwalwp4s36HCe5cCV9fk8=;
 b=hq3EB23/XpHs6XqYoXRFITE/p/yPGuHar54ibOcWKvSiEALt3/E0ipfKRJOhmAr9T7
 iXGJ6ZuOr9JaipvsmK/PV8DtB7whKXhsEl6cYKLWqI8BU+gxLCgnjwtUPH2vehAltBCr
 pI1VRffqDstCJHz+ULdBY9/941oPTpbtAP5fVUu/bbQD7PhOUY3M1bg4kNi8ttDRnLgE
 F2ba3zEv5WhVXX+1akMykFe7/W7Vjf+WX+ybejcNV62+T8raKjCQLjmwtmaMeoTI6IDp
 8hn382ivq+0816PIUb7cBFxyDpsJEazoV0NQowfUiBSt1IybWaEpz/wV/h7RwHburC69
 ZHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887969; x=1693492769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jrK71RvaQ7b4OCylU/4LUKFwalwp4s36HCe5cCV9fk8=;
 b=fVe5/hRZIRpRfJndX1rSafJG80wC1bU/6jjKNHDhsOQEdjHsC/QcWnD0xvcKUmZ/dM
 ZcAe2Ua51C8ey75PMI80jigREixf98nIXs5LdvqlEa8hm6CrdUGDWKlTB7QjeR+CT64M
 0JvvyYubxJW1cosbeMLGRc+BEEfFK1LDXm1snwicpO3kCSJLZRwKZcsUNH9F3Z4YfMBa
 3SMOkExZM2dBYJD4ryjyvVuWKnr4PeHHKXSGj8kcNsTYX1d3T1GF5ofFz3ABxahaoLQx
 SzqMcblZ85kbflQWRGGcrrXn51Qh1uKuaX6FP5nYdMjMRM0qXg9uUMBywYaHKT4zowJD
 B+aw==
X-Gm-Message-State: AOJu0YyGpRrTqD6iLV7NDPQPk3Dd75yKa+Z7aAxI4bI2sznsiAb4fIv8
 UXLrOuUaabew7AEDHzx7QoCPOL3kF4hRGMzkbRk=
X-Google-Smtp-Source: AGHT+IFgcLrF31v+WCFEQImPho9YhEJmvzbCnLfTuAfXnXJePen5IsCGW7BJuqY2tW7Tb+e203u+QBPbA8JpfyBYFkM=
X-Received: by 2002:a05:6808:2a62:b0:3a7:7d4:4f91 with SMTP id
 fu2-20020a0568082a6200b003a707d44f91mr16668415oib.14.1692887969702; Thu, 24
 Aug 2023 07:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230823090323.184121-1-colin.i.king@gmail.com>
 <PH7PR12MB599765C42139EDFCA7080339821CA@PH7PR12MB5997.namprd12.prod.outlook.com>
In-Reply-To: <PH7PR12MB599765C42139EDFCA7080339821CA@PH7PR12MB5997.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Aug 2023 10:39:18 -0400
Message-ID: <CADnq5_Oz22ahx3q0a3guye_TUvDDStfsdJBQjg6EfDpctVTRGQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd: Fix spelling mistake "throtting" ->
 "throttling"
To: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Aug 23, 2023 at 5:50=E2=80=AFAM Wang, Yang(Kevin)
<KevinYang.Wang@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
> Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
>
> Best Regards,
> Kevin
>
> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Co=
lin Ian King
> Sent: Wednesday, August 23, 2023 5:03 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Ch=
ristian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <ai=
rlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Lazar, Lijo <Lijo.Lazar@=
amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH][next] drm/amd: Fix spelling mistake "throtting" -> "thro=
ttling"
>
> There is a spelling mistake in variable throtting_events, rename it to th=
rottling_events.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c    | 6 +++---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c   | 6 +++---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/=
gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> index 704a2b577a0e..fbcff154b1d0 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> @@ -2313,7 +2313,7 @@ static const struct throttling_logging_label {  sta=
tic void arcturus_log_thermal_throttling_event(struct smu_context *smu)  {
>         int ret;
> -       int throttler_idx, throtting_events =3D 0, buf_idx =3D 0;
> +       int throttler_idx, throttling_events =3D 0, buf_idx =3D 0;
>         struct amdgpu_device *adev =3D smu->adev;
>         uint32_t throttler_status;
>         char log_buf[256];
> @@ -2328,11 +2328,11 @@ static void arcturus_log_thermal_throttling_event=
(struct smu_context *smu)
>         for (throttler_idx =3D 0; throttler_idx < ARRAY_SIZE(logging_labe=
l);
>              throttler_idx++) {
>                 if (throttler_status & logging_label[throttler_idx].featu=
re_mask) {
> -                       throtting_events++;
> +                       throttling_events++;
>                         buf_idx +=3D snprintf(log_buf + buf_idx,
>                                             sizeof(log_buf) - buf_idx,
>                                             "%s%s",
> -                                           throtting_events > 1 ? " and =
" : "",
> +                                           throttling_events > 1 ? " and=
 " : "",
>                                             logging_label[throttler_idx].=
label);
>                         if (buf_idx >=3D sizeof(log_buf)) {
>                                 dev_err(adev->dev, "buffer overflow!\n");=
 diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers/=
gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index cc3169400c9b..bed5a9df1c06 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -1674,7 +1674,7 @@ static const struct throttling_logging_label {  sta=
tic void aldebaran_log_thermal_throttling_event(struct smu_context *smu)  {
>         int ret;
> -       int throttler_idx, throtting_events =3D 0, buf_idx =3D 0;
> +       int throttler_idx, throttling_events =3D 0, buf_idx =3D 0;
>         struct amdgpu_device *adev =3D smu->adev;
>         uint32_t throttler_status;
>         char log_buf[256];
> @@ -1689,11 +1689,11 @@ static void aldebaran_log_thermal_throttling_even=
t(struct smu_context *smu)
>         for (throttler_idx =3D 0; throttler_idx < ARRAY_SIZE(logging_labe=
l);
>              throttler_idx++) {
>                 if (throttler_status & logging_label[throttler_idx].featu=
re_mask) {
> -                       throtting_events++;
> +                       throttling_events++;
>                         buf_idx +=3D snprintf(log_buf + buf_idx,
>                                             sizeof(log_buf) - buf_idx,
>                                             "%s%s",
> -                                           throtting_events > 1 ? " and =
" : "",
> +                                           throttling_events > 1 ? " and=
 " : "",
>                                             logging_label[throttler_idx].=
label);
>                         if (buf_idx >=3D sizeof(log_buf)) {
>                                 dev_err(adev->dev, "buffer overflow!\n");=
 diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/driver=
s/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> index d3b578e6bc2a..fa4ad08099ef 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> @@ -1888,7 +1888,7 @@ static const char *const throttling_logging_label[]=
 =3D {
>
>  static void smu_v13_0_6_log_thermal_throttling_event(struct smu_context =
*smu)  {
> -       int throttler_idx, throtting_events =3D 0, buf_idx =3D 0;
> +       int throttler_idx, throttling_events =3D 0, buf_idx =3D 0;
>         struct amdgpu_device *adev =3D smu->adev;
>         uint32_t throttler_status;
>         char log_buf[256];
> @@ -1902,10 +1902,10 @@ static void smu_v13_0_6_log_thermal_throttling_ev=
ent(struct smu_context *smu)
>              throttler_idx < ARRAY_SIZE(throttling_logging_label);
>              throttler_idx++) {
>                 if (throttler_status & (1U << throttler_idx)) {
> -                       throtting_events++;
> +                       throttling_events++;
>                         buf_idx +=3D snprintf(
>                                 log_buf + buf_idx, sizeof(log_buf) - buf_=
idx,
> -                               "%s%s", throtting_events > 1 ? " and " : =
"",
> +                               "%s%s", throttling_events > 1 ? " and " :=
 "",
>                                 throttling_logging_label[throttler_idx]);
>                         if (buf_idx >=3D sizeof(log_buf)) {
>                                 dev_err(adev->dev, "buffer overflow!\n");
> --
> 2.39.2
>
