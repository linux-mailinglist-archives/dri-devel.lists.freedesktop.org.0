Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F395B4E65
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 13:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC7710E3F3;
	Sun, 11 Sep 2022 11:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B06C10E3F6
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 11:27:22 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u18so10391236lfo.8
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 04:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=KGB5KUhs9u6/qzvDEhLDSbwJvVi3lKOIpjk/q5kI8ps=;
 b=CvzseaMTpNL08WWmVX7s3adcuwcccnU2QXIj11rOrS5xBKcte8icpKZSdxt+W5mDI+
 nzMKVSj23s+VXWlO8qp7UAPs6IZ5j/A1SHXhkYbeoGiWMgkwasVB4Gczn5tGMfiwg4lI
 eCOFAVNsasfejci1H1HzfAqlI/eoK8kZvtivnoYvUCY30TJVPiFWCCZM6HSW4f9f1WwZ
 So/3MC4k1WF+frmTweMhT0k/co2JYR1+l1nRUYph97ouFJB8pGUzz5NEWU85jI8naW1e
 tnG0Gc42pm3lSoAS6IEDubhMwuY9PPFa31YAZ7uXdEhm3hAH/Xf+yPsL9Bg8ZYwjjVm0
 hMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=KGB5KUhs9u6/qzvDEhLDSbwJvVi3lKOIpjk/q5kI8ps=;
 b=fnueRid7QwnycUF8W0ePT95I8wtFGLxKqd12R8IG05KG/rs++UOeuotfqlYrM0JUWc
 ExiVZWoOXoYCZN3Z2Y3j4xnDDUctXWSMjwylARsIp351ai5LlE3f9eaiA6VNuDD81jk7
 8HSLNMuD501y1P6FDyxNUw9Gwj+asyuagz0W73HVXudBCHdZZBOzxLpg4l4c/jq9hkBO
 mbL+GBkmcHPkGOIX5d/lu2ig1oyaL+4OQv3GUTzRKv1zJyEyefvCXbNJmVwWbIGtO9H0
 A6VZK3UpYphFWmzDwQsm/30jii3wJZ/xHQa8cWNC53UfKwNWH1LDEBy6zWhx5pAy2+pB
 q5oQ==
X-Gm-Message-State: ACgBeo01nJmyIMHwAXmRSzJnkSbshvlctoQDelLjEerCrMfCF6gI1KLt
 +gur+JASMAJR+pCJJDvCEWHsMA==
X-Google-Smtp-Source: AA6agR6Ieg2VRvFOnyVF8oScDNythHwnCyh+ZOet0x7Oy3fi/OrUTbQyS4vyq9fOqLHqHoepI/i8EA==
X-Received: by 2002:a05:6512:1283:b0:499:d0a3:3ca8 with SMTP id
 u3-20020a056512128300b00499d0a33ca8mr1706981lfs.665.1662895640833; 
 Sun, 11 Sep 2022 04:27:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 y26-20020a05651c221a00b0026ad1da0dc3sm618756ljq.122.2022.09.11.04.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 04:27:20 -0700 (PDT)
Message-ID: <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org>
Date: Sun, 11 Sep 2022 13:27:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org>
 <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
 <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
 <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Loic Poulain <loic.poulain@linaro.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/09/2022 14:54, Dmitry Baryshkov wrote:
>>
>> However I think there is no such problem, as Dmitry said, that ref
>> changes anything. There will be always failure - either from parent
>> schema (using $ref) or from device child schema (the one which actually
>> misses the property).
> 
> Initially I stumbled upon this issue with the dsi and dsi_phy nodes
> for msm8996 devices. If I have $ref here, dsi1/dsi1_phy nodes will
> emit warnings regarding the missing -supply properties despite nodes
> being disabled. If I use `compatible' here, the schema checks pass.
> Thus I'd prefer to leave `compatible' here. Not to mention that it
> also allows specifying a tighter binding than just using the $ref.

I don't think we understood each other. I claim that error will be there
anyway, just from different schema. So your change fixes nothing in
total schema check...


Best regards,
Krzysztof
