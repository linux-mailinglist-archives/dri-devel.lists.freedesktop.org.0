Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F49A1BFA8E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 15:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD126E8BD;
	Thu, 30 Apr 2020 13:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAF66E8BB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 13:54:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d17so6985797wrg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=u+gflsm0E1N7kNP6swTcdmCU1ycfD/TnmSzIqBfIgW0=;
 b=Kx0LoMBe5ghQihGT1Jo2J2UAlwOG9CX+y68UwyKL8LPYae8p7CSY8Px4jXAaKEar0Y
 17z6AbFokVxas/i3fryne/U9Lvw3fSMyx4YrPU/eR7jdck4MhCgDHzuyszoBMq34NRU9
 APZX8PcHJsX8zjdxYN7ko6aDSu13EVy1Mt5DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=u+gflsm0E1N7kNP6swTcdmCU1ycfD/TnmSzIqBfIgW0=;
 b=duKFqbnyCYr0BEopaowNMiYSUOA/W4errPt+GmkZ6B5BcdTcW0ion33n0rIaQ44dJ2
 SZnBn3zZwzxWl8kxGr/iQYroH8c5WANy/YLvxEnXB+uutddN5+Mum9JLS6o1H+pAkMJV
 oNlnafZ8BxEKz1c7EKGT84x0VapkGHLZiXTz8o34aU6VqfmNiiZujcviE75FOlOP67IP
 aTq4srkf+ENCjNKummn2yUFRhMSgWImCVh8FcohlpRWnwkbLF0tHBTSLS3ia7O6LKYTq
 ePbav+/IxV1E5tNvzgORsXtF8L2c7bLMJXV7tbBx+TJCCL5mqeFsOssUhjbKX7c9eXMV
 AdhA==
X-Gm-Message-State: AGi0PuYvHlh5fBlb3PSnWAtB569BF0KiPQH5xa86VUUCNvh/uylhYLAP
 tVg2JHVcVDnlXrsGnQ7u9PjeIijk6Jk=
X-Google-Smtp-Source: APiQypKpRyH6AWNkE252mFWsKMVhTDkMj8rAQHTSTIymRRqPa6MXjZXl/oiCR2rMvhsYUCSUYkswGQ==
X-Received: by 2002:adf:80ee:: with SMTP id 101mr4396803wrl.156.1588254880979; 
 Thu, 30 Apr 2020 06:54:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d7sm3875642wrn.78.2020.04.30.06.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 06:54:40 -0700 (PDT)
Date: Thu, 30 Apr 2020 15:54:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v7 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20200430135438.GD10381@phenom.ffwll.local>
Mail-Followup-To: Xin Ji <xji@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Sheng Pan <span@analogixsemi.com>
References: <cover.1582529411.git.xji@analogixsemi.com>
 <a81adcf2e79d440edcb7b3989f31efcb80a6e9ff.1582529411.git.xji@analogixsemi.com>
 <CANMq1KBfB6tXFqYGvr=8fV_bpCV5GbVHeEbRs+fuaZba65-OPw@mail.gmail.com>
 <20200424065124.GA31922@xin-VirtualBox>
 <CANMq1KBJ6f74aNAr8BwC3wz8MEeJzwXOQE44gv6C=DNzYmUWCQ@mail.gmail.com>
 <20200428100508.GD3456981@phenom.ffwll.local>
 <20200430033614.GA6645@xin-VirtualBox>
 <20200430133731.GA10381@phenom.ffwll.local>
 <20200430133839.GB10381@phenom.ffwll.local>
 <20200430134746.GA2188@xin-VirtualBox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430134746.GA2188@xin-VirtualBox>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 09:47:46PM +0800, Xin Ji wrote:
