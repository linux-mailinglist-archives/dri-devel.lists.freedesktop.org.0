Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7091ECA1D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 09:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADE36E4CA;
	Wed,  3 Jun 2020 07:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B486E42D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 16:10:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591114222; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6WkZkPNZYqHtyoOR3WPRpDqJzCSNDoDiaqF/KoiR35c=;
 b=iS9IHuAMxisbY6JcWe1HokTxLce1OzUlLBV4+/CX1taL5a61J0OZBuKS4YLnPVmjVksubsF7
 +Fs2QcvN5RWrkHVfSVCeMT4wh8clI5R2IvdzaRRYEINXERXXq8r0m/sNRA3ihFRO/ATq2Sac
 iFxXF+CCjlZpRxq2mOy8ZN6dSfY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5ed679edea0dfa490e7282d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Jun 2020 16:10:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 05D1EC433CA; Tue,  2 Jun 2020 16:10:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 816A8C433CB;
 Tue,  2 Jun 2020 16:10:20 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 02 Jun 2020 21:40:20 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [v2] drm/msm: add shutdown support for display platform_driver
In-Reply-To: <CACvgo50b+m2+onak=AZfgihkBXEP9POjMR52087v==-puLdkQQ@mail.gmail.com>
References: <1591009402-681-1-git-send-email-mkrishn@codeaurora.org>
 <CACvgo50eb5_jp_6B5tkV9cX_X2_y2Xnavu+wvUUhHN5FsV9hiw@mail.gmail.com>
 <cd61dd742e73b89794fc1b812d9fdcd9@codeaurora.org>
 <CACvgo50b+m2+onak=AZfgihkBXEP9POjMR52087v==-puLdkQQ@mail.gmail.com>
Message-ID: <8742ac6fbd498fdc22dcd469c3a2d52a@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 03 Jun 2020 07:04:29 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 devicetree-owner@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, mka@chromium.org,
 Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
 "Kristian H . Kristensen" <hoegsberg@chromium.org>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil,

On 2020-06-02 21:09, Emil Velikov wrote:
> On Tue, 2 Jun 2020 at 15:49, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi Emil,
>> 
>> On 2020-06-02 19:43, Emil Velikov wrote:
>> > Hi Krishna,
>> >
>> > On Tue, 2 Jun 2020 at 08:17, Krishna Manikandan
>> > <mkrishn@codeaurora.org> wrote:
>> >>
>> >> Define shutdown callback for display drm driver,
>> >> so as to disable all the CRTCS when shutdown
>> >> notification is received by the driver.
>> >>
>> >> This change will turn off the timing engine so
>> >> that no display transactions are requested
>> >> while mmu translations are getting disabled
>> >> during reboot sequence.
>> >>
>> >> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>> >>
>> > AFAICT atomics is setup in msm_drm_ops::bind and shutdown in
>> > msm_drm_ops::unbind.
>> >
>> > Are you saying that unbind never triggers? If so, then we should
>> > really fix that instead, since this patch seems more like a
>> > workaround.
>> >
>> 
>> Which path do you suppose that the unbind should be called from, 
>> remove
>> callback? Here we are talking about the drivers which are builtin, 
>> where
>> remove callbacks are not called from the driver core during
>> reboot/shutdown,
>> instead shutdown callbacks are called which needs to be defined in 
>> order
>> to
>> trigger unbind. So AFAICS there is nothing to be fixed.
>> 
> Interesting - in drm effectively only drm panels implement .shutdown.
> So my naive assumption was that .remove was used implicitly by core,
> as part of the shutdown process. Yet that's not the case, so it seems
> that many drivers could use some fixes.
> 
> Then again, that's an existing problem which is irrelevant for msm.
> -Emil

To give more context, we are actually targeting the clients/consumers
of SMMU/IOMMU here because we have to make sure that before the supplier
(SMMU) shuts down, its consumers/clients need to be shutdown properly.
Now the ordering of this is taken care in the SMMU driver via 
device_link
which makes sure that consumer shutdown callbacks are called first, but 
we
need to define shutdown callbacks for all its consumers to make sure we
actually shutdown the clients or else it would invite the crashes during 
reboot
which in this case was seen for display.

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
