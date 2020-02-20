Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B353165544
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 03:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6EF6E0D9;
	Thu, 20 Feb 2020 02:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0AA6E0D9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 02:52:44 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n10so2940882wrm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IuWiXIN7XrPBswL6JTvBTnA9S2sBls11R96m1WANlyo=;
 b=o5klrh3/3wd1oTH83CHITX2HjsAgiUZqzzfFNQYgD/25JUi2xTL73kpzR38ZYkjqC2
 YvWVsIYC/WwQ7fGUCnMee68k1n0KICdiLNLuHlFvosd/ZIRqWJR0M9SFK4V4oPauadKL
 ishStQZPADOyqb+g3oHC+JiGaX7vk5WiCRcqflJsQNvc3ZuPYHMxS3eXrSzRbK/m1duB
 DIJKPAgccYfsk7mC4eJOYMP4Zk/2NYGBWlWbFIO9UitHsgqhCBUoq6psvoCP84nQhqj8
 Jd0XLJrFx/8BikrYAELAwKnEC8q3Msd9WCTgTdLuGeHdmRV7yCryU0RcxIpZ58scazWr
 XK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IuWiXIN7XrPBswL6JTvBTnA9S2sBls11R96m1WANlyo=;
 b=S4Aq/c97hpQAWf6XIVL0HcJPj4fj3TTMPHCZNyQwXN9b8688TA/Ei/NnlTShBAaBXN
 osZtzvio81vIn40SjkmV339N6AM+eMft2r/+L6mQBehNDS9ATdC/bFb7Ys0eTi0prybw
 To7npZybvWnMVuGrVu0v7+CpeehGkspdRsjoIcUAt1O656nz47p8or4yYQGGNV8X9uxn
 cBbDk8L++Gwddf+DEeC3MwmHAteFwEQACAV1All3LNU4O3x2pumM72vo8ggihImsne/X
 keW87WO6VoeFBKnCuqIrRQhZZ7lMrwEcL4wM+VcLnM66HTzXfJXNacalTQN9hAsyJOYk
 gANA==
X-Gm-Message-State: APjAAAV8KUmE3M2FanHXI4LXPBJfp8Q7UZnDegHCzUCTFXvyjGmZ+OMU
 0K824OfOQwQtg8lBPIHJ05BgNl8mnUBRLJFrsPQ=
X-Google-Smtp-Source: APXvYqxCjFBBhSBoM7ZiaO3hBmW4TV2UmaN3lmngAU+dIZ63atObMRwgd6ZEif74hNS3w/ghnG/Gi6HpzHjjtuHGurs=
X-Received: by 2002:adf:b254:: with SMTP id y20mr38664106wra.362.1582167163536; 
 Wed, 19 Feb 2020 18:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20200220004232.GA28048@paulmck-ThinkPad-P72>
In-Reply-To: <20200220004232.GA28048@paulmck-ThinkPad-P72>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Feb 2020 21:52:32 -0500
Message-ID: <CADnq5_OJSHV5XotA6hORgQSrC4A-ZFzfXN_NRMGYFka+MTyjGg@mail.gmail.com>
Subject: Re: drm_dp_mst_topology.c and old compilers
To: paulmck@kernel.org
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 7:42 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> Hello!
>
> A box with GCC 4.8.3 compiler didn't like drm_dp_mst_topology.c.  The
> following (lightly tested) patch makes it happy and seems OK for newer
> compilers as well.
>
> Is this of interest?

How about a memset instead?  That should be consistent across compilers.

Alex


>
>                                                         Thanx, Paul
>
> -----------------------------------------------------------------------
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 20cdaf3..232408a 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -5396,7 +5396,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
>  {
>         struct drm_dp_mst_port *immediate_upstream_port;
>         struct drm_dp_mst_port *fec_port;
> -       struct drm_dp_desc desc = { 0 };
> +       struct drm_dp_desc desc = {{{ 0 }}};
>         u8 endpoint_fec;
>         u8 endpoint_dsc;
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
