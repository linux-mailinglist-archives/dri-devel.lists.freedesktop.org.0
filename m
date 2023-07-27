Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9962764953
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2738710E4FF;
	Thu, 27 Jul 2023 07:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F17910E500
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:51:26 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe0d5f719dso1094009e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690444284; x=1691049084;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HgW3/NRO1z7s/S3jKPbCiUySKA2trXiqdFCNmZAzOjk=;
 b=uaAZmFTo2b/nVU7o5KnvPdEzgzP0tFgFMlIj9YiEOCzrCDEmJeNkaV4gla3HcVngUE
 0PDKT5cW1h7CfxAaVT+Kqlae9A6SuWFeSYv5d9F/e4LuWijlqg4cTs3/1XkJ3vrBS+j8
 SnbUKtWBNBD9U1+kCCK5pIlXQaSctlycW/IKB91VBkDEynC94PmGYpmVUgsSdpWxkWBK
 OX4qYYKUjuA23Go6q7JPXRtBiU1GDhX/xgzdyCnvHYP4EJgevg9rju4wooG3sRjRTjYl
 hivb68aShqzY8YU6wi3FOv3EvvIUrELuls/YDhjDhzfE5qk1ySqjL2s8zLVSTmHA1vvK
 sOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690444284; x=1691049084;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HgW3/NRO1z7s/S3jKPbCiUySKA2trXiqdFCNmZAzOjk=;
 b=CvxxE0qsjfW2r1BjHSjIW15y8wE7stRmAAqqOs0IshJbKnzOoK27py8IrwU5/pbunW
 seSb1MeUUD0J1d/Ao8XlsntlSTvnD5Wbw03BS7xmumhbriViwXbpUncSYUufE+FfvvQR
 Q0E5guOoSpFqNCEu6aap4we6HDhVQnDyzurubBALl2eXdwpvvsnGG6dNfTiqV8LKTnDj
 NcD6lVkA65K4pYY0SsLrLIsHTpqsGxfWJmBnK3WRRYi4ebYK+aNfRJMSA/QWKOhehWlJ
 xsrrcTW61N+MJcbGpVhF9gbaYLIEavyNNHLCBdpJYxE15fna1JaYx6hJsLSPLvP63kAX
 gs9w==
X-Gm-Message-State: ABy/qLZV1iFQ81s1g0PzKlP69+Clq23pqxqw4OWL9NDM0ppYwQvFWyDI
 FrUveWveaBXs5vu3wOd5oeE7sprdStDczPxoQMVixg==
X-Google-Smtp-Source: APBJJlF/gI/5ruTJjzW3hVYUDitPZu8brrimMpRC1GxkRrNjH0pPXco1RRmW9Dx5e6eXUn2k5jBX/g==
X-Received: by 2002:a19:6917:0:b0:4fc:6e21:ff50 with SMTP id
 e23-20020a196917000000b004fc6e21ff50mr1067788lfc.55.1690444284503; 
 Thu, 27 Jul 2023 00:51:24 -0700 (PDT)
