Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D78C9DC0
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F0710E294;
	Mon, 20 May 2024 12:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="eda2OZxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723E210E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=FC82UVm0nxuHlkVFmwyybG3PQLsRDR21pe9bb6BPHdU=; b=eda2OZxYl8OiNQHS
 VtHxZlq2kddk2ePPDL7FY0UQ+TmTixzqliTNw2ZEChfdtaZSeshkyN2gZ28XshpU9zjTcr4b/KXdL
 jYQM0r3Nw8CiZ0A3+TWpor7FuLBBhAg9xbLzYiMqFNnJxjAjxmV7/vxT8oRsNXWJ8ftK4FbIVAlje
 DPrwSKD3ImxaKAoFjAIv0bTKraq7qa8kcFAhm8y0DOVA9q1Tv4TBWKGci5njpm8lIuJnhcJq+7n7f
 CJbCVvFGtXtAv+p9dcmra1P5DzH96jpNV5+H16olnDel8hNpw3WPEdzN1X2j2ceySqyYjIn9rMf2s
 8JzAOT8w0d2jj50evg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1s92a8-001g5e-0T;
 Mon, 20 May 2024 12:57:36 +0000
Date: Mon, 20 May 2024 12:57:36 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] drm/bridge: analogix: remove unused struct
 'bridge_init'
Message-ID: <ZktIwMWtQXuxCgRN@gallifrey>
References: <20240517232427.230709-1-linux@treblig.org>
 <6tfxkc3foarpfuo6viwmsm4e2ujxjmhpqsku37d4ov6ppufpjr@byrbjs7srqri>
 <ZkqAoG9ZGg0_dC-9@gallifrey>
 <la43b5ra7aziiv7dwt4o5zha3px7jarfmk45dwsf24qn6pgcre@pcmcsicjdrus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <la43b5ra7aziiv7dwt4o5zha3px7jarfmk45dwsf24qn6pgcre@pcmcsicjdrus>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 12:56:59 up 12 days, 11 min,  1 user,  load average: 0.06, 0.03, 0.00
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
> On Sun, May 19, 2024 at 10:43:44PM +0000, Dr. David Alan Gilbert wrote:
> > * Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> > > On Sat, May 18, 2024 at 12:24:27AM +0100, linux@treblig.org wrote:
> > > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > > 
> > > > 'bridge_init' is unused, I think following:
> > > > commit 6a1688ae8794 ("drm/bridge: ptn3460: Convert to I2C driver model")
> > > > (which is where a git --follow finds it)
> > > > Remove it.
> > > 
> > > Please rephrase the commit message following guidelines in
> > > Documentation/process. Use Fixes tags if suitable.
> > 
> > I specifically don't want to use Fixes in these set because
> > there's no need for someone to backport this to older
> > kernels that use the original, and many backporters
> > use 'Fixes' as an automated means to find stuff they should
> > backport.
> > 
> > Other than that, is there something specific you think I've
> > missed?
> 
> It's not about missing things. It's about a way it is written.
> Consider something like:
> 
> The commit aaaaaaa ("drm/bridge: foo bar") has dropped all the users of
> the struct bridge_init from the exynos_dp_core, while retainng unused
> structure definition. Later on the driver was reworked and the
> definition migrated to the analogix_dp driver. Remove unused struct
> bridge_init definition.

OK, v2 sent with text close to that.

> 
> > 
> > (I'm also purposely being less certain here, because --follow
> > is showing it in a ptn3460 and I don't quite follow
> > why that changes it here).
> 
> The mentioned commit is a correct one. Historically exynos_dp_core had
> been creating the ptn3460 bridge manually. Later on this was fixed in
> the ptn3640 driver and the code was dropped from exynos_dp_core.

Ah OK; remember I don't know the actual structure of these devices
or the history.

Dave

> > 
> > Dave
> > 
> > > 
> > > > 
> > > > Build tested.
> > > > 
> > > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > > ---
> > > >  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
> > > >  1 file changed, 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > > index df9370e0ff23..1e03f3525a92 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > > @@ -36,11 +36,6 @@
> > > >  
> > > >  static const bool verify_fast_training;
> > > >  
> > > > -struct bridge_init {
> > > > -	struct i2c_client *client;
> > > > -	struct device_node *node;
> > > > -};
> > > > -
> > > >  static int analogix_dp_init_dp(struct analogix_dp_device *dp)
> > > >  {
> > > >  	int ret;
> > > > -- 
> > > > 2.45.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > -- 
> >  -----Open up your eyes, open up your mind, open up your code -------   
> > / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> > \        dave @ treblig.org |                               | In Hex /
> >  \ _________________________|_____ http://www.treblig.org   |_______/
> 
> -- 
> With best wishes
> Dmitry
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
