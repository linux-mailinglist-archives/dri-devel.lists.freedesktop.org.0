Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 635F9584589
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 20:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BB510EA50;
	Thu, 28 Jul 2022 18:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF7D10E049
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 18:23:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v17so3326516wrr.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 11:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nomwofo+kRoyJ4vFdWQBOYiZDYbTEIeIS5SivQuxG/k=;
 b=Cb9ikQP9A4lcl5XP2S3poXi9DUYkSNVx+2Yae8T0D9PTXVKH+8rllrsiIl6Om3ryaB
 V5knkA215/SOU0ArNC51Q998pE6fem6ijqv+7BC/94l49yMddSQVrADDa8J0xg1JqKCe
 3J03F1nVRIbp2g7O+b4c/OAjgviyH7G9T8Qc1c7wVWUjfXxlG7YMSbqC2ZqPO2qa2NsR
 nXx9PVMb73BpcmcC1MGKsYADZvDAMoMTONaLlUvKlXPaK+iCENT1AcNMnxm3pVeVI1Uu
 bUDSaFSCcTWJHIG67XIbeBlaAJPSbQiiv+DVuMH4/RsX/u8BzyDg7VXHafsenFs0ERyY
 4siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nomwofo+kRoyJ4vFdWQBOYiZDYbTEIeIS5SivQuxG/k=;
 b=wGywXvclci/+4knu4dxst8eyYzdrdOz3N5rmyasc4GmlDLeDwStg1TGw9lB5V7PbgO
 ATBrDvvc9yl+vo6rd2Ud8bZsVXWwpSPK/S4oa3Y+qhFZngzaIStuCS3sDUYXVU2oO+AQ
 NGlpPYve5Uh1zECCky+5AYC0WQSshcroR0WXt5Z7g1cxxVLL+Gx0AO111LiPdQQEyYji
 DxBkpXfC25SVPO74k8G/BEqU+dooCir2z4mXdJ+9ewBIhhXBwiW9wIzchuxWx+PHqZLL
 zJ347VpzWJGNszR9lzE0NCxEWytxGgEDzlFNTEu2lCSzwVxm9zGTVd2xwsDuCvRYC5nU
 L52A==
X-Gm-Message-State: ACgBeo2vW/WY1TZF69ifJHStOt+AyAOemqgR5gmyH+sXdNWF3raTBInG
 SROkrY39KCbeqx9vULLUoe4=
X-Google-Smtp-Source: AA6agR6KtXKU2rRn9X+TlW4/JkTplzijy7Y09UWthVOt0A4n66UVN5UHkOUwHE0eWxuVHTqDD1YDgg==
X-Received: by 2002:a05:6000:2a4:b0:21e:6e0e:df1f with SMTP id
 l4-20020a05600002a400b0021e6e0edf1fmr137305wry.516.1659032600326; 
 Thu, 28 Jul 2022 11:23:20 -0700 (PDT)
Received: from elementary ([94.73.33.57]) by smtp.gmail.com with ESMTPSA id
 d20-20020a05600c4c1400b003a050a391e8sm1840150wmp.38.2022.07.28.11.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 11:23:19 -0700 (PDT)
Date: Thu, 28 Jul 2022 20:23:17 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/12] drm/format-helper: Move destination-buffer
 handling into internal helper
Message-ID: <20220728182317.GA99136@elementary>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-13-tzimmermann@suse.de>
 <20220728072630.GB56421@elementary>
 <f3cb2246-76e5-8e10-f7f6-3294de6709b3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3cb2246-76e5-8e10-f7f6-3294de6709b3@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 09:45:27AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 28.07.22 um 09:26 schrieb José Expósito:
