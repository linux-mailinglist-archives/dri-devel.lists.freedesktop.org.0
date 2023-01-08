Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5D661B1D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 00:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8A210E224;
	Sun,  8 Jan 2023 23:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF31D10E224
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 23:30:32 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id f20so7264775lja.4
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 15:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7NRJDQS9hYJhfGlOkY4aoqvH4nJB/PpvKVQ5IUWg7+4=;
 b=p5b4WpNoKev9E16UV+GiWdaSYbO8tbyJ/8N7Cy43hQrrexwh6U7XS71RgBD7GE8HPh
 fZSyWPDgDdkQUUdux6Rh6Mgc/uN70VHAIIEMIzC/jmhrt3uC5HSygINRt+2mRs4fLPAE
 eqETZ8XJxGVfJO9p4NrVSoJdE0ZjewPuB/Px89j4/63KatwVhCTuqGIOYSk7G3fYRNle
 QJ86vKaLci6W1HVGRCJdJVTJVIFfCl4fAw5fiPfl+iwDqqPaYcZYBu50vb3HMsUwQv21
 F+k9Z2SnQTR2tSBO2boW1ynHHU85qjejoiyvQdM19xXD/M1pNL4VoahT47dYp9esm2de
 ih2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7NRJDQS9hYJhfGlOkY4aoqvH4nJB/PpvKVQ5IUWg7+4=;
 b=jTVZfkFEhXKYnQ2/CSb+q36Y2EUgSelRiWkuSL6aq2sag5Z6BfuVFicnyh1WcWVLZ8
 JoYimJhTKEmo5p0vFGae/ttcqL2GdG6QnZqNg5dUVeRlh/4xJYLe628ifAVKeMnCwu0+
 acFD2eP0KUERECK1knt1FmIUR2WpwQTOsNp2m1cmyZ1xSGx8O9TvlyQmEt49W1H2nHPh
 z4QxhLOvFXQuYQxnaEvJFuT2t9DTgIwY/Q2bVteaZCzA3FjtQu9/kLHhJEzWQWfAVBiL
 S2JLsKxABQtFnmjGkW/ovxJ2cAmN8xRdY0nGMQXMYqhBMvk3jM1uwXsUQgnj+16s2/6M
 wBRA==
X-Gm-Message-State: AFqh2kokfBypc6au+F3UvwD4+5xvf7Qws552GItaKMbXJoDRv74p4VNJ
 8U2qHb/Y7c6jEwEIPf8gfvwJHQ==
X-Google-Smtp-Source: AMrXdXv40yEXT5y2fHAlB9JzaB0RVspyfJk0Lc8NDB1vIygMkYVc3lsz6gpYurd+y98MNDZBWd44cQ==
X-Received: by 2002:a2e:3002:0:b0:27f:bd24:2be7 with SMTP id
 w2-20020a2e3002000000b0027fbd242be7mr12652593ljw.32.1673220631105; 
 Sun, 08 Jan 2023 15:30:31 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a05651c021800b0027fe3bc3c24sm701941ljn.39.2023.01.08.15.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 15:30:30 -0800 (PST)
Message-ID: <1b872a47-6ffc-1fe9-f283-897dbc37d709@linaro.org>
Date: Mon, 9 Jan 2023 01:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: Disallow unallocated resources to be
 returned
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-5-marijn.suijten@somainline.org>
 <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
In-Reply-To: <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2023 01:28, Dmitry Baryshkov wrote:
> On 22/12/2022 01:19, Marijn Suijten wrote:
>> In the event that the topology requests resources that have not been
>> created by the system (because they are typically not represented in
>> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
>> blocks) remain NULL but will still be returned out of
>> dpu_rm_get_assigned_resources, where the caller expects to get an array
>> containing num_blks valid pointers (but instead gets these NULLs).
>>
>> To prevent this from happening, where null-pointer dereferences
>> typically result in a hard-to-debug platform lockup, num_blks shouldn't
>> increase past NULL blocks and will print an error and break instead.
>> After all, max_blks represents the static size of the maximum number of
>> blocks whereas the actual amount varies per platform.
>>
>> ^1: which can happen after a git rebase ended up moving additions to
>> _dpu_cfg to a different struct which has the same patch context.
>>
>> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>>   1 file changed, 5 insertions(+)
> 
> I think the patch is not fully correct. Please check resource 
> availability during allocation. I wouldn't expect an error from 
> get_assigned_resources because of resource exhaustion.
> 

Another option, since allocation functions (except DSC) already have 
these safety checks: check error message to mention internal 
inconstency: allocated resource doesn't exist.

-- 
With best wishes
Dmitry

