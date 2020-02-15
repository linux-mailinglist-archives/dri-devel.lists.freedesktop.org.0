Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DA315FE51
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 13:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D746E20B;
	Sat, 15 Feb 2020 12:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FDD6E20B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 12:21:36 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r11so14105451wrq.10
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 04:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bnqvK6ZJoVnVdqtPxqhk4utKspx6JMigFnvktxputLw=;
 b=fCn9JRDSpHqnCG/rc/S4LMhrJpvfI52XFl698EUZJVZD7eVnt5Jr6w+JxlB1TNu1nA
 PqU49ZUFCvq+8LpuB1hxBKtrth/1tAeHs83QkabrBjR+V1Vk4/tNiKsbB0VFs9IkXbw1
 UtSp3+sMxqxCu5wxfT9OCz09jwfvXdm4bIpio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bnqvK6ZJoVnVdqtPxqhk4utKspx6JMigFnvktxputLw=;
 b=V9LUfVDYh9iNER8SgWk6MRqKpfIaRSKILsyQip+roN3CCT4pqmA2VvIpqT0eiTebTm
 EkC+aj/kCqtyHLEdsHzPl+6jnbmv8ct94294OHua72pyxQaOSTz9Us9aDvWyJt+kM1NC
 59FLO+yxI4Uz2U4XY60XHFwsOj9IUrNuRQrZiIMgcShX8yyLyASTNVPezBHOjiCPaLes
 x2m2gS0C5rz3YNsrYZvqLhnIyTTjoKXGbzkYomkcdut4De/U9MtDENP+1RjegBKeHIcH
 CJ91bWgBQmfujw1YLyz34XHKS9Vr0TPE1JuRWKqLQghutkS4UoAB/xlcS4wDlfPwMUN6
 VN0A==
X-Gm-Message-State: APjAAAXgHpaUGY7MkXXzpKcr+oiDqLs1+vHfzH/d4yf2GE8WgDGJ29a4
 G/lQG3GKSziOVkNYAi4aDoLtYQ==
X-Google-Smtp-Source: APXvYqwRlHC7KnJz/95AhhhrwTLLlg+M9taFyhstDbCv0tf19h+LI73wRejbMYL+bku/AUDTSoKG/A==
X-Received: by 2002:adf:97d6:: with SMTP id t22mr9806739wrb.407.1581769294888; 
 Sat, 15 Feb 2020 04:21:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 4sm11216619wmg.22.2020.02.15.04.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 04:21:34 -0800 (PST)
Date: Sat, 15 Feb 2020 13:21:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] drm/atomic-helper: fix kerneldoc
Message-ID: <20200215122131.GA2363188@phenom.ffwll.local>
References: <20200214081340.2772853-1-daniel.vetter@ffwll.ch>
 <20200215101936.0ca2c4d1@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200215101936.0ca2c4d1@collabora.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 15, 2020 at 10:19:36AM +0100, Boris Brezillon wrote:
> On Fri, 14 Feb 2020 09:13:40 +0100
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> 
> > Just a tiny copypasta mistake.
> > 
> > Fixes: 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

Thanks for taking a look, patch applied.
-Daniel

> 
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > index 33141d2cdad4..8fce6a115dfe 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -635,7 +635,6 @@ EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
> >   * drm_atomic_helper_bridge_reset() - Allocate and initialize a bridge state
> >   *				      to its default
> >   * @bridge: the bridge this state refers to
> > - * @state: bridge state to initialize
> >   *
> >   * Allocates the bridge state and initializes it to default values. This helper
> >   * is meant to be used as a bridge &drm_bridge_funcs.atomic_reset hook for
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
