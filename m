Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D98F3175EBC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBF76E524;
	Mon,  2 Mar 2020 15:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70426E524
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:54:19 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id e10so269760wrr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 07:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=STQ7onEfJVpP/O8wQ/Viql6T2jtxsZUJhm2G28t0RdA=;
 b=WAdmnsDl2mt7Fd58A4q1CGZexA5ZC6C6l/Tq93voHWBnx+SDkzKpzek2bffad/uCNZ
 TWlKhbyhzZbCZkMZ+DAqAOw0EktKPWlMgtOhU/NW32yXRmd9YixfU6E4w3gHRFC6ZKBu
 npeAxqpPm8lqx00cqNzVZAVyKgG3tkFZfc5hmfRavGQXn5VD1SLI0qB/3BLw7MuzQtAl
 v7qjrM96+Pkyn6E9idckXdRkS4wD3/vIM4qHdqdydlf7fWJlEwzwbvd4Hbv08gUcDL9n
 zyzG8TqyfbbWa/sXHfmzQ2M/2GGGveMSWhR6g0hyK2WtBYu/vHhVIgHH9J/Wjeptsazh
 XmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=STQ7onEfJVpP/O8wQ/Viql6T2jtxsZUJhm2G28t0RdA=;
 b=k4S8evPTllt6QuyWl5YVYIKKi4lu+F9TCIRcFHcAwad5+l9rCZR8vK7iFMTsTvj521
 9rWYyR/Kt2siWyuSDBW/RxPKu5vMgqvUGEKX3xXFM4chTLswrEXPhJtQSiDheX/HUvyH
 q05gKpxIn/jhPfxMxYoZr5nuGvAnYFIOtoGfzqpLCIG6ZCDiAzW9cUHMBWavqbrw54dw
 L301hvnBlvYHVmzKPinDPcZexL0PussGZC+/ONqp5/TYDEHcWvIOu4iBOQ6oXyq1CfZo
 Re9JoPNkSaa52z2UoGOuZGil/0knAhnh3KlTv9IItrIsEWmPd2H9mD7LEd7EtVQmx5kB
 Erkw==
X-Gm-Message-State: ANhLgQ3/aIqE4XTamYp4IJbtJjx8m2G0MBzvcK4+DIlnIp3+YvDQXSuu
 A4Ebgv0aboVgfYLpmnYWtkxRBw==
X-Google-Smtp-Source: ADFU+vvxOsRhYTLfzIYQaASM6Jsr2eGlov5swoqObhLH6gxAuIaeZrjL9yfqc0ZUiF0YjRXpKiel5Q==
X-Received: by 2002:a5d:6881:: with SMTP id h1mr259533wru.236.1583164458464;
 Mon, 02 Mar 2020 07:54:18 -0800 (PST)
Received: from [10.1.3.173]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e11sm27800285wrm.80.2020.03.02.07.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 07:54:17 -0800 (PST)
Subject: Re: [PATCH v4 01/11] drm/bridge: dw-hdmi: set mtmdsclock for deep
 color
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-2-narmstrong@baylibre.com>
 <20200302090527.GB11960@pendragon.ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <a5b6d1f2-8f1c-ae3f-529d-baf7f4cecbe9@baylibre.com>
Date: Mon, 2 Mar 2020 16:54:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302090527.GB11960@pendragon.ideasonboard.com>
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 boris.brezillon@collabora.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 02/03/2020 10:05, Laurent Pinchart wrote:
> Hi Neil and Jonas,
> 
> Thank you for the patch.
> 
> On Thu, Feb 06, 2020 at 08:18:24PM +0100, Neil Armstrong wrote:
>> From: Jonas Karlman <jonas@kwiboo.se>
>>
>> Configure the correct mtmdsclock for deep colors to prepare support
>> for 10, 12 & 16bit output.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 67fca439bbfb..9e0927d22db6 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -1818,9 +1818,26 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>>  
>>  	dev_dbg(hdmi->dev, "final pixclk = %d\n", vmode->mpixelclock);
> 
> Nitpicking a bit, I would change
> 
> -	vmode->mtmdsclock = vmode->mpixelclock = mode->clock * 1000;
> +	vmode->mpixelclock = mode->clock * 1000;
> 
> above, and here add
> 
> 	vmode->mtmdsclock = vmode->mpixelclock;
> 
> to keep all mtmdsclock calculation in a single place.
> 
>> +	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
>> +		switch (hdmi_bus_fmt_color_depth(
>> +				hdmi->hdmi_data.enc_out_bus_format)) {
>> +		case 16:
>> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 2;
> 
> Both mpixelclock and mtmdsclock are unsigned int. Is the cast to u64
> needed ?
> 
> On a separate but related note, what does the 'm' in tmdsclock stand for
> ? It seems to originate from the 'm' prefix for mpixelclock, which has
> been there from the start. Unless there's a good reason for the prefix,
> renaming mtmdsclock to tmds_clock (and handling the other fields in the
> hdmi_vmode structure similarly) would increase clarity I think.
> 
>> +			break;
>> +		case 12:
>> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 3 / 2;
>> +			break;
>> +		case 10:
>> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 5 / 4;
>> +			break;
>> +		}
>> +	}
>> +
>>  	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
>>  		vmode->mtmdsclock /= 2;
>>  
>> +	dev_dbg(hdmi->dev, "final tmdsclk = %d\n", vmode->mtmdsclock);
> 
> s/tmdsclk/tmdsclock/ to match the field name ?
> 
>> +
>>  	/* Set up HDMI_FC_INVIDCONF */
>>  	inv_val = (hdmi->hdmi_data.hdcp_enable ||
>>  		   (dw_hdmi_support_scdc(hdmi) &&
> 

I fixed the calculus and the cast, but I'll rename the mtmdsclock in a following patch.

is it ok for you ?

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
