Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B79848C71
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 10:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043AD10F83C;
	Sun,  4 Feb 2024 09:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YAd4ghw6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B529910F83C
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 09:25:22 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc6dcd91364so2748392276.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Feb 2024 01:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707038722; x=1707643522; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2SXF+EkSrrLNKoa2FlybzpWwNVCRg86hQFSJJz01/SM=;
 b=YAd4ghw6nERQpYPQRi1/2yiCX8LhxiAdjmSYZxdTdrZr8IKqwrxG/TAFJZRxGE6Jx4
 Eje8j3xN7ESecFL8eaqppNP2fr+1CH1qI9uShLf4/C5XXIcEWirxRw83R43r5n58F6kP
 mVLmbJj170bvUSYrBNPte53r7zzTbyJ0+zinhUUzpR3/wClCff6K1NGPs/uP1NA68uYI
 5/SnfBfzBk/W6J6E2ViwuBdd3wH7WQZm9B6UtXwpWIhyiUOj4GUEBS3hbGWjDRhnXi3H
 CM5HZ272H8HEUHARNdSJ2ozp8e4YjLTKkdSMzdDk8EVmgNMny64yqLQGxS/euTSPhdjB
 ij0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707038722; x=1707643522;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2SXF+EkSrrLNKoa2FlybzpWwNVCRg86hQFSJJz01/SM=;
 b=MhxEMvOwNhMgEQQMuqcVwJA8/IWci67WbtJEIJcQqRnUvXb6XQEDtLf/z1Qimmm1hk
 0rSzNOCvhcNy6w22+3QQmGI9p3iLSlC9i7f05tkaU5hXKaLZzDfYGY/BW+VplfebZZI5
 umbGy2eMlxzR5FH3R6WdrZSnKwcDYRGb4mgjNhfU/cr4rEBMBKm+fwUThLxKWQk+dbDV
 QyMyJ4sgI6qyFOY0hH3Rj5RZa5t/IGHd73r9XXeScrP6uk67dW2wG+u4pBPD/uqpsxLQ
 O8f2tVYogmA1ELCbjQhJZHwHN6W5BuJJcD1AmOhatihtzXGGnnDGfZM0exW4Elch5i0F
 jmtQ==
X-Gm-Message-State: AOJu0YyiwfgPJZIcUEAby+D7Sc+HOZGR0uv9NXhpkKUfQ4vOQWX7m2OL
 32P9bFseHjAcahMlcn4STmlCLx5MayL/Jp9Pk8VdcNIsa5xMWBlOT/sfkTZChCmOlcln2QMN+rL
 /XxJjeGyhSnCJPuCAAbqcFEOhgsncN1IzZq2MoA==
X-Google-Smtp-Source: AGHT+IFmzJa4zOHFO8ia/94liHzIiX3hsumeresJHf6afNJ6JvX8upG0PmXWdabKnDLxoS8igzBJqDPfMRtlVHNZa6M=
X-Received: by 2002:a25:ab68:0:b0:dc6:898:150d with SMTP id
 u95-20020a25ab68000000b00dc60898150dmr13819614ybi.25.1707038721826; Sun, 04
 Feb 2024 01:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20240203-bus_cleanup-gpu-v1-0-1b6ecdb5f941@marliere.net>
 <20240203-bus_cleanup-gpu-v1-2-1b6ecdb5f941@marliere.net>
In-Reply-To: <20240203-bus_cleanup-gpu-v1-2-1b6ecdb5f941@marliere.net>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 4 Feb 2024 10:25:11 +0100
Message-ID: <CAA8EJpqcYaN9fdDzWv9QFtHcaXbm9JoRYyoNxnMzcrHGV+nKsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: mipi-dsi: make mipi_dsi_bus_type const
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

On Sat, 3 Feb 2024 at 22:20, Ricardo B. Marliere <ricardo@marliere.net> wrote:
>
> Now that the driver core can properly handle constant struct bus_type,
> move the mipi_dsi_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
