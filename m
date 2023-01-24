Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5123367A4D8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 22:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4FB10E6FA;
	Tue, 24 Jan 2023 21:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B36310E6FA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 21:19:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9B8CD85695;
 Tue, 24 Jan 2023 22:19:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674595184;
 bh=3zLG2SAoZbp0/KJeFi85r/F4UncIB7fHEaEWRMcT5K8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xi2tUnTe8KcsRDoq1xC3q1XG9PCwVJN4Xl/ym6GjUasvdr96RLXTUh7wMSJmUDbmg
 /kHLc1IHnheJLpki3RHvQpRNhl5Btnmbn1Q8/wnAu7vvgmmLU2REwnI85quPOYk6KS
 RAuByN4SOcbRIynR0Z1/VBDW+2ZF+C7FnPUvAA/ZHovkFBLxm+dxjNr07ZsoWaOH6x
 ognzcnmd2QUTS8wLINVlixryxri2vRuWDHcbaxJvlGFVusb5FN9HqtmLQyxYkUa7iu
 wh6glmAJB9y9ZcpsCjEuik9XAjGx2mHVaQ/p+N2xXqMrF+LGFycxEw/64RYB1YQRGF
 rsIrAAOTDDk/Q==
Message-ID: <fb888dda-fd7e-adb4-c701-6db4edc316e6@denx.de>
Date: Tue, 24 Jan 2023 22:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 11/18] drm: exynos: dsi: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-12-jagan@amarulasolutions.com>
 <75b01e4c-5994-5931-7030-ab86705d67b3@denx.de>
 <CAMty3ZBdiXnxcak5aKi9cR7OxNPXCQOh2PB0DZ1aEYtySOs--A@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBdiXnxcak5aKi9cR7OxNPXCQOh2PB0DZ1aEYtySOs--A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/23 22:16, Jagan Teki wrote:
> On Wed, Jan 25, 2023 at 2:15 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 1/23/23 16:12, Jagan Teki wrote:
>>
>> [...]
>>
>>> +static bool exynos_dsi_pixel_output_fmt_supported(u32 fmt)
>>> +{
>>> +     int i;
>>
>> if (fmt == MEDIA_BUS_FMT_FIXED)
>>    return false;
>>
>>> +     for (i = 0; i < ARRAY_SIZE(exynos_dsi_pixel_output_fmts); i++) {
>>> +             if (exynos_dsi_pixel_output_fmts[i] == fmt)
>>> +                     return true;
>>> +     }
>>> +
>>> +     return false;
>>> +}
>>> +
>>> +static u32 *
>>> +exynos_dsi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>> +                                  struct drm_bridge_state *bridge_state,
>>> +                                  struct drm_crtc_state *crtc_state,
>>> +                                  struct drm_connector_state *conn_state,
>>> +                                  u32 output_fmt,
>>> +                                  unsigned int *num_input_fmts)
>>> +{
>>> +     u32 *input_fmts;
>>> +
>>> +     if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
>>> +             /*
>>> +              * Some bridge/display drivers are still not able to pass the
>>> +              * correct format, so handle those pipelines by falling back
>>> +              * to the default format till the supported formats finalized.
>>> +              */
>>> +             output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
>>
>> You can move this ^ past the kmalloc() call, so in unlikely case the
>> kmalloc() fails, it would fail first.
> 
> I didn't get this point, what do we need to do if
> exynos_dsi_pixel_output_fmt_supported returns false?

{
	u32 *input_fmts;

	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
	if (!input_fmts)
		return NULL;

	if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
		/* ... the comment ... */
		output_fmt = MEDIA_BUS_FMT_RGB888_1X24;

	input_fmts[0] = output_fmt;
	*num_input_fmts = 1;

	return input_fmts;
}
