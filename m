Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E520B293
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 15:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059FF6E046;
	Fri, 26 Jun 2020 13:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A186E046
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 13:35:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 22so8865487wmg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 06:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DUYP0kDGls4xn6gexrnhT4lDqxkYAbZswvWk03qa/CY=;
 b=NJr3KisZ5ZL7jRavDurgiTgBAv8v6cNCm+jv8AmL1aIApQNSAwbXQWQDuIZZXf8Y2R
 BhDN0QmHNtsjqLwlD2U1uPOVQqJErK/zcOOyE5ZMNj96Cgdq2fzHfhTjF7kQ673t8mtz
 +XasLE7WO9HCuTMZv6Vbt9nz0krzKYtYxbANw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DUYP0kDGls4xn6gexrnhT4lDqxkYAbZswvWk03qa/CY=;
 b=skDwrWcxd7oKUHn9x9lgcGr5cf96kMctpIVNbk2I1xpFTgvcrsDX79Ag+aqgy9pOqM
 FpizXr2Kp+Y9EFGsdXYhwlaS4XS40KkdzjVXUIMuObwKf9nAELDHoBgI+nuRBB+78jbd
 ZAulmL9bJrNXyhLxYjxf9BmRbYUEDiebKTKEkOlkeu625Pv7AlxYSzjyJohtPAQxsrUF
 Pp+HhAGtWkqiGhMxpOgdCRk/Qg1W/2lQnl4s9TDGd5E1m3InAayIZDICkeru0aeI7Zmc
 hQu+T+pWI348BQnNkVgOg+X9lGbhJqDzfvJE7lmwRFZcgJ6dmv0E+hXdmJMAYtqNOjUe
 jQCQ==
X-Gm-Message-State: AOAM532NM4k9IHduuP/sq4LnffEJxF/dl0cCJZLN0ORVRWaIcqxDT1YP
 UPCCYr2Xdg/rSWr5F8vJV9fWnNhkeI0=
X-Google-Smtp-Source: ABdhPJwhtYRJxNF1kaTKX+aJCImOkd/+U+J7LhqpDarS02nXxdzfNK2GKqgdTbUm1HFYTCTk/QUgtQ==
X-Received: by 2002:a1c:6887:: with SMTP id d129mr3462339wmc.179.1593178555417; 
 Fri, 26 Jun 2020 06:35:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x185sm5532952wmg.41.2020.06.26.06.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 06:35:53 -0700 (PDT)
Date: Fri, 26 Jun 2020 15:35:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 27/27] drm: Add default modes for connectors in unknown
 state
Message-ID: <20200626133551.GD3278063@phenom.ffwll.local>
References: <20200624072304.GT20149@phenom.ffwll.local>
 <CADnq5_PidPnShdxNwCN4v++CirpKvPiY4yuN5eyK-R5+FcQV4A@mail.gmail.com>
 <CAKMK7uEKeY=onmhrMdb+c-uW7iyPXGDdbc-3jO4XuXPEpMn2ig@mail.gmail.com>
 <CADnq5_OyZb9xs+aLQ1rRUv8qvLTrnKD8Y7eUs=iVD3pUrc3RiA@mail.gmail.com>
 <20200625075655.GC3278063@phenom.ffwll.local>
 <CAKMK7uF70UO=vDDnERnQ49rH1yN8gQQD91GKq1j8+eQV9mf1xA@mail.gmail.com>
 <20200625133157.0e749602@eldfell>
 <CAKMK7uGF_t+zW4tyO42HN2BbV1j6fVFfVHF8Xph10bAygdsXPQ@mail.gmail.com>
 <20200626115957.566efa5b@eldfell>
 <CAPj87rMo61nVdhVo4HVc2-Lqb9EHgZmGVc7cFaRuuN1zGHQtPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPj87rMo61nVdhVo4HVc2-Lqb9EHgZmGVc7cFaRuuN1zGHQtPQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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

On Fri, Jun 26, 2020 at 10:25:45AM +0100, Daniel Stone wrote:
> Hi,
> 
> On Fri, 26 Jun 2020 at 10:00, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > On Thu, 25 Jun 2020 12:44:36 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
> > > Maybe an aside, but the guideline is for autoconfiguration:
> > > - Light up everything that has connector status connected.
> > > - If nothing has that status, try to light up the connectors with
> > > status "unknown".
> > >
> > > This is only really relevant on older platforms, mostly for VGA and
> > > somewhat for dvi outputs.
> > >
> > > Maybe another thing we should put down somewhere in the uapi docs ...
> >
> > As I had no idea what "unknown" means or when it can happen, I assumed
> > that it must mean "the hardware cannot know". If the hardware cannot
> > know, then I certainly will not be trying to enable that, unless
> > explicitly configured to do so. Having a phantom output is worse than
> > having a real output that does not light up, because it's not obvious at
> > first with phantom output that anything is wrong. You may just be
> > wondering where your windows disappear, or where did you mouse cursor
> > go, or why you see a wallpaper but no login dialog, etc.
> 
> How about a refinement of Dan's suggestion, proceeding down this
> logical order and breaking if true:
> - ignore all disconnected outputs
> - if any outputs are connected, ignore all unknown outputs
> - if only one output is unknown, use only that output (with default
> mode if need be)
> - if any outputs are unknown but have EDID present, use only those outputs
> - at this point, we have multiple unknown outputs with no EDID - break
> and demand explicit user configuration

EDID present generally means the status will be "connected". So not much
of a refined.

I'd say if you have multiple unknown, use a cloned config to avoid the
"windows are disappearing" problem. Which is also what fbcon does, and
iirc also -modesetting by default.

But the most important part is to not light up "unknown" outputs if
there's another output with a solid "connected". That avoids the problems
Pekka points out, phantom outputs are bad. Really no need to refine beyond
that, since imo that's a kernel bug.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
