Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E9889DEBB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA82D10E82A;
	Tue,  9 Apr 2024 15:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IrZK60od";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED94A10E82A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:20:14 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-516c97ddcd1so6688048e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712676013; x=1713280813; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wtt9U27FyEOGR2UTmgVGfK4xgQEk5CAqsjVixP3DF/w=;
 b=IrZK60odFyeanX6SfNVbD8Yul/94l51exBileUAqf8Z+LfUi3j6T4bnBlzjYl2e33D
 YycTHiAmWZiReVaeSo5TUucY5LNKW5K4+kp9gNGQLrjBoqkknu+dta8KTci6lRiKaM97
 hMckeqAp3eRhKNg4och2RWgn11eKlNZYyUNODdByzJOvGB5D1nfgBWNgHaM+0T0BCFcB
 VGya6+3PviCyklCA6/+D1p5uYKGvBxpmRA1/vSeot38FGG6JhV4ktFbh0H5Xo68ZWuSo
 KXDJZkBiQaa4PNbuGwKqapvjZYmlJd89MVJp9wFLRvoVa28fDYygRwB1EZlQvoIIor4Z
 sRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712676013; x=1713280813;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtt9U27FyEOGR2UTmgVGfK4xgQEk5CAqsjVixP3DF/w=;
 b=Kx1lFNGtFBXc0hfzWNZqW12fhac9RI65+46JYSxf5riwfoKN0RyLHUFV7eSmh0DwIg
 rz38zPGIgIJyp6m45HJuXS7KOvWQ8fU5ucPrZhX0ct6qEG+s0o2EBpKYNA6CP5EqFYz9
 47y9CdUMoIomtLeWZRG9ZEBqI4AUIzllOwvbLygmGvPNYmIJtjKul5+SkSxEDtd3NIfu
 fhd3HQNbwGRzser5ebkLC16R7I38pU0PJ6CNDhY4m6eWr8wy1cNrvt5iky65VXdUFK/P
 ugx2arQ1PU5mPYhae+8M/pnlIv8U5+KbLUxA+CROpGqggVWK/pErLEbw+kMBxlKdAEOV
 TmKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVYjjuzb+c7J5fM0i3AV+LwKCMOZzZU1F6GiTVIlrwhuoHQun2a0cPnv9u0GBJHkMOXOex4ESlMUnVRm2mqDydvBbwFc17KdYLvcaLlZlq
X-Gm-Message-State: AOJu0YxGQGxaVMJkSdqPbtwV1CpmheSfXGfWC7SpwrXbdJ7S/bTRsQJJ
 7UnJ5Uvm+5XiyJpSeV7cGjevusKZlaZ+2iIUGFln3yL/RXxyrf/jKuKoXReMbcs=
X-Google-Smtp-Source: AGHT+IEbgIn2OIRwkwITVjmw6EZrqXvH3olaMg8+cdnia4vD5koE/fQGisCSUgSYQbVCEURGO7OVmQ==
X-Received: by 2002:a05:6512:459:b0:513:c60a:5fc0 with SMTP id
 y25-20020a056512045900b00513c60a5fc0mr7405646lfk.0.1712676012907; 
 Tue, 09 Apr 2024 08:20:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a196b04000000b00516c247fc40sm1560288lfa.222.2024.04.09.08.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 08:20:12 -0700 (PDT)
Date: Tue, 9 Apr 2024 18:20:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, matthias.bgg@gmail.com, shawn.sung@mediatek.com, 
 yu-chang.lee@mediatek.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
Message-ID: <oe75tx35rd27r2a24ofdxfaqwr53tylfp5fwz3nrwc2uz6nmrs@vwc2krbpy3fh>
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <20240409120211.321153-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409120211.321153-2-angelogioacchino.delregno@collabora.com>
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

On Tue, Apr 09, 2024 at 02:02:09PM +0200, AngeloGioacchino Del Regno wrote:
> The display IPs in MediaTek SoCs support being interconnected with
> different instances of DDP IPs (for example, merge0 or merge1) and/or
> with different DDP IPs (for example, rdma can be connected with either
> color, dpi, dsi, merge, etc), forming a full Display Data Path that
> ends with an actual display.
> 
> The final display pipeline is effectively board specific, as it does
> depend on the display that is attached to it, and eventually on the
> sensors supported by the board (for example, Adaptive Ambient Light
> would need an Ambient Light Sensor, otherwise it's pointless!), other
> than the output type.

With the color and gamma being in play, should the configuration be
board-driver or rather use-case driven with the driver being able to
reroute some of the blocks at runtime?

> 
> Add support for OF graphs to most of the MediaTek DDP (display) bindings
> to add flexibility to build custom hardware paths, hence enabling board
> specific configuration of the display pipeline and allowing to finally
> migrate away from using hardcoded paths.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

-- 
With best wishes
Dmitry
