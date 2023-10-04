Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370187B765B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 03:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2207310E041;
	Wed,  4 Oct 2023 01:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic317-27.consmr.mail.bf2.yahoo.com
 (sonic317-27.consmr.mail.bf2.yahoo.com [74.6.129.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1923210E041
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 01:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1696383916; bh=2iI4Z/neKYjYgXwxkF9UwHNr84HP1inzT51MaI47wGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=IKG0zPcggv1WsNqDoW37EYN+zvZDu2JPctFmaGgPJguUUA4OMRrZueai9Z7iIb9ZUutBc2yhR5wlwlx3TRUU10L5vQ9ybFXQ7oOT2EGgx7XNdOyP+yO0VbFwEhw065yXLl2rwVYOhl8w71FjLIJ0XV6rLHAdwO5bgkNwdkK2GdSDXoKXEX7bJ2k9Obzzu4dBbGaZ31WRR7kgRwjdd4xUKlPjVY5PWhlnBFDeZX0gWmjaVMR3TGUqbROALzwkEDEQJRdJcYz332n5+BKsvqWGKYeHMwoPQiTulVEf1T9Pb/IGycBCSdC5HmBl8foNK73PjowHEEbswCbLSdqUGiAq5A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1696383916; bh=3tK2pwpIhzaZbu6lnmwV0hnlY1bcjZgAV9lKf4u0U63=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=ad/kfd95QzLxNJ0MowV3jLEBCAo9PJCQvDwS+TfCpDCrjK3jBjnaomitQWuhtozCCQU5OcS/1Eo/r88oNI8PWHxnF25npejXUKaJPksGAjRTeE8pyoMPwZdz+aan3jvvl91GthkDH7F9OoB16JCollWOTrE3mh4kE/OuDAPQyx2X45CPF3m7enUJQmgOvVvgt1PyJn0uOlfHB4K0lmcQ+9vVNG8XUvsNNCeTSVSk+pUGVfvSe2CDl5pxXFtg8dvMDhf+tYMhIssdMZ140T6ANQgYg4aiwZN2vLPFHtgbA37gOIEM3DdTO6ulcVyb0uzsw2cJfqGWtl0EUw2zjSXKzA==
X-YMail-OSG: zeVZlDIVM1ldudxU0GEgRGnXqhTxWoPTuXlDxJacw.7Dd_uJJPxT.HKYYf2bLrF
 qf2H7Ih6rqdnH9ewKHag.QioAkl2T1Tsetelp2hkqoF4N6Yz7BACMC2mbDfnwP.czotXlCyr9dh5
 XkIHRkmLlzpUwFq2hdcwcl1ouGxcFkSGz3wrXR45GvLXEaghhm.LwgDFuca4.QaxRSCi1OHbioqM
 v34th.s.XndkRqX9SDps7eXgkDF6WsyeDcstwIRhsdG.l8Hf0eWdWWDp0yo75KvMqq4YhaD6gRNn
 50mBHwwP_r8GrsOxCioQj11ebVIMN9HrEAHrSXbALXDpTsseeM4B3aODWFQve.PIY0FF5vQT1P0Z
 iVpGxGiR9kGd4YLSeZu22sqaBjlnh2Z5Dv7JHj.3cesAPwiqLIF7t6eXXzltWgw0R1Akmvsrq7lP
 VC1VZtNP.CNixHaAVKv7YxOeol6Fq40AKudVHsKRqPGslSwf0eIfyiPcpigY_1KBiGlZFlEbYoLE
 INAAt5dD3pO9EnhGMsn556CbHpRKd_yKK_Z.wTFZh_U8dX4XHVCtynLLKf4j5PXzpVDFdYzZenWN
 miaDxuuHIt6QXoiIsR6gRzZCdzcji_jetRtYs7e_mtMYsyDthbaaLr9kjL2BId2RRh6bKjlSlKtm
 YoH7gibVndRGW09Mtk.YLcgoYGH1W8nscc2Qkf5EypK8U0oKfw2h7O5oyVtrgXlFgOazeScMR0Mp
 o50Sz_Xh_TkWNIt5.p.Gxn681aFvYBu5vLISFT9FtKsYHupEUVOZA1Sx0RVqYWsaN3RUsowei3kL
 OAK1VVbO4zIVeScRGL2EJUTwFKC8xoVUTyi_h0lvTPaNWBx4dfOxnAojv3H7O3lZe_z5I7q3jnJc
 0UAq_YsymWojIe_Wdbe1N1m14S92eP7LPWEXg3nDlFJgg..1iOYGKmqsyulgQxuH8W9VcoxA6aTy
 L.TNswx9vxHn5xiVeP8Yo7R4gPf4QFliIrUjLyaBFNC6eyprTZ73EZj7iRp1pSfhjFoaL_ZsfIQa
 SwBDIygWg74mSTfoQ1bK72LaedmWAYF5oDil6oE20H95weWMvD9HWPsM7Af.jyeYsTT347NQuTV3
 Bhu1YCvZqrAq4hXrAsnBdexNKcM75vGeau_jsUb95GtslNf9YvZQsnzvtSr1R0u_lotMEYrRKQoO
 ZV.nerupq_.FRprOjuYK18HDnGE8rsSBjIceheejpq_khr6p07KPTuy3xvU.173F3d95McmTCHEL
 YxoSXnzvPMaU_bjUZ9dMu4sCXHymesPVR.c6HGYaV9KQNByNvy3d4XHD1V3ilpfCThfmAA.RaTdW
 26Oa3yWu8aJHzM.wflL.VLGe7HLrAPOtID_5vuDRCGZtWhY66vAtVHOyNM3FWqj9hga8dFjpuQnV
 IBUmqNSMXq6xW7tpa0RWd26TjRhWzBw6zOnqIc59TpiINKRgAz0UHT1ZjqH_4i9NhFglqsDcQJ8W
 xM_Rzb6TpHp5TAk4hd4841lepgt.XMcoBSFI3XdV6POdwvGxWJwGDZ9ZyEx6BIyMnB4i0jAs39zp
 RhYe6dnkqktxiRuNUYuVqTyQZCEYUehQ0GlARNY0yiP7z4hsw_4b9CazrWZMaePdM3_7Zg.ffRed
 Y_IA.sD5eFEy1RRbcDwDh1tyLlcntDTUuhNw7NGF_gUGjlWDAgUQeRSxk34fBHxI.JyPWg4WnYze
 BbCFnUza3tBgQM6dGh7cvUsjzGOUDEU9CKVymCEtA_I99ylRfvhHpyORqQRFF2qwPxAOknZvwSVQ
 mM_YTQN4pf3ebicezFTvW2x19ulXMnbcuj1gVBONXiLxSZco_eTq7BSRBofuxQSXlOuq7ncGr3jU
 REngnPX1OuYIMY9LjIw4thX3sDhUd.JnvrottwaETRlVUFSPL7a6ak8iReXbXvBK7l64JbxpEeHt
 At2vMl3EkX9n.OjTTIiGBFVDQdH1aISalwa0_QhPHz6z87ahVPOi_v0Y0K9kI0FjsqI17QXOtImk
 TLBSALlt9k4Xqvz86.WxT5DMi8.NXW6sXX5ZbMyuD9BNOURi1KcP2OSizENkYJXBfF26pN6u81tz
 mRJtP72KDgdnvrckbV6vs.8KwdmHx5spwb4lfz8AXhiHDJOK15ktKly2045TSv1W6N_A2z7TbKUy
 xFxgvjWhoLqQzRrrKmmC4qhZ59XwCluODw6MjE3TQpbxS_8sgWV9.2SfS1IRsDWEMZXyniGmVqx9
 rqBLn41_OKNWxT2aycnvKQ.HoPZFpn6uKGoEHoboH_9zByDQ.gEJuMOHtf_UXy1U-
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: 2b6f5a19-072b-40bc-a306-478f7fb92f64
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.bf2.yahoo.com with HTTP; Wed, 4 Oct 2023 01:45:16 +0000
Received: by hermes--production-bf1-74bfc65597-hc4hf (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 8bf48355b4371a3a1a1bfb92a9af1e13; 
 Wed, 04 Oct 2023 01:45:14 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v4 1/4] drm/format-helper: Export line conversion helper
 for drm_panic
Date: Tue, 03 Oct 2023 21:45:13 -0400
Message-ID: <5210522.31r3eYUQgx@nerdopolis2>
In-Reply-To: <20231003142508.190246-2-jfalempe@redhat.com>
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailer: WebService/1.1.21797
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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
Cc: gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 3, 2023 10:22:44 AM EDT Jocelyn Falempe wrote:
> drm_panic will need the low-level drm_fb_xxxx_line functions.
> Also add drm_fb_r1_to_xrgb8888 to render the fonts.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 88 ++++++++++++++++++++++++++---
>  include/drm/drm_format_helper.h     |  9 +++
>  2 files changed, 89 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index f93a4efcee90..c238e5d84f1f 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -270,7 +270,30 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
>  
>  	drm_fb_xfrm(dst, dst_pitch, &cpp, src, fb, clip, cached, swab_line);
>  }
> -EXPORT_SYMBOL(drm_fb_swab);
I had to add this line back to get it to build, but once I did, it worked. 
> +
> +/**
> + * drm_fb_r1_to_32bit_line - Convert one line from monochrome to any 32bit pixel format
> + * @dbuf: Pointer to the destination line (in any 32bit format)
> + * @sbuf: Pointer to the source line (in monochrome)
> + * @pixels: Number of pixels to convert.
> + * @fg_color: Foreground color, applied when R1 is 1
> + * @bg_color: Background color, applied when R1 is 0
> + *
> + * Convert monochrome to any format with 32bit pixel.
> + * There is a limitation, as sbuf is a pointer, it can only points to a multiple
> + * of 8 pixels in the source buffer.
> + */
> +void drm_fb_r1_to_32bit_line(void *dbuf, const void *sbuf, unsigned int pixels,
> +				u32 fg_color, u32 bg_color)
> +{
> +	unsigned int x;
> +	const u8 *sbuf8 = sbuf;
> +	u32 *dubf32 = dbuf;
> +
> +	for (x = 0; x < pixels; x++)
> +		dubf32[x] = (sbuf8[x / 8] & (0x80 >> (x % 8))) ? fg_color : bg_color;
> +}
> +EXPORT_SYMBOL(drm_fb_r1_to_32bit_line);
>  
>  static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
> @@ -320,7 +343,13 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
>  
> -static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +/**
> + * drm_fb_xrgb8888_to_rgb565_line - Convert one line from XRGB8888 to RGB565
> + * @dbuf: Pointer to the destination line (in RGB565)
> + * @sbuf: Pointer to the source line (in XRGB8888)
> + * @pixels: Number of pixels to convert.
> + */
> +void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
>  	__le16 *dbuf16 = dbuf;
>  	const __le32 *sbuf32 = sbuf;
> @@ -336,6 +365,7 @@ static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigne
>  		dbuf16[x] = cpu_to_le16(val16);
>  	}
>  }
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_line);
>  
>  /* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
>  static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
> @@ -396,7 +426,13 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
>  
> -static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +/**
> + * drm_fb_xrgb8888_to_rgb565_line - Convert one line from XRGB8888 to XRGB1555
> + * @dbuf: Pointer to the destination line (in XRGB1555)
> + * @sbuf: Pointer to the source line (in XRGB8888)
> + * @pixels: Number of pixels to convert.
> + */
> +void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
>  	__le16 *dbuf16 = dbuf;
>  	const __le32 *sbuf32 = sbuf;
> @@ -412,6 +448,7 @@ static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsig
>  		dbuf16[x] = cpu_to_le16(val16);
>  	}
>  }
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555_line);
>  
>  /**
>   * drm_fb_xrgb8888_to_xrgb1555 - Convert XRGB8888 to XRGB1555 clip buffer
> @@ -447,7 +484,13 @@ void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
>  
> -static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +/**
> + * drm_fb_xrgb8888_to_rgb565_line - Convert one line from XRGB8888 to ARGB1555
> + * @dbuf: Pointer to the destination line (in ARGB1555)
> + * @sbuf: Pointer to the source line (in XRGB8888)
> + * @pixels: Number of pixels to convert.
> + */
> +void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
>  	__le16 *dbuf16 = dbuf;
>  	const __le32 *sbuf32 = sbuf;
> @@ -464,6 +507,7 @@ static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsig
>  		dbuf16[x] = cpu_to_le16(val16);
>  	}
>  }
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555_line);
>  
>  /**
>   * drm_fb_xrgb8888_to_argb1555 - Convert XRGB8888 to ARGB1555 clip buffer
> @@ -499,7 +543,13 @@ void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555);
>  
> -static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +/**
> + * drm_fb_xrgb8888_to_rgba5551_line - Convert one line from XRGB8888 to ARGB5551
> + * @dbuf: Pointer to the destination line (in ARGB5551)
> + * @sbuf: Pointer to the source line (in XRGB8888)
> + * @pixels: Number of pixels to convert.
> + */
> +void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
>  	__le16 *dbuf16 = dbuf;
>  	const __le32 *sbuf32 = sbuf;
> @@ -516,6 +566,7 @@ static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsig
>  		dbuf16[x] = cpu_to_le16(val16);
>  	}
>  }
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551_line);
>  
>  /**
>   * drm_fb_xrgb8888_to_rgba5551 - Convert XRGB8888 to RGBA5551 clip buffer
> @@ -551,7 +602,13 @@ void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551);
>  
> -static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +/**
> + * drm_fb_xrgb8888_to_rgb888_line - Convert one line from XRGB8888 to RGB888
> + * @dbuf: Pointer to the destination line (in RGB888)
> + * @sbuf: Pointer to the source line (in XRGB8888)
> + * @pixels: Number of pixels to convert.
> + */
> +void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
>  	u8 *dbuf8 = dbuf;
>  	const __le32 *sbuf32 = sbuf;
> @@ -566,6 +623,7 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
>  		*dbuf8++ = (pix & 0x00FF0000) >> 16;
>  	}
>  }
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_line);
>  
>  /**
>   * drm_fb_xrgb8888_to_rgb888 - Convert XRGB8888 to RGB888 clip buffer
> @@ -709,7 +767,13 @@ static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned in
>  		    drm_fb_xrgb8888_to_xbgr8888_line);
>  }
>  
> -static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +/**
> + * drm_fb_xrgb8888_to_rgb888_line - Convert one line from XRGB8888 to XRGB2101010
> + * @dbuf: Pointer to the destination line (in XRGB2101010)
> + * @sbuf: Pointer to the source line (in XRGB8888)
> + * @pixels: Number of pixels to convert.
> + */
> +void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
>  	__le32 *dbuf32 = dbuf;
>  	const __le32 *sbuf32 = sbuf;
> @@ -726,6 +790,7 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
>  		*dbuf32++ = cpu_to_le32(pix);
>  	}
>  }
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010_line);
>  
>  /**
>   * drm_fb_xrgb8888_to_xrgb2101010 - Convert XRGB8888 to XRGB2101010 clip buffer
> @@ -761,7 +826,13 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *d
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010);
>  
> -static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
> +/**
> + * drm_fb_xrgb8888_to_rgb888_line - Convert one line from XRGB8888 to ARGB2101010
> + * @dbuf: Pointer to the destination line (in ARGB2101010)
> + * @sbuf: Pointer to the source line (in XRGB8888)
> + * @pixels: Number of pixels to convert.
> + */
> +void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
>  {
>  	__le32 *dbuf32 = dbuf;
>  	const __le32 *sbuf32 = sbuf;
> @@ -779,6 +850,7 @@ static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
>  		*dbuf32++ = cpu_to_le32(pix);
>  	}
>  }
> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb2101010_line);
>  
>  /**
>   * drm_fb_xrgb8888_to_argb2101010 - Convert XRGB8888 to ARGB2101010 clip buffer
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 291deb09475b..31ab699128d5 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -24,30 +24,39 @@ void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
>  void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
>  		 const struct iosys_map *src, const struct drm_framebuffer *fb,
>  		 const struct drm_rect *clip, bool cached);
> +void drm_fb_r1_to_32bit_line(void *dbuf, const void *sbuf, unsigned int pixels,
> +			     u32 fg_color, u32 bg_color);
>  void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
>  			       const struct iosys_map *src, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels);
>  void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
>  			       const struct iosys_map *src, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip, bool swab);
> +void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels);
>  void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
>  				 const struct iosys_map *src, const struct drm_framebuffer *fb,
>  				 const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels);
>  void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
>  				 const struct iosys_map *src, const struct drm_framebuffer *fb,
>  				 const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels);
>  void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_pitch,
>  				 const struct iosys_map *src, const struct drm_framebuffer *fb,
>  				 const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels);
>  void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
>  			       const struct iosys_map *src, const struct drm_framebuffer *fb,
>  			       const struct drm_rect *clip);
>  void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
>  				 const struct iosys_map *src, const struct drm_framebuffer *fb,
>  				 const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels);
>  void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
>  				    const struct iosys_map *src, const struct drm_framebuffer *fb,
>  				    const struct drm_rect *clip);
> +void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels);
>  void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
>  				    const struct iosys_map *src, const struct drm_framebuffer *fb,
>  				    const struct drm_rect *clip);
> 




