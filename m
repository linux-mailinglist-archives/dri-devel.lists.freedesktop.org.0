Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789A542B61
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3820610E4A9;
	Wed,  8 Jun 2022 09:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83D710E4A9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:23:39 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 p6-20020a05600c1d8600b0039c630b8d96so382242wms.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8eV6nIYV8SU6cGKfjJH6IuBQJkesB4s+GfYeW1ujbBY=;
 b=yfPJviBzBPAoWfqiRyBev2YmtSekag/ce5R4TXWS48H1P/Evi7E5TB4vT3PR3E8aj3
 W7V+yIRePpReAEdegxUDxKd1K5j3YcZ/X9I2dg95aREfa2ooixPGrI4JNbofdS5Sq1cJ
 W42F5YcmUZk2zJk+QQk0+MVdp0O0W1Pk01mKCNppDXZyCUkjqBW10RbxyMuj7ydHz4dZ
 PfnejUW3iyyNEIkJcCSwpK+9Ki08hmTYbDfedqOsRj+WbfyXvmi6OR4qm+K/cObXS/t9
 HYm9o8wLPshlOpW4G0YGfzNBC2K2TstMcRLWAUaLgN+v2Db+PnvZLxiNHb1dAZfixesi
 jIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8eV6nIYV8SU6cGKfjJH6IuBQJkesB4s+GfYeW1ujbBY=;
 b=1xlBPRG+DrKli94AmqsijfIUkMbknGdluuCZngM8IeYLu//svG95cYvQcuvTyAcu2e
 uAzR/TKHp29LyjkFDTaA/nZzStSRKe/EMNCbeIHcjArUKKY7Vj7mf5C0LEfYc21WTOZV
 XD/vESC7xwWV5di3ipF+10KO+Rz/w1LktcBjFtKsCj6JtcwxkH/INQDeLAuqKRZz2Q34
 rdqCltCweFYpS6IipupyPlwhHq4pEO/iC3SNEp+nYR89SnRChAKJOua5iuL5WZpIbT9d
 uu4MSiHbMdPlBk2r1u7Bg8LYYjoVbrhLpG9jTqjxZf5ufE2KfsYOaL4B+HN4J9p32rwm
 UDLA==
X-Gm-Message-State: AOAM532zgJPTIcaKVMTJ3Jn5IdFcRi5yH1l81SACSCZGrUjA3lXeRtue
 TY0b35xHZjk4JV6EebHvpy9UbQ==
X-Google-Smtp-Source: ABdhPJyM+IflvMN2gKuuxgwYkvwPOCyEfY1Cnbc1MlR6mjMqp5ng/HykRi2LIV6jvv1XqHQatPbucg==
X-Received: by 2002:a7b:c5da:0:b0:39c:542a:a07b with SMTP id
 n26-20020a7bc5da000000b0039c542aa07bmr13928306wmk.83.1654680217388; 
 Wed, 08 Jun 2022 02:23:37 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b0039744bd664esm27578721wmq.13.2022.06.08.02.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 02:23:36 -0700 (PDT)
Date: Wed, 8 Jun 2022 10:23:34 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v2 2/2] backlight: rt4831: Apply ocp level from devicetree
Message-ID: <20220608092334.23srjgxsjmj7mwer@maple.lan>
References: <1654677674-15417-1-git-send-email-u0084500@gmail.com>
 <1654677674-15417-3-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654677674-15417-3-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lucas_tsai@richtek.com,
 jingoohan1@gmail.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, robh+dt@kernel.org,
 pavel@ucw.cz, lee.jones@linaro.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 04:41:14PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add 'richtek,bled-ocp-microamp' property parsing in
> device_property_init function.
> 
> This value may configure prior to the kernel driver. If it's not specified in
> devicetree, keep the original setting. Else, use clamp to align the
> value in min/max range and also roundup to choose the best selector.
> 
> Reported-by: Lucas Tsai <lucas_tsai@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
