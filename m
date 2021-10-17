Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3BF430AD7
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 18:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C2A6E7E6;
	Sun, 17 Oct 2021 16:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2BC6E7E6
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 16:40:16 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 w9-20020a4adec9000000b002b696945457so4798981oou.10
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S+wD9XkgSed3YnQrWeHZSeNz6phpMb5NOVyWUp1LNR8=;
 b=IqRj1TgGnkmpeqB32fjFM4JGdwwpjL3umO4j6FYp4tM0j2vnN1b+zcHFo+VVJ+Oumb
 Q838SKAo/Waru9Dnnryg7vfLZRYGdlBn2T1y+3+FL18PbTNEfX5LyQNyfU6FINvLXxbY
 YUkJozYh8elTnWdoGOBV3TkFzZLdPKkcQSfAbjv9nnD4Thwr+RYFbQcB/hHmGrIkLeTT
 H+OoXpvF5iryEE47MjaSSHqcM+DKNmqkrRr+1JwbQWn0KHLm1+ai3gzktMZ1V9Y+0voN
 qe8sTFRxqgrVfGhR0Jxl8N04zUOTi5ZKhTeEtS6WPXFo0+wPXc3zsTEs9mZTPEig46S0
 15iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S+wD9XkgSed3YnQrWeHZSeNz6phpMb5NOVyWUp1LNR8=;
 b=vezJY3bKrgammPL71imt1KhABTalqyTXNGuZ8HcVr6+CEjMMn+XEUbau/bk+HCS3sh
 7X6iO93vhHag7WBrynA99LXIo4ieeo8sojjRZD8ZCJLRjs41BGB4CmZqpK+KqymhWlLJ
 ZsjHQz+9OK2OMu3ziGxHWe9GwwCXScf1Kx/GWu/ORgRjNBxN0/8tFafU0gTcQNnedz/y
 /9EbpfUjv+Q4gy4+O5t62KC+rDtAjNLEoXKQbpfvIv/5x4D6W+tokyol4kB/1FJSIEKn
 pHoLy+JL76aUy9UAlmT/eeuWhcCkFyaT1mPrVo0HvPRq4JFxeCKSaCFCxtM+hZcTnf1F
 fuVw==
X-Gm-Message-State: AOAM532WADm5Xpss6Tyu9JBTiILV8+BqbJIe3YqC8bkLHwVPDMoCherU
 GygGj9W95xyb/ZVz7pedAK1J8w==
X-Google-Smtp-Source: ABdhPJxV1Dyy+xIIE2S8LmCEwYcnn47VfSispukfh6RIemyyEc+rIhY/8swuUr7SZouT5A4LUkO+Cw==
X-Received: by 2002:a4a:e1fd:: with SMTP id u29mr17911773ood.0.1634488815468; 
 Sun, 17 Oct 2021 09:40:15 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id t8sm2547964otc.74.2021.10.17.09.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 09:40:14 -0700 (PDT)
Date: Sun, 17 Oct 2021 09:42:02 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: abhinavk@codeaurora.org
Cc: Rob Clark <robdclark@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Move debugfs files into
 subdirectory
Message-ID: <YWxSWlRp+log+Trz@ripper>
References: <20211015231702.1784254-1-bjorn.andersson@linaro.org>
 <f72263e0d4c118653fff8b1341dc487b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f72263e0d4c118653fff8b1341dc487b@codeaurora.org>
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

On Fri 15 Oct 16:53 PDT 2021, abhinavk@codeaurora.org wrote:

> On 2021-10-15 16:17, Bjorn Andersson wrote:
> > In the cleanup path of the MSM DP driver the DP driver's debugfs files
> > are destroyed by invoking debugfs_remove_recursive() on debug->root,
> > which during initialization has been set to minor->debugfs_root.
> > 
> > To allow cleaning up the DP driver's debugfs files either each dentry
> > needs to be kept track of or the files needs to be put in a subdirectory
> > which can be removed in one go.
> > 
> > By choosing to put the debugfs files in a subdirectory, based on the
> > name of the associated connector this also solves the problem that these
> > names would collide as support for multiple DP instances are introduced.
> > 
> > One alternative solution to the problem with colliding file names would
> > have been to put keep track of the individual files and put them under
> > the connector's debugfs directory. But while the drm_connector has been
> > allocated, its associated debugfs directory has not been created at the
> > time of initialization of the dp_debug.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> I have been thinking about this problem ever since multi-DP has been posted
> :)
> Creating sub-directories seems right but at the moment it looks like IGT
> which
> uses these debugfs nodes doesnt check sub-directories:
> 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tools/msm_dp_compliance.c#L215
> 
> It looks for the DP debugfs nodes under /sys/kernel/debug/dri/*/
> 
> We have to fix IGT too to be able to handle multi-DP cases. I will try to
> come up
> with a proposal to address this.
> 
> Till then, can we go with the other solution to keep track of the dentries?
> 

I'm afraid I don't see what you're proposing.

Afaict we need one set of dp_test{type,active,data} per DP controller,
so even doing this by keeping track of the dentries requires that we
rename the files based on some identifier (id or connector name) - which
will cause igt to break.

As such, I think the practical path forward is that we merge the
multi-DP series as currently proposed. This will not cause any issues on
single-DP systems, but on multi-DP systems we will have warnings about
duplicate debugfs entries in the kernel logs.

Then you can figure out how to rework igt to deal with the multiple DP
instances and update the dp_debug interface accordingly.


Which also implies that we should hold this patch back. But if we go
that path, I think we should fix dp_debug_deinit() so that it doesn't
remove /sys/kernel/debug/dri/128 when the DP driver is unloaded.

Regards,
Bjorn

> > ---
> > 
> > This depends on
> > https://lore.kernel.org/linux-arm-msm/20211010030435.4000642-1-bjorn.andersson@linaro.org/
> > reducing the connector from a double pointer.
> > 
> >  drivers/gpu/drm/msm/dp/dp_debug.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
> > b/drivers/gpu/drm/msm/dp/dp_debug.c
> > index da4323556ef3..67da4c69eca1 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> > @@ -210,26 +210,29 @@ static const struct file_operations
> > test_active_fops = {
> >  static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor
> > *minor)
> >  {
> >  	int rc = 0;
> > +	char path[64];
> >  	struct dp_debug_private *debug = container_of(dp_debug,
> >  			struct dp_debug_private, dp_debug);
> > 
> > -	debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
> > +	snprintf(path, sizeof(path), "msm_dp-%s", debug->connector->name);
> > +
> > +	debug->root = debugfs_create_dir(path, minor->debugfs_root);
> > +
> > +	debugfs_create_file("dp_debug", 0444, debug->root,
> >  			debug, &dp_debug_fops);
> > 
> >  	debugfs_create_file("msm_dp_test_active", 0444,
> > -			minor->debugfs_root,
> > +			debug->root,
> >  			debug, &test_active_fops);
> > 
> >  	debugfs_create_file("msm_dp_test_data", 0444,
> > -			minor->debugfs_root,
> > +			debug->root,
> >  			debug, &dp_test_data_fops);
> > 
> >  	debugfs_create_file("msm_dp_test_type", 0444,
> > -			minor->debugfs_root,
> > +			debug->root,
> >  			debug, &dp_test_type_fops);
> > 
> > -	debug->root = minor->debugfs_root;
> > -
> >  	return rc;
> >  }
