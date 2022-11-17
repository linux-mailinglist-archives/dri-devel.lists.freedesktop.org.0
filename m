Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729A862E970
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 00:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB66C10E6C0;
	Thu, 17 Nov 2022 23:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29EA10E6BF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 23:19:25 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id z26so3269011pff.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SBG7oyaijsCs+AkyB480R7surFEt7JkA2k2VbS/kZYQ=;
 b=JchDDL5/DOlP6j9lUMlspTqgaFV4s9nwIJAsn96fhlHO8vmv5OjKer7ndNaH2Cz7xY
 angRwTwMUaQhTZSFCg5SSReYBynCN5+lVd/BZbbmZmTbg32Qo/D4UYmdS5qJQ4EuCLtb
 LRcO4Rhcd6sxfjWlyGEHMkaxsvRbTcjQPJJxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBG7oyaijsCs+AkyB480R7surFEt7JkA2k2VbS/kZYQ=;
 b=BE+I7IEO1Leseb5wfGYD3Plfm1NPBhx+Sqsw6eDJnXFfstzp7NbkzuZCXOWFzUloXj
 vmGpd0KGT3zylrqugt3xvDwRI0r3IBIJq+PaIUIch5sSiKNpLot3OSB5RGEi3gtjNRMf
 8MEFilJf7gIfBjtlThCiIyDB7Ge2OO40Ar5kLkkEZEkhC69WD3jL8VTxPX7QnIsWIUky
 fGWD50y7KlS8L4D4Xil492bLRoFFllMB4FsK3kvAmEGKgSA94/a4xq4MI+yNgCrNbqM7
 SeXbPpmZRRwubacOJe4ZXG7l9w7foVwr/q9RjQQsUIqRHrVT84Q07cSp8jle564X6ot6
 Nwug==
X-Gm-Message-State: ANoB5pn+tEki87QloNNzJ7SFUPmLJXecJvDgXljZ2JWSpC5U5gARy4PR
 Z21t3UNi7CC4Fx8YFxZQNK0wbQ==
X-Google-Smtp-Source: AA0mqf5gYHTV4d1cJmSvcoc5/KxPzeS1y0Zb1fIaJiX9fjzOdUIlsRe1Bo/bjk0EkMpAHBf2HyMu/w==
X-Received: by 2002:a65:4c88:0:b0:477:55c:3ff4 with SMTP id
 m8-20020a654c88000000b00477055c3ff4mr4055311pgt.442.1668727164990; 
 Thu, 17 Nov 2022 15:19:24 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 135-20020a62178d000000b0056ba6952e40sm1684386pfx.181.2022.11.17.15.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 15:19:24 -0800 (PST)
Date: Thu, 17 Nov 2022 15:19:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] drm/fsl-dcu: Fix return type of
 fsl_dcu_drm_connector_mode_valid()
Message-ID: <202211171518.88D58BBE@keescook>
References: <20221102154215.78059-1-nathan@kernel.org>
 <Y3K7GbHAMZPdY243@distrobox-ZFeO0pwFho.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3K7GbHAMZPdY243@distrobox-ZFeO0pwFho.thelio-3990X>
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
Cc: llvm@lists.linux.dev, Tom Rix <trix@redhat.com>,
 Alison Wang <alison.wang@nxp.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 03:03:05PM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> On Wed, Nov 02, 2022 at 08:42:15AM -0700, Nathan Chancellor wrote:
> > With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> > indirect call targets are validated against the expected function
> > pointer prototype to make sure the call target is valid to help mitigate
> > ROP attacks. If they are not identical, there is a failure at run time,
> > which manifests as either a kernel panic or thread getting killed. A
> > proposed warning in clang aims to catch these at compile time, which
> > reveals:
> > 
> >   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c:74:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
> >           .mode_valid = fsl_dcu_drm_connector_mode_valid,
> >                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   1 error generated.
> > 
> > ->mode_valid() in 'struct drm_connector_helper_funcs' expects a return
> > type of 'enum drm_mode_status', not 'int'. Adjust the return type of
> > fsl_dcu_drm_connector_mode_valid() to match the prototype's to resolve
> > the warning and CFI failure.
> > 
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> > Reported-by: Sami Tolvanen <samitolvanen@google.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> > index 4d4a715b429d..2c2b92324a2e 100644
> > --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> > +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> > @@ -60,8 +60,9 @@ static int fsl_dcu_drm_connector_get_modes(struct drm_connector *connector)
> >  	return drm_panel_get_modes(fsl_connector->panel, connector);
> >  }
> >  
> > -static int fsl_dcu_drm_connector_mode_valid(struct drm_connector *connector,
> > -					    struct drm_display_mode *mode)
> > +static enum drm_mode_status
> > +fsl_dcu_drm_connector_mode_valid(struct drm_connector *connector,
> > +				 struct drm_display_mode *mode)
> >  {
> >  	if (mode->hdisplay & 0xf)
> >  		return MODE_ERROR;
> > 
> > base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
> > -- 
> > 2.38.1
> > 
> > 
> 
> Could someone please pick this up so that it makes 6.2? We would like
> to try and get this warning turned on so that it can catch more
> potential run time issues at compile time but that can only happen when
> all the warnings are fixed.

I'll pick this up tomorrow if no one else snags it. :)

-- 
Kees Cook
