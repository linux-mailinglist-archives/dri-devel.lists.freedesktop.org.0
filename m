Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5175870E138
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB2110E465;
	Tue, 23 May 2023 15:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECA710E465;
 Tue, 23 May 2023 15:58:05 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-39815ce6db2so1297674b6e.0; 
 Tue, 23 May 2023 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684857485; x=1687449485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFvK2YI/SbwYaKr7Laqhu7qjWnMsgbqf1UfbCGjE36A=;
 b=hA7H5Y4Uy0DlU+6tVXmlOjXIaAE+kzcbckW+uLeM5cTkq4lkSIyH5kSJwgnQ5VpErz
 /iouIKIQJEn4Kgcdn4V56BJbegiUFnlI3zE3XyzBZ7MpqX59ModviJ8I+pFxG89n8E9r
 aSZri1UHfi3gAUHoNpC3Ty2Ricv5rvtOrBNxipJf24Ycw+CGwHZDl2cPwvmxhAahjaNd
 pg0ptOe8RYOiBxUZiwxuCnlZccrNJ2oL80DR52X13d5Hlb1ym1kHr9BWNnIeXJ7VwCsF
 /rjXzj7IPSQtqx/feRTbUXy+wjl6mhFjKYmrX63IPqXngcATyLAvjX94UurAQnmcd56k
 8V3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684857485; x=1687449485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFvK2YI/SbwYaKr7Laqhu7qjWnMsgbqf1UfbCGjE36A=;
 b=cFv94lEiTirPNIFVqnr/NJMKgWqk1hQHqc3TscgzyNq6m6i6dMP/hB/eqz4GBU6Wqp
 GEL9Q5Jyp3xgp6d62d5/0Q4xdlchDljnx1OvlpTWt1aYrn00/0SsfKPdrxEO4qadfEi7
 pVuGtvWDSdWCQP9fW7iTUhDQx6pUmIuW4DPKjnvl1ovY+Wnt9BRUtAy6OjN6TIGJqv13
 078suj6YlLxQ6qCkfKgs0ds4aJz5mWuovbDR6q3kfTn4psLgiWgmTBsC22vyzmp9OZhi
 UggoxtFwpkCTMHpCLm/1Y6ES9PVirm1cxtSF/t032Qiq3zTfV8Oxdaigk0CnIjGG1/J1
 leFA==
X-Gm-Message-State: AC+VfDzHKC5Hm4BVh1rcBjZnotMDHSY9zwXGPit9pHNqCwRpwwzSIdgI
 /lIzYtkL2UzVgqJa+KKgKu6WbtQvqgdrFBal8Yw=
X-Google-Smtp-Source: ACHHUZ4AHxuecDwpGGY0Y5cC98Kt8hS8/f6vC/Te2pco6rpqdVK3DQDOmabHqkqRyIjIUm3H5nOyovYmTshHVUQjwpg=
X-Received: by 2002:aca:3356:0:b0:395:e376:7ca1 with SMTP id
 z83-20020aca3356000000b00395e3767ca1mr8819792oiz.7.1684857484855; Tue, 23 May
 2023 08:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230523033202.109828-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230523033202.109828-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 May 2023 11:57:53 -0400
Message-ID: <CADnq5_Ojwdsy9k=R_o1bDsDt4LZyU0QJkW9qaky-3SKd0bXKvg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/vcn: Modify mismatched function name
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, May 22, 2023 at 11:32=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:374: warning: expecting prototype=
 for vcn_v4_0_mc_resume_dpg_mode(). Prototype was for vcn_v4_0_3_mc_resume_=
dpg_mode() instead.
> drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c:631: warning: expecting prototype=
 for vcn_v4_0_enable_clock_gating(). Prototype was for vcn_v4_0_3_enable_cl=
ock_gating() instead.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D5284
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/am=
d/amdgpu/vcn_v4_0_3.c
> index 339842382a1e..5d67b8b8a3d6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
> @@ -362,7 +362,7 @@ static void vcn_v4_0_3_mc_resume(struct amdgpu_device=
 *adev, int inst_idx)
>  }
>
>  /**
> - * vcn_v4_0_mc_resume_dpg_mode - memory controller programming for dpg m=
ode
> + * vcn_v4_0_3_mc_resume_dpg_mode - memory controller programming for dpg=
 mode
>   *
>   * @adev: amdgpu_device pointer
>   * @inst_idx: instance number index
> @@ -620,7 +620,7 @@ static void vcn_v4_0_3_disable_clock_gating_dpg_mode(=
struct amdgpu_device *adev,
>  }
>
>  /**
> - * vcn_v4_0_enable_clock_gating - enable VCN clock gating
> + * vcn_v4_0_3_enable_clock_gating - enable VCN clock gating
>   *
>   * @adev: amdgpu_device pointer
>   * @inst_idx: instance number
> --
> 2.20.1.7.g153144c
>
