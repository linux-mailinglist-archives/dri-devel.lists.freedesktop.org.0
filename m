Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD41A523DF6
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 21:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A350810EB0E;
	Wed, 11 May 2022 19:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED66610EF9C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 19:51:11 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id z2so6151833ejj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=okDasmSIedZIfDNVfGzL/C0tlLQxT7cXpy43/5U1qMo=;
 b=QUS04llQ/TQdvF3bJLtNkYv+9Y/6CRyA1IhJj03bD1ysf9ANin3YF7pIozL2ckCVd9
 OEgvjLcrm/1wDU9oB6CTsdkJp6bSY0dGxFMc0XUZpQx5vjtv+lpaWgY+z91+b2dCfgUQ
 oJPZmG2v8C8OYJmWR8Lmy78eHPjrvYJULiRqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=okDasmSIedZIfDNVfGzL/C0tlLQxT7cXpy43/5U1qMo=;
 b=rRge9Nlcv/bULXcFM5u7ytKnOEAlt7FS2jp5+MJ70XqPFBM9cpQGg2bbMXfYzDFE4b
 JIk//4xptIg7hzzDNr8GIq61FH+b4NrJkmUnGUiYErUrKydePywx83/Um8OJSxIarLz5
 w8a/7G49YWqpx48aHqjHB+ja3E0ZGGApqkl6KnpojA42qgaM8VIlNnsGiQ4v+Y2fu0HW
 oJvK0/jJIriuYQHTy1Vf3Uod7W5eGBJ6vEpmuwfmYW6DbpyPNTuPYWVDx4Gzcgz8wqBf
 RkeaMh8R05I3mY1FHXKGNJBXqXQSx0FAfPLSLWAie/CXdRfhy9RO7yAXQpLr83klYd/r
 pdhQ==
X-Gm-Message-State: AOAM532XY8PiFr+6gZlYio8B1Td683kNlq2/epswsGNiY0W8wkDDpWkW
 rN2ufcPfJ7fsMK0S2xyLmLlEcA==
X-Google-Smtp-Source: ABdhPJzc30UDk4ot2UfqIn3JcPVtx5jKy3U9yzEWlwhCj1FbId8oXyy3bEiSM7KRq59c9iZ9/8xhUg==
X-Received: by 2002:a17:906:b74b:b0:6f4:cd08:6fec with SMTP id
 fx11-20020a170906b74b00b006f4cd086fecmr28194512ejb.155.1652298670454; 
 Wed, 11 May 2022 12:51:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 cb13-20020a0564020b6d00b0042617ba639asm1598568edb.36.2022.05.11.12.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 12:51:09 -0700 (PDT)
Date: Wed, 11 May 2022 21:51:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 4/4] ALSA: hda - identify when audio is provided by a
 video driver
Message-ID: <YnwTrF6VpM7V1jdu@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 mauro.chehab@linux.intel.com, Takashi Iwai <tiwai@suse.de>
References: <cover.1652113087.git.mchehab@kernel.org>
 <f53f8a9d04b39a6843f19fe3069d1be7a9713aae.1652113087.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f53f8a9d04b39a6843f19fe3069d1be7a9713aae.1652113087.git.mchehab@kernel.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: alsa-devel@alsa-project.org, mauro.chehab@linux.intel.com,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 09, 2022 at 06:23:39PM +0200, Mauro Carvalho Chehab wrote:
> On some devices, the hda driver needs to hook into a video driver,
> in order to be able to properly access the audio hardware and/or
> the power management function.
> 
> That's the case of several snd_hda_intel devices that depends on
> i915 driver.
> 
> Ensure that a proper reference between the snd-hda driver needing
> such binding is shown at /proc/modules, in order to allow userspace
> to know about such binding.
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> See [PATCH v6 0/4] at: https://lore.kernel.org/all/cover.1652113087.git.mchehab@kernel.org/
> 
>  sound/hda/hdac_component.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
> index bb37e7e0bd79..7789873ddf47 100644
> --- a/sound/hda/hdac_component.c
> +++ b/sound/hda/hdac_component.c
> @@ -199,7 +199,7 @@ static int hdac_component_master_bind(struct device *dev)
>  	}
>  
>  	/* pin the module to avoid dynamic unbinding, but only if given */
> -	if (!try_module_get(acomp->ops->owner)) {
> +	if (!try_module_get_owner(acomp->ops->owner, dev->driver->owner)) {

I'm still a bit confused why snd-hda does this and why this wasn't put
into component.c, but that's kinda a pre-existing issue and I guess could
be fixed later on. It really shouldn't be anything specific to snd-hda
here.

Anyway I scrolled through the series, it makes a lot more sense than the
intial hack to me, so on the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But maybe don't count that as real review :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
