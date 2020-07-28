Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 976BA231543
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 00:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F936E14F;
	Tue, 28 Jul 2020 22:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E646E14F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 22:00:12 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 3so1003165wmi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=WYM7YWRrofiqW5kLWGSsE/Hx0/dOJhDIeA7P90h8h+8=;
 b=cKzC6jqIX1H2YhERV4aGOIAIex8WqwlQnUav0NdYcg7oMNLp0eb8eFOCvI1SHd4Gwl
 qPxRiRNhqeqDGTy9jVYcspX+roi/V/prv+zeEb/9I6OE1NQOf1bUoI0wGS+OAhJm87FI
 xatOWa41w23hcSzNBoTWCtjMz9h99qBuD0heU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=WYM7YWRrofiqW5kLWGSsE/Hx0/dOJhDIeA7P90h8h+8=;
 b=D6bOYugKtoFrR1vQ3OT/T58dSMlyTP2ilQAtDAbKWzQQTUyfpsVBR/TD7rrme3TCOP
 y6mG9gXEwk1mDDcWLUyDZ11gdeGTvXUjT59LTfdaD5jp6kn87gRcXVXn4R31+RxEq2ek
 nQ6gh5c5i9AunmQrVB3hhV1jX8S3fY7gQNTk2R/4bCthi6M7w4s7aHP7lr7jrpwWSgAT
 WcMXktcl2c0sfW+ZoxxEJrK2ndszxbvN3APmtFh+ZfWaVCiibhDgWuE7IW1odLqawBdH
 KoLN3R/7vYLdWDHBPj/coYn9GGj39bZNPN5gHYyvU81YBCzmiTaiVOa9QzjjpcejMaLI
 QHIw==
X-Gm-Message-State: AOAM533PxyI/FizCwecnj41usOa+dgx0BGvkdYEA265PMTE1YBPGMc27
 KZcG0qMEoJdBTZA0piv+wvsWlA==
X-Google-Smtp-Source: ABdhPJwvUftl1NlF82xTDYYgeZB/MS990hdVTA7J01V3SHsjpdjTsW0HjHP3YX7TGyWF7NAJnKfsYA==
X-Received: by 2002:a1c:9a06:: with SMTP id c6mr5425903wme.23.1595973611479;
 Tue, 28 Jul 2020 15:00:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 62sm396057wrq.31.2020.07.28.15.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 15:00:10 -0700 (PDT)
Date: Wed, 29 Jul 2020 00:00:08 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 0/2] Small cleanups to ingenic-drm driver
Message-ID: <20200728220008.GI6419@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@linux.ie>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200728151641.26124-1-paul@crapouillou.net>
 <20200728201736.GA1277651@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728201736.GA1277651@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 10:17:36PM +0200, Sam Ravnborg wrote:
> Hi Paul.
> 
> On Tue, Jul 28, 2020 at 05:16:39PM +0200, Paul Cercueil wrote:
> > Here are a few cleanups to the ingenic-drm driver.
> > - some error paths were missing and have been added;
> > - the mode validation has been moved to the .mode_valid helper callback.
> > 
> > Cheers,
> > -Paul
> > 
> > Paul Cercueil (2):
> >   drm/ingenic: Handle errors of drm_atomic_get_plane_state
> >   drm/ingenic: Validate mode in a .mode_valid callback
> 
> Both looks fine, you can add my:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I assume you will apply the patches.
> Maybe wait for Daniel to take a look, he had some feedback on where
> to add checks. I assume this is covered by the second patch.

Yeah changelog for new versions would be great, but aside from that
bickering patch 2 lgtm now.

Cheers, Daniel

> 
> 	Sam
> 
> > 
> >  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 41 +++++++++++++++--------
> >  1 file changed, 27 insertions(+), 14 deletions(-)
> > 
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
