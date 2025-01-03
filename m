Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C07A00956
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 13:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7920C10E33B;
	Fri,  3 Jan 2025 12:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IWRODqYm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD2C10E33B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 12:38:09 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-300479ca5c6so128414231fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 04:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735907827; x=1736512627; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lAuQK+/F0O4L5JCDNjDjHjZFUYnk5eRkhwBS+4Hmv8o=;
 b=IWRODqYmbOZa36mTGUzUPNs2zIiB7q/2el6MovtLZKNwH8wXXLegh0PdW5Rdk/Q7AI
 C1tck+vBi+E0pb1q68iL2mnQ3sEUOs1SuTMG++O08sD36qyfb8O9JBbYIrgqaHMd7vhi
 rnq4nWqv7PwGcJvUWO4KRgiCqvduNHOwV9a0H6h9SqKmDkojWwl0dN248hffvn2W40/p
 XzSBUb4Dy63CsNgQi4Jiix+1Fx3WSXIYoH/W/TV1g2qN+mm7NwTLtSNkAUUavoI9Pov+
 pbOyzBzbpHBbmKxkUVUhZDQUFhPI9w5SGOoMtm4DiTvR8Q4NCl3DfDbFBTGvSwxtbnqj
 ulEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735907827; x=1736512627;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lAuQK+/F0O4L5JCDNjDjHjZFUYnk5eRkhwBS+4Hmv8o=;
 b=WQVOLpk+o7buvkYGz+BHiwPSuiooMK3i8yRzBlkOsdUIbGQKEw4+EgPSrPCEDOd6x7
 2HEi1ieT9ggOzrDx9QArvLEs2iZf+OuUGlzRMJLkxSTrmz29VUiZqyTJ1hhkM2D0nBSi
 5Pd7JIuUGg5o7MXVPPaToE4syuJWlZu+4HMuY14aJhmEwwvixXDEfseWIKpUM/GFThe1
 TYjs9wqDqSZQaW2/7XlB/BLdq8jbbqI1Jkav/KVDs4sPvZ5qdsvV4GG98aFa9YIwEcoq
 NeuqvZDYDtNL2Kk8nqo5NFhYTDBwdbwF4Fo/vA5u9RVBwmgMZoTR15VL1P1jUm+bFrhK
 W/3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRG0KyutNRLFgJjyUwdqAvuvl9eZ6O6Bv2FivzSgfItWbk1yd9/VsbAdYvteOYsGGdq2SmDtiiEmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxldwEd4v7nVWxmfy2IbAyHkTjHM9tJhxI0+74eQfjC5sRzicgS
 DbAp+iRMCJDkmmYA0D7XcGLMFEMksCbbhUObHNcGUJX87FxXvrvdEnW+tL2gUn0=
X-Gm-Gg: ASbGncskySO5I+uXk5l57inzerX3XEOirSOh9Xib0iLTqfugM8yTW9kk4WAWXCAXuI2
 XmVx+IDuv2wWnVnR55WIdSoe0EBAjGY6zi5jNeP0NHEzfUk26+EiR7d18N63vmJ86cuVqm/rblp
 vXUAB10M+zH2/317z9jXJ/ZlYSnq8GNz53gLZxL/I718SuiB6BQmDZSR7VWILWVMBiSKEUJWDoF
 UW/0hoj6SK6Mrk13jPK2VEg7TEd102/P+rq+ZE1Xro4QLTWfBXDomGqDaZGn6vGk/XbXZ4zEst8
 i8koGrimm8bftdHMFxAB8cmwQobF7nhFog7J
X-Google-Smtp-Source: AGHT+IHkmAApyLZ21XYWu+WDHiH0q3Z12bKU9S9jrrq+R629xN6ISaSia7sHBryhTxvay+8ug/2ilQ==
X-Received: by 2002:a2e:743:0:b0:300:4107:6294 with SMTP id
 38308e7fff4ca-30468627b2fmr117244791fa.35.1735907827089; 
 Fri, 03 Jan 2025 04:37:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b082e47sm45659141fa.111.2025.01.03.04.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 04:37:05 -0800 (PST)
Date: Fri, 3 Jan 2025 14:37:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 alain.volmat@foss.st.com, alim.akhtar@samsung.com, andrzej.hajda@intel.com, 
 andy.yan@rock-chips.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, 
 chunkuang.hu@kernel.org, dave.stevenson@raspberrypi.com,
 dri-devel@lists.freedesktop.org, 
 heiko@sntech.de, hjc@rock-chips.com, inki.dae@samsung.com, 
 jani.nikula@linux.intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 kernel-list@raspberrypi.com, krzk@kernel.org, kyungmin.park@samsung.com,
 lgirdwood@gmail.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, 
 mcanal@igalia.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 p.zabel@pengutronix.de, perex@perex.cz, ple@baylibre.com, rfoss@kernel.org, 
 rgallaispou@gmail.com, simona@ffwll.ch, sw0312.kim@samsung.com, tiwai@suse.com,
 tzimmermann@suse.de
Subject: Re: [PATCH v10 03/10] drm/connector: implement generic HDMI audio
 helpers
Message-ID: <x73a2utr5sp4iffk5626zqfth4ayu3x4jkxd7xwjti7ehrgnzi@ploxx4i5db5h>
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
 <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
 <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
 <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com>
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

On Tue, Dec 31, 2024 at 07:49:40PM +0100, Martin Blumenstingl wrote:
> On Tue, Dec 31, 2024 at 3:34 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> [...]
> > > I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and it
> > > seems that there is only a single driver which uses the .prepare
> > > callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem to
> > > implement .hw_params instead.
> >
> > Yes. However .hw_params don't have access to the infoframe contents, so
> > I had to settle on implementing .prepare.
> While debugging I noticed something unrelated to my problem:
> hdmi_codec_spdif_dai_ops does not implement .prepare().
> FYI just in case someone wants to use your patches and feed the
> hdmi-codec with SPDIF instead of I2S.

Could you please send submit a patch to the hdmi-codec driver?

-- 
With best wishes
Dmitry
