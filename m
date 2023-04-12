Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5980A6DF219
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 12:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7371510E14C;
	Wed, 12 Apr 2023 10:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCCD10E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 10:39:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 gw11-20020a05600c850b00b003f07d305b32so6992135wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681295990; x=1683887990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KGPoMrimq4ykC+CCAmU0vfBHgEx9Wc5sSeoWOQ7Muos=;
 b=nk7EYXw1Ck11A+VETjG1M3ziBr3z9h7J/pLLp1qaOO9bYjTOZGD8Z+Mt1H+WNWMGs7
 vgoO38EJ2garxLct10JyNXGnzma39thy3k1VdUY0kr+CBZnJLOu+HXrLHJ46mBet2yw3
 kUtKUKQK9rw45b2T/NgNMK8slwgW3rNVGB9atEnQ77r2Jbx4XFwi2Y5DVExFgY5B2u0W
 jkfD3QEgpAxqq3aJ2zjeivGn6U/YbJdGu7H4XeDF3+G+wh0gNTudngb/SvfHOZioOITh
 HP/1V3fSvyWIZlJmPx7vJNoC4KgrVS1ADE3FtMAHgzV4k1h9AyiESOvs1OHTCo3Asr6Q
 Mc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681295990; x=1683887990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KGPoMrimq4ykC+CCAmU0vfBHgEx9Wc5sSeoWOQ7Muos=;
 b=t+/logn06ej9dFmcwlW770UDy6T+N8zUDtNymcBvFH8JvE1lsR/9eI+zkT0C45BaYf
 K2+7Vi+/w32Dx17zjPgpHXMbFIkiA+C7aKI7K1H6XZ+eoZMbFJ6Wim32py+Me0EObXhn
 vINJKw4VQ/WNoYgvD34RBLFioh/GBKkUNvB0e7zNaEvFu5+qutzWZYGFoEsV4omk6aES
 s3ygRilc2avnb5uxueB83Iqxc5tbF4nMwT+rxDI4xMBLnHQNYljgFfPKKGpMvOs+Lm+j
 9EDu9ClCjhwNQe2NGaXEx9eLVMYsMXNNZi+gSlwCyhG/Iema4r06M0K2/aUDQtcp1TIy
 qbqQ==
X-Gm-Message-State: AAQBX9fGrFk4xqm/AF4IbihddvT/jNoUGlI4S3/Ivx95xAqIMhiVsbKa
 iyeCUuplgsjswad4jWcF23Y=
X-Google-Smtp-Source: AKy350Zus9gjtjUqe2oU8CgEhLggOze5DqaENaV5ht12OYm2dkXU4dJQKK8YoUOw/rwWYacl7Qr8Qw==
X-Received: by 2002:a05:600c:2284:b0:3f0:a023:2614 with SMTP id
 4-20020a05600c228400b003f0a0232614mr558740wmf.6.1681295989743; 
 Wed, 12 Apr 2023 03:39:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a05600c4ecf00b003edc4788fa0sm2043373wmq.2.2023.04.12.03.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:39:47 -0700 (PDT)
Message-ID: <a1136c32-0c29-3803-da15-59b40fcf333e@gmail.com>
Date: Wed, 12 Apr 2023 12:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/9] drm/mediatek: dp: Cache EDID for eDP panel
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
 <20230404104800.301150-2-angelogioacchino.delregno@collabora.com>
 <09c61b94-1ed1-eb72-9682-1f1f203f6f63@gmail.com>
 <783c03af-fc88-96c8-c6fc-6f02051dc6b1@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <783c03af-fc88-96c8-c6fc-6f02051dc6b1@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2023 10:06, AngeloGioacchino Del Regno wrote:
> Il 12/04/23 09:08, Matthias Brugger ha scritto:
>>
>>
>> On 04/04/2023 12:47, AngeloGioacchino Del Regno wrote:
>>> Since eDP panels are not removable it is safe to cache the EDID:
>>> this will avoid a relatively long read transaction at every PM
>>> resume that is unnecessary only in the "special" case of eDP,
>>> hence speeding it up a little, as from now on, as resume operation,
>>> we will perform only link training.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/gpu/drm/mediatek/mtk_dp.c | 11 ++++++++++-
>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c 
>>> b/drivers/gpu/drm/mediatek/mtk_dp.c
>>> index 1f94fcc144d3..84f82cc68672 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>>> @@ -118,6 +118,7 @@ struct mtk_dp {
>>>       const struct mtk_dp_data *data;
>>>       struct mtk_dp_info info;
>>>       struct mtk_dp_train_info train_info;
>>> +    struct edid *edid;
>>>       struct platform_device *phy_dev;
>>>       struct phy *phy;
>>> @@ -1993,7 +1994,11 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge 
>>> *bridge,
>>>           usleep_range(2000, 5000);
>>>       }
>>> -    new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
>>> +    /* eDP panels aren't removable, so we can return a cached EDID. */
>>> +    if (mtk_dp->edid && mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP)

Maybe better like this:
if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP && mtk_dp->edid)

To in sync with the if statement below. Anyway we are only concerned if it's an 
eDP so check that first (and hope the compiler will do so as well ;)

With that:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>>> +        new_edid = drm_edid_duplicate(mtk_dp->edid);
>>> +    else
>>> +        new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
>>
>> Maybe it would make sense to add a macro for the check of mtk_dp->bridge.type 
>> == DRM_MODE_CONNECTOR_eDP
>> it would make the code more readable.
>>
> 
> I had the same idea... but then avoided that because in most (if not all?) of the
> DRM drivers (at least, the one I've read) this check is always open coded, so I
> wrote it like that for consistency and nothing else.
> 
> I have no strong opinions on that though!
> 

I think the only reasonable solution would be a macro like:
DRM_CONNECTOR_MODE_IS(mtk_dp->bridge.type, eDP) which in the end is longer then 
open-code it, so probably just leave it as it is.

>>>       /*
>>>        * Parse capability here to let atomic_get_input_bus_fmts and
>>> @@ -2022,6 +2027,10 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge 
>>> *bridge,
>>>           drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
>>>       }
>>> +    /* If this is an eDP panel and the read EDID is good, cache it for later */
>>> +    if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP && !mtk_dp->edid && 
>>> new_edid)
>>> +        mtk_dp->edid = drm_edid_duplicate(new_edid);
>>> +
>>
>> How about putting this in an else if branch of mtk_dp_parse_capabilities. At 
>> least we could get rid of the check regarding if new_edid != NULL.
>>
>> I was thinking on how to put both if statements in one block, but I think the 
>> problem is, that we would leak memory if the capability parsing failes due to 
>> the call to drm_edid_duplicate(). Correct?
>>
> 
> Correct. The only other "good" place would be in the `if (new_edid)` conditional,
> but that wouldn't be as readable as it is right now...
> 
> Cheers,
> Angelo
> 
