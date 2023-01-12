Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF980667EB1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 20:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5210E910;
	Thu, 12 Jan 2023 19:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AB210E90B;
 Thu, 12 Jan 2023 19:07:46 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id r132so5495348oif.10;
 Thu, 12 Jan 2023 11:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GiJEsLNpkHnW+GAQ0NBigzoD8JOv1F6wdXxOX2ruxq0=;
 b=Oheuo3BVTnqAZlN/6ElEIymARl5QOK1V5kY8iK6oj+KM7C4k7SjlcnaDljEFwlwcYm
 GOV8V0+Mkpgf72QV2JFVsrxOcUsWhwUS3c/JJofbAh0l+OwCr3i6Q02y/Eo342moqK+O
 oHs27IiX4biAXdNzZWFrp/RdzzirfxM8tDGjIJuIBOedKNJLOyVKYD0b4EN5NsNJ1PL7
 3dvWW6s0MWS3LvEqwFxlRi5sjLB+xWggFjNnwepkvufPYVb1DFaRqHwvP+m1cmJUHAEr
 T9Z42IBFfdOCwii2BRkohu+ZeJQI4GQ/J2glQFmhrABacuWEwoC82rgueKv0Ss7rU0i7
 MLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GiJEsLNpkHnW+GAQ0NBigzoD8JOv1F6wdXxOX2ruxq0=;
 b=xQiz5hy9SKdp0hRcSA6Cx+G6DUVH09LKbWpREEe+O1sfnz/luL159Vc/0VODgT4A/b
 2K5WMrFYP6phU1CCPIGE13U96R9hkdMKQjUciyAA+Meyj2oZkg3P3tElL4JWNVRsDqQV
 t9QtLvhSGpMewZIT6Ayym96757mvtLzYyuLSGSIxnr1NKOwmvED0kv7l+Ttj0PuRdVgd
 NnmEUqwpr6F6J3cWVW54DnNj7gEyV8+9CDHg5RmFLgfKIHDY8I4FH4z9zLQtHbUCD9dU
 cqteP5A+gjzblqJgh+RXoK04kXbDhM8VE5J3RZFexb+1Stjjs5IcnZIWueS9/f3l011f
 CNiA==
X-Gm-Message-State: AFqh2kpwrBV70R7hJ9WgsQuK/vl+kM4/C9BTErsz0XVBa4ESw04V2wMw
 jIQd0PK5PMqqRS9/A5p4jphBg/37OsfyPO2DRz4=
X-Google-Smtp-Source: AMrXdXusvS3C+v7xV1vK0cy5jdeabhFLWWpt3LVQ6eqjaO2XL1mtufA1+VPFCSBypjA5EBfJ0rsqKpNsWmFeOs8JYdE=
X-Received: by 2002:a05:6808:2001:b0:35b:d93f:cbc4 with SMTP id
 q1-20020a056808200100b0035bd93fcbc4mr5087507oiw.96.1673550465717; Thu, 12 Jan
 2023 11:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20230112032049.128610-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230112032049.128610-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Jan 2023 14:07:34 -0500
Message-ID: <CADnq5_N=gp4KXxt6SCg31tRbOu66qp5NV2V9OKcMWP2fRntbhQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove useless else if
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Jan 11, 2023 at 10:21 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The assignment of the else and if branches is the same, so the if else
> here is redundant, so we remove it.
>
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1951:2-4: WARNING: possible condition with no effect (if == else).
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3719
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 4300ce98ce8d..aa3024e58d12 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1948,10 +1948,7 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
>                 dmub_asic = DMUB_ASIC_DCN21;
>                 break;
>         case IP_VERSION(3, 0, 0):
> -               if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
> -                       dmub_asic = DMUB_ASIC_DCN30;
> -               else
> -                       dmub_asic = DMUB_ASIC_DCN30;
> +               dmub_asic = DMUB_ASIC_DCN30;
>                 break;
>         case IP_VERSION(3, 0, 1):
>                 dmub_asic = DMUB_ASIC_DCN301;
> --
> 2.20.1.7.g153144c
>
