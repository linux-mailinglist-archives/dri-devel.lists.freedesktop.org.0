Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD0343260C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 20:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0726E0AB;
	Mon, 18 Oct 2021 18:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298746E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 18:07:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634580474; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wE6yodEiHlCyDKx6c+cRw1HegT8wlNeH4R9hFXJ+hrA=;
 b=ZDikLWxWPzL3bYSCDAYgn65AqtHk8lm0ue301SSYJ5P9R6GJxWWpfN+lnGq/XlCUc1i/BPhE
 +9H18um3/+Lq32f21cjStkU7iMpgSUBME0qXeJSPMZb6TRaHI3A7c1QE/cXaO2y5yarEZ6dK
 yIg/fQF9sfHAMHZdhyhgf3rW2Nw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 616db7d8ea41a97c246117e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Oct 2021 18:07:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BA394C4360D; Mon, 18 Oct 2021 18:07:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 835DAC4338F;
 Mon, 18 Oct 2021 18:07:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 18 Oct 2021 11:07:17 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Move debugfs files into
 subdirectory
In-Reply-To: <YWxSWlRp+log+Trz@ripper>
References: <20211015231702.1784254-1-bjorn.andersson@linaro.org>
 <f72263e0d4c118653fff8b1341dc487b@codeaurora.org> <YWxSWlRp+log+Trz@ripper>
Message-ID: <7a77045f4069a21305e5c3614a6739f0@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

Hi Bjorn

On 2021-10-17 09:42, Bjorn Andersson wrote:
> On Fri 15 Oct 16:53 PDT 2021, abhinavk@codeaurora.org wrote:
> 
>> On 2021-10-15 16:17, Bjorn Andersson wrote:
>> > In the cleanup path of the MSM DP driver the DP driver's debugfs files
>> > are destroyed by invoking debugfs_remove_recursive() on debug->root,
>> > which during initialization has been set to minor->debugfs_root.
>> >
>> > To allow cleaning up the DP driver's debugfs files either each dentry
>> > needs to be kept track of or the files needs to be put in a subdirectory
>> > which can be removed in one go.
>> >
>> > By choosing to put the debugfs files in a subdirectory, based on the
>> > name of the associated connector this also solves the problem that these
>> > names would collide as support for multiple DP instances are introduced.
>> >
>> > One alternative solution to the problem with colliding file names would
>> > have been to put keep track of the individual files and put them under
>> > the connector's debugfs directory. But while the drm_connector has been
>> > allocated, its associated debugfs directory has not been created at the
>> > time of initialization of the dp_debug.
>> >
>> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> 
>> I have been thinking about this problem ever since multi-DP has been 
>> posted
>> :)
>> Creating sub-directories seems right but at the moment it looks like 
>> IGT
>> which
>> uses these debugfs nodes doesnt check sub-directories:
>> 
>> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tools/msm_dp_compliance.c#L215
>> 
>> It looks for the DP debugfs nodes under /sys/kernel/debug/dri/*/
>> 
>> We have to fix IGT too to be able to handle multi-DP cases. I will try 
>> to
>> come up
>> with a proposal to address this.
>> 
>> Till then, can we go with the other solution to keep track of the 
>> dentries?
>> 
> 
> I'm afraid I don't see what you're proposing.
> 
> Afaict we need one set of dp_test{type,active,data} per DP controller,
> so even doing this by keeping track of the dentries requires that we
> rename the files based on some identifier (id or connector name) - 
> which
> will cause igt to break.

Yes, I also thought the same that there needs to be some identifier.

"To allow cleaning up the DP driver's debugfs files either each dentry
needs to be kept track of or the files needs to be put in a subdirectory
which can be removed in one go"

I guess I misunderstood your statement in the commit text thinking that 
you
had some other way to keep track of the dentries as it mentioned that
use a subdirectory OR keep track of each dentry.

> 
> As such, I think the practical path forward is that we merge the
> multi-DP series as currently proposed. This will not cause any issues 
> on
> single-DP systems, but on multi-DP systems we will have warnings about
> duplicate debugfs entries in the kernel logs.
> 
> Then you can figure out how to rework igt to deal with the multiple DP
> instances and update the dp_debug interface accordingly.
> 

Fine with me, I will take care of this.

> 
> Which also implies that we should hold this patch back. But if we go
> that path, I think we should fix dp_debug_deinit() so that it doesn't
> remove /sys/kernel/debug/dri/128 when the DP driver is unloaded.
Yes, lets hold this patch back till I fix multi-DP for IGT.
> 
> Regards,
> Bjorn
> 
>> > ---
>> >
>> > This depends on
>> > https://lore.kernel.org/linux-arm-msm/20211010030435.4000642-1-bjorn.andersson@linaro.org/
>> > reducing the connector from a double pointer.
>> >
>> >  drivers/gpu/drm/msm/dp/dp_debug.c | 15 +++++++++------
>> >  1 file changed, 9 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
>> > b/drivers/gpu/drm/msm/dp/dp_debug.c
>> > index da4323556ef3..67da4c69eca1 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
>> > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
>> > @@ -210,26 +210,29 @@ static const struct file_operations
>> > test_active_fops = {
>> >  static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor
>> > *minor)
>> >  {
>> >  	int rc = 0;
>> > +	char path[64];
>> >  	struct dp_debug_private *debug = container_of(dp_debug,
>> >  			struct dp_debug_private, dp_debug);
>> >
>> > -	debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
>> > +	snprintf(path, sizeof(path), "msm_dp-%s", debug->connector->name);
>> > +
>> > +	debug->root = debugfs_create_dir(path, minor->debugfs_root);
>> > +
>> > +	debugfs_create_file("dp_debug", 0444, debug->root,
>> >  			debug, &dp_debug_fops);
>> >
>> >  	debugfs_create_file("msm_dp_test_active", 0444,
>> > -			minor->debugfs_root,
>> > +			debug->root,
>> >  			debug, &test_active_fops);
>> >
>> >  	debugfs_create_file("msm_dp_test_data", 0444,
>> > -			minor->debugfs_root,
>> > +			debug->root,
>> >  			debug, &dp_test_data_fops);
>> >
>> >  	debugfs_create_file("msm_dp_test_type", 0444,
>> > -			minor->debugfs_root,
>> > +			debug->root,
>> >  			debug, &dp_test_type_fops);
>> >
>> > -	debug->root = minor->debugfs_root;
>> > -
>> >  	return rc;
>> >  }
