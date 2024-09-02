Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0364968CE9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 19:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9302410E389;
	Mon,  2 Sep 2024 17:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ST/cykna";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA5310E387;
 Mon,  2 Sep 2024 17:41:41 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-72703dd2b86so552737a12.1; 
 Mon, 02 Sep 2024 10:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725298901; x=1725903701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+wNgYxU7oLzYD3y0Bt7MyKXymsVh78qZSxkiBUsM4A=;
 b=ST/cyknaVfyG3PAYjJcN+NayCvvZ1/BiqMW00NYtjwFd57JNsolGTQaYQEt+uKV401
 WySxh6pfnS87ZmwaO3JhI/ifIcDaeEyoqbtMPXuyfgftevZbSPnb5hVdC38p+JrAnBBU
 5dTFBsJ8Ud0kClqC0gw5z9VLKkTZF1Q8DRGNlfW9RWFb/g/qHT/WRar3Mk7HqhFLvJ6+
 4e80C6kuVmMGzEr2HZlg2h1pFtUKRtGEVWAfiEPPQNIcUyPejI4hHjm/gsxZ4Mqwdx89
 Bt+C6MIycdo+S53l6xhQzmITeyabMtvdLBbse09mnOYMv0bZ6GSCJ0adSNacMsyHdczW
 W0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725298901; x=1725903701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+wNgYxU7oLzYD3y0Bt7MyKXymsVh78qZSxkiBUsM4A=;
 b=vbyOk0Qa/2Ol4YhZpivxGhl7wUuKyOwvSCoGoEwSWXDMoUYFgGgy8DrNy+IGG/60lZ
 79tsE9P8dJIOtGigveLRdT5iROs3HPaKSk0BMS93SFoCa7Kxg7/B9p5vs/vPjXJFAxXI
 ZKMaj6rosJ9GobDRc8CqDLoimLWlvsm/iByv2NimYU4S7KKxNCx+4faOWME+8/nCfmub
 5u/8JaOuzjtkE00fT/jARMZ8Sa4kr58qno9G/gy1fDQrH4l7Emrb3feBD8B7zauKoAeM
 WOKbRXuA3+MK+sAXIMElTc2M1V/EFmkQS98AW+/AhpTZnpBTWHXmmy/RV732pgmWxO2Y
 mJFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9u529jGhjP1vkwaV3a59I/cCNiMQWnmZEgP/SWgXJlLwy7vKUVvSGwnFdPFN4/0URyL66Tgls6cql@lists.freedesktop.org,
 AJvYcCVxWIR8tPm1OaCr4KT6QuKxMBxMsLcVJ8bSyxOzZS2nMDMRdcCWWQO/B1YwCPmNRW17ux8bVyTN@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr5B/FKxu+jfbpYZXUiES6eG//FSMjlVMK31CDCew41gKTatat
 CpqcyDtFC2yLYa4Luz+JOgN+mG6pazCTeCOpHFaWt0euu9B2PSWPLfbsOtC0QU/hsZs4NHdUXnj
 GbMcrTtV6xelhLuBsFwk/NlEUtYtInQ==
X-Google-Smtp-Source: AGHT+IGkg12Pi/6mf66io9D4Xdsd85fJlC6soRLCamM5arxcv6bY2hHX75vh/HfsgiJ/ZJ20leY3s+4dgW2u7NweAM8=
X-Received: by 2002:a17:903:2346:b0:205:938b:f387 with SMTP id
 d9443c01a7336-205938bf846mr10502095ad.8.1725298901041; Mon, 02 Sep 2024
 10:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240828093250.271358-1-colin.i.king@gmail.com>
In-Reply-To: <20240828093250.271358-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Sep 2024 13:41:29 -0400
Message-ID: <CADnq5_MJYokqxKs+TJz5-ut-Gsy_SxP79g9Xr-hQxkJAb-86yA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake "recompte" ->
 "recompute"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Applied.  Thanks!

On Wed, Aug 28, 2024 at 5:43=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in a DRM_DEBUG_DRIVER message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 0859a7173a06..669fd8fb6c24 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -1325,7 +1325,7 @@ static bool is_dsc_need_re_compute(
>                 if (new_crtc_state->enable && new_crtc_state->active) {
>                         if (new_crtc_state->mode_changed || new_crtc_stat=
e->active_changed ||
>                                         new_crtc_state->connectors_change=
d) {
> -                               DRM_DEBUG_DRIVER("%s:%d MST_DSC dsc recom=
pte required."
> +                               DRM_DEBUG_DRIVER("%s:%d MST_DSC dsc recom=
pute required."
>                                                  "stream 0x%p in new dc_s=
tate\n",
>                                                  __func__, __LINE__, stre=
am);
>                                 is_dsc_need_re_compute =3D true;
> --
> 2.39.2
>
