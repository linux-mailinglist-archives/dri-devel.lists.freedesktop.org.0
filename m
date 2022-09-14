Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E0E5B8EDC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 20:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFDD10E9D6;
	Wed, 14 Sep 2022 18:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771C710E9D7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 18:27:03 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.23]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MRBWU-1ovg7f3USi-00NEK9; Wed, 14 Sep 2022 20:26:55 +0200
Message-ID: <ecfe17be-5d81-3456-9a86-77acc848f95f@i2se.com>
Date: Wed, 14 Sep 2022 20:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 2/7] clk: bcm: rpi: Add a function to retrieve the
 maximum
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
 <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
 <20220914155035.88E45C433C1@smtp.kernel.org>
 <50e8f1e8-806a-3599-7cbe-0c7d4bec1c51@i2se.com>
 <20220914180508.0EDD9C433D6@smtp.kernel.org>
 <c221873f-f230-0cce-e120-7e3cc732cf00@i2se.com>
 <20220914181458.C6FCCC433C1@smtp.kernel.org>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220914181458.C6FCCC433C1@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Jdbn9l5qqOJBkSd1SY2bvvuP2Ym2CUnbxrLNTbE0hMBbezREtUX
 PONUJGkCg6O2kO1NrusmJNEgGKQnKBvjmf9dmooJloHaYQRvGe3sroXSsy8g2WAGT3Jk0t5
 JL70HuVKcivVe5Kyyw6V3hH/9qr6repOuUTitCbbdDhyfKhit25nNIds9qT9+EnJpZXpeJw
 GI54zvLErdpZbGKcI8/2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hskLTalVQtQ=:nbx/JndvyB55KImHVHVm1y
 3jIW3SqWIZDBMxHR7yGSoWA3Vrj2HkYEviCppmAh6Vopf25/5hH+oSgjRtTvOdI/eKuPkPknq
 B8XMDTpeSFMDxD6MCHU/xW1i6cTAs+CDUSSobtN5GxF9T+wlWZnXUyr5iolk7emO6GC2tKIGc
 KMpaUKr89GNV/5zkX13m12YcMIZJO6vFuwscl3daU79Zf+VBSG6iy84qR5Zm4h0tUUQINGlRp
 TZihTWfi4fulrvq3igEzOb375083nhYEJK8y73oGuHUcK/Yghej7k5EbVt/PWd8rgu/5rxqjA
 4wLeeWKX38IFWHtjokF3o2Kz5Ems6Ecb5xR+ZqNelwx5f4IBJJnQBSs7CrQVYgr4VV1e913Wp
 qs1UIcIo92I8yK1eFs67kEiLz9BHsMG20CXKhcCKl/GQOZGPY6Uj3gEDKm3E2CMrxD18A7mVB
 pBqnZUQABm2EiVO0A6AYJ90DqL/gcDrD/anV/Hq91EqK4GbEe/7b8DNABw/P5qWzD6wydYJ3U
 +vIGSA7jsBM77cBUwNgJKc7y4ZAVtEgbjiLcvTmZsgMk6sQD4klttZ4zpChpYrVrJPezztGPl
 mxJDmphEWhidMankvZsusM13kQUCELYwbsRSQt89LdAZZo3L40DoFZjlKDqiS854F4R9M+9Yn
 1PMHpeQWSPjys14PaQh2UyXSRpKoyfs/P0jbbYG4JAGoXo8b/+uLXima31WlqbO225jxS3Xkt
 aGRv7B8QqCQjFwsUdORJodiDmNbs9o7W3fSLq/wqG87rxl5F32j4GzYrlHV9XhynAucf40vgY
 soQtGWTNo13VCePbw2xFLYl1WYOkw==
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
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.09.22 um 20:14 schrieb Stephen Boyd:
> Quoting Stefan Wahren (2022-09-14 11:09:04)
>> Am 14.09.22 um 20:05 schrieb Stephen Boyd:
>>> Quoting Stefan Wahren (2022-09-14 10:45:48)
>>>> Am 14.09.22 um 17:50 schrieb Stephen Boyd:
>>>>> Furthermore, I wonder if even that part needs to be implemented.  Why
>>>>> not make a direct call to rpi_firmware_property() and get the max rate?
>>>>> All of that can live in the drm driver. Making it a generic API that
>>>>> takes a 'struct clk' means that it looks like any clk can be passed,
>>>>> when that isn't true. It would be better to restrict it to the one use
>>>>> case so that the scope of the problem doesn't grow. I understand that it
>>>>> duplicates a few lines of code, but that looks like a fair tradeoff vs.
>>>>> exposing an API that can be used for other clks in the future.
>>>> it would be nice to keep all the Rpi specific stuff out of the DRM
>>>> driver, since there more users of it.
>>> Instead of 'all' did you mean 'any'?
>> yes
> Why?
This firmware is written specific for the Raspberry Pi and not stable 
from interface point of view. So i'm afraid that the DRM driver is only 
usable for the Raspberry Pi at the end with all these board specific 
dependencies. Emma invested a lot of time to make this open source and 
now it looks that like that more and more functionality moves back to 
firmware.
