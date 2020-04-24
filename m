Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B941B73A3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 14:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362DC6E065;
	Fri, 24 Apr 2020 12:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9946E065
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 12:12:16 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id y10so9169535uao.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h0z5ld1WSv+uCtbs/DgylXlcT9i3DCsdVOPXc/hPY7o=;
 b=hwQepM/bXpUDZkqdGyGGTFFGFNmGx+VGOU1xAn2w6kWh7TpIs1TVzUvC7Y8WfV5Avv
 eBW9GDKE1srlE8pjEXdpZU4tXNiz4H7u5pefQcy0FulLXzcxvs79P05uhucqMfCVMQYQ
 7XujRwL1+db0Xik9NlNhqzowuqaVg69dHl2J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h0z5ld1WSv+uCtbs/DgylXlcT9i3DCsdVOPXc/hPY7o=;
 b=LZ9R55YussNuYFll4JOCX9WqKvCH5cLPpcp0t6Sj8sxO9L/mdO1GKs13rYSqkZbh9I
 d49vpNqFkdUpyWhDyF9hJgpm8fyZtVag7TZrZWJmo9muZxWYn2yx6MqqD5TZhoZPCcLP
 ddk3fmFzvgVWdk0ekLsM42vXdq7KsqNJK37VVZt5KcTuVXKEhgfgw2dXLxMR89eCsOMU
 3ewCpaBulwxmR9bhd0gJnosExxcbGTIi3XPjX1e7z1aH2lCaMkd/tde3rJoJZo6q/RTR
 38V/r+yQ9tGUPot/04XC4QvTpRlXDRFMwuo6S2+gzSiwqZ3L+NJA1b1fk3ImUFqoDQ+z
 oF7A==
X-Gm-Message-State: AGi0PuYQ/sA2jvgZ+TKIrmyt2qMmFzhHXrNNSnjvCBWyRQLSQD9PnYgp
 3rUW9xGITXhrouBmkABBds66thzari22rx7HhgrbNA==
X-Google-Smtp-Source: APiQypJlKxen8G2zO7JAXCkFHrtJVs6fTHB/52uvBVD1WuZXJLx6iNR7mkvt90cHOCFrx1bhwh1bwttJBXrxJvTAToE=
X-Received: by 2002:a05:6102:308b:: with SMTP id
 l11mr6943000vsb.14.1587730335778; 
 Fri, 24 Apr 2020 05:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1582529411.git.xji@analogixsemi.com>
 <a81adcf2e79d440edcb7b3989f31efcb80a6e9ff.1582529411.git.xji@analogixsemi.com>
 <CANMq1KBfB6tXFqYGvr=8fV_bpCV5GbVHeEbRs+fuaZba65-OPw@mail.gmail.com>
 <20200424065124.GA31922@xin-VirtualBox>
In-Reply-To: <20200424065124.GA31922@xin-VirtualBox>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 24 Apr 2020 20:12:04 +0800
Message-ID: <CANMq1KBJ6f74aNAr8BwC3wz8MEeJzwXOQE44gv6C=DNzYmUWCQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
To: Xin Ji <xji@analogixsemi.com>
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 2:51 PM Xin Ji <xji@analogixsemi.com> wrote:
>
> On Thu, Apr 23, 2020 at 07:55:15PM +0800, Nicolas Boichat wrote:
> > Hi,
> >
> > Just commenting on the mode_fixup function that was added in v7.
> >
> [snip]
> > > +       /*
> > > +        * once illegal timing detected, use default HFP, HSYNC, HBP
> > > +        */
> > > +       if (hblanking < HBLANKING_MIN || (hfp < HP_MIN && hbp < HP_MIN)) {
> >
> > should this be adj_hblanking/adj_hfp/adj_hbp?
> NO, need check original HFP and HBP, if they are not legal, driver need
> set default value to adj_hsync, adj_hfp, adj_hbp.
> >
> > > +               adj_hsync = SYNC_LEN_DEF;
> > > +               adj_hfp = HFP_HBP_DEF;
> > > +               adj_hbp = HFP_HBP_DEF;
> > > +               vref = adj->clock * 1000 / (adj->htotal * adj->vtotal);
> > > +               if (hblanking < HBLANKING_MIN) {
> > > +                       delta_adj = HBLANKING_MIN - hblanking;
> > > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > > +                       adj->clock += DIV_ROUND_UP(adj_clock, 1000);
> > > +               } else {
> > > +                       delta_adj = hblanking - HBLANKING_MIN;
> > > +                       adj_clock = vref * delta_adj * adj->vtotal;
> > > +                       adj->clock -= DIV_ROUND_UP(adj_clock, 1000);
> > > +               }
> > > +
> > > +               DRM_WARN("illegal hblanking timing, use default.\n");
> > > +               DRM_WARN("hfp(%d),hbp(%d),hsync(%d).\n", hfp, hbp, hsync);
> >
> > How likely is it that this mode is going to work? Can you just return
> > false here to reject the mode?
> We want to set the default minimal Hblancking value, then it may display,
> otherwise. If we just return false, there is no display for sure.

Right, understand your argument. I'm pondering if it's not just better
to reject the mode rather than trying a timing that is definitely
quite different from what the monitor was asking for. No super strong
opinion, I'll let other people on the list weigh in.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
