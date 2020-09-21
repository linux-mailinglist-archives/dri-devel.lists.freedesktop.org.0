Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84E272CF4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 18:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF4F89FD7;
	Mon, 21 Sep 2020 16:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A6D89FD7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:36:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t10so13499267wrv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i047OCSlx026/Yej+lLApd9wks4kMyKz8RfAY/wU+IY=;
 b=fnaYptNQLJYqN12KIQYAO8/g/W6HQUgEF41DUo46RaMSJaY36li9p7HpTRpmi9U7rb
 Sq/1WAR85VQcUe+WA4dnt3WA6SbIz+HKT6LVg+iUaFbuZqwFpSp9Ox7GYa9NLFjCYXDC
 26u7SC9YVkT4804uJ2HL4vDZ3zZfM83cq/fpoVrTIOv3X4KtDf7MXt0a4W189zvn42dw
 Ekp6oNtMVf98ZVKQ6wbJowG9+XRxPu15rSDCwSGtK0pLh1cevPCWXbmOjzEzvj1AwXCO
 y4iEBigx+MybfZ8YKfnIUgpwlhsctTdYu1i2qO/m34CTtPRdM8xbsE3IMm8Hon/fZkOR
 ANjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i047OCSlx026/Yej+lLApd9wks4kMyKz8RfAY/wU+IY=;
 b=O4EWm73QYdbTysyKbhWpw75dbTjQP8VTJLnw4h3JAgF0RmyAVR4sLvgfZlmi3N6vmQ
 4q7UlXsGQmbwJF1PE4To6oXEc++7gF17CZ9WjViF7k5OqMqL+hWtLD+G+G3F5SeYKh5U
 m32pBCtMpzF0iYrMkNOmKXWOnYn66O/9CHH3cmMepIsZ5fwtumn9+lmkZtMGWSg3Scxg
 HMtNAMt6YXO8Sk1s3RZzIugm3zNayPc0CjehZ9ApxZ7W1txzpdWNO/q7yEoh75sR24MH
 /+4XD3/Vgf/KXcXgac0NY5DlV+vaY81y2MZdiAA2MBoWZ9OaXb5tItyXoODrou8m5/wL
 zI9w==
X-Gm-Message-State: AOAM532K51f12s10ekO9/tiES/mTsUxpzQgthKQP1mCt4BfrlrZvv8ta
 CUKtCUS57qYF2o9UjEYMnx3lNjyDU3HfTQ==
X-Google-Smtp-Source: ABdhPJyE6UTU+NOoQbGA0PsvLxZuHcEl/orKyvrLnH2D9aPBBwzeT9orNU7S0BsGCCw3FJwRz3Lzlw==
X-Received: by 2002:a5d:444e:: with SMTP id x14mr578878wrr.235.1600706207846; 
 Mon, 21 Sep 2020 09:36:47 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id s12sm201994wmd.20.2020.09.21.09.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:36:47 -0700 (PDT)
Subject: Re: [PATCH v3 9/9] drm/mediatek: reduce clear event
To: Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-10-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594262378.21095.3.camel@mtksdaap41>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <826a79e6-7d4d-90e5-d9a7-4724753dc2d7@gmail.com>
Date: Mon, 21 Sep 2020 18:36:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594262378.21095.3.camel@mtksdaap41>
Content-Language: en-US
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
Cc: wsd_upstream@mediatek.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, linux-mediatek@lists.infradead.org,
 Houlong Wei <houlong.wei@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/07/2020 04:39, Bibby Hsieh wrote:
> Hi, Dennis,
> 
> Thanks for this patch.
> 
> It's better to send another tree for this patch.
> Because this tree is only for soc/mediatek.
> 
> Please do not forget to add the dependency information.

Normally you are right. This time I took this patch as well into my tree. I 
verified with the merge tag from CKs DRM tree that we don't have any conflicts, 
so we should be Ok.

Regards,
Matthias

> 
> Bibby
> 
> On Tue, 2020-07-07 at 23:45 +0800, Dennis YC Hsieh wrote:
>> No need to clear event again since event always clear before wait.
>> This fix depend on patch:
>>    "soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api"
>>
>> Fixes: 2f965be7f9008 ("drm/mediatek: apply CMDQ control flow")
>> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> 
> Reviewed-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> 
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> index c84e7a14d4a8..ba6cf956b239 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> @@ -490,7 +490,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
>>   		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
>>   		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
>>   		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
>> -		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, true);
>> +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>>   		mtk_crtc_ddp_config(crtc, cmdq_handle);
>>   		cmdq_pkt_finalize(cmdq_handle);
>>   		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
