Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1627B3B41A9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 12:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0CA6E0F2;
	Fri, 25 Jun 2021 10:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA8E6E0F2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 10:28:00 +0000 (UTC)
Received: from mail-ej1-f72.google.com ([209.85.218.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwj42-0003Nc-Ew
 for dri-devel@lists.freedesktop.org; Fri, 25 Jun 2021 10:27:58 +0000
Received: by mail-ej1-f72.google.com with SMTP id
 l6-20020a1709062a86b029046ec0ceaf5cso2982053eje.8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 03:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ooQ/bpan+0/tVSYEdf4mZkzEEyxm1PiIoniVSmhDjiE=;
 b=OyvjwICvF04LIty2VoBb8iu02eTSZaw4kD6oW4DRD6e3A6+HjEXf4cm6HogPfCb6as
 VoY43bTqQ4NAomr+GV8FXBeFwd2+YLECC+1FVRj2wOAn8L9eDICCkIoaP5hQ0x38MSkK
 5oxEmeRXznNV+ZXv7yYe0pFXYnbJWUyPyB71bvSuVM+0rUM4kaMwweu1GImqfoYs8bnt
 cqQMWXvPb4lyZ3Rj7FdLuwvvRWQuXAH9NR5iAXicNw7/8pJWgobWzaeZvX/aT+G9h7Hb
 12rjVRgwaHE9VQBIsOvDisWFfe6BPzXPX+3mwJkNNN6hlF+NvqrmvUxm34ZlhyGf2Ihy
 BS6w==
X-Gm-Message-State: AOAM532q7BtYxX5mXE01eR8D52vcu3EK6zz31DvBEs1Zh1LdgT/qqAU9
 HYfZZym/5hzzOwzL9zp8N2NI8diebegjSQJ0u8WotyHrSxytUl/1D8u0kqwUkp6Gvfi7vGIK+9o
 /QJt6bCR3XxotmLM9lPUztTdeWu98OnWMmyTOTOCe37HjWg==
X-Received: by 2002:aa7:dad2:: with SMTP id x18mr2475691eds.319.1624616878247; 
 Fri, 25 Jun 2021 03:27:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3cVNg6WpHcCXQbDGMr5Bh35AfaEmUsyMepbsDA9xjQrFf3dK49GpbzPfo/R2byKacwC1C9g==
X-Received: by 2002:aa7:dad2:: with SMTP id x18mr2475662eds.319.1624616878073; 
 Fri, 25 Jun 2021 03:27:58 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id p18sm2712783edu.8.2021.06.25.03.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 03:27:57 -0700 (PDT)
Subject: Re: [RFC PATCH 2/9] drm: bridge: Add Samsung SEC MIPI DSIM bridge
 driver
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
 <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
 <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
 <CAMty3ZAtObU-bf6FuxvSBaZn2cotj_NxASW9g9on-kBJ7iW3OA@mail.gmail.com>
 <YNR37NWkxq0mZyq5@pendragon.ideasonboard.com>
 <fdd446c6-c8ce-9dae-f7ac-e06241f76250@canonical.com>
 <CAMty3ZCEQeRi53yuLYyWVU8o=Lo2ZKy+kgjU+9PC33QJEq2LQg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ff421d53-7308-7959-ea4a-9cf94efe63b2@canonical.com>
Date: Fri, 25 Jun 2021 12:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMty3ZCEQeRi53yuLYyWVU8o=Lo2ZKy+kgjU+9PC33QJEq2LQg@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Fancy Fang <chen.fang@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/06/2021 12:08, Jagan Teki wrote:
> Hi Krzysztof,
> 
> On Fri, Jun 25, 2021 at 2:51 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On Thu, 24 Jun 2021 at 14:19, Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com> wrote:
>>>
>>> Hi Jagan,
>>>
>>> On Thu, Jun 24, 2021 at 05:42:43PM +0530, Jagan Teki wrote:
>>>> On Thu, Jun 24, 2021 at 8:18 AM Fabio Estevam wrote:
>>>>> On Wed, Jun 23, 2021 at 7:23 PM Laurent Pinchart wrote:
>>>>>
>>>>>> Looking at the register set, it seems to match the Exynos 5433,
>>>>>> supported by drivers/gpu/drm/exynos/exynos_drm_dsi.c. Can we leverage
>>>>>> that driver instead of adding a new one for the same IP core ?
>>>>>
>>>>> Yes. there was an attempt from Michael in this direction:
>>>>> https://patchwork.kernel.org/project/dri-devel/cover/20200911135413.3654800-1-m.tretter@pengutronix.de/
>>>>
>>>> Thanks for the reference, I will check it out and see I can send any
>>>> updated versions wrt my i.MX8MM platform.
>>>
>>> Thanks.
>>>
>>> I had a brief look at the exynos driver, and I think it should be turned
>>> into a DRM bridge as part of this rework to be used with the i.MX8MM.
>>>
>>> Is there someone from Samsung who could assist, at least to test the
>>> changes ?
>>
>> Yes, I mentioned few guys in reply to PHY. Around the DRM drivers you
>> can get in touch with:
>> Inki Dae <inki.dae@samsung.com>
>> Seung-Woo Kim <sw0312.kim@samsung.com>
>> Marek Szyprowski <m.szyprowski@samsung.com>
>> Andrzej Hajda <a.hajda@samsung.com>
> 
> Thanks for the information.
> 
>>
>> The easiest testing of the display stack would be on Hardkernel's Odroid
>> XU4 (https://www.hardkernel.com/shop/odroid-xu4-special-price/) however
>> you will not test the DSI/DSIM directly (it has only HDMI port).
> 
> Look like I found one board with Exynos5430 with DSI. Does this SoC is
> same as mainline Exynos5433?

No, Exynos5430 is ARMv7. Looks like improvement over Exynos5422.
Exynos5422 has a very good support in mainline while Exynso5430 was
never touched at all.

Exynos5433 is ARMv8, although many things are shared with 5422. About
DSI I have no clue.


Best regards,
Krzysztof
