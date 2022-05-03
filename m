Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC9519111
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 00:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3822210FD4C;
	Tue,  3 May 2022 22:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDAF10FD4C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 22:11:58 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id x17so32557813lfa.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4luej/Z8AZU4tL8sA3TFYmosE5DMCQUGp1FA8G3vxe4=;
 b=iG0BpmDFTJsUOoGuK59AQs5dJOKEDqJT9YsL8f0AJOL+7kClhKX14lfQ0xLMGCsqdE
 CDqrPiwKeytlkW+CYpmR/ooBkYoxq5zHZLj4gQ2uJdq0TKSVYUTmoSVgOfZ6C0Qo0KtO
 6ZGpzgfAbQ7ukasGtM0E4u3YaVXbuF9hmr00wswDULemlQ48JMjXOAYcWj3j4eZu+TCP
 q+vGpBzGmjiZvUGgGGON/h5d3wOe/KkL/P618sOBJmjOmlBX/FC173gFR2SMc+lRkq5d
 kkP5+b4OpAOe7T49l4Nq/He6AhktDlKl0K6/6O8JYmHTLPAS1U8VZINYWLk47nxd8ZtB
 kd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4luej/Z8AZU4tL8sA3TFYmosE5DMCQUGp1FA8G3vxe4=;
 b=lOOhwRRLn2MTZPbqGFQh9/oVRD5Tu1kICbE5c6I4DU7U66c3v9Rr1cIzUnpNhsF3KJ
 X2GLuDCIlhYfGn3NtRwgqWauRsbL46q2HHuVs5bKzF0atA7QylDyJLiuh9LkgGTB5/fY
 yalhatmIOM+YZ/erKRsrDJpa4/zFSRos5laHNrngX3p1Leke3TheAymm4UBuHEBrtkRA
 P8JyjNJjZk/L+b3mSwvONzcSGj99iVeakSi3N4W+jnEb85sgi7YmuFwN1lnTiYOf0Wif
 HWLJMSaiw3tXGlzijxfmwcAxAWpd9maXk0pb1Ma4MIA1cNNYypdvCzK8AnAzOo0FIoEa
 rP6A==
X-Gm-Message-State: AOAM532fQo9NtSsvoCLbnsda5VdE5bgLjeUTJTxt4Sg6GQZWD8P1SNOh
 OZgmcg4AiZKj2zMUfHzBiRjsNA==
X-Google-Smtp-Source: ABdhPJwo6dcYwp9JX4CI1tKN30hRUet0O0vg+CWvjYB+/jgxEwtrX0t3YII9qGYhKMNKvYsxtBUDxw==
X-Received: by 2002:a05:6512:2097:b0:472:127:35c1 with SMTP id
 t23-20020a056512209700b00472012735c1mr12064927lfr.578.1651615916162; 
 Tue, 03 May 2022 15:11:56 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 r4-20020ac252a4000000b0047255d211a1sm1042797lfm.208.2022.05.03.15.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 15:11:55 -0700 (PDT)
Message-ID: <5935ae15-2497-1c74-5b51-5baef7f78851@linaro.org>
Date: Wed, 4 May 2022 01:11:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 04/25] drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-5-dmitry.baryshkov@linaro.org>
 <df93e33b-fa5a-af29-1be5-76262a17ce0a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <df93e33b-fa5a-af29-1be5-76262a17ce0a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 04/05/2022 00:34, Abhinav Kumar wrote:
> 
> 
> On 2/9/2022 9:24 AM, Dmitry Baryshkov wrote:
>> As SSPP blocks are now visible through dpu_kms->rm.sspp_blocks, move
>> SSPP debugfs creation from dpu_plane to dpu_kms.
>>
> 
> Change is fine by itself, but is it really needed?
> Wouldnt it be better to keep dpu_debugfs_sspp_init in dpu_plane.c?

No. We are going to break the dependency between planes and SSPPs at 
some point. Let's move the debugfs functions to the generic location.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 19 +++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ----------------
>>   3 files changed, 19 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> index f805c30643b1..674f311f99b4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> @@ -415,7 +415,6 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp 
>> idx,
>>    */
>>   void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
>> -void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry 
>> *debugfs_root);
>>   int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct 
>> dpu_kms *kms, struct dentry *entry);
>>   #endif /*_DPU_HW_SSPP_H */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 4d2b75f3bc89..8196b11fe2f3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -259,6 +259,25 @@ void dpu_debugfs_create_regset32(const char 
>> *name, umode_t mode,
>>       debugfs_create_file(name, mode, parent, regset, 
>> &dpu_fops_regset32);
>>   }
>> +static void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct 
>> dentry *debugfs_root)
>> +{
>> +    struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
>> +    int i;
>> +
>> +    if (IS_ERR(entry))
>> +        return;
>> +
>> +    for (i = SSPP_NONE; i < SSPP_MAX; i++) {
>> +        struct dpu_hw_pipe *pipe_hw;
>> +
>> +        if (!dpu_kms->rm.sspp_blks[i - SSPP_NONE])
>> +            continue;
>> +
>> +        pipe_hw = to_dpu_hw_pipe(dpu_kms->rm.sspp_blks[i - SSPP_NONE]);
>> +        _dpu_hw_sspp_init_debugfs(pipe_hw, dpu_kms, entry);
>> +    }
>> +}
>> +
>>   static int dpu_kms_debugfs_init(struct msm_kms *kms, struct 
>> drm_minor *minor)
>>   {
>>       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 146dbccd79cd..37742f74a7bf 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -1359,22 +1359,6 @@ void dpu_plane_danger_signal_ctrl(struct 
>> drm_plane *plane, bool enable)
>>       _dpu_plane_set_qos_ctrl(plane, enable, DPU_PLANE_QOS_PANIC_CTRL);
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   }
>> -
>> -/* SSPP live inside dpu_plane private data only. Enumerate them here. */
>> -void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry 
>> *debugfs_root)
>> -{
>> -    struct drm_plane *plane;
>> -    struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
>> -
>> -    if (IS_ERR(entry))
>> -        return;
>> -
>> -    drm_for_each_plane(plane, dpu_kms->dev) {
>> -        struct dpu_plane *pdpu = to_dpu_plane(plane);
>> -
>> -        _dpu_hw_sspp_init_debugfs(pdpu->pipe_hw, dpu_kms, entry);
>> -    }
>> -}
>>   #endif
>>   static bool dpu_plane_format_mod_supported(struct drm_plane *plane,


-- 
With best wishes
Dmitry
