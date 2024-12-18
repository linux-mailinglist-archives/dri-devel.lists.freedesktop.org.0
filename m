Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC009F62C9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D8E10EB4A;
	Wed, 18 Dec 2024 10:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J4R0RMCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87F610EB4A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:25:08 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so4748231f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734517507; x=1735122307; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QdPVyM78eDgDTmlufV6LwQcYMrHvej2T0RlU1S+8w3s=;
 b=J4R0RMCQCjcApo8xo6KmW3IR3Tb33KadTPstFylKoo4fRwkwFvuprs2X7uTD/Tep0F
 A/PSzFvkWgaMAiFW+kJ0rJ9URvMGY844wtm/h3M6ySGz81K5pZ/hX7lS3kqWCBGuutI/
 Ev5z+K/obIF6OKMseTOcz0VjggOtZCsYRrp6fk7c/BdftzcSKJLqIcOadQtwSG16gC/x
 LXzpUzBQcMo3OO47yvjTCnWbFdQUuJogRMcWNJm0EYhbU/1gDRcnVKGY6cOmGz98BflY
 qBCh3GjFVLSrM0MjvtOETNmG3bkrU/j2L7wKSw2wQpTK6P9P9UhXtCWiyyg9+qcwl/m9
 Y1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734517507; x=1735122307;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QdPVyM78eDgDTmlufV6LwQcYMrHvej2T0RlU1S+8w3s=;
 b=layKlyJvyY4NQzNSe9JLN000Fx4LYlEu7Cv/qya5+rPMzMjM6TVgGQG25tt/jVD+cg
 xsoo2Kep1n+tW65Cr0Kvpwe3bMRwJOsQ/em10HAnwWBx2JGPScFmtI9CwICF+ljP06kQ
 JYHTfXJkn6kIxxw2qBDpw1aS+icDN/p/X9xTgGgItCAcRum7PJ/+u3ufZqBMqL+EWjna
 js05iSfbZH9/p2Og+DB3i//QbtLPIbh/XhffeDE50fQbSkkLGpga9hyHZy722P+yYW9e
 qujoUr88Hiek9GiR3mBX6ND5HOFESiuLA8Z4pBa7fZGv2T9XFJZXUy+XnFj5pSpmNaA7
 NMIQ==
X-Gm-Message-State: AOJu0YxRK19Vm79k5ZfdmTYoGjjZLPrOSm6CFjWbgNtauZk38INTdYAS
 rMFgnxN5CewSrxiIJZyk23dtHA8Hil6fogtDFU4A5J6D2Qd0sHt5va7LyBa25yY=
X-Gm-Gg: ASbGncvKDpyDRAFlB/uuoj6OkXvbzci8DtgGvs8ZG56KPgrXIlBJUC/u/YaA72tDWbf
 ff8gTPky0bD9+xaaz1OwgboDm3sn62Wf/tiiYwoc6azHkxNfq/bfSIy+5Rk84yRHpcWcFbWXdAg
 zuZV30TL7HPU2V8Rks8ylm0Rby3JuqIDMUp2AgHhe6NUjzy2gAN0Po5RgTCi6jLQTwgooWVulMi
 4jKA7aNMki+jJtX6OuqSytQVpGEfPV2mp4UncTEJYypgBFqWP/T0HmjGlvze4j+0Vz5rH2f8qRV
 fA==
X-Google-Smtp-Source: AGHT+IGf1BC2qG7eEOGcS3uQiNkdUuM/G6VbY3wDn4Hg17Nj3k7zspUIygu99ZMQP+yDnDhxEPFTfQ==
X-Received: by 2002:a5d:6e87:0:b0:385:f638:c68a with SMTP id
 ffacd0b85a97d-388e4d6437bmr1707557f8f.30.1734517507198; 
 Wed, 18 Dec 2024 02:25:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80613a9sm13561558f8f.101.2024.12.18.02.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 02:25:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
In-Reply-To: <20241212122701.25305-1-marex@denx.de>
References: <20241212122701.25305-1-marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Document Multi-Inno
 Technology MI1010Z1T-1CP11 panel
Message-Id: <173451750635.2945394.12637582167609538322.b4-ty@linaro.org>
Date: Wed, 18 Dec 2024 11:25:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Thu, 12 Dec 2024 13:26:28 +0100, Marek Vasut wrote:
> Add Multi-Inno Technology MI1010Z1T-1CP11 10.1" 1024x600 LVDS panel
> compatible string.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Document Multi-Inno Technology MI1010Z1T-1CP11 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/523092f6891d8652ab26331a9f35dc8329322896
[2/2] drm/panel: simple: add Multi-Inno Technology MI1010Z1T-1CP11
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/958473e7ed69bb397eed816b88be28986f7951ad

-- 
Neil

