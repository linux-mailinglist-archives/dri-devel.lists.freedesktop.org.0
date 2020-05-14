Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CBD1D2A6A
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 10:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D9B6EADF;
	Thu, 14 May 2020 08:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA2C6EADF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 08:39:40 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Thu, 14 May 2020 01:39:35 -0700
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id 24D28B2723;
 Thu, 14 May 2020 04:39:35 -0400 (EDT)
Subject: Re: [Linux-graphics-maintainer] [PATCH] drm/vmwgfx: Return true in
 function vmw_fence_obj_signaled()
To: Jason Yan <yanaijie@huawei.com>, <linux-graphics-maintainer@vmware.com>,
 <thellstrom@vmware.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sumit.semwal@linaro.org>, <chris@chris-wilson.co.uk>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20200507110714.37589-1-yanaijie@huawei.com>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <0b30cc20-95d4-009b-6c77-f1119d396e8b@vmware.com>
Date: Thu, 14 May 2020 10:39:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200507110714.37589-1-yanaijie@huawei.com>
Content-Language: de-DE
Received-SPF: None (EX13-EDG-OU-001.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've pulled that into our tree, thanks!

Roland

Am 07.05.20 um 13:07 schrieb Jason Yan:
> Fix the following coccicheck warning:
> 
> drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:518:9-10: WARNING: return of 0/1
> in function 'vmw_fence_obj_signaled' with return type bool
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> index 178a6cd1a06f..0f8d29397157 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -515,7 +515,7 @@ bool vmw_fence_obj_signaled(struct vmw_fence_obj *fence)
>  	struct vmw_fence_manager *fman = fman_from_fence(fence);
>  
>  	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
> -		return 1;
> +		return true;
>  
>  	vmw_fences_update(fman);
>  
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
