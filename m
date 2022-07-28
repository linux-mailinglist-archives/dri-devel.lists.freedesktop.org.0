Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF88584510
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 19:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF5B1136BC;
	Thu, 28 Jul 2022 17:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EB910E7AE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 17:47:08 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 w8-20020a05600c014800b003a32e89bc4eso1424176wmm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cXpqWdfG2TsoicES0NY9/Hma2t4vK8l43GNRBmKO554=;
 b=lo6v8rSnQ3MstRtDJyyQcc0L6B28qeUvVaB0Gh+06DT+73/f4nFU+9zHQjKdYHMmz9
 6vin4h7GhwUzuxdKGUQ12tfGaLw3YGsSCSwDiZ9K6si8oeQUv2mr81QbPKqnPCfEZKxr
 1x2O6lCSZ5CrzoNaU2HhXN5ZDTB9EggV2+VzZbM7k+NHJabmwYPm5NNoVd0zgBHFZ9Hm
 fAk7iOfvc7ewaN4EskIywp9Gbg3lYv0j8Fn3OjHaAjYps127cY/Gxsd5aJo5ho2/60NL
 X6ahhBrLHVFhGm12RhFuhJRSm4GJTVLeidYuZTUxn06ikiDrqtPF0zI4DG93srCfNVOM
 0hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cXpqWdfG2TsoicES0NY9/Hma2t4vK8l43GNRBmKO554=;
 b=JqfPjt9GvLNa4ZkGxmjr9TTQcJ6LtcTZxU0nR9dWVFD1YniGHbHTVjBHW0kbdmnbb7
 +JWb1NBdFI6E7TwyBHiSkosHMRuD4dqk93IAb1KdPR/dDgnbxYpkficggBgctDudYcxA
 IXQTbLczhmutAp7Lk0YiC8KqKPinCe5BGTXuueG3lgCNsSxS8xAoYTJ1ImA6VU10M/Wr
 2g+0SzLK2T7ORR5mhyxAOjLZ7/ERf88rglofLBwiHOdXCT+N+/O0fvH/LfYc0WmLgZgz
 9DIL49Bjtu5W6eWfITVnbitmnGX3Mx3tisBxwODAa5Qhgife6YcTeSOINu1SHkzpk9GZ
 goPQ==
X-Gm-Message-State: AJIora9CX3WbnrmJzhTUbsQWepFS+W/5vKXfISm4h8CwwTxYKlGM9mtT
 gT8+E5n+zG9F0zKc8BT1dtU=
X-Google-Smtp-Source: AGRyM1sehdvkcsqdcdS/qXqfgr7tfq+0MbYPJWTvCXfyYU15J30W97K4KVeWPVBNF/uS0Ve7SG2rvg==
X-Received: by 2002:a05:600c:3551:b0:3a3:1d4f:69ed with SMTP id
 i17-20020a05600c355100b003a31d4f69edmr7833wmq.188.1659030426916; 
 Thu, 28 Jul 2022 10:47:06 -0700 (PDT)
Received: from elementary ([94.73.33.57]) by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0021ee28ff76esm1671544wrn.38.2022.07.28.10.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 10:47:06 -0700 (PDT)
Date: Thu, 28 Jul 2022 19:47:03 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 04/12] drm/format-helper: Rework XRGB8888-to-RGBG332
 conversion
Message-ID: <20220728174703.GA52359@elementary>
References: <20220727113312.22407-1-tzimmermann@suse.de>
 <20220727113312.22407-5-tzimmermann@suse.de>
 <20220728071353.GA56421@elementary>
 <4ba57f80-5025-c3a0-5f65-ec52643f0122@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ba57f80-5025-c3a0-5f65-ec52643f0122@suse.de>
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
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 09:27:52AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 28.07.22 um 09:13 schrieb José Expósito:
> > Hi Thomas,
> > 
> > On Wed, Jul 27, 2022 at 01:33:04PM +0200, Thomas Zimmermann wrote:
> > > Update XRGB8888-to-RGB332 conversion to support struct iosys_map
> > > and convert all users. Although these are single-plane color formats,
> > > the new interface supports multi-plane formats for consistency with
> > > drm_fb_blit().
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > Tested-by: José Expósito <jose.exposito89@gmail.com>
> > Reviewed-by: José Expósito <jose.exposito89@gmail.com>
> > 
> > I just ran the tests in x86_64 and UML and they work as expected.
> > I need to find some time to review all patches, but this one LGTM.
> 
> Thanks a lot.
> 
> > 
> > This series will cause conflicts with [1]. Depending on which patchset
> > gets merged earlier, we will have to resolve the conflicts in one
> > series or the other.
> 
> I've seen this. Go ahead and commit your patches if they are ready. I can
> easily rebase on top.
> 
> Best reards
> Thomas

OK, I just merged the series in drm-misc-next... With some conflicts in
drm-tip in unreleated files I'm trying to figure out on IRC.

But I think you should be able to rebase your series if you want to.

Jose

