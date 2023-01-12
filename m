Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FF6667F64
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 20:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9126610E1BA;
	Thu, 12 Jan 2023 19:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400BC10E1B5;
 Thu, 12 Jan 2023 19:33:50 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id o66so16104340oia.6;
 Thu, 12 Jan 2023 11:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aypgsOMzmGEhnMGY/eHKs1+jahN6svk47TXr3cbBLDY=;
 b=XJIfIuVyF+2IeoN8v3sm8ShKWmRSQhjtD/VSFe40yy9oq/Bd/3BrFL/EiH/ND/xLtv
 AoSNUskM/kLb/ByQl4tqDJ1BZT0ulle6DoHja4hqpFL9LBn0efdGnj9Zcpq56jHrl0E1
 Kz5tZ64Lcx2JRTrsUNQjkVSo6sYM95eqe0b1cpt/8qvFTUkN3GHYe63eOAVQWY/0b7rz
 3nOpFcdKPJpHdAnTunPdlNZs4yMBAO+6uROA2EF/4GEbWv37fh3qA4L8h+GzuGMUG1gO
 O+d+3F+8CBODT/B6OMZH+5ZDWX0UMV4/W83OcrbQUG0DQVpZwPzqPKHjAjbyWyZxj/VS
 gayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aypgsOMzmGEhnMGY/eHKs1+jahN6svk47TXr3cbBLDY=;
 b=ZvpyTt8iavqYqRJzE+bge8NmeESNc08Hx3AJpcliPhKxnhYNFqqxpLubtUjAARP0nZ
 9z5aMMLxAkJtQvk8MxUPheoxbv1yoLqOOuJZDCndCigUFtgrGWenCf4Aakc2ep3hz7lw
 GnD81O/z8rZV0DFGV+iRTmLyT4a1BI7rXKsQCChnYBW1sxdh17aZnHVIzKsyZNMURFnd
 6Kp+CEUXOvkC4rSyRm1bkWmg5nsXJsA+SXoITYqnwpHG9VhYFC4rDoE0edLJCDSj6vJJ
 bDBDKURqnya/lwo5NpRXl6ji6+IRXDQVPw9QtEdpkmlXNvZYpwklPHEHiRxCQjPM83NW
 jiww==
X-Gm-Message-State: AFqh2kpaKCSn/mHvo2WQ1bXtVD4+GMsvhGjdH8/UNT0zhohcCxcmYHRP
 0QK9aG8stW+hXfRSaFHwrekbi5/6oZOR8JXRnn4=
X-Google-Smtp-Source: AMrXdXtyJjc6vkU/EGsBHOqdS2kLFiSshjKvc0JLtfUFk6F0VTt7UUKvuL5X6VXwN3sLCNU5UUTi3xMRk9SAdlEVp+s=
X-Received: by 2002:a05:6808:2994:b0:35b:f5f7:3ed0 with SMTP id
 ex20-20020a056808299400b0035bf5f73ed0mr5306345oib.46.1673552029252; Thu, 12
 Jan 2023 11:33:49 -0800 (PST)
MIME-Version: 1.0
References: <Y8AQYhVkJjV86VXV@ubun2204.myguest.virtualbox.org>
In-Reply-To: <Y8AQYhVkJjV86VXV@ubun2204.myguest.virtualbox.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Jan 2023 14:33:37 -0500
Message-ID: <CADnq5_OttrDQ=nDQSg3OWj_aqwKSs1s3YpWRqnM1wmzJQ-F2RA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Conversion to bool not necessary
To: Deepak R Varma <drv@mailo.com>
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
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jan 12, 2023 at 8:51 AM Deepak R Varma <drv@mailo.com> wrote:
>
> A logical evaluation already results in bool. There is no need for using
> a ternary operator based evaluation and bool conversion of the outcome.
> Issue identified using boolconv.cocci Coccinelle semantic patch.
> This was also reported by the Kernel Test Robot. Hence
>
> Fixes: 473683a03495 ("drm/amd/display: Create a file dedicated for CRTC")
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 22125daf9dcf..1e39d0939700 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -105,8 +105,7 @@ static void vblank_control_worker(struct work_struct *work)
>         else if (dm->active_vblank_irq_count)
>                 dm->active_vblank_irq_count--;
>
> -       dc_allow_idle_optimizations(
> -               dm->dc, dm->active_vblank_irq_count == 0 ? true : false);
> +       dc_allow_idle_optimizations(dm->dc, dm->active_vblank_irq_count == 0);
>
>         DRM_DEBUG_KMS("Allow idle optimizations (MALL): %d\n", dm->active_vblank_irq_count == 0);
>
> --
> 2.34.1
>
>
>
