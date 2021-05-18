Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900F33870C9
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 06:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F036E5CC;
	Tue, 18 May 2021 04:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF6A6E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 04:45:23 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id c17so6504696pfn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 21:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=0uTzP8bfDg5xGex7AZegUPneohvxogqMnDFj+4FfEqE=;
 b=Uj+rH+KO3nKG0sTNvSoZfr7oAMEbLiCRfx+dI+YvS9ViwW7vMU7R/wEbCx/DAwVRbV
 vnoJqVOlfgufisoz2PjrsiqgH3nn+6Aq0eogD+djtDgyvqlEVR7okpF/Aw1nXMmkRHyZ
 9jmypi/wehgzQ6+VqWowcE17ZlB4N7qT8SbPvG4lAVYT+tg5uEiGG3a5jMW3XbnPiU9d
 NVY6IU8uLIH5ovIHavoWVTl5Lp+mG0RWOrItfiLD5Cg0Z49+7JJc7B8OGkQZRtbj05kc
 KEhMVTddJ/Vyfqi3K2sq+sqbTXA1hD3JcZntT69xc3v5khcvPg8WJpmJh7cgT69gGz0v
 0KVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=0uTzP8bfDg5xGex7AZegUPneohvxogqMnDFj+4FfEqE=;
 b=GWYjmAC0nfMXTKxRgKfAe1kpqtR5vWzi1/rM8N7yuNsXBWgbFeGypvV4faESDBx0nH
 mvx/qjb4yqDAFqOjVIedUDso9iB2IMNyCJeHHSbZZnA5LrNaJgiBEuRNSQVzePXL2b/b
 Prt/bB5G6Jm64xV8eg863rrUOOfChDWL+F+mCw55tCZD/QF2jrZDK38ZvsXuU6uQk0rx
 rDXwnJE+LGyIT4XgceOfY1ND1gDnQ3RNW4A0WPiMmMrEdCybyiJhgGyq1zFy4cn52B26
 Y2wpBTTfNENYha2QgoJ8g4nnUgzd8p45dOmubLwrkSlfvnTn5ru1zymB0nFngxnwT8f1
 Y6vA==
X-Gm-Message-State: AOAM531LxoZM0kVXpFKgzFjpdAaemntoRkWE4LaJogZab1dfY6MzIee/
 RO1WUZLaSL+G6OojiX9BNjM=
X-Google-Smtp-Source: ABdhPJxDSbqeG9WueFoP/nL0tlNMtKISInDtOmc+0gdFC6b1lAntImV5v77eugpnt0GOi+wxUrDnIg==
X-Received: by 2002:a63:d45:: with SMTP id 5mr3147016pgn.72.1621313123515;
 Mon, 17 May 2021 21:45:23 -0700 (PDT)
Received: from [192.168.1.7] ([106.212.13.216])
 by smtp.gmail.com with ESMTPSA id np1sm806576pjb.13.2021.05.17.21.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 21:45:23 -0700 (PDT)
Message-ID: <5476fe6d3ad2fd243b58778e5d9397aeb85f1a97.camel@gmail.com>
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Add maintainer for hyperv video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Wei Liu <wei.liu@kernel.org>
Date: Mon, 17 May 2021 21:45:22 -0700
In-Reply-To: <20210517172503.ytpuucwphtwhcgsi@liuwe-devbox-debian-v2>
References: <20210517115922.8033-1-drawat.floss@gmail.com>
 <20210517115922.8033-3-drawat.floss@gmail.com>
 <20210517172503.ytpuucwphtwhcgsi@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-hyperv@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-05-17 at 17:25 +0000, Wei Liu wrote:
> On Mon, May 17, 2021 at 04:59:22AM -0700, Deepak Rawat wrote:
> > Maintainer for hyperv synthetic video device.
> > 
> > Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>
> > ---
> >  MAINTAINERS | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index bd7aff0c120f..261342551406 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6077,6 +6077,14 @@ T:       git
> > git://anongit.freedesktop.org/drm/drm-misc
> >  F:     Documentation/devicetree/bindings/display/hisilicon/
> >  F:     drivers/gpu/drm/hisilicon/
> >  
> > +DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE
> > +M:     Deepak Rawat <drawat.floss@gmail.com>
> > +L:     linux-hyperv@vger.kernel.org
> > +L:     dri-devel@lists.freedesktop.org
> > +S:     Maintained
> > +T:     git git://anongit.freedesktop.org/drm/drm-misc
> > +F:     drivers/gpu/drm/hyperv
> > +
> >  DRM DRIVERS FOR LIMA
> >  M:     Qiang Yu <yuq825@gmail.com>
> >  L:     dri-devel@lists.freedesktop.org
> > @@ -6223,6 +6231,14 @@ T:       git
> > git://anongit.freedesktop.org/drm/drm-misc
> >  F:     Documentation/devicetree/bindings/display/xlnx/
> >  F:     drivers/gpu/drm/xlnx/
> >  
> > +DRM DRIVERS FOR ZTE ZX
> > +M:     Shawn Guo <shawnguo@kernel.org>
> > +L:     dri-devel@lists.freedesktop.org
> > +S:     Maintained
> > +T:     git git://anongit.freedesktop.org/drm/drm-misc
> > +F:     Documentation/devicetree/bindings/display/zte,vou.txt
> > +F:     drivers/gpu/drm/zte/
> > +
> 
> What is the section about? Is this a mistake?

yes this is a mistake during rebase. Will send correct patch shortly.

> 
> Wei.


