Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDDAB3BF1B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 17:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5976A10E0C3;
	Fri, 29 Aug 2025 15:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="gARGfoTK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7726810E0C3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 15:21:31 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7f6f367a1f0so264133485a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756480890; x=1757085690;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2IYwgECH2Vb0kFa6dag8ngSP8oduCmQ/9S3DpTHTLEQ=;
 b=gARGfoTK9pIA1FRUnd8xcqDF+QbL2G4MtWcx8KbnvpZHTJ8LiaU8bGmBSslOnhfJbf
 +UMgdCGkjL5gc7qdNYuOI6HxfUfPxVLQzywHm2oKASwJlrVUt3pxtUE1Cr/6ZB9b/WRM
 LAlCTEOSJN16Gr8PtQg+twQwRNN4QwAJBvnGRx2CvEcEFUvOukk47QjljSeLTMHkqauo
 zNLEaraJhKeeLCdfBwsg5IZwVRJzTZSTxMpV/HPVPan7hSAHgQodSF21PuekuGqblANE
 RUMNdFzNeXEkxlbCKW+i43AqH3ZB0zqC0hGZKDBhgCGG7hsL5LUH9oYZuT4NJCyJiM5c
 V3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756480890; x=1757085690;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2IYwgECH2Vb0kFa6dag8ngSP8oduCmQ/9S3DpTHTLEQ=;
 b=gLJUg4+molGq7lDn6Z4I8ryCH1fvlpBjTLuIAtWB4z+33vLrS89vVi0gi3HmEKLo+/
 GEXrM+uMWCIJ7OPRICdy1cqfQbsyqILMcFshvHNlvmb8fM0AHb0lmhi6VtGTKGLZNwRR
 YZ8Rtrth03KRu8V0SRXr/3jAv6iWRJz8KmlHv28CMixjbhuiYoEQFklJ1GKJgQqykVel
 Xc1EO69aFJYCKXfQd94StxKFBW/XA860QlqAACL29RCYrVHU3btLxnRQPysBFDwA7I8h
 acwu/BWiPALNdZBx4UjKqpZkn/T0BKmo2lfh/dd6V/l+7GikQAScmzbYJEmzqFLFe8TB
 Je6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV76kX032jFGhua3M7fS3zOzQ1tvYFQm75B1L/lF7kWP+6bxgYLnFVhIAsAjhrusvqPqbHUYjiBF2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVsdaIWMhIFiF7k0qXjXM7gO9mab5K9oHZHT6poMh7IXTLuCQF
 AsojDAZZFY+N1/1ShkkrHb27pi0TucQs9mCwGvnzKXdhltQIw/fd9rN0Bt0DnOZ/Uu4y3im/Mn+
 AWx9Z47cNO+pJvqmhVU+D5zfyRnNhmHABu27kJ3e1vA==
X-Gm-Gg: ASbGnctY4E/5zsQV/hSEVU2JmUPkAOcPLoXH79p64sAqZipXgewFe8KMcjXR27fgQl0
 GVnLLkJyZ9PHf2wxUMGILUXwdNOmyKG9+Bu7tiSSgDllB4ax/MTRJR+Sc6UVsuavTyzBkryMLXv
 Mh4R+TKvjJuONeHg35JQFC7jIsMA1RJXireuR92Ml62qyn5Ft2R68b7OxHNLovTBw7dn2Ulz9nN
 Ap9OTjnOdOifNcZ
X-Google-Smtp-Source: AGHT+IGeGmVh1iUNjv0FS+p5OGgAJSDw8wtHxZUJDzpWlckzaiRoFpBbLnvjd7wozfAnhZJNzyKKXYePs5Pqdj4L88E=
X-Received: by 2002:a05:620a:a10c:b0:7ec:7a3:8376 with SMTP id
 af79cd13be357-7ec07a38426mr2536339485a.30.1756480890408; Fri, 29 Aug 2025
 08:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
 <20250825-rk3588-hdmi-cec-v3-2-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-2-95324fb22592@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:21:18 +0200
X-Gm-Features: Ac12FXytZj_E6GvxXMIzP02g9SBaLQPs3U8ehFPd5hZi21QBz_4X9pHHnSFdqno
Message-ID: <CAPj87rN55DOhWeCU1o0=rOkGbrP4M8v+a6xeB5eboLdCiJ-vzw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm/bridge: dw-hdmi-qp: Fixup timer base setup
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Cristian,

On Mon, 25 Aug 2025 at 10:57, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> @@ -1255,6 +1254,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
>                 return ERR_PTR(-ENODEV);
>         }
>
> +       if (!plat_data->ref_clk_rate) {
> +               dev_err(dev, "Missing ref_clk rate\n");
> +               return ERR_PTR(-ENODEV);
> +       }

This introduces another bisect cliff, as the Rockchip integration
isn't added until patch 5/6, meaning together with the previous patch
the driver isn't usable between patches 1-5. It would be most sensible
I think to keep a default until the users have been fixed up. But
maybe a better sequence for this series would be:
* dev_err_probe() cleanup (easy, no dependencies)
* add refclk to plat_data (populated but unused)
* use refclk instead of hardcoded frequency in bridge driver, make it mandatory
* add CEC IRQ to plat_data (populated but unused)
* add CEC support to driver, probably make it not mandatory to provide
CEC IRQ in DT since it doesn't seem required for correct operation?
* enable CEC in defconfig

Cheers,
Daniel
