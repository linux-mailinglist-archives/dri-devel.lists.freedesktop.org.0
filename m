Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A392E875D6E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 06:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458C010F7B4;
	Fri,  8 Mar 2024 05:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="f29GFOs3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577FD10F7B4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 05:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=xIY2hE+i3b9V6ZuohaD3aLGrUTWHPeMVhT8BwAXe6WE=; b=f29GFOs3B5p9vujZW3rD1Jgg+5
 KWixlE7Qx8YqalG+mmlwhetGbe87cRM2T7YIERSr6+UkmViPQibs0OdXgArxrb2uobZA0aOfz1InI
 8zSKb5MvbwCk78YegiVg4hUnrvBxUgGfOJkiOaNaiHHstTzkc+ee4UQSkOtxhP+p+v6PpEHDdNdWM
 Me0vvcUW1oz59BumEPAXKtUKhJlglV9OY0dmfojaMIytwVxV2oKapGKD+uecjFp2c69/ZEBm42rVq
 78U0pwhB2G31Fkze7F+6CfPPnfs+BoBn4+S68ldcwhpGR8IkkfZ9zIwDZwTU6L2v2zntOsDGuhAEs
 gRytmqNQ==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1riSV1-00000007ox5-1afW; Fri, 08 Mar 2024 05:10:27 +0000
Message-ID: <9199ed28-ba15-4d50-b8a6-7f6a32aeb3bb@infradead.org>
Date: Thu, 7 Mar 2024 21:10:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Removed vcpi field description to fix kernel doc warning
Content-Language: en-US
To: R SUNDAR <prosunofficial@gmail.com>, airlied@gmail.com, daniel@ffwll.ch,
 lyude@redhat.com, imre.deak@intel.com, jani.nikula@intel.com,
 mripard@kernel.org, ville.syrjala@linux.intel.com, Wayne.Lin@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240308025152.17297-1-prosunofficial@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240308025152.17297-1-prosunofficial@gmail.com>
Content-Type: text/plain; charset=UTF-8
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



On 3/7/24 18:51, R SUNDAR wrote:
> For linux-next repo
> 
> /include/drm/display/drm_dp_mst_helper.h:156: warning: Excess struct member 'vcpi' description in 'drm_dp_mst_port'
> 
> Signed-off-by: R SUNDAR <prosunofficial@gmail.com>

or
https://lore.kernel.org/lkml/20240106032321.28596-1-rdunlap@infradead.org/

but I would be happy to see either of them merged.

Thanks.

> ---
>  include/drm/display/drm_dp_mst_helper.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index 9b19d8bd520a..3ae88a383a41 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -83,7 +83,6 @@ struct drm_dp_mst_branch;
>   * @passthrough_aux: parent aux to which DSC pass-through requests should be
>   * sent, only set if DSC pass-through is possible.
>   * @parent: branch device parent of this port
> - * @vcpi: Virtual Channel Payload info for this port.
>   * @connector: DRM connector this port is connected to. Protected by
>   * &drm_dp_mst_topology_mgr.base.lock.
>   * @mgr: topology manager this port lives under.

-- 
#Randy
