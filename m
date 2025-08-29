Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBB6B3BF08
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 17:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D4E10EC01;
	Fri, 29 Aug 2025 15:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="hjw6k9Zd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5535E10E14E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 15:18:37 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7e8704cdc76so223058885a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756480716; x=1757085516;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ghrhxwoqKMCN5VgWcIThzYZeVniKtHuv8o+iU1wCEl0=;
 b=hjw6k9Zdzl+GyDw3fY9gaYX0N05Wi3uz1TfzucIpRU1x0l8kfj3aKJA1GNVuhcLquR
 Wu7yyQ/vSJFLib5jm8stORTigNaPkuPBXNhPTkmkMaaPLfTjvNQKIUnlzG3wYBdfvIpD
 34pWkNRgYIwGGqdvWB+wrlQdWNQ0ekZTDQsgbFd2SqKYlSBGC9TTMMNkG+XK5x1/deP1
 uwNldXWQYmzTcNfH4RMvV7WBIxaUWL+bn/adp0ii9i8Yb3p1Djbjbpcv5qCWdQyePFJf
 yjYE2DC1AWs7qPyNjRp+kBCd+0HIbkOuuKVblX0O9JnvTIvZFl4Y5XHkHp2CubmIOiPL
 eC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756480716; x=1757085516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ghrhxwoqKMCN5VgWcIThzYZeVniKtHuv8o+iU1wCEl0=;
 b=v0P7N0zXMbSx7m/5dN5owl8wsmx4sfc8CUOJDCLb1q+JV0WfmH9mij0750/tT2w8fp
 3fbSagN2bRX3dVutwfHCrRdR5dVU3gmnwFFsTj0FrKFDe4z44TPhGe5F1d6KSgguhGCd
 GtnSXYvYRZN0Oj2vSW10r6Ieg0MW7idSgl0MPeYC9ONhXFCD81SU77ww47BACMWcD5oJ
 9m4xtWapT7Mj7b8cxlQaT2kHZI/RIL2cZILQIJFAOJsgOnUQYcmXVUWyWtyAZDNg7hnu
 kJIZaDBTAvXFkGcD2+TFq/1s57C0wFp5m+LwqY2FnhjKu8JofVGNU5ykA0NXkl0E6MwJ
 83HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuRdf7AGtcfdPD63GD0cCb00kHekqmTnFwKWNCWlkq4RaG32EBucZLV8O8nkhqNijNBURHYSLNJuo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWJeW0CDj/r0I8Y/c8SdYxEGP+LAbhQG8/uwlLvPigvKwtNd7n
 usU7qi86t3F8sJE6+qnI7ojXYXRsD7bZWrbTsULnb96N8hz7o5IW0rS1cU2WzFywVehXD4d7pb2
 ngAUNXKdaCNqNvikqKIosGblfhsFkwrh6fhPkRfrCqw==
X-Gm-Gg: ASbGncta16ELgMViMQZDwn6IaLVfjYi7ZziqPW30zq3lXkFxR3LvEPCanU4MA1iHy8m
 hd55albgVsiRh1qoZKeEulHyGCef5m8768gXHkzynLYT/xqGnakjzUurbQumH2e5DZlqOoxeGB2
 1nmLq/+NEYspVK6mhRBJAjZRIIXva9hiVeQ/cbZMklb00DMD1Q6dCHBZWwwsh05xERh+krRyY2+
 KJU3iZI8yB+CqYt
X-Google-Smtp-Source: AGHT+IGmPttzEK19ZD3UTDCY1FnzsKcijNSUsN6pQPrVL+2gsomLPlupJ17X2EjGDAqx5GLvtjHyN5i9KgoNezf9kFI=
X-Received: by 2002:a05:620a:2888:b0:7e8:1d4b:b00e with SMTP id
 af79cd13be357-7ea10f73af4mr2964339785a.30.1756480716220; Fri, 29 Aug 2025
 08:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com>
 <20250825-rk3588-hdmi-cec-v3-5-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-5-95324fb22592@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:18:23 +0200
X-Gm-Features: Ac12FXxmGn_rShnoeRaqJ2HPo1b9mmmJuCbdWBYqIMqhSsoU1twbnPqkg976p5g
Message-ID: <CAPj87rO1NKnApMkw75CmAXS6_ARpFDiofgwiqH_uwfrB6BFcUA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/rockchip: dw_hdmi_qp: Provide ref clock rate
 in dw_hdmi_qp_plat_data
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

On Mon, 25 Aug 2025 at 10:57, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> In order to support correct initialization of the timer base in the HDMI
> QP IP block, setup platform data to include the required reference clock
> rate.
>
> While at it, ensure plat_data is zero-initialized in
> dw_hdmi_qp_rockchip_bind().

Reviewed-by: Daniel Stone <daniels@collabora.com>
