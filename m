Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA496449C29
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 20:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617606E59F;
	Mon,  8 Nov 2021 19:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 457 seconds by postgrey-1.36 at gabe;
 Mon, 08 Nov 2021 19:05:52 UTC
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BEB6E59D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 19:05:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id EF97C580896;
 Mon,  8 Nov 2021 13:58:11 -0500 (EST)
Received: from imap45 ([10.202.2.95])
 by compute3.internal (MEProxy); Mon, 08 Nov 2021 13:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 amanoeldawod.com; h=mime-version:message-id:in-reply-to
 :references:date:from:to:cc:subject:content-type
 :content-transfer-encoding; s=fm3; bh=dt/S3nH6/2Gr1X8YGWm3DV3sRU
 zueTM4oni+e1bTbiw=; b=Rs+sisQoRrIyUwE9hUky1dkgj0sHEhbgWyI3xZug3a
 Sbi0f1+dgsMLSUezPy8+E12tG2FG/PAnR6HxY0TKn1o0XvoUD2BrXXL8NwZ/rm5n
 6yPoV41nA+b2w3IqlwUFACwZlruGoPcuTuh9akyPH+gLA71k7fsKpQTvTrvfOS1/
 MJLw7z1vVxjgEHG7XUyv9vVkatX0TYczwB/kxIlCqyc015omx+sAskQb/S0nP7HZ
 4xJ9goKkHHZ9H9YypWlG1w3/Y7UNdTO6v4VWScM7BU1UD73ULtmww7+x8Rsvz7X9
 NpLDKCk+O6S9FtOiO1DFdLKW0EsKGssgpg93ATXdACFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=dt/S3nH6/2Gr1X8YGWm3DV3sRUzueTM4oni+e1bTb
 iw=; b=YReC95rjCjY2Q1RPx6GtY/CUIdG+oacm4CVjSMLT9i+PcE0kfl3akdAe5
 ExoiYnNDAh2/Q/Ks/unjwhRYU/6dQiR+YPibJ23DF8JRhjISJrjLqzV4TL3tdzW3
 A1X4mz+ftbP9thrxVlyJ7XPS51xMyO25TIx/bYkDa+VmZO3YifI9pmEcu/8awE6Y
 BtDUsAvb45uGzzgfrDTolpw3DX/baibWDRab/kAjXKdoVohO31ko7wuMoRtlHVto
 IL5ohXFcArKXlTpiUNcV+tX/tJcXFV67OxoKDdYyegzUDdCxqPpw3r5UKe8/Q6re
 tc5fspkK/NtehEZojqL6myZKg8J1Q==
X-ME-Sender: <xms:Q3OJYYXl23mMOIq3A4Y_2Q-XRBsmW3nE87puCQqMwb7lFhGIAYwZ-w>
 <xme:Q3OJYclTaKf9Ic2iuFNRqyvgyptsYjNWRSS3KDtmtOiS6Lx-Q75UOO9A1ml6wffbq
 qEtSMy1OS9fagXWphI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddvgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehm
 rghnohgvlhcuffgrfihougdfuceokhgvrhhnvghlsegrmhgrnhhovghluggrfihougdrtg
 homheqnecuggftrfgrthhtvghrnhepvdeuffeiffejjefftdeijeeifeeiuefgteekkedu
 ffekieefgfdtgfeikeehhfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepkhgvrhhnvghlsegrmhgrnhhovghluggrfihougdrtghomh
X-ME-Proxy: <xmx:Q3OJYcaaXoVY9gESxUiwc90Oo13FWi-X1lINE12mWqlXmYtJwStjxQ>
 <xmx:Q3OJYXU2wW9o2fvVOy0dfNPbYY5ZBEMJjabiFiUrHJzECa65jkWMOA>
 <xmx:Q3OJYSkSURLyNyDnXV21JCicjU0JhBKEGj2VGjgVtqsiVr0fejm5FQ>
 <xmx:Q3OJYRqRx2BP_FVmYsc8NLaghsaCysB7i47l6m6UQl1p4M4RurRnPQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6775524A0074; Mon,  8 Nov 2021 13:58:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <944752ef-ad6a-4e42-8754-54a58c7f50ef@www.fastmail.com>
