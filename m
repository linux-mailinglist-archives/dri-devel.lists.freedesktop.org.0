Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C96C3F8ECA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 21:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81E76E8A2;
	Thu, 26 Aug 2021 19:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55C56E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 19:39:47 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a25so8691869ejv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=k0TN+1OXwj1OvOaPyWX765yOTzhznhjpBp8I73Q7icY=;
 b=DK5zXCVzSZz/Xzh0vtV6p9he9ljx28tLWBFqdR0+QwSIivV8UKQkbM/Xepf5uR2WEE
 0CBkjyzwc/yxlILrHDxRz6Y+1rSQDHShT1zJVolTUgsUsCRUxPBr/0xttP5oJShLmDm2
 eahvoux1cLB92gDf3Lymyt3iT9ErfeVQ2HUds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=k0TN+1OXwj1OvOaPyWX765yOTzhznhjpBp8I73Q7icY=;
 b=j1Y9T2G1b1BCaoHherV6zYRuZf47/r3Kf/9ylX5H2GO85TkOaXubSIbtjyhC2C2aaX
 TzJUEyl47RQFumQQuY1Wx96JCsMgGjlFR4hAq5YA+0uSTwuvnphHFxSPswEad+XWjjwp
 K17NynNpbwGu2Br9zk6LuK25JHnp0MelIDBW7/Ovva0IYN8+PoNKtkrVX5xx338bEfSU
 G/b7ssRXbqR1cn/f3p7FbaBwrDHC3Psl81ytKRLS06f8Ygir405NokPnJiiSv2QBVPi7
 ojJoGd8mMEBIWZob0lGgeshOGm91VSbyJL1WKnpMXrx1kPFKQUYZOng+tABBTZ+S7jrw
 yWiw==
X-Gm-Message-State: AOAM530TWqBdlbGNI/ClEzoX9swClA7gR+i/cv+njEzTZtPt/5oY0wM/
 uP/Tb02FNp2MEic2swIe/KR24g==
X-Google-Smtp-Source: ABdhPJxPHkFJzAKrlUX5R7ClfeOsL/+djIiR8g6na/Ens9JDk5nTEi4+EBYnqBdP/H5gzhu284YCAg==
X-Received: by 2002:a17:906:704e:: with SMTP id
 r14mr6045015ejj.293.1630006786423; 
 Thu, 26 Aug 2021 12:39:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n23sm2316314eds.41.2021.08.26.12.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:39:45 -0700 (PDT)
Date: Thu, 26 Aug 2021 21:39:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Add dri-devel for component.[hc]
Message-ID: <YSfuANJ2ULizWfO6@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20210826091343.1039763-1-daniel.vetter@ffwll.ch>
 <YSdzWthRL+C9/LMN@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSdzWthRL+C9/LMN@kroah.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 26, 2021 at 12:56:26PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 26, 2021 at 11:13:43AM +0200, Daniel Vetter wrote:
> > dri-devel is the main user, and somehow there's been the assumption
> > that component stuff is unmaintained.
> > 
> > References: https://lore.kernel.org/dri-devel/CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com/
> > Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  MAINTAINERS | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ac58d0032abd..7cdc19815ec4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5707,6 +5707,11 @@ F:	Documentation/admin-guide/blockdev/
> >  F:	drivers/block/drbd/
> >  F:	lib/lru_cache.c
> >  
> > +DRIVER COMPONENT FRAMEWORK
> > +L:	dri-devel@lists.freedesktop.org
> > +F:	drivers/base/component.c
> > +F:	include/linux/component.h
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Will you merge this through your tree? I think merging component patches
through driver core makes sense (or topic branch or whatever) still. This
is just so that there's a wider reviewer pool than just you & Rafael.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
