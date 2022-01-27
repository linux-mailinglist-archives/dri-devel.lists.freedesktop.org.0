Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6E949E051
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF1210EF7C;
	Thu, 27 Jan 2022 11:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4D410EF7A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:11:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id s18so4063957wrv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 03:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q+ftSI0F0/Im74lDzb4er70a9ByF00QgQAuRt8psbLQ=;
 b=N5Fa1T8zfl0y2EjCaDtDX+8dseudhqkFzw/Vi14SNkB/atAy/QGQLlf19t0nUpYRXr
 P1n7AE9R37LW3Tfm/a1TXW86YKv6K0YNFmg/DKnf7HQuFb2VSyOSFbrWcYaDPgeK3yYe
 Uz2bykGO2FQD/+wh8ZoTsqjM+kiTtXY4KplsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Q+ftSI0F0/Im74lDzb4er70a9ByF00QgQAuRt8psbLQ=;
 b=fxbMcDVrlpB2qFpLlr9VkGHxPFZ5F+qLv90rRyiLkZQtOEcOgFikx+2ETZVpIBbE57
 Vp84dYjKEAIo4/mq5XLMt0f25oBZE4OkEJn6eESRouYaL4cMoxnqbx5yHzWDbp8vgAi2
 Yn5yRNlO0WPr6h3jK0+MRO8KrgVPdDkeqgBRP/zkE8kpsTgWDzw8At+p+7HR8K6Fj3A9
 XssI5oQPNxSICbUK8f53hvAuUPZ04VnoNXWW2cQ+YxwT8VcQCiO7yAITLFhm1V5uf+cj
 UJmNZgA86tX63cwwZHutMNTP53cY38/w71IeWF/Vv/2OS7CiYnIxOZuM60vjBw8DJg6i
 rgYQ==
X-Gm-Message-State: AOAM530TJ7zQAV5LOoZKZZI2+iUUXF3fjWmwpqsokuQeZkR5PZii038X
 Up7KIIw2NLjySZT/EFiIzLcI6A==
X-Google-Smtp-Source: ABdhPJwAFil42wR4BzzRzMkyK3qxmmts6cgadNUMSsg5Myn0J+D62I0vtwRvYDkdPdH775qoOOP+Tg==
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr2565698wrx.221.1643281868064; 
 Thu, 27 Jan 2022 03:11:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w8sm1873068wrq.3.2022.01.27.03.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:11:07 -0800 (PST)
Date: Thu, 27 Jan 2022 12:11:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
Message-ID: <YfJ9yWW+MH8N4r4A@phenom.ffwll.local>
Mail-Followup-To: Dmitry Vyukov <dvyukov@google.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>
References: <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com>
 <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com>
 <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
 <YfFZkgE3wfPXLpYA@kroah.com> <20220126144524.GB1951@kadam>
 <CAKMK7uGEFW4nd+W6PiT=uwSPz=pA6HKZXj6ePcdsAGiMDb3BxA@mail.gmail.com>
 <20220127062945.GC1951@kadam>
 <CACT4Y+bWMFK40o1gw6Ze7vkSKjAyBPNecjEBw+g7sMFbUZyXXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+bWMFK40o1gw6Ze7vkSKjAyBPNecjEBw+g7sMFbUZyXXA@mail.gmail.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Carlis <zhangxuezhi1@yulong.com>,
 Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 11:32:58AM +0100, Dmitry Vyukov wrote:
> On Thu, 27 Jan 2022 at 07:30, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Wed, Jan 26, 2022 at 11:31:02PM +0100, Daniel Vetter wrote:
> > > dOn Wed, Jan 26, 2022 at 3:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > >
> > > > The other advantage of staging is the I don't think syzbot enables it.
> > > > I guess it's easier to persuade Dmitry to ignore STAGING than it was to
> > > > get him to disable FBDEV.  :P
> > > >
> > > > The memory corruption in fbdev was a real headache for everyone because
> > > > the stack traces ended up all over the kernel.
> > >
> > > Uh Dmitry disabled all of FBDEV?
> >
> > No that's the opposite of what I meant.  STAGING is disabled in syzbot
> > and FBDEV is enabled.
> 
> Is there still any problem with syzbot config?
> syzbot configs are stored here:
> https://github.com/google/syzkaller/tree/master/dashboard/config/linux

CONFIG_FB and CONFIG_FRAMEBUFFER_CONSOLE are set, which are the things I
care about. The one exception is upstream-kcsan.config, which doesn't have
fbcon enabled.

Also looking through your fbdev drivers, really the only ones you want to
ever enable are:
CONFIG_FB_VGA16=y
CONFIG_FB_VESA=y
CONFIG_FB_VIRTUAL=y

The following isn't enabled, but I guess if you don't have EFI doesn't
make sense, otherwise you really want it:
CONFIG_FB_EFI=y

The below are enabled in some configs and should be ditched
CONFIG_FB_SIMPLE=y (use CONFIG_DRM_SIMPLEDRM instead, at least on kernels that have it)
CONFIG_FB_I740=y (you don't have this hw or I'm blown away, this last shipped 20 years ago)
CONFIG_FB_UDL=y (use CONFIG_DRM_UDL instead)
CONFIG_FB_UVESA=y (does modesets by calling into a userspace helper to run x86 vbios code, just don't)
CONFIG_FB_SMSCUFX=y (if you really have these then someone should port this to drm asap)
CONFIG_FB_CIRRUS=y (use CONFIG_DRM_CIRRUS_QEMU instead since I'm pretty sure you don't have a real cirrus pci card)

Also note that the simpledrm driver will eat all the firmware fbdev
drivers and unload them. So you need to run two configs to really cover
both sets of drivers in all cases.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
