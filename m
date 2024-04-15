Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44D68A4F79
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14F7112534;
	Mon, 15 Apr 2024 12:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="irkMiK6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AA4112530
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:48:48 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41879f3d204so2432425e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185327; x=1713790127; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fYBgV11sH3JLVboFSXkJgCoU/xJb2f3Jo4YenY/vo9Y=;
 b=irkMiK6rlewC8yOxxsj9TCOgb3RXB3j0gCduLDns+1Hem4f5txEIh4B6jsgLnWeFcb
 snYKvU6mcCclojxAGkCmjkKAfBOQZUictpcLo2dOPasVHwzrc4ZPVj2+TJxmXPgAGNf+
 M3B0sZ6aOSv6SmQa3cTlnf6c3+gOXOO27g9Cj3sRj28l0FZV0aLXoXPIvNCu4XlTuL2B
 bCSD6N3vwkzjfs9cnPwDyFxokOTmwSMBeaRoyiYb5zu5/6z+l4+LIz2gPcHdkKS5TZgD
 NBplFgxyc7DNaY+PBEvNi83ST+s/O1PoK5+5EsWJinlVwiAITos94ZluBdxK70tBHfdJ
 d8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185327; x=1713790127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYBgV11sH3JLVboFSXkJgCoU/xJb2f3Jo4YenY/vo9Y=;
 b=lT+JZ67T7a0nJFsBBoz/x/qHS2Z/lT7IA85BwES9G4h/QSiifR9FscNArQXv0/H42W
 WdwqTyagSrr7/n64CQc221odGKUmBmXG8QLTUYWXA0EvyuyV6fNfT2Hn+EzXjEau3AXJ
 FA+zCu0WwTTXJcSyEIsntJZKcxQvpoAHeOMmzx8nN+ZMz0+RSLRLHNLFvr3dIh96LbCX
 1X7nVfFapqWnCCg2c/TEMWNzlxcMoyztbOPZSFU0uNcXijVlzRysjjIdSPntRFphUz/I
 aGEVtyN+TsZhggnDPuUSkb7Ke8ADAGt1iuQNEe5Ta1f9srCvDES4mYloKdLuasLVIFfW
 HZMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8tk4OdsDghjQ89WK7qWWxrjzcV0Y1V7vOq7JvycwqKtxiRIY1LtS6VrhfL3ZICgJtoHv+DoReSoLgubQ7CDZazvUa3FaQd8yHGfND3cPu
X-Gm-Message-State: AOJu0YxA2DxMExlGZsDgO/BYCnNFIlSyk7CBSU/HiZGEiG/qjcuPtgpN
 UCqzp3GWBXqB63jXFO4NjdcJcaCxs9KoCfgnuRfeylGi+5+Q9zxR+rZlENGKiJs=
X-Google-Smtp-Source: AGHT+IHAa4VIIZPfYQm1PVHVmrI/agaXvepugvesuVkXOga7yarPxPBfCgzSQL+8bsNFdokUf2ibJw==
X-Received: by 2002:a05:600c:3511:b0:418:3f54:1132 with SMTP id
 h17-20020a05600c351100b004183f541132mr3484001wmq.12.1713185327355; 
 Mon, 15 Apr 2024 05:48:47 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a05600c348d00b004186eb69a55sm2411188wmq.25.2024.04.15.05.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:48:47 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:48:45 +0100
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
Subject: Re: [PATCH 03/18] backlight: corgi_lcd: Constify lcd_ops
Message-ID: <20240415124845.GC222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-3-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-3-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:01PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
