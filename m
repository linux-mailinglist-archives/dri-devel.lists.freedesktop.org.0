Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163A2205A0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3866E436;
	Wed, 15 Jul 2020 06:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4A36E8B2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 11:10:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594725015; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=063nsZA+TEvD+EIhBzADv1QQAX7cmYzUzYelnNmmLWM=;
 b=isFHkNxTpyyiaSklbK4DefNzlQt5M6uU56a9if5sWxz57NGCX86ZGt2KWPhk/jQJ7nEhKxCi
 SLbd5d0vrPSawVxNygSvLXaMlS/kN+y2OiJJckNiYCdpKDcDfQhOYeMI9rSMKPCKMsJb13C1
 LuVFVNFhJ5Wvasy4H6SKlsQWviI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5f0d927c7c8ca473a88c71e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 11:09:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 43917C43391; Tue, 14 Jul 2020 11:09:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kalyan_t)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B25B1C433CA;
 Tue, 14 Jul 2020 11:09:47 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 14 Jul 2020 16:39:47 +0530
From: kalyan_t@codeaurora.org
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [v1] drm/msm/dpu: add support for clk and bw scaling for display
In-Reply-To: <20200714011219.GQ3191083@google.com>
References: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
 <20200714011219.GQ3191083@google.com>
Message-ID: <38dc4bbfd754175e476252c4bc259d55@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: devicetree@vger.kernel.org, mkrishn@codeaurora.org,
 linux-arm-msm@vger.kernel.org, travitej@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-14 06:42, Matthias Kaehlcke wrote:
> On Thu, Jun 18, 2020 at 07:38:41PM +0530, Kalyan Thota wrote:
>> This change adds support to scale src clk and bandwidth as
>> per composition requirements.
>> 
>> Interconnect registration for bw has been moved to mdp
>> device node from mdss to facilitate the scaling.
>> 
>> Changes in v1:
>>  - Address armv7 compilation issues with the patch (Rob)
>> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> 
> It seems this is an evolution of this series:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=265351
> 
> Are the DT bits of the series still valid? If so please include them in 
> the
> series, otherwise please add DT patches to allow folks to test and 
> review,
> and get them landed in Bjorn's tree after the driver changes have 
> landed.

Hi,

Yes the patch is dependent on the DT changes, should i add them with 
depends tag in the commit text ?
https://patchwork.kernel.org/patch/11470785/
https://patchwork.kernel.org/patch/11470789/

- Kalyan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
