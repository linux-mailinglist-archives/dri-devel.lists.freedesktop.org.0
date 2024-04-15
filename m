Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2E08A4F87
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1638112532;
	Mon, 15 Apr 2024 12:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Lw9lLwoU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED79F112532
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:49:35 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4187c47405aso1766605e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185374; x=1713790174; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7YIJFnYRyaWXrPlltVrIgYB7IVIKl7WksqYGlHILtZ0=;
 b=Lw9lLwoU8u0iKIgzIY1Kb2vNdfw3tKgPIzhgeDnI62vISrYmJwoLqFsYfDhR/L98m0
 vcldF/oRUBHHJgWHZkn07pOabYUoJF32VSvrfeFODhdZhGDtJ6c1739c5OHOnO2eRYV8
 fIVsy5/97/42stgBPQ9ZK0fOTM+Tgf6AvEyxHiFkVOCiXDTZe1Rsx7tSsb80ag9pJo0/
 bNxFfiX7YR9J7WXpUrXs/pqOqBaG+9+5SKeXtTwLIFUNjReC9slq6NGo2KYyjHHOdrfa
 XE9yelPx2VBewTW1DGKzNUOxo8pFWBIUlZR+4pLqAoUG5zR+akwK+w4F7LOE9KGaHw6c
 DuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185374; x=1713790174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7YIJFnYRyaWXrPlltVrIgYB7IVIKl7WksqYGlHILtZ0=;
 b=Tvey2LIs+cPrgmzjplkCwFFYkouYOkI68+cV0XcgLv6lnV4JwNPRVfd9Wk2LezXvCp
 9oKUTDhDzf67VR3DkaBo3AEMqN8SeglV6hhfH6O32CRIgdYW7meracj/qMijSDdKtDN1
 WzlBBuSB2cG0Ra9kcaCiW3gtWeyrc19ieU8y2GhoTdEHNUwvHsrRYA+KTTUVqGG8j+fN
 +Ip9FL1erUCkvLftDJI/F2iCq3JK36HFYsbAWTpjfcMkjRslcU4EUFAD4yLiT9UXGcpD
 lmKoJIokYl/8WxvZwf/eHdKgQ68fyl7EGYxIl5rS7hzlDr4k+6l1wFmoetB6T1CeUdQq
 LU+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwyxbPEI4KzrfmiPRjyptVJL30HOwxVTEIyxkA2zlJFOWCfySEgkQSIcsPrgi8iFdW1OSZ2ZxNLjx9RtOlJUpyUTpmNmjLsXpNTew77DNp
X-Gm-Message-State: AOJu0Yw2WAbqcpqBGjbL6NrF+XYHNA0BfKpOpNQ+omOFcFRZdMShicww
 9Mk2Gjzvr+4doF81hvalkzZkww/FvhGIFsIJBEp5lm9OeJSWFv02h8p735nLkS4=
X-Google-Smtp-Source: AGHT+IERNVIb7kkkXkEPWlxI4SlxeSXGIdHfAlszM7dr954BuhwHUlim2WOUoHyibBjW2LFxYJ6i9g==
X-Received: by 2002:a5d:4e0a:0:b0:33d:fb3:9021 with SMTP id
 p10-20020a5d4e0a000000b0033d0fb39021mr6183299wrt.54.1713185374316; 
 Mon, 15 Apr 2024 05:49:34 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a5d4e05000000b0033b48190e5esm12005471wrt.67.2024.04.15.05.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:49:33 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:49:31 +0100
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
Subject: Re: [PATCH 05/18] backlight: ili922x: Constify lcd_ops
Message-ID: <20240415124931.GE222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-5-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-5-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:03PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
