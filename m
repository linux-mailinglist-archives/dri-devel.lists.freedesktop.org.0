Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AD5405E35
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 22:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B1A6E907;
	Thu,  9 Sep 2021 20:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF8D6E907
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 20:47:42 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 25f3738b-11af-11ec-a02a-0050568c148b;
 Thu, 09 Sep 2021 20:47:29 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 7365C194C27;
 Thu,  9 Sep 2021 22:47:30 +0200 (CEST)
Date: Thu, 9 Sep 2021 22:47:36 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 10/16] drm/panel-simple: Non-eDP panels don't need
 "HPD" handling
Message-ID: <YTpy6OvLUJqT1wfh@ravnborg.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.10.I77d7a48df0a6585ef2cc2ff140fbe8f236a9a9f7@changeid>
 <YTUQhnt0GxYxqg/i@ravnborg.org>
 <CAD=FV=U-bxUOyLpe+iM_6HNNyoxi6skzWK417_VE9qGy_oSWwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=U-bxUOyLpe+iM_6HNNyoxi6skzWK417_VE9qGy_oSWwQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 08, 2021 at 02:10:48PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Sun, Sep 5, 2021 at 11:46 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > On Wed, Sep 01, 2021 at 01:19:28PM -0700, Douglas Anderson wrote:
> > > All of the "HPD" handling added to panel-simple recently was for eDP
> > > panels. Remove it from panel-simple now that panel-simple-edp handles
> > > eDP panels. The "prepare_to_enable" delay only makes sense in the
> > > context of HPD, so remove it too. No non-eDP panels used it anyway.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Maybe merge this with the patch that moved all the functionality
> > from panel-simple to panel-edp?
> 
> Unless you feel strongly about it, I'm going to keep it separate still
> in the next version.
OK

	Sam
