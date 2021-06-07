Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180939DA06
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 12:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629D66E8A0;
	Mon,  7 Jun 2021 10:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1796E8A0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 10:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D21B43F831;
 Mon,  7 Jun 2021 12:46:12 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="VygDQlWF";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.689
X-Spam-Level: 
X-Spam-Status: No, score=-2.689 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IK29q8pRnNf5; Mon,  7 Jun 2021 12:46:12 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id DEC6C3F29E;
 Mon,  7 Jun 2021 12:46:11 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.55.55.41])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 41D3B3601A1;
 Mon,  7 Jun 2021 12:46:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1623062771; bh=Rp+lwVRGhzFJ6BguMDG+mWHjRIox39eA7+zRq5nsIp8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VygDQlWF2v2iALzOiyUyGVIy0VRXb6HEX4FiMMzE2pfk23tP4Qg2j1oDZb7dyPh12
 A9uNqJ8AsGroJbFopavM+y5yvexYtIkwdhU+L666pc6O1luMe9lDy5sKqZ9qBaWqYA
 djTqDCag76Wf2IMRzJF7M3WcIBQZudY/GwpYzkSE=
Subject: Re: [PATCH] drm/ttm: fix missing res assignment in ttm_range_man_alloc
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210607104040.22017-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <0a59c462-fe76-de1d-e571-da013ec6b0f0@shipmail.org>
Date: Mon, 7 Jun 2021 12:46:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607104040.22017-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/7/21 12:40 PM, Christian König wrote:
> That somehow got missing.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: cb1c81467af3 ("drm/ttm: flip the switch for driver allocated resources v2")

Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/ttm/ttm_range_manager.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index c32e1aee2481..03395386e8a7 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -88,12 +88,14 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   					  place->fpfn, lpfn, mode);
>   	spin_unlock(&rman->lock);
>   
> -	if (unlikely(ret))
> +	if (unlikely(ret)) {
>   		kfree(node);
> -	else
> -		node->base.start = node->mm_nodes[0].start;
> +		return ret;
> +	}
>   
> -	return ret;
> +	node->base.start = node->mm_nodes[0].start;
> +	*res = &node->base;
> +	return 0;
>   }
>   
>   static void ttm_range_man_free(struct ttm_resource_manager *man,
