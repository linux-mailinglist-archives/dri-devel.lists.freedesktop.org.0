Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7471AA1051B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 12:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D2A10E177;
	Tue, 14 Jan 2025 11:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ihVFhtH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BE210E177
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 11:15:24 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-303548a933aso43077001fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 03:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736853323; x=1737458123; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pw8BeCIBZaT6tMiaAyO6GUfBdQ9Fu02KA1B5DUwdDHg=;
 b=ihVFhtH32MJcj0Er/RqLxaccK5Cmm+JWsruynMmismt0uMJgHtoV9AmA8id2tOxgba
 +WQikL42ECa4lO7QjwOJdmjgC4e31iNGi7ixDkiPB9UFhZhd0cVuwRSSdkSOnG+CjJY4
 DQyzcwizElTFOKjubE7o2VwUB848FdQ6dvFNYkUmgO8HvsRkLBU+TW8zxg7UWaGiiKh/
 5lDVLW2tWDPDU9QAiwadt0wGVv9ES2PxvjyWH/LpZ65MOzY53ezv7yPdXPD8Q1ilRJBY
 j4P1geWWjKPh41AhjVL/i1CCryhot0PDUITsc+k1ww4Q8SSRgmu1hGxm/raZlzzIlcU5
 JDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736853323; x=1737458123;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pw8BeCIBZaT6tMiaAyO6GUfBdQ9Fu02KA1B5DUwdDHg=;
 b=fJps5rWoZhKmKzCILJY4UebsqREbtUfUK1zpfqdUqvPfCh6xm+7p02DZI7tKNJVukr
 iY42fYETfKzzHdrrjHBmLmqjcra0VEax79nbpiHhUZTamhNAQBnDwFC+H4YS1PbeJNPx
 g7PdmeKBIzIOiml76KzLOWjRj2LqlAIcwfN5OBx3upOhc+kVF3NxQABeBC33r9gMqdED
 8Kglle2sLhbD+lk8oQ93AaJ15mTMx1Dm+x9xK+46CcRLbn/Yd9r5C3a2vj3fRHWJ2OYa
 UdZBgn85yK6yab+x4jDF1L6tfQledghUoHx6/ScQI5IUNpvKhZC5+sqs9S9uafHLC2U8
 OROQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgHtKN/PfdNoap5lJlKNhoXIRG+p2XNvhLSWDf1AyL/EvlQlD8JkW/I7y22onz8hL6bIQvJHgmQps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwY1GooXM4GDyzja/Veh3kj4x9JxiERK+7Oc+V8u4cJeCzJmH/L
 FSK0jtSWbBVx/NJGNkrKq4NrsNkvjjXa8yDK3e/QOmOqsA6F1I3qCwUcsXfw03I=
X-Gm-Gg: ASbGncvebNPzqUekiHQLeFFJOMjtXn47QlW1IdXA76DvNfy/yv2YUmsOuE89kuGJJWw
 9W9mRSPr79tg7JboAKkJo7qSUVWdHiLYv2Y/mjYcb2fFetIpSRskJa3i2Ql4LLFG+TSeZf7y2re
 ulq/SQANg2O1MuF1h2Jj8+S7PEyIUIV8P31Kj2tz7kMFIzbn/j+QSqY4BILUcZcB6gB1kO4zRpM
 mPzC/mNn8AxDBeTIz7TOIC4LFt/wyDrPuaOuVRLpXxn3tQJMHAdsKgEXMtqkiLOpNXqpdRaPFX+
 bA0BPlURs4sHtNdf+3DpP4eIdsQUGAxg/qGe
X-Google-Smtp-Source: AGHT+IHvwbxEaJ+nuPZX9eQRG4LnwAtalfqKNK2UHATHTgf8NDLe2HHz3SWQvo7xSWrh9GkDUjknJA==
X-Received: by 2002:a05:651c:2126:b0:306:10d6:28b0 with SMTP id
 38308e7fff4ca-30610d62a97mr38198561fa.1.1736853323201; 
 Tue, 14 Jan 2025 03:15:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c7abbsm17687121fa.76.2025.01.14.03.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:15:21 -0800 (PST)
Date: Tue, 14 Jan 2025 13:15:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 10/12] drm/bridge: cdns-dsi: Move DSI mode check to
 _atomic_check()
Message-ID: <leu32e25lnc24qkyg5dkenj3sxzhys7tklmpgr7hfktl5fauvj@qd25yhwirscd>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-11-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114055626.18816-11-aradhya.bhatia@linux.dev>
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

On Tue, Jan 14, 2025 at 11:26:24AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> At present, the DSI mode configuration check happens during the
> _atomic_enable() phase, which is not really the best place for this.
> Moreover, if the mode is not valid, the driver gives a warning and
> continues the hardware configuration.
> 
> Move the DSI mode configuration check to _atomic_check() instead, which
> can properly report back any invalid mode, before the _enable phase even
> begins.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 87 +++++++++++++++++--
>  1 file changed, 82 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
