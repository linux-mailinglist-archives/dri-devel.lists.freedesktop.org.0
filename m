Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04722666611
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840B410E10F;
	Wed, 11 Jan 2023 22:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8705310E0FE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:16:20 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id o15so12016356wmr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o+EO3hHV7CdHtGeVHiAs+gto216uxf8VoyRr3alxoFM=;
 b=JN4HY0b54tHOJ9wmyMjL1HXqTgkaKEIPEoIYgo/HbYl7Z+BZE5AETZeeOaSqBMXyUx
 1oU+v4D5ahVwcZIZItxPjVu7GH8uPRjfAZGjdDItFW9uNWNcJpKvpgis66V1uJQWBbGu
 hCgPLdzNw2dEF9LtVFk0pQquj1iL6p4TlIUq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o+EO3hHV7CdHtGeVHiAs+gto216uxf8VoyRr3alxoFM=;
 b=zzsEUPfX+WRT74obWjCpoqOesXYoFaQGbLIgDIdc8Rf0WyCC7WcWIy8gYs5FiG/DFu
 fSH84yyPTRvZezoRQ7o111B6frJQZ8KtUzSafWRgfbSVuE/aXE0msHR9tTY3DL9Q2xmH
 F+bbPaZgepjE+03MfGpX9XWIK3GRkcs6J4QbmgeDLNJwbpgMA1C86UtbaaxVL8d17AQL
 LUYXT4rwaO0IL0gapLN4T0ibWjeJ1+okMIlQ1WslgVB9kAENT4QNExCAlwf5Bd4FDqsg
 dwXBVMx0xV8qxz0T98ndpKeyzf/5et6h3kF817riPcL7p8M0kKEm5IKQUJeLHW5ffgkH
 OwRg==
X-Gm-Message-State: AFqh2kpFnUGZUq5htvmbYfzJr5wkHt/hSHmBFS3/CGkx8rdqzKrFPPju
 8Pc3CPq/uv9WisEPgiGZE+6vnpEsu2UmjGn+
X-Google-Smtp-Source: AMrXdXtv57fXHIL0F1CEB+5cmTYlFGy9fqwykxQk6FwRsY5rARveBf8pGRAGzotuonz6+w/ceV3xmg==
X-Received: by 2002:a05:600c:35c7:b0:3d3:5d0f:6dfc with SMTP id
 r7-20020a05600c35c700b003d35d0f6dfcmr53251215wmq.30.1673475379055; 
 Wed, 11 Jan 2023 14:16:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b003d9aa76dc6asm28511873wmc.0.2023.01.11.14.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 14:16:18 -0800 (PST)
Date: Wed, 11 Jan 2023 23:16:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/vc4: Check for valid formats
Message-ID: <Y781L8Q96mV2+wxb@phenom.ffwll.local>
References: <20230102135757.262676-1-mcanal@igalia.com>
 <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de>
 <Y765bF+c2y5b22P4@intel.com>
 <61439c1b-fd08-0942-8fcf-d3f24623d8e6@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61439c1b-fd08-0942-8fcf-d3f24623d8e6@igalia.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 11:32:43AM -0300, Maíra Canal wrote:
> On 1/11/23 10:28, Ville Syrjälä wrote:
> > On Mon, Jan 02, 2023 at 03:20:06PM +0100, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 02.01.23 um 14:57 schrieb Maíra Canal:
> > > > Currently, vc4 is not checking valid formats before creating a
> > > > framebuffer, which is triggering the IGT test
> > > > igt@kms_addfb_basic@addfb25-bad-modifier to fail, as vc4 accepts
> > > > to create a framebuffer with an invalid modifier. Therefore, check
> > > > for valid formats before creating framebuffers on vc4 and vc5 in
> > > > order to avoid creating framebuffers with invalid formats.
> > > > 
> > > > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > > > ---
> > > >    drivers/gpu/drm/vc4/vc4_kms.c | 23 ++++++++++++++++++++++-
> > > >    1 file changed, 22 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> > > > index 53d9f30460cf..5d1afd66fcc1 100644
> > > > --- a/drivers/gpu/drm/vc4/vc4_kms.c
> > > > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> > > > @@ -500,6 +500,27 @@ static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
> > > > 		mode_cmd = &mode_cmd_local;
> > > > 	}
> > > > 
> > > > +	if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> > > > +				      mode_cmd->modifier[0])) {
> > > > +		drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
> > > > +			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
> > > > +		return ERR_PTR(-EINVAL);
> > > > +	}
> > > 
> > > This might be a stupid question, but why doesn't drm_fbgem_fb_create()
> > > do this test already? It seems like a no-brainer and *not* testing for
> > > the plane formats should be the exception.
> > 
> > That was the approach I tried originally but there were a bunch of
> > problems with various drivers it at the time. Dunno if all of those
> > got sorted out or not. IIRC the idea floating around for ancient
> > drivers was to skip the check based on plane->format_default. Looks
> > like we're already using that approach in the setcrtc ioctl.
> > 
> 
> I ended up following Thomas's idea to check drm_drv_uses_atomic_modesetting()
> in order to check the modifier only for atomic drivers. If you have any feedback
> on this idea, I would be glad to hear it. The current version of this patch is [1].
> 
> [1] https://lore.kernel.org/dri-devel/20230109105807.18172-1-mcanal@igalia.com/T/

Yeah for atomic drivers the format list better be accurate, so we should
be able to enforce this.

For legacy driver it's a bit a mess, but I'm toying with some ideas how we
could add at least some validation there too. It's just that the audit is
a total pain :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
