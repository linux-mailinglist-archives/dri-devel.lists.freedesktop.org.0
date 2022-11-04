Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056F619F14
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 18:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B2710E971;
	Fri,  4 Nov 2022 17:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EEB10E971
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667583843; bh=hsor/wOC9QP+wvCDpPP8vR/aKg0wBQ2dFS2kRMlXc7Q=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=r68CyPUOjpTyY0vgUJ+l6U0aaRLFYPCDPNTvJePUKZtc8VjQuP2/omJJTiXPN4rew
 bsoQXRNPr4mcm2LqVqaRrFM3hcBKdB88uE8DDSvZSwLBVnSasifHYEKxd+hs+nqNWa
 dYyHcVoDoCe72blwEHIJA/2NPKC3Lk9bfXn8G9rb7wgFaobYpEPb/Zffglpb6OgynL
 lJWqa7I7UJ9CEUE3mduAv5x0H0YPwd2SWnBMOxWpTZZzqE9n6qI6IldVOWf+Jcqjtv
 28COiEbbKzRmC6oKPFvOwjzKs0uHFcbuaIxWayS/qaH0aKQWC1c2bloq3xBESvrKi6
 nLpQ1U4rFlVng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.190.95]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fMY-1oyAPZ1fdC-007Ft2; Fri, 04
 Nov 2022 18:44:03 +0100
