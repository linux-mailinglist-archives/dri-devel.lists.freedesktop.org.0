Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303576C58F0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D43010E287;
	Wed, 22 Mar 2023 21:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 22 Mar 2023 21:45:35 UTC
Received: from omta037.useast.a.cloudfilter.net
 (omta037.useast.a.cloudfilter.net [44.202.169.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB9410E1D1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 21:45:35 +0000 (UTC)
Received: from eig-obgw-5014a.ext.cloudfilter.net ([10.0.29.198])
 by cmsmtp with ESMTP
 id f3pNpLjy5ElIgf6A7pOoiz; Wed, 22 Mar 2023 21:38:27 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTP
 id f6A5p0dqgnD9Uf6A6p8r2N; Wed, 22 Mar 2023 21:38:26 +0000
X-Authority-Analysis: v=2.4 cv=bIQFndyZ c=1 sm=1 tr=0 ts=641b7552
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=wTog8WU66it3cfrESHnF4A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10 a=k__wU0fu6RkA:10
 a=wYkD_t78qR0A:10 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=_Wotqz80AAAA:8
 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=xjW8xetcGCzmklEVfL4A:9
 a=QEXdDO2ut3YA:10 a=buJP51TR1BpY-zbLSsyS:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6YRBXpJCx0t2uglDec9nLn9xfcDH1HUd+SydP3jFYpU=; b=n4G6g07VLBGg+N/4Qdi4AV9mWW
 Xzxyv+MEDtW164EEqzhlKg4ZYb3ws5/e42yYrZzt2I3Bwvs8+2fC4PFbudOW8jzBdCP2FeZgNq4VK
 Es+gmd+Njy/naqyWxO/PKLzj9vi4mzBkEtwWtTnUnFY5YJrBLT+3puof+uUfpNEsTefe0hwXEoUL6
 8Q8st2wKkj1VZGWrs33piOoqVVOlV20sOEy+LP9CshieHuUxv5/Z+GnPeAFeEI0teCLK3OvMZMjeA
 /2LLTGkotKuM1LrnKSGROP0hkORn/qUPGTca8HYOsFPTNdvDtrmFYPd6N1LV1UMMw2PXGCVSMfzbB
 kXoVfH/A==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:38228
 helo=[192.168.15.7])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <gustavo@embeddedor.com>) id 1pf6A4-003ain-UW;
 Wed, 22 Mar 2023 16:38:25 -0500
Message-ID: <0a48d61b-6e11-9144-b11e-dd46de836c53@embeddedor.com>
Date: Wed, 22 Mar 2023 15:38:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/nouveau/disp: More DP_RECEIVER_CAP_SIZE array fixes
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Ben Skeggs <bskeggs@redhat.com>
References: <20230204184307.never.825-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230204184307.never.825-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1pf6A4-003ain-UW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.7])
 [187.162.31.110]:38228
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEGm6aBbe9+r4tL0vXSfPkQQx3f4HNaL2JChYdff/sMlppGvH5NDisWpY6W8trLOsMdaHYGPzYBuIGU8hd+HZuDahnKqzRqYarRbCSiqb24+lsZ3sE6t
 eEcy+gMW7/e5PFk/642/SU2aPBoqwof4IS4lL0d61AgvAbbrmElBWrbbOvcELw7NEkoLGJaj9JgA7NPVaXtK8ZuH1rx+JbO3lRDEh1lh9daCvQdmdbKO/5No
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
 linux-hardening@vger.kernel.org, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/4/23 12:43, Kees Cook wrote:
> More arrays (and arguments) for dcpd were set to 16, when it looks like
> DP_RECEIVER_CAP_SIZE (15) should be used. Fix the remaining cases, seen
> with GCC 13:
> 
> ../drivers/gpu/drm/nouveau/nvif/outp.c: In function 'nvif_outp_acquire_dp':
> ../include/linux/fortify-string.h:57:33: warning: array subscript 'unsigned char[16][0]' is partly outside array bounds of 'u8[15]' {aka 'unsigned char[15]'} [-Warray-bounds=]
>     57 | #define __underlying_memcpy     __builtin_memcpy
>        |                                 ^
> ...
> ../drivers/gpu/drm/nouveau/nvif/outp.c:140:9: note: in expansion of macro 'memcpy'
>    140 |         memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
>        |         ^~~~~~
> ../drivers/gpu/drm/nouveau/nvif/outp.c:130:49: note: object 'dpcd' of size [0, 15]
>    130 | nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
>        |                                              ~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into acquire")
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>   drivers/gpu/drm/nouveau/include/nvif/if0012.h    | 4 +++-
>   drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h  | 3 ++-
>   drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 2 +-
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> index eb99d84eb844..16d4ad5023a3 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> @@ -2,6 +2,8 @@
>   #ifndef __NVIF_IF0012_H__
>   #define __NVIF_IF0012_H__
>   
> +#include <drm/display/drm_dp.h>
> +
>   union nvif_outp_args {
>   	struct nvif_outp_v0 {
>   		__u8 version;
> @@ -63,7 +65,7 @@ union nvif_outp_acquire_args {
>   				__u8 hda;
>   				__u8 mst;
>   				__u8 pad04[4];
> -				__u8 dpcd[16];
> +				__u8 dpcd[DP_RECEIVER_CAP_SIZE];
>   			} dp;
>   		};
>   	} v0;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> index b7631c1ab242..4e7f873f66e2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> @@ -3,6 +3,7 @@
>   #define __NVKM_DISP_OUTP_H__
>   #include "priv.h"
>   
> +#include <drm/display/drm_dp.h>
>   #include <subdev/bios.h>
>   #include <subdev/bios/dcb.h>
>   #include <subdev/bios/dp.h>
> @@ -42,7 +43,7 @@ struct nvkm_outp {
>   			bool aux_pwr_pu;
>   			u8 lttpr[6];
>   			u8 lttprs;
> -			u8 dpcd[16];
> +			u8 dpcd[DP_RECEIVER_CAP_SIZE];
>   
>   			struct {
>   				int dpcd; /* -1, or index into SUPPORTED_LINK_RATES table */
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> index 4f0ca709c85a..fc283a4a1522 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> @@ -146,7 +146,7 @@ nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
>   }
>   
>   static int
> -nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[16],
> +nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
>   			   u8 link_nr, u8 link_bw, bool hda, bool mst)
>   {
>   	int ret;
