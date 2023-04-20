Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 736526E86D1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A1E10E6F2;
	Thu, 20 Apr 2023 00:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5225010E207
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:48:48 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8db10a5d4so1785451fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681951726; x=1684543726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OckS2BfEFVMjSC+akapUtOqBGX/h+ZT6q2PObAak2Jo=;
 b=of1Fe8+rte+0q44lW2Pg7/jkv2JzJlXjSP69V35PiAbAOAs/B9KhJLoCz9d19XqEJL
 5W2ccPRIyN/bgBXduTDul0iKVct2nTk4w7Pu4JGXa7lX9UnCYthGhuqWoAv91VabCxW1
 +WGoCq5ZkBNqMVoYQA0tlpiJgUsUVkXUZQUjskRvSra5x9Fx3XKbtJ9ewW5MmfNtCx1g
 3k80PIUsffeJWuj5lBuK3lxnXv9HMJ13e2WkXsdmklu0EVcrsxEXtRTYS1i/0OBC2BS/
 mRymuc04+Hdsw72uuZC897kL2Lbzz+MK/yfugTsLsxXHcsh/Pp6OmW3zsPqyq/6C6YH0
 Dzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681951726; x=1684543726;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OckS2BfEFVMjSC+akapUtOqBGX/h+ZT6q2PObAak2Jo=;
 b=fK/2OE9OapMq6OEfQqUFI0wcr9WM8Yo15gu1Rv9uVZPC+ch9GXnQCmyjxbIyxgShPs
 YEEo7R9MExtGCcX8+Bb/Mgw56q5qbyhWJdI56X0gY6oiT8vPtsFzSHR8RN2wiATvQG49
 qga2nfk85utYiEZLss1wDO1SwnHOzpwalxptdPetpIHGCKaNc2TsSQMoylXnfrSc44cq
 rAemFdoO/chDVUkX0TsT0wkiSDBuF2pHtGU2LpBi6/lRRPG7BmmJfrRRMLMBXVUoe2t1
 l3lwKLJYRPdUtOylj22JbulUFTr8LvFzLFXrYe9zgBP2ZMbFIDeWny8yP9GEDiYBmMnM
 z4Aw==
X-Gm-Message-State: AAQBX9enzOoDf5D/wa0g6VCjPkNcigGnjTUq+05ePmVJRdp4BJrwiwV+
 C74Hyg+gqMJzmMRUgD1QIon8mw==
X-Google-Smtp-Source: AKy350ZUT8RCWkMoPsNeeBL58+bY0ydYaCEMQ4R5U9q6ztvXkYBk1u005WXgty5JHgzOTpeqwCX+mQ==
X-Received: by 2002:ac2:5929:0:b0:4ed:d5ce:7df0 with SMTP id
 v9-20020ac25929000000b004edd5ce7df0mr1773953lfi.7.1681951726537; 
 Wed, 19 Apr 2023 17:48:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a2e9606000000b002a77f45cc00sm18114ljh.29.2023.04.19.17.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:48:45 -0700 (PDT)
Message-ID: <e129858e-5d8d-32d5-96ca-07ab4f1ea938@linaro.org>
Date: Thu, 20 Apr 2023 03:48:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 08/17] drm/msm/dpu: Drop unused poll_timeout_wr_ptr
 PINGPONG callback
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-8-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-8-ef76c877eb97@somainline.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/04/2023 23:21, Marijn Suijten wrote:
> This callback was migrated from downstream when DPU1 was first
> introduced to mainline, but never used by any component.  Drop it to
> save some lines and unnecessary confusion.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 18 ------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h |  6 ------
>   2 files changed, 24 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

