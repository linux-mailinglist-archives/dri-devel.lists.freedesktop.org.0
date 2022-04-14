Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E843501F24
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 01:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6D110E181;
	Thu, 14 Apr 2022 23:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F5E10E1AD
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 23:34:23 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id v13so1742098ljg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 16:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Iui9A+eLQEY/nX+0oDEarv6ntwSJTGA8ToTL+L3pSEo=;
 b=tPx3lgri1J4tM045vBZculeqPJ22HKITNe27W1ZxTmMg3yUfKNn+TV2PX9786JrPSM
 hkQy2xsKJnKixL0NBGE8/p+LrGOb2S5tTuQ+q8ucsxWw2tDvT5PkE4S2ouT1GszK0k5C
 9R9tEFvRgDMIqGGRZEO1sW2b16jHX6+GTxKJ7uRN/bAsIUnTRFyC8iueFCw4b18Spnto
 hvrBogLeJiSc+5K+OZ0NaHIvaL5DwN0Ph5G2+tNpdrhJNIkh/ffjWrzA+QWeIPxx9YJv
 /drw2SkZ4YFuzMUtnPBAKAdWWQzLiSUZ7S8d+s3ReoZLWG605WBm5czCpZDIYv68Mwks
 /lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Iui9A+eLQEY/nX+0oDEarv6ntwSJTGA8ToTL+L3pSEo=;
 b=OMMfthaLJzOiNnCW+Dry8dIfCQ2Eu6FJuxwLkWsUpWUl0vTXxm4VBY0N0OPEYFO82h
 Kmi2ULmL3iz+RNq1rRnsUGXRGj20NxY7BEGR2tCqI12nsdQ+XVzYs29OH7ZlsyCCR2kf
 irbX/NbszCpUKP3Q6gLP1uQxa6hCMyVBp/ZJ7l8GAC2zOOMiWuwNCajvepreozsiFFqt
 25wWFMYxqqtGudr7oyD8lCrMq+Hav67rYQrsxYjZsitxf/0ijGufWOp95qYEni+CePeu
 xIaLg96ccK1VFHCAV29lskBhnR9LV6RyuQ4zvh/GSoqXy/XSQOlge0jfC/GZjSY/DIJW
 /t3Q==
X-Gm-Message-State: AOAM5310x0yqFtGAFUkjxJSSTvyjbQVm31pSSw/+b2qmyoPsSgmgiu9l
 UIOmw95gUEHVxk1JVy6n3qIbQw==
X-Google-Smtp-Source: ABdhPJzU0/5iGIGtQknfdNITwXnU5YI4i91HNLcKDS61fNRoBC8iasXpudVYzEAXrHuLyFTN5P8h4w==
X-Received: by 2002:a2e:5cc1:0:b0:24b:112f:9b36 with SMTP id
 q184-20020a2e5cc1000000b0024b112f9b36mr2938326ljb.337.1649979261871; 
 Thu, 14 Apr 2022 16:34:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y37-20020a0565123f2500b0044a1e1c6b37sm142795lfa.53.2022.04.14.16.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 16:34:21 -0700 (PDT)
Message-ID: <27bb2732-b322-75b0-3883-773e6eb4b1b9@linaro.org>
Date: Fri, 15 Apr 2022 02:34:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
 <625ce8a0-4e25-5513-5599-c1cdebf5a3a5@linaro.org>
 <09fd563f-4a2c-f670-51c2-0e5ff023816d@quicinc.com>
 <CAA8EJpqzucFGf8ndDi2LZqtKiOt_w=_h1oPAUNVCdmUyh_3+zA@mail.gmail.com>
 <2039ef97-4fdb-bffe-1e02-18ae79c18be4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2039ef97-4fdb-bffe-1e02-18ae79c18be4@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/04/2022 01:06, Kuogee Hsieh wrote:
> 
> On 4/8/2022 4:59 PM, Dmitry Baryshkov wrote:
>> On Fri, 8 Apr 2022 at 23:30, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>> wrote:
>>>
>>> On 4/8/2022 5:27 AM, Dmitry Baryshkov wrote:
>>>> On 07/04/2022 00:28, Kuogee Hsieh wrote:
>>>>> dp_hpd_plug_handle() is responsible for setting up main link and send
>>>>> uevent to notify user space framework to start video stream. 
>>>>> Similarly,
>>>>> dp_hdp_unplug_handle is responsible to send uevent to notify user 
>>>>> space
>>>>> framework to stop video stream and then tear down main link.
>>>>> However there are rare cases, such as in the middle of system
>>>>> suspending,
>>>>> that uevent could not be delivered to user space framework. Therefore
>>>>> some kind of recover mechanism armed by timer need to be in place 
>>>>> in the
>>>>> case of user space framework does not respond to uevent.
>>>> Hmm, how does userpsace 'respond' to the uevent? The driver should
>>>> send hotplug notifications to userspace, but it must not expect any
>>>> particular reaction. The userspace might be as simple, as fbdev
>>>> emulation, but the driver still should function correctly.
>>> yes, driver is function correctly by setting up main link. but it does
>>> not know which resolution to display.
>>>
>>> It send hotplug notification through uevent to framework after main link
>>> is ready.
>>>
>>> Framework  is responsible to set up MDP timing engine to start video 
>>> stream.
>>>
>>>
>>> However it does not know which
>> It's of no concern to the driver. It is completely the userspace
>> problem. After resuming, it should reread available video output
>> properties. The display could have been changed while the system is
>> suspended.
>>  From your description I still do not understand why you need the
>> 'recovery' mechanism.
> 
> I mean "recovery" means  dp driver may leave stay at link ready 
> mistakenly after dongle unplugged due to missing framework action to 
> tear down main link so that next dongle plug in will not work.
> 
> Currently it was armed with timeout function and it will fired if 
> framework did not call msm_dp_display_disable() after 5 second.

framework = userspace?

Is my understanding correct? Currently DP driver sends a notification to 
userspace that DP is unplugged, waits for userspace to disable DP 
output, and only after that it will shutdown the link. Is this a correct 
description?

If so, then yes, your change is correct. I mean that the kernel 
shouldn't wait for clients to stop using video pipeline if the sink gets 
unplugged. Instead it should tear the video stream down and let the DRM 
client cope with that.

I'm not sure how should the driver react if the client doesn't disable 
the output, but then the sink gets reattached?
And a bit more interesting question: how should the driver behave if the 
new sink is not compatible with the existing video stream.

> 
> Anyway, we think this approach is not good. therefore it is replaced 
> with  below patch.
> 
> drm/msm/dp: tear down main link at unplug handle immediately


-- 
With best wishes
Dmitry
