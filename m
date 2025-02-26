Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4436FA4560D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DBB10E85E;
	Wed, 26 Feb 2025 06:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P/gj5wy+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3899110E85E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:53:07 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-545284eac3bso6250770e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740552785; x=1741157585; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=28luXvOgctHQWawFquRNOLl9O0yELRtq1uClua9ph10=;
 b=P/gj5wy+550ls0O2NVIqcVCI/iwwkdQtjvyL5Lu4reF8Ox50t6oLYWudxHA9KAiXSR
 GJEhNEDIHqvNEMgkYXBiUx0msIPsnyCMdnmtVGcgJXSa4OSE7APab0Q2I5Thtj8Mocuk
 XHZybdUyhwHZW61FrWen+BSDAlRftCHAdzb0vTPJII4hGDHUqgewjreOgLaE+Rk0++1L
 n+hx3/ZLUt6nGQYdac/3IbijjvrW8hJFb0lL+xa9vZ+O047d0zEh/XNfGQR1ClWoFK30
 4HB6Ort9NuD3cRGZJ+pGSb5oAtj4OFaUZdFUuNfgWhv1fMxVuqPnQRLkZODYGTzjM5X9
 gJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740552785; x=1741157585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28luXvOgctHQWawFquRNOLl9O0yELRtq1uClua9ph10=;
 b=LN7EH1w0e8Mv641/l4704SyfpIQx3iwSNWNFIqqHKqNLFN4RYSkKbyfjORbiQdgqfp
 yE0m2xHpfhOLwM8xLNbDovh3pAFFp+t01TOKbjbNCkJyvMchb3dcm4HwmRI2QidS9Fox
 pV6/Vk81jeHu0s1g8vKJJDfxFq4njO/3FKbev8ZNmS6GGb6X7ooX16Tpk01DZhfHjBJE
 f0K4YTSuvcEZS1nulUR+c8+JHfTRvUvnFp9xJFXTlc+0vywPA+vrABJUj4Qfx3jHDxB1
 sDQ3FwfMHemZJxL+avpbqlfTnd1xwCNoZNzCRJaax7/0C/o1YTTEuacRSku6k9ZndmHC
 5sFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL1Oz9BcqcKZj42NX3DZidFMD95NIUj1UCcqeGIAPhDXeK1iWVcjyQRsi1PoZ/7Xh8RF5lVp7bGJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDH5BkOkLw84ZItlKYyrcPelSEkArxbHIV1egJFD+Xj0DY40sC
 4BP40gnd4sPa2BDkBxfD9XWelSbRKqHsDveWdI3WJPYYPJI5yX+hGrxiVODCpUk=
X-Gm-Gg: ASbGncsNvOWKHYtoInx2i56eGnsN2DSDI1BvjexBhdCGvyKRZu3u+rSPMmK7JQK6IJX
 D3PeMfUNq1fqj5inZK6Qfb0uxr/wrArV0lrAFBdZTcR5OB/dPJeruVFXS55ydbwbDxr/PQZwOMn
 HNaamWtREhbu1m99bb4SXwuEtx37oZaSY7Z+M+llbzmqIGF1oB0FLrS4fFpQFIFWMB6gBSLC7E/
 XfhbzRGIT966WFsW5FKvyNWxKFmUiYfKPmMdSNK4tTfimimgVvMddjDro/uGbWSKTGTaromuX5Z
 sCpti2CTj8pHzV28Zp5Gfhnwn7gpGJ4kUSa4e9ZFJC1EV1lMwlAQZxPdqOVaao5lqIAj1juBLyq
 ZY7j6Xg==
X-Google-Smtp-Source: AGHT+IFCrSAXRtytHW1OItp1zy21zcNGHfM8HjDcDTQMkPiyBILsALZmkwg/zbIgag2vjhpeWv8Dpg==
X-Received: by 2002:a05:6512:3b87:b0:545:1166:21a with SMTP id
 2adb3069b0e04-5493c5aea9emr2149557e87.39.1740552785496; 
 Tue, 25 Feb 2025 22:53:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514fa070sm357764e87.236.2025.02.25.22.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:53:04 -0800 (PST)
Date: Wed, 26 Feb 2025 08:53:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 1/1] drm/bridge: ti-sn65dsi83: Support negative DE polarity
Message-ID: <j42iq7ujfbnemcwnbfihasnoirnvcdokvbxiqr23gnj7mq4jc3@tjxs5yjpli5f>
References: <20250225135114.801884-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225135114.801884-1-alexander.stein@ew.tq-group.com>
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

On Tue, Feb 25, 2025 at 02:51:13PM +0100, Alexander Stein wrote:
> Polarity for DE is stored in bridge state. Use this flag for setting
> the DE polarity in the bridge.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
