Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546DF9B052C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 16:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF7A10EAF0;
	Fri, 25 Oct 2024 14:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eDiDqk+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31DD10EAF0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 14:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729865417;
 bh=7SPox3NZ21lcSNZ7VKlut2mbfbHjXIPhkTDdq8+g6Zc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eDiDqk+jOQASzrC2Bdap/7jqxoNTmBc38pzlkYfdigEok7MGwlj9w4YpMZJbMebQN
 QLKqsTkw211Y+e6ylzXhkE5TgHA5XWBlLncxbkLM/Y/Yn0JtlrGjcjB8wD7KeLqK5Y
 hRfsyBC/cZIsbeO+3nv1b29NBH2AQZE31fI4dbZmRgZgvI6Vit/BPWtth6xn81Q490
 CjNdI4INqnaI+vC+J90ghwifpbV479Rza0QzyEVwEp7P5oXctKS9HSw6IpHf9TUN58
 Xo4riekHvCDy7Xq/+oyIsgsxxtQRyQuG7w3wQj/NPwJmhqA4I63B13kSmBw5y9J3gU
 zacjwTh5iIqJA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CFD317E3629;
 Fri, 25 Oct 2024 16:10:17 +0200 (CEST)
Date: Fri, 25 Oct 2024 16:10:13 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panfrost: Remove unused id_mask from struct
 panfrost_model
Message-ID: <20241025161013.557a3644@collabora.com>
In-Reply-To: <20241025140008.385081-1-steven.price@arm.com>
References: <20241025140008.385081-1-steven.price@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Oct 2024 15:00:07 +0100
Steven Price <steven.price@arm.com> wrote:

> The id_mask field of struct panfrost_model has never been used.
> 
> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index f19f918e2330..f5abde3866fb 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -177,7 +177,6 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
>  struct panfrost_model {
>  	const char *name;
>  	u32 id;
> -	u32 id_mask;
>  	u64 features;
>  	u64 issues;
>  	struct {

