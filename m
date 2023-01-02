Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E000265B3A1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 15:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04CD10E194;
	Mon,  2 Jan 2023 14:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBF010E194
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 14:58:05 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id r205so25108033oib.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 06:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s9p0FL090tcn9uNjUKtunfgcZRh/fsCJDY+TAZOItmw=;
 b=fXVkVmfkyFQlMITqEeKVgwhR8nwLCwIpHs/CJrRIrPjp9LFRUXVXj59Dv1U/315+WK
 ZUnqyyhsfZfTOmmRYAsuAEe/q0YbMFYM8ZMQuETG7OuTKOXgELxYx8T9FvPSSZk/cBDP
 pTZkqu9XdzPJpxcrOMbxyz8gIRZLImPs6J5vDSWPkxvJOCh7WiM0eM1RoeySE5TwRMRE
 wuaqGF7I8GbF/86nM3i3HHfq9w49ULkA2f6rM4SHIDqNpU9sapli+TEyfVAWP0fvBX33
 KH6JISK+UVtdLwZssDFAI2J1RjsvN+0lZC6PvvudezRDf7iYPKqeg/DLQ+4hCXUuwV3M
 pTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9p0FL090tcn9uNjUKtunfgcZRh/fsCJDY+TAZOItmw=;
 b=rIfg8RqHfaNqWC9G5AOcBMYLXjK11O/JhBLmKN/b/Md/rKXQ7xMFZxL3VbCyKowhjw
 G/ERoCEy4C5i381vOLiq660S4SlBTYh9+EN7Ta/K+BjZp+GeslySPQcxQ9lxLJzeFH/K
 PTkadhFg1+XmBEqJ7wKcihQliDuHy5j9sDJ9Xlale3Un3voo84Rxsa23QF1CGJGtEbrp
 PmbSL1nnxNrSDH7DUScyt6L7eEnNQ4i3Jlxevc1HEirCklZ+FQss0c5jtcA1aj4Z5pDW
 4pwjkM/g8aWAAB7RW+mP/u1VUrC87tTcKlDDsp+YJW1YDtN16MLf/5gwHlW45n01i2mt
 AqKQ==
X-Gm-Message-State: AFqh2ko96OM2QSjszVwNtXedbRhZoybe3oeIY0DP32e0MGmkTswbyUSx
 ZbvQe4qwMdk+7p15ddsAnS9Byg==
X-Google-Smtp-Source: AMrXdXtqm14v47morVxx5TFp3Tkpo5i142SpySDVJeOKXdlF3CpehSpmGH/GMiFeMiafiiW5ql4Ytg==
X-Received: by 2002:aca:a896:0:b0:35e:a6cf:6023 with SMTP id
 r144-20020acaa896000000b0035ea6cf6023mr17797072oie.46.1672671484556; 
 Mon, 02 Jan 2023 06:58:04 -0800 (PST)
Received: from [192.168.11.24]
 (23-118-233-243.lightspeed.snantx.sbcglobal.net. [23.118.233.243])
 by smtp.gmail.com with ESMTPSA id
 db6-20020a0568306b0600b00683e4084740sm9807805otb.10.2023.01.02.06.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 06:58:04 -0800 (PST)
Message-ID: <145f7d4c-9ff6-2673-6504-564b6f13cf00@kali.org>
Date: Mon, 2 Jan 2023 08:58:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] drm/panel-edp: fix name for IVO product id 854b
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
References: <20221231142721.338643-1-abel.vesa@linaro.org>
 <CAKXuJqjiEpxnX_E=HGqEaX91YA7XUmUoaK0NQqXHJCUkcqUPoQ@mail.gmail.com>
 <Y7KUFMjnra22YGlv@hovoldconsulting.com>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <Y7KUFMjnra22YGlv@hovoldconsulting.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Abel Vesa <abel.vesa@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/2/23 2:21 AM, Johan Hovold wrote:
> On Sun, Jan 01, 2023 at 10:58:42PM -0600, Steev Klimaszewski wrote:
>> On Sat, Dec 31, 2022 at 8:27 AM Abel Vesa <abel.vesa@linaro.org> wrote:
>>> The actual name is R133NW4K-R0.
>>>
>>> Fixes: 0f9fa5f58c784 ("drm/panel-edp: add IVO M133NW4J-R3 panel entry")
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>>
>>> Assuming the information from here is correct:
>>> https://raw.githubusercontent.com/linuxhw/EDID/master/DigitalDisplay.md
>>>
>>>   drivers/gpu/drm/panel/panel-edp.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>>> index 5cb8dc2ebe18..ef70928c3ccb 100644
>>> --- a/drivers/gpu/drm/panel/panel-edp.c
>>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>>> @@ -1891,7 +1891,7 @@ static const struct edp_panel_entry edp_panels[] = {
>>>          EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
>>>
>>>          EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
>>> -       EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "M133NW4J-R3"),
>>> +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R133NW4K-R0"),
>>>
>>>          EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
>>>          EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
>>> --
>>> 2.34.1
>>>
>> Thanks for this - when I was looking for the panel, I simply went with
>> what I found on panel-look.
> Did you check what string your panel reports? For example, using
> something like:
>
> 	# strings /sys/class/drm/card0-eDP-1/edid
> 	...
> 	B133UAN02.1
>
> Johan

Hi Johan,

At the time, I did not, and I do not know why I didn't.

I am showing

"R133NW4K R0"

-- steev


