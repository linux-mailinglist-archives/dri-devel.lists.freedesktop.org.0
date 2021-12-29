Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17313481415
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 15:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F47B10E2BA;
	Wed, 29 Dec 2021 14:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3051710E2B9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 14:25:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k18so8045205wrg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 06:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=pjYlN3fQUyrH1Y9l7SaP7OpdaDMi9fBO087bmleGSU4=;
 b=GSevx4zkS/+CEXR2sk7lq4+NtIdwxyoKz9q3GYUNVIVl3l8gbxqoytPK22pk48b6mg
 AIpyTkdwFB0yYaIP/Q8TtWjRHRVZrjipQxTKmXV5+PypzaROMykKjfQ/IOvZiIkpiyU3
 q96AgIQuXqMrhbOF/bdUrJ7H+iyh1ZoGdFfn4XMg14YveEMckhjcF3jrGTagYezvcR30
 VEMss+0o+ZBg7BUF3fGr/GA8AqrLy42P09fpBaxLWKDMsIW+d2dQq7UmtZoCt4XWU5pz
 l7nhPCccebnqFZNUuWUOYiNJYnSEzFNt8vWouIaDAsDkRlzUkjFSdqRcMA6+MmrJu3JE
 DJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=pjYlN3fQUyrH1Y9l7SaP7OpdaDMi9fBO087bmleGSU4=;
 b=Q1IAy0cVYBW85DQummimpO+XMhmpdh3isu3qygnXkIx2O3DJK0UJXFNaBsHeYXhzB3
 8oyGEVCzDdoeEhRjQCkZ6xVKFhNO+KhysFPriqaT7j8XxLv3iRJwq6rsh0/RIxp+AcXW
 VvPrFbO1vB1Rp7n1fZnZHthNXdMVafEkOHlVxhvL8kXHyHLbVx6rcQSrkY26pdZLQGYr
 b7qxa1crvPfl6J+s3v6saTB9nAGTyN+coYCpMj0GomdGPdm+nhNAKOAmnK29hjicCjFZ
 Ugz6e5YzbS5alBdlcqL2HBlmkFSwsRA/KYpBnJmegBTUouz3HMJChtpypzg4iHHODuoX
 rtYw==
X-Gm-Message-State: AOAM533ZuywJjPl71yxa3Oq0b82lyaSj6hsFgTf1VA82iF/YsTwOO/cm
 j/lxG6X6xvmiXpK1dpa+2mI=
X-Google-Smtp-Source: ABdhPJzRBdhVxtUXyHCJ8VRyq/aXdrpUZj7KVHcKANKeZLNwqwpB+e7BrOt6XxS6LvatplTbKaNPBA==
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr20891999wry.84.1640787927628; 
 Wed, 29 Dec 2021 06:25:27 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id l2sm21664851wrs.43.2021.12.29.06.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 06:25:27 -0800 (PST)
Message-ID: <363ed3cd-2a08-26a0-31e3-2ee4d01f71c3@gmail.com>
Date: Wed, 29 Dec 2021 15:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: miles.chen@mediatek.com
References: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
 <20211229030405.4338-1-miles.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix unused-but-set variable warning
In-Reply-To: <20211229030405.4338-1-miles.chen@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29/12/2021 04:04, miles.chen@mediatek.com wrote:
> Hi,
> 
> On 28/12/2021 10:25, Miles Chen wrote:
>> Fix unused-but-set variable warning:
>>> drivers/gpu/drm/mediatek/mtk_cec.c:85:6: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
>>>
>>
>> Actually we ignore the value passed to mtk_cec_mask. In case of
>> mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);
>>
>>
>> We are not setting CEC_32K_PDN. I wonder which side effect will it have to set
>> that bit.
> 
> I am confused about "not setting CEC_32K_PDN" part,
> in case mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);
> CEC_32K_PDN (BIT(19)) is set.
> 
> for exmaple:
> CEC_32K_PDN is BIT(19)
> PDN is BIT(16)
> say tmp = 0xffffffff;

You mean reading the register returns 0xffffffff, correct?

> 
> mask = PDN | CEC_32K_PDN;

mask = 0x48000

> val = 0 | CEC_32K_PDN;

val = 0x40000

> 
> tmp = fff6ffff, mask = 90000
> val = 80000, tmp = fffeffff
> 
> u32 tmp = readl(cec->regs + offset) & ~mask; // tmp = fff6ffff

tmp = 0xffffffff & ~(0x48000) // tmp = 0xffb7ffff

> tmp |= val & mask; // tmp = fffeffff

tmp |= 0x40000 & 0x48000 // tmp = 0xff7fffff

> writel(val, cec->regs + offset); // val = 80000, tmp = fffeffff

val = 0x40000, tmp = 0xff7fffff

> 
> in both val and tmp case, CEC_32K_PDN is set.
> 

You are right, in both cases the bit is set, but the funciton does not do what 
it is supposed to do.

With you fix:
With the mask we define bits that
a) are set to zero if not present in val
b) set to one, when part of val, independent of what the value was in the 
register read.

mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);


Will set CEC_32K_PDN to one and clear PDN in the register.

mtk_cec_mask(cec, RX_GEN_WD, 0, HDMI_PORD_INT_32K_CLR | RX_INT_32K_CLR |
  HDMI_HTPLG_INT_32K_CLR | HDMI_PORD_INT_32K_EN |
  RX_INT_32K_EN | HDMI_HTPLG_INT_32K_EN);

Will just clear all bits of the mask.

Without your patch, we will just write the val to the register and don't care 
what the register value was before that.

We should somehow mention that in the commit message, as it's not only about a 
not used variable, it actually has an influence on the value we write(-back) to 
the register.

Regards,
Matthias

>> Anyway, if it's the right thing to do, we should add:
>>
>> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> 
> I will add the Fixes tag, thanks.
> 
