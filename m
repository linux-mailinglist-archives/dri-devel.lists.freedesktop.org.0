Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4DE9F08BA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD02710EF85;
	Fri, 13 Dec 2024 09:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="za6CsGNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEF110EF85
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:56:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso14692695e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734083782; x=1734688582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L9gYBr7le6CudpIb2B0d8mAxQug4zJXIf9a2dPZSils=;
 b=za6CsGNnhOEJDB9mHlWm/n/ET6R4kPS/H3M/awNi6B4zjIZfJQE+3H7G0RHPZeZ+LE
 +jbkfvFghfBdk3Oj0Fmaai+P9sKmyMNmiT0zh88uAmAVAnt6aJG5TmCEXaS9eVcEPN2H
 EiPfZY8L62pemU/An4vtVba+ARaLqYuLCaOqqT+MKkCYMtHA985638OEuxDl0nYtF5Ws
 KCzfjbtLy7uBhuHLU0Vo8ICQ3bw0IWJK39L8K1kQLGsNanU7osDwBRcYJWy7DGiLl+UB
 uQgAvDB2zRggzDsSTEGsS3Clv12OsRL40HvrcQwj/RCRPrhYgHgmZzV864c9gHv+QhgZ
 KD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734083782; x=1734688582;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L9gYBr7le6CudpIb2B0d8mAxQug4zJXIf9a2dPZSils=;
 b=ZLxPdWKbEjIYgIHEd1X00+xTCED0L42m6moJp/wmWkMgI6C58OpoYPoGL6F9pfqY4Q
 vN9QY7jyyEjiWzfRLibU9rZXhtPanzbpE2H7MfZUsRT7djWZB6YhYVKgWkLxN5X5JGms
 zb45foCuuCTehxwB/XPLhJR6b4kt8KdVstjWB80kQXz1FYE1BdAr+41/wljrubyooVY0
 oFwuiYaNcm3T/hiYjWdEWYJGv7JfIHb6gpZHmMtZyTqPx2ibRjLyGTZfk4Y1i/poreK0
 Hn+T4S4kuhioNOwDo5ZluvsIafcsRvaKxq6lgwh48bvT24tIstv34ipBu1uPCz52s0l1
 0gwQ==
X-Gm-Message-State: AOJu0YzL1u7T0i2y7Grq1b7ubNFavie17U/EGXWJK0hZ3OsTMomIxB25
 IapkM5y56l8NXPn2brTduOI0xxESgK81b2xuaVunCS1y+vhiZjugHWK/tjZqpdo=
X-Gm-Gg: ASbGncuLQG+HEaQeXRfCQrdGyBPwYOGWGqffTczAQ74ne9F+nx+72qf2urHstTRyJEV
 GA8+r7oPUXc5cPRxer+feR4RY1qJ2pr516DRVr2eHl5XPG2XWfrSlto1PMoV5a1FKbDAwda7Svz
 yt8zCQtmd77aLcJWBpmkCWWC11j0xK8pOE9QRYuVMnFYhXXusL8wTYj2La23vQsK+yZRtMRrKCN
 S3qEvukLKadkW61n7i38SxBIS8x3ZzhPLUWargST65fC3KV7d++uy/eRY3X3CZbOk5gXyaaKT/Z
 3w==
X-Google-Smtp-Source: AGHT+IGgkNpBc05ccOXtavEiu9PB3goLoKJdoKutPLdyxpIQ28Umt6u9qU6JdmkJwtWwOvchkFmAvw==
X-Received: by 2002:a05:600c:4ed4:b0:435:d22:9c9e with SMTP id
 5b1f17b1804b1-4362aa5313dmr13933525e9.19.1734083782469; 
 Fri, 13 Dec 2024 01:56:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625706c77sm43616845e9.34.2024.12.13.01.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 01:56:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Chris Morgan <macromorgan@hotmail.com>, 
 David Airlie <airlied@gmail.com>, Hironori KIKUCHI <kikuchan98@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
In-Reply-To: <20241124224812.150263-1-marex@denx.de>
References: <20241124224812.150263-1-marex@denx.de>
Subject: Re: [PATCH] drm/panel: st7701: Add prepare_prev_first flag to
 drm_panel
Message-Id: <173408378171.189325.1503369050092401336.b4-ty@linaro.org>
Date: Fri, 13 Dec 2024 10:56:21 +0100
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

On Sun, 24 Nov 2024 23:48:07 +0100, Marek Vasut wrote:
> The DSI host must be enabled for the panel to be initialized in
> prepare(). Set the prepare_prev_first flag to guarantee this.
> This fixes the panel operation on NXP i.MX8MP SoC / Samsung DSIM
> DSI host.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel: st7701: Add prepare_prev_first flag to drm_panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/406dd4c7984a457567ca652455d5efad81983f02

-- 
Neil

