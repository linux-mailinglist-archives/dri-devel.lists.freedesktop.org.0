Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE69A34B3B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5788310EB44;
	Thu, 13 Feb 2025 17:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FZKUh4aA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0407D10EB44
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:07:04 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43957634473so12378715e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739466422; x=1740071222; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DtQn4wgBm9cE7XQgLWrBO7BTmTZKoY45YwSnDy4FO4w=;
 b=FZKUh4aA+DaTBzZvbi1BU2okxdPyGh8RjEgkWkL0sgQ7Js0bct14cQ05QN2im+q7IZ
 n4ohfBrBjbtAymSZDvRO58oLWj4VNWyjbEpgrkJSUygSdrPCxc69j8kDahsTD+t/NGXz
 vOdsULblBB6E0RWnyxGHxJhQyliryxgxhjnCPRzz7QZuFId9mr81bpTriPRjKpDLqHGB
 P0uO8iv+/jkaAB5xFSrlpfNsRW27ZSKCkebrdEYL0oAxIojfkKhqy4SxSZM3zEwXOot5
 chILh0kb8rimNonqVF6yaQ9whchoJE3aQ07QhvdCbpWrVQYxoigOqHOHfSZyCy215nFT
 sgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739466422; x=1740071222;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtQn4wgBm9cE7XQgLWrBO7BTmTZKoY45YwSnDy4FO4w=;
 b=g/JBhe6EQHc0tzGAJi2Co3A6D5sgLYGBVs/kOYeyAE0hoePtH9WuaVUl65IdPaVMvA
 bU9hRcZtMkZG6ecj2o2Y7cIRJTx+/E0zbF/PPU0M9Id2qg/Dd37lDut5E75ttKR8d4nR
 f0ONC+DInPb/HX68PMLr18YLNIn4zBQJnotJPeceMkl5e8y2G2nHKUX2Oqm345pNsrU+
 Fb0iCAjIKUWvVoOrQWjCDbnSR4d0F9gY3LUpUHKmDDHgtyqL+uA5Y5WSRg0Yf2QCS8xK
 CBgTZS3t4hxwlkT6ga6xxOFpsx8XxYURFUlCgoSModFgkTGK960BwIw78vFu9pEL+Ofz
 U1Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM/FyT/DynS2E7yKxW20VM/sSaBTZ1q+KDcPM2kbZfqesKuCBaUN3pkWbXt3w+/rO2wQMJKomahm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUdyyYchsIFPdtV5VdMleFGQFxdva16scE8dPLyVk/bDvaBGNL
 8vKPhDI9anXciKem4I1RN18Cza79d9MEywfPiZAnfSxN7j4q5hefPcFwheUpU7c=
X-Gm-Gg: ASbGncuYGpMyHBtqpvjYyqes0iIEVFERhfS/wFhP8OAYWGdZNigF83d0zFW5cPGgkZ8
 PExC0vlR7UDnCN4Ka7zwR3G5+a49GRx7bkz3uuFttnU49HBR8YKmf/PIzpZDqsLntoDief0IhjT
 qxW+JfKaylkHbvzG8lZoA/tKwvhEGh119MXgbfmyy1i097Disb/5ZccsIMOISy8WSOzN1foHKeE
 rPUWmhjgWgagLGtk8QGL+uRHQFWDCDK2TiLf2+UiL46WcjU5rc+3q+NA9+JyY42779YZRjylYXG
 ZzKr9tpEvVSTn4v8G/eoEPXudEquaBIi045Y
X-Google-Smtp-Source: AGHT+IF8nhcp5YQz9TPZ6YIGpltlu/q9k8/XW67n8eICArykliM83NQmUsrzxgy/G3HVl38kAJ69vw==
X-Received: by 2002:a05:600c:1c91:b0:438:c18c:5ad8 with SMTP id
 5b1f17b1804b1-439581cab45mr88901955e9.31.1739466422435; 
 Thu, 13 Feb 2025 09:07:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f8a2sm53525245e9.2.2025.02.13.09.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 09:07:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jagan Teki <jagan@edgeble.ai>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Hugo Villeneuve <hugo@hugovil.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>, stable@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240927135306.857617-1-hugo@hugovil.com>
References: <20240927135306.857617-1-hugo@hugovil.com>
Subject: Re: [PATCH] drm: panel: jd9365da-h3: fix reset signal polarity
Message-Id: <173946642174.322382.4123111314998976761.b4-ty@linaro.org>
Date: Thu, 13 Feb 2025 18:07:01 +0100
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

On Fri, 27 Sep 2024 09:53:05 -0400, Hugo Villeneuve wrote:
> In jadard_prepare() a reset pulse is generated with the following
> statements (delays ommited for clarity):
> 
>     gpiod_set_value(jadard->reset, 1); --> Deassert reset
>     gpiod_set_value(jadard->reset, 0); --> Assert reset for 10ms
>     gpiod_set_value(jadard->reset, 1); --> Deassert reset
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm: panel: jd9365da-h3: fix reset signal polarity
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a8972d5a49b408248294b5ecbdd0a085e4726349

-- 
Neil