Received: from [192.168.1.101] (abxj4.neoplus.adsl.tpnet.pl. [83.9.3.4])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a05651221a900b004f864690901sm188251lft.244.2023.07.27.00.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 00:51:24 -0700 (PDT)
Message-ID: <111f5e38-6f6a-33bc-d17c-c85ae4a57aa8@linaro.org>
Date: Thu, 27 Jul 2023 09:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu
 device table entries
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-7-robdclark@gmail.com>
 <ccbe9ed4-7def-b0d1-2d1c-e2550d212943@linaro.org>
 <fpwpc7oyxzbfndojr2o2rkv2i66is4ylrtxh4equms7eyu4afc@cwyfgqanhlbo>
 <CAF6AEGt+qnUBAq3CHS4eTO1YQsbLjj3Urtt2LuSwRJ7XpzPBww@mail.gmail.com>
 <CAA8EJppJNrcXp8yswDycqA5HuK6bDCKrAkT4ttkGJvsWqD_YMg@mail.gmail.com>
 <CAF6AEGtLcwKRCMGgLAuABEbSR1CeYKF+D=ffsQLRo-f1BiprbA@mail.gmail.com>
 <f58998c9-82d3-d2fe-6f1c-801e616467be@linaro.org>
 <CAF6AEGu4_9kWyHCV0TOOU0vCqLBmrtEZDm9fAeMHNeDei7K8aQ@mail.gmail.com>
 <CAA8EJpr7Ed3ZBXfFxPV4u0t5obsP8yL5h3vwPMZSHjAMDQaA9w@mail.gmail.com>
 <CAF6AEGsHw2pkROZoBf=ucMUyk5B_nudHLM0hOJiJbYcawTFNdA@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAF6AEGsHw2pkROZoBf=ucMUyk5B_nudHLM0hOJiJbYcawTFNdA@mail.gmail.com>
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27.07.2023 00:53, Rob Clark wrote:
> On Wed, Jul 26, 2023 at 3:33 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Thu, 27 Jul 2023 at 01:04, Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> On Wed, Jul 26, 2023 at 2:43 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On 26/07/2023 23:11, Rob Clark wrote:
>>>>> On Wed, Jul 26, 2023 at 1:00 PM Dmitry Baryshkov
>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>>
>>>>>> On Wed, 26 Jul 2023 at 21:28, Rob Clark <robdclark@gmail.com> wrote:
>>>>>>>
>>>>>>> On Thu, Jul 13, 2023 at 1:26 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>
>>>>>>>> On Fri, Jul 07, 2023 at 05:34:04AM +0300, Dmitry Baryshkov wrote:
>>>>>>>>>
>>>>>>>>> On 07/07/2023 00:10, Rob Clark wrote:
>>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>>>
>>>>>>>>>> There are cases where there are differences due to SoC integration.
>>>>>>>>>> Such as cache-coherency support, and (in the next patch) e-fuse to
>>>>>>>>>> speedbin mappings.
>>>>>>>>>
>>>>>>>>> I have the feeling that we are trying to circumvent the way DT works. I'd
>>>>>>>>> suggest adding explicit SoC-compatible strings to Adreno bindings and then
>>>>>>>>> using of_device_id::data and then of_device_get_match_data().
>>>>>>>>>
>>>>>>>> Just thinking, then how about a unique compatible string which we match
>>>>>>>> to identify gpu->info and drop chip-id check completely here?
>>>>>>>
>>>>>>> Ok, I think we could do this, so something like:
>>>>>>>
>>>>>>>    compatible = "qcom,sm4350-adreno-619.0", qcom,adreno-619.0", "qcom,adreno"
>>>>>>>
>>>>>>> ?
>>>>>>>
>>>>>>> It looks like we don't have gpu dt bits upstream yet for either sm4350
>>>>>>> or sm6375, so I suppose we could get away with this change
>>>>>>
>>>>>> I think we can even skip the 619.0 part in the SoC compat string.
>>>>>> So it will be:
>>>>>>
>>>>>> compatible = "qcom,sm4350-adreno", qcom,adreno-619.0", "qcom,adreno";
>>>>>>
>>>>>> In future we can drop the chipid part completely and handle that as a
>>>>>> part of SoC data:
>>>>>>
>>>>>> compatible = "qcom,sm4350-adreno", "qcom,adreno";
>>>>>>
>>>>>> With the driver knowing that sm4350-adreno means ADRENO_ID(6,1,9,0)
>>>>>>
>>>>>
>>>>> I don't think we can do that, there are cases where the same SoC had
>>>>> multiple revisions of adreno.
>>>>
>>>> Is that the case for the production versions of the SoC? In other
>>>> subsystems what we usually do is that we add support only for the latest
>>>> SoC revision (which would probably mean the latest GPU patch revision).
>>>> Previous GPU revisions can be added in the following way (pure example):
>>>>
>>>> qcom,sm4350-adreno -> 6,1,9,1 // assuming v2.0 or v1.1 is the commercial
>>>> sample
>>>> qcom,sm4350-v1-adreno -> 6,1,9,0
>>>>
>>>
>>> My recollection was that nexus4 shipped with an early version of 8064
>>> which needed userspace workarounds that later 8064 did not.  Not sure
>>> if that is the only such example, but it is one that userspace needed
>>> to be aware of.
>>
>> Good question. I don't have nexus4, and both nexus7 and ifc6410 work fine.
>>
>> And this is a perfect use case for "qcom,apq8064-v1.1-adreno" compat string.
> 
> I no longer have a n4 that boots.. but if I did both it and the later
> ones should work properly if they expose the appropriate chip id
> 
> I do still prefer parsing the chip-id out of the compatible.  It
> avoids needing separate table entries just to have a different
> chip-id.  Maybe the scheme that is used elsewhere makes sense when it
> is only the kernel that needs to be aware of the device-id.  And maybe
> we could just done matching based on compat-id in userspace as well,
> but (a) msm and freedreno pre-date dt, and (b) that ship has already
> sailed.
I think a per-soc dt would be the better approach..

We could probably solve the revision issue with a socid readout of
the silicon revision and override based on that?

Konrad