> > 
> > Best wishes,
> > Jose
> > 
> > [1] https://patchwork.kernel.org/project/dri-devel/list/?series=663266
> > 
> > > ---
> > >   drivers/gpu/drm/drm_format_helper.c           | 25 ++++++++++++++-----
> > >   drivers/gpu/drm/gud/gud_pipe.c                |  2 +-
> > >   .../gpu/drm/tests/drm_format_helper_test.c    | 14 ++++++-----
> > >   include/drm/drm_format_helper.h               |  5 ++--
> > >   4 files changed, 31 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> > > index fa22d3cb11e8..2b5c3746ff4a 100644
> > > --- a/drivers/gpu/drm/drm_format_helper.c
> > > +++ b/drivers/gpu/drm/drm_format_helper.c
> > > @@ -265,18 +265,31 @@ static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigne
> > >   /**
> > >    * drm_fb_xrgb8888_to_rgb332 - Convert XRGB8888 to RGB332 clip buffer
> > > - * @dst: RGB332 destination buffer
> > > - * @dst_pitch: Number of bytes between two consecutive scanlines within dst
> > > - * @src: XRGB8888 source buffer
> > > + * @dst: Array of RGB332 destination buffers
> > > + * @dst_pitch: Array of numbers of bytes between two consecutive scanlines within dst
> > > + * @vmap: Array of XRGB8888 source buffers
> > >    * @fb: DRM framebuffer
> > >    * @clip: Clip rectangle area to copy
> > >    *
> > >    * Drivers can use this function for RGB332 devices that don't natively support XRGB8888.
> > >    */
> > > -void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *src,
> > > -			       const struct drm_framebuffer *fb, const struct drm_rect *clip)
> > > +void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
> > > +			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> > > +			       const struct drm_rect *clip)
> > >   {
> > > -	drm_fb_xfrm(dst, dst_pitch, 1, src, fb, clip, false, drm_fb_xrgb8888_to_rgb332_line);
> > > +	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
> > > +		0, 0, 0, 0
> > > +	};
> > > +
> > > +	if (!dst_pitch)
> > > +		dst_pitch = default_dst_pitch;
> > > +
> > > +	if (dst[0].is_iomem)
> > > +		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
> > > +				 false, drm_fb_xrgb8888_to_rgb332_line);
> > > +	else
> > > +		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
> > > +			    false, drm_fb_xrgb8888_to_rgb332_line);
> > >   }
> > >   EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
> > > diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> > > index a15cda9ba058..426a3ae6cc50 100644
> > > --- a/drivers/gpu/drm/gud/gud_pipe.c
> > > +++ b/drivers/gpu/drm/gud/gud_pipe.c
> > > @@ -196,7 +196,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
> > >   		} else if (format->format == DRM_FORMAT_R8) {
> > >   			drm_fb_xrgb8888_to_gray8(buf, 0, vaddr, fb, rect);
> > >   		} else if (format->format == DRM_FORMAT_RGB332) {
> > > -			drm_fb_xrgb8888_to_rgb332(buf, 0, vaddr, fb, rect);
> > > +			drm_fb_xrgb8888_to_rgb332(&dst, NULL, map_data, fb, rect);
> > >   		} else if (format->format == DRM_FORMAT_RGB565) {
> > >   			drm_fb_xrgb8888_to_rgb565(buf, 0, vaddr, fb, rect, gud_is_big_endian());
> > >   		} else if (format->format == DRM_FORMAT_RGB888) {
> > > diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > > index 98583bf56044..b74dba06f704 100644
> > > --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> > > +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > > @@ -124,7 +124,8 @@ static void xrgb8888_to_rgb332_test(struct kunit *test)
> > >   {
> > >   	const struct xrgb8888_to_rgb332_case *params = test->param_value;
> > >   	size_t dst_size;
> > > -	__u8 *dst = NULL;
> > > +	struct iosys_map dst, xrgb8888;
> > > +	__u8 *buf = NULL;
> > >   	struct drm_framebuffer fb = {
> > >   		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> > > @@ -135,12 +136,13 @@ static void xrgb8888_to_rgb332_test(struct kunit *test)
> > >   				       &params->clip);
> > >   	KUNIT_ASSERT_GT(test, dst_size, 0);
> > > -	dst = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> > > -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
> > > +	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> > > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
> > > -	drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, params->xrgb8888,
> > > -				  &fb, &params->clip);
> > > -	KUNIT_EXPECT_EQ(test, memcmp(dst, params->expected, dst_size), 0);
> > > +	iosys_map_set_vaddr(&dst, buf);
> > > +	iosys_map_set_vaddr(&xrgb8888, (void __force *)params->xrgb8888);
> > > +	drm_fb_xrgb8888_to_rgb332(&dst, &params->dst_pitch, &xrgb8888, &fb, &params->clip);
> > > +	KUNIT_EXPECT_EQ(test, memcmp(buf, params->expected, dst_size), 0);
> > >   }
> > >   static struct kunit_case drm_format_helper_test_cases[] = {
> > > diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> > > index 60944feaa936..3c28f099e3ed 100644
> > > --- a/include/drm/drm_format_helper.h
> > > +++ b/include/drm/drm_format_helper.h
> > > @@ -20,8 +20,9 @@ void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
> > >   void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
> > >   		 const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> > >   		 const struct drm_rect *clip, bool cached);
> > > -void drm_fb_xrgb8888_to_rgb332(void *dst, unsigned int dst_pitch, const void *vaddr,
> > > -			       const struct drm_framebuffer *fb, const struct drm_rect *clip);
> > > +void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
> > > +			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
> > > +			       const struct drm_rect *clip);
> > >   void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
> > >   			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
> > >   			       bool swab);
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



