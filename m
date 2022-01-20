Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B6E494EDE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0204910E7C0;
	Thu, 20 Jan 2022 13:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F2B10E7D5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:25:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id v123so12110981wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kAsXsTC0RU0DhDqIgVdxNCmIQvwWy+xHCXDDCFyjF7k=;
 b=D9Z4YdkhIp52f/F0ohGFC1DwtH5ScPFz9I6fu/t+cxl3IFj5j4AEU65igDmyulaVUP
 +YC8zdn10aOCJG4WZDw8XjAwP76h5Fc2WSY+gFBCa5Ao1ThkO27mPo9wBxWsAXPavVDW
 1WceziBjpMLuY/Yxn1xAuup5daUzIfh1OcN35XSqEdlSRzsfNETQ+TTjymHv8PA2n4K8
 S5mMwkgQx+JOnT7VjB9pqnUHo8GYf35ui/vAzwfAHxJic12yuusWe3k7TY1pwyO0JNLU
 ngpS+COg/BWHxAbIm3RA3Y1OJ1oAL7IabGQ1po+uUDSmuLmhXS4mwpsPm8G/CdDE7H9n
 77nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kAsXsTC0RU0DhDqIgVdxNCmIQvwWy+xHCXDDCFyjF7k=;
 b=0mbC1ijQI32s4PDjP+k2cQiALOHONUqsIvCpnG209MGQenTNLF1BHvS7+gndlVi98Y
 OwaawSXn1TwWr1uWxnYiliCJcO/p0HyUsP0nLA0yOZAsaa8osb+a2+X3i5a5XYyG42Pl
 txcOCwiQFhxBwf8JKA5cJlX6TnoAchMJ7qW+vG7vY5o+EdAxLJdybrkhGyVPh2oBr288
 rqmVnjQ4aojuj1HA6Sw8zjAyuPLcnhCdXUzyU5UKE9svmA3FKa5qKb4vVG6VKzfX1gUW
 VAoEto8DILbOjWWj7SnUGWyWTDwtWHKVOkfLXsaHrUM9XlXJIdAQdtfCX3LkTSNGhf1C
 xerg==
X-Gm-Message-State: AOAM532sQNlorNC1LyxtNZoyMdVhvRRb2pjAWXp198VP6qv8qQ0Q+ARW
 tp2PZJf70UYxgAARhClp8pdIzQ==
X-Google-Smtp-Source: ABdhPJx9tUMWG1WqLLKxj5kQMCM7A0vvR/CyiPFx0lBhMi5gZkpTZhT//+hM9bKKl357iiwJTNAotQ==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr9009688wmk.11.1642685145050; 
 Thu, 20 Jan 2022 05:25:45 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ced2:397a:bee8:75f5?
 ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id r7sm6134731wma.39.2022.01.20.05.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 05:25:44 -0800 (PST)
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: use safe format when first in
 bridge chain
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20220119122843.1455611-1-narmstrong@baylibre.com>
 <CAMty3ZBHSt2jjOxhQWpyYviTM3-uF0HXFtbGPjVddk4PP8Npsw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <93be750c-c96b-d257-584a-e5da3f260b05@baylibre.com>
Date: Thu, 20 Jan 2022 14:25:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZBHSt2jjOxhQWpyYviTM3-uF0HXFtbGPjVddk4PP8Npsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: jonas@kwiboo.se, robert.foss@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kieran.bingham@ideasonboard.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 jernej.skrabec@gmail.com, biju.das.jz@bp.renesas.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 20/01/2022 12:14, Jagan Teki wrote:
> On Wed, Jan 19, 2022 at 5:58 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> When the dw-hdmi bridge is in first place of the bridge chain, this
>> means there is no way to select an input format of the dw-hdmi HW
>> component.
>>
>> Since introduction of display-connector, negotiation was broken since
>> the dw-hdmi negotiation code only worked when the dw-hdmi bridge was
>> in last position of the bridge chain or behind another bridge also
>> supporting input & output format negotiation.
>>
>> Commit 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks")
>> was introduced to make negotiation work again by making display-connector
>> act as a pass-through concerning input & output format negotiation.
>>
>> But in the case where the dw-hdmi is single in the bridge chain, for
>> example on Renesas SoCs, with the display-connector bridge the dw-hdmi
>> is no more single, breaking output format.
>>
>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Fixes: 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks").
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>> Changes since v1:
>> - Remove bad fix in dw_hdmi_bridge_atomic_get_input_bus_fmts
>> - Fix typos in commit message
>>
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 54d8fdad395f..97cdc61b57f6 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>         if (!output_fmts)
>>                 return NULL;
>>
>> -       /* If dw-hdmi is the only bridge, avoid negociating with ourselves */
>> -       if (list_is_singular(&bridge->encoder->bridge_chain)) {
>> +       /* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
>> +       if (list_is_singular(&bridge->encoder->bridge_chain) ||
>> +           list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
> 
> What if we use bridge helper, drm_bridge_chain_get_first_bridge in
> order to find the first bridge in chain?

drm_bridge_chain_get_first_bridge() would be similar, since we already access bridge_chain
in the previous check, it's simpler like that.

Neil

> 
> Thanks,
> Jagan.
> 

