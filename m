Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA0660333
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 16:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D25210E86E;
	Fri,  6 Jan 2023 15:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9180A10E86E;
 Fri,  6 Jan 2023 15:29:44 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id v70so1311942oie.3;
 Fri, 06 Jan 2023 07:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=65qSmGmypBwql4yygZi8U8Y0QUeOs13b5WCSPH/ZqUQ=;
 b=JLQykHDcS1zKJIrE0dQuyBmiNCv+IYRcVdtUJIsVEvjENQHoVGI1Ri8Ksd53ABlcrl
 SgDRUh5k0oyrXWzT8zfzWN61rdDPDITnmCEhACbCnFaRV6iT/meialGfRDV2iF0bIMJN
 25fnyBAfYt7aFExEHiZF6JkJ0xkRd1GAadfzjWHwzhj0/L9igcOn1Iq87cYNjA48z+NB
 VBxou58mvCaanlU3cZWo5fU/DBSHqQBadAcbID+bnAWxu7vrDLr59vJNx1aBTgpxTbri
 ABAjSaRx8lb2bzfdHbbbYVBPZw70pK+DIRsZvTAxoFvLo37mGt/PteosyvsWx/7F6ry1
 69KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=65qSmGmypBwql4yygZi8U8Y0QUeOs13b5WCSPH/ZqUQ=;
 b=FZWNVCSCWvwc4wskV253WrKV9j7HAyUvSgqG1NehH6nKqGgG0PzgidSRQ+qJ8YHijz
 hLJh9Eb/YttUOOc5a7PFz/nUXdpZTaAtyXNrT83z/ekAblAi+D7kMG43oPw5q2gw91yY
 Smpm0MaloRfG2fROJT5uFTNY+2lAmyP4cyl5w7w3xpi7LhRkQtkC3dDQBl2fKgBFlMd/
 73x77mE/zM9w621S+69NSgDgGFpUcVwWukGkDcBTkt8I1VW6DtdztKgjW3LMiQ/5rqbh
 EFDz97xQJZpIT/q0qrAmMstOY4AfBywKM6pdidcEhSUsgZRuZsACXBizhnRRenB3jnOc
 asTg==
X-Gm-Message-State: AFqh2koxmMKQo+EQMZFjYdS5Enr0+3mOF1TjVJCU5nQEzWU/XLux0Dnv
 2p2DiDfuIucYIbC9bIdOmAa3zjtM4/+vBIdDYS8=
X-Google-Smtp-Source: AMrXdXulMJ+JdC0imQzl49t89u5AcQDZaBrY9QdB91cd67Chvp/1y/weZ/pj9wtho0z2KnmqLYOGN63vb7U/0qsU4UU=
X-Received: by 2002:a05:6808:2001:b0:35b:d93f:cbc4 with SMTP id
 q1-20020a056808200100b0035bd93fcbc4mr3588739oiw.96.1673018983790; Fri, 06 Jan
 2023 07:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20230106002453.18770-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230106002453.18770-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Jan 2023 10:29:32 -0500
Message-ID: <CADnq5_POir-_+xrSL7eRQtPtMo1v2QkmuKdNFxg0oPYBGzi8eA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Jan 5, 2023 at 7:30 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7431:3-4: Unneeded semicolon
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7485:4-5: Unneeded semicolon
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7489:3-4: Unneeded semicolon
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3635
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index cabe02cb307c..90dc72e98eb2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7428,7 +7428,7 @@ static bool is_content_protection_different(struct drm_crtc_state *new_crtc_stat
>                         new_conn_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
>                         pr_debug("[HDCP_DM] ENABLED->DESIRED & mode_changed %s :true\n", __func__);
>                         return true;
> -               };
> +               }
>                 new_conn_state->content_protection = DRM_MODE_CONTENT_PROTECTION_ENABLED;
>                 pr_debug("[HDCP_DM] ENABLED -> DESIRED %s :false\n", __func__);
>                 return false;
> @@ -7482,11 +7482,11 @@ static bool is_content_protection_different(struct drm_crtc_state *new_crtc_stat
>                                 pr_debug("[HDCP_DM] DESIRED->DESIRED or ENABLE->ENABLE mode_change %s :true\n",
>                                         __func__);
>                                 return true;
> -                       };
> +                       }
>                         pr_debug("[HDCP_DM] DESIRED->DESIRED & ENABLE->ENABLE %s :false\n",
>                                 __func__);
>                         return false;
> -               };
> +               }
>
>                 pr_debug("[HDCP_DM] UNDESIRED->UNDESIRED %s :false\n", __func__);
>                 return false;
> --
> 2.20.1.7.g153144c
>
