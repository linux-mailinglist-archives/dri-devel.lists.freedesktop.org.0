Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2265AFBED
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 07:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0917010E2AA;
	Wed,  7 Sep 2022 05:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6861910E2E9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 05:47:36 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id nc14so27899765ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 22:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=YtQGFFP4vhfdUxZhJrZK2jqmDRC5K71pRjy06kzufEA=;
 b=D4MSYe3HuhjfTCnhlWTUWIOL1gN6qSsC/IeXJ+WxDvobPcnhhWhthaLWp0Je7KM9C9
 xxNzLsp/6fSpM6Eo3j+14h/npT0wAePR8BbgHcgnA0v9OHztxQZcZ2kh5hfdkdywI7gT
 OoVvmsCvGYfkaVg+Um+yGHT49wN9zNqGX2DyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YtQGFFP4vhfdUxZhJrZK2jqmDRC5K71pRjy06kzufEA=;
 b=uGqrxnjEt9A8DUODiXsSZAfNDf4ikWxXHHbQr+cCwYJFLi2zhlcdXL9fo5crtuJkAS
 /iD3Rj6Ixz7+XAY/6AD+4zLnNKK+xaStyorXy+jokUpiPrnJifiEeMGjah//8cDMBeXh
 S18yB2tf2QPwvos7YUWODxyKuXaIQjP2pw90zqgqYxsFkfG0W8vsBoc3CrLPxoJabdb0
 7KKpMqeCpg0AaD7U4w4m5ji1lVBQm0wCW8I436oTxEJrj/uMkDk6OG2NhyC+Chz/SBKc
 6ZF3WrBq4Lwi6biwHP9vFYhKv6+O3ADWBkAa1n2BpxSJfK223kXWpAhQZMcUuK3wd154
 tR4Q==
X-Gm-Message-State: ACgBeo12pWvM/9d3/gcvBf7CR/Kmv5D9MxVxNZ7qaVtYEdnWepN4fyn/
 g6lp2TE65F/Foih4CWWencU3QA==
X-Google-Smtp-Source: AA6agR6l0Nv5Ojf99/mgkxk+bfFH+4lR+cupi/L8llhX+dNx0PezxjkLx3qkT51MqwmWQ0AJP9vECQ==
X-Received: by 2002:a17:907:6d8a:b0:73b:d9e4:e628 with SMTP id
 sb10-20020a1709076d8a00b0073bd9e4e628mr1189348ejc.75.1662529654688; 
 Tue, 06 Sep 2022 22:47:34 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 e10-20020a1709062d4a00b0073dafb227c0sm7799536eji.161.2022.09.06.22.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 22:47:34 -0700 (PDT)
Date: Wed, 7 Sep 2022 07:47:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: Re: build failure of next-20220906 due to 396369d67549 ("drm: vkms:
 Add support to the RGB565 format")
Message-ID: <YxgwdGtNTnDdIqAv@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e4350df-0c73-6ca2-a25f-28a40a1856db@gmail.com>
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

On Tue, Sep 06, 2022 at 08:35:49PM -0300, Igor Matheus Andrade Torrente wrote:
> On 9/6/22 18:26, Sudip Mukherjee wrote:
> > On Tue, Sep 6, 2022 at 4:59 PM Sudip Mukherjee (Codethink)
> > <sudipm.mukherjee@gmail.com> wrote:
> > > 
> > > Hi All,
> > > 
> > > The builds of next-20220906 fails for mips, xtensa and arm allmodconfig.
> > > 
> > > The errors in mips and xtensa are:
> > > 
> > > ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > 
> > > The error in arm is:
> > > 
> > > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
> > > 
> > > 
> > > Trying to do a git bisect to find out the offending commit.
> > 
> > git bisect points to 396369d67549 ("drm: vkms: Add support to the
> > RGB565 format")
> 
> Are these architectures incapable of doing 64bits int division?

Yeah 32bit archs in general can't do that, and you have to use the right
macros because otherwise gcc falls back to its own built-ins, and those
don't exist in the kernel since the kernel isn't (cannot!) linked against
any userspace library.

For pretty much this reasons it's really good to build test against 32bit
x86, or probably more relevant these days, 32bit arm.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
