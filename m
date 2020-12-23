Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55922E2ADD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CC489C25;
	Fri, 25 Dec 2020 09:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2427F88422
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 23:37:38 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id c12so298466pfo.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 15:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N/12g1zGu+Yz6r0PP1NPtunqUzCRCfehscqLVDpimXc=;
 b=s8p0kC+VdqYL0XO4BYjdBFWtPvPKeDp9Z7v0/X8pJ1Bg1QdPZ3/OGeE7u8Inou/GKc
 kYSjsacWx9XfznAjY/yXdV0uM+gloyLMgUa5sZ1wA6KE2cCZIX94pLOuMBOj2VGlGXR1
 4t1mY+F80B4k64oI11e4xMLx/Kjs0HDzTqYds2yXYZGXAUjl1P2x9YAXmhipkNSKcVgM
 SphpxMvKlbvk3sUZiaH3lS3ZwFMtkgFoLu42P2mKeyejqGqW1CoH9zPt582USvx6nPcy
 uZJDLcWkCD2vsRX8rykVwgm+QhQc4SZT0byMdPi8PvXsS6t7NTmQ/etvpZgZY9o3rARC
 7WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N/12g1zGu+Yz6r0PP1NPtunqUzCRCfehscqLVDpimXc=;
 b=JO6xIp/+igQ8XLSNnX8WzELDq529e5Ej8BlajbySXqagfhEBPMadBobM/2vRMqCzYS
 C7KH0A3lMDVR2coxQLsS+zN6GCv4GzWBpOTsAnQ8N2OwDnWFKiXNJnaVPWXI9QDl8qdb
 NNwtvOQCGJS4ZXEWcuB3U3tkxlG/BR/TFVaiLsYC3MSRcCbyNX9+uHZn0QiPv9WozBba
 RYZlG/diS78aYIKZPjOfKb8UIEq1AMeqXOkjIJixwzkeQdJNiauKR6rA6NXX4OFeuOvc
 +Fh8JvtTgv1mBBfF4IQCiJU0xCcmboqGpm2zuY0CtOYTQTCCd3knAHTl+KNiRBOyY4tY
 0vFg==
X-Gm-Message-State: AOAM5307ZcgbG1Y7IiD7ekT0fGafVxF7sO/otqAi4pitDYxz5bpMTQEz
 /XKIM76xltQYRblacNlzgqU=
X-Google-Smtp-Source: ABdhPJzrBCHWiKNJ6jth5A+p+OjTj4wfew7D7ikqXZaITr1kquCONYWwhV2gAIGUrl3mBoy92Uk2XQ==
X-Received: by 2002:aa7:8f35:0:b029:19b:1258:ec5d with SMTP id
 y21-20020aa78f350000b029019b1258ec5dmr25960483pfr.9.1608766657661; 
 Wed, 23 Dec 2020 15:37:37 -0800 (PST)
Received: from [10.230.29.27] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a19sm23592831pfi.130.2020.12.23.15.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 15:37:36 -0800 (PST)
Subject: Re: [PATCH 0/4] drm/v3d: Minor improvements
From: Florian Fainelli <f.fainelli@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
References: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
 <2f9769da-f5b3-0c25-2f46-a0796da225ba@gmail.com>
Message-ID: <aa2781a4-b748-cb49-bf3d-52881ea66b37@gmail.com>
Date: Wed, 23 Dec 2020 15:37:34 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2f9769da-f5b3-0c25-2f46-a0796da225ba@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/23/2020 1:39 PM, Florian Fainelli wrote:
> 
> 
> On 12/23/2020 12:27 PM, Stefan Wahren wrote:
>> This small series of v3d patches is a preparation for the upcoming bcm2711
>> support. The bcm2711 support will be send separate, because it involves
>> bigger changes.
>>
>> I'm not sure that the schema conversion patch is sufficient.
>>
>> Patch 2,3 are directly taken from Raspberry Pi 4 vendor tree.
>>
>> Nicolas Saenz Julienne (1):
>>   drm/v3d: Use platform_get_irq_optional() to get optional IRQs
>>
>> Phil Elwell (2):
>>   drm/v3d: Set dma_mask as well as coherent_dma_mask
>>   drm/v3d: Don't clear MMU control bits on exception
> 
> You need to amend your Signed-off-by to all of those 3 patches that you
> did not author.

Looks like you fixed it in v2 about 10 minutes after, sorry for the noise.
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
