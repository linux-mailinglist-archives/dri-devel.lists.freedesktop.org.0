Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE27549C7
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 17:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A7210E162;
	Sat, 15 Jul 2023 15:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8AC10E162
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 15:25:46 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b703cbfaf5so43614451fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689434744; x=1692026744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=shbPr05UiyjsE2A12Cz8ioECY1FGTYKqb/D6v0BvgSo=;
 b=i2KxqU3iddA1LkaWoohbGdBZvuxZGglZMbr9ibabvadtO9Ujh8BinQX1i9L16117NO
 2mlvPC1KNgtdtE55aXXzPdzWcgt/HGf/EPQUbCBHcyl8CiFLLhja5eKiROdABtIKOr7e
 nfNOMfclMP0Ddl8zXN4pZCn8oF0Cy505ew+/TZmCKuXTTbCP5ExOnNtdae0V24Yo+Q3L
 vD+ajVij5d0IryEJmBl6FT1DETDk7NpPnvKk1R9D9w7TFNAOwaND0efQV2iVhJaL8HXY
 W7A3zU2x2bY2QSm3K6DcolOFzjHI5ZXQbEd/sb9s3SxRFkUYGmMKacihD7wya5y4gm5N
 p0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689434744; x=1692026744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=shbPr05UiyjsE2A12Cz8ioECY1FGTYKqb/D6v0BvgSo=;
 b=HCjIWrZJyYVRhblm75OruX4mUUAlRUJMVgvY3rpcmu9GfZf8nJWIMD7E6doid1+FJo
 J/oLUskISdycOLp1Ga383KO1UwYQ9QA4x+/psEXFUsB/J9V01Q4C4x3fmJJ5a7L5uC4x
 URPNnhjE2TEMhS8rwy7lKhxhrxeKY6pPJB2XKHVMt7P+ioZVpX9pC6j6WZn0vl8E8Kst
 HBEBSmPZ/odMrxtKdVf2QLjIvpH0nDJJ201WqY+TolnZZ8pEuEMU/cWJhulAgxczuFta
 NsHbIXiJ44AYSka4l4mLI0BbcZjkUj8alIop3wAqnpYwEINgyx+D95zaKJ6trO0qS7gZ
 X8BQ==
X-Gm-Message-State: ABy/qLYbdKkuptsWDFU9WYVYgskPwdQccoZV1KStN7EYzlFELsdhe3T2
 EJFFxfeVxtR7yjcb1EWwrkGJGg==
X-Google-Smtp-Source: APBJJlHhCxv3Wc+ToD0/nrTtVykhu4juNcrw0mAuwm7FsWE2vsrqxZ5Fi+7mjiJEsHioGiESVp9Mug==
X-Received: by 2002:a2e:3a13:0:b0:2b6:cd40:21ad with SMTP id
 h19-20020a2e3a13000000b002b6cd4021admr5215687lja.37.1689434744394; 
 Sat, 15 Jul 2023 08:25:44 -0700 (PDT)
Received: from [192.168.1.101] (abxi167.neoplus.adsl.tpnet.pl. [83.9.2.167])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a2e98d4000000b002b70aff9a97sm2552976ljj.16.2023.07.15.08.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jul 2023 08:25:43 -0700 (PDT)
Message-ID: <ff7fac16-deaf-4e71-91aa-b2ea66098c9d@linaro.org>
Date: Sat, 15 Jul 2023 17:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/2] DSIPHY RPM
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
 <168908465045.1869384.1893558597710112842.b4-ty@linaro.org>
 <3b4865d7-2730-1ea9-d75b-a015d27aa84d@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3b4865d7-2730-1ea9-d75b-a015d27aa84d@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.07.2023 18:31, Dmitry Baryshkov wrote:
> On 11/07/2023 17:21, Dmitry Baryshkov wrote:
>>
>> On Tue, 20 Jun 2023 13:43:19 +0200, Konrad Dybcio wrote:
>>> Some recent SoCs use power rails that we model as GENPDs to power the
>>> DSIPHY. This series attempts to make such configurations suspendable.
>>>
>>> Tested on SM6375.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/2] drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
>>        https://gitlab.freedesktop.org/lumag/msm/-/commit/a402e0e61b75
>> [2/2] drm/msm/dsi: Enable runtime PM
>>        https://gitlab.freedesktop.org/lumag/msm/-/commit/4e905c2acc9d
> 
> Unfortunately this series breaks our CI, see [1], [2]. I had to remove these patches for now.
> 
> I suppose this is either because of a probe deferral or because of having subset of drivers built as module. Konrad, could you please take a look?
I see no reason why it would break things :/

You can see that rpmhpd sync_state has not completed, which means all
PDs should still be pinned at max vote..

Can we somehow retest it?

If it still fails, can you try enabling runtime pm on dispcc and hooking
up vddcx?

Konrad
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/45271774
> [2] https://gitlab.freedesktop.org/drm/msm/-/jobs/45271775
> 
