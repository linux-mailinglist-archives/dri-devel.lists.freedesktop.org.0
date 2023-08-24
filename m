Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB2C7872F6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 16:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E12E10E570;
	Thu, 24 Aug 2023 14:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E4810E570;
 Thu, 24 Aug 2023 14:59:22 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-570f0cb0c1eso6224eaf.0; 
 Thu, 24 Aug 2023 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692889161; x=1693493961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qOrKAhL/7L8rx8ShdtWBY/61puZF7B2DZm1BsaoYJt8=;
 b=Mx0bXIz8ZJ8ay48rsZT8xh5Xaslo5YJX+IhZgiPsWRv93e3mXYmyHs+wEfuu/y0rOj
 5+J1irYrF8A8zvInfA8EGoGnM1+N6GVNstBJtJrlXEqGL6tb8WEeW1AT8SjdaCP4bnRT
 tzucCOcNj+X8mKRPbnztDvMF1Gs8kPxgViiMs3+wx3c1xEPu3EFIfUXzld6wh2KIXyh1
 MPNHDpOu/ePFJSvGCxQ1JpU09u+kQlHHUV7WwNVqJnqguZBucCtsUOnbFlg5vBdwIVQl
 IYdamPMsP+ZCEKw9Y/XoDCkgZOChNHZOg4w3vt1wvIUw2Zor0IR6T9eYDrJJkgxlzlia
 AlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692889161; x=1693493961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qOrKAhL/7L8rx8ShdtWBY/61puZF7B2DZm1BsaoYJt8=;
 b=iWBLQU0ZhfQiLYW6k2n4C1HcciBoA+ZaR+j/XkuSvQbrEVdTCZK++1iFMABno+On+y
 OjNJW0H0YBVDmj8udw0USliz+0XXTxetTetaw37tYFPse/VIsMPuRXON9oZa83khPL6/
 PIj/AtCcj06LgrkUCYcO3LWLW2W46jaqdg+BufVzK3Qtn/B3zc9Ud3kZUNSfrG7mdRYI
 sVintWex0hEonJ5yy0hwSWZdHdqbd6Fw3lrE5/h0bIey/p7oaow4ZZ/3qTxkzQ32sk3w
 8weT915Z9d7QFoOzYmwp0s6QUfKZMSWhv1y+64fdq7WilhiGgLLRRTgQMTFGVR39LDD5
 7nXQ==
X-Gm-Message-State: AOJu0Yy5tNOgV3biARKfs/emGnQcUdfa9w3dSEHNlvAAxOQkWherhBYR
 D6gg6I8AJG3xOlArg1LoZERMt8khxI6HJt3d1w8=
X-Google-Smtp-Source: AGHT+IES2etgcqRdMcU6Cv/oaMM2wsQXHG0/gHbgwbSl5bh0abxyxRhClWxMpv8vCb8toTlVVasaO5RJmdKYA5hjhpQ=
X-Received: by 2002:a4a:3014:0:b0:573:2312:b3 with SMTP id
 q20-20020a4a3014000000b00573231200b3mr1983597oof.4.1692889161451; 
 Thu, 24 Aug 2023 07:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-12-lee@kernel.org>
 <MW4PR12MB56671A4E4281690A44C45C91F21DA@MW4PR12MB5667.namprd12.prod.outlook.com>
In-Reply-To: <MW4PR12MB56671A4E4281690A44C45C91F21DA@MW4PR12MB5667.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Aug 2023 10:59:10 -0400
Message-ID: <CADnq5_P4jFAdWwaemnaGq7ADt8V95g+U9JeiO99N=cyDBMhHEw@mail.gmail.com>
Subject: Re: [PATCH 11/20] drm/amd/amdgpu/amdgpu_doorbell_mgr: Correct
 misdocumented param 'doorbell_index'
To: "Sharma, Shashank" <Shashank.Sharma@amd.com>
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
Cc: Lee Jones <lee@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Aug 24, 2023 at 4:35=E2=80=AFAM Sharma, Shashank
<Shashank.Sharma@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
> Reviewed-by: : Shashank Sharma <shashank.sharma@amd.com>
>
> Regards
> Shashank
> -----Original Message-----
> From: Lee Jones <lee@kernel.org>
> Sent: Thursday, August 24, 2023 9:37 AM
> To: lee@kernel.org
> Cc: linux-kernel@vger.kernel.org; Deucher, Alexander <Alexander.Deucher@a=
md.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.=
Pan@amd.com>; David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll=
.ch>; Sharma, Shashank <Shashank.Sharma@amd.com>; amd-gfx@lists.freedesktop=
.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH 11/20] drm/amd/amdgpu/amdgpu_doorbell_mgr: Correct misdoc=
umented param 'doorbell_index'
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:123: warning: Function =
parameter or member 'doorbell_index' not described in 'amdgpu_doorbell_inde=
x_on_bar'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:123: warning: Excess fu=
nction parameter 'db_index' description in 'amdgpu_doorbell_index_on_bar'
>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
> index da4be0bbb4466..d0249ada91d30 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
> @@ -113,7 +113,7 @@ void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev=
, u32 index, u64 v)
>   *
>   * @adev: amdgpu_device pointer
>   * @db_bo: doorbell object's bo
> - * @db_index: doorbell relative index in this doorbell object
> + * @doorbell_index: doorbell relative index in this doorbell object
>   *
>   * returns doorbell's absolute index in BAR
>   */
> --
> 2.42.0.rc1.204.g551eb34607-goog
>
