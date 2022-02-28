Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C014C651C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B788410E3B9;
	Mon, 28 Feb 2022 08:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7461B10E3B9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 08:58:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u1so14188660wrg.11
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 00:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/y009X9Bs/uBtsAyqsWmNgOmQvbRm/2TAdEPiCKsoLs=;
 b=CnDbvTmIEzWlWZEh2YgBxE7r4DwMPTw3fMUJqI+YVtaEY5k/lbkOaY5y8aYDf2tToz
 bQD2IGWH3xHH4wPTJxvD7seZWae30GXtMtAZAf8Mb5b4hf6h0VHwY1UsAVatkRdEpUtz
 yCugewxkkD6YySAE8iHr7MceuG4bt+cTytxWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/y009X9Bs/uBtsAyqsWmNgOmQvbRm/2TAdEPiCKsoLs=;
 b=5jOraMX/ZVnd4cTPdaEycwT7Rd0pGoYGMFAP+db6j7RJ9fPoaR/Tjtf6B6ktSX71nO
 G4rWb9w3uB6jicnrcF5ao88u2HolmqTr6MLuj34Y2oSMkpjCMd1gdq2moEV7AuP2zvcM
 kcvVe1Qgn8wS7q/oO3lx1+SwGXum5BCLLsNpwZHNGD9De/GAzntObxv7aq3hzWGKh7sO
 udvVEiZ6+tTjHRfJqZWXTj2ERxFD4zk/eee+ZmVxd13+HUfn4Mp3/MC7YI2A5/W92lQu
 +M5NjxSkecZdPG6MnPWdfsazo0kzfoSyY7vpRtD5FCihEmwnqlDvxw+ItW5E+s/1tee3
 +mZw==
X-Gm-Message-State: AOAM53161Sxz01wRoznpeAwD7j356hBwcEMFzF/iLk10Uw8o1E4frIZg
 aIdNVxTh8AE5c+VGH+bKhma/dw==
X-Google-Smtp-Source: ABdhPJyAPOf4dDpRutWrYmw9lOwwkbJZ2DtWpjQgC6uHl6q+pWCsxbOdEzT/CDdE/oRcaWURv1Omog==
X-Received: by 2002:adf:a142:0:b0:1ed:bdb0:5297 with SMTP id
 r2-20020adfa142000000b001edbdb05297mr15593003wrr.434.1646038709996; 
 Mon, 28 Feb 2022 00:58:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a5d4dc4000000b001d8e67e5214sm10034487wru.48.2022.02.28.00.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 00:58:29 -0800 (PST)
Date: Mon, 28 Feb 2022 09:58:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH] drm/todo: Update panic handling todo
Message-ID: <YhyOsyvnRa4kJZgR@phenom.ffwll.local>
References: <20220224125934.3461478-1-daniel.vetter@ffwll.ch>
 <20220224132425.3463791-1-daniel.vetter@ffwll.ch>
 <34259fd5-6c04-015d-d7cd-8954399a63d1@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34259fd5-6c04-015d-d7cd-8954399a63d1@igalia.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 10:53:01AM -0300, Guilherme G. Piccoli wrote:
> On 24/02/2022 10:24, Daniel Vetter wrote:
> > Some things changed, and add two useful links.
> > 
> > v2: Also include a link to the QR encoding work. Plus review from
> > Javier.
> > 
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: gpiccoli@igalia.com
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> 
> Hi Daniel, thanks for the improvement - much appreciated!
> 
> Below a comment inline; other than that, feel free to add my:
> Reviewed-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> 
> Cheers,
> 
> 
> Guilherme
> 
> > [...]
> >  
> > -* There's also proposal for a simplied DRM console instead of the full-blown
> > -  fbcon and DRM fbdev emulation. Any kind of panic handling tricks should
> > -  obviously work for both console, in case we ever get kmslog merged.
> > +* Encoding the actual oops and preceeding dmesg in a QR might help with the
> 
> Email client complains about "preceeding" word - misspelled maybe?

Indeed, I've fixed this while applying.
-Daniel

> 
> > +  dread "important stuff scrolled away" problem. See `[RFC][PATCH] Oops messages
> > +  transfer using QR codes
> > +  <https://lore.kernel.org/lkml/1446217392-11981-1-git-send-email-alexandru.murtaza@intel.com/>`_
> > +  for some example code that could be reused.
> >  
> >  Contact: Daniel Vetter
> >  

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
