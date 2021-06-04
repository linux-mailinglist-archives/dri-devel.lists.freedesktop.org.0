Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2DB39AFDB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 03:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FF76F555;
	Fri,  4 Jun 2021 01:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1356F555
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 01:32:56 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id q25so6284129pfh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 18:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UiAxhnimbmXnxAuRj/8TCD8fSvPmZD3AhoE3rfTP8PM=;
 b=D2KZ3evI4gHDjz1em6dcmAuOicfefbtBAH177EkHOnfqibkq26bZn4+fHwr02f6avk
 OLBhrQtdWRppWr2xPg3yJTInAgm29b0++w7RICeZsf82Z/wICMH2YiM9cqyBDJv5Z7/J
 shVnpyjKNf/IODiDeQVKD4rvk5pl9M0KL1SS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UiAxhnimbmXnxAuRj/8TCD8fSvPmZD3AhoE3rfTP8PM=;
 b=REkUFVjf68ic545wQvVkSe+zsHQNfPrUm3TLqm/TdUcIl5VvTipvhh7efeCIzMGViM
 127uteDs2rjXcDsRaIx2MRxYqVMzyY+ZQtaMJzbMI3pOOGtFjEthYQqU7/l0gYoMx2zO
 0BEDPU6Z4xpEDrxln1l0XiI2cArpRWxAZav+c9lUbwXrdOVb/PmtONvXAx8e5RawQOhT
 u4Jf5xG8JPP8XhZLHVUcu33qK1KJnfs2VDlg52NZbnRuT6E8r3XMnTNvlGhNLUHUVRai
 lpc6mScubwtWOW3gootxqfzVcu3bL14OEXtF8fVSH9sHGzRNJvQ6UyIrweemj4kEHrHP
 90mA==
X-Gm-Message-State: AOAM532O+L++qvnGQhcObuXxAQ21CAySGCJ1XfQpVYOoDOCp6IYOkmK4
 glNwsPg+XqF9a5bdZyu3pQKRAg==
X-Google-Smtp-Source: ABdhPJwzKItwTs5aNFact08HbH8Xrrtq5lTEOKEIPhbLiqcwnb646XtOtDqHY+HE/Kqw/ijoFehkZw==
X-Received: by 2002:a63:1a49:: with SMTP id a9mr2301475pgm.63.1622770376209;
 Thu, 03 Jun 2021 18:32:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z6sm266653pfr.99.2021.06.03.18.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 18:32:55 -0700 (PDT)
Date: Thu, 3 Jun 2021 18:32:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends
Message-ID: <202106031832.1868B1C@keescook>
References: <20210603215819.3904733-1-keescook@chromium.org>
 <CAKMK7uG7tDVUV3cVmtYMFdwVx1SuEWh6i+VsQ3nLP0Rb=-f0aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uG7tDVUV3cVmtYMFdwVx1SuEWh6i+VsQ3nLP0Rb=-f0aw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Emma Anholt <emma@anholt.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 12:30:00AM +0200, Daniel Vetter wrote:
> [gmail is funny]
> 
> On Thu, Jun 3, 2021 at 11:58 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > VEXPRESS_CONFIG needs to either be missing, built-in, or modular when
> > pl111 is modular. Update the Kconfig to reflect the need.
> >
> > Cc: Emma Anholt <emma@anholt.net>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Fixes: 4dc7c97d04dc ("drm/pl111: depend on CONFIG_VEXPRESS_CONFIG")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/gpu/drm/pl111/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> > index c5210a5bef1b..b84879ca430d 100644
> > --- a/drivers/gpu/drm/pl111/Kconfig
> > +++ b/drivers/gpu/drm/pl111/Kconfig
> > @@ -2,7 +2,8 @@
> >  config DRM_PL111
> >         tristate "DRM Support for PL111 CLCD Controller"
> >         depends on DRM
> > -       depends on VEXPRESS_CONFIG
> > +       depends on ARM || ARM64 || COMPILE_TEST
> > +       depends on !VEXPRESS_CONFIG || VEXPRESS_CONFIG=DRM
> 
> I thought the canonical way to represent optional dependencies was
> depends on FOO || FOO=n

Ah-ha! So it is:

drm/Kconfig:    depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
drm/Kconfig:    depends on FB_SIS || FB_SIS=n
drm/msm/Kconfig:        depends on QCOM_OCMEM || QCOM_OCMEM=n
drm/msm/Kconfig:        depends on QCOM_LLCC || QCOM_LLCC=n
drm/msm/Kconfig:        depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n

I'll resping and retest. Thanks for the pointer!

-Kees

-- 
Kees Cook
