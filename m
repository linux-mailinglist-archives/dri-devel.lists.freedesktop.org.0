Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6AA1684BF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 18:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437516F4E2;
	Fri, 21 Feb 2020 17:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED296F4E2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 17:20:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a9so2720119wmj.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 09:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v1x7bpCnIibbGCH7vow2zjE4WbYwbpuALKD1dVsQciM=;
 b=NuvZRnljZ8IwMhvWRX93FqBH9KLlg8f2/Qy3E+Fzt5JLfyo7i0hplG1HWGbpCchBrm
 MGvhRDhXP5eIy0L5LmwyELW3AqrzsYFPbjQMhu4FfVoTQIcMrQ9Lx8VxZp8Y4rc8ypge
 CzCHvrx1myTym9+6BrnKIqsY5V68cqCklwNLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v1x7bpCnIibbGCH7vow2zjE4WbYwbpuALKD1dVsQciM=;
 b=nIweun7knKpVybm3tYOdESG1Z6wvRZiUxpwdDm4/H/ny/DsMbZhGTSSPff4tZWTKmO
 9/fOozShKPojYKJRTEvJBBq9RftK21rLPSYcbYK5UnJpfebxrXrGOypCx3ExrDGtN6kz
 ZdvpX1vMUar9h5HYBwWtWUbls1eXarSdaoPLLG6W0nkuup+mumX/+8l0BvDexQEtsLpU
 yxsGTbVe2PcX8DvXU3D2qOXi97VZBqW1wmFz8M0PP5D+EFGDaZbS46MlfiWr8kava0Cz
 BHyE5tefyYVYBSPgaSqCnJ1hSJFTVfqAJDC6sn3kuMtTq9JAuDXPCXpk+AJ0ZnXch4Wx
 H0TA==
X-Gm-Message-State: APjAAAUDDwatNsRnSXt3eePLjkVP+aofUrPtPScz5N3gYntKcu1vB7ms
 yNauWA1jIi8Mn4SG+pfLhOgGIw==
X-Google-Smtp-Source: APXvYqwdrKz+q3hvVIVqlt+Zt1uWCClgCHam1+dzHpt25BiNvALl7KSCjR8oI9LjLg99hcr9eBMEFA==
X-Received: by 2002:a1c:ded7:: with SMTP id v206mr5096361wmg.106.1582305625276; 
 Fri, 21 Feb 2020 09:20:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y6sm4571010wrl.17.2020.02.21.09.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:20:24 -0800 (PST)
Date: Fri, 21 Feb 2020 18:20:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: jsanka@codeaurora.org
Subject: Re: Support for early wakeup in DRM
Message-ID: <20200221172022.GF2363188@phenom.ffwll.local>
References: <00e901d5e81d$fd609ac0$f821d040$@codeaurora.org>
 <20200220201458.GB2363188@phenom.ffwll.local>
 <f4f899ae9b035e2eb5ddc89e3c1a120b@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4f899ae9b035e2eb5ddc89e3c1a120b@codeaurora.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: 'Sean Paul' <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 01:24:00PM -0800, jsanka@codeaurora.org wrote:
> On 2020-02-20 12:14, Daniel Vetter wrote:
> > On Thu, Feb 20, 2020 at 10:45:57AM -0800, jsanka@codeaurora.org wrote:
> > > Hello All,
> > > 
> > > I am seeking recommendations for DRM compatible methods of updating
> > > the
> > HW
> > > other than frame commit path. When exiting idle/runtime_suspend, the
> > driver
> > > votes for a bunch of resources including power/clk/bandwidth as a part
> > of
> > > first commit handling. This usually adds a few millisecond delay
> > > before
> > > processing the frame. The requirement is to find possible ways to
> > > reduce
> > > this delay by providing an early intimation to the framework to
> > "prepare"
> > > the HW by voting for the resources and keep the HW ready to process an
> > > imminent frame commit. Especially in performance oriented Automotive
> > world,
> > > these delays are very time critical and we are working on ways to
> > mitigate
> > > them.
> > > 
> > > 
> > > 
> > > DRM framework converges all the parameters affecting the HW in terms
> > > of
> > DRM
> > > properties in a single COMMIT call. To address the above issue, we
> > > need
> > a
> > > parallel channel which should allow the framework to make necessary
> > changes
> > > to the HW without violating the master access privileges.
> > > 
> > > 
> > > 
> > > Before resorting to custom downstream ways, I want to check with the
> > > community for folks who might have encountered and resolved such
> > > issues.
> > 
> > Just enable the display, which will grab all the clocks and everything?
> > Once the display is on a commit should be possible on the next frame, at
> > least for well-working drivers.
> > -Daniel
> > 
> I believe even to turn on the display, DRM will need an explicit commit
> (probably without any planes/pixel buffers). For cases like smart panels,
> where we can keep the panel on(panel internal RAM refresh) and power
> collapse the display HW, resuming back with an explicit commit will push a
> black (or default color programmed in the HW) frame causing a glitch.

Uh, you might want to look into the self-refresh helpers, which do this
without black frames and stuff.

But yeah if there's really a gap here (and not just you folks creatively
abusing atomic kms in ways that it was not meant to be used) then we can
add a property that forbids power optimization and guarantee that you can
do the next screen update immediately. And then we can merge that with all
the usual requirements (driver implementation that works, open source
userspace, igt testcase, the full deal).

But it still feels like you're trying to do something automatically that's
not meant to work like this.

Cheers, Daniel

> 
> Thanks and Regards,
> Jeykumar S.
> > > 
> > > 
> > > 
> > > Thanks and Regards,
> > > 
> > > Jeykumar S
> > > 
> > > Qualcomm Inc.
> > > 
> > > 
> > > 
> > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
