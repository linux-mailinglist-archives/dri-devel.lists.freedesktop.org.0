Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268D09B838B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 20:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9576110E923;
	Thu, 31 Oct 2024 19:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gq1/jWPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD9210E920
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 19:37:53 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2fb59652cb9so13075291fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 12:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730403472; x=1731008272; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xY8BKpUlX8dbSzUZiaXQFiaPQ0R16ABPPrXeZ4QjIzY=;
 b=gq1/jWPTOIP3GL8YPuj6b6bUdz9AceH5DnH10oHOSYLiHn9Od6i3djKGsnWW8JCzjF
 NsF0iX2QD81B9kbJQTkQlfRWZnVxgDMJN0V4IUPlrWoq7Eh1vsaNA08g0d3oeH+kXekM
 N+8Jx5FJaOKYAR0hI1IAVUHBm3EGerDC8GOXTr+mMhgD3gvaEAcPU4NZ9Jpj9t7tPbGX
 C0cEgEweXaiYoDUBI5sBzVlTkn0bTOesJUbaCUuZecJg3Bry9nQqzwdimjuco7mhCgKb
 TIZKlMdkvgwvWfEmXsAdGdJ73ohGbv+if8auVZsf0halaCKjPHOu+ABAWmJFodF+z6qc
 jfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730403472; x=1731008272;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xY8BKpUlX8dbSzUZiaXQFiaPQ0R16ABPPrXeZ4QjIzY=;
 b=oOPfa392y65ENgWPicN0GHlH+WVQIcgpKlHUi/Q/cXo6hsGyMbZDQvk6KXlrVR6o2q
 Xsl3GVUDO1ius1PrNn7UuL7a9k2/DKMBOQPUJrpN4WhhTD5uHmu8YuDnqivaNoWE7Ssr
 i5fZxJc16aH6plVGMaRrkDpowLH25NktwEnWDOEvUf4NxvdXUs43W5Mj/J770Xg/XQSp
 06yr+dwhoL8icOdz4MXpnWCaV1MHxAtmttkQShvxksLvjbsGuucKtgLUVlvW3uf3SHHv
 d9ckmi7gt/hU55B462nFFEGf0gMzd0Wz9O7NIcmP4Zec19LfeBIXIB2J+PZCpZohPsnD
 hIKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWInHUKPxO+1Fw3o7nEc6uyPTkLYvZTHV/NoB1ioQ2LpSxP4qDtOtvcNaNNld8u4YoGu6IxAyiO7FI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK3dvwC9saNBsMasT9eCn5RukSwAgPKxcZ1poCiuwKmMxLtuHZ
 P19/qwqZJdPb2Dh4+AZeybrGk/5Vp3LRbEv1H8CyBEECPs7uRQ9S+KYHkqPuzTo=
X-Google-Smtp-Source: AGHT+IEEfUmTLPeg9xVuEZGEbyZoSx7BjCxMcZYz1YD+L+1zvJUGzjkwJa62fHfBLyTlAdyjmcsXwg==
X-Received: by 2002:a05:651c:2229:b0:2fb:6027:7c0a with SMTP id
 38308e7fff4ca-2fdec4ca559mr25802861fa.8.1730403471954; 
 Thu, 31 Oct 2024 12:37:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef8c390csm3099771fa.112.2024.10.31.12.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 12:37:50 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:37:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: it6505: Fix inverted reset polarity
Message-ID: <5eic3qpeocp54my5clu3umigog6fe5zs5drpbyzpholmalcmcw@mh25vgvxd5tx>
References: <20241029095411.657616-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029095411.657616-1-wenst@chromium.org>
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

On Tue, Oct 29, 2024 at 05:54:10PM +0800, Chen-Yu Tsai wrote:
> The IT6505 bridge chip has a active low reset line. Since it is a
> "reset" and not an "enable" line, the GPIO should be asserted to
> put it in reset and deasserted to bring it out of reset during
> the power on sequence.
> 
> The polarity was inverted when the driver was first introduced, likely
> because the device family that was targeted had an inverting level
> shifter on the reset line.
> 
> The MT8186 Corsola devices already have the IT6505 in their device tree,
> but the whole display pipeline is actually disabled and won't be enabled
> until some remaining issues are sorted out. The other known user is
> the MT8183 Kukui / Jacuzzi family; their device trees currently do not
> have the IT6505 included.
> 
> Fix the polarity in the driver while there are no actual users.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

The datasheet describes the pin as Active LOW, so the change seems to be
correct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
