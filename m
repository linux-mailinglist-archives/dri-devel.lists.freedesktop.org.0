Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B326B1A27
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 04:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D8310E789;
	Thu,  9 Mar 2023 03:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4495010E788;
 Thu,  9 Mar 2023 03:51:09 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-17671fb717cso1046708fac.8; 
 Wed, 08 Mar 2023 19:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678333868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hp14W4WtX0awNKWlLDE8zn48w3QnOXp8Ol12gIgmm9Q=;
 b=VZC2zz9bQaHlgp8s90U6kGkWkCxhJ0OE6aJWd1dOE4d569lv4K6qFJSquVuLElIU2D
 5ODRKZ63UrxfYKmBbMwSdSoQseO4AfRK8ijNU9SkX2D8EX9Gk83Bnu4EnkfvfY6w9upt
 D5/Qtn9yzYeGgoB8Bkmh4nvLK9glBHUKJzQnfzR1YXvDippAqffd19QWHj3tY1v/Vs3X
 nd0C2ks7xZaVJpQjsl0Cexx5DUixu11eN5ZOIAsQEqp56KkY3RZPtfOFKRY9dkVsfA3A
 APpFa2to/g+3eoj7mBecMyyk76ALfu9L4xC70YQmfF2mkvU0jR59u1xV6dOWvCMXUWuA
 /Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678333868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hp14W4WtX0awNKWlLDE8zn48w3QnOXp8Ol12gIgmm9Q=;
 b=gx4rABW2PGTqVFGkONjrh0MTlHXWKbg3yeIrcjVJiKgj7FDA4jVqNoDzsxYjWcCIXZ
 btQjA1HR3UDBgnYOd8p+WVYzvlrMBGKCkrWlkuQFijh8twqma6Vd6SXcKt22E3tjA+U/
 7CVao04pjA2dklNic+fYSBrx+oKXM7mP3mp0dvdmfSux6WRs0UanXCOf7H+aRH1kwqGj
 uVSpKVpXNclHYR9UyOd0UJbuRFpo0JMQp3TDiKnkZ09cea7De0kaQLBpP9e6DQ03erZ3
 iWlvMW5h/qnhR+T6KErZu3Qx1sPrnbpQgKp6Yr5LZEvklpQu+vGjik1AU21I/GKvwiLl
 2aPg==
X-Gm-Message-State: AO0yUKWYf89hG4Wt/lQpzFu4DnGQC58pMuMfC1mAMTaWq1myzGZ7DQJh
 HZqqdlPtyHtBtaPcUzyxUhzOPsLvl3mqvb/BAQA=
X-Google-Smtp-Source: AK7set8/iY7kVgL0ioTsy+Jeuo0eKBcUzi4tLPsAvZfwHYXHjco2pvMZKjXNsvI/ayzliVhBEIXgojGVUdg8xahMuAY=
X-Received: by 2002:a05:6871:6ab0:b0:176:4261:5e36 with SMTP id
 zf48-20020a0568716ab000b0017642615e36mr6988343oab.3.1678333868432; Wed, 08
 Mar 2023 19:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20230309033654.64762-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230309033654.64762-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Mar 2023 22:50:56 -0500
Message-ID: <CADnq5_NEYTz3kU+2BRC9x3hyMGO7+hEmr4zoabKpU9uzW3xG8g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove useless else if
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 8, 2023 at 10:37 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The assignment of the else and if branches is the same, so the if else
> here is redundant, so we remove it.
>
> ./drivers/gpu/drm/amd/amdgpu/nv.c:1048:2-4: WARNING: possible condition with no effect (if == else).
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4454
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/nv.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
> index 855d390c41de..84803929f7d9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -1045,19 +1045,11 @@ static int nv_common_late_init(void *handle)
>
>         if (amdgpu_sriov_vf(adev)) {
>                 xgpu_nv_mailbox_get_irq(adev);
> -               if (adev->vcn.harvest_config & AMDGPU_VCN_HARVEST_VCN0) {
> -                       amdgpu_virt_update_sriov_video_codec(adev,
> -                                                            sriov_sc_video_codecs_encode_array,
> -                                                            ARRAY_SIZE(sriov_sc_video_codecs_encode_array),
> -                                                            sriov_sc_video_codecs_decode_array_vcn1,
> -                                                            ARRAY_SIZE(sriov_sc_video_codecs_decode_array_vcn1));
> -               } else {
> -                       amdgpu_virt_update_sriov_video_codec(adev,
> -                                                            sriov_sc_video_codecs_encode_array,
> -                                                            ARRAY_SIZE(sriov_sc_video_codecs_encode_array),
> -                                                            sriov_sc_video_codecs_decode_array_vcn1,
> -                                                            ARRAY_SIZE(sriov_sc_video_codecs_decode_array_vcn1));

This should be vcn0.  I'll send out a patch.  Thanks!

Alex


> -               }
> +               amdgpu_virt_update_sriov_video_codec(adev,
> +                                                    sriov_sc_video_codecs_encode_array,
> +                                                    ARRAY_SIZE(sriov_sc_video_codecs_encode_array),
> +                                                    sriov_sc_video_codecs_decode_array_vcn1,
> +                                                    ARRAY_SIZE(sriov_sc_video_codecs_decode_array_vcn1));
>         }
>
>         return 0;
> --
> 2.20.1.7.g153144c
>
