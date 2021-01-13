Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31052F5D79
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667946E134;
	Thu, 14 Jan 2021 09:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081716ECB6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 23:52:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610581963; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jhMQN08IbsbcKCk475v0+9qsmF+cIHbqf+wt7iI9mSY=;
 b=aoH+X6bMEvbbfRYgU0OTH9smEXofzPJJSGpD/xOBBJaYLEnheQqtY65dbAL0XBXr7fEQ5Eis
 5mExJhsh1YdQveEXrQW+SYwye+iQN9ky/5VANqf5Ocws38wQ6dQ2JdvR5eHGwLLZ52GYZ0YC
 /x7Qdk2qSntRSWBEMnA25bBsKIU=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fff87c6415a6293c51d1220 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 23:52:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7358CC43464; Wed, 13 Jan 2021 23:52:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0BD4FC433ED;
 Wed, 13 Jan 2021 23:52:37 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 13 Jan 2021 15:52:37 -0800
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 0/2]  fix missing unplug interrupt problem
In-Reply-To: <161056955435.3661239.1548841852585636847@swboyd.mtv.corp.google.com>
References: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
 <161056955435.3661239.1548841852585636847@swboyd.mtv.corp.google.com>
Message-ID: <5b1c9e0706fdaf4cc1ecbe740b8c916c@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-01-13 12:25, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-01-13 10:59:58)
>> Both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts.
>> Therefore irq_hpd handler should not issues either aux or sw reset
>> to avoid following unplug interrupt be cleared accidentally.
>> 
>> Kuogee Hsieh (2):
>>   drm/msm/dp: return fail when both link lane and rate are 0 at dpcd
>>     read
>>   drm/msm/dp: unplug interrupt missed after irq_hpd handler
> 
> It won't apply to the drm msm tree. Please rebase and resend.
Both V1 two patches are picked by Rob already.
I will drop V2 patches.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
