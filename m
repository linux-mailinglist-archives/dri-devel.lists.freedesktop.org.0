Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE824CA83E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 15:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5605E10E964;
	Wed,  2 Mar 2022 14:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D27610E83F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 14:34:19 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j17so3171389wrc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 06:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RpLbPqaOOKETz+Xrd5wv8CNare5p6sykecOEd/Db3Pk=;
 b=T71LoecgjUvkFsIyd7OqeUeY9PO0Glj0dDkwdchFSn7yCYOKfiHN30DnB4/fSg5rYy
 dewnNT6w4xesaQ01l3WU66Vuw5qI4gyJryL4LrY9WBltLGe/pTApOrWcsvJGTmIr4yIZ
 mW4R8XhK9+cdIoZeBHKRRq8FzS/zPsIHN5iMH24xoIQpOLtStyb9sPyaf41YJOH3TVGl
 hBXkWC31a22QJHJZ2xwlrekMnWppoxvdYV7vPNrzhhykeuYuBccJK/MHx2U+4UXVH61q
 2NeP3tp7j16d2mTEn4xV2bLKog+lM1w0aMipM4TKdBrP4ZlL53ENwQ5D41EF1VXl+kSk
 4qLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RpLbPqaOOKETz+Xrd5wv8CNare5p6sykecOEd/Db3Pk=;
 b=7e6EKIqvjoUqKK9ffTnxkZQMejeQ0MfiL39T9J/QdSQneH1crkjB7zF/yhf0bAeSUS
 dU0xL91/4tXxLVuYYG0rDKuM9QeSp8+u9dG8iA968tK4B8pfW6Hmw20hPnR9wjk+sQIh
 s3NvyiWe9fRXfuM7RnSmKiwruvd67+7OpXFZsLINaLUQdGo6RcDL/ApJxgIOzK+3VUPG
 HtG00Nw0tCaWmZCp2WZKD12CPXuO8VAtMzrHlHtUL3u69JzfTNlcD+cBKwhIbcFtlheP
 L89AIFYCoRHnmfJkbIU2GM2lQ9sLlEEVtFRyL9akEhU0Yfxcb2R8RB/Oa9zMmrsaXf68
 UyTA==
X-Gm-Message-State: AOAM5320MxXRCHZP7urtDAAHCGqGEowUv92+GzLuYkLrOHxHh497w1OW
 eix7o/cMz3s6cQU1JPCmE8ic0w==
X-Google-Smtp-Source: ABdhPJwI8/fLGCGEdgY5eVFVeu+QJVx8yBXWRy/npVfH4yqlchy0Fh7KzuZKdpwGOaMryuRRfShN6Q==
X-Received: by 2002:a5d:52ca:0:b0:1e5:8cbc:7f2e with SMTP id
 r10-20020a5d52ca000000b001e58cbc7f2emr23524927wrv.309.1646231657613; 
 Wed, 02 Mar 2022 06:34:17 -0800 (PST)
Received: from [10.1.3.188]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b0038181486018sm7181052wmq.40.2022.03.02.06.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 06:34:17 -0800 (PST)
Message-ID: <4cb08b5d-c1ec-f2b4-a107-63a771146ec0@baylibre.com>
Date: Wed, 2 Mar 2022 15:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation
 for 8 bit modes
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
 <5da069b6-8a99-79c2-109c-c85715165857@baylibre.com>
 <E0D3B7E8-0C8D-4119-8267-0556AB921B24@goldelico.com>
 <fca28594-8d4e-dd2f-93a0-a052cb888d90@baylibre.com>
 <75CBD357-577A-402D-9E3B-DBE82A84BC43@goldelico.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <75CBD357-577A-402D-9E3B-DBE82A84BC43@goldelico.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 02/03/2022 12:15, H. Nikolaus Schaller wrote:
> Hi Neil,
> 
>> Am 02.03.2022 um 11:25 schrieb Neil Armstrong <narmstrong@baylibre.com>:
>>
>>> I added a printk for hdmi->sink_is_hdmi. This returns 1. Which IMHO is to be expected
>>> since I am using a HDMI connector and panel... So your patch will still add the UYVY formats.
>>> Either the synposys module inside the jz4780 or the panel does not understand them.
>>
>> By selecting the UYVY formats, the driver will enable the colorspace converters in the dw-hdmi IP,
>> I don't see why it doesn't work here...
>>
>> There is a bit called `Support Color Space Converter` in config0_id:
>> bit	|	Name	|	R/W	|	Desc
>> 2 	|	csc	| 	R 	|	Indicates if Color Space Conversion block is present
>>
>> Could you dump all the config0 bits:
>>
>> =======================><=============================
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 54d8fdad395f..547731482da8 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -3431,6 +3431,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>>         pdevinfo.id = PLATFORM_DEVID_AUTO;
>>
>>         config0 = hdmi_readb(hdmi, HDMI_CONFIG0_ID);
>> +       dev_info(dev, "config0: %x\n", config0);
>>         config3 = hdmi_readb(hdmi, HDMI_CONFIG3_ID);
>>
>>         if (iores && config3 & HDMI_CONFIG3_AHBAUDDMA) {
>> =======================><=============================
>>
>> If this bit is missing, this would explain the black screen.
> 
> [    9.291011] dw-hdmi-ingenic 10180000.hdmi: config0: bf
> 
> Hm. Or is the color-space conversion of the sw-hdmi module inside the jz4780 broken
> or not configured properly?
> 
> (cross-checked: RGB mode still works if I force hdmi->sink_is_hdmi = false)

I don't understand what's wrong, can you try to make the logic select MEDIA_BUS_FMT_YUV8_1X24 instead of DRM_COLOR_FORMAT_YCBCR422 ?

If your CSC is broken, we'll need to disable it on your platform.

Thanks,
Neil

> 
> BR and thanks,
> Nikolaus
> 

