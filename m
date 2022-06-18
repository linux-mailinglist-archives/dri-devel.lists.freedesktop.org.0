Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD885505CB
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 17:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACDB10E8AE;
	Sat, 18 Jun 2022 15:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EAB10E8AE
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 15:39:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A23860ECF;
 Sat, 18 Jun 2022 15:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC6AC3411A;
 Sat, 18 Jun 2022 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655566746;
 bh=McuYUPbcTogh0Yrn7FSYihqEAcvdIVNBBIDilpwKOpE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dSnD0FK661SnooSn7Z/CDSOX3C3M6TplRlQ+BdTAy3J5UoTF1ZJhfy0liHIx9LLKJ
 MmOBy6sUSheDILDX/FclyJ2ODmVSkJuDFnMF9EcDwWOK0MMT7rSQl26Krt7XqdvqGH
 1ULRRVdc6QRCMSLjBZYYrmNqffXtEeuxOm9uPjF2u1F1Vqa3EQc2N58FHFgSv/NvSE
 0gBc87cgiNXnUcjPnNOILCd+NQ1oVQDTlP3VULDcsL6ZpPWAwY2t8+39JcivJuquhJ
 vVRYNmRbCwYBRuOwqx3C78E8ZqVCAyRz5L7XP3svJYw32ZsjUiJbfJih8B78n6II/1
 HYiaISZCY5RRQ==
Date: Sat, 18 Jun 2022 16:48:20 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v2 07/15] Documentation: ABI: testing: mt6370: Add ADC
 sysfs guideline
Message-ID: <20220618164820.2eeb8ae8@jic23-huawei>
In-Reply-To: <20220613111146.25221-8-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-8-peterwu.pub@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, jingoohan1@gmail.com,
 ChiaEn Wu <chiaen_wu@richtek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, szunichen@gmail.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-leds@vger.kernel.org, pavel@ucw.cz,
 matthias.bgg@gmail.com, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022 19:11:38 +0800
ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add ABI documentation for mt6370 non-standard ADC sysfs interfaces.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  .../ABI/testing/sysfs-bus-iio-adc-mt6370      | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370 b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> new file mode 100644
> index 000000000000..039b3381176a
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-mt6370
> @@ -0,0 +1,36 @@
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage0_raw

Unfortunately the kernel documentation build scripts do no support duplicating
standard ABI for particular devices so as to provide more information.
Hence you can't have anything in this file.


> +KernelVersion:	5.18
> +Contact:	chiaen_wu@richtek.com
> +Description:
> +		Indicated MT6370 VBUS ADC with lower accuracy(+-75mA)
Curious though, voltage with a mA accuracy range?
This scale should be presented directly to userspace anyway so no need
for this doc.

> +		higher measure range(1~22V)
> +		Calculating with scale returns voltage in uV

No. All channels return in mV. That's the ABI requirement as
in sysfs-bus-iio and we cannot vary if for particular drivers.  If we did
no generic tooling would work.

> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage1_raw
> +KernelVersion:	5.18
> +Contact:	chiaen_wu@richtek.com
> +Description:
> +		Indicated MT6370 VBUS ADC with higher accuracy(+-30mA)
> +		lower measure range(1~9.76V)
> +		Calculating with scale offset returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage4_raw
> +KernelVersion:	5.18
> +Contact:	chiaen_wu@richtek.com
> +Description:
> +		Indicated MT6370 TS_BAT ADC
> +		Calculating with scale returns voltage in uV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltage7_raw
> +KernelVersion:	5.18
> +Contact:	chiaen_wu@richtek.com
> +Description:
> +		Indicated MT6370 CHG_VDDP ADC
> +		Calculating with scale returns voltage in mV
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/in_temp8_raw
> +KernelVersion:	5.18
> +Contact:	chiaen_wu@richtek.com
> +Description:
> +		Indicated MT6370 IC junction temperature
> +		Calculating with scale and offset returns temperature in degree

