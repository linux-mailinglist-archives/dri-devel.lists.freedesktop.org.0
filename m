Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24351BF9A8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 15:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7396E89F;
	Thu, 30 Apr 2020 13:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6EE6E89F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 13:37:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x18so6957175wrq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=cIp9DbU+6rRfiPbG8uAVaJPBU9twoue+ADTvawohLJ4=;
 b=AUQMg9Bfr7hBR51Z28J9x9t2Irvw2vW5PyG4R/MxI6yDPK6/b/N3PFe0ZbPEv/oNXD
 MX/9JYqZK8jR0AvdRC6mo7BRI2JjjnAX3A4N7FC2xazulqlbx3GfSuQFUyJZhPZ12dNt
 UQTEgyH586iFrg6yerVwQymf3ZQWBP7qFMeTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=cIp9DbU+6rRfiPbG8uAVaJPBU9twoue+ADTvawohLJ4=;
 b=hXXy1YnpyzH0vdxO+pERW7FHjf4/B1YT8/L6gKvd7m0MlqE2OQ01xyQsD514zR8vi6
 aZkjmD0rVQ9ciYpzRjYmYdSFUccYZUgzGProtZWN36gjN8z2JJVXaXxvpua0OBodeJob
 D+r84Uc546hVB4bZiRWTIFLWZ2It90srNFQWuhTbZIZDXbe9kl7g+MGk9oQBt7uOcLtN
 tFJzhvthKQ32qfDyNqYd5lfWHVR/THqQ+ys9KMvfouC0JRPP06GJ1TB7dxtvwxOX9dvg
 DDd9kPHnvun+RZIOwnHZMeXuqAZR/QMtaEMZsG5XqRdPHVz3PZSWW1g7BRXRewX587X0
 U4Zw==
X-Gm-Message-State: AGi0PuaujFRr6onit67chCr2Zbgkrg7jTwgS94UvMYgoq7zxkfp4AAJn
 1dEafmj4Vf14fhDwZUQVxC3iuw==
X-Google-Smtp-Source: APiQypL9RK8HI6QxyV+3Rq7Wl6MRj5xlTTsfy+Y6JwCeDq2W1PgLcVkhMuTOPlnyqwhEdYENozbNbQ==
X-Received: by 2002:adf:df8d:: with SMTP id z13mr4003100wrl.304.1588253859692; 
 Thu, 30 Apr 2020 06:37:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o3sm4146326wru.68.2020.04.30.06.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 06:37:38 -0700 (PDT)
Date: Thu, 30 Apr 2020 15:37:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v7 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
Message-ID: <20200430133731.GA10381@phenom.ffwll.local>
Mail-Followup-To: Xin Ji <xji@analogixsemi.com>,
 Nicolas Boichat <drinkcat@google.com>, devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pi-Hsun Shih <pihsun@chromium.org>,
 Sheng Pan <span@analogixsemi.com>,
 Qilin Wen <qwen@analogixsemi.com>, Ming Liu <mliu@analogixsemi.com>
References: <cover.1582529411.git.xji@analogixsemi.com>
 <a81adcf2e79d440edcb7b3989f31efcb80a6e9ff.1582529411.git.xji@analogixsemi.com>
 <CANMq1KBfB6tXFqYGvr=8fV_bpCV5GbVHeEbRs+fuaZba65-OPw@mail.gmail.com>
 <20200424065124.GA31922@xin-VirtualBox>
 <CANMq1KBJ6f74aNAr8BwC3wz8MEeJzwXOQE44gv6C=DNzYmUWCQ@mail.gmail.com>
 <20200428100508.GD3456981@phenom.ffwll.local>
 <20200430033614.GA6645@xin-VirtualBox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430033614.GA6645@xin-VirtualBox>
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Pi-Hsun Shih <pihsun@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Qilin Wen <qwen@analogixsemi.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Ming Liu <mliu@analogixsemi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 11:36:14AM +0800, Xin Ji wrote:
> On Tue, Apr 28, 2020 at 12:05:08PM +0200, Daniel Vetter wrote:
> > On Fri, Apr 24, 2020 at 08:12:04PM +0800, Nicolas Boichat wrote:
> > > On Fri, Apr 24, 2020 at 2:51 PM Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > On Thu, Apr 23, 2020 at 07:55:15PM +0800, Nicolas Boichat wrote:
> > > > > Hi,
> > > > >
> > > > > Just commenting on the mode_fixup function that was added in v7.
> > > > >
> > > > [snip]
> > > > > > +       /*
> > > > > > +        * once illegal timing detected, use default HFP, HSYNC, HBP
> > > > > > +        */
> > > > > > +       if (hblanking < HBLANKING_MIN || (hfp < HP_MIN && hbp < HP_MIN)) {
> > > > >
> > > > > should this be adj_hblanking/adj_hfp/adj_hbp?
> > > > NO, need check original HFP and HBP, if they are not legal, driver need
> > > > set default value to adj_hsync, adj_hfp, adj_hbp.
> > > > >
> > > > > > +               adj_hsync = SYNC_LEN_DEF;
> > > > > > +               adj_hfp = HFP_HBP_DEF;
> > > > > > +               adj_hbp = HFP_HBP_DEF;
> > > > > > +               vref = adj->clock * 1000 / (adj->htotal * adj->vtotal);
> > > > > > +               if (hblanking < HBLANKING_MIN) {
> > > > > > +                       delta_adj = HBLANKING_MIN - hblanking;
> > > > > > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > > > > > +                       adj->clock += DIV_ROUND_UP(adj_clock, 1000);
> > > > > > +               } else {
> > > > > > +                       delta_adj = hblanking - HBLANKING_MIN;
> > > > > > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > > > > > +                       adj->clock -= DIV_ROUND_UP(adj_clock, 1000);
> > > > > > +               }
> > > > > > +
> > > > > > +               DRM_WARN("illegal hblanking timing, use default.\n");
> > > > > > +               DRM_WARN("hfp(%d),hbp(%d),hsync(%d).\n", hfp, hbp, hsync);
> > > > >
> > > > > How likely is it that this mode is going to work? Can you just return
> > > > > false here to reject the mode?
> > > > We want to set the default minimal Hblancking value, then it may display,
> > > > otherwise. If we just return false, there is no display for sure.
> > > 
> > > Right, understand your argument. I'm pondering if it's not just better
> > > to reject the mode rather than trying a timing that is definitely
> > > quite different from what the monitor was asking for. No super strong
> > > opinion, I'll let other people on the list weigh in.
> > 
> > Yeah mode_fixup is supposed to be used to adjust the mode in intermediate
> > stages (e.g. if you go from progressive to interlaced only at the end of
> > your pipeline or something like that). It's not meant for adjusting the
> > mode yout actually put out through a hdmi or dp connector. For fixed
> > panels adjusting modes to fit the panel is also fairly common, but not for
> > external outputs.
> > 
> > Since this is a DP bridge I'd say no adjusting, just reject what doesn't
> > fit.
> We have found some panel which HBP less than 8, if we reject to adjust
> video timing, then there is no display. The customer does not accept it,
> they push us to fix it, the only resolve way is to adjust timing.

Are we talking about external DP screen here, or some built-in panel? For
the later case we do a lot of mode adjusting in many drivers ...

I haven't checked, by if our connector type is eDP then this should be all
fine.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
