Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C9A67232B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601EE10E792;
	Wed, 18 Jan 2023 16:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29A610E791;
 Wed, 18 Jan 2023 16:27:43 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 t7-20020a05683014c700b006864760b1caso3256685otq.0; 
 Wed, 18 Jan 2023 08:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZLdC3qx5X23ZTWTn4lkdwFcqpO5MTmWNpyLG41+WA1s=;
 b=nLf9epBFlxR6krgARsD3lbkWmGeZHvQA1oRluTyMi/qL2RWgXgcljSPE7Um4nStOdu
 9SI5Cz6hszekFbr1yxIl4bVZbVtn3y3jp605uNt12b8Yue1hdvqQzaXvDLANaOetbLew
 +hycseY5Y1eFI5b3JV+GAXEogzZsxBHm6g2iZmYvUCRazrBJfQ8dUH/l1OOB91/SQxMg
 p4O6FNSjUiv7p7V9d7jm1LkClKWZ3XUSIyu3d85I8Qbh/7eKN3EXAxIptZRpdbMRDK8S
 78bakS5oUq1sAleAjQPlmLtyqKiFDNRJ9X5YF0dBh9l8ozwVy+5FeDdnY6NyTutrOd2u
 t6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZLdC3qx5X23ZTWTn4lkdwFcqpO5MTmWNpyLG41+WA1s=;
 b=QIr110p6b6Wl6Uvblzip/G4kWaXkHCCWQ+y5s7RuCz2eDBTs0BYRjWKO17GJFwTA+e
 AT9xqg6UC+OnVAV5LdOYWwo8J24+Q22TfhmC6UITMTiWe9C7mqxLZqjCDZqPukE1mvUm
 O7ixI2GVp2ubS6WIeqYLNfqJhX++RusPeBjNFifZC37156nmOIWH+xKWqgKNz33ifuPs
 NYz18QSP+AliKyzZKyw6nzId+RcUZlYGdF3YgiX83B6xajzRmU26t2yc6IPvqeF7GqMp
 SYluUJ6REj0KzPYHS8kLmS73ZnRPYbcFNH39KRGfZNKk/MFeX/QHUsn4SBJEQZNOwZF1
 rz7w==
X-Gm-Message-State: AFqh2ko1+XveuW4x2tSli1jaClY5ApKQGSMVE+OIv9AE0rZb99PrdVsD
 LdQaD43tZnW2M+ZDnwEYQPuhGSaJkXedZKI/r/E=
X-Google-Smtp-Source: AMrXdXsegNk4k/rAkAxVNuPoRKAagjpW/F5xdsb24pH+zMi0Qk+mVGdtzKwl2en7fSBvf1GQSm5XETg6FeTPZl2AstU=
X-Received: by 2002:a05:6830:449:b0:684:bedc:4f54 with SMTP id
 d9-20020a056830044900b00684bedc4f54mr406381otc.233.1674059263009; Wed, 18 Jan
 2023 08:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20230118093011.3796248-1-arnd@kernel.org>
In-Reply-To: <20230118093011.3796248-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Jan 2023 11:27:31 -0500
Message-ID: <CADnq5_PF7j+X6_o7tVrnhnKhSY9=gASSgxzpTwPJ7WEq=YsR+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix dp_retrieve_lttpr_cap() return value
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Lewis Huang <Lewis.Huang@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jan 18, 2023 at 4:30 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> gcc-13 notices a mismatch between the return type of dp_retrieve_lttpr_cap()
> and the returned value:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c: In function 'dp_retrieve_lttpr_cap':
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1465:24: error: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Werror=enum-conversion]
>  1465 |                 return false;
>       |                        ^~~~~
>
> Change the value to an actual dc_status code and remove the bogus
> initialization that was apparently meant to get returned here.
>
> Fixes: b473bd5fc333 ("drm/amd/display: refine wake up aux in retrieve link caps")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
> index 088f4291bfbf..e72ad1b8330f 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_dp_capability.c
> @@ -1455,14 +1455,14 @@ static bool dpcd_read_sink_ext_caps(struct dc_link *link)
>  enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
>  {
>         uint8_t lttpr_dpcd_data[8];
> -       enum dc_status status = DC_ERROR_UNEXPECTED;
> -       bool is_lttpr_present = false;
> +       enum dc_status status;
> +       bool is_lttpr_present;
>
>         /* Logic to determine LTTPR support*/
>         bool vbios_lttpr_interop = link->dc->caps.vbios_lttpr_aware;
>
>         if (!vbios_lttpr_interop || !link->dc->caps.extended_aux_timeout_support)
> -               return false;
> +               return DC_ERROR_UNEXPECTED;
>
>         /* By reading LTTPR capability, RX assumes that we will enable
>          * LTTPR extended aux timeout if LTTPR is present.
> --
> 2.39.0
>
