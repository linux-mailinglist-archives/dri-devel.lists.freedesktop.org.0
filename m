Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56501F6E77
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 22:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180C76E939;
	Thu, 11 Jun 2020 20:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D31E6E939
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 20:07:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591906050; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2LcVzRPJEhV4O10eqHRYEY4V6niPeDTAOUYJlix3ses=;
 b=cVZlZlV8fdZfP7ms7q5leGKxFx+f6aB9+U9b42cFyvLjuWP24L06v3R1vlKIVYMWarLkXmG0
 Ypvt3yTxteMndNc6BDCQksGUISncb7aHPFPptToLA7NT73Xv1x0Ul71GEm4pODRyNNIzMYCz
 L64xynu3BToX3tkotJMBHCeNQxs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5ee28efead153efa340c7130 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 20:07:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A3E43C433CA; Thu, 11 Jun 2020 20:07:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 66EBBC433C8;
 Thu, 11 Jun 2020 20:07:25 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 11 Jun 2020 13:07:25 -0700
From: tanmay@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v6 2/5] drm: add constant N value in helper file
In-Reply-To: <159175565407.242598.7527036274929582020@swboyd.mtv.corp.google.com>
References: <20200609034047.9407-1-tanmay@codeaurora.org>
 <159175565407.242598.7527036274929582020@swboyd.mtv.corp.google.com>
Message-ID: <8b8d06e7331a0b8cbe3e674864c16f0c@codeaurora.org>
X-Sender: tanmay@codeaurora.org
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
Cc: sam@ravnborg.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, Vara Reddy <varar@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 chandanu@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-09 19:20, Stephen Boyd wrote:
> Quoting Tanmay Shah (2020-06-08 20:40:47)
>> From: Chandan Uddaraju <chandanu@codeaurora.org>
>> 
>> The constant N value (0x8000) is used by i915 DP
>> driver. Define this value in dp helper header file
>> to use in multiple Display Port drivers. Change
>> i915 driver accordingly.
>> 
>> Change in v6: Change commit message
>> 
>> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
>> Signed-off-by: Vara Reddy <varar@codeaurora.org>
>> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Can you resend this series as an actual patch series? None of the
> patches have the proper In-Reply-To headers so it is hard to track the
> thread.
Sure. Should I keep Message-ID of v5-patch-1 for in-reply-to header?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
