Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239EB28E9A8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 03:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6FD89FD3;
	Thu, 15 Oct 2020 01:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15C889FD3;
 Thu, 15 Oct 2020 01:12:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d3so1462242wma.4;
 Wed, 14 Oct 2020 18:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F7A/vYsnX6r+7AO5gfQk7caI7db0kds+FfKedxby9yM=;
 b=BBMnKnlNuVILoOTKj4UL/ioGQxnXg9fTI0B8FODsAWJsreaC1OVGnqc5VKTZNWA1i1
 g9vbCk4BIevgGnvr1bjnRpEel7ZflIsk1N0Sj+hho8t251QjUmvxdupHZGsjWVFjRNSj
 Rh+KhVe9zpKM9CN3V202kQ3f2MtbonZvXV0i2rWajKcS4sOtiVDzm4ahJDco3CaQjZC0
 IYyLJz03ftS92LOpUKuvGftMwVxG94U1WVJ9MbMJ9z5jSZApg3494Dd0Ql798q265XZs
 Ps3e7tWCJwXCkyPC9K9m/DQ6Egt02IRopqtcfFN9qDexqgV3XveaZ+/UYfYUKguQiE5H
 YkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F7A/vYsnX6r+7AO5gfQk7caI7db0kds+FfKedxby9yM=;
 b=mSXRETwxtowDqoWWChH/79a2uA5+0HPRWi+dbNWgmWBxm9FV2kXXU45ywQvCkh5BDc
 W/Xl2fZvqGAtlJafSjYaEKJqqh61I5LEFBOfTAouleOZ6Hq57NpBrLucXc8MTlz+Jyve
 TL9IpHVFluydjd9P2MqmAftB1QNw5ez/WD2vkUlwjF5lN0LZHYNbFm3ZruQLI5410evD
 ddND5Zjz3gMTCdgpt801Nivu06Ic1/4l89hF5eXQjbALQWRigJAKMyvD+MfUH9Rcvx3U
 2qENgGdKF8euN2XG4bSF8AHpgHMJuNbTtL2D53g4dUJOc6On0HmZ8C3+iqaUCGlZFy8O
 EwXQ==
X-Gm-Message-State: AOAM530hQGRPbZFqjQKGg6clAmFys3k3H9AIqDmnM5mD27AMAMPlrdNX
 BqcOjYsoNOC0aNdggLdgCuzF+nxbswGbiOSRTIZA+qyn
X-Google-Smtp-Source: ABdhPJyLSETrSo+oPb+19aB+lT2F+Rt9xNwt6EhwO4ctXDSsCbZLOhRujww+UZxJr0CZm/xOX2OEQoSX9qCNnttfJiQ=
X-Received: by 2002:a1c:1d15:: with SMTP id d21mr1345976wmd.79.1602724341351; 
 Wed, 14 Oct 2020 18:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201014211806.16282-1-trix@redhat.com>
In-Reply-To: <20201014211806.16282-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 Oct 2020 21:12:10 -0400
Message-ID: <CADnq5_MuAJp+m2NqAn6GYK5g_vnObVBz-vbCo2O_gCLjDy73pw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add missing newline at eof
To: trix@redhat.com
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
Cc: Xiaojian Du <xiaojian.du@amd.com>, "Chen, Guchun" <guchun.chen@amd.com>,
 Dave Airlie <airlied@linux.ie>, Tao Zhou <tao.zhou1@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>, Huang Rui <ray.huang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 14, 2020 at 5:18 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Representative checkpatch.pl warning
>
> WARNING: adding a line without newline at end of file
>  30: FILE: drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h:30:
> +#endif
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h | 2 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h
> index f26246a600c6..4089cfa081f5 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h
> @@ -745,4 +745,4 @@
>  #define RLC_EDC_CNT2__RLC_SPM_SE7_SCRATCH_RAM_SEC_COUNT_MASK                                                  0x30000000L
>  #define RLC_EDC_CNT2__RLC_SPM_SE7_SCRATCH_RAM_DED_COUNT_MASK                                                  0xC0000000L
>
> -#endif
> \ No newline at end of file
> +#endif
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h
> index 29929b360db8..d8696e2274c4 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.h
> @@ -27,4 +27,4 @@
>
>  extern void vangogh_set_ppt_funcs(struct smu_context *smu);
>
> -#endif
> \ No newline at end of file
> +#endif
> --
> 2.18.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
