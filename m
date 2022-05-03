Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3297A519176
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 00:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3630F10E4BB;
	Tue,  3 May 2022 22:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA79710E4BB;
 Tue,  3 May 2022 22:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651617269; x=1683153269;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AfvE0mqD8LgC7mSKZ42+S6hxxRlmYK3Qfez+UJVVjYw=;
 b=Dn8nJ1wIkyWGpABhSTZ4IudV6xebX5XJywU9SHsV8+WCDQ/IckAcXz6k
 F5GvUX/WPNl2ADmRryAVgX2ZTgpL9GLERI0HrdLwMK8H2PpX+Abb5ldu7
 Hc/da6jGlVKi7+KBSCHLlPSTvLZfr0j2uKA3sJw0y+OMyN06r/0vdHkPv A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 May 2022 15:34:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 15:34:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 15:34:27 -0700
Received: from [10.38.244.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 3 May 2022
 15:34:25 -0700
Message-ID: <32ad5e91-cccb-c73f-548a-960a84a40173@quicinc.com>
Date: Tue, 3 May 2022 15:34:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 04/25] drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-5-dmitry.baryshkov@linaro.org>
 <df93e33b-fa5a-af29-1be5-76262a17ce0a@quicinc.com>
 <5935ae15-2497-1c74-5b51-5baef7f78851@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <5935ae15-2497-1c74-5b51-5baef7f78851@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/3/2022 3:11 PM, Dmitry Baryshkov wrote:
> On 04/05/2022 00:34, Abhinav Kumar wrote:
>>
>>
>> On 2/9/2022 9:24 AM, Dmitry Baryshkov wrote:
>>> As SSPP blocks are now visible through dpu_kms->rm.sspp_blocks, move
>>> SSPP debugfs creation from dpu_plane to dpu_kms.
>>>
>>
>> Change is fine by itself, but is it really needed?
>> Wouldnt it be better to keep dpu_debugfs_sspp_init in dpu_plane.c?
> 
> No. We are going to break the dependency between planes and SSPPs at 
> some point. Let's move the debugfs functions to the generic location.
> 

Alright, keeping that dependency-break in mind,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  1 -
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 19 +++++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ----------------
>>>   3 files changed, 19 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> index f805c30643b1..674f311f99b4 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>>> @@ -415,7 +415,6 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum 
>>> dpu_sspp idx,
>>>    */
>>>   void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
>>> -void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry 
>>> *debugfs_root);
>>>   int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct 
>>> dpu_kms *kms, struct dentry *entry);
>>>   #endif /*_DPU_HW_SSPP_H */
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 4d2b75f3bc89..8196b11fe2f3 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -259,6 +259,25 @@ void dpu_debugfs_create_regset32(const char 
>>> *name, umode_t mode,
>>>       debugfs_create_file(name, mode, parent, regset, 
>>> &dpu_fops_regset32);
>>>   }
>>> +static void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct 
>>> dentry *debugfs_root)
>>> +{
>>> +    struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
>>> +    int i;
>>> +
>>> +    if (IS_ERR(entry))
>>> +        return;
>>> +
>>> +    for (i = SSPP_NONE; i < SSPP_MAX; i++) {
>>> +        struct dpu_hw_pipe *pipe_hw;
>>> +
>>> +        if (!dpu_kms->rm.sspp_blks[i - SSPP_NONE])
>>> +            continue;
>>> +
>>> +        pipe_hw = to_dpu_hw_pipe(dpu_kms->rm.sspp_blks[i - SSPP_NONE]);
>>> +        _dpu_hw_sspp_init_debugfs(pipe_hw, dpu_kms, entry);
>>> +    }
>>> +}
>>> +
>>>   static int dpu_kms_debugfs_init(struct msm_kms *kms, struct 
>>> drm_minor *minor)
>>>   {
>>>       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 146dbccd79cd..37742f74a7bf 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -1359,22 +1359,6 @@ void dpu_plane_danger_signal_ctrl(struct 
>>> drm_plane *plane, bool enable)
>>>       _dpu_plane_set_qos_ctrl(plane, enable, DPU_PLANE_QOS_PANIC_CTRL);
>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>   }
>>> -
>>> -/* SSPP live inside dpu_plane private data only. Enumerate them 
>>> here. */
>>> -void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry 
>>> *debugfs_root)
>>> -{
>>> -    struct drm_plane *plane;
>>> -    struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
>>> -
>>> -    if (IS_ERR(entry))
>>> -        return;
>>> -
>>> -    drm_for_each_plane(plane, dpu_kms->dev) {
>>> -        struct dpu_plane *pdpu = to_dpu_plane(plane);
>>> -
>>> -        _dpu_hw_sspp_init_debugfs(pdpu->pipe_hw, dpu_kms, entry);
>>> -    }
>>> -}
>>>   #endif
>>>   static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
> 
> 
