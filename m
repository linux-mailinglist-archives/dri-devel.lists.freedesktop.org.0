Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D332FF03E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 17:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAB46E90F;
	Thu, 21 Jan 2021 16:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55EA6E90F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 16:28:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id 6so2356921wri.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 08:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bw+amxMsPdjnjO24csa0hRU8D4xFmuP7NGeXgyi/AfI=;
 b=EJxI/3Jb4TfQx4iSCIeWaAJbWgJ7eLrsEQvSm2ojrnz44I9St0CZHmtVRCf8DX0+ny
 +Z2j/Q6c44mIUhYloGeX8UVrvZukRHhncZFCLrqjA400Wyx6xaYlMRmBPpK1YWYpt+6D
 08Bt9/OqWhcjZ0mtNHbU7WoKVOP8Zkuz8epZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bw+amxMsPdjnjO24csa0hRU8D4xFmuP7NGeXgyi/AfI=;
 b=BSz3wnmYXM8JUffKQnUx4JaRUAeTqapPY5DEmpaVO6+S1VEbypHWLLiNU6QjsIG5ZS
 M5DQY/VmRYFP8w3FXhe3yDUuGGOITWR3dLJlXr3Zbl+XRhBqHznqlxm8ZGlm9RPoe9/q
 RUVXLshhwAsjN1Tk9yyeVj2++OeoTtHZXJofgg7nybT5IrCi1b4h8lUqChoKd4he0bAO
 ATUy7NeXUe0bEcWHoUv+6pRK4yUGDqglfliAFbq11NmGp/Mg+zLHaArDPNDa502WhWtb
 CtK2YWZRGBFPRPS+TLSoYuthu9LFdwXLRGevrB8tR7M3nySgfx6GzwWD37yNq0V1UFJB
 yAZQ==
X-Gm-Message-State: AOAM5334EF9Xsuctnzy05agg8vohllfGTnDtOODWh0okG0trR924tBAC
 k/1zevpScfh5OpYx4Wrgc8ST5Q==
X-Google-Smtp-Source: ABdhPJxH/2QsqGnBvyhO6UbwA+YTUA7O9oVFLJwtd5B2+ub9YVAgp7rvhzTHX0jCfaE5X3lu3gUObA==
X-Received: by 2002:a5d:6842:: with SMTP id o2mr285709wrw.138.1611246532661;
 Thu, 21 Jan 2021 08:28:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c78sm8653101wme.42.2021.01.21.08.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 08:28:51 -0800 (PST)
Date: Thu, 21 Jan 2021 17:28:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm: Update todo.rst
Message-ID: <YAmX+426YN63z9D+@phenom.ffwll.local>
References: <20210121112919.1460322-1-daniel.vetter@ffwll.ch>
 <20210121132153.a4kialnb5pnqcaxq@gilmour>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121132153.a4kialnb5pnqcaxq@gilmour>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 02:21:53PM +0100, Maxime Ripard wrote:
> Hi Daniel,
> 
> On Thu, Jan 21, 2021 at 12:29:19PM +0100, Daniel Vetter wrote:
> > Interrnship season is starting, let's review this. One thing that's
> 
>   ^ internship
> 
> > pending is Maxime's work to roll out drm_atomic_state pointers to all
> > callbacks, he said he'll remove that entry once it's all done.
> 
> I plan on sending it by the end of the week

Typos fixed and pushed with your irc-ack.
-Daniel

> 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  Documentation/gpu/todo.rst | 28 +++++++++++++++-------------
> >  1 file changed, 15 insertions(+), 13 deletions(-)
> > 
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 009d8e6c7e3c..492768dd2fd9 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -577,20 +577,24 @@ Contact: Daniel Vetter
> >  
> >  Level: Intermediate
> >  
> > -KMS cleanups
> > -------------
> > +Object lifetime fixes
> > +---------------------
> > +
> > +There's two related issues here
> > +
> > +- Cleanup up the various ->destroy callbacks, which often are all the same
> > +  simple code.
> >  
> > -Some of these date from the very introduction of KMS in 2008 ...
> > +- Lots of drivers erroneously allocate DRM modeset objects using devm_kzalloc,
> > +  which results in use-after free issues on driver unload. This can be serious
> > +  trouble even for drivers for hardwared integrated on the SoC due to
> 
>                                   ^ hardware?
> 
> > +  EPROBE_DEFERRED backoff.
> 
> Thanks!
> Maxime



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
