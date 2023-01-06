Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4EA65F86C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 02:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DF710E116;
	Fri,  6 Jan 2023 00:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A4D10E116
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 00:59:55 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so3739305pjj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 16:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vnoPpXjP1zQGbMmmew/4jTnfiZUKCPX+oITXMMquXbU=;
 b=WZexEQBQXq1NLHzHrMw8jHw7T/CLPQrdVrBqA4GjnX6U5NwCeeMFs1SIkvUYAKGS98
 N3VlZvHib+j7hdImeXbyC4sKcYX84zjllRjOpyoQwjEmv4E0E1BSu5Vd0z7cV3GZ+bSq
 b/cA0CQgPqPzlS5WiDV3DpAosZSW5A7qeddjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vnoPpXjP1zQGbMmmew/4jTnfiZUKCPX+oITXMMquXbU=;
 b=dtPYEOuPf92IUDcVQgMNyWu+9CFXEvEZRLqpMJAk2WGFkbuHWlq99HySqPl11goU8a
 1wBUgU3LEF+EVXGqATfzda8LEjESa+UmlRCcW4XDWHLkPLyM/OPFFxCLxdiFLHdxrp8F
 Kf6B8FN9W4rZSjmT4bm0PAa+VzmH1gFRtFmund4425SnnDuxb87u8NczumdcN+Gl6Y0N
 j6Owwu6TL+2U+YBvTshKMKzQ60W20fC5HWsxr/LFzTD5wi50gaAoMva3OAjdpW0cvafr
 SZVQTiFbKHDTmOGizcxXbW2wriMhaCap25hD97nBewHRFYI6Svv/nwyq7iuKqmuTSvxW
 Q+Tw==
X-Gm-Message-State: AFqh2kp7XzGeepPHTnxPzZlt5Dt4UG9VsmHzBWMLkTgwrXY0ddAyDnaz
 sxehSTa60aXaO61wArBC6n4SyA==
X-Google-Smtp-Source: AMrXdXsN6USxhK6rk2gp7+m1QZyksDu7dOnHJN8UlVr6dv8CGvEwsP8D9AZXiVvD505OO+lN9+RtyA==
X-Received: by 2002:a05:6a21:1708:b0:af:b770:bce5 with SMTP id
 nv8-20020a056a21170800b000afb770bce5mr65543337pzb.53.1672966795423; 
 Thu, 05 Jan 2023 16:59:55 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5567:fb20:aa4f:352])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a63e207000000b004a0127e8ca5sm10329844pgh.86.2023.01.05.16.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 16:59:54 -0800 (PST)
Date: Thu, 5 Jan 2023 16:59:51 -0800
From: Brian Norris <briannorris@chromium.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Message-ID: <Y7dyh1AkJRZnf+Dq@google.com>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk> <Y5qOwmqIIp+2qWOy@google.com>
 <Y6OCg9BPnJvimQLT@google.com>
 <a62cd71c-f025-739a-4822-58ff8fa78cbd@mailbox.org>
 <Y7TgXA+bnkPm4y/6@google.com>
 <9ff68af1-63f6-1a95-6380-d0d8503fe511@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ff68af1-63f6-1a95-6380-d0d8503fe511@mailbox.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, kernelci-results@groups.io,
 bot@kernelci.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Mark Brown <broonie@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 10:11:46AM +0100, Michel Dänzer wrote:
> On 1/4/23 03:11, Brian Norris wrote:
> > On Tue, Jan 03, 2023 at 07:04:00PM +0100, Michel Dänzer wrote:
> >> On 12/21/22 23:02, Brian Norris wrote:
> > 
> >>> 3. leave vblank enabled even in the presence of PSR
> > 
> > I'm leaning toward this.
> 
> If this means vblank interrupts will arrive as expected even while in PSR, that may be the ideal solution indeed.

Yes. And I think I have a working patchset for this now. It passes all
the igt-gpu-tools/kms_vblank tests for me now, and I don't think it
causes any other issues. I'll send it out shortly, after a bit more
testing.

Side note: I believe this vblank-disabled issue actually came in as an
upstream regression at commit 6c836d965bad ("drm/rockchip: Use the
helpers for PSR"); before that, we were doing this very differently, and
didn't touch vblank at all for PSR, similar to the "downstream" stuff I
mentioned earlier.

> >> 5. Go/stay out of PSR while vblank interrupts are enabled (probably want to make sure vblankoffdelay is set up such that vblank interrupts are disabled ASAP)
> > 
> > That seems not extremely nice, to waste power. Based on the earlier
> > downstream implementation (which left vblank interrupts enabled), I'd
> > wager there's a much larger power win from PSR (on the display-transport
> > and memory-bandwidth costs), relative to the power cost of vblank
> > interrupts.
> > 
> > Also, messing with vblankoffdelay sounds likely to trigger the races
> > mentioned in the drm_vblank.c kerneldoc.
> 
> Not sure how likely that is, quite a few drivers are setting dev->vblank_disable_immediate = true.
> 
> With that, vblank interrupts should generally be enabled only while there are screen updates as well[0], in which case PSR shouldn't be possible anyway.
> 
> [0] There may be user space which uses the vblank ioctls even while there are no screen updates though, which would prevent PSR in this case.

OK. I'm just reading docs here; definitely not an expert.

> >>> [1] Or is it? I don't really know the DRM_IOCTL_WAIT_VBLANK ABI
> >>>     contract in the presence of PSR, but I believe the upstream PSR
> >>>     support has always worked this way. I could imagine
> >>>     DRM_IOCTL_WAIT_VBLANK users might not love seeing EINVAL here
> >>>     though.
> >>
> >> Yeah, that's pretty likely to cause issues with existing real-world user space.
> > 
> > OK. Any hints as to what kind of user space uses this?
> 
> I don't have any specific example, just thinking about how user space could respond to the vblank ioctls returning an error, and it would seem to be generally either of:
> 
> * Just run non-throttled, which might negate any energy savings from PSR
> * Fail to work altogether
> 
> 
> > I'm in part simply curious, but I'm also wondering what the
> > error-handling and reliability (e.g., what if vblanks don't come?)
> > expectations might be in practice.
> 
> If vblank events never come, user space might freeze.

Thanks. If my patchset works out like I expect, this should no longer be
noticeable to user space, so I don't really have to test out your
educated guesses :)

Thanks for the idea-bouncing.

Brian
