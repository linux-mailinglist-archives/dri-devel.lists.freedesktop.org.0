Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60B4BAC60
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 23:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B244E10E868;
	Thu, 17 Feb 2022 22:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0F610E888
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 22:12:05 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id b20so1522036ljf.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 14:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fok+ZHJzCFX/n/jxgSoRYhLWeuG5QrIoZryS5Uauy3E=;
 b=vJZys44/RDSh+zGe+7ruMk6w3qXD/RkkNwzCmppGjnhxUwneTl2KUNwovV5hnerjJ/
 ms55xe4q+K6b9vUOg0DoKWJKV5AX8YhLSCo5XoNiEL3MGRFP9blrG72sWXBDjBAbvSIu
 qkyxNoPeNZPniUI06gtFnLl/mdKoyxyIN44/vHzj7KX2RsgQsaVs2bi2x5e8ccn1Y6pV
 kOT97oV9afpMD4OOrh6WEwFPXJEg4tIhhLsqkP4CvSvTe6PPPSPEqmBkS3BsQOyCHM50
 P7ah3r5KNscsQADB18f8LWFROSmo/mg3G/c8mC3+DHIzYTAGaSApv3iB92wBt3ZYRBYz
 v17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fok+ZHJzCFX/n/jxgSoRYhLWeuG5QrIoZryS5Uauy3E=;
 b=i47QQuDr5LhAqa7cjTkeZwYWMRs7VacnyoPiogOinacfYQxoVQ6ibxp7FPowplyBwQ
 UkpAHVznnOsEO1M0rYuvfwy2CuwmTBx0Vt2Okd2oicyBeTrKBwxA9He0VHPYawHVux3O
 04/KEL9CCzTUQ7lRArrSVwWMtVX0zK1nJgSLjj0hGYdbeE//I7163IYviM+k/UXfYC8E
 bfFdjMiuolw8ypMLXNurh2+ZtJDy127D5mBW3gwAkxOBXgufkzHpCHDlV6rQlrRWp0HB
 9O5cTbNVuXdI+tzT+qf4J6CmDw5rlhAVbQR46pSEGnpMlj6o7+Fz8twRBzI5T2OCAK4m
 ck2Q==
X-Gm-Message-State: AOAM530aGuT20mFowYDeLXURSh3HZGI9WYQIRJKyQRS6Hnl0+CWWBQKc
 aqMWTTWNvHyOxZy3b39xlbWX8w==
X-Google-Smtp-Source: ABdhPJxQCBRO+aXEgN8BbXuQptXRlCL+23sNs8FbudVG7e+7WzdRi7zw1UUWuW8pcX4Vj1hDENxqkg==
X-Received: by 2002:a2e:bd0e:0:b0:244:cb77:9d64 with SMTP id
 n14-20020a2ebd0e000000b00244cb779d64mr3572539ljq.384.1645135923266; 
 Thu, 17 Feb 2022 14:12:03 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id 10sm79058lfz.170.2022.02.17.14.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 14:12:02 -0800 (PST)
Message-ID: <643681f1-0887-ad61-2686-2f4408f56637@linaro.org>
Date: Fri, 18 Feb 2022 01:12:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 03/13] drm/msm/disp/dpu1: Add support for DSC in
 pingpong block
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-4-vkoul@kernel.org>
 <20220217215437.gvxmfjgfqzljactz@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220217215437.gvxmfjgfqzljactz@SoMainline.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/02/2022 00:54, Marijn Suijten wrote:
> On 2021-11-16 11:52:46, Vinod Koul wrote:
>> In SDM845, DSC can be enabled by writing to pingpong block registers, so
>> add support for DSC in hw_pp
> 
> Nit: I don't think the ", so add support for DSC in XXX" part in this
> and other commit messages add anything.  You've already stated that in
> the title, the commit body is just extra justification (and can perhaps
> be filled with extra details about the patch contents instead).
> 
>> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 32 +++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++++++
>>   2 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> index 55766c97c4c8..47c6ab6caf95 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> @@ -28,6 +28,9 @@
>>   #define PP_FBC_MODE                     0x034
>>   #define PP_FBC_BUDGET_CTL               0x038
>>   #define PP_FBC_LOSSY_MODE               0x03C
>> +#define PP_DSC_MODE                     0x0a0
>> +#define PP_DCE_DATA_IN_SWAP             0x0ac
> 
> This enum does not seem used here, is it used in another patch?
> 
>> +#define PP_DCE_DATA_OUT_SWAP            0x0c8
>>   
>>   #define PP_DITHER_EN			0x000
>>   #define PP_DITHER_BITDEPTH		0x004
>> @@ -245,6 +248,32 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
>>   	return line;
>>   }
>>   
>> +static int dpu_hw_pp_dsc_enable(struct dpu_hw_pingpong *pp)
>> +{
>> +	struct dpu_hw_blk_reg_map *c = &pp->hw;
>> +
>> +	DPU_REG_WRITE(c, PP_DSC_MODE, 1);
>> +	return 0;
>> +}
>> +
>> +static void dpu_hw_pp_dsc_disable(struct dpu_hw_pingpong *pp)
>> +{
>> +	struct dpu_hw_blk_reg_map *c = &pp->hw;
>> +
>> +	DPU_REG_WRITE(c, PP_DSC_MODE, 0);
>> +}
>> +
>> +static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
>> +{
>> +	struct dpu_hw_blk_reg_map *pp_c = &pp->hw;
>> +	int data;
>> +
>> +	data = DPU_REG_READ(pp_c, PP_DCE_DATA_OUT_SWAP);
>> +	data |= BIT(18); /* endian flip */
>> +	DPU_REG_WRITE(pp_c, PP_DCE_DATA_OUT_SWAP, data);
>> +	return 0;
>> +}
>> +
>>   static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>>   				unsigned long features)
>>   {
>> @@ -256,6 +285,9 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>>   	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
>>   	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>>   	c->ops.get_line_count = dpu_hw_pp_get_line_count;
>> +	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>> +	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>> +	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>>   
>>   	if (test_bit(DPU_PINGPONG_DITHER, &features))
>>   		c->ops.setup_dither = dpu_hw_pp_setup_dither;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
>> index 89d08a715c16..12758468d9ca 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
>> @@ -124,6 +124,20 @@ struct dpu_hw_pingpong_ops {
>>   	 */
>>   	void (*setup_dither)(struct dpu_hw_pingpong *pp,
>>   			struct dpu_hw_dither_cfg *cfg);
>> +	/**
>> +	 * Enable DSC
>> +	 */
>> +	int (*enable_dsc)(struct dpu_hw_pingpong *pp);
>> +
>> +	/**
>> +	 * Disable DSC
>> +	 */
>> +	void (*disable_dsc)(struct dpu_hw_pingpong *pp);
> 
> It looks like most other callbacks in dpu1 use an `enable` function with
> a boolean, instead of having a separate disable function.  That should
> simplify the implementation down to a single ternary-if, too.  Would
> that be desired to use here?

Just my 2c. I personally hate the unified functions with the boolean 
argument. One of the reasons being the return value. Typically you do 
not expect that the disable function can fail (or return an error). But 
the unified function provides an error (to be handled) even in the 
disable case.

Last, but not least, overall the kernel API is biased towards separate 
enable and disable calls.

> 
> - Marijn
> 
>> +
>> +	/**
>> +	 * Setup DSC
>> +	 */
>> +	int (*setup_dsc)(struct dpu_hw_pingpong *pp);
>>   };
>>   
>>   struct dpu_hw_merge_3d;
>> -- 
>> 2.31.1
>>


-- 
With best wishes
Dmitry