In-Reply-To: <20211101141532.26655-4-tzimmermann@suse.de>
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-4-tzimmermann@suse.de>
Date: Mon, 08 Nov 2021 13:57:42 -0500
From: "Amanoel Dawod" <kernel@amanoeldawod.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, drawat.floss@gmail.com, airlied@redhat.com,
 kraxel@redhat.com, david@lechnology.com, sam@ravnborg.org,
 javierm@redhat.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Subject: Re: [PATCH v2 3/9] drm/format-helper: Add destination-buffer pitch to
 drm_fb_swab()
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 1, 2021, at 10:15 AM, Thomas Zimmermann wrote:
> Add destination-buffer pitch as argument to drm_fb_swab(). Done for
> consistency with the rest of the interface.
>
> v2:
> 	* update documentation (Noralf)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 21 ++++++++++++++++-----
>  drivers/gpu/drm/drm_mipi_dbi.c      |  2 +-
>  drivers/gpu/drm/gud/gud_pipe.c      |  2 +-
>  include/drm/drm_format_helper.h     |  5 +++--
>  4 files changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_format_helper.c=20
> b/drivers/gpu/drm/drm_format_helper.c
> index fac37c697d8b..dac355320287 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -101,6 +101,7 @@ EXPORT_SYMBOL(drm_fb_memcpy_toio);
>  /**
>   * drm_fb_swab - Swap bytes into clip buffer
>   * @dst: Destination buffer
> + * @dst_pitch: Number of bytes between two consecutive scanlines=20
> within dst
>   * @src: Source buffer
>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
> @@ -110,21 +111,27 @@ EXPORT_SYMBOL(drm_fb_memcpy_toio);
>   * time to speed up slow uncached reads.
>   *
>   * This function does not apply clipping on dst, i.e. the destination
> - * is a small buffer containing the clip rect only.
> + * is at the top-left corner.
>   */
> -void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
> -		 struct drm_rect *clip, bool cached)
> +void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
> +		 const struct drm_framebuffer *fb, const struct drm_rect *clip,
> +		 bool cached)
>  {
>  	u8 cpp =3D fb->format->cpp[0];
>  	size_t len =3D drm_rect_width(clip) * cpp;
> -	u16 *src16, *dst16 =3D dst;
> -	u32 *src32, *dst32 =3D dst;
> +	const u16 *src16;
> +	const u32 *src32;
> +	u16 *dst16;
> +	u32 *dst32;
>  	unsigned int x, y;
>  	void *buf =3D NULL;
>=20
>  	if (WARN_ON_ONCE(cpp !=3D 2 && cpp !=3D 4))
>  		return;
>=20
> +	if (!dst_pitch)
> +		dst_pitch =3D len;
> +
>  	if (!cached)
>  		buf =3D kmalloc(len, GFP_KERNEL);
>=20
> @@ -140,6 +147,9 @@ void drm_fb_swab(void *dst, void *src, struct=20
> drm_framebuffer *fb,
>  			src32 =3D src;
>  		}
>=20
> +		dst16 =3D dst;
> +		dst32 =3D dst;
> +
>  		for (x =3D clip->x1; x < clip->x2; x++) {
>  			if (cpp =3D=3D 4)
>  				*dst32++ =3D swab32(*src32++);
> @@ -148,6 +158,7 @@ void drm_fb_swab(void *dst, void *src, struct=20
> drm_framebuffer *fb,
>  		}
>=20
>  		src +=3D fb->pitches[0];
> +		dst +=3D dst_pitch;
>  	}
>=20
>  	kfree(buf);
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c=20
> b/drivers/gpu/drm/drm_mipi_dbi.c
> index c09df8b06c7a..7ce89917d761 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -211,7 +211,7 @@ int mipi_dbi_buf_copy(void *dst, struct=20
> drm_framebuffer *fb,
>  	switch (fb->format->format) {
>  	case DRM_FORMAT_RGB565:
>  		if (swap)
> -			drm_fb_swab(dst, src, fb, clip, !gem->import_attach);
> +			drm_fb_swab(dst, 0, src, fb, clip, !gem->import_attach);
>  		else
>  			drm_fb_memcpy(dst, 0, src, fb, clip);
>  		break;
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c=20
> b/drivers/gpu/drm/gud/gud_pipe.c
> index a92112ffd37a..e0b117b2559f 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -201,7 +201,7 @@ static int gud_prep_flush(struct gud_device *gdrm,=20
> struct drm_framebuffer *fb,
>  			len =3D gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
>  		}
>  	} else if (gud_is_big_endian() && format->cpp[0] > 1) {
> -		drm_fb_swab(buf, vaddr, fb, rect, !import_attach);
> +		drm_fb_swab(buf, 0, vaddr, fb, rect, !import_attach);
>  	} else if (compression && !import_attach && pitch =3D=3D fb->pitches=
[0]) {
>  		/* can compress directly from the framebuffer */
>  		buf =3D vaddr + rect->y1 * pitch;
> diff --git a/include/drm/drm_format_helper.h=20
> b/include/drm/drm_format_helper.h
> index 1fc3ba7b6060..ddcba5abe306 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -17,8 +17,9 @@ void drm_fb_memcpy(void *dst, unsigned int dst_pitch=
,=20
> const void *vaddr,
>  		   const struct drm_framebuffer *fb, const struct drm_rect *clip);
>  void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch,=20
> const void *vaddr,
>  			const struct drm_framebuffer *fb, const struct drm_rect *clip);
> -void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
> -		 struct drm_rect *clip, bool cached);
> +void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
> +		 const struct drm_framebuffer *fb, const struct drm_rect *clip,
> +		 bool cached);
>  void drm_fb_xrgb8888_to_rgb332(void *dst, void *vaddr, struct=20
> drm_framebuffer *fb,
>  			       struct drm_rect *clip);
>  void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
> --=20
> 2.33.1

Applying this fails for me (tested against 5.14 and 5.15 trees).
Example:
patching file include/drm/drm_format_helper.h
Hunk #1 FAILED at 17.

--=20
thanks,
Amanoel
