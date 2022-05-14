Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0385270B5
	for <lists+dri-devel@lfdr.de>; Sat, 14 May 2022 12:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CDC10E029;
	Sat, 14 May 2022 10:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D48810E029
 for <dri-devel@lists.freedesktop.org>; Sat, 14 May 2022 10:38:48 +0000 (UTC)
Received: from p508fd4ce.dip0.t-ipconnect.de ([80.143.212.206]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nppAa-0006cU-CP; Sat, 14 May 2022 12:38:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH][next] drm/rockchip: Fix spelling mistake "aligened" ->
 "aligned"
Date: Sat, 14 May 2022 12:38:42 +0200
Message-ID: <5595180.aeNJFYEL58@phil>
In-Reply-To: <20220513135341.290289-1-colin.i.king@gmail.com>
References: <20220513135341.290289-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Freitag, 13. Mai 2022, 15:53:41 CEST schrieb Colin Ian King:
> There is a spelling mistake in a drm_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

didn't you sent the same patch some days ago already?
Which is applied to drm-misc-next in [0].

Just want to make sure I didn't miss anything.

Thanks
Heiko

[0] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f0eaf60c67738da8aae786bda74a2fffeca6d7cc

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 0b49fed16535..04e8e22a8640 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1202,7 +1202,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>  		 */
>  		stride = (fb->pitches[0] << 3) / bpp;
>  		if ((stride & 0x3f) && (xmirror || rotate_90 || rotate_270))
> -			drm_err(vop2->drm, "vp%d %s stride[%d] not 64 pixel aligened\n",
> +			drm_err(vop2->drm, "vp%d %s stride[%d] not 64 pixel aligned\n",
>  				vp->id, win->data->name, stride);
>  
>  		rb_swap = vop2_afbc_rb_swap(fb->format->format);
> 




