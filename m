Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298CF5AFBF4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 07:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CA110E2DA;
	Wed,  7 Sep 2022 05:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6825C10E2DA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 05:50:48 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id r18so682411eja.11
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 22:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=485XNaRuLgo/QNXREYEE3jQFUNZFYuPUp6wyA324/uM=;
 b=lXKB2dOByaXJeWp6iOGRoZ4RmLPZsu3HxzhaDnY3VxlB4vCBN7dn35f8/Kl/9WVfZp
 RnVffudQwdTclZc8hX0wTIQ3eNqmQ/74gM+x+8fG1kkqBpBy6mPY35LZJNh1ZW/Ea3k5
 cuJP2GV1youCGhJ4/XV1pgAiMBhenRllw1BzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=485XNaRuLgo/QNXREYEE3jQFUNZFYuPUp6wyA324/uM=;
 b=dQunTsUM5Js4fmu2IP+4waL3pb7mextvYq+YQkJUipVhU9NAfY4aPIA+56rRFXC+Xg
 I5klNJzgNATv5Bnsqn3+f14o9JeOdWA+IZiLSS7VmVsoqD4Y02+bg4coXTNcgErDMhL5
 CmvK3gOXL2KxWgY1jumMhIbgylSEU8w0WveFK85J/vf3td2drgE2obyTD1rNK6z1nCo2
 APZgNvsgdY+S/OIT+oeWqVIYTQlCjq2WEHYLm2NQy5MxBNzcc4i4hIaqsCq3s+j4wkjs
 48Pc1YYiEUOWfk0+zPpvMX1RDq4QmCqOiYhKA/ss9VFPnkgdL/dhpdmLitou0tz04tZg
 0mMw==
X-Gm-Message-State: ACgBeo1ck2TJxJlLGE4deChS+zRpSjcJw3vR009j5Hj0Ayv+9ejqepUr
 5qTiqCqGxcm3wf1wetVAO0jUzQ==
X-Google-Smtp-Source: AA6agR6IS7WtWkmlIgHja/YyJbP8C4ZcmZo3NwhtbPvtpZSOQuctBQnsweC1nqC8Sxd6HQmJa9tQkQ==
X-Received: by 2002:a17:907:2e01:b0:731:1eb0:b9ff with SMTP id
 ig1-20020a1709072e0100b007311eb0b9ffmr1237025ejc.728.1662529846962; 
 Tue, 06 Sep 2022 22:50:46 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 eh13-20020a0564020f8d00b0044f0c01196esm887979edb.65.2022.09.06.22.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 22:50:46 -0700 (PDT)
Date: Wed, 7 Sep 2022 07:50:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: Re: build failure of next-20220906 due to 396369d67549 ("drm: vkms:
 Add support to the RGB565 format")
Message-ID: <YxgxNPYl5LhKpHrk@phenom.ffwll.local>
Mail-Followup-To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
References: <YxducgSzR6/zyHD7@debian>
 <CADVatmNfc1YT02v5-FaMoGN==MOx5ZJ=o8YMQAH19Gvf91betA@mail.gmail.com>
 <8e4350df-0c73-6ca2-a25f-28a40a1856db@gmail.com>
 <YxgwdGtNTnDdIqAv@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxgwdGtNTnDdIqAv@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, linux-next <linux-next@vger.kernel.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 07:47:32AM +0200, Daniel Vetter wrote:
> On Tue, Sep 06, 2022 at 08:35:49PM -0300, Igor Matheus Andrade Torrente wrote:
> > On 9/6/22 18:26, Sudip Mukherjee wrote:
> > > On Tue, Sep 6, 2022 at 4:59 PM Sudip Mukherjee (Codethink)
> > > <sudipm.mukherjee@gmail.com> wrote:
> > > > 
> > > > Hi All,
> > > > 
> > > > The builds of next-20220906 fails for mips, xtensa and arm allmodconfig.
> > > > 
> > > > The errors in mips and xtensa are:
> > > > 
> > > > ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > > 
> > > > The error in arm is:
> > > > 
> > > > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > > ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > > 
> > > > 
> > > > Trying to do a git bisect to find out the offending commit.
> > > 
> > > git bisect points to 396369d67549 ("drm: vkms: Add support to the
> > > RGB565 format")
> > 
> > Are these architectures incapable of doing 64bits int division?
> 
> Yeah 32bit archs in general can't do that, and you have to use the right
> macros because otherwise gcc falls back to its own built-ins, and those
> don't exist in the kernel since the kernel isn't (cannot!) linked against
> any userspace library.
> 
> For pretty much this reasons it's really good to build test against 32bit
> x86, or probably more relevant these days, 32bit arm.

Forgot to add: include/math.h for all your division needs.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