Message-ID: <54ac309d-2cec-0c8a-1c05-8f6c72d6d207@gmx.de>
Date: Fri, 4 Nov 2022 18:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RESEND 00/13] Convert omapfb drivers to gpiod API
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
References: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uah/+7j3t78kIizsD5k3ZQiaLKDPN+MvbZWOAxDFarA9H3KB3AJ
 1aI4iEW0KPdFfKhYhQfIYs3/sFLfIDnHATQ+G6OWGHJgZ0VK1riHfzqEj+GBCD5GjCfEnVR
 JL8i6e7vdM8ZyqpBbh9lfG6Onge423M+zJNQvGpYxLa06GhY3lulLVVGrBomzw1Kdx69EYd
 az7i0JcIIluUYZ5lbb+lw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YF3hyeAaIPA=;fEdf3YhfIjCAOzggQQTcDEevHOk
 reN8CM4tPeEw2G3gexX66NZwZf3pw0pnd/Msonqj7We8r2UuN9z/7cnHRUMllE5fHI805TYgL
 KDbpxaYvlOZcv2vGoi+4KUtK+6rkbediapNL2v4WjYGhhV7tTuYRYH7UX+khIciAfRvRmQtbD
 S4k6NmNoQ4qzfhmW5LYkwIEVqFIzgRZmz9uqVBZXXN0C0auK5vkQg1iv1zsieYi7KB3uL53DE
 CkeVqcuh9iq0dWE3gOKV1PxRoaSmvHAMvzneIDtJHTpM/z/eDkSVmTsrDvIX3EPc+7qY0Vzvq
 nKp65gD5dD9aVC0Er/Jbb9iX1/8nJJ2w7tvteSqGT0UV1kjfZrrgqlzbc0fJOyhqn5ivuXi/t
 onh/4sbP56LiPSIDkMctsdnSgHwR9J8f1FXR3AwWT+6zZc/fev4zsFpVJPx1mV2S2E9PsVQ6k
 iAYpa6BlrYeIFs0akPX3Gb5KoynACsBjraTygBTmlp7wNV02P2mfX/jvUc57xNVM3oKwruysp
 gNnuRMmu069eihCO3jBZze7EkAN516KSqpGG//Jgfk+QB38S09f5pvxL0fSChTzGA3bAhfTyj
 kzAgajor218fP4g7wMffOeAN/aXlIqAuaAHDkMhDXxWcCTLOYZGsLaAykcXK74DGUyGuO7Nl+
 2B6skJiLL/RP9DFC/1QqClPKVXM5oAQ4eFTeeTEA0yi36CRkKuwl0coNCFd0HpuIAflvSg2hy
 19LlKZye7F4YppPP4JO6VtJnge1AWO+pWK5tG5yPN6D4M57BSFoYRxgRkgOs38dUurs1K30ND
 AR7TXaL4uXnK0Lv6ix3+snrP5Jx+hp8t1WkhZh26utNNucej48r3WSy+fclMaPdY+XmSbmDPQ
 yHMAOmRsfkCdbF53JusbHUipJQoK9acrmVsnaKcD15m5awBAALB5n3BZZbdSfEthAIVpcIpw5
 HpOLYKjn9eDPrSyNXwR1JbEUhEk=
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/4/22 04:16, Dmitry Torokhov wrote:
> This series converts various OMAPFB drivers to use the newer gpiod API
> that respects line polarity specified in DTS.
>
> Unfortunately existing DTS files specify incorrect (active high) polarit=
y
> for reset lines. As discussed in [1] we will not try to correct existing
> DTSes, but instead follow the path established by DRM drivers for the sa=
me
> components, and continue using inverted polarity in the FB drivers.
>
> [1] https://lore.kernel.org/all/20221004213503.848262-1-dmitry.torokhov@=
gmail.com/
>
> To: Helge Deller <deller@gmx.de>
> To: Tony Lindgren <tony@atomide.com>
> To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> To: Sebastian Reichel <sre@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Dmitry Torokhov (13):
>        omapfb: connector-hdmi: switch to using gpiod API
>        omapfb: panel-sony-acx565akm: remove support for platform data
>        omapfb: panel-sony-acx565akm: switch to using gpiod API
>        omapfb: encoder-tfp410: switch to using gpiod API
>        omapfb: panel-dsi-cm: switch to using gpiod API
>        omapfb: panel-tpo-td043mtea1: switch to using gpiod API
>        omapfb: panel-nec-nl8048hl11: switch to using gpiod API
>        omapfb: panel-dpi: remove support for platform data
>        omapfb: connector-analog-tv: remove support for platform data
>        omapfb: encoder-opa362: fix included headers
>        omapfb: panel-lgphilips-lb035q02: remove backlight GPIO handling
>        omapfb: panel-tpo-td028ttec1: stop including gpio.h
>        omapfb: panel-sharp-ls037v7dw01: fix included headers
>
>   .../omap2/omapfb/displays/connector-analog-tv.c    |  60 ++---------
>   .../fbdev/omap2/omapfb/displays/connector-hdmi.c   |  49 +++------
>   .../fbdev/omap2/omapfb/displays/encoder-opa362.c   |   4 +-
>   .../fbdev/omap2/omapfb/displays/encoder-tfp410.c   |  67 ++++--------
>   .../video/fbdev/omap2/omapfb/displays/panel-dpi.c  |  83 ++-----------=
--
>   .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     | 116 ++++++++-----=
--------
>   .../omapfb/displays/panel-lgphilips-lb035q02.c     |  21 +---
>   .../omap2/omapfb/displays/panel-nec-nl8048hl11.c   |  72 ++++---------
>   .../omapfb/displays/panel-sharp-ls037v7dw01.c      |   3 +-
>   .../omap2/omapfb/displays/panel-sony-acx565akm.c   | 105 ++++++-------=
------
>   .../omap2/omapfb/displays/panel-tpo-td028ttec1.c   |   1 -
>   .../omap2/omapfb/displays/panel-tpo-td043mtea1.c   |  59 +++--------
>   include/video/omap-panel-data.h                    |  71 -------------
>   13 files changed, 170 insertions(+), 541 deletions(-)
> ---
> base-commit: 61c3426aca2c71052ddcd06c32e29d92304990fd
> change-id: 20221103-omapfb-gpiod-87ca2550bd90

series applied to fbdev git tree.

Thanks!
Helge

