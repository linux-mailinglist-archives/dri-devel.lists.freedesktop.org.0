Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFAF3CAFD2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 02:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2BF6E8C9;
	Fri, 16 Jul 2021 00:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888B76E8C9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 00:01:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626393686; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=erJIzto7qZXuzK61BLf7SS5WdFm+Xt4zEFeRyvOUY1o=;
 b=v57Ad9ioSMXT77x9aU7+sppQfOBZ/dkS/h5+nfZLTALd0Bs7wQBeVl4FolBzp0L6eNjFiivv
 Lx4TIF1T8P+dJABeL/SmqRRCbBTsbMVFWY/Cc5trfqHby8S8q63FzF8V6PSQcsYS7ffBNLOr
 6nXSNpJq2ZcQ/suqHC107U7VFzU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60f0cc4517c2b4047d417b08 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Jul 2021 00:01:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 848CDC4338A; Fri, 16 Jul 2021 00:01:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E2DEC433D3;
 Fri, 16 Jul 2021 00:01:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 15 Jul 2021 17:01:07 -0700
From: abhinavk@codeaurora.org
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH] drm/msm/dsi: add support for dsi test pattern generator
In-Reply-To: <61cdcd07-5bff-a8ae-7156-b85b9c6c8801@somainline.org>
References: <1624993464-20447-1-git-send-email-abhinavk@codeaurora.org>
 <61cdcd07-5bff-a8ae-7156-b85b9c6c8801@somainline.org>
Message-ID: <f6235d170811ad02bf6321dcb5ef3568@codeaurora.org>
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
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marijn

Sorry for the late response.

On 2021-07-13 02:10, Marijn Suijten wrote:
> On 6/29/21 9:04 PM, Abhinav Kumar wrote:
>> During board bringups its useful to have a DSI test pattern
>> generator to isolate a DPU vs a DSI issue and focus on the relevant
>> hardware block.
>> 
>> To facilitate this, add an API which triggers the DSI controller
>> test pattern. The expected output is a rectangular checkered pattern.
>> 
>> This has been validated on a single DSI video mode panel by calling it
>> right after drm_panel_enable() which is also the ideal location to use
>> this as the DSI host and the panel have been initialized by then.
>> 
>> Further validation on dual DSI and command mode panel is pending.
>> If there are any fix ups needed for those, it shall be applied on top
>> of this change.
>> 
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> [...]
Thanks for testing this.
>> +static void msm_dsi_host_cmd_test_pattern_setup(struct msm_dsi_host 
>> *msm_host)
>> +{
>> +	u32 reg;
>> +
>> +	reg = dsi_read(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL);
>> +
>> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CMD_MDP_INIT_VAL0, 
>> 0xff);
>> +
>> +	reg |= (0x3 << 0x8);
>> +	dsi_write(msm_host, REG_DSI_TEST_PATTERN_GEN_CTRL, reg);
>> +	/* draw checkered rectangle pattern */
>> +	dsi_write(msm_host, REG_DSI_TPG_MAIN_CONTROL2, (0x1 << 0x7));
> 
> 
> How about BIT(7)?

You mean BIT(7) of REG_DSI_TPG_MAIN_CONTROL2? Thats what this is right?
Did you mean some other bit?

> 
> On SM6125 this seems to change the color intensity of the pattern; it
> is always colored lines of a few pixels wide alternating R, B and G
> from left to right.  Is it possible to document the meaning and
> available values of these registers, especially if they differ between
> SoC / DSI block?
> 

I have requested access for SM6125, will check this register on that to 
see if there
is any difference.

Are you saying you are not seeing a rectangular checkered pattern while 
testing?
Also are you testing on command mode or video mode?

As requested by Rob, I will add the bit definitions and update the 
dsi.xml.h in the
next patchset for the registers and the bits which I am using here.

With that the meaning of these bits will be more clear.

I dont think I will be able to document all the bits because the goal of 
this patch
was only to draw a test pattern to help with validation. Different bits 
of the REG_DSI_TPG_MAIN_CONTROL2
register only draw different patterns so the goal wasnt that we can draw 
any pattern, it was just to
draw some pattern on the screen.

When we add support for all other patterns, we can expose those bits as 
well but it should not
be required in my opinion.

> Kind regards,
> Marijn
> 
>> +	DBG("Cmd test pattern setup done\n");
>> +}
> [...]
