Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B2A1E6F6A
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C107A6E82D;
	Thu, 28 May 2020 22:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Thu, 28 May 2020 09:03:10 UTC
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D166E46C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 09:03:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590656590; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TNqDL40LlCjpsjbz12NhEYJJSkincfYBy8FmVcop5ek=;
 b=OsVHGxTeLSMzGmkUQybc3ec8Hn9VFQMrxwmYmjuNM/qEyxRkQ8D6pUm/NxfPNfOlB169E3rE
 lOV98APvi/vrrW5nzm2fuxgthymp2M+0gFSwFtEKd4OvSTRU3AoRV4kGUMzdhYV/SKq4J3zV
 AvhKu3AcR4pqRbSf1QZHRFT8bUc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ecf7d1fb4f0a9ae2230316a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 08:58:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7E0FAC43387; Thu, 28 May 2020 08:58:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D3E5C433C6;
 Thu, 28 May 2020 08:58:07 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 28 May 2020 14:28:06 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [v1] drm/msm: add shutdown support for display platform_driver
In-Reply-To: <1590655103-21568-1-git-send-email-mkrishn@codeaurora.org>
References: <1590655103-21568-1-git-send-email-mkrishn@codeaurora.org>
Message-ID: <219625b5b2cc0eddb2e975d457a2c40d@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 28 May 2020 22:46:32 +0000
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
Cc: devicetree@vger.kernel.org, devicetree-owner@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org, mka@chromium.org, robin.murphy@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krishna,

On 2020-05-28 14:08, Krishna Manikandan wrote:
> Define shutdown callback for display drm driver,
> so as to disable all the CRTCS when shutdown
> notification is received by the driver.
> 

Would be nice to add some more context for adding this shutdown callback
something like below:

If the hardware is still accessing memory after SMMU translation is 
disabled
as part of smmu shutdown callback,  then the IOVAs(I/O virtual address) 
which
it was using will go on the bus as the physical addresses which will 
result
in unknown crashes (NoC/interconnect errors on QCOM SoCs).

PS: Credits for description: Robin Murphy

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
