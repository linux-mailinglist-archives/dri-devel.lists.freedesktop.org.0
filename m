Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33961614E59
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 16:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7E110E3E9;
	Tue,  1 Nov 2022 15:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D700D10E3E9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667316654; bh=LOFb+W8OXqIpGc7LBazim5AxknZKIrWvFrYeZMuLT84=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=Y2gfjy8BkKsubSvmjjDFsw4SddC9KZHGtfKvJ+x95z/uUmgnGbppiW4TJFbvfQvbM
 KcqrND/DVOHxsMMOvTVVsC3xMGq1524utz3kGtaiz5uvFFFDL3Y6Rp1DeTWu//QfMy
 l6AuS6ILgBVZZ0qmQtaQ4bg5fnR9+4OqLLlD+/sveOXhBSLmpkmrNDCxBuIQ0suCwr
 QbZFPp6QfgSt5KK4mXwtLr4oL45vOdG/j15B1Swyx+Vdj8ZGf374KpodvuGm9i/FJE
 x4DakXzcW4GjtlILosJFcMUpc4gcXK354iaN7qlZNx7Dcd4j+AsPdAa5+NWDQWCUsr
 MdZeWaByEDViQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.182.121]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79yQ-1p6XSc33vw-017W9f; Tue, 01
 Nov 2022 16:30:54 +0100
Message-ID: <5574dc8c-1665-d736-eeda-cbdbef422394@gmx.de>
Date: Tue, 1 Nov 2022 16:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 1/2] fbdev: ssd1307fb: Drop optional dependency
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221101150947.67377-1-andriy.shevchenko@linux.intel.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221101150947.67377-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a8q5zU6TltpK9eRNKqOHDOxdbvvn43g6M0iwRoQ2cZQRDsfCKd0
 ahsqBsTSULZESY7rSXzZs2UQkQ6h6Pp7s63Dkqwv0RryReh7i4hVU7hAFIe/G+V7o+pgHkm
 k4pRI+0MxN5KRWCL9dwFWMy4XVzHrAC7+XRYbfY2ayy1uci8q1Jfci81UMA/x2g8lIqoW+6
 d4SkzjnV/WTjuRTyTzQ3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:caIEGPY3TKs=;Hi65LKaBmmaPJ3fLNjmPbtC17nz
 ZgoGhHy4KjtbxohlC+yOLPzmQIRzvUghdnzO7dyd2YNkvnSBiJdPgx1f9+fiYudWkywJg09mQ
 LRqLu0uM8zgARjFU2zwhox7Mk/sf6JVxqovrUxhc0wibJ4xT8fb/c2t6cdmNRIU5N/IN9QoQn
 YE5hgvjSu4ff1egF4dCAL+jKBknVm8wNo2TMbQkU1Vwm2AINPR87Q1QWWpQuUpe3NCarZUoyt
 4Gyb50L1KQBv2k8/2i8ieeV8+dfIFYYV+TuvdcHNq6tlvSoIU2DFCMnnsqgXQOCOjKXdwb0xl
 TC+w1hh4r2rnBBuH5fI1Eik9OZNmE8GfOxaEsILlKMqgdibn7z0VE7T1+eFze9RScmHmT06Ba
 KbCMJt/LuHJ5pUDqGirLoxD+A/5/2nkpMMqhx23IyMSvHvWm2OjiBKVJY2c2biPVuWyJ9pcwv
 vDt5oE6D5aQYOxp8g4OC51rlfET04EWomqSQrMbY+X9X03nm3l6uuibTrWUQAsPUKTARLcGD5
 H1xjyz4L+2kXPcg9RQ1ca3DoO8dwrmgLzrysD5OzoJrrjps+s34lrtHS+uKdMH5nvahXoqN0j
 oFSpQIkXmnEmhG0sNA1hpjztU63ohHWEvegypGmCrvKA9NRz4XZVdcL0fUxyY2pC9BwZkMDWw
 YZov38q/795YBFNLMpmMR8UyJWQFRTKCTuLa/aYdK6jr2oessPXTmVS0jHGwSSPAoqKsEW5W7
 sMznNt+BK6nfH3uw0+Q+viZZgaeXSe77goihLSASGjXJLKArQoNGxv5YdJyQjPBxCmFH10uTD
 j+B9ebH2SZTORYNXFtFgPQANi7pmtVKsSiwMDQRJTSDkKGZNZV1XFMEKBogvYIpDjvrFFq8oy
 frE4q/jedWMRj6XJp5zAHx2J2glAw9aFr+gqxhc0VrF04akQ91Z5iYAEWsWv2+3am1k1aFNgq
 ALzJmXNbYRdxMYbUo17Je7GH81k=
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

On 11/1/22 16:09, Andy Shevchenko wrote:
> Only a single out of three devices need a PWM, so from driver it's
> optional. Moreover it's a single driver in the entire kernel that
> currently selects PWM. Unfortunately this selection is a root cause
> of the circular dependencies when we want to enable optional PWM
> for some other drivers that select GPIOLIB.
>
> Fixes: a2ed00da5047 ("drivers/video: add support for the Solomon SSD1307=
 OLED Controller")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Both patches applied to fbdev git tree.

Thanks!
Helge

> ---
>   drivers/video/fbdev/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index a98987aa2784..b88d8bfe992e 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -2218,7 +2218,6 @@ config FB_SSD1307
>   	select FB_SYS_COPYAREA
>   	select FB_SYS_IMAGEBLIT
>   	select FB_DEFERRED_IO
> -	select PWM
>   	select FB_BACKLIGHT
>   	help
>   	  This driver implements support for the Solomon SSD1307

