Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0369139AD23
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BF46EE8D;
	Thu,  3 Jun 2021 21:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D9E6EE8B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 21:48:04 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 d5-20020a17090ab305b02901675357c371so5938783pjr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 14:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QqXRTpXf7sx1+OokWNkO2qG4MJggJMiTrRyc0ECoLWE=;
 b=hkT3hbUI1YBMsByk48wopSF97/Fwy4pqJHtvWITZ2dTFR/Rxwdg3us4HvlF8PtKaH+
 tpfSmq74QsTvxl7eyQQ+CN2eythJ0AorLh7v14h69oPro+ldUv5+V7LBVAEItcqmzABg
 j8hmYXZONQqIDFKrLWUHhGTggeoxM3keaJHTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QqXRTpXf7sx1+OokWNkO2qG4MJggJMiTrRyc0ECoLWE=;
 b=lTYuyvna38XCxnJhf0wM8sXldrfZtNtYiGMOLu+OoSM5f9yRRn+AbLDcdkMtvD2MXR
 sbcDXZk7a5wU9EnyhVTzSaLdrfYsmVIfq+MjDWrIaHGt6zYljbnOhB8mBAzYoGlxRKm9
 HDpdcYLHLoFgpxOgY8cJVN1dSavsfhhXe+MhzQ7t3hFp6/PR/ChX06NjS4RN6JW87py7
 YJ6lk9dy5nai6xtigSeAKtna9qURab1CHOYLlSxcavtKTx6g2JBk7LrM0VW84Twqj2yE
 MnPi5FegieAz4aBr2eW9yRvux+H3ihZzdzN9WlbZsfKnAVok8qbA0ze1D3A7ksmPJsXo
 1Zvg==
X-Gm-Message-State: AOAM533U4CFvCuvAfyL2lPK2LDc4dH9JQdSwbqqXPAyBahckIhdQSIXp
 LMClEI8s2g9u2ajWC9YGyvoogw==
X-Google-Smtp-Source: ABdhPJwnxxBuRrDoQVbRE7Noh8VcVCpr7l9zfI0XLSh6GWGnTE5M/mMzheRi1/2Aks7qGmHQeNoYMw==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id
 mh18mr1334461pjb.148.1622756884311; 
 Thu, 03 Jun 2021 14:48:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 141sm49184pgf.92.2021.06.03.14.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:48:03 -0700 (PDT)
Date: Thu, 3 Jun 2021 14:48:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
Message-ID: <202106031447.09F7AE9EE4@keescook>
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-4-keescook@chromium.org>
 <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
 <CAKMK7uFBQk+KA0fPdjkB9=7By2a9V5i=u84ufO+n3dmjayq+vw@mail.gmail.com>
 <202106031357.BE2A09DA8F@keescook>
 <202106031422.FD9E3C5755@keescook>
 <CAKMK7uG8ZiToP2vFsr7TuhntWWh0yiaHkwU5mx5EaESoy+tTHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uG8ZiToP2vFsr7TuhntWWh0yiaHkwU5mx5EaESoy+tTHQ@mail.gmail.com>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 kernel test robot <lkp@intel.com>, Emma Anholt <emma@anholt.net>,
 Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>, freedreno <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 11:41:01PM +0200, Daniel Vetter wrote:
> On Thu, Jun 3, 2021 at 11:29 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Jun 03, 2021 at 02:19:52PM -0700, Kees Cook wrote:
> > > On Thu, Jun 03, 2021 at 09:19:42PM +0200, Daniel Vetter wrote:
> > > > On Thu, Jun 3, 2021 at 8:43 PM Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Wed, Jun 2, 2021 at 4:53 PM Kees Cook <keescook@chromium.org> wrote:
> > > > > >
> > > > > > Avoid randconfig build failures by requiring VEXPRESS_CONFIG:
> > > > > >
> > > > > > aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
> > > > > > pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'
> > > > >
> > > > > pl111_vexpress_clcd_init() starts with:
> > > > >
> > > > > if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
> > > > >                 return -ENODEV;
> > > > >
> > > > > Isn't that supposed to be enough to avoid an undefined reference?
> > >
> > > Ah! I missed that when reading the code. I see the problem now. It's
> > > because of:
> > >
> > > CONFIG_VEXPRESS_CONFIG=m
> > > CONFIG_DRM_PL111=y
> > >
> > > I think the right fix is:
> > >
> > > diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> > > index 80f6748055e3..662fc38f92ba 100644
> > > --- a/drivers/gpu/drm/pl111/Kconfig
> > > +++ b/drivers/gpu/drm/pl111/Kconfig
> > > @@ -3,6 +3,7 @@ config DRM_PL111
> > >       tristate "DRM Support for PL111 CLCD Controller"
> > >       depends on DRM
> > >       depends on ARM || ARM64 || COMPILE_TEST
> > > +     depends on VEXPRESS_CONFIG=y || VEXPRESS_CONFIG=DRM
> >
> > Oops, no, I had this backwairds:
> >
> >         depends on !VEXPRESS_CONFIG || VEXPRESS_CONFIG=DRM
> 
> Can you pls throw this into an incremental patch on top of
> drm-misc-next? It's a non-rebasing tree and all that (linux-next
> should have it next day too I guess).

Ah! Yes, sorry. I wasn't sure if you'd reverted it yet. One moment...

-Kees

-- 
Kees Cook
