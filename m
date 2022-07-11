Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E745700BA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271A18D99D;
	Mon, 11 Jul 2022 11:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1E8F8D982
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:34:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A92252B;
 Mon, 11 Jul 2022 04:34:50 -0700 (PDT)
Received: from [10.57.85.194] (unknown [10.57.85.194])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21B843F792;
 Mon, 11 Jul 2022 04:34:47 -0700 (PDT)
Message-ID: <9645c413-af05-c47f-dfb5-5b0e7f511d9c@arm.com>
Date: Mon, 11 Jul 2022 12:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v11 20/24] arm64: dts: rockchip: enable vop2 and hdmi tx
 on rock-3a
Content-Language: en-GB
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <A86359EC-5291-41BD-966E-EB7890644731@gmail.com>
 <CAMdYzYoFG3wCQaWXQNJd7mE20OMCj=ZeuewwZfaCJyoCBT-kQQ@mail.gmail.com>
 <0E6FE020-C95E-47CF-A9D6-AC3F2B2D334F@gmail.com>
 <CAMdYzYobfJ7WGN+UQ7t5e1Zy9knjfHLse8KzrGrHPfeMkkG0gw@mail.gmail.com>
 <9F2D8CFF-1EAE-4586-9EE9-82A9D67840BB@gmail.com>
 <CAMdYzYrz7DRj7F9hGaAPaTSiZkQ4eMNujAp8uPuE9geL6kAz4g@mail.gmail.com>
 <9567EECF-A154-4FE1-A03C-5ED080409030@gmail.com>
 <190C3FD3-0185-4A99-B10E-A5790047D993@gmail.com>
 <CAMdYzYqGGfWDr11iyyfzigxsL7_N2szuag9P6TUZGuzGF4oB+A@mail.gmail.com>
 <AF6176F5-995E-473B-B494-844ECC26BC03@gmail.com>
 <CAMdYzYocZw1SNtgbfqn1VuvKTCiuMNTYRn2MydiGnL-UxtnYuA@mail.gmail.com>
 <0D8B18A1-82FD-4902-A443-AD774DE43DAD@gmail.com>
 <CAMdYzYpdo6Hb30y1oEya5GT1eXHJVTETq--HcmMjF40gvCUZ9A@mail.gmail.com>
 <E9DC63DF-46A6-438E-A7F1-5F7A65F56DFC@gmail.com>
 <15846ffa-f68a-2f88-55a3-40a633132c28@arm.com>
 <27F4BA6C-9C56-446D-AB82-A691E7C54772@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <27F4BA6C-9C56-446D-AB82-A691E7C54772@gmail.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, kernel test robot <lkp@intel.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-11 12:04, Piotr Oniszczuk wrote:
> 
> 
>> Wiadomość napisana przez Robin Murphy <robin.murphy@arm.com> w dniu 11.07.2022, o godz. 12:41:
>>
>> On 2022-06-25 16:31, Piotr Oniszczuk wrote:
>>>> Wiadomość napisana przez Peter Geis <pgwipeout@gmail.com> w dniu 25.06.2022, o godz. 16:00:
>>>>
>>>>
>>>> The first issue you have is the TV isn't responding until the absolute
>>>> end.
>>> I suspect this is because lack on idle gaps between cec commands sent from board to tv.
>>> Maybe TV sw. can't deal with consecutive commands without any idle between them?
>>> It is interesting that disconnecting TV - so CEC line is driven only by board - rock3a still don't have any idle gaps while rock3b (and radxa 4.19 bsp) has them (very similar between 5.18mailine and 4.19 bsp).
>>> How this is possible that change I/O from m0->m1 impacts _timings_ on free hanging CEC line?
>>
>> Check all the pinctrl settings beyond just the function mux - pulls, drive strength, output type, etc. - the defaults tend to be all over the place, and rarely what you want.
>>
>> Robin.
> 
> Robin,
> 
> I'm not sure do I looked in right place...
> 
> but:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi?h=v5.18.10#n788
> 
> vs.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi?h=v5.18.10#n795
> 
> are looking ok?

I meant more in terms of dumping out the actual hardware state to 
compare across both axes of cec_m0 vs. cec_m1 and mainline vs. BSP. 
However from a quick skim of the Rock3 schematic there doesn't appear to 
be an external pull-up, so the internal pull-up also being disabled is a 
clear suspect to start with.

Robin.
