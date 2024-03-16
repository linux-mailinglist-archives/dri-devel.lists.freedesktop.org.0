Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27E287DB1C
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 18:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C9310EB8A;
	Sat, 16 Mar 2024 17:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QhjTeE9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5263B10EB8A
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 17:43:50 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dd045349d42so2856281276.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 10:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710611029; x=1711215829; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gsWeHMlsnmIiCcbXCi3cYyDcgMUZ5WgQ1aeiRyvL3ME=;
 b=QhjTeE9mF6JEsP/c3L3DvZ69nVXssRTjSrcREMqX/QC/BdwTMo6z3ezXQEFvOze41l
 QFa0GZ8/9UXghb8yRSNtwUIRgU+HSaMPTJJlMlpSJMkCx7/FECUqyksy57A7DzScfhzV
 Xk7awnZHP50parFGLFZvZn88Mth7STq66Z9a28QyTh9EJEQ9BP6EgBjBrCCO95gyiibE
 auQTPx7MOj5U+ZIsZSDOIFM59PwYR27IUzJjXcjFuI6qxvDYeSDgpez+7orBxYbXXCgt
 SGKpJ/pHJX4cR1jA++vastxvTn27xepkJ4QKdbf3tdprjpyRQ/ZotRL/r1c/IJvT9fgj
 5UuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710611029; x=1711215829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gsWeHMlsnmIiCcbXCi3cYyDcgMUZ5WgQ1aeiRyvL3ME=;
 b=XVkkSzvlWiRcHhgy9/UYuxynEAVJ4sHJEPrJhfOVjYIV0BcgRVb42PZL+cRkkTNNAJ
 HnEW7D+6X6+njIn3lMqzmcoZZgz57VFplgcWyXHLveP16t/4dXHW9fD6/r6vO4WRxd2k
 IVh5NxSUe8gBi2L7UwFxBuAGWuwYqR+1SRpIzHgGDK79LCMMXBy1PGl+OvTFa06a7Gp0
 KU5fzJmUy2q7DkAoS56H8IkaIbc1Qrokn+3KfAQIQxsaK04V42GCbAqjFyyY2Qi861zA
 +3r9hPoTZlQ+VRj6q52Jn/v2if8mq27irLQpL3IQV6Nx+tG5OxOgQlPqyE7ThtkkDayo
 RbeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2We01HPu2pW2eBeYb/keeBEuBzfL0S6YiSh5IvQS4wUN/qOhUPrC5GLimyec7wrY+poumpxt/KEELA1HIJZThcRoItnSC+Qfz7qeDz9Cd
X-Gm-Message-State: AOJu0YyXaoPAuskANDYKLEkNeiZSTFX6+HL8FVBlE0HtgC6Y/zCbHwPD
 00YEb7ZYZI3Tk9vetv2kjx3/yKb8MH4qlIcTUs3lDU3pZ49RIdvPI88Wml8/5MkcgsDWVN6xlGo
 eA7u6qJeAPCpWsa7mp6eRTiMpgmCOXwnBuIq3iw==
X-Google-Smtp-Source: AGHT+IExfdO9jSTPxrxe8vINHAoaba+5RLEb/CrwPMl9w8ov4NbY1H+y62jLbRWoO2ccMbuLU5wzdF45WLhfwGzGacc=
X-Received: by 2002:a81:8002:0:b0:609:fc7f:1e0d with SMTP id
 q2-20020a818002000000b00609fc7f1e0dmr8150472ywf.30.1710611029128; Sat, 16 Mar
 2024 10:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240316160536.1051513-1-sui.jingfeng@linux.dev>
In-Reply-To: <20240316160536.1051513-1-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Mar 2024 19:43:37 +0200
Message-ID: <CAA8EJpodZhJQER+CEXHUD2H8nB4A4Z-u_ev1QOY-6xR-5GgvfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ite66121: Register HPD interrupt handler only
 when 'client->irq > 0'
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sat, 16 Mar 2024 at 18:05, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> If a specific design doesn't wire IT66121's interrupt signal output pin up
> to the display controller side, then we should not register the interrupt
> handler. Such a decision is valid usage, as we can fall back to polling
> mode. So, don't make the assumption that a specific board always supports
> HPD. Carry out a sanity check on 'client->irq' before using it, fall back
> to polling mode if client->irq < 0 is true. Such a design increases the
> overall flexibility.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
