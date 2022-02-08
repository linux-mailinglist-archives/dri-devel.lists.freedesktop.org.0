Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EED4ADAE8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 15:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1DD10E2BC;
	Tue,  8 Feb 2022 14:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002E710E297
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 14:13:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i15so8593610wrb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 06:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5R9+MBEvDpMW00Dte4+/rEEsFi5DtKUaBzOD4MXCXtQ=;
 b=Jc79PGraKQ5s6L/P+SLK07eOBNmq7ee8b1jOmNuDLMvHSGeWysmyOpNAzy8Au2OwGJ
 S4bEVN2W/Kj9ydurocslXTyX0C4c//GnnjcwRcVOyUerHb2D22oLssPL8ECZDuF4F+WJ
 Yvx5THUgRzzMqElW/OQKovVf/OMDvdRVnm9rI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=5R9+MBEvDpMW00Dte4+/rEEsFi5DtKUaBzOD4MXCXtQ=;
 b=O/+Kzl1m2A0xkK0whi7zAldNZaKTh7zdzU5HOtNFPuqHUaMQzftqI8L/yGazE2/UMO
 YDqsXUUjk3nzrz+YQLf6v4wNWOXcoF0MY50yH5t90K4GHTeHYCxshUx0JwLpQZkNz9Z3
 Qv+92VRqic+4c+/GUm1S0ucCGc5e73Y/iIOYthoDln0eNfo+akcnYnUnxoQ+N+J9EEK2
 KY2AumGFl7iEMht4u1WprKXpVV5Sm9xGkcqssb6BweSZtJpbyWzwH30V4xc74wulHcBv
 DZ2dPfQN0lP977VvXfp13N7mPX2oMXQYNtAvYt8F4A66g61gpVLXpimwBxPVtmCLU7Cp
 WUlg==
X-Gm-Message-State: AOAM533q918n8/qbuKNjtBhvMNdDXigBTIY138Q23jrGNeQcTOtmLimG
 36zh423+MRuHqsJKc3OE1JADrIvCBMbpuw==
X-Google-Smtp-Source: ABdhPJw+sMlSVd/afjYxQMHqe/E6uF3RGqFVH/7HQ+ZCHFj6dyRrBozPKFtxGDVDOD1tAPw8D+QNOA==
X-Received: by 2002:adf:edc9:: with SMTP id v9mr3665385wro.135.1644329579332; 
 Tue, 08 Feb 2022 06:12:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id az21sm2187601wmb.11.2022.02.08.06.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 06:12:58 -0800 (PST)
Date: Tue, 8 Feb 2022 15:12:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 01/21] MAINTAINERS: Add entry for fbdev core
Message-ID: <YgJ6aKxFXbdX6toP@phenom.ffwll.local>
Mail-Followup-To: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Dave Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Pavel Machek <pavel@ucw.cz>, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Claudio Suarez <cssk@net-c.es>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Sven Schnelle <svens@stackframe.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131210552.482606-2-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 10:05:32PM +0100, Daniel Vetter wrote:
> Ever since Tomi extracted the core code in 2014 it's been defacto me
> maintaining this, with help from others from dri-devel and sometimes
> Linus (but those are mostly merge conflicts):
> 
> $ git shortlog -ns  drivers/video/fbdev/core/ | head -n5
>     35  Daniel Vetter
>     23  Linus Torvalds
>     10  Hans de Goede
>      9  Dave Airlie
>      6  Peter Rosin
> 
> I think ideally we'd also record that the various firmware fb drivers
> (efifb, vesafb, ...) are also maintained in drm-misc because for the
> past few years the patches have either been to fix handover issues
> with drm drivers, or caused handover issues with drm drivers. So any
> other tree just doesn't make sense. But also, there's plenty of
> outdated MAINTAINER entries for these with people and git trees that
> haven't been active in years, so maybe let's just leave them alone.
> And furthermore distros are now adopting simpledrm as the firmware fb
> driver, so hopefully the need to care about the fbdev firmware drivers
> will go down going forward.
> 
> Note that drm-misc is group maintained, I expect that to continue like
> we've done before, so no new expectations that patches all go through
> my hands. That would be silly. This also means I'm happy to put any
> other volunteer's name in the M: line, but otherwise git log says I'm
> the one who's stuck with this.
> 
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: DRI Development <dri-devel@lists.freedesktop.org>
> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> Cc: Claudio Suarez <cssk@net-c.es>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sven Schnelle <svens@stackframe.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Merged to drm-misc-fixes with all the acks added.
-Daniel

> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea3e6c914384..49809eaa3096 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7573,6 +7573,12 @@ S:	Maintained
>  W:	http://floatingpoint.sourceforge.net/emulator/index.html
>  F:	arch/x86/math-emu/
>  
> +FRAMEBUFFER CORE
> +M:	Daniel Vetter <daniel@ffwll.ch>
> +F:	drivers/video/fbdev/core/
> +S:	Odd Fixes
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +
>  FRAMEBUFFER LAYER
>  M:	Helge Deller <deller@gmx.de>
>  L:	linux-fbdev@vger.kernel.org
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
