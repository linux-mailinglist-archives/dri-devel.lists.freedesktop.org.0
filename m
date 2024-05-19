Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D4E8C9752
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C2810E0AB;
	Sun, 19 May 2024 22:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="AnjKfBO/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A2510E0AB
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=J3/ioIXhhPl1WkhHdEKeMp+H1rIxu4VfJ+H2RNtKwnA=; b=AnjKfBO/Nebgq+Gr
 chrvfBHUY94HIwTYaudj092q02/oF+gR3Q2LzX/VY9hiEoiPi8jFo3kUl9CJ8rQsri9F43Tgvzdfz
 HDkaOY82DD+dMdyBYQm31RmF6i5pKcWDlXMMyJ0s6ljSfwAAjw0Bxvv3vbAuh4t8kamIvI95wLXuZ
 PBq0MOVwhERb4l919Kuk3kKdzJI2xyvk7gXCTcqE5sPW04SAPc4ihtWo2Qc6MoJgi/ab6unhVsX0B
 bMuDxo5zECrwZpzABBoa4ODiYAzwgSdrv32u7xZIsmEFbx5psAQ9lO9q/sxpCEdLV/wm9+nbf62nt
 5Eoc0Q+qXTlxXmOo7w==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1s8pFo-001bZi-1W;
 Sun, 19 May 2024 22:43:44 +0000
Date: Sun, 19 May 2024 22:43:44 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] drm/bridge: analogix: remove unused struct
 'bridge_init'
Message-ID: <ZkqAoG9ZGg0_dC-9@gallifrey>
References: <20240517232427.230709-1-linux@treblig.org>
 <6tfxkc3foarpfuo6viwmsm4e2ujxjmhpqsku37d4ov6ppufpjr@byrbjs7srqri>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <6tfxkc3foarpfuo6viwmsm4e2ujxjmhpqsku37d4ov6ppufpjr@byrbjs7srqri>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 22:40:28 up 11 days, 9:54, 1 user, load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> On Sat, May 18, 2024 at 12:24:27AM +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > 'bridge_init' is unused, I think following:
> > commit 6a1688ae8794 ("drm/bridge: ptn3460: Convert to I2C driver model")
> > (which is where a git --follow finds it)
> > Remove it.
> 
> Please rephrase the commit message following guidelines in
> Documentation/process. Use Fixes tags if suitable.

I specifically don't want to use Fixes in these set because
there's no need for someone to backport this to older
kernels that use the original, and many backporters
use 'Fixes' as an automated means to find stuff they should
backport.

Other than that, is there something specific you think I've
missed?

(I'm also purposely being less certain here, because --follow
is showing it in a ptn3460 and I don't quite follow
why that changes it here).

Dave

> 
> > 
> > Build tested.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > index df9370e0ff23..1e03f3525a92 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > @@ -36,11 +36,6 @@
> >  
> >  static const bool verify_fast_training;
> >  
> > -struct bridge_init {
> > -	struct i2c_client *client;
> > -	struct device_node *node;
> > -};
> > -
> >  static int analogix_dp_init_dp(struct analogix_dp_device *dp)
> >  {
> >  	int ret;
> > -- 
> > 2.45.1
> > 
> 
> -- 
> With best wishes
> Dmitry
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
