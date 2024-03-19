Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ACD880E72
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28D210E174;
	Wed, 20 Mar 2024 09:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E97C10F227
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 17:40:04 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <sf-dri-devel@m.gmane-mx.org>) id 1rmdRS-0001Im-4m
 for dri-devel@lists.freedesktop.org; Tue, 19 Mar 2024 18:40:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: dri-devel@lists.freedesktop.org
From: Timothy Maden <terminatorul@gmail.com>
Subject: Re: [PATCH] nouveau/gsp: don't check devinit disable on GSP.
Date: Tue, 19 Mar 2024 19:38:22 +0200
Message-ID: <utciie$rai$1@ciao.gmane.io>
References: <20240314014521.2695233-1-airlied@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <20240314014521.2695233-1-airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 20 Mar 2024 09:22:29 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello

Can this be merged please ?

On 3/14/24 03:45, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> GSP should be handling this and I can see no evidence in opengpu
> driver that this register should be touched.
> 
> Fixed acceleration on 2080 Ti GPUs.
> 
> Fixes: 15740541e8f0 ("drm/nouveau/devinit/tu102-: prepare for GSP-RM")
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> index 666eb93b1742..11b4c9c274a1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> @@ -41,7 +41,6 @@ r535_devinit_new(const struct nvkm_devinit_func *hw,
>   
>   	rm->dtor = r535_devinit_dtor;
>   	rm->post = hw->post;
> -	rm->disable = hw->disable;
>   
>   	ret = nv50_devinit_new_(rm, device, type, inst, pdevinit);
>   	if (ret)


