Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013568CB17E
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 17:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030DC10EFD0;
	Tue, 21 May 2024 15:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LcnTsaJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E885B10EFD0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 15:36:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41fd5dc04f0so24460695e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 08:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716305805; x=1716910605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=46MBRG1SoxQr9SxFCn07JGJ8jdLms6wT8cP/QcL3Nhw=;
 b=LcnTsaJCgS5Ql6DBP4OClplI/GlElf6XW76MdE/nwClfETu9VdGw9XUaFaUeSx7tuD
 ieyg/JYgEzf3RZbAe1f4YId04lxKqNgdFfQ8v26NrTvHwbKAMea/KtmzmvKcYx/1Tlv0
 kV/s16zETRZ9U1GbFiXwWjz15K631MIhpBP1LGf7U072ktvhy/HUAw7Y1MUipWPf6tUU
 PLxj4RXQemYpCDPJ59o+wNwSBUKRBW4BpdmvdxCVBaFkNMgFaPTNFLwKTULzXbFCsfm/
 f6wrFpfGvdeHQiL+aINa8lEqtlyLMvkh3/GbkaHRxoTCsoIsyslxzEi/4B3sNCG14LMt
 h37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716305805; x=1716910605;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=46MBRG1SoxQr9SxFCn07JGJ8jdLms6wT8cP/QcL3Nhw=;
 b=p7tyoZYkcBc9d9GXBIXfzf89fyEDMizIQxWNTgGQXt1OPF7G9tX15ngENTkK9a/SOu
 ur08mHg4BmBHXqMDix0bc/2OMETCaS4U05ViILvPAIigXeqBpu/QR13BvnroRWa1HvTe
 8TayJ8gWReQPUQh7tgZWoAzqnD3jheIVanbhxGaa8sSxIXgX7Wxv0Hxmguz/N93fIBK+
 CPLABnTgz2CHof52PyiDsd39jwzekBw8pq4ObOdF/aBB/QRnbc13aAkytP+jfTVhfXZu
 kka/9dLrXcfrtlzXMXrrflvPm6mzaX2+h7jOha61foH0rwLE6oMm1L+8c9395TKNnE4V
 bysw==
X-Gm-Message-State: AOJu0YzO6Qm2zk5XMnb/izj7xZ+H1fmfkU420TEoh0dlrFjuFLSuDdch
 IZ3iZ9+tcifMJMY8jHN0g5tx0+NNmCoX3AsBdyY43kVvnSHXVQ4=
X-Google-Smtp-Source: AGHT+IFi6H7xCiBQJNeJFOntXvHJMi8HPJVCQ5T8EDXf2/2DlOHcElz5RxvKkaL/QDJl/17ygKhYrg==
X-Received: by 2002:a05:600c:1c9e:b0:420:29dd:84e3 with SMTP id
 5b1f17b1804b1-42029dd8829mr162105465e9.26.1716305804872; 
 Tue, 21 May 2024 08:36:44 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:a828:7263:6693:6f6a?
 ([2a02:810b:f40:4600:a828:7263:6693:6f6a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42010940845sm391038675e9.35.2024.05.21.08.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 08:36:44 -0700 (PDT)
Message-ID: <58ddfc8f-1995-4f41-9d63-35a00c6f92b9@gmail.com>
Date: Tue, 21 May 2024 17:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] drm/bridge: add common api for inno hdmi
To: keith <keith.zhao@starfivetech.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de,
 jack.zhu@starfivetech.com, shengyang.chen@starfivetech.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-3-keith.zhao@starfivetech.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20240521105817.3301-3-keith.zhao@starfivetech.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Keith,

thanks a lot for working on this. See some general remarks below
Am 21.05.24 um 12:58 schrieb keith:
> Add INNO common api so that it can be used by vendor
> drivers which implement vendor specific extensions to Innosilicon HDMI.
> 
> Signed-off-by: keith <keith.zhao@starfivetech.com>
> ---
>   MAINTAINERS                                   |   2 +
>   drivers/gpu/drm/bridge/Kconfig                |   2 +
>   drivers/gpu/drm/bridge/Makefile               |   1 +
>   drivers/gpu/drm/bridge/innosilicon/Kconfig    |   6 +
>   drivers/gpu/drm/bridge/innosilicon/Makefile   |   2 +
>   .../gpu/drm/bridge/innosilicon/inno-hdmi.c    | 587 ++++++++++++++++++
>   .../gpu/drm/bridge/innosilicon/inno-hdmi.h    |  97 +++
>   include/drm/bridge/inno_hdmi.h                |  69 ++
>   8 files changed, 766 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/Kconfig
>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/Makefile
>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
>   create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
>   create mode 100644 include/drm/bridge/inno_hdmi.h
> 
....

> +	drm_encoder_helper_add(encoder, pdata->helper_private);
> +
> +	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
> +
> +	drm_connector_helper_add(&hdmi->connector,
> +				 &inno_hdmi_connector_helper_funcs);
> +
> +	drmm_connector_init(drm, &hdmi->connector,
> +			    &inno_hdmi_connector_funcs,
> +			    DRM_MODE_CONNECTOR_HDMIA,
> +			    hdmi->ddc);
> +
I really don't want to anticipate bridge maintainer's feedback, but new
bridge drivers must not contain connector creation. That must happen
somewhere else.
Also I'm neither seeing any drm_brige struct nor drm_bridge_funcs, which
are both essential for a bridge driver. I don't think moving a part of a
driver to .../drm/bridge/ makes it a bridge driver.

Regeards,
Alex

> +	drm_connector_attach_encoder(&hdmi->connector, encoder);
> +
> +	return 0;
> +}
> +
....

