Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38BB688826
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 21:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161F910E078;
	Thu,  2 Feb 2023 20:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D451910E078
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 20:16:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so2342300wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 12:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FC7A22kDDKm4iFJZCz/SFv4XLBhZwuNgB26sBiqqUIk=;
 b=MA3Uv8wS1+3DfUVRaW3sli5xx3tew+Vf3aZFl8o8QYZjElxZKMVhA3hH2qpWufFiQN
 jjRThM+SFIestcZqSB1+s8zMREhlgzoTSLS1XG3DXoubsXZZG0A1Zwt6wgGOMH7XzzkV
 pKmK6pOpsSC+94aqLczscoJiglLCZgqzk8qY4y8M/Wd0xFABFzwKvxTdVUiDJYyygLG2
 iXqfczRdt7b+q5i/vMa8cjehZoG0+0ZJQfkUUI6y4e/cV11XJs/jn+mJHoXNt519rf+e
 +Nd461aBv2am+/BeVW+k+APqja/cZY9+az6N0d5EMdUbGYndy33QCBC/DOWjNORGIZwq
 SrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FC7A22kDDKm4iFJZCz/SFv4XLBhZwuNgB26sBiqqUIk=;
 b=zzTnbuSvCred5uPrrJslgwTu3M3VbEl5gGXkhma6MBlDSaUbjmgHbzuFxeOojjP9xR
 YMJsoDqV4KZeR5onkexRO37SlDrDX4CshayNxYChQ1M1PHfgwoi6IFd7HDlzDMaJyKQX
 u7X+lHF9M/h6j36w3yaFFMHqN3yL+YhBsrnE27/547ejbQX+ajIaOl8StwsQK3PHy7Sr
 mFKfsx0xTVFs0SzptT/dZ6s6O2NK6RBfmgbo1yqyoHYLVttL8eaGEpVmb5J8O4dVBsbc
 nBxt2y43Ff47mD1p3BdmFbdC/P/mqr90nt18dB3joMJke90IMoswe8ihGC0J7ca47MfL
 8Mig==
X-Gm-Message-State: AO0yUKXSWzAfp4iP+d8aDtx0fTqfOOOnsAScnLHgpYtHQ35eHzGYlH9J
 k5miovzDT0KvDTsU4njAQAM=
X-Google-Smtp-Source: AK7set9RCCOggsVsOTU+HQYsqzAOze3x49AbZ1gunvi2oPWfSNFOc6BFqCq2Z8l1VgPzLVxLZAGyPg==
X-Received: by 2002:a05:600c:1c22:b0:3dc:37d0:e9df with SMTP id
 j34-20020a05600c1c2200b003dc37d0e9dfmr7221240wms.14.1675368995175; 
 Thu, 02 Feb 2023 12:16:35 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b003db0bb81b6asm887846wmo.1.2023.02.02.12.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 12:16:34 -0800 (PST)
Message-ID: <15711c23-43c4-86c4-0f56-4a76b5ffea46@gmail.com>
Date: Thu, 2 Feb 2023 21:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] drm/mediatek: Refactor pixel format logic
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>
References: <20230201170210.1253505-1-greenjustin@chromium.org>
 <20230201170210.1253505-2-greenjustin@chromium.org>
 <e96bd735-cf36-0dbd-cf93-446c1ab28778@gmail.com>
 <CAHC42Rf8+yS45VBUc_dDuvCydg4ttKYuGwdgFshZRUZWzGiXRQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAHC42Rf8+yS45VBUc_dDuvCydg4ttKYuGwdgFshZRUZWzGiXRQ@mail.gmail.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02/02/2023 19:59, Justin Green wrote:
> Hi Matthias,
> 
>> mt8173_formats are the same as the old struct formats. Maybe we should use that
>> and only overwrite where we actually use a different array.
> I think this was sort of how the original patch worked, but we wanted
> to add some flexibility to allow different components to support
> different formats. In patch 3 of the series, we actually overwrite
> this field with mt8195_formats.
> 

Yes, I had a comment on the naming in that patch. Never the less, I think if we 
don't need to "overwrite" the value, we should use just one struct for the 
values instead of copying them to the different .c files and give them SoC 
specific names.


>> Why can't we use ARRAY_SIZE(formats) here like we did before?
> I think ARRAY_SIZE is just a macro for getting the length of
> statically allocated arrays. Because we won't know until runtime which
> list of pixel formats we will be using, I'm not sure we can use that
> in this circumstance?
> 

You are probably right.

Regards,
Matthias
