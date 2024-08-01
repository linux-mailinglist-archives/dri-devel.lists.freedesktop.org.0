Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9E1944771
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 11:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42FC10E37A;
	Thu,  1 Aug 2024 09:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NqWQgPuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B99F10E37A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 09:07:08 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso798834166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 02:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722503226; x=1723108026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0ZBoY3AoVccb/INlrM3z9gGvON8IToRFWiibOBUz5W8=;
 b=NqWQgPuPjuBZ7d8JrS+c/bifUNP0GXvADWhqh88dQabRoynJ7IhZN2WDWF9f8JksDd
 6BJvY1Hmws87aNCEvilnADjX/c1pJZEYaKPFh/Sm//zUirjCIFdpcQsYw7snRPNzPV/7
 Nq8l1TKA/a8mPFz0W7iDOJja+hYTpOnkQpKJ1JmIIXZ8TtSvrElfwIvQw1ScwM6kK6/U
 IUf4lNAZmLwOfq+gwpOpP1rwMbWxtv4xwfucrb4FDhO07a1efzejTIr/fScVErWEqyZl
 WhjjON0jEmINhrRYjfuQr95KiH1nQDBmJWzgfLbLYhwthu0/BaK2hmVIA4iVFW4vZcYH
 R1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722503226; x=1723108026;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ZBoY3AoVccb/INlrM3z9gGvON8IToRFWiibOBUz5W8=;
 b=X6oz8hCn8mDiP8tR5kmrYWtGRYxGd9gwhrnVi6e1Z876E90oiQWd9YDXWTATky4eT5
 mRxErC5OHCVcXpWiPKaUW9AXmpwSrWaEn0DgdlTXF4bwM69fsVbzUHXEq6hSY83XIwMv
 QXknHq24XbZOG6rVjZYKyxdpYVyi4bqyCWH/PJ5/MTWfrNbNdMZis3rpP/QMCnrYjVOh
 VuwwWLfACwE42FfIaiUTlAZkeudd4sYf62ueqUU40D0+2jjek3aaST4ymCvntIHRvw0X
 ccf782ySIodroJjM4BC7itaoCjvHK01SQfozIMkEQoZRgiLBGrFiaK4cxB3t79UX17xD
 HD+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL5UjvgX4SUhGIr8Q3UWJiX4yMVZMEc2im21Gwkj2iZh0nEvZv458folPw+trUJvVuxKrVQytZVfhQMTB9xlIh5cAFKTMqv2nObbLuxh9Z
X-Gm-Message-State: AOJu0YzSThVH21zlg3EyFW/fL9bMddBOJLw4YumpyCnRdxB7l8TpmYJM
 cQk5Q/uj1mJhuatXEY/C4OjG25pb6SMTNtqsxhdZpLqGF85sotVD
X-Google-Smtp-Source: AGHT+IFkXQXLFJ5X+Na5/W+NzBmIf8q3vSnukCimnlNwYhkXd1AhMX9KBCaqr0DDQZcpDbO7MU+hlA==
X-Received: by 2002:a17:907:2d91:b0:a7d:340e:43a4 with SMTP id
 a640c23a62f3a-a7daf55e504mr102922866b.31.1722503225659; 
 Thu, 01 Aug 2024 02:07:05 -0700 (PDT)
Received: from ?IPV6:2a04:cec0:1113:4afb:5fa3:8d9c:6e3d:1966?
 ([2a04:cec0:1113:4afb:5fa3:8d9c:6e3d:1966])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4de06sm868138666b.71.2024.08.01.02.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 02:07:05 -0700 (PDT)
Message-ID: <94ecd3a6-3a62-4be6-b384-c8237c818e98@gmail.com>
Date: Thu, 1 Aug 2024 11:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
To: Yanjun Yang <yangyj.ee@gmail.com>,
 Philippe CORNU <philippe.cornu@foss.st.com>, yannick.fertre@foss.st.com
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
 <CAE8JAfy9NtBa--DnUt2AEZPFnvjU6idj8DqUbaeLaH0DMFvuhw@mail.gmail.com>
 <e059f157-ff9c-32cb-57a6-48f2331f2555@foss.st.com>
 <ZqeZEB9peRSQkOLZ@void.tail05c47.ts.net>
Content-Language: en-US, fr
In-Reply-To: <ZqeZEB9peRSQkOLZ@void.tail05c47.ts.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le 29/07/2024 à 15:28, Yanjun Yang a écrit :
> On Fri, Jul 26, 2024 at 09:55:35AM +0200, Philippe CORNU wrote:
>>
>>
>> On 7/22/24 10:38, Yanjun Yang wrote:
>>>
>>> This patch (commit id:185f99b614427360) seems to break the dsi of
>>> stm32f469 chip.
>>> I'm not familiar with the drm and the clock framework, maybe it's
>>> because there is no
>>>    "ck_dsi_phy" defined for stm32f469.
>>> PS:  Sorry for receiving multiple copies of this email, I forgot to
>>> use plain text mode last time.
>>>
>>
>> Hi,
>> Thank you for letting us know that there was this error. We should have
>> detected this before merging, really sorry for the problems caused by this
>> patch. We will investigate the issue and get back to you as soon as
>> possible. In the meantime, I think you can revert this patch in your git
>> tree.
>>
>> Philippe :-)
>>
> 
> Hi,
Hi,

FYI
DSI clock tree for stm32f469 can be found here:
https://www.st.com/resource/en/reference_manual/rm0386-stm32f469xx-and-stm32f479xx-advanced-armbased-32bit-mcus-stmicroelectronics.pdf

Refer to Figure 17: DSI clock tree.

After some research I think "ck_dsi_phy" was introduced in stm32h7 
platforms. There is a mux which interfaces between various clocks (among 
ck_hse) and the byte lane clock. stm32f469 has a much simpler clock tree 
in which we did not bother to implement this "go-between" clock, even 
though they is an equivalent of the mux.

> After some testing, the reason behind my problem is the parent's name of
> 'clk_dsi_phy' for stm32f4 is 'clk-hse' other than 'ck_hse'.  I don't
> know which is the better why to fix it:
> 1. Change "ck_hse" to "clk-hse" in where "clk_dsi_phy" is defined.
Doing so will definitely break other platforms.

> 2. Use "pll_in_khz = clk_get_rate(dsi->pllref_clk) / 1000" instead of
>     "pll_in_khz = (unsigned int)(parent_rate / 1000)" when get the clock
>     rate.
dsi->pllref_clk refers to the HSE clock if you take a look in the 
device-tree. This is the reason why this work on your setup. I doubt 
nevertheless that it wouldn't work on other platforms. But this would be 
a semantic nonsense, since the DSI byte lane clock is not always derived 
from HSE clock on other platforms.

Looking again at the clk-stm32f4 driver and the DSI clock tree linked, 
we can maybe implement the desired clock even if it is not represented 
on the diagram.

Eventually if this solution does not work we will go to the second 
solution you suggested and we will test it on all platforms.

@Philippe, @Yannick
Do you agree with this workflow ?

Regards,
Raphaël


> 
> Both method can fix my problem. The first one might break other
> platforms. Maybe I should change the clock name of 'clk-hse'. However,
> I can't find the defination of this clock name for stm32f4.
