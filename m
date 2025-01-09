Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341DA076A1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA8110EDBD;
	Thu,  9 Jan 2025 13:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SBw7BeyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4773C10EDBD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:09:50 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-305d843d925so6434601fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736428129; x=1737032929; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j0uAJyV0MCSLa3CqCKocEYzA6cOV9ND8Id1bi+4Cgjs=;
 b=SBw7BeyBhohcNJo9QzWu9W3pZHMBr+5nzgNz9t6Qo8xveYF9XdqIglO0sKx4hJXWsl
 jedDrd0CnIclsQns4hwaaqspdgJltskXUWI7W4GeupAG0RZsZukbFLljtqMbamQ8yZGs
 VsGacT5ROfBpL45N2DWOOeYmZqw+qv+6+WMKLN5zjYtG0rAoJLoR8UUobhMzFTZq0eqY
 2b8eAex0qCDhp1HU1QDlsGiHTQWX4vMl+sDOILbMkBIG440qg42fLz/LAVVPqL+GDMBB
 l3sn/1nLwlMwS2Rs+Y0pS8GDffSHwzXNTYnkRQuVh6gZNfD6qLCjXiQUDaS3950cnEgh
 U9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428129; x=1737032929;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j0uAJyV0MCSLa3CqCKocEYzA6cOV9ND8Id1bi+4Cgjs=;
 b=XC/mJpRv9TUK0XpJRNZ+31YhPhDa56/5SxDNrloXLC4GBdRFPJ7szjkdUSx9NG5xS2
 NpD38d/T4+fm4VZoCwPwsO1il8oz/tWvyUytqNMdvaEUElR3XgJpDF5kxZGvyn+yjJp1
 KCOduQoNNhej8JVKSp+0txiQhC/TZH36rDzELAVqhxDIe1a/qZKgEoNuHsURItO5refB
 vIE7kfae7gV9SgL1Aarrk49jDB4/1l3jKzBM+KbadYMM1P0n67S+udok5IX38hLXzURH
 JgOOamFX/Q+sUSKSaJeQ2I+giUWYtuozCSOtCYMsZ3WSuYFNmW+dXewMH3t5GsYRBlw6
 0n0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq5gFxuuSnvD55Mg584IRtzM8D7LqpmhxqtTrfajDgT4VclGN0MwHl37c0ynd1HWKuiMGZHtnEIMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmFl88P3Y3SuvqtQY3FfYH+4wz4yQOAxwiFL497oMwst69/ncy
 iEVcGPn9Bj/odrJtHzIRusPX8KwTdyVQvkwQwGcQAjdqWyaRu7i+F43APBy1CuU=
X-Gm-Gg: ASbGncthlLRQijhTEqQPwGy0AZTTvduH6wBn13obLtUEc5YtKri3dWhX4M9h97bQNWh
 zyTX0pMldS1pmPGmr4NhvNmHHyqERyzmYVm/mFP2mgZQpOa2j75+CVR71DHF27KrFVDs3r7k6o5
 lfs0FhSM7toC8b1l2FLpqPhiZDhKL/JumwPV4kbFNStbNit3iIeCbXKe13I/oZXI3/6ZbIjynHh
 n76zzjF5Q12COTgI1MQ7rgJY++YT8tVEy+lY26CRZ1EqOUoX6DZp7KFfBdo9zD/q2qrFJPOoaAo
 ku8DR0Un1rI1HUj3e8mzhrCrnQhT4yE0n7wR
X-Google-Smtp-Source: AGHT+IFtX4jJUe2VbkJA3mydWr6V1t04RwsNa7wkTCeBFOq7A479EMqMF9IdbcSonbjhyHktbtoQ3w==
X-Received: by 2002:a05:6512:a8e:b0:542:2990:722e with SMTP id
 2adb3069b0e04-542845ba7b6mr1831371e87.15.1736428128676; 
 Thu, 09 Jan 2025 05:08:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428beaa6c9sm191306e87.172.2025.01.09.05.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:08:48 -0800 (PST)
Date: Thu, 9 Jan 2025 15:08:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org
Subject: Re: [PATCH v3] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
Message-ID: <ofpb7annntdpa7lwdscozaftvmuuat47juwn55x3p2osjsei52@bjitidem3g7d>
References: <20250109-fix-hdcp-v-comp-v3-1-1258edb249ab@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-fix-hdcp-v-comp-v3-1-1258edb249ab@ite.com.tw>
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

On Thu, Jan 09, 2025 at 02:40:08PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The loop of V compare is expected to iterate for 5 times
> which compare V array form av[0][] to av[4][].
> It should check loop counter reach the last statement "i == 5"
> before return true
> 
> Fixes: 0989c02c7a5c ("drm/bridge: it6505: fix HDCP CTS compare V matching")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Excuse me, where did you get that from?? I didn't r-b it (yet).


> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
> Changes in v3:
> - The V value compare loop from i = 0 to i = 4 and shall exit with i == 5 
>   if all V element matches
> - Link to v2: https://lore.kernel.org/r/20250109-fix-hdcp-v-comp-v2-1-7dce0a59523f@ite.com.tw
> 
> Changes in v2:
> - pull the check of statment "i" out of V value check loop 
> - Link to v1: https://lore.kernel.org/r/20250108-fix-hdcp-v-comp-v1-1-9404811825cd@ite.com.tw
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
