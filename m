Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7234C175C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 16:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A15710E1B9;
	Wed, 23 Feb 2022 15:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4185910E324
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 15:44:06 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id d10so53313699eje.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 07:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D9YoXmL0fH0aKcdRK7BK9p6bYV4a8ZT32GFRySXCBdU=;
 b=vn4t58kdnli0qX9Bs2IQvnvxovkWaamGkXdHna4+obWh8usHSIzENna1UpAUbUwVPn
 QUaH3iRwuC3eU7Xe5sid6/KrVCNeow5a2ttkQY/qPyCPa4EFA161JiTygvqIKfatDT80
 tNb6H2LmJEKPb+zgJM6vPAduEVkxU+WyfjWHsFsQKbtqGLuh+8+WyvzCiK41Zf1IBS6f
 lMcO+raZjy3OJyknLI7Xf2G0jFwyCixh+3SkD3qdkSzdnN8wyM7m7bJT9O2AyBq/qu5k
 hKFFtmkBs06n9dfbxmERNqZINqgjpJruMRnaaT7i7TGe485hnq6cMlSQz6cxtOfSWclt
 vSUQ==
X-Gm-Message-State: AOAM533rzZlHC2J6gRU0jVCCjQd16L5GzkyIWaJEQT8G/iSYp796Wu5T
 vYb6ki7Ypv2cVqzjTTYWyK8=
X-Google-Smtp-Source: ABdhPJxXI094jfo93LhxnFNB5bGS9gHU1H1rFlcOLOWlSh9AKcr6Cm2g1nUnSRsQyalvpUvbbLbSDA==
X-Received: by 2002:a17:906:35d5:b0:6b7:faf7:9611 with SMTP id
 p21-20020a17090635d500b006b7faf79611mr238158ejb.537.1645631044590; 
 Wed, 23 Feb 2022 07:44:04 -0800 (PST)
Received: from [192.168.0.125] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.googlemail.com with ESMTPSA id f3sm8446edy.72.2022.02.23.07.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 07:44:03 -0800 (PST)
Message-ID: <2929cc96-b272-7144-f4a4-71d60852c5cd@kernel.org>
Date: Wed, 23 Feb 2022 16:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 2/4] Documentation/dt: Add descriptions for loongson
 display controller
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>, Rob Herring <robh@kernel.org>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-3-15330273260@189.cn>
 <YhVrigEnXTiNgk67@robh.at.kernel.org>
 <720f940e.5ac.17f26de3a5b.Coremail.suijingfeng@loongson.cn>
 <72e3790f-088d-1a70-a5f7-3a18c14a6eae@189.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <72e3790f-088d-1a70-a5f7-3a18c14a6eae@189.cn>
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2022 16:35, Sui Jingfeng wrote:
> 
> On 2022/2/23 21:56, 隋景峰 wrote:
>> Something like this:
>>   
>> dt-bindings: display: Add Loongson display controller
> 
> Hi,

Thanks for resending in a proper format. I already replied to your
original post, so let me paste it here as well.

> 
> We are not a platform device driver, there is no
> of_device_id defined in my driver. In other word,
> my driver will not bind against devices whose compatible
> is "loongson,ls7a1000-dc". We just parse the device tree
> actively, find necessary information of interest.
> 
> What's the meaning of dt-bindings by definition ?
> In this case, can I use the word "dt-bindings" in the commit title?

This is a patch for specific subsystem, so as Rob said, it should follow
subsystem conventions.

The patch itself is a dt-bindings patch, so there is nothing here
special which would encourage for any exception.

> 
> I want to follow the conventions, but get some push back,
> Krzysztof say that he can not see any bindings, these are not bindings.

I said in comment to your patch with DTS, which you called bindings,
that there are no bindings at all in it. Because in your patch with DTS
you did not include bindings, but you called it bindings.

Here, this is a patch with bindings, so your comment "these are not
bindings" is not true.

Best regards,
Krzysztof
