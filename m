Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D589A2B497F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 16:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC11689D39;
	Mon, 16 Nov 2020 15:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1860B89D39
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 15:36:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c17so19118617wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 07:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=BezluhERmfqSfMrKaRLnRUHJ00yDtJHkyuBvrv1jMf0=;
 b=lbpb8hZz66Mprg9UhEbf7G9PpaGneI03o9V2hsS99Texb4hfnCbCVL9jkjuLmk8bA/
 U0Wvk1tzEm2WP3KTlaa7A+R+MofuwFi5SsMKxw3lNZbBiTmksIVGDxrhv0TVl3gS1uTA
 sbZhI3Kk2qCUKlm5QxUlnf13INIxqnXe5smfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=BezluhERmfqSfMrKaRLnRUHJ00yDtJHkyuBvrv1jMf0=;
 b=V3R3RhwPkv/TLrTkWemBz4TmG5ZlAOa7CyGk6d9DwqoLGBqVRciwn8EobSBJhD6lIk
 X7QEiW/cSoQpxjYYBExIJxxMd675UQopwTeZLislNNICLM3Tbg4YcaGMfeh0rrcFtsxV
 QinpoLoc/OktwLIdcY4SNoqYTEQI/rU9DUzi2xs1DKSi6WhsGNAwcmOTkUWF6CEhlX0q
 rAGzLPAeH5XLMy4A2a24rwzyRwdkoncVYCQUDqG2HUGRKIwDWlU9k5Luh1WcufHl1GZ3
 56NGG1mhWc3R//buY0JNZF0K3tAuj0J13oMOonl0Zt6wS+Oc1cEF9gtaXt/GGtY8+4Bn
 bJQw==
X-Gm-Message-State: AOAM532jpDhS2Ar921xtO+p9SoHdpN6l7k2NIjdiwD4PcdNDvwK6vgdZ
 xxZH1GUc+9B5kpjerOFAl+A+Lw==
X-Google-Smtp-Source: ABdhPJyeG/kvCAm4Id+uR/9qy6trbwpMFk0XlsYhIZmeLANx6q7Yi5ik0UzbSU+IQHL6x0KBlxIFnw==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr19834649wrv.299.1605540969779; 
 Mon, 16 Nov 2020 07:36:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o13sm4331918wmc.44.2020.11.16.07.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 07:36:08 -0800 (PST)
Date: Mon, 16 Nov 2020 16:36:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v4 10/27] video: fix some kernel-doc markups
Message-ID: <20201116153606.GC401619@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Bernard Zhao <bernard@vivo.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1605521731.git.mchehab+huawei@kernel.org>
 <21661aed9892a1bacc7ef76a5dc9f5c7b37f5d8f.1605521731.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21661aed9892a1bacc7ef76a5dc9f5c7b37f5d8f.1605521731.git.mchehab+huawei@kernel.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bernard Zhao <bernard@vivo.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 11:18:06AM +0100, Mauro Carvalho Chehab wrote:
> Some identifiers have different names between their prototypes
> and the kernel-doc markup.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'm assuming you're sending a pull request for this.
-Daniel

> ---
>  drivers/video/fbdev/core/fbcmap.c | 2 +-
>  drivers/video/hdmi.c              | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcmap.c b/drivers/video/fbdev/core/fbcmap.c
> index e5ae33c1a8e8..757d5c3f620b 100644
> --- a/drivers/video/fbdev/core/fbcmap.c
> +++ b/drivers/video/fbdev/core/fbcmap.c
> @@ -59,41 +59,41 @@ static u16 blue16[] __read_mostly = {
>      0x0000, 0xaaaa, 0x0000, 0xaaaa, 0x0000, 0xaaaa, 0x0000, 0xaaaa,
>      0x5555, 0xffff, 0x5555, 0xffff, 0x5555, 0xffff, 0x5555, 0xffff
>  };
>  
>  static const struct fb_cmap default_2_colors = {
>      .len=2, .red=red2, .green=green2, .blue=blue2
>  };
>  static const struct fb_cmap default_8_colors = {
>      .len=8, .red=red8, .green=green8, .blue=blue8
>  };
>  static const struct fb_cmap default_4_colors = {
>      .len=4, .red=red4, .green=green4, .blue=blue4
>  };
>  static const struct fb_cmap default_16_colors = {
>      .len=16, .red=red16, .green=green16, .blue=blue16
>  };
>  
>  
>  
>  /**
> - *	fb_alloc_cmap - allocate a colormap
> + *	fb_alloc_cmap_gfp - allocate a colormap
>   *	@cmap: frame buffer colormap structure
>   *	@len: length of @cmap
>   *	@transp: boolean, 1 if there is transparency, 0 otherwise
>   *	@flags: flags for kmalloc memory allocation
>   *
>   *	Allocates memory for a colormap @cmap.  @len is the
>   *	number of entries in the palette.
>   *
>   *	Returns negative errno on error, or zero on success.
>   *
>   */
>  
>  int fb_alloc_cmap_gfp(struct fb_cmap *cmap, int len, int transp, gfp_t flags)
>  {
>  	int size = len * sizeof(u16);
>  	int ret = -ENOMEM;
>  
>  	flags |= __GFP_NOWARN;
>  
>  	if (cmap->len != len) {
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index 1e4cb63d0d11..947be761dfa4 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -1675,41 +1675,42 @@ static int hdmi_audio_infoframe_unpack(struct hdmi_audio_infoframe *frame,
>  
>  	ret = hdmi_audio_infoframe_init(frame);
>  	if (ret)
>  		return ret;
>  
>  	ptr += HDMI_INFOFRAME_HEADER_SIZE;
>  
>  	frame->channels = ptr[0] & 0x7;
>  	frame->coding_type = (ptr[0] >> 4) & 0xf;
>  	frame->sample_size = ptr[1] & 0x3;
>  	frame->sample_frequency = (ptr[1] >> 2) & 0x7;
>  	frame->coding_type_ext = ptr[2] & 0x1f;
>  	frame->channel_allocation = ptr[3];
>  	frame->level_shift_value = (ptr[4] >> 3) & 0xf;
>  	frame->downmix_inhibit = ptr[4] & 0x80 ? true : false;
>  
>  	return 0;
>  }
>  
>  /**
> - * hdmi_vendor_infoframe_unpack() - unpack binary buffer to a HDMI vendor infoframe
> + * hdmi_vendor_any_infoframe_unpack() - unpack binary buffer to a HDMI
> + * 	vendor infoframe
>   * @frame: HDMI Vendor infoframe
>   * @buffer: source buffer
>   * @size: size of buffer
>   *
>   * Unpacks the information contained in binary @buffer into a structured
>   * @frame of the HDMI Vendor information frame.
>   * Also verifies the checksum as required by section 5.3.5 of the HDMI 1.4
>   * specification.
>   *
>   * Returns 0 on success or a negative error code on failure.
>   */
>  static int
>  hdmi_vendor_any_infoframe_unpack(union hdmi_vendor_any_infoframe *frame,
>  				 const void *buffer, size_t size)
>  {
>  	const u8 *ptr = buffer;
>  	size_t length;
>  	int ret;
>  	u8 hdmi_video_format;
>  	struct hdmi_vendor_infoframe *hvf = &frame->hdmi;
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
