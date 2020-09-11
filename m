Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F15265C0B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 10:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B3F6E044;
	Fri, 11 Sep 2020 08:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39386E044
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:56:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q9so3685602wmj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 01:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JmRAtgrvidCvnjYSz9nvpyFiEjMSCYV5QqMAFfFdYS4=;
 b=LEqR+2sjB+GpPRht4zshPvb+pnAJuY169uY7Q6BwVU7+AkCANaJjO2HjEJC3+maL8M
 54b0zCHfAFs/kqjqSOu3s8f8PA9ntzc3TT43u7iCpvsZR1W4euedc3ZZcq1crJkx35t+
 c9jRtsqoc836WFBRuocdO4GEIFkXgfSrpvi/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JmRAtgrvidCvnjYSz9nvpyFiEjMSCYV5QqMAFfFdYS4=;
 b=rScdxUzQG3diPnoNMjEySdzODaGXDNGo9tZUJAhGWnVuUK0I4VGls4/aRRZcvvqRjl
 fPm5WScWaGyyNwU13RqBPTtMB41mg2oXLa4WBB1xvIfiUx14xnbZOSSXRm/kx2jEdp/v
 cygGoiZmPuKXZRgEPZfQra2jWAPVyBN5tPrNm/F7HvmLbfPbs/ZD855wmqQEtvKL3McX
 kqSM2/P4z/bpRdIHosomqss6Z2Zm3kaWk5JOdN/pdIDUnFmF9Zpknq4IngcDlt0VvhQ7
 ifRgu3hzjFBguLBu13Eu5lT0RnYtppgk/gJbHuzGtBQ3QBAqBmTCzcpBbTMUgSxEmXaz
 TOag==
X-Gm-Message-State: AOAM531WT7QBQ5WRLSn3CDWBN1Q7CP8tSvIkHHY9r2GkpuZvhwrAE8hj
 5ViL1juCeOAUsCLUUhrVxovgCQ==
X-Google-Smtp-Source: ABdhPJwx562VHwJbLQkKIWCTdsbamNlU7QvrTuA5wbicSXb6Gxi65wNDF+NAZ2VPXhLWRoej7pr/Zg==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr1123884wmk.120.1599814605358; 
 Fri, 11 Sep 2020 01:56:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b18sm3357160wrn.21.2020.09.11.01.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 01:56:44 -0700 (PDT)
Date: Fri, 11 Sep 2020 10:56:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
Message-ID: <20200911085642.GR438822@phenom.ffwll.local>
References: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
 <1598904172-30865-3-git-send-email-anitha.chrisanthus@intel.com>
 <20200910083042.GH438822@phenom.ffwll.local>
 <20200910183343.GC893045@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910183343.GC893045@ravnborg.org>
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
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>, daniel.vetter@intel.com,
 edmund.j.dea@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 08:33:43PM +0200, Sam Ravnborg wrote:
> Hi Daniel.
> 
> > > +	}
> > > +
> > > +	/* Initialize MIPI DSI */
> > > +	ret = kmb_dsi_init(drm, adv_bridge);
> > 
> > Split up isn't correct here, this won't compile since the dsi code isn't
> > in this patch yet. So you need to have this ordered the other way round.
> 
> I have explicit asked for a simple file split as done here
> and told Anitha this was fine.
> 
> As the kbuild/kconfig bits are the last patch then no build breakage.
> The file based split was IMO fine to ease review.
> 
> If this is not OK then blame me :-)

Ah I missed that, sounds ok for me too then :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