> Hi Daniel,
> 
> On Thu, Apr 30, 2020 at 03:38:39PM +0200, Daniel Vetter wrote:
> > On Thu, Apr 30, 2020 at 03:37:31PM +0200, Daniel Vetter wrote:
> > > On Thu, Apr 30, 2020 at 11:36:14AM +0800, Xin Ji wrote:
> > > > On Tue, Apr 28, 2020 at 12:05:08PM +0200, Daniel Vetter wrote:
> > > > > On Fri, Apr 24, 2020 at 08:12:04PM +0800, Nicolas Boichat wrote:
> > > > > > On Fri, Apr 24, 2020 at 2:51 PM Xin Ji <xji@analogixsemi.com> wrote:
> > > > > > >
> > > > > > > On Thu, Apr 23, 2020 at 07:55:15PM +0800, Nicolas Boichat wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > Just commenting on the mode_fixup function that was added in v7.
> > > > > > > >
> > > > > > > [snip]
> > > > > > > > > +       /*
> > > > > > > > > +        * once illegal timing detected, use default HFP, HSYNC, HBP
> > > > > > > > > +        */
> > > > > > > > > +       if (hblanking < HBLANKING_MIN || (hfp < HP_MIN && hbp < HP_MIN)) {
> > > > > > > >
> > > > > > > > should this be adj_hblanking/adj_hfp/adj_hbp?
> > > > > > > NO, need check original HFP and HBP, if they are not legal, driver need
> > > > > > > set default value to adj_hsync, adj_hfp, adj_hbp.
> > > > > > > >
> > > > > > > > > +               adj_hsync = SYNC_LEN_DEF;
> > > > > > > > > +               adj_hfp = HFP_HBP_DEF;
> > > > > > > > > +               adj_hbp = HFP_HBP_DEF;
> > > > > > > > > +               vref = adj->clock * 1000 / (adj->htotal * adj->vtotal);
> > > > > > > > > +               if (hblanking < HBLANKING_MIN) {
> > > > > > > > > +                       delta_adj = HBLANKING_MIN - hblanking;
> > > > > > > > > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > > > > > > > > +                       adj->clock += DIV_ROUND_UP(adj_clock, 1000);
> > > > > > > > > +               } else {
> > > > > > > > > +                       delta_adj = hblanking - HBLANKING_MIN;
> > > > > > > > > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > > > > > > > > +                       adj->clock -= DIV_ROUND_UP(adj_clock, 1000);
> > > > > > > > > +               }
> > > > > > > > > +
> > > > > > > > > +               DRM_WARN("illegal hblanking timing, use default.\n");
> > > > > > > > > +               DRM_WARN("hfp(%d),hbp(%d),hsync(%d).\n", hfp, hbp, hsync);
> > > > > > > >
> > > > > > > > How likely is it that this mode is going to work? Can you just return
> > > > > > > > false here to reject the mode?
> > > > > > > We want to set the default minimal Hblancking value, then it may display,
> > > > > > > otherwise. If we just return false, there is no display for sure.
> > > > > > 
> > > > > > Right, understand your argument. I'm pondering if it's not just better
> > > > > > to reject the mode rather than trying a timing that is definitely
> > > > > > quite different from what the monitor was asking for. No super strong
> > > > > > opinion, I'll let other people on the list weigh in.
> > > > > 
> > > > > Yeah mode_fixup is supposed to be used to adjust the mode in intermediate
> > > > > stages (e.g. if you go from progressive to interlaced only at the end of
> > > > > your pipeline or something like that). It's not meant for adjusting the
> > > > > mode yout actually put out through a hdmi or dp connector. For fixed
> > > > > panels adjusting modes to fit the panel is also fairly common, but not for
> > > > > external outputs.
> > > > > 
> > > > > Since this is a DP bridge I'd say no adjusting, just reject what doesn't
> > > > > fit.
> > > > We have found some panel which HBP less than 8, if we reject to adjust
> > > > video timing, then there is no display. The customer does not accept it,
> > > > they push us to fix it, the only resolve way is to adjust timing.
> > > 
> > > Are we talking about external DP screen here, or some built-in panel? For
> > > the later case we do a lot of mode adjusting in many drivers ...
> > > 
> > > I haven't checked, by if our connector type is eDP then this should be all
> > > fine.
> > 
> > Ok I read the patch now, you seem to support both. Would it work if we
> > make this adjustement conditional on it being an internal panel only? I
> > think that would be perfect.
> > -Daniel
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> Based on comments of V8, only keeped eDP built-in panel in V9 version,
> removed external DP screen support.

Ah even better. Then the above adjusting has my:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Maybe add a comment to the code summarizing the discussion. Definitely
needs to be covered in the commit message.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
