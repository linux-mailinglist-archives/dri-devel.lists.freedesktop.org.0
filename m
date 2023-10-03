Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06A7B68C9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 14:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F8810E08F;
	Tue,  3 Oct 2023 12:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6098810E08F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 12:16:08 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53636f98538so1387204a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1696335366; x=1696940166; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HgQLMDGVZkVLZyj0dhlagnpnLCjs6qYaB5ALz7FOawU=;
 b=Xhwlc7tY3sV9LzoZ++2p4ohhexIzW+K5b5n/qdNbt51Hue4mNKUupYDoIo53Cvqxzi
 93il9OJAxKTvRYhqPYQ/CeyMjupw8Xr2cpL/pE9ENKrm+N37AlfnD5Q43TOS5dmDxYO+
 h1/KSM+HVhaEPqiteEC58A1THdIZBQnzh4SbCyFq2JndHaU4g9eubxLFTYyk27YY+69B
 tljSwravV4IrL1rzmSEY+TTMUvvDhK/vnxkIHGJn4AfAd8t6cFGm4jfLG4al6HxxUY/R
 Zg+ogNifsm+cXfk4pPM6+OrW9Puw0JYtPZOouQfgfEqpelIylKk/j7SRt0Q38x9FovXz
 h/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696335366; x=1696940166;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HgQLMDGVZkVLZyj0dhlagnpnLCjs6qYaB5ALz7FOawU=;
 b=lcLN5iq8DO3PH3MxGiapqITTs+YYnsiab5MFpYOeYBCFHjdoCaSM23TvnU4OHoNKNG
 uwA9iNGxRDRdRjlM7qRHUQR5WySLTOAFqTduBfK+hr/t8KzbSR742MpYNU9Bit+zVlAP
 +0wZTVoPzpgdClYvaw1+KflIsqod5B3p+eoHfVVNM6NXE7r7+qFPRrBP5jQQkhwpWWyb
 4wAa6xsJxJsXYFJFrzMrJliV4W3GeMKJIUmehvrI1R3BMBB47EOiX8MWySc9YU9DoVir
 8PK15wai+R4cawuqOH67j3HIvvsSwej3dzJ30mh6Lpt7qykblgkWmMAjgt6zK/rqiYAH
 1yfA==
X-Gm-Message-State: AOJu0YxYL5m1BAQegvX2Jxg9yn8jy3aluWk2DsDHToHDjjo/px7gGK+d
 7CAVGTh8MnN8sAuHYvT9Axe7dw==
X-Google-Smtp-Source: AGHT+IHY/KXXJnIN+qr0to0K8GhwBTYpHdTHSo6ZMZ2vOl5MFUOijQbV0HK09Y+i/G934VucUALVgA==
X-Received: by 2002:a17:906:197:b0:99e:f3b:2f78 with SMTP id
 23-20020a170906019700b0099e0f3b2f78mr12320288ejb.67.1696335366246; 
 Tue, 03 Oct 2023 05:16:06 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.190])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a17090614c900b009a1a5a7ebacsm951533ejc.201.2023.10.03.05.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Oct 2023 05:16:05 -0700 (PDT)
Message-ID: <31bce134-7e9a-0293-5d5a-fba657daed07@tuxon.dev>
Date: Tue, 3 Oct 2023 15:16:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 1/7] drm: atmel-hlcdc: add flag and driver ops to
 differentiate XLCDC and HLCDC IP
Content-Language: en-US
To: Manikandan.M@microchip.com, sam@ravnborg.org, bbrezillon@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230927094732.490228-1-manikandan.m@microchip.com>
 <20230927094732.490228-2-manikandan.m@microchip.com>
 <35d861b5-eca0-c817-684c-e39a841f17db@tuxon.dev>
 <8b721bd5-187c-6aad-39ee-e9a5ded6cee5@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <8b721bd5-187c-6aad-39ee-e9a5ded6cee5@microchip.com>
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03.10.2023 07:18, Manikandan.M@microchip.com wrote:
> On 28/09/23 11:31 am, claudiu beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi, Manikandan,
>>
>> On 27.09.2023 12:47, Manikandan Muralidharan wrote:
>>> +void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
>>> +                                 struct atmel_hlcdc_plane_state *state);
>>> +void atmel_xlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
>>> +                                 struct atmel_hlcdc_plane_state *state);
>>> +void update_hlcdc_buffers(struct atmel_hlcdc_plane *plane,
>>> +                       struct atmel_hlcdc_plane_state *state,
>>> +                       u32 sr, int i);
>>> +void update_xlcdc_buffers(struct atmel_hlcdc_plane *plane,
>>> +                       struct atmel_hlcdc_plane_state *state,
>>> +                       u32 sr, int i);
>>> +void hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane);
>>> +void xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane);
>>> +void
>>> +atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
>>> +                                       struct atmel_hlcdc_plane_state *state);
>>> +void
>>> +atmel_xlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
>>> +                                       struct atmel_hlcdc_plane_state *state);
>>> +void hlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
>>> +                      struct atmel_hlcdc_dc *dc);
>>> +void xlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
>>> +                      struct atmel_hlcdc_dc *dc);
>>> +void hlcdc_csc_init(struct atmel_hlcdc_plane *plane,
>>> +                 const struct atmel_hlcdc_layer_desc *desc);
>>> +void xlcdc_csc_init(struct atmel_hlcdc_plane *plane,
>>> +                 const struct atmel_hlcdc_layer_desc *desc);
>>> +void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
>>> +                const struct atmel_hlcdc_layer_desc *desc);
>>> +void xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
>>> +                const struct atmel_hlcdc_layer_desc *desc);
>>> +
>>
>> These are still here... Isn't the solution I proposed to you in the
>> previous version good enough?
> Hi Claudiu
> 
> These changes were integrated in the current patch set based on the 
> solution which you proposed in the previous series.
> The XLCDC and HLCDC functions calls are moved to IP specific driver->ops
> and their function declarations are made here in atmel_hlcdc_dc.h
> Rest of the changes are integrated in Patch 4/7.

I still think (and I've checked it last time) you can remove these
declaration. See comment from previous version:

"You can get rid of these and keep the function definitions static to
atmel_hlcdc_plane.c if you define struct atmel_lcdc_dc_ops objects directly
to atmel_hlcdc_plane.c. In atmel_hlcdc_dc.c you can have something like:

extern const struct atmel_lcdc_dc_ops  atmel_hlcdc_ops;
extern const struct atmel_lcdc_dc_ops  atmel_xlcdc_ops;
"

>>
>> Thank you,
>> Claudiu Beznea
> 
