Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C9694A80
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 16:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98D510E5F2;
	Mon, 13 Feb 2023 15:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F4E10E5F2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 15:13:10 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id lu11so32696776ejb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 07:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CLlvNqYXoYkTP0kXk28TWwYetNOEku1lexXp3so1wpQ=;
 b=i7NsvwPz0kahrM5fmdDO8q9o7THzA08ppzN+JveeQ4RQLJDW/l6vWNnLV78c7gExHX
 KabUpzj74TNt6CnADvUDMHssiOwqR/92UDc64YSlupnLFl31kpygOuacCQngej6gf5E1
 r4lV5GOLSjhcKt7VweKuXNG/BecKGYPOSxwp02tuPffxZMneRy8IWyZCAsUhtZQ75cQ7
 CrznSmVG0VCB9CaqSk0kgVi38UZShPeIr8wgOSzbTyP9BFNymxpNpckxjyO3nc5Te12c
 KGqeri9GUPow2yQLblLSdiBN0eJCEnHusxAjM17kEV/foIjNJtXXvQufsGr74cCvxuPW
 zz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CLlvNqYXoYkTP0kXk28TWwYetNOEku1lexXp3so1wpQ=;
 b=AKM6WGFm/1J2h3s+PlRkrWsjnNikmMEWjdfD8/gcn0dPppbuMtxlvbj0F3EIcB7cuB
 GAkyQI+4ddrQLjHERNqAB8KKNxTUvIcZY+Pe24yboAuICRukQlugyzuqE41fX1H18bYz
 MmXQ2OexwID78dov4NJrfrq29PMRdZQ5fzDslIzXlCnAZRd47lpQySusAOJhpqSecP6M
 aX2Tz6s++DZ+FrC86+QnCz9K3gOmWNyTrVhErTbknzN9I8/raO1l9bc8z95ZkuQ33czu
 oSgrsAYKd7HkccY7Yv6BLH5hWlkkyhWwHgMxaGz48LtdStwLu3KuMTSPtvV3ckUVZB3z
 yKOA==
X-Gm-Message-State: AO0yUKXffjYUs1LYqSpWfyKuBo+V1u1FVdBPLP5F6ihBEWsp5z3dLg9D
 VJXFxfxsKxEtQMNydUpJH6BE4Q==
X-Google-Smtp-Source: AK7set9ykx5c1Vf7M0592+yTkU1k83xL2xhs21Zp2nvIMxqWJocncbuq/2Y9bpmpoRD2syn1SRetNw==
X-Received: by 2002:a17:907:2c54:b0:882:82b3:58bc with SMTP id
 hf20-20020a1709072c5400b0088282b358bcmr27039031ejc.65.1676301188746; 
 Mon, 13 Feb 2023 07:13:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a1709064e0f00b008af424d4d75sm6487522eju.194.2023.02.13.07.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 07:13:07 -0800 (PST)
Message-ID: <5a9f869e-da91-d79b-c94c-74734cd39904@linaro.org>
Date: Mon, 13 Feb 2023 17:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/10] drm/msm/dpu: Add SM6350 support
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-7-konrad.dybcio@linaro.org>
 <a18cf663-115d-edc8-5e4b-3d19fcd9a02c@linaro.org>
 <cc364658-478a-f239-5d17-5ca2b7f7df8b@linaro.org>
 <20230213113008.ih7ii5m3cz4w3lmz@SoMainline.org>
 <8560b69f-8d42-995d-2f4d-11d6a64afef0@linaro.org>
 <20230213142831.hbzfp2chekshsqyy@SoMainline.org>
 <28c9ea04-fedb-16cf-f874-f4c965fbc445@linaro.org>
In-Reply-To: <28c9ea04-fedb-16cf-f874-f4c965fbc445@linaro.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Liu Shixin <liushixin2@huawei.com>,
 Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 16:58, Dmitry Baryshkov wrote:
> On 13/02/2023 16:28, Marijn Suijten wrote:
>> Feel free to propose a merge order listing all the aforementioned SoCs,
>> your rework, my INTF TE patches and whatever else is in the pipeline.
>> As I've been away for a while, and only have limited hobby time (_and_
>> have to split that on various projects), I'm behind on what's currently
>> in swing for DPU (need additional time to catch back up) nor will be
>> able to rebase/resubmit my patches often (a set-in-stone merge order
>> will really help prioritise/plan ahead here).
> 
> We have several patchsets in the pipeline (PSR, color-transformation 
> rework, wide planes) which do not touch the catalog, so the amount of 
> conflicts should be pretty minimal. We are still waiting for DSC 1.2 v2, 
> but it definitely will take time to mature even if v2 is posted today.
> 
> So, *possible* the merge order is the following:
> - fixes from https://patchwork.freedesktop.org/series/113910/ go to 
> msm-fixes
> - fixes from your intf-te go to msm-fixes
> - https://patchwork.freedesktop.org/series/111751/
> - the rest of intf-te and catalog (*see below)
> - DPU features
> - new DPU platforms (might go together with DPU features)

Just to clarify here: I want to hold on adding new platforms to DPU 
driver only. MDSS, DSI etc. patches are free to go.

> 
> * That really depends on the availability of the patchsets. Most 
> probably, as your patchset also contains several fixups, it would be 
> easier to land it before catalog split/rework.
> 
> So, if you have the available timeslot, could you please finish & send 
> intf te on top of msm-next.
> 
>> Sure, I will at least start looking at your 50-patch as part of catching
>> back up.  Do you want to process that on the mailing list or via
>> https://gitlab.freedesktop.org/drm/msm/-/merge_requests/44?
> 
> I'd prefer to use email. The MR was open to doublecheck that nothing got 
> broken on sc7180.
> 

-- 
With best wishes
Dmitry

