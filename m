Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD3485A22E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 12:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB5110E33F;
	Mon, 19 Feb 2024 11:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QAWhTh//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3B610E347
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 11:40:26 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4126aee00b2so815975e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 03:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708342824; x=1708947624; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cahpJDlTBvaPh1z0rb8s1H/VECGhkeYrXnAZOPffrYI=;
 b=QAWhTh//gTgIQ3Sd8LNtje56HaU5CsV3R0wfIxjBTZypo+rO/WTGYvu49JK7kgxYtI
 vCLzDv+8UCPpfnnJl59lsmQNZDEf5Cm+lu3AFODNfK6oo3IC1jqvWWB2F9NblUpY9HOy
 C7Y3SBhjqmh/vFiudR9gOL2wzzPC6Q0x+lQXxlnWRYwffL152ZtNCmfscIY1tgUrHbaz
 /o7w31NjVyzc6goiew+SJ6zzuAPXzpTT/fCy2yCsfOqDSO3BNndjwlOVPWjmw2gJYZrS
 7zw7nXFef+5YUbHJ8fPcqMmbaeO5ywupfY5/V+JnRY/r9CWeJHmm0MbhdmJ9UOj2DNk8
 UKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708342824; x=1708947624;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cahpJDlTBvaPh1z0rb8s1H/VECGhkeYrXnAZOPffrYI=;
 b=bJYuReOhJGEAuJOLsnXGBXqPzfzle/594FiEUV2Sn8S7oyFhZ0BGN3o6SwSDvPsRwz
 57h1/MvnAKHrV8BPW1MScQyYhQkibmmwCSl5Ugqb3hBBE1O7JuhcG4isEzOZxpWdq/1P
 WrQ+nU/4ZBM6vbEnIi6bGsE42sv1uvL0E6t0Gpvq0I+UyqvIkdH1bHSZ2In+t/fITHz3
 y67nbdQ9trk8QEL0L2MNpRJ3yWzeTovevPp2SxxtpsyXfRW8Sbun41ks1WkGBR2uoSq7
 NDMHgM/seHWxvnNRu2CZ/Jbh2X1roAygsjnS+nMzNeT4h3q/6hm1ugzar7vpGWlSSOG2
 NgcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMCxRwiq2F9R7V3Ml7b650qYnK74t/i4staDYRTpau3l8HIh4ViK7u6GgbUOtXlrY7v74z+M6mdyNsngY2a+6OvQqJG/sr5ok525GYVm2r
X-Gm-Message-State: AOJu0Yy2Cxh3+jt9XC4igWdP0CkcKTxdqQzd8WdVTblvlSpkrkdxZbqm
 J2G2zLb1xO7D9tjyMKZH9Zw/1OXpBhzyx/ta1Y4jWE7qvP8LhER+t4wG47Lt5p5lxnPr5aayr2c
 Esl+JvQ==
X-Google-Smtp-Source: AGHT+IFWyWRBPHkoXku0bexMnodLRCpkZ/g2IsWgFuqrh7BOC5z6SYvdSOSACQc5UXXa84vyZN2yaw==
X-Received: by 2002:a05:600c:190f:b0:412:1998:e250 with SMTP id
 j15-20020a05600c190f00b004121998e250mr8490240wmq.27.1708342824470; 
 Mon, 19 Feb 2024 03:40:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b004123b049f86sm11224164wmq.37.2024.02.19.03.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 03:40:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20240211111703.7567-1-tony@atomide.com>
References: <20240211111703.7567-1-tony@atomide.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add
 boe,bp082wx1-100 8.2" panel
Message-Id: <170834282359.1853972.279717039364187970.b4-ty@linaro.org>
Date: Mon, 19 Feb 2024 12:40:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Sun, 11 Feb 2024 13:16:58 +0200, Tony Lindgren wrote:
> This panel is found on Motorola mapphone tablets mz607 to mz609.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add boe,bp082wx1-100 8.2" panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=763955fd6c93ad46cdb8a0dc620e7855b1ad2fe8
[2/2] drm/panel: simple: Add BOE BP082WX1-100 8.2" panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=dc90214ff58be575fdceb549f901506cdef5d093

-- 
Neil

