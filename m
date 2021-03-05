Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11232F2CD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 19:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969EC6E2B6;
	Fri,  5 Mar 2021 18:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD976E2B6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 18:38:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614969497; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=osjZTzJLJWcqCLVpSskqeQnmz4nbllh1a3JglbqZKiI=;
 b=q2dTXmxOCPx6ud7elZ5rE98M/0YSTtvnPxxrfoHUo2mOfjvNR8oS0CllQJnP90rLeUsuUISR
 VEkhnoCeAcLV3q+w0bx1c7V3hq5MiqhxTk0iotFI5RXTsIedYvBzo+lRy2Mm+IMXUZEKMWmV
 k81nk8OPMoUB7dB15zzXSIUbDS4=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60427a98c862e1b9fdaf139d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 18:38:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E8715C43461; Fri,  5 Mar 2021 18:38:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C04E1C433C6;
 Fri,  5 Mar 2021 18:38:14 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 05 Mar 2021 10:38:14 -0800
From: abhinavk@codeaurora.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Fix warnings reported by kbot in
 DP driver
In-Reply-To: <20210305072350.GF2222@kadam>
References: <1614907912-6880-1-git-send-email-abhinavk@codeaurora.org>
 <161492735848.1478170.885416005935439120@swboyd.mtv.corp.google.com>
 <20210305072350.GF2222@kadam>
Message-ID: <4dc46ac4940a0c9d070f04088df58c81@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 seanpaul@chromium.org, tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

Thanks for the review.
I will break this up into patches according to the class of warning to 
show the warning in the commit text
and resend the patches.

Abhinav
On 2021-03-04 23:23, Dan Carpenter wrote:
> On Thu, Mar 04, 2021 at 10:55:58PM -0800, Stephen Boyd wrote:
>> > @@ -368,44 +368,21 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
>> >         int rc = 0;
>> >         struct dp_debug_private *debug = container_of(dp_debug,
>> >                         struct dp_debug_private, dp_debug);
>> > -       struct dentry *file;
>> > -       struct dentry *test_active;
>> > -       struct dentry *test_data, *test_type;
>> >
>> > -       file = debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
>> > +       debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
>> >                         debug, &dp_debug_fops);
>> > -       if (IS_ERR_OR_NULL(file)) {
>> > -               rc = PTR_ERR(file);
>> > -               DRM_ERROR("[%s] debugfs create file failed, rc=%d\n",
>> > -                                 DEBUG_NAME, rc);
>> > -       }
>> >
>> > -       test_active = debugfs_create_file("msm_dp_test_active", 0444,
>> > +       debugfs_create_file("msm_dp_test_active", 0444,
>> >                         minor->debugfs_root,
>> >                         debug, &test_active_fops);
>> > -       if (IS_ERR_OR_NULL(test_active)) {
>> > -               rc = PTR_ERR(test_active);
>> > -               DRM_ERROR("[%s] debugfs test_active failed, rc=%d\n",
>> > -                                 DEBUG_NAME, rc);
>> > -       }
>> >
>> > -       test_data = debugfs_create_file("msm_dp_test_data", 0444,
>> > +       debugfs_create_file("msm_dp_test_data", 0444,
>> >                         minor->debugfs_root,
>> >                         debug, &dp_test_data_fops);
>> > -       if (IS_ERR_OR_NULL(test_data)) {
>> > -               rc = PTR_ERR(test_data);
>> > -               DRM_ERROR("[%s] debugfs test_data failed, rc=%d\n",
>> > -                                 DEBUG_NAME, rc);
>> > -       }
>> >
>> > -       test_type = debugfs_create_file("msm_dp_test_type", 0444,
>> > +       debugfs_create_file("msm_dp_test_type", 0444,
>> >                         minor->debugfs_root,
>> >                         debug, &dp_test_type_fops);
>> > -       if (IS_ERR_OR_NULL(test_type)) {
>> > -               rc = PTR_ERR(test_type);
>> > -               DRM_ERROR("[%s] debugfs test_type failed, rc=%d\n",
>> > -                                 DEBUG_NAME, rc);
>> > -       }
>> 
>> Debugfs failures.
> 
> [ Update.  I misunderstood what you were saying, and initially thought
>   you were critiquing the patch instead of the commit message.  The
>   patch looks okay.  Probably a lot of maintainers would prefer it
>   broken multiple chunks with one patch per class of warning.  But I
>   already wrote this email and I love the sound of my own voice so I'm
>   sending it.  - dan ]
> 
> The Smatch warning for this was that the error handling was slightly
> off because debugfs_create_file() doesn't return NULL these days.  But
> really these functions are not supposed to be error checked in the
> normal case.
> 
> If you do a `git grep -w debugfs_create_file` there are 1472 callers
> and only 192 check.  This is partly because Greg went through and did a
> mass delete of error handling.
> 
> The way that debugfs works is if you fail to create a directory then
> the debugfs_create_file will check if the root is an error pointer.  So
> passing it "handles" errors itself.
> 
> The one time where I've seen that checking for errors is essential is
> if they driver dereferences the "test_data" dentry itself.  That's
> pretty uncommon.
> 
> [ So probably the commit message for this chunk should be:
> 
>   Delete unnecessary debugfs error handling
> 
>   Debugfs functions are not supposed to be checked in the normal case
>   so delete this code.  Also it silences a Smatch warning that we're
>   checking for NULL when these functions only return error pointers.  ]
> 
> regards,
> dan carpenter
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
