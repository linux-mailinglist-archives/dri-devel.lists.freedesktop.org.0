Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B798A4FD4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB14211254D;
	Mon, 15 Apr 2024 12:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vO5Ut9mU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF0A11254E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:55:20 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41551500a7eso17427395e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185719; x=1713790519; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w28Vgzy/l8vd8BHW49TVBr3mcKt4Lu6grGdOVajJg6Q=;
 b=vO5Ut9mUrL9x8UYOXJPmLIWKclAloLbjUPhVPVgZBbL9Nx2gnOtD6/yi1nK+Zo+uD4
 NgJ0tAf0RWjyAx988g539KBhixEsKasNNIPLCbrsTo9ZORsf4VWrc3sSNmuv1hVGTuh/
 9gTYzP0rQdUIMlTWQIyB3YzfMX2fYcBrY5Aivgmagb7SlYIKsa9VSsDxYI5zceVZPUVW
 E05Ibjf0HMbzBrAVy0CcbXg9zVDgL8tyK2/AMDCDmxJB16Y1koYfPbya4/KDCvqLvzE6
 JXb8tPlWi2psDL9I9NaIzsCr/oJdwE3aR8GCw1FEgxxKw5wwTX6HzqXI2KVQsVhY4fdb
 BQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185719; x=1713790519;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w28Vgzy/l8vd8BHW49TVBr3mcKt4Lu6grGdOVajJg6Q=;
 b=Es6uGGLjRn6NyA/HJ4vFvTZSUGdrxTFQJVdVTWU0dDC1qk4TL/VkQYu9HYMJHWRh18
 WvvGACj9kHgDt9FYysBgkKraA/iMIoL+4VeUW5PzAP2mhdi+CmVsVqzVNT4VSoFmT1h1
 0qwHJwDShCjkUAs3/cBAuonZz+r0injiYVyAQI5Eo2+Aqn+UOfG9qrxv/KVYWLC4Od5r
 Naqku01qrb2+Z+5jbeZNzcWaLJnf2AhIPz0YLcEiTZoDtNYt/ocLCRNuNUZ7N6OnlCzO
 tza0zy1WRQS+wK5y7pkollQ8k8c3s8hFplSiaOl4Lo6PsjwGSN3UL0D7SjCrK9bXjEmc
 KwRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVMhwRfbCED4TIzG9MjzukgfOv8Q3lWPaFRREYdzHmjdfITzr8j2yZphCkQihN3wWis1zsxGJ4woLhj96iF/73is+PLY+ChZsLYSk8jvOW
X-Gm-Message-State: AOJu0YwkkeTmeps9qI0Yxp254mbDb0m3nw3TfM788wbeNTAqaejQ/++0
 mma5FzCDp08eQCLP4MXqxU6hk77mj8g3mv6JY2CaW22A1kN5RWF+Dc94whDsm+4=
X-Google-Smtp-Source: AGHT+IHtbwzdHFlfRbkSxCve8iZ6ujqhwgWjkWmq8yTpU351E4Av/06V3X/v4naeroGsr+pFHM+HYQ==
X-Received: by 2002:a05:600c:3582:b0:416:9cf8:cf05 with SMTP id
 p2-20020a05600c358200b004169cf8cf05mr7326072wmq.18.1713185719212; 
 Mon, 15 Apr 2024 05:55:19 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a05600c45cb00b00417f65f148esm13117334wmo.31.2024.04.15.05.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:55:18 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:55:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 14/18] backlight: tdo24m: Constify lcd_ops
Message-ID: <20240415125517.GN222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-14-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-14-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:12PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
