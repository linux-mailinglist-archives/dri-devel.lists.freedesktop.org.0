Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AE55A23EC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8B810E7B7;
	Fri, 26 Aug 2022 09:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803D110E7AE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:16:43 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m5so1228574lfj.4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=suMGHlcb9CDltfwUuhoLcsGy+PCUjqFE0jM5VZF9z9U=;
 b=pnA3lVKlSjuoPG8I6Bp2PcbDeGJCNBhDh08RgVZWYtoVfyBf/aqnH4naFpbZCAbZKk
 cSk8mnA2eIpPonj1SZGg0ddXL0zxBfhrj46WoVqMZP+Ge3KiZyl7l4bO5QLEgu8OBGAn
 AVMh++asadyq8f5kz/LjLkqdVL8ETFUTA01avkC5klqvh1f7oe2gW+WSKMelCMQtchsF
 G1TeATTkg9l+thvYiuhXXCS6FDnRmdcKTfTmemkC2xzKjyT3TF0Ym5igOqqFkZwVnNXc
 iPdf6lQlZFjQ5n32gnSTlrA3Kbw0+H3Ytt3GBZslurTvz/MlRlrfokqreExq+89sX+ve
 ebzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=suMGHlcb9CDltfwUuhoLcsGy+PCUjqFE0jM5VZF9z9U=;
 b=mfj1Y+NLRNMjpEP5iwrC0cdkvlaOLMOAslE9xaq/+m4gLpN5oe3CJXKt+SioCNVAba
 wvCZaco5Wk6BXodLRFjTAhzpBQBO1LvqKh8JJcnp4KRWiApz9m5mkt2XBpP0jjXYtwUg
 MWXJEVtWjn+AKHp+kOBEtMzrAWXFINGzh5iKLMswnBjnmb9bDsH2hIrFgaGp189xVVTK
 sU3LDVNmKFJnnY4//54iIlxds5xmEJ0//aKkRldFQMHXL1TvwOSy/5XYS8Qs8pslvlfh
 2JlNQuF5qtS3f6tcxf5F4Umb2O+Wc2y9oq8FuLsCB4dGNgvsi9S1PQhvruErKNfdyMo5
 cWpA==
X-Gm-Message-State: ACgBeo3KJlA3eUOwzPLgQ35ipAF0YHi8DVtiNLVbmnjwZ4LZ/R4l4Hyn
 bc45sW+chrGUy8nLyLYpK1cQhA==
X-Google-Smtp-Source: AA6agR4ScBO2G7DgjeNtg/ASP28MJCEV3REP70Q0sYm5VuGveqGx8COPQNa3Bwc7r/Vfd26k6EWFGw==
X-Received: by 2002:a05:6512:68b:b0:492:d05c:4d2e with SMTP id
 t11-20020a056512068b00b00492d05c4d2emr2159341lfe.413.1661505401691; 
 Fri, 26 Aug 2022 02:16:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g9-20020ac24d89000000b00492cd4bd376sm309620lfe.239.2022.08.26.02.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:16:41 -0700 (PDT)
Message-ID: <9e040bdb-4fc5-3c95-fcea-b6ac7fd8224b@linaro.org>
Date: Fri, 26 Aug 2022 12:16:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC PATCH] drm/msm: lookup the ICC paths in both mdp5/dpu and
 mdss devices
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
 <20220805122406.x7xxywofeaquhfxg@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220805122406.x7xxywofeaquhfxg@SoMainline.org>
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/08/2022 15:24, Marijn Suijten wrote:
> On 2022-08-05 14:56:30, Dmitry Baryshkov wrote:
>> The commit 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master
>> components") changed the MDP5 driver to look for the interconnect paths
>> in the MDSS device rather than in the MDP5 device itself. This was left
>> unnoticed since on my testing devices the interconnects probably didn't
>> reach the sync state.
>>
>> Rather than just using the MDP5 device for ICC path lookups for the MDP5
>> devices, introduce an additional helper to check both MDP5/DPU and MDSS
>> nodes. This will be helpful for the MDP5->DPU conversion, since the
>> driver will have to check both nodes.
>>
>> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
>> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On sdm630
> 
> But I'm not sure about giving my Reviewed-by to this, as I'd rather
> *correct* the DT bindings for sdm630 and msm8996 to provide
> interconnects in the MDSS node unless there are strong reasons not to
> (and I don't consider "backwards compatibility" to be one, this binding
> "never even existed" if mdp5.txt is to be believed).

As a kind of a joke, I'd prefer to have interconnects in the mdp/dpu 
device node. In the end, the interconnects describe the path between the 
display controller and the DDR, not the path between the whole MDSS and DDR.

So, for next chipsets I'd vote to move icc to dpu/mdp node (and maybe 
even move existing inerconnects to the dpu node).

-- 
With best wishes
Dmitry

