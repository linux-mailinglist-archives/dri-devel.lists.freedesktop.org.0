Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B8244985A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 16:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CC96E087;
	Mon,  8 Nov 2021 15:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B596E087
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 15:32:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d3so27568935wrh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 07:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=3qH9TdJtbE5s6fGLUpqoEcNvViWRlxUM56TldO1HeKs=;
 b=IDU4UF9pM/kEqYhhBQbBBKHZ3Ho9d/OPwdilkGK0aRqkEmeTorOipZkdyVKic8fdM7
 DCXvdsPJ8cxqG6fRWzipKWMlcqBFjBeO9E6qGurECf9jZ6rnDfih1gtNW1zoCHZaRCao
 5wueSQYH9Z/hIkWExTUjipen9leMYvj6H07Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=3qH9TdJtbE5s6fGLUpqoEcNvViWRlxUM56TldO1HeKs=;
 b=GDUTbZNXUl9/vPftn0XCaa7LZWbmaAxuxmCXZR99JB95fcU+qSYTC8eJii+MyUAkVe
 1kb5VJ7h+9ywaYbVqQtZH6FNygVBHYbu2+zVkqYQruhv8Uap3vIgEbEyPcUmcpo4PaD/
 Uz8J8+I9C+bRUA5khPv8mNlccseBtSNqJHMesXZgfGCqsntV5KAIzoYaux4EXe/wfdne
 vmYfthqRUIz+cW7Ms7CMGcDGQQW4oq6QDmGkOLYB5wHd0+DxieeSF+EmELrv/lJlszIj
 dkydBRSOfpN5K6issOWAC65k4nA5BhznsyqprwSZkC5PVdVkbw4QnAqrLMoyjkVE+m2U
 EgZQ==
X-Gm-Message-State: AOAM531jIiBDLxtQuyeTjkQ4knltEHhMOs8/0LF5Wm1tdseX1rKF3i6k
 GeQ+AXFv1V+yrHdtGN5oArlg7w==
X-Google-Smtp-Source: ABdhPJxUhPtLxhdxtIRqnFCsOzKZQNDCoG7g8D/0H28sp3ZvEiXYQsgDC6xoBnfafE67l2I3bI/FdA==
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr50670wri.222.1636385555360;
 Mon, 08 Nov 2021 07:32:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b197sm16154272wmb.24.2021.11.08.07.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 07:32:34 -0800 (PST)
Date: Mon, 8 Nov 2021 16:32:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 5/6] Documentation/admin-guide: Document nomodeset
 kernel parameter
Message-ID: <YYlDETv8pVM+0SJo@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20211108121544.776590-1-javierm@redhat.com>
 <20211108121544.776590-6-javierm@redhat.com>
 <0f152d33-6362-b04b-6661-1d5cd7f32015@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f152d33-6362-b04b-6661-1d5cd7f32015@suse.de>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 01:48:24PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.11.21 um 13:15 schrieb Javier Martinez Canillas:
> > The nomodeset kernel command line parameter is not documented. Its name
> > is quite vague and is not intuitive what's the behaviour when it is set.
> > 
> > Document in kernel-parameters.txt what actually happens when nomodeset
> > is used. That way, users could know if they want to enable this option.
> > 
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > ---
> > 
> > (no changes since v1)
> > 
> >   Documentation/admin-guide/kernel-parameters.txt | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git Documentation/admin-guide/kernel-parameters.txt Documentation/admin-guide/kernel-parameters.txt
> > index 91ba391f9b32..ed9859fd0734 100644
> > --- Documentation/admin-guide/kernel-parameters.txt
> > +++ Documentation/admin-guide/kernel-parameters.txt
> > @@ -3521,6 +3521,10 @@
> >   			shutdown the other cpus.  Instead use the REBOOT_VECTOR
> >   			irq.
> > +	nomodeset	Disable kernel modesetting. DRM drivers will not be
> > +			loaded when this kernel boot parameter is used. The
> > +			simpledrm driver is the only DRM driver that loads.
> > +
> 
> That's misleading and to the general admin it might not be clear what
> simpledrm is about. Rather say something like
> 
>  Disable kernel modesetting. DRM drivers will not perform
>  display-mode changes or accelerated rendering. Only the
>  system framebuffer will be available for use. Requires the
>  firmware or boot loader to setup the display. Useful as
>  fallback, or for testing and debugging.

Yeah I think that's much clearer. With that wording:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Best regards
> Thomas
> 
> >   	nomodule	Disable module load
> >   	nopat		[X86] Disable PAT (page attribute table extension of
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
