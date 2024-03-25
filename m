Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B879488A371
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6C710E8E9;
	Mon, 25 Mar 2024 14:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="b+XdCGhe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BB210E8E9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ErJ9p3XuXJkdy32SPhwB3klrHkxrQwWEhxv1Gz6t8nY=; b=b+XdCGheVnI2PqILXBITQoPmd9
 iRb+DNOZG5ldTWc+4jVniR3gAyzF1iVTN5bv6NE3Uu4X7KOAy7q2XtGVA52CXDrqeMOGzY2X4zTHe
 O6/eYUZqb4mAruhosolyXBF1AnYVhScxskQpFc8HUGPz1h7JD3gsxWeSS/Qi42Zo8lnxattalXy/S
 xerFnr38YlZ7N0zfQdkJaEOtuYGoPhs+nxbb96kOvhtTecSpWsPTVPMnLdorl9TSA804A5qa2gUt7
 h4l+TUTgANIZADO7AcWaIQAZV7Qi7grL2ieLi16U08DKSe8oHGFYr+rpQ/YDJ49Q6/711rkYBtJG8
 yDHLE5NQ==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1roks8-00F5Oa-8m; Mon, 25 Mar 2024 15:00:20 +0100
Message-ID: <97574081-113d-46a6-8608-c1886bb7b566@igalia.com>
Date: Mon, 25 Mar 2024 11:00:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/16] drm/vkms: Use const for input pointers in
 pixel_read an pixel_write functions
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-6-e610cbd03f52@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240313-yuv-v5-6-e610cbd03f52@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/13/24 14:45, Louis Chauvet wrote:
> As the pixel_read and pixel_write function should never modify the input
> buffer, mark those pointers const.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_drv.h     |  4 ++--
>   drivers/gpu/drm/vkms/vkms_formats.c | 24 ++++++++++++------------
>   2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 4bfc62d26f08..3ead8b39af4a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -61,7 +61,7 @@ struct line_buffer {
>    * @out_pixel: destination address to write the pixel
>    * @in_pixel: pixel to write
>    */
> -typedef void (*pixel_write_t)(u8 *out_pixel, struct pixel_argb_u16 *in_pixel);
> +typedef void (*pixel_write_t)(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
>   
>   struct vkms_writeback_job {
>   	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> @@ -76,7 +76,7 @@ struct vkms_writeback_job {
>    * @in_pixel: Pointer to the pixel to read
>    * @out_pixel: Pointer to write the converted pixel
>    */
> -typedef void (*pixel_read_t)(u8 *in_pixel, struct pixel_argb_u16 *out_pixel);
> +typedef void (*pixel_read_t)(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel);
>   
>   /**
>    * vkms_plane_state - Driver specific plane state
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index b57d85b8b935..b2f8dfc26c35 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -76,7 +76,7 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
>    * They are used in the `vkms_compose_row` function to handle multiple formats.
>    */
>   
> -static void ARGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> +static void ARGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
>   {
>   	/*
>   	 * The 257 is the "conversion ratio". This number is obtained by the
> @@ -90,7 +90,7 @@ static void ARGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
>   	out_pixel->b = (u16)in_pixel[0] * 257;
>   }
>   
> -static void XRGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> +static void XRGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
>   {
>   	out_pixel->a = (u16)0xffff;
>   	out_pixel->r = (u16)in_pixel[2] * 257;
> @@ -98,7 +98,7 @@ static void XRGB8888_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
>   	out_pixel->b = (u16)in_pixel[0] * 257;
>   }
>   
> -static void ARGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> +static void ARGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
>   {
>   	u16 *pixel = (u16 *)in_pixel;
>   
> @@ -108,7 +108,7 @@ static void ARGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pi
>   	out_pixel->b = le16_to_cpu(pixel[0]);
>   }
>   
> -static void XRGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> +static void XRGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
>   {
>   	u16 *pixel = (u16 *)in_pixel;
>   
> @@ -118,7 +118,7 @@ static void XRGB16161616_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pi
>   	out_pixel->b = le16_to_cpu(pixel[0]);
>   }
>   
> -static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> +static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
>   {
>   	u16 *pixel = (u16 *)in_pixel;
>   
> @@ -143,7 +143,7 @@ static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
>    * It is used to avoid null pointer to be used as a function. In theory, this function should
>    * never be called, except if you found a bug in the driver/DRM core.
>    */
> -static void black_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> +static void black_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
>   {
>   	out_pixel->a = (u16)0xFFFF;
>   	out_pixel->r = 0;
> @@ -189,7 +189,7 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>    * They are used in the `vkms_writeback_row` to convert and store a pixel from the src_buffer to
>    * the writeback buffer.
>    */
> -static void argb_u16_to_ARGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_ARGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
>   {
>   	/*
>   	 * This sequence below is important because the format's byte order is
> @@ -207,7 +207,7 @@ static void argb_u16_to_ARGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
>   	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
>   }
>   
> -static void argb_u16_to_XRGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_XRGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
>   {
>   	out_pixel[3] = 0xff;
>   	out_pixel[2] = DIV_ROUND_CLOSEST(in_pixel->r, 257);
> @@ -215,7 +215,7 @@ static void argb_u16_to_XRGB8888(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
>   	out_pixel[0] = DIV_ROUND_CLOSEST(in_pixel->b, 257);
>   }
>   
> -static void argb_u16_to_ARGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_ARGB16161616(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
>   {
>   	u16 *pixel = (u16 *)out_pixel;
>   
> @@ -225,7 +225,7 @@ static void argb_u16_to_ARGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pi
>   	pixel[0] = cpu_to_le16(in_pixel->b);
>   }
>   
> -static void argb_u16_to_XRGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_XRGB16161616(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
>   {
>   	u16 *pixel = (u16 *)out_pixel;
>   
> @@ -235,7 +235,7 @@ static void argb_u16_to_XRGB16161616(u8 *out_pixel, struct pixel_argb_u16 *in_pi
>   	pixel[0] = cpu_to_le16(in_pixel->b);
>   }
>   
> -static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
>   {
>   	u16 *pixel = (u16 *)out_pixel;
>   
> @@ -260,7 +260,7 @@ static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
>    * It is used to avoid null pointer to be used as a function. In theory, this should never
>    * happen, except if there is a bug in the driver
>    */
> -static void argb_u16_to_nothing(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> +static void argb_u16_to_nothing(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
>   {}
>   
>   /**
> 
