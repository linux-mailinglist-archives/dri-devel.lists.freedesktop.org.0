Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C574B5B077C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 16:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C598710E78B;
	Wed,  7 Sep 2022 14:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20F8710E78B;
 Wed,  7 Sep 2022 14:50:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BD421042;
 Wed,  7 Sep 2022 07:50:18 -0700 (PDT)
Received: from [10.57.15.197] (unknown [10.57.15.197])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA8233F71A;
 Wed,  7 Sep 2022 07:50:10 -0700 (PDT)
Message-ID: <becf299e-9cf0-68bc-da31-1207e4bb71e1@arm.com>
Date: Wed, 7 Sep 2022 15:50:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] drm/amdgpu: fix repeated words in comments
Content-Language: en-GB
To: Jilin Yuan <yuanjilin@cdjrlc.com>, airlied@linux.ie, daniel@ffwll.ch,
 isabbasso@riseup.net
References: <20220907112657.25150-1-yuanjilin@cdjrlc.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220907112657.25150-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-07 12:26, Jilin Yuan wrote:
> Delete the redundant word 'we'.

FWIW, to me it's not redundant because while indeed it is not correct, 
it looks exactly like the kind of typo I might make of "if we", and 
parsing it as *that* does make sense. The sentence you end up with here 
can hardly be considered an improvement since it is still ungrammatical 
nonsense.

Robin.

> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index 02cb3a12dd76..6d6cc4637d41 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -694,7 +694,7 @@ static int amdgpu_vce_cs_reloc(struct amdgpu_cs_parser *p, struct amdgpu_ib *ib,
>    * @allocated: allocated a new handle?
>    *
>    * Validates the handle and return the found session index or -EINVAL
> - * we we don't have another free session index.
> + * we don't have another free session index.
>    */
>   static int amdgpu_vce_validate_handle(struct amdgpu_cs_parser *p,
>   				      uint32_t handle, uint32_t *allocated)
