Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A868763815
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 15:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5243210E1AF;
	Wed, 26 Jul 2023 13:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D1410E1AF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 13:52:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbfa811667so7053405e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690379522; x=1690984322;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NbfW0N1EHg8LOIbiDZBCl2zrM+4CsT7HnV7dWADAoqs=;
 b=kYzo7L2O7pRSVlNwaklHki4LcUsRc3JHXcJA4c/ruBb3y5/0QG1CM3Ddmb0Gi66XFp
 Xhr/+dyGtPg128h+XpxakXvi9Vq+5fxMQqiVnhh9FSEqFL5An35srShVnyfgDTyEqt6n
 GHvsELKvdiUFKPBpTjuNVi6aRcPBAt+NdCKILnyH6cnWmSJy5s/VtJkDpBFgJ4SHw+7N
 3arFkAhmIz6+a+EPmO10f1VC7ywb2ev7j/PSLyLCr6oAR2aUdGUwvEc16hspysTomt+9
 tKd8wqpWG7Mg/N1PWfALmcFg8LqqHFTrcec5CjYQbvCrzIpnuYpn9gdTjuwzyerrRKuv
 FB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690379522; x=1690984322;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NbfW0N1EHg8LOIbiDZBCl2zrM+4CsT7HnV7dWADAoqs=;
 b=eD15xIMm+SjEqDyTdveR+R/jYr83jS8Lb8FsHv00vEqi3Ptgpn4csCxsd3xILcaCgB
 eFJ4yx9KCuY/GCjshYo9qmJ9yCJ3LQbZubJMUAf+UDc/1mSDa8lY1E3DhQFhs1wc08Ss
 VGrrMCEw0yFtyBvk8eQ+RUVF7i7bDB6b1mNJdh9xFaiunTwe50F2Vs1CUhXBxt5KwJev
 ayHHUL1Noo+pbwxBLjK1biGzGkEsq7HUajseRmCAa/QS1+mS4hSTgzprK7k67GGV4MxX
 jh1KgrVsLgscqWi5ONHVIulScRsZj6NkJthDuFpszxqXfnimyI7SxyHLmCO0M7H0LpRd
 qwsQ==
X-Gm-Message-State: ABy/qLb3mZooXVs/LW0GH91TqYNHuXHr1UatI7aVyaHFugXMUet5k4n+
 geqSQPTFNkFyvXAOEylhZDgmxe3qimQ=
X-Google-Smtp-Source: APBJJlEsd0Wc7zCB/Slio2qe6Rve/NHUsRJn82qdYKWEvmI4Ht+aOyal05u4oDWx5QGmAdP//tILQA==
X-Received: by 2002:a05:600c:b59:b0:3f7:c92:57a0 with SMTP id
 k25-20020a05600c0b5900b003f70c9257a0mr2074345wmr.14.1690379522199; 
 Wed, 26 Jul 2023 06:52:02 -0700 (PDT)
Received: from [192.168.0.101]
 (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
 by smtp.googlemail.com with ESMTPSA id
 v1-20020a5d6781000000b0031434c08bb7sm19841025wru.105.2023.07.26.06.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 06:52:01 -0700 (PDT)
Message-ID: <721c0d6e-0a28-ae84-1425-a04d95349e05@gmail.com>
Date: Wed, 26 Jul 2023 14:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH][next] accel/qaic: remove redundant assignment to pointer
 pexec
Content-Language: en-US
To: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230725114037.36806-1-colin.i.king@gmail.com>
 <e457b416-3e63-0bae-0cd7-7788b43f30c1@quicinc.com>
 <c0b314db-bd29-7211-2a70-667405eb5bd0@quicinc.com>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
In-Reply-To: <c0b314db-bd29-7211-2a70-667405eb5bd0@quicinc.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2023 14:38, Pranjal Ramajor Asha Kanojiya wrote:
> 
> 
> On 7/26/2023 8:30 AM, Jeffrey Hugo wrote:
>> On 7/25/2023 5:40 AM, Colin Ian King wrote:
>>> Pointer pexec is being assigned a value however it is never read. The
>>> assignment is redundant and can be removed.
>>>
>>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>>> ---
>>>   drivers/accel/qaic/qaic_data.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/accel/qaic/qaic_data.c 
>>> b/drivers/accel/qaic/qaic_data.c
>>> index e9a1cb779b30..8a6cb14f490e 100644
>>> --- a/drivers/accel/qaic/qaic_data.c
>>> +++ b/drivers/accel/qaic/qaic_data.c
>>> @@ -1320,7 +1320,6 @@ static int __qaic_execute_bo_ioctl(struct 
>>> drm_device *dev, void *data, struct dr
>>>       user_data = u64_to_user_ptr(args->data);
>>>       exec = kcalloc(args->hdr.count, size, GFP_KERNEL);
>>> -    pexec = (struct qaic_partial_execute_entry *)exec;
>>>       if (!exec)
>>>           return -ENOMEM;
>>
>> It does look like pexec is not used in this function after it was 
>> refactored.  Shouldn't the declaration at the beginning of the 
>> function also be removed?
> 
> Yeah we should remove the declaration as well. Although it is used some 
> where to calculate its size i.e. sizeof(*pexec). We need to directly use 
> the type in sizeof() i.e. sizeof(struct qaic_partial_execute_entry).

I didn't remove the variable because of the sizeof(), but it makes sense 
to remove it. I'll send a V2 today
