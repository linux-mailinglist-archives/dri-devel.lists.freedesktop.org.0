Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC713249586
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB49B6E1BA;
	Wed, 19 Aug 2020 06:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9F08915B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 23:01:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597791677; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=q6lRhjA9zeB4fTgQes9XK0LoNkoG62IeMO8jAUu+N58=;
 b=hSD/A6sWW4dwnxgr8zTOwQK/vdt957JOxZeR0r63OOwKhEa0TZYA3lXIik0YRAB0uXDX8eC3
 rdNYUD9FTKfFu2l7tw+7TYOd2ThQqw3ZmPkLkj8bRzN9QrlGBSWC5wQb5hxxDfoQKSSyE2lk
 d3aWugH2MVUIyJrQHoPPR5ze+eA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5f3c5dad247ccc308c7d7a91 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 23:01:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 483E0C433CB; Tue, 18 Aug 2020 23:01:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EE0FC433C6;
 Tue, 18 Aug 2020 23:00:59 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 18 Aug 2020 16:00:59 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3] drm/msm/dp: Add DP compliance tests on Snapdragon
 Chipsets
In-Reply-To: <159778797494.334488.5009772006048435758@swboyd.mtv.corp.google.com>
References: <20200818211546.559-1-khsieh@codeaurora.org>
 <159778797494.334488.5009772006048435758@swboyd.mtv.corp.google.com>
Message-ID: <ee1ad6b96a0d8be83abda0cb1b3ebc59@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
 Guenter Roeck <groeck@chromium.org>, aravindh@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-18 14:59, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2020-08-18 14:15:46)
>> add event thread to execute events serially from event queue. Also
>> timeout mode is supported  which allow an event be deferred to be
>> executed at later time. Both link and phy compliant tests had been
>> done successfully.
>> 
>> Changes in v2:
>> - Fix potential deadlock by removing redundant connect_mutex
>> - Check and enable link clock during modeset
>> - Drop unused code and fix function prototypes.
>> - set sink power to normal operation state (D0) before DPCD read
>> 
>> Changes in v3:
>> - push idle pattern at main link before timing generator off
>> - add timeout handles for both connect and disconnect
>> 
>> This patch depends-on following series:
>> https://lkml.kernel.org/lkml/20200812044223.19279-1-tanmay@codeaurora.org/t.atom
> 
> There's a v11 of this series. Can you rebase again?
> 
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> Signed-off-by: Guenter Roeck <groeck@chromium.org>
>> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> 
> And fix this SoB chain to be proper with Co-developed-by tags and your
> tag coming last as you're the sender of the patch.
Tanmay and Guenter signed-off were added by mistake. I will remove them
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
