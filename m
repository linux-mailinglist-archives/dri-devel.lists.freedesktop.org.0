Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8F4CC25D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B8810E29F;
	Thu,  3 Mar 2022 16:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAD310E29F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:12:12 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2C4933F5F5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646323931;
 bh=1BGQjVNrvfbXoY5ZS3EibqKZUO0QZ3KFVt6NQJQD05k=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=qOX1PP7czXt6QXiG+pBZ//IDuWn9Zt+HYDTEKOyndhiHFq1h8m+m6B+Fz53baoFsk
 F3451DYa4BiRN5b3WBV6KP1dxVTidC8QuaUw6Zg0WliQONcLV4nFM81W3t9l19CjcN
 J1zshAH+MSTg6byTRFNwV3MHJidkSXTgwgFXWzgc+SFYWsUjCosu0aSt8LPAyVOq1o
 4Kxy5yVfenWDKm1tnKGuEFaDk6Su+TH+ORzgmpW91TBTv1vo7KH+D7UtecpoOeVhH/
 jgvkLySGYnu8cQBwRUvBleVOXyLaRIpe17u6s5k3nMs9VzL/ijKMQiXf5EuKgg8A5q
 47X6uQnnYGx9A==
Received: by mail-wm1-f71.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso1517830wmq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 08:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1BGQjVNrvfbXoY5ZS3EibqKZUO0QZ3KFVt6NQJQD05k=;
 b=0sNPY+DD1gTEQ4waLTAGe07pxSVM99NfojTAir7K8LQ8fxjmpx3sElS+R0b5g4ACfl
 tVPz6I7pQ4uiDjoLsJvOrhIDm/8Jkh9aTJ50CfKxbwuF8bixyDp5KKi+9Dgpu/1tCeVl
 Vc+SSFXjBm+DZ1VGpTqh2xzjZx3P7EeatHgklCZdCNq1ZuZAAw1VRmejW6y627pBYBkl
 sFAKJzYWbdv6kf8I9d6mPuq7HFJXVUGOTdjpid005QiOL99k+RiHB9EL3yvGEQrCXrv7
 ld8HM1cPdwD67/jSfKXg2a0qZayO5vb6E8a13FmIQcRMjBZRcE1bC6lYwgMFEcxRVbDo
 CdmA==
X-Gm-Message-State: AOAM530tGxngFlh0y4IUpv+HEBp8mt0MFCCN90grWDztpRkKXUgYA/vt
 hVVr7zkWzKdQmVOXcRzz2dNIBuF4Ri/RjDBiDApYSpQLukynJBpU+Gc/BokmxZRicJvkOhueIUe
 hgzfJuLdSLgKJZ6aGn4fTr6PWPrcIf5bZeyiV7fIOKqbTSA==
X-Received: by 2002:adf:9dcf:0:b0:1e3:200d:a363 with SMTP id
 q15-20020adf9dcf000000b001e3200da363mr28146358wre.105.1646323930544; 
 Thu, 03 Mar 2022 08:12:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7RxXzehx6WHCRoPsdx4WU9Q0UoR4WjMDO68zYZ8/KBCOOAFgdSIOncP68hbntK0mVj4ZDXA==
X-Received: by 2002:adf:9dcf:0:b0:1e3:200d:a363 with SMTP id
 q15-20020adf9dcf000000b001e3200da363mr28146340wre.105.1646323930366; 
 Thu, 03 Mar 2022 08:12:10 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 s17-20020adfbc11000000b001f023d197b8sm2407077wrg.68.2022.03.03.08.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 08:12:09 -0800 (PST)
Message-ID: <7288b8b4-0043-1d2a-10c3-964008ab2948@canonical.com>
Date: Thu, 3 Mar 2022 17:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 RESEND 21/24] drm/exynos/decon5433: add local path
 support
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>
References: <20190325071349.22600-1-a.hajda@samsung.com>
 <CGME20190325071401eucas1p10df709b256570f1aba9cbc4e875da1b3@eucas1p1.samsung.com>
 <20190325071349.22600-22-a.hajda@samsung.com>
 <b3c98aa3-751b-acc4-8e57-5566af27f922@canonical.com>
 <6270db2d-667d-8d6f-9289-be92da486c25@samsung.com>
 <9c1dc8ee-c717-377b-879c-0706a1613cf3@canonical.com>
 <ac077b37-5861-594f-560f-654f9257959d@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <ac077b37-5861-594f-560f-654f9257959d@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/03/2022 17:11, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 03.03.2022 17:03, Krzysztof Kozlowski wrote:
>> On 02/03/2022 02:00, Inki Dae wrote:
>>> 22. 2. 7. 01:51에 Krzysztof Kozlowski 이(가) 쓴 글:
>>>> On 25/03/2019 08:13, Andrzej Hajda wrote:
>>>>> GSCALERs in Exynos5433 have local path to DECON and DECON_TV.
>>>>> They can be used as extra planes with support for non-RGB formats and scaling.
>>>>> To enable it on DECON update_plane and disable_plane callback should
>>>>> be modified. Moreover DSD mux should be set accordingly, and finally
>>>>> atomic_check callback should be used to limit the number of active planes.
>>>>>
>>>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>>>> ---
>>>>>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 80 +++++++++++++++----
>>>>>   drivers/gpu/drm/exynos/regs-decon5433.h       |  6 ++
>>>>>   2 files changed, 72 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ex
>>>> Hi guys!
>>>>
>>>> I am working on DRM bindings conversion to DT schema format and I found
>>>> this set only partially applied. I merged the DTS patches ("dsd" clock),
>>>> but I think the driver and bindings were not picked up.
>>>>
>>>> Nevertheless I am going to include the "dsd" clock in the new bindings,
>>>> so the DTS passes DT schema checks. Let me know if other approach
>>>> (revert of DTS change) should be taken.
>>>>
>>> Sorry for late response.
>>>
>>> As of now, "dsd" is a dead property not used anywhere.
>>> This patch series makes real user not to work correctly due to ABI change.
>>> How about reverting it until this patch series is merged after fixing the real user problem?
>> The Exynos5433 DECON bindings were already merged by Rob, so someone
>> would need to send a revert. However this does not answer the actual
>> question - whether the "dsd" clock is necessary, whether it is there
>> (routed to DECON). If it is, it should stay in the bindings.
> 
> It is routed to DECON hardware and enabling it is needed to make the so 
> called 'local path' (when DECON takes image data directly from the 
> GSCALER hardware block instead of the memory buffer) working.

Awesome, thanks for confirmation! Bindings are good then.

Best regards,
Krzysztof
