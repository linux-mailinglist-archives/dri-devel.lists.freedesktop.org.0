Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A844221E97F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2311A6E8F7;
	Tue, 14 Jul 2020 07:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFB06E1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 10:18:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594635524; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HbTO1RWO0AYCBF7885LW5yU3nqXfLVBq9W9UdB+eByI=;
 b=nA4viPOJzHWCyPolFOoHgaSwWq+EXZmdgXheEaaXH7SGufr3yGNN/Jixe/zdqtSVcbSgmt1V
 9VUGZ5FEqlI2VJlX01c98mN/TioqY00fvjNiIFKbTKsscbCRu8mpklYGVPRE9su6vHZ2VzSN
 zROXBQfqiZY8mlKIfzpHl0f1X5w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5f0c350303c8596cdbbb3d28 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 10:18:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7F46AC43387; Mon, 13 Jul 2020 10:18:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kalyan_t)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D426DC433C8;
 Mon, 13 Jul 2020 10:18:41 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 13 Jul 2020 15:48:41 +0530
From: kalyan_t@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dpu: enumerate second cursor pipe for
 external interface
In-Reply-To: <CAF6AEGtPDh7q6Hjophdyz+Pvi93-bK5WULGeSw9P4BWRw5SWxQ@mail.gmail.com>
References: <1593089153-17811-1-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGtPDh7q6Hjophdyz+Pvi93-bK5WULGeSw9P4BWRw5SWxQ@mail.gmail.com>
Message-ID: <c10c0f70988d42037ccaccc6b5474942@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:44 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-10 22:19, Rob Clark wrote:
> On Thu, Jun 25, 2020 at 5:46 AM Kalyan Thota <kalyan_t@codeaurora.org> 
> wrote:
>> 
>> Setup an RGB HW pipe as cursor which can be used on
>> secondary interface.
>> 
>> For SC7180 2 HW pipes are enumerated as cursors
>> 1 - primary interface
>> 2 - secondary interface
>> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 8f2357d..23061fd 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -117,10 +117,10 @@
>>                 .reg_off = 0x2AC, .bit_off = 0},
>>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>>                 .reg_off = 0x2AC, .bit_off = 8},
>> -       .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
>> -               .reg_off = 0x2B4, .bit_off = 8},
>>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
>> -               .reg_off = 0x2BC, .bit_off = 8},
>> +               .reg_off = 0x2B4, .bit_off = 8},
>> +       .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
>> +               .reg_off = 0x2C4, .bit_off = 8},
> 
> It looks like you shifted the register offset here from 0x2bc to
> 0x2c4, was that intentional?
> 
> BR,
> -R
Yes Rob, the offset was wrong which i corrected in this patch.
> 
>>         },
>>  };
>> 
>> @@ -272,10 +272,10 @@
>>                 sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, 
>> DPU_CLK_CTRL_VIG0),
>>         SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>>                 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, 
>> DPU_CLK_CTRL_DMA0),
>> -       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>> -               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, 
>> DPU_CLK_CTRL_DMA1),
>> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  
>> DMA_CURSOR_SDM845_MASK,
>> +               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, 
>> DPU_CLK_CTRL_CURSOR0),
>>         SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  
>> DMA_CURSOR_SDM845_MASK,
>> -               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, 
>> DPU_CLK_CTRL_CURSOR0),
>> +               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, 
>> DPU_CLK_CTRL_CURSOR1),
>>  };
>> 
>>  /*************************************************************
>> --
>> 1.9.1
>> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
