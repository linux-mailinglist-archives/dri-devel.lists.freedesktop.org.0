Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F011AEAC4
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 10:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188866E170;
	Sat, 18 Apr 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED92A6E170
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 08:12:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587197577; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=xxwDid+GegRp2XEwGHjjbsx9T5wGtL4IDO6vWAN+KzQ=;
 b=Qi6KC313mepgHzJocv5FW6becyxsh2r/+VOq7gwtpczsAFcBnGzJgrlgzZxdW9x8CzvTQXFt
 8eBJ+tR4xaxBY5urUr/uRqUcCXbCYgf/z2McXSd6k+QrkjtM0auSxXi/oENxJBJzLPycV0Ik
 V3ZuHuv2Y8Xu894eHulC/ON0aoA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9ab671.7fadbc8a6768-smtp-out-n05;
 Sat, 18 Apr 2020 08:12:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C1B25C43636; Sat, 18 Apr 2020 08:12:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.205.89]
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 50856C433CB;
 Sat, 18 Apr 2020 08:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50856C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 05/17] drm/msm/dpu: Use OPP API to set clk/perf state
To: Matthias Kaehlcke <mka@chromium.org>
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
 <1587132279-27659-6-git-send-email-rnayak@codeaurora.org>
 <20200417181724.GE199755@google.com>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <c4313eab-3f48-4817-5507-7e846a5e1eb8@codeaurora.org>
Date: Sat, 18 Apr 2020 13:42:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200417181724.GE199755@google.com>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, viresh.kumar@linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/17/2020 11:47 PM, Matthias Kaehlcke wrote:
> Hi Rajendra,
> 
> I have essentially the same comments as for "tty: serial: qcom_geni_serial:
> Use OPP API to set clk/perf state" (https://patchwork.kernel.org/patch/11495209/).
> about error handling of 'dev_pm_opp_of_add_table' and misleading struct
> member names 'opp'/'opp_table'. Please apply the requested changes to the
> entire series unless you disagree (we can keep the discussion in the patch
> referenced above).

Thanks, yes, I will apply those changes across the series and respin.
Will wait a few days to see I get any more feedback.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
