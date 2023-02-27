Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B026C6A3C53
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 09:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21AC10E365;
	Mon, 27 Feb 2023 08:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A0510E365
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 08:22:05 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q16so5258740wrw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 00:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=i6PJHsvt6qb2PliqFVaIWE8tkWSZx+WyUqPoldm+Qzw=;
 b=dd6F585s/W5bPDiJhFWmlOoeTzESoOubMpxKRjNtipbSroWf44waoJBY5AuFa/FUXM
 b/iDRbre8mADxEAvAJLPXXar7fQ53ynow9TJxJF7q88xzSW9sCrqV1lFLvwOulbVwzU/
 TTKspVmyODWCkToNxYC/OjAmPf0zbibzEYzjMidGZhIvJrEd5vMZWflOjXJpcWG3xHOi
 mA7GQg3m9YCkiRZ36vRp5COZdHWVcHAopKauY735TFrI5d86T+rH49H8bE7YarseQQXd
 XObKNOmRtxi75RWpJuRa5o0KEWi8QROJl6yBMxIGN8aEG0q7Q0ijcelVmi4tlscuO5NB
 dwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i6PJHsvt6qb2PliqFVaIWE8tkWSZx+WyUqPoldm+Qzw=;
 b=BMWXzinxgWKylx6Q4bfj0f2E0L/m6dz7Z3wzG66OSCfhBC0x/fhPuT6IUZanOQmekM
 CM98QXhAHShxO5dYHjgxlCK6ea0rZgSGPy4bQW59PwQHKDQyYzAKprQo0PSFZAYCUsFy
 QOFQW/qAV+K6rM5RzgUOIcydgUV2Yz55NHBvnqGZgkdx692uzpI5J7iTDhV+LA2Ac32f
 uAuKxhVzYn4+Mnb9Cm5Mza9Yelg7dhmPqV7LMX6q0SUPGC0Zxgwsn1/uMNaGRoTuAqeR
 /HbUMlm6NB4ZU860AAhNVJ5hyoEFX3k9GKjUZlkbr1XnQMkhBoBYB5ZgIbkhhOm0Q4rQ
 zcrw==
X-Gm-Message-State: AO0yUKVGaTn1geuCOxSevgJK6f5e2Ociofezp1rQPonysF32iHSK0Cpm
 eHGO8296JaS7sP19dk+pnf4iUg==
X-Google-Smtp-Source: AK7set/7vwjRkFb1Br1lmW2ygZlOcpMhiekGbKPQ3saKw5o0QAjuPHeFnhqT9AgI4O7XhCSuKlaGLw==
X-Received: by 2002:a5d:42c4:0:b0:2c7:1c44:5aae with SMTP id
 t4-20020a5d42c4000000b002c71c445aaemr8652206wrr.12.1677486123474; 
 Mon, 27 Feb 2023 00:22:03 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a5d5947000000b002c5a07e940csm6428220wri.33.2023.02.27.00.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 00:22:03 -0800 (PST)
Message-ID: <45387999-a930-c03f-1acd-a02b9b4b3b3b@linaro.org>
Date: Mon, 27 Feb 2023 09:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for DRM Panels
 drivers
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org>
 <Y+9awrqcQIOQNeaX@ravnborg.org>
Organization: Linaro Developer Services
In-Reply-To: <Y+9awrqcQIOQNeaX@ravnborg.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam !

On 17/02/2023 11:45, Sam Ravnborg wrote:
> On Fri, Feb 17, 2023 at 10:58:15AM +0100, Neil Armstrong wrote:
>> Add myself as co-maintainer for DRM Panel Drivers in order to help
>> reviewing and getting new panels drivers merged.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thanks for stepping up!
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks for you trust!

Is there anybody else willing to ack ? Thierry ?

Neil

>> ---
>>   MAINTAINERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index be167c695c64..18fd7548a49b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7043,6 +7043,7 @@ F:	drivers/gpu/drm/xlnx/
>>   
>>   DRM PANEL DRIVERS
>>   M:	Thierry Reding <thierry.reding@gmail.com>
>> +M:	Neil Armstrong <neil.armstrong@linaro.org>
>>   R:	Sam Ravnborg <sam@ravnborg.org>
>>   L:	dri-devel@lists.freedesktop.org
>>   S:	Maintained
>>
>> ---
>> base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
>> change-id: 20230216-topic-drm-panel-upstream-maintainance-6d5cae28d184
>>
>> Best regards,
>> -- 
>> Neil Armstrong <neil.armstrong@linaro.org>

