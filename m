Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF255B8E73
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 20:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8949310E9AD;
	Wed, 14 Sep 2022 17:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 806 seconds by postgrey-1.36 at gabe;
 Wed, 14 Sep 2022 17:59:30 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D68A10E9B1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 17:59:30 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.23]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MYvPq-1olo7U1w2K-00UrpC; Wed, 14 Sep 2022 19:45:52 +0200
Message-ID: <50e8f1e8-806a-3599-7cbe-0c7d4bec1c51@i2se.com>
Date: Wed, 14 Sep 2022 19:45:48 +0200
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
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220914155035.88E45C433C1@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:NxmKp1sm3LkRo0gbQqolm+Ng3QYvTq0dE10k8LSTyFXI7uBvR9L
 s5hckFHebakOcs104ZCgvCrlEuj5OaMMMU8u91qxu8uzxCWhOMMTMgNT2pfVgqMCDU04tNv
 ETMcutviYd2PCqME3OrNDd36R08HkblW30gCreMY53J03iIVLxq0ijo+VmzN0cZj8yRCO40
 T14gwc7qvXjAc6/+hOENQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IA2yXo242/g=:JIJS4io7dojWnFGM+rsmYJ
 P/UsmgUqsIfcIIdvcGXd4s6YTqU3EEz2tLOue+rry/FWuEGCBlxV6/BlSzHqpd4MgOwtPkHQd
 SH8xwhsd2aahfvlewgNwKkP+li2YmVqJJC1NgOCjOlmF9yB3HERepv55ifkFCVpYJi2jp/HvH
 z4r0pWCqg7dqD1E3WNDDJTuDiwbztxcSDYluSXNaOP+DWdYfUUkJy/J5YPEzRr/wdMRggdZnA
 PdnBVi4YdUmiKA1QTxeTGSOwuhy1YLwI2Tsr5CiHh0KNdJ8WQWdRQusPxVphrbu0zAXi+aBgS
 V9r+XIn6y/J/V5USdMepoC7IL0NQMWEjn2N2xznklRKeI12AYE/q8DEnClbClQxRWS17JD8oK
 a3aDZt+KBPpdQOUwTmgiijOWbv6rnlzT66Rb/g3DS24osD4XEuFer5Q4xKpo4+6RFselSdpbX
 7ERQVcVPD5JitLu+E3Luzbkqah7pBgPoPXrleiXV2nblQHouQvAbSxhXr1AZL+XFSQCPpp4iH
 Y9A4T1dBb0pg3kceMk7VuC9azbkvLEIFWFGLgTALxQ+dPnlcKNPrATuydOJ3sc+IEzuVATGWy
 jTuYnyUCzC2A91zZx5NGym3TPNgVNiZl43fWLVT6F6AUBMVlrYnOvPwF9V3mhhx2pn6+lqMZb
 x7v2Y1uCsbyQQlqaC4+/BdN0Jd+LxEukRKTk92WKs1XDmJ1u0o+dy2puOyAQcN94hL8XrWS7e
 hEomnBS+OodCLFYTZ1pqkNuDDrBEPDwhrsZDXCT915kCcQ+mUFhiyf0I/+pOMbbK4sZspZJPl
 cbbVZJh
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

Hi,

Am 14.09.22 um 17:50 schrieb Stephen Boyd:
> Quoting Maxime Ripard (2022-08-15 08:31:24)
>> @@ -254,6 +255,33 @@ static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
>>          return 0;
>>   }
>>   
>> +unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
>> +{
>> +       const struct raspberrypi_clk_data *data;
>> +       struct raspberrypi_clk *rpi;
>> +       struct clk_hw *hw;
>> +       u32 max_rate;
>> +       int ret;
>> +
>> +       if (!clk)
>> +               return 0;
>> +
>> +       hw =  __clk_get_hw(clk);
> Ideally we don't add more users of this API. I should document that :/
>
> It begs the question though, why do we need this API to take a 'struct
> clk'?  Can it simply hardcode the data->id value for the clk you care
> about and call rpi_firmware_property() directly (or some wrapper of it)?
>
> Furthermore, I wonder if even that part needs to be implemented.  Why
> not make a direct call to rpi_firmware_property() and get the max rate?
> All of that can live in the drm driver. Making it a generic API that
> takes a 'struct clk' means that it looks like any clk can be passed,
> when that isn't true. It would be better to restrict it to the one use
> case so that the scope of the problem doesn't grow. I understand that it
> duplicates a few lines of code, but that looks like a fair tradeoff vs.
> exposing an API that can be used for other clks in the future.
it would be nice to keep all the Rpi specific stuff out of the DRM 
driver, since there more users of it.
>
>> +       if (!hw)
>> +               return 0;
>> +
>> +       data = clk_hw_to_data(hw);
>> +       rpi = data->rpi;
>> +       ret = raspberrypi_clock_property(rpi->firmware, data,
>> +                                        RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
>> +                                        &max_rate);
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
