Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04F33891FF
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47D56EDE2;
	Wed, 19 May 2021 14:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C4F6EDE1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:51:52 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so11961341oth.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FTJFgBVyDmUOEWvTRev7q14+qgObUW0H7ne5i0Gbe6Y=;
 b=S9tVdEtrJGHa2o7lEkJCl4ciWBJIW+7y7XAxPg2JtJRWL8oEtOofCj7Kd+s7C/rIBr
 X/N8xkmpWtnyWt1DKO7+61sttUWb96XaXea/B1XI7p/WQnRVkFodqInkdzVDOGszpRe4
 bpJLlyQD9AEUc4m7DCFI/fKCMPXeM+YTcp1d73LC5Eq2i6Zs/OdFoDQ388kT3FuKiZDB
 dsyJ9WRYzho23HSpVRA74CioM2IFz/p6ya/SE2EPNaHHGbHjx6SKcHx+OuMx087PBb3/
 MqM61FpRqZKf8ve9BqJGm1gC0KM3eQ3qrqTWLKksOYf2pqrZGeeweNHmboD1YyD6ExZR
 Wt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FTJFgBVyDmUOEWvTRev7q14+qgObUW0H7ne5i0Gbe6Y=;
 b=O9zsSuafLOhLHEgX4Xdrzw3dY6Q1crA4O5e4770A2PXSKNyD2EnTOwFN882uPAx35U
 d4SB+Ye4WXoxpxMsZ2U43q2ibKrOKtS+Vvx8U0QZecdR8U5I4O/FoEuf7sYCmtFRuBeS
 Nj22ep7m6BCK2zH25Kj4QWZlZRhZv+7WS6+AQcqKooxLrzHJBjgMe0CfmItrkXygB0Ob
 RdE764YXkWZ55sLAW/VG3Y2bwSNueFe60T0NAw0cFHFjw+GNDgStoWV4XFYR9iGGcgkh
 eiFlQ3QnePjx3juyAVK8XC3VdVnW6AAFAEZmS60D6CPsInGCsAAGZMzRQS9CXnVaKPPX
 qpHg==
X-Gm-Message-State: AOAM532weDoiyZkmIciDpP74msdaQT+8spkEPxzQQYRY1061646Vtxfh
 q4Tobhyi/qQ5EyUuzxKOcWJhkQ==
X-Google-Smtp-Source: ABdhPJzY4rU2tPVJy8SezcMhmTeANCYark26o2ccH2Eo3RpalK98eq0y6YRbfDXggAfXeWgxMe1aUg==
X-Received: by 2002:a05:6830:1594:: with SMTP id
 i20mr9168662otr.279.1621435911905; 
 Wed, 19 May 2021 07:51:51 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 67sm4571702otp.68.2021.05.19.07.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:51:51 -0700 (PDT)
Date: Wed, 19 May 2021 09:51:49 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: abhinavk@codeaurora.org
Subject: Re: [Freedreno] [PATCH 0/4] drm/msm/dp: Add support for SC8180x eDP
 controller
Message-ID: <20210519145149.GX2484@yoga>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <40f6aefd3fa341e2bec2060106389be7@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40f6aefd3fa341e2bec2060106389be7@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sbillaka@codeaurora.org,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 18 May 22:41 CDT 2021, abhinavk@codeaurora.org wrote:

> Hi Bjorn
> 
> I had a quick glance on the series and before getting to other things wanted
> to know how you are initializing two different connectors for
> DP & EDP resp.
> 
> The connector type for DP should be DRM_MODE_CONNECTOR_DisplayPort and eDP
> should be DRM_MODE_CONNECTOR_eDP.

As far as I've been able to conclude there is no eDP support in the
upstream DPU driver; an encoder of type DRM_MODE_ENCODER_TMDS will only
attach to INTF_DP.

> We need both to be created so that both EDP and DP can be supported
> concurrently.
> 

Further more the DP controller driver has a global variable to track
state and the INTF-picker will always pick the interface of index 0 when
setting up the DP controller.

> Will these changes work for concurrent eDP and DP case?
> 

The proposed changes are all that I need to get eDP working on my
sc8180x laptop. But the DPU code does not currently support more than a
single DP interface - and that has to be on the first INTF_DP that the
DPU driver knows about.

But this is a limitation we should fix, rather than claiming that you
can only have one of each. Further more, afaict the sc7280 DP controller
can do both DP and eDP, so it would make sense not to distinguish the
interfaces as eDP or DP - just because the product in mind will use eDP.


PS. I've currently disabled the eDP interface on my laptop and am
working on trying to get Type-C DP working. Once that's in place I'd
need a better INTF/encoder picker - because the current model of just
picking INTF_DP 0 (or in a sequential fashion) won't work.

Regards,
Bjorn

> Thanks
> 
> Abhinav
> 
> On 2021-05-10 21:20, Bjorn Andersson wrote:
> > The first patch in the series is somewhat unrelated to the support, but
> > simplifies reasoning and debugging of timing related issues.
> > 
> > The second patch introduces support for dealing with different register
> > block
> > layouts, which is used in the forth patch to describe the hardware
> > blocks found
> > in the SC8180x eDP block.
> > 
> > The third patch configures the INTF_CONFIG register, which carries the
> > configuration for widebus handling. As with the DPU the bootloader
> > enables
> > widebus and we need to disable it, or implement support for adjusting
> > the
> > timing.
> > 
> > Bjorn Andersson (4):
> >   drm/msm/dp: Simplify the mvid/nvid calculation
> >   drm/msm/dp: Store each subblock in the io region
> >   drm/msm/dp: Initialize the INTF_CONFIG register
> >   drm/msm/dp: Add support for SC8180x eDP
> > 
> >  drivers/gpu/drm/msm/dp/dp_catalog.c | 99 +++++++----------------------
> >  drivers/gpu/drm/msm/dp/dp_display.c |  1 +
> >  drivers/gpu/drm/msm/dp/dp_parser.c  | 22 +++++++
> >  drivers/gpu/drm/msm/dp/dp_parser.h  |  8 +++
> >  4 files changed, 53 insertions(+), 77 deletions(-)
