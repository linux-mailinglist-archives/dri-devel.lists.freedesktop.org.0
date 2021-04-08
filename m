Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369D3580F3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A706EA7C;
	Thu,  8 Apr 2021 10:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117FA6EA7B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 10:38:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5-20020a05600c0245b029011a8273f85eso976517wmj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 03:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=eRaMcxz3zgFPYNGt7SjAbzHOcdHXj9ZgSC7Zn81PL2M=;
 b=DLhUR7rooHo2v1rKHmhVq8DM4VON7DuPXveOFVk80ZcGMyTsiP7rsIMtH1/nLDX8FP
 QmPygjaYOziMZBitOI3Uyq9WRsaAmG6l73GzWgAeeWb+/OUSbyHWQXaxyDD3R1bA4j5l
 u+DtvAa2DYQELE+PIl4jSGtSCwKK92mYNlzFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=eRaMcxz3zgFPYNGt7SjAbzHOcdHXj9ZgSC7Zn81PL2M=;
 b=bUVaSz12TRKNsIdIO2efjHKOH0RwMgCPe24O7Fay8qOAnwanqKGr5F10PFsZgqSIq2
 XDhLVPYqTvgahsLrVUBnCDJbQYodnMW2/ecGFZLrwVNeOn4e16YBiVi9QApGjNLcfERi
 VLnm1l7m8hjxlf3H7QEYxRbaFd3Uovf21GDePt2QiBAucreuP8JFBnZqzmrQKAS/u4uK
 jan6vWH9Xy6y6fN/pzHpHVr6s5dfvkYIVEQk8XQNLdU6HHuSRyYh35iWWICj/WtSAuWS
 pbVDs6sYMzr4WU/3SE/7Pv32da8b+be0l3oMoKjMdfxSbu6grWfnrmwtTesubIKL+V3V
 Ch0w==
X-Gm-Message-State: AOAM533LSASYxKJ1s3Ftbq7Yh72+7NFccJjUHfrpHaZVlW8+mt5GyF74
 8uAc5hLxcnYxKAF9d9TZ9cuYrw==
X-Google-Smtp-Source: ABdhPJwAY40s7fwbqph5oDTyB7TSOu75px+R8zevxVJSWWfJPeejFa8vysnU4+SyKebV8pJS/9JSqA==
X-Received: by 2002:a1c:254:: with SMTP id 81mr946479wmc.77.1617878334782;
 Thu, 08 Apr 2021 03:38:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o14sm38073759wrh.88.2021.04.08.03.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 03:38:54 -0700 (PDT)
Date: Thu, 8 Apr 2021 12:38:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: linux-next: build warning after merge of the drm-intel-fixes tree
Message-ID: <YG7dPD8NWbHLrFck@phenom.ffwll.local>
Mail-Followup-To: Imre Deak <imre.deak@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210326195838.5ad4973b@canb.auug.org.au>
 <20210329090117.6b224931@canb.auug.org.au>
 <20210329182335.GE233691@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329182335.GE233691@ideak-desk.fi.intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 09:23:35PM +0300, Imre Deak wrote:
> Hi Stephen,
> 
> thanks for the report.
> 
> On Mon, Mar 29, 2021 at 09:01:17AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Fri, 26 Mar 2021 19:58:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the drm-intel-fixes tree, today's linux-next build
> > > (htmldocs) produced this warning:
> > > 
> > > Documentation/gpu/i915:22: /drivers/gpu/drm/i915/intel_runtime_pm.c:423: WARNING: Inline strong start-string without end-string.
> 
> The problem seems to be the
> 
> 	@ignore_usecount=true
> 
> part in __intel_runtime_pm_get_if_active()'s docbook documentation. I
> can't see the problem with it, it was meant as a reference to the
> function parameter, granted I'm not sure what's the proper markup syntax
> for this.
> 
> I will follow up with the following change which suppresses the warning
> and renders the html as expected unless someone can suggest a better
> way:
> 
> - * If @ignore_usecount=true, a reference will be acquired even if there is no
> + * If @ignore_usecount is true, a reference will be acquired even if there is no

Yeah you can't just use most pseudo-code in kerneldoc because it's
interpreted as raw .rst. So would need some .rst quoting of some sorts to
make it render correctly.

Usually for pseudo-code I go with blockquotes (started with :: at the end
of the previous line, plus indenting), that gives you also a nice
fixed-width font and everything.

Aside from the hyperlink stuff plain English works best in the text parts.
-Daniel

> 
> --Imre
> 
> > > 
> > > Introduced by commit
> > > 
> > >   8840e3bd981f ("drm/i915: Fix the GT fence revocation runtime PM logic")
> > 
> > This warning now exists in Linus' tree.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
