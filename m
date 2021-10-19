Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D0434231
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 01:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A238B6E0E9;
	Tue, 19 Oct 2021 23:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767DA6E0E9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 23:38:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634686687; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=GbDfYqTY5ZqyXwAiKIHIBkI1IkGHsJNGIeiARv2Sd7Y=;
 b=dHet8JJgxKesR/EfRbxeg8a3I+Kf+5Ord3JNQhgXKe8GIeBPZVR85dcx8UVS5YQporizlWBP
 rgTQO2E5avp7Apr9LS6Zfxrpykfw89BTuAdhN7SbIZf+oFAi7Iqo18qO+nMxxrHrwEoAwOBc
 NVCL8hCtiOk8X2reeAOjACxzekY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 616f56cf14914866faba1142 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 23:37:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B1901C4361B; Tue, 19 Oct 2021 23:37:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [172.20.10.6] (mobile-166-170-50-11.mycingular.net
 [166.170.50.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jesszhan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 67AB4C4338F;
 Tue, 19 Oct 2021 23:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 67AB4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <f2442db0-b4cd-4bf0-d909-7d79cd53bbbe@codeaurora.org>
Date: Tue, 19 Oct 2021 16:37:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [bug report] drm/msm: Add SDM845 DPU support
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, jsanka@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211001134912.GA9248@kili> <20211001135033.GZ2083@kadam>
From: Jessica Zhang <jesszhan@codeaurora.org>
In-Reply-To: <20211001135033.GZ2083@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dan,

On 10/1/2021 6:50 AM, Dan Carpenter wrote:
> On Fri, Oct 01, 2021 at 04:49:12PM +0300, Dan Carpenter wrote:
>> Hello Jeykumar Sankaran,
>>
>> This is a semi-automatic email about new static checker warnings.
>>
>> The patch 25fdd5933e4c: "drm/msm: Add SDM845 DPU support" from Jun
>> 27, 2018, leads to the following Smatch complaint:
>>
>>      drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:422 _dpu_hw_sspp_setup_scaler3()
>>      warn: variable dereferenced before check 'ctx->cap->sblk' (see line 421)
>>
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>     420		(void)pe;
>>                  ^^^^^^^^^

Got it. I'll take care of the null pointer issues, but planning to 
address the `(void)pe` issue in this patch: 
https://patchwork.freedesktop.org/patch/456592/

Thanks,

Jessica Zhang

>> You should file a bug report with your compiler devs instead of adding
>> these sorts of statements to your code.  This function is used as a
>> function pointer so unused parameters are normal.
>>
>>     421		if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
>>                      ^^^^^^^^^^^^^^^^^^^^
>> The _sspp_subblk_offset() dereferenced "ctx" before it is checked and
>> then it also derefereces "ctx->cap->sblk" without checking.
>>
>>     422			|| !scaler3_cfg || !ctx || !ctx->cap || !ctx->cap->sblk)
>>                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> So these will have already crashed before we reach this point.
>>
> Same thing later as well.
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:591 dpu_hw_sspp_setup_creq_lut()
> warn: variable dereferenced before check 'ctx->cap' (see line 588)
>
> regards,
> dan carpenter
>
