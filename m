Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E74BFE92
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C6010E470;
	Tue, 22 Feb 2022 16:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4CD10E354;
 Tue, 22 Feb 2022 16:30:10 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so18310244oov.3; 
 Tue, 22 Feb 2022 08:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eSk/B5akCpkVV7QxSZtURlOxcgNjBBC3d9BzaaHV+Yo=;
 b=aXvHXnmshI/v4gnEa7KQ/u5AnLl0KUHmoodSrXYzKv/VI6xttGqGaV+7DgkVsF2+xN
 PD31tb6JFeswkMQwQg4OszytvuKhiSW5fnV3GdpOZtF6nqzB4SYhG9I358zOJyNFHV6V
 ihh/83PRWA2jMmGD2X9nszbPjUvEECJwmm0yKcuggNBXEqq57KJAiAoV6WNFMAM2Na7w
 2RPVyoNH4HBwdafAMqVmW2OAIXOUuEKjHMXvmqYUVyH56ClWtBHRx1xAFH6vCaReNfCh
 4SRf4gsX+BlxDotxPR7AHmhOmVN77mIU3kg2fUewutUQn8U4Xjkqsx0MzgyLqXaGseNU
 P3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eSk/B5akCpkVV7QxSZtURlOxcgNjBBC3d9BzaaHV+Yo=;
 b=GHDO53GmMhMhsybQI4duBoWfeRXUhNmIHrsiNwW0Poqa/Bl5WGg1Qh7D8C/hrNokwj
 wu0EtgSwB7CeuIy5TNiC9yeR4qEvvYWzWcbiwUtAoDfc7PMqMZdMR8vHZRZElhf9qqPT
 4Hd/D7m5vqLXphWcq7zTCF5IhH02/JjN1quI7cI+a11eHR8QivNiL6uVDOu9PpqOsbkW
 f3fAYtZVz1BRd0U4YlHugSjr/L0VjwShkyBAVp9J0qcZ0yvRBGHPt5i60l7aYWBzHnkc
 gB+A0tKKQMh3LersdWY2v3CMZ1G2BpDpB3V0xC8aN5Ioh034WYmfdA8Kh3DtfMrQ8wlk
 9ddA==
X-Gm-Message-State: AOAM5330L/qqnRrdfLWcWNkoyHiINKMzoLxN2SG7rzxOOvR99xVZdbzy
 A49KNIcfUwhnN3TkPmZLf+/ngzE/7DZtK+LalnY=
X-Google-Smtp-Source: ABdhPJyLdPbLN0J/R5Xdqs7KCIPSpW/mVSbPiQRj47dCrvZ67kzJey1F9VFOY8uP9l94Cb8W+OSClk6J6BJU0CtnUWk=
X-Received: by 2002:a05:6870:3e0d:b0:d3:fe6d:57c3 with SMTP id
 lk13-20020a0568703e0d00b000d3fe6d57c3mr2017599oab.225.1645547409808; Tue, 22
 Feb 2022 08:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20220222131701.356117-1-maira.canal@usp.br>
 <20220222131701.356117-4-maira.canal@usp.br>
In-Reply-To: <20220222131701.356117-4-maira.canal@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Feb 2022 11:29:58 -0500
Message-ID: <CADnq5_OQ5s4tSHduzdVFWbGKwmH57dkxXqs6ykbTxh+BzwihPQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] drm/amdgpu: Remove unused get_umc_v8_7_channel_index
 function
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
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
Cc: "Tuikov, Luben" <luben.tuikov@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, "Joshi, Mukul" <mukul.joshi@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mwen@igalia.com, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Magali Lemes <magalilemes00@gmail.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Isabella Basso <isabbasso@riseup.net>,
 John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Feb 22, 2022 at 8:17 AM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
>
> Remove get_umc_v8_7_channel_index function, which is not used
> in the codebase.
>
> This was pointed by clang with the following warning:
>
> drivers/gpu/drm/amd/amdgpu/umc_v8_7.c:50:24: warning: unused function
> 'get_umc_v8_7_channel_index' [-Wunused-function]
> static inline uint32_t get_umc_v8_7_channel_index(struct amdgpu_device *a=
dev,
>                        ^
>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> ---
>  drivers/gpu/drm/amd/amdgpu/umc_v8_7.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v8_7.c b/drivers/gpu/drm/amd/=
amdgpu/umc_v8_7.c
> index de85a998ef99..f35253e0eaa6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/umc_v8_7.c
> +++ b/drivers/gpu/drm/amd/amdgpu/umc_v8_7.c
> @@ -47,13 +47,6 @@ static inline uint32_t get_umc_v8_7_reg_offset(struct =
amdgpu_device *adev,
>         return adev->umc.channel_offs*ch_inst + UMC_8_INST_DIST*umc_inst;
>  }
>
> -static inline uint32_t get_umc_v8_7_channel_index(struct amdgpu_device *=
adev,
> -                                               uint32_t umc_inst,
> -                                               uint32_t ch_inst)
> -{
> -       return adev->umc.channel_idx_tbl[umc_inst * adev->umc.channel_ins=
t_num + ch_inst];
> -}
> -
>  static void umc_v8_7_ecc_info_query_correctable_error_count(struct amdgp=
u_device *adev,
>                                                 uint32_t umc_inst, uint32=
_t ch_inst,
>                                                 unsigned long *error_coun=
t)
> --
> 2.35.1
>
