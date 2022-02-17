Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949EF4B9B3F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FC510EB3E;
	Thu, 17 Feb 2022 08:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC66010EB3E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:38:52 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id t21so8286221edd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 00:38:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w/AFtpF4QCrXUI7mVF4B682OTVEfmrPVxtaxPs2OWFY=;
 b=eIkjmNPVLd66kB4I+LnT3RO7pdqWO+0WxHm+cH6ObIs6k1+gHiXGmSi84JRfAjHa+x
 uY5zVdnxdc1eJ4y2cypdjegLjkmli/BUNigkxOslgn+BulF5mBpXGbw4DI7tfue5FWri
 zBYEgtl8CWC85920Hre8xEv7LxSdOfsNfKTVVii2AsZMEk/noaGq2GRPSh1SdrQxlxgl
 6g6OzuCL/+xTO880d147J8uK6FEIrigFXhtF1aiwU1yow/ymllKCWcai+aqVAjFpsq51
 ahjh1E8F2+KwAjkVmtDCQQW1fZRvb4kkCVYCbI/LrDTHqdieSPsogVVjaO6PW2x9F77j
 CsKQ==
X-Gm-Message-State: AOAM533bgS1qV9xf+XNKYyr3BeJ+EW9kEMrak4fPJ/bMAWQJ7imLp2Bq
 imkuZ8ZNp+SI6fQ/dwc77Ms=
X-Google-Smtp-Source: ABdhPJxn7pKwRyqx0Y0ea3DQzyUs/IBfs0QVvVW9owY+t89r21wY7ZRWhHHvWSfT2SYHVdGXghxYFA==
X-Received: by 2002:a05:6402:280d:b0:410:be87:c59d with SMTP id
 h13-20020a056402280d00b00410be87c59dmr1522546ede.95.1645087131134; 
 Thu, 17 Feb 2022 00:38:51 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.googlemail.com with ESMTPSA id r22sm925295ejo.48.2022.02.17.00.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 00:38:50 -0800 (PST)
Message-ID: <3cb77487-0c38-9607-46d9-5204b35b4fab@kernel.org>
Date: Thu, 17 Feb 2022 09:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 2/3] dt-bindings: ls2k1000: add the display controller
 device node
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-3-15330273260@189.cn>
 <CAJKOXPfN+Ax8i_Mcax9LfbSG8VwM86YgUxuRUfSF_YEx4z0EaQ@mail.gmail.com>
 <3e34a508-3969-80d9-4ef7-7cb358c0147d@189.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <3e34a508-3969-80d9-4ef7-7cb358c0147d@189.cn>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-mips@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/02/2022 15:01, Sui Jingfeng wrote:
> 
> On 2022/2/3 16:50, Krzysztof Kozlowski wrote:
>> On Thu, 3 Feb 2022 at 09:26, Sui Jingfeng <15330273260@189.cn> wrote:
>>> From: suijingfeng <suijingfeng@loongson.cn>
>>>
>>> The display controller is a pci device, its vendor id is 0x0014
>>> its device id is 0x7a06.
>> The same as your patch 3 - these are not bindings.
>>
>> Best regards,
>> Krzysztof
> 
> Yes, you are right. As there is no compatible string in my driver to match against the compatible
> in the dc@6,1 device node.
> 
> I don't know how to write YAML document now, it seems no similar case can be reference?

I referred to the subject - this patch is not a "dt-bindings" patch.


Best regards,
Krzysztof
