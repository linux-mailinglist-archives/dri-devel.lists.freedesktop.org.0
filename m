Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332EC65CB1D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 01:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D365010E2A8;
	Wed,  4 Jan 2023 00:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDA610E2A8;
 Wed,  4 Jan 2023 00:52:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08425B8119C;
 Wed,  4 Jan 2023 00:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543E7C433EF;
 Wed,  4 Jan 2023 00:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672793521;
 bh=MSAiWrHIQ+/AHtGbShhE/8haLs6lILykSFR/Hd4m/9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AriK+kvbz8GZQ4TcnVFBgAWpSAgBQmAvPupI+tCSCTEMwM33Ml+Am/SDFzb+uaDcH
 5igUHcyuOY30ol0nEHLX2wYwIrX1Z3QPySUUduR80ienEtcHJtzJv+0F3JkzcvhFOC
 vElmJXQEdpiTyqozccVMidgDTb1j2sx+Tmwlf7XoB3Sb91foCzAmcwBjGwSFr2Gk0o
 OsVteNud+8WK23B8kwKP5tO6T9GpRKgpfmb4At6WwFwkCRvsRZR5wepOAZKOwBOaTu
 TMrwCJARp673OHtur1NshpirndBKyToWy2NaPKcV5RIGWQ2xUiVwFbKHRLT2OBfoY+
 DNQh8014wnr+g==
Date: Tue, 3 Jan 2023 18:52:05 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [RESEND][PATCH] drm/nouveau/fb/ga102: Replace zero-length array
 of trailing structs with flex-array
Message-ID: <Y7TNtQqunHIW8her@work>
References: <20230103234835.never.378-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103234835.never.378-kees@kernel.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 03, 2023 at 03:48:36PM -0800, Kees Cook wrote:
> Zero-length arrays are deprecated[1] and are being replaced with
> flexible array members in support of the ongoing efforts to tighten the
> FORTIFY_SOURCE routines on memcpy(), correctly instrument array indexing
> with UBSAN_BOUNDS, and to globally enable -fstrict-flex-arrays=3.
> 
> Replace zero-length array with flexible-array member.
> 
> This results in no differences in binary output.
> 
> [1] https://github.com/KSPP/linux/issues/78
> 
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Gourav Samaiya <gsamaiya@nvidia.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Here is my RB again:

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
> Sent before as: https://lore.kernel.org/all/20221118211207.never.039-kees@kernel.org/
> ---
>  drivers/gpu/drm/nouveau/include/nvfw/hs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> index 8c4cd08a7b5f..8b58b668fc0c 100644
> --- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> +++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> @@ -52,7 +52,7 @@ struct nvfw_hs_load_header_v2 {
>  	struct {
>  		u32 offset;
>  		u32 size;
> -	} app[0];
> +	} app[];
>  };
>  
>  const struct nvfw_hs_load_header_v2 *nvfw_hs_load_header_v2(struct nvkm_subdev *, const void *);
> -- 
> 2.34.1
> 
