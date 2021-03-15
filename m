Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 752DF33C1E5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 17:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1FC89842;
	Mon, 15 Mar 2021 16:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39C7897AC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 16:32:20 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id by2so8059181qvb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wSDzwZbj+0vxP+554qTTvCPOo7GPQQW7PtVpXOR2Y4U=;
 b=FetC9ltqIaCLxNdmHDvRxJjzUI0PCf2tEgp5CE05LdSaKPJugguqprjMjPNDorS7Gb
 SMLZ21YfS9W6mDAWMTTmgSmZ77K3Zye10u9DPDepX8cyaGCvgn6eKh0T/1kTF/hfNKa4
 Sr91+vICNArqJrjCOFRVjUJYHpV1ZBwUCpmG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wSDzwZbj+0vxP+554qTTvCPOo7GPQQW7PtVpXOR2Y4U=;
 b=WfG5qh5VcbstlHnBZ4JolTo2U8ikGgOUG0+COskCbR3dwoMRLk9m7JLM9UUoJc2EGk
 /YoZ7mNSCZUCE3BsSdnXGk3161emw+4roZz+iBOHEybN9/kAHhHWyp+8wOZAOZIy3jh3
 0tYW15ewjJirJ84Mthu8S1+IXG2xNmIj3h143sY+8fUvVWeuh33XKaJckegadxIDigay
 s8gdCLfbrN4ECKmkVvfCFyZgBBfb9cl2ORHOvZgD1tf88xZpH0ltM1yxgrCtQAZinRXW
 5WWOjwha/FckQsLWMEAMMcrt0E2XUUMr4/BgncJo0cvMPAWdSeT9X/ifEdgI5oPAzREp
 Prow==
X-Gm-Message-State: AOAM532j6BK2xfw4WT5lsetdZDC2hDc+SQmyADpnXBgrq/VS2zyakbUF
 dSLzBziLL6dZLVzVolXcPMr3eTvvz1NitA==
X-Google-Smtp-Source: ABdhPJw9vxrqIwOJBmkAXabNe4E8LvnJYm5RYhk/cbrwLjLArOenKd6HNffnnzb2k+x3TjJgMC7k8g==
X-Received: by 2002:a0c:c248:: with SMTP id w8mr11579028qvh.58.1615825938354; 
 Mon, 15 Mar 2021 09:32:18 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id m21sm12635322qka.28.2021.03.15.09.32.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 09:32:17 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id m9so33847168ybk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 09:32:17 -0700 (PDT)
X-Received: by 2002:a05:6902:70a:: with SMTP id
 k10mr669116ybt.257.1615825936810; 
 Mon, 15 Mar 2021 09:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.2.Id492ddb6e2cdd05eb94474b93654b04b270c9bbe@changeid>
 <YE0qyYedS0NilsCy@pendragon.ideasonboard.com>
In-Reply-To: <YE0qyYedS0NilsCy@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Mar 2021 09:31:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_HAdNkvZ7NGKDH9KapRRLgOfN23OZyy3VyaX+ywjRkQ@mail.gmail.com>
Message-ID: <CAD=FV=X_HAdNkvZ7NGKDH9KapRRLgOfN23OZyy3VyaX+ywjRkQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: Move code in prep for EDID
 read fix
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Mar 13, 2021 at 1:13 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Douglas,
>
> Thank you for the patch.
>
> On Thu, Mar 04, 2021 at 03:52:00PM -0800, Douglas Anderson wrote:
> > This patch is _only_ code motion to prepare for the patch
> > ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only if
> > refclk") and make it easier to understand.
>
> s/make/makes/

I was never an expert at grammar, but I think either "make" or "makes"
are fine. Simple version with parenthesis:

Mine:

This patch is <blah> to (prepare for the patch <blah>) and (make it
easier to understand).

Yours:

This patch is <blah> (to prepare for the patch <blah>) and (makes it
easier to understand).

I suppose also valid would be:

This patch is <blah> (to prepare for the patch <blah>) and (to make it
easier to understand).


In any case if/when I spin this patch I'm fine changing it to your
version just because (as I understand) it's equally valid and maybe
looks slightly better?

> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for the reviews!

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
