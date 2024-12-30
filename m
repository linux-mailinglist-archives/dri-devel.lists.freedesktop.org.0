Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344479FE5DB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 13:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1921410E4B5;
	Mon, 30 Dec 2024 12:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AkB4j01w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A001110E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 12:34:10 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5401c52000dso10465678e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 04:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735561989; x=1736166789; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sk7KZ64g3QjSKBcPqpBugYd5y4zZQVTOsSnxLt9QvEM=;
 b=AkB4j01wD6ruvStHR/Y5KSNZUbVmK9gPzWe28Vki4H1N5rJ4wi4VZrdgfWbF6bNP8r
 8nyaGjs++TXlPvUjDtS5PhUyQjesFl2FkWMGU+xRI25ED9ioix24O2t/VNS6h60PX9GV
 WDn4SHKy2on3ZqbrKWj95iGeAtbIrMVF9R/IOrlCsnwg+mjIxP3+Z8P7JIoM0Vd6uMG8
 NaXDYr5oVlfEOEvuY7n458M8khkDJcLQ6fjQwl+V5AQeHa5rfaPD1L3GmukEXMgWX+EN
 Bxg4Cu73C0pVkg6DrxbnEmj4elie8u7KotF1Szqe2vsGYHQe8Ai27ASvqitt+lgkvcFE
 ySdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735561989; x=1736166789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sk7KZ64g3QjSKBcPqpBugYd5y4zZQVTOsSnxLt9QvEM=;
 b=dY9asc7aq3VHZQV0TI4JrlZvFGioFiiVAKK5T3TnUnBwtbhKF2s8pR3XwZmyVlGBso
 CbdvuxFt/sCke+ylf3bOVHPql7TsGrocNHz0ZXmUR+pervrNqOiXfqNi5ocFdnAfMBfl
 U8KOCRqLzi0AiKKt769d/DIqiYb5HNs0zg9AUfqosqKKVZKsxLtdWWbrQvy6653mUBbG
 azhjBcLF1Dd4wG/qBJYEoU91GI6JZKCZ3IA/YYPNm1Tl/PerELoRd9L3vLULoPLywjL6
 UFM0Q8B/LPag48XEtNDlrhVxgHziyCqEiyf92YqsAx+ZGejHc0IiBKG/Qq/y6Hus06cL
 jbeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg2RlFtS/GUrFKlIU4c9N2epcftE8EbERE4HkgRZyBw3V2O1jFlDhVx3MdIzGAmwzxlcEUe4wjdRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYHNly0ZicS0YXppx20xFNm7X6rJI2jDcs8UDQLOiG/XdayoFy
 25nKltHQr4CD1mWtgbrasojfxvykj5qeT2AGAfSN5ov7AzLLd9NpA4rCSQILzXE=
X-Gm-Gg: ASbGncsIfN58/adFhhW3sDuSj1mp9dDoBYkVay0lgHcRaRcDsdCvpvglgTIzUFvlRHE
 Rz3K8hQKktmVP3iLJ3S7m00ca/A3ohVNdPQsQt9nER7UinqJevcp6rf1yno1ycF9hWrdSRGTIjA
 VJHYasT6lgjF4oJdzJxcWUIL3WzS4VXiIj56G8PktbYjAFyjm2q6adn1etbV3O18OWbAx316bOF
 1+ptwzzPSTDt38Q+urKgEqRoEd/Obi/s2SKJrJmNfE3iRZCmd4b73fkU4r3TGkah8Nzotgeqr5X
 d1OUVy4HCElV3ViXBnyQxAJOfFgR1ER8E1Cm
X-Google-Smtp-Source: AGHT+IGzkRgSziPMi+OuvqqF5BpICe3Uj4EKlYJrSjSIBpngZHhFVUrx0eOYogAtQxS8zwZb6NLAVg==
X-Received: by 2002:a05:6512:2246:b0:542:2e04:edd1 with SMTP id
 2adb3069b0e04-5422e04f073mr7912458e87.42.1735561988824; 
 Mon, 30 Dec 2024 04:33:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238135basm3125829e87.130.2024.12.30.04.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 04:33:08 -0800 (PST)
Date: Mon, 30 Dec 2024 14:33:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 04/17] phy: phy-rockchip-samsung-hdptx: Swap the
 definitions of LCPLL_REF and ROPLL_REF
Message-ID: <ru3xpse4mg62gcxemut3zro6qw6v6firjnefo57k74n2ti66ym@l3pe2hpz5csl>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-5-damon.ding@rock-chips.com>
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

On Thu, Dec 26, 2024 at 02:33:00PM +0800, Damon Ding wrote:
> According to the datasheet, setting the dig_clk_sel bit of CMN_REG(0097)
> to 1'b1 selects LCPLL as the reference clock, while setting it to 1'b0
> selects the ROPLL.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
