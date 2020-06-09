Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714E01F2B08
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 02:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9138E6E9D0;
	Tue,  9 Jun 2020 00:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1E089E9E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 00:15:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591661761; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cnXptHuROdhiqd7OJYq02Tw3oZx7BeMflcINlbXkNI4=;
 b=n2o04XqYI6AdVyaowpBArAxVwNDSNQZOk0RosWdRfkegLb7OROsA2S+jlqDD5D00YX1i3KqB
 4BPUA4RBAL2ITNMdlC2qxM/yoE/u6yL43F9JQ3u40ev5HHFb+BW2yPlZCxR6AGjotsWwkJKY
 gnTwkr0NLxIYKdoEbSN9mvg/qeo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5eded4ac9545e9541fec8298 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 00:15:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 16838C43395; Tue,  9 Jun 2020 00:15:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 72257C433AF;
 Tue,  9 Jun 2020 00:15:38 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 08 Jun 2020 17:15:38 -0700
From: tanmay@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [DPU PATCH v5 2/5] drm: add constant N value in helper file
In-Reply-To: <158768529129.135303.14920680590198766597@swboyd.mtv.corp.google.com>
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
 <1585701031-28871-3-git-send-email-tanmay@codeaurora.org>
 <158768529129.135303.14920680590198766597@swboyd.mtv.corp.google.com>
Message-ID: <51b45caae61860d6732d7ef575859d72@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, Vara Reddy <varar@codeaurora.org>,
 hoegsberg@google.com, aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-04-23 16:41, Stephen Boyd wrote:
> Quoting Tanmay Shah (2020-03-31 17:30:28)
>> From: Chandan Uddaraju <chandanu@codeaurora.org>
>> 
>> The constant N value (0x8000) is used by multiple DP
> 
> There's one driver using it, not multiple.
> 
Changed commit message accordingly.
>> drivers. Define this value in header file and use this
>> in the existing i915 display driver.
>> 
>> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
>> Signed-off-by: Vara Reddy <varar@codeaurora.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
