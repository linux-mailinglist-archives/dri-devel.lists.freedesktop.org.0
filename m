Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7592C662B54
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 17:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8348F10E445;
	Mon,  9 Jan 2023 16:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471ED10E4AD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 16:35:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BB02B80E62;
 Mon,  9 Jan 2023 16:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30543C433D2;
 Mon,  9 Jan 2023 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673282121;
 bh=umPOwY842WPvWxkEqRjKZxzSq09MaxAOymz700VqRaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mxSVAkFKU+d+OE0pcqgp/ey0snTrGmxrVzKT4+kH5Z9Gjy6LMo9iM1snpntAm6pZJ
 AqBucc1dJCGujWc2h7JT8GxDC5+oXMcDho+f80vPDtyLIq1gxMkl3VNlm3CPCN+d0c
 0GMSxhAw3chx2KHvMFVpe0OnKdJ/sI0vXLSrk4FwB3dzvRqAWgSTRgZw+mv1royWBA
 eKd1lRWFeCZ88So1JoCN01OJMwuBE0LJnnx8Rnk4YMtip0w7Ctm7KXJ8w01dJhmrcL
 g/46Cb6EicB+AcU91U9eGa4fAx4BOZoMGlWsU5ugCzNhkXZvcehtE2bplAmie3IEwR
 RIMlG3W8WA8tg==
Date: Mon, 9 Jan 2023 16:35:15 +0000
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH RESEND 1/4] backlight: aat2870: Use backlight helper
Message-ID: <Y7xCQ68aRTK19eRg@google.com>
References: <20230106164856.1453819-2-steve@sk2.org>
 <Y7hdyPAKBYv+gAzf@phenom.ffwll.local> <Y7vsAdMqGNgYS/m9@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y7vsAdMqGNgYS/m9@aspen.lan>
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
Cc: linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 09 Jan 2023, Daniel Thompson wrote:

> On Fri, Jan 06, 2023 at 06:43:36PM +0100, Daniel Vetter wrote:
> > On Fri, Jan 06, 2023 at 05:48:52PM +0100, Stephen Kitt wrote:
> > > Instead of retrieving the backlight brightness in struct
> > > backlight_properties manually, and then checking whether the backlight
> > > should be on at all, use backlight_get_brightness() which does all
> > > this and insulates this from future changes.
> > >
> > > Signed-off-by: Stephen Kitt <steve@sk2.org>
> >
> > Lee/Daniel, will you pick these up, or should I smash them all into
> > drm-misc-next for 6.3?
> 
> Outside of holiday, Lee usually hoovers up the backlight patches (and
> negotiates about who merges what).

Right, I'll collect these into the Backlight tree if there aren't any
build deps involved.  If there are, we'll need to devise a strategy
that will likely involve immutable branches.

-- 
Lee Jones [李琼斯]
