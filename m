Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BBB6BAEB3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 12:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E09B10E9AF;
	Wed, 15 Mar 2023 11:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A739B10E9A9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 11:07:45 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4Pc70K2KlWzDrQc;
 Wed, 15 Mar 2023 11:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1678878465; bh=yx9Le/Wu1H+EH4XgSauGQXLxo8HaJnOCMijUh0Axv9I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KBfZNAPvDjR2q/gRwKMjAnWH5AYIE40cdcyu+itG+2hIM35htW+/tLlAqhs0QD7+e
 EMB/i2BhfXvPFOs2J9pWeMnubI8m6fI0WgKgtaOni9YfmXyMVk95d/VGza7qPJEO05
 FkTiHENuuybplHK3O0+dhCC4+l7civI7nGCyLlvA=
X-Riseup-User-ID: F543D490365B2E4CAF235E5121752E5F82208CCBC05B39EF7C10A3AC7802BAE9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4Pc70J1V1mz5vtv;
 Wed, 15 Mar 2023 11:07:43 +0000 (UTC)
Message-ID: <cd479b8f-5ccf-28d9-c1a2-85c3eaf4975d@riseup.net>
Date: Wed, 15 Mar 2023 08:07:41 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/ttm: Fix excess doc paramater warning in
 ttm_bo_mem_space
To: Yussef Fatayer <yusseffatayer@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230314042047.92954-1-yusseffatayer@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20230314042047.92954-1-yusseffatayer@gmail.com>
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
Cc: mcanal@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/14/23 01:20, Yussef Fatayer wrote:
> Rename documentation parameter from "proposed_placement" to
> "placement" to avoid the warnings of function parameter not
> described and excess function parameter.
> 
> Signed-off-by: Yussef Fatayer <yusseffatayer@gmail.com>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 459f1b4440da..8284f4d0ab21 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -748,7 +748,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>    *
>    * @bo: Pointer to a struct ttm_buffer_object. the data of which
>    * we want to allocate space for.
> - * @proposed_placement: Proposed new placement for the buffer object.
> + * @placement: Proposed new placement for the buffer object.
>    * @mem: A struct ttm_resource.
>    * @ctx: if and how to sleep, lock buffers and alloc memory
>    *
