Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD073CC50
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 20:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10B110E056;
	Sat, 24 Jun 2023 18:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6543310E056
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 18:02:11 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so522334e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 11:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687629729; x=1690221729;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b8aXK79fA9FR8gAtXzWQUHnQm80+lmfMQEsV5inLFFs=;
 b=HWf9+bLfsRsQ5gE5EplC6PQgmM/X18AmoRfH1ZpiWsNARJZdODjeXjJL4WSLHnirjP
 tUXHS7lRPy8UB4ot23yvWGA5rmp8sX0moTPJYFCAaT1xNZOy08gHKgEbmI+J2RH6IXKO
 0Rw+CGF2tc0EY3SmtGu4Sc0HuSTGwooqfVDjZ8bJUPgDSyFGheq5PDJ7DbeiUIqng3Kj
 i2OUAeajWNEQjbdn3X5/Nvw8MO1k6YY/ssyfjvAxzllzn5RQ4Ib09vPQMUlXCzCrbLEK
 KuDnSjuKBWtnX6Xl3FoX95oj0KZ5AQhft7FdRDTs4kQ8cLzCevkMsmOZgguTqloef1Fg
 VDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687629729; x=1690221729;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b8aXK79fA9FR8gAtXzWQUHnQm80+lmfMQEsV5inLFFs=;
 b=UUnaN6JObQBSHomC0EKkMyQTVVbHm0Y+Rf0gNThmbn7M4dVWW0MsqtuX+oWr39zyMh
 TwZSKrCGkMGoiEs42qNHTU821IAuPCpWBbClgH3GiQif8WIFdVPZ9OzybcwSCMAELq7v
 gLkV3KLq3oxvbCfqvb/zAFgOaby/Qh4bu52g3Ss73Iv4TXPl3egPA7qQXnVnx/Qx7gIB
 DXCiX/PEt0WnySGrWt9mQjXXqxCbiFeKoxYJ6niezQF9z093AOXaGvdmwnLz4gFBKhX7
 UCW3VIgfZrw+DWYL9JNYLhIVKrC0dniNUS0zCoYbHao7jWK8wYiJ+JEzZLDtGUYv5Ddp
 a5CQ==
X-Gm-Message-State: AC+VfDzevOyJnDRPGBxMe2YJZSWkKN0hy/lj9xTVGrSuhYnuEc77Rism
 6XjZqZxH9ej3r9HOtEw+1pjloQ==
X-Google-Smtp-Source: ACHHUZ4AwY7UKYyZJUEu0YUv5C4sz9uG4mSL1/otAdmuKa0+0lafodbdvnsMQ8A0fkFvV5cdyGqgfw==
X-Received: by 2002:a05:6512:3f05:b0:4fa:abe7:7c80 with SMTP id
 y5-20020a0565123f0500b004faabe77c80mr320140lfa.39.1687629729435; 
 Sat, 24 Jun 2023 11:02:09 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004fad16596fasm61996lfp.21.2023.06.24.11.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 11:02:08 -0700 (PDT)
Message-ID: <6f590bb6-7d17-3ae8-684d-2d4403d6ff55@linaro.org>
Date: Sat, 24 Jun 2023 21:02:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 4/8] phy: Add HDMI configuration options
Content-Language: en-GB
To: Sandor Yu <Sandor.yu@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: oliver.brown@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/06/2023 04:38, Sandor Yu wrote:
> Allow HDMI PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
> 
> The parameters added here are based on HDMI PHY
> implementation practices.  The current set of parameters
> should cover the potential users.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>   include/linux/phy/phy-hdmi.h | 38 ++++++++++++++++++++++++++++++++++++
>   include/linux/phy/phy.h      |  7 ++++++-
>   2 files changed, 44 insertions(+), 1 deletion(-)
>   create mode 100644 include/linux/phy/phy-hdmi.h
> 
> diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> new file mode 100644
> index 000000000000..5765aa5bc175
> --- /dev/null
> +++ b/include/linux/phy/phy-hdmi.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2022 NXP
> + */
> +
> +#ifndef __PHY_HDMI_H_
> +#define __PHY_HDMI_H_
> +
> +/**
> + * Pixel Encoding as HDMI Specification
> + * RGB, YUV422, YUV444:HDMI Specification 1.4a Section 6.5
> + * YUV420: HDMI Specification 2.a Section 7.1
> + */
> +enum hdmi_phy_colorspace {
> +	HDMI_PHY_COLORSPACE_RGB,        /* RGB 4:4:4 */
> +	HDMI_PHY_COLORSPACE_YUV422,     /* YCbCr 4:2:2 */
> +	HDMI_PHY_COLORSPACE_YUV444,     /* YCbCr 4:4:4 */
> +	HDMI_PHY_COLORSPACE_YUV420,     /* YCbCr 4:2:0 */
> +	HDMI_PHY_COLORSPACE_RESERVED4,
> +	HDMI_PHY_COLORSPACE_RESERVED5,
> +	HDMI_PHY_COLORSPACE_RESERVED6,
> +};

This enum duplicates enum hdmi_colorspace from <linux/hdmi.h>
HDMI 2.0 defines '7' to be IDO-defined.

Would it be better to use that enum instead?

> +
> +/**
> + * struct phy_configure_opts_hdmi - HDMI configuration set
> + * @pixel_clk_rate:	Pixel clock of video modes in KHz.
> + * @bpc: Maximum bits per color channel.
> + * @color_space: Colorspace in enum hdmi_phy_colorspace.
> + *
> + * This structure is used to represent the configuration state of a HDMI phy.
> + */
> +struct phy_configure_opts_hdmi {
> +	unsigned int pixel_clk_rate;
> +	unsigned int bpc;
> +	enum hdmi_phy_colorspace color_space;
> +};
> +
> +#endif /* __PHY_HDMI_H_ */

[skipped the rest]

-- 
With best wishes
Dmitry

