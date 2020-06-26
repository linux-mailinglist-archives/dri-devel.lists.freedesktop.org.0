Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8338420AEEA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 11:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79646E1D7;
	Fri, 26 Jun 2020 09:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132036E1D7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 09:25:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g18so8823204wrm.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W4QboZ+2BYaxwFLVRZE8pYUcmIgl+vR3O91iE5KRbMc=;
 b=Artw0zulwtDI/tGmL95uMhiddF93m595rGy03Zk1iMnIh1widOXNePpRNBDDNkusI6
 nQBKrbeTvVBSwkhtq99Dgb6AGC7YIoQwcCtSB1oaFIUrZXfM8GsP4n2tUfQdzLK67PdG
 Bo8EXMjiI9nMmGS3v5cdpELPJKh1akyh837vaf6BddHTUNIAMmZ5ewdKN2JyenXDuUwd
 1GbEqrtZScuDZknjwv+MQikYlwO1AK9U4Z7PVk2eMiSxdXtu5bfwnM6Gh+x1HLEhrs4K
 0ag+n2DyGzeWjz1eeELP2TlQ6fuY1HJ7c289GSjvbK24jEghcCmeKmk5FGEK1uR7ceQi
 2a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W4QboZ+2BYaxwFLVRZE8pYUcmIgl+vR3O91iE5KRbMc=;
 b=UNSuqstaQPV5ZHcQrbXeB41efbv4KO2f3klWsbNYylLV0BCXurjHy0iiRCr2XTpCZW
 Og+2QINcMIDRxuHaqCl84/+s11Vy3rxMaWkT87/9jn69ApZf61iYYjsMC6CevCgrH7fO
 xRbol3KUeWywnQQr7EWBmOFlwFVewuusDbEGnqBlzI4hpqIDcnPqIe8HvMUtbZj88KWq
 fr4cM9t/aKXssJEaM6q767+wi7KZd6aQ295fJJGNZ8JETz2Z+ImkUsFMJzz6MkYLHUC9
 4GwwX8/LXT81fuMxFhQXU41UlVdUgyhgq+qX4HNGLrRioaMkJDjUALYst919tQTNS1ma
 trHg==
X-Gm-Message-State: AOAM531+pDB6vp4ksxUufP5eaRV0jUddGqWVZ/t3mDMly2c/fTa4A4XF
 WHuuFt904amEpqm0v1UzXqVGAvxcxDUZadiHjDU5kw==
X-Google-Smtp-Source: ABdhPJziZBr18mhrggpfS2x3HdfY+CYO0A70NiaVkBhAoksbbX17oyoZOYgWqaoO72WmViYHknTtYHeVMn6O87BVprg=
X-Received: by 2002:adf:8091:: with SMTP id 17mr2688885wrl.244.1593163556649; 
 Fri, 26 Jun 2020 02:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-28-laurent.pinchart+renesas@ideasonboard.com>
 <20200621084000.GM74146@ravnborg.org>
 <20200624011209.GU5870@pendragon.ideasonboard.com>
 <20200624072304.GT20149@phenom.ffwll.local>
 <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
 <CAKMK7uEKeY=onmhrMdb+c-uW7iyPXGDdbc-3jO4XuXPEpMn2ig@mail.gmail.com>
 <CADnq5_OyZb9xs+aLQ1rRUv8qvLTrnKD8Y7eUs=iVD3pUrc3RiA@mail.gmail.com>
 <20200625075655.GC3278063@phenom.ffwll.local>
 <CAKMK7uF70UO=vDDnERnQ49rH1yN8gQQD91GKq1j8+eQV9mf1xA@mail.gmail.com>
 <20200625133157.0e749602@eldfell>
 <CAKMK7uGF_t+zW4tyO42HN2BbV1j6fVFfVHF8Xph10bAygdsXPQ@mail.gmail.com>
 <20200626115957.566efa5b@eldfell>
In-Reply-To: <20200626115957.566efa5b@eldfell>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 26 Jun 2020 10:25:45 +0100
Message-ID: <CAPj87rMo61nVdhVo4HVc2-Lqb9EHgZmGVc7cFaRuuN1zGHQtPQ@mail.gmail.com>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown
 state
To: Pekka Paalanen <ppaalanen@gmail.com>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 26 Jun 2020 at 10:00, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Thu, 25 Jun 2020 12:44:36 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
> > Maybe an aside, but the guideline is for autoconfiguration:
> > - Light up everything that has connector status connected.
> > - If nothing has that status, try to light up the connectors with
> > status "unknown".
> >
> > This is only really relevant on older platforms, mostly for VGA and
> > somewhat for dvi outputs.
> >
> > Maybe another thing we should put down somewhere in the uapi docs ...
>
> As I had no idea what "unknown" means or when it can happen, I assumed
> that it must mean "the hardware cannot know". If the hardware cannot
> know, then I certainly will not be trying to enable that, unless
> explicitly configured to do so. Having a phantom output is worse than
> having a real output that does not light up, because it's not obvious at
> first with phantom output that anything is wrong. You may just be
> wondering where your windows disappear, or where did you mouse cursor
> go, or why you see a wallpaper but no login dialog, etc.

How about a refinement of Dan's suggestion, proceeding down this
logical order and breaking if true:
- ignore all disconnected outputs
- if any outputs are connected, ignore all unknown outputs
- if only one output is unknown, use only that output (with default
mode if need be)
- if any outputs are unknown but have EDID present, use only those outputs
- at this point, we have multiple unknown outputs with no EDID - break
and demand explicit user configuration

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
