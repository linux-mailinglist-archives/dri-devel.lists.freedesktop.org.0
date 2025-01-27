Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95813A1D78D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 14:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C1D10E51F;
	Mon, 27 Jan 2025 13:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lu3+qPzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93C510E51F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 13:56:07 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-303548a933aso41132881fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 05:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986166; x=1738590966; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wt4sS6zTyCweAZYH++LZePNO/qvVROY3D8Q5U1D/3eY=;
 b=lu3+qPzgjXB32Qkc6Z/u47cL3LSEVu564pDBZsprDBS+kVSDhtFScX1lN7BEBm+HDH
 mzaOsf9TGSTYXbR2gOMn7B4yCcwlnzH572eZwupiwJ6geUc4ONWgZvgRazdsFnO1j7gX
 k0/e8lc20Wkcv4tFUCu/JUAcucrMXjOOqUrAyNmsitWm6cCavCi8V/+na+M5TBL2NIZv
 BtlugT8kUE6faegDEMQWyy8iJoKc0WW0wlCQNDE4Ris86iEOenAP6Ny9ztLYpwylxROr
 zhwAUXizBvUtn5g5f1aITl1Qtcb7F84q+RuVPZ/D5Bb5WF6FLhSLJXR64OIOfUUDHJWJ
 VlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986166; x=1738590966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wt4sS6zTyCweAZYH++LZePNO/qvVROY3D8Q5U1D/3eY=;
 b=hO42PvbmoHf5Pb5b+N6ttFCYeiTn05QhjuUwGncKm74wDJTq3ENh7EIMmTxNK7wwzN
 2HJVg/4nx2lfRN04vFQkxFf9BH5/MMuPyqc7ideRzsZZtOhvT1boPyHzZmHqJLYQJoIg
 ndzvRccIjQiw/thfZFfL8yijlBYOsUau1PSKXhB4qggmKCDcfKmMzmFGylEj8VFNSjP0
 /zsaskhqR/ErKZe9c6mclCWcdHpgGP1lO+yZnX+6j+yY65dS0rpVIHfLs+MmohEfpumd
 NGklJO5bdibVKCZkru8h0PH6hcpwThnf9mu6aJRSohZaAeq5bhQmFnoDQMy/9e7NeeCO
 kKew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIbbYfvYEU2pXawKx5+owt2WMA0QAbfcqLRICSLXxwb+6loZlXdejckBsICiiyMSwh1aZzC5wQ6aE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyET7k3npcvuF4rE18lG0IukGe2iOIo5goh7nwuBeCkyF34p9Rg
 DIVpI4zHHR25c8XZZty63YkqG9v4X8toTi4GmyOZBG9v1bWuSko0TI2CSBZS1b4=
X-Gm-Gg: ASbGncvJq5CF3J5sCoCZGm0Y1IVzSzqeJ3EKJuHq5HmOXhfw1aRaXv6a2fxVu/XqWHI
 B+Ou/+fEwXs//cIDMHCSGet4TQsrzzgtZ61s0Cq150aCpzvEdqxqemXHh6+ROpWx1pAyerV/ebL
 VBDm061G7SdWKELyLpMdwknISkeaMFeq9SJ9a1lMAZjJl1DMJbpdPp3YldeXAUayjFacgqnIp+Z
 IOdLP+6wpJ+iMuZIO+n04Gz8/45R/E+qD2ycbR23qTrRrjqB+zc98BXIoARlu2IwOgN/M2gQhE/
 CrwRvSfzoMEmWoeya2brxz1doRbRcJ51k3VOKqinh5gF2QFpS8WHvLj03IOw
X-Google-Smtp-Source: AGHT+IEndS/LVqeUqSpxsvwA84LzRH+l+YBnVxcXQWp9YfcsB2fe5zmaDUUkUk95OVNxnfDlx/rsmw==
X-Received: by 2002:a05:651c:2104:b0:301:12:1ef3 with SMTP id
 38308e7fff4ca-3072ca5bc35mr153845421fa.4.1737986166078; 
 Mon, 27 Jan 2025 05:56:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc49b5fsm14359241fa.101.2025.01.27.05.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 05:56:05 -0800 (PST)
Date: Mon, 27 Jan 2025 15:56:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
Message-ID: <4vy6tjdvhkplly3uqqekdmz6brkcbac6pijrn6gdyz4x3hralr@meeugoua2ats>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
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

On Mon, Jan 27, 2025 at 02:21:04PM +0100, Krzysztof Kozlowski wrote:
> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> two clocks.  The respective clock ID is used by drivers and DTS, so it
> should be documented as explicit ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch for Display tree, although with Ack from clock.
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-common.yaml  | 2 ++
>  MAINTAINERS                                              | 1 +
>  include/dt-bindings/clock/qcom,dsi-phy-28nm.h            | 9 +++++++++
>  3 files changed, 12 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> 

> diff --git a/include/dt-bindings/clock/qcom,dsi-phy-28nm.h b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> new file mode 100644
> index 000000000000..ab94d58377a1
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h

I think this should be dt-bindings/phy/qcom,foo.h

Other than that LGTM

> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
> +#define _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
> +
> +#define DSI_BYTE_PLL_CLK		0
> +#define DSI_PIXEL_PLL_CLK		1
> +
> +#endif
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