> > Hi!
> > 
> > On Wed, Jul 27, 2022 at 01:33:12PM +0200, Thomas Zimmermann wrote:
> > > The format-convertion helpers handle several cases for different
> > > values of destination buffer and pitch. Move that code into the
> > > internal helper drm_fb_xfrm() and avoid quite a bit of duplucation.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/gpu/drm/drm_format_helper.c | 169 +++++++++++-----------------
> > >   1 file changed, 64 insertions(+), 105 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> > > index d296d181659d..35aebdb90165 100644
> > > --- a/drivers/gpu/drm/drm_format_helper.c
> > > +++ b/drivers/gpu/drm/drm_format_helper.c
> > > @@ -41,11 +41,11 @@ unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_clip_offset);
> > > -/* TODO: Make this functon work with multi-plane formats. */
> > > -static int drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> > > -		       const void *vaddr, const struct drm_framebuffer *fb,
> > > -		       const struct drm_rect *clip, bool vaddr_cached_hint,
> > > -		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
> > > +/* TODO: Make this function work with multi-plane formats. */
> > > +static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> > > +			 const void *vaddr, const struct drm_framebuffer *fb,
> > > +			 const struct drm_rect *clip, bool vaddr_cached_hint,
> > > +			 void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
> > >   {
> > >   	unsigned long linepixels = drm_rect_width(clip);
> > >   	unsigned long lines = drm_rect_height(clip);
> > > @@ -84,11 +84,11 @@ static int drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pix
> > >   	return 0;
> > >   }
> > > -/* TODO: Make this functon work with multi-plane formats. */
> > > -static int drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> > > -			    const void *vaddr, const struct drm_framebuffer *fb,
> > > -			    const struct drm_rect *clip, bool vaddr_cached_hint,
> > > -			    void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
> > > +/* TODO: Make this function work with multi-plane formats. */
> > > +static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
> > > +			      const void *vaddr, const struct drm_framebuffer *fb,
> > > +			      const struct drm_rect *clip, bool vaddr_cached_hint,
> > > +			      void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
> > >   {
> > >   	unsigned long linepixels = drm_rect_width(clip);
> > >   	unsigned long lines = drm_rect_height(clip);
> > > @@ -129,6 +129,29 @@ static int drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned
> > >   	return 0;
> > >   }
> > > +/* TODO: Make this function work with multi-plane formats. */
> > > +static int drm_fb_xfrm(struct iosys_map *dst,
> > > +		       const unsigned int *dst_pitch, const u8 *dst_pixsize,
> > > +		       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> > > +		       const struct drm_rect *clip, bool vaddr_cached_hint,
> > > +		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
> > > +{
> > > +	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> > > +		0, 0, 0, 0
> > > +	};
> > > +
> > > +	if (!dst_pitch)
> > > +		dst_pitch = default_dst_pitch;
> > > +
> > > +	if (dst[0].is_iomem)
> > > +		return __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
> > > +					  vmap[0].vaddr, fb, clip, false, xfrm_line);
> > > +	else
> > > +		return __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
> > > +				     vmap[0].vaddr, fb, clip, false, xfrm_line);
> > > +}
> > > +
> > > +
> > 
> > Nit: Extra blank line
> 
> Oh!
> 
> > 
> > >   /**
> > >    * drm_fb_memcpy - Copy clip buffer
> > >    * @dst: Array of destination buffers
> > > @@ -213,14 +236,10 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
> > >   		 const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> > >   		 const struct drm_rect *clip, bool cached)
> > >   {
> > > -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> > > -		0, 0, 0, 0
> > > -	};
> > >   	const struct drm_format_info *format = fb->format;
> > > -	u8 cpp = format->cpp[0];
> > >   	void (*swab_line)(void *dbuf, const void *sbuf, unsigned int npixels);
> > > -	switch (cpp) {
> > > +	switch (format->cpp[0]) {
> > >   	case 4:
> > >   		swab_line = drm_fb_swab32_line;
> > >   		break;
> > > @@ -230,21 +249,10 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
> > >   	default:
> > >   		drm_warn_once(fb->dev, "Format %p4cc has unsupported pixel size.\n",
> > >   			      &format->format);
> > > -		swab_line = NULL;
> > > -		break;
> > > -	}
> > > -	if (!swab_line)
> > >   		return;
> > > +	}
> > > -	if (!dst_pitch)
> > > -		dst_pitch = default_dst_pitch;
> > > -
> > > -	if (dst->is_iomem)
> > > -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], cpp,
> > > -				 vmap[0].vaddr, fb, clip, cached, swab_line);
> > > -	else
> > > -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], cpp, vmap[0].vaddr, fb,
> > > -			    clip, cached, swab_line);
> > > +	drm_fb_xfrm(dst, dst_pitch, format->cpp, vmap, fb, clip, cached, swab_line);
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_swab);
> > > @@ -277,19 +285,12 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
> > >   			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> > >   			       const struct drm_rect *clip)
> > >   {
> > > -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> > > -		0, 0, 0, 0
> > > +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> > > +		1,
> > >   	};
> > 
> > Could "dst_pixsize" be obtained from "drm_format_info->cpp"? (in all
> > conversion functions, not only in this one).
> 
> It could and I already considered it.  But it would require a pointer to the
> destination format's info, which we don't yet have here.  The info lookup is
> at [1], but it has linear complexity. So I was reluctant to use it.
> 
> The solution I have in mind is to pass in the dst format info from the
> calling driver. Drivers can look it up once and reuse it. But as that's a
> change to quite a few drivers, it's something for a separate patchset.
> 
> In general, we should make an effort to replace uses of 4CC codes with
> pointers to a format info.

Cool, thanks for the explanation. I don't see an easy way to make
__drm_format_info O(1) without adding unnecessary complexity and
it is probably not worth it.

Jose


> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v5.18.14/source/drivers/gpu/drm/drm_fourcc.c#L132
> 
> > 
> > I think they are similar structures, so we might be able to reuse that
> > information.
> > 
> > > -	if (!dst_pitch)
> > > -		dst_pitch = default_dst_pitch;
> > > -
> > > -	if (dst[0].is_iomem)
> > > -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
> > > -				 false, drm_fb_xrgb8888_to_rgb332_line);
> > > -	else
> > > -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
> > > -			    false, drm_fb_xrgb8888_to_rgb332_line);
> > > +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> > > +		    drm_fb_xrgb8888_to_rgb332_line);
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
> > > @@ -344,9 +345,10 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
> > >   			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> > >   			       const struct drm_rect *clip, bool swab)
> > >   {
> > > -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> > > -		0, 0, 0, 0
> > > +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> > > +		2,
> > >   	};
> > > +
> > >   	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
> > >   	if (swab)
> > > @@ -354,15 +356,7 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
> > >   	else
> > >   		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
> > > -	if (!dst_pitch)
> > > -		dst_pitch = default_dst_pitch;
> > > -
> > > -	if (dst[0].is_iomem)
> > > -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
> > > -				 false, xfrm_line);
> > > -	else
> > > -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
> > > -			    false, xfrm_line);
> > > +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false, xfrm_line);
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
> > > @@ -396,19 +390,12 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pi
> > >   			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> > >   			       const struct drm_rect *clip)
> > >   {
> > > -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> > > -		0, 0, 0, 0
> > > +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> > > +		3,
> > >   	};
> > > -	if (!dst_pitch)
> > > -		dst_pitch = default_dst_pitch;
> > > -
> > > -	if (dst[0].is_iomem)
> > > -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 3, vmap[0].vaddr, fb,
> > > -				 clip, false, drm_fb_xrgb8888_to_rgb888_line);
> > > -	else
> > > -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 3, vmap[0].vaddr, fb,
> > > -			    clip, false, drm_fb_xrgb8888_to_rgb888_line);
> > > +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> > > +		    drm_fb_xrgb8888_to_rgb888_line);
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
> > > @@ -435,19 +422,12 @@ static void drm_fb_rgb565_to_xrgb8888(struct iosys_map *dst, const unsigned int
> > >   				      const struct drm_framebuffer *fb,
> > >   				      const struct drm_rect *clip)
> > >   {
> > > -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> > > -		0, 0, 0, 0
> > > +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> > > +		4,
> > >   	};
> > > -	if (!dst_pitch)
> > > -		dst_pitch = default_dst_pitch;
> > > -
> > > -	if (dst[0].is_iomem)
> > > -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> > > -				 clip, false, drm_fb_rgb565_to_xrgb8888_line);
> > > -	else
> > > -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> > > -			    clip, false, drm_fb_rgb565_to_xrgb8888_line);
> > > +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> > > +		    drm_fb_rgb565_to_xrgb8888_line);
> > >   }
> > >   static void drm_fb_rgb888_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
> > > @@ -470,19 +450,12 @@ static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int
> > >   				      const struct drm_framebuffer *fb,
> > >   				      const struct drm_rect *clip)
> > >   {
> > > -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> > > -		0, 0, 0, 0
> > > +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> > > +		4,
> > >   	};
> > > -	if (!dst_pitch)
> > > -		dst_pitch = default_dst_pitch;
> > > -
> > > -	if (dst[0].is_iomem)
> > > -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> > > -				 clip, false, drm_fb_rgb888_to_xrgb8888_line);
> > > -	else
> > > -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> > > -			    clip, false, drm_fb_rgb888_to_xrgb8888_line);
> > > +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> > > +		    drm_fb_rgb888_to_xrgb8888_line);
> > >   }
> > >   static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
> > > @@ -518,19 +491,12 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *d
> > >   				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> > >   				    const struct drm_rect *clip)
> > >   {
> > > -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> > > -		0, 0, 0, 0
> > > +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> > > +		4,
> > >   	};
> > > -	if (!dst_pitch)
> > > -		dst_pitch = default_dst_pitch;
> > > -
> > > -	if (dst[0].is_iomem)
> > > -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
> > > -				 clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
> > > -	else
> > > -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
> > > -			    clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
> > > +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> > > +		    drm_fb_xrgb8888_to_xrgb2101010_line);
> > >   }
> > >   static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
> > > @@ -571,19 +537,12 @@ void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pit
> > >   			      const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> > >   			      const struct drm_rect *clip)
> > >   {
> > > -	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> > > -		0, 0, 0, 0
> > > +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> > > +		1,
> > >   	};
> > > -	if (!dst_pitch)
> > > -		dst_pitch = default_dst_pitch;
> > > -
> > > -	if (dst[0].is_iomem)
> > > -		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 1, vmap[0].vaddr, fb,
> > > -				 clip, false, drm_fb_xrgb8888_to_gray8_line);
> > > -	else
> > > -		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 1, vmap[0].vaddr, fb,
> > > -			    clip, false, drm_fb_xrgb8888_to_gray8_line);
> > > +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
> > > +		    drm_fb_xrgb8888_to_gray8_line);
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
> > > -- 
> > > 2.37.1
> > > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev



