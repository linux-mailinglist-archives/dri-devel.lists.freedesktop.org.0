Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42E4EE7F7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 07:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA22810E478;
	Fri,  1 Apr 2022 05:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AEE10E251;
 Fri,  1 Apr 2022 05:54:31 +0000 (UTC)
Received: from [192.168.0.4] (ip5f5aef67.dynamic.kabel-deutschland.de
 [95.90.239.103])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id A9F4761EA192A;
 Fri,  1 Apr 2022 07:54:29 +0200 (CEST)
Message-ID: <2a2b1f76-7e9b-9561-e190-16d808eb5399@molgen.mpg.de>
Date: Fri, 1 Apr 2022 07:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amdgpu/vcn: remove Unneeded semicolon
Content-Language: en-US
To: Haowen Bai <baihaowen@meizu.com>
References: <1648706190-4596-1-git-send-email-baihaowen@meizu.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <1648706190-4596-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Haowen,


Thank you for your patch.

Am 31.03.22 um 07:56 schrieb Haowen Bai:

In the commit message summary, please use:

Remove unneeded semicolon

> report by coccicheck:
> drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:1951:2-3: Unneeded semicolon
> 
> fixed c543dcb ("drm/amdgpu/vcn: Add VCN ras error query support")

Please use

Fixes: …

and a commit hash length of 12 characters. (`scripts/checkpatch.pl …` 
should tell you about this.)


Kind regards,

Paul


> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> index 3e1de8c..17d44be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> @@ -1948,7 +1948,7 @@ static uint32_t vcn_v2_6_query_poison_by_instance(struct amdgpu_device *adev,
>   		break;
>   	default:
>   		break;
> -	};
> +	}
>   
>   	if (poison_stat)
>   		dev_info(adev->dev, "Poison detected in VCN%d, sub_block%d\n",
