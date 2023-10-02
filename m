Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530367B4C5A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 09:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB9E891D9;
	Mon,  2 Oct 2023 07:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DCC10E20A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 07:11:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-406618d0991so23058025e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 00:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696230711; x=1696835511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1gpBRg7ZJv9bONpjZYFon//mF9X/YfEcB0KhU+2bLc4=;
 b=uLti+kIa+JNI4ktfXOEPcOfwZFPz2LrW2r01fJ8pHQtFfWEftfDHiq5vfHYkvc0jcz
 tZLRzu/WFBJgecWFLYIDD9kz8eka4qgQdokYMiPOcrNQlh9bk/7Mnd16ebHsSIAFU317
 EWzCg6w46QfBSpkNvX1qjqmI1llBsB6UbZeP15My1yGEuJLEK5sA2hBdHz9ewQ7X6OZC
 rQJsGy52mQGGze65JlmDQRnklXJqqUcKcbCEEeW0H0BSKQVG2ajJNGepwLaO4fYOBsT7
 WPYeMtH0lVs1M+MnXbr9iE+W+/wkz9ok+z8KXGHpRAjqg+iCm0K0hQoRWOs9MSpPHzQ6
 i5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696230711; x=1696835511;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1gpBRg7ZJv9bONpjZYFon//mF9X/YfEcB0KhU+2bLc4=;
 b=wunhDNLJdZ8jTCFggqga7QhvHZ+cKMjDC5lzmvOXX9OkJB3CMO/gQMvLTCJ7+Qi5lL
 CBWdZGfYtcLmDM3f4AJmsh3Gf0soFGfB5Ny2Icp1hXUch+XKVOmZ4Jrev4uADIUqWF0r
 67RFmhozt83V5dffnD3uNSZLlH/XfgGNHbryuh6TSuDgJmebq2+cl5Fu7nBef26KpC2x
 B/d0eZcyPr07Bq13WtVuO8t2S1+x+D+MsK9Bj+LsWC9z4SpZF98Ns8bbSh3sihZNoa14
 XmddrB9ujLHVCzOo1JiIaYSOThXCMhTGXAvmjEFncnVONVjjEKp0D+o+I2cxyWwMivLH
 62fw==
X-Gm-Message-State: AOJu0YyP8JKjJsfO+XQJI94SeTmW07vnxEiZfDY1snJBa6F7Ff81S29M
 CdF9w8P/KiqSI9ziCjawEuMpWw==
X-Google-Smtp-Source: AGHT+IGp6rwJzVjTX/tf1duHqs0q+dcoTcEZFTeqfoXaR3JpTTDM5NvXnCpyrxSyqudBktuxzyenTQ==
X-Received: by 2002:a7b:c394:0:b0:403:31a:77b9 with SMTP id
 s20-20020a7bc394000000b00403031a77b9mr9263029wmj.37.1696230711513; 
 Mon, 02 Oct 2023 00:11:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b00405623e0186sm6601371wmj.26.2023.10.02.00.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 00:11:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20231001-drm-lt9211-maple-v1-1-1cf74fb10991@kernel.org>
References: <20231001-drm-lt9211-maple-v1-1-1cf74fb10991@kernel.org>
Subject: Re: [PATCH] drm/bridge: lt9211: Convert to use maple tree register
 cache
Message-Id: <169623071069.3600226.16796485948138602876.b4-ty@linaro.org>
Date: Mon, 02 Oct 2023 09:11:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, 01 Oct 2023 11:24:49 +0100, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: lt9211: Convert to use maple tree register cache
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=eae0cfcce3cd10a9189bf46934de9bde7ad7b2d0

-- 
Neil

