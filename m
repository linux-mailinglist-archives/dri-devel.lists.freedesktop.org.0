Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3448AC7F5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 10:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A4610F0CB;
	Mon, 22 Apr 2024 08:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="arTOujMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9AF10F0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 08:54:31 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-41a5b68eceeso4020295e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713776069; x=1714380869; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ojlb8Qt0GEEE4R5EwrEjmiMm5jfeRBt1cc/0bYnuMEU=;
 b=arTOujMUVsgZK79wOdqio027gOnqcvrHZBiieWA9IEtiHPrqeZrtIUlq2xJB7v1Pqc
 vysxEIRlIqCYe9TDPr/23bF53skHKIo4Ycwngt4tXezXF+WkKR2ExD5jBfQugRnbtjrj
 TckVdIQTc2P1mN2ji7PBA0+SJnIaCupNw9aiUMAGqhVjLMW5FK+s69mGZ+WFRl9VJXPx
 y1nJd43+er2HW4FK23zI3ck3obP8+txo+DcL1hcx/bYNTJPOWeU6OqGzMoEjZt/E7iYd
 UGkTz9upNeS+C3DzOWN5OlhHCIicVOJmxRUuKjp6Lk5IchED7FkkPfKXokE+Nmwf/Cze
 eadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713776069; x=1714380869;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ojlb8Qt0GEEE4R5EwrEjmiMm5jfeRBt1cc/0bYnuMEU=;
 b=jPRiVAnmk4dThthL/nzxqCE1Pfevx0rNPKkxpgWcXUapZpqS5mqrg9omk10GhOcKa0
 mlpW/RCiRmmOhNMD7kaUgZ4aNALJPIlGBG2L/ZLcaf2mxYrTPizePA4ylUpbwD3KxcHQ
 VMyyFa50IVpGnTAN17UGLIJ4wP/w+vi159U981nYSCG/pJERQTVqlfp7v3FzNCYGgZuM
 TNE9c2L/qiJdGSvuUhIxuhHKDHZZeR1XAH8XDQ+TjXEY8vweUmuHsNPiZEmth3fisT+/
 xd3MZ8W0+zuhAzMgwvdRpyO5hGVE/1gi9tu+IZqs1YtYPQLW/r/oEHqDQhrQtKEU8ogb
 njDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZl7XeO4KigQj+8ovMAf7Zwc81kMCM89UQ5MfzYi3BKZImFLYtnLpk4cpXS9zCmzPNeVqcF/XGnHxjtkxwbSgF+iUDzN7JnYGrMJGorFu6
X-Gm-Message-State: AOJu0YwQPw1hT34ltp4sxTYr+axlt2UBDLm6FyiiOCNAiQGhTbmNH8HE
 bXNJzoyshsblNTWX9HLwkOhlIfBbqy9HMhiFPDaNljQhqP9EV7jfBOXZbs3qysw=
X-Google-Smtp-Source: AGHT+IE7k4brxBhxy5f7GNJIFfsaxDyj1gLwlLlyGFa1Xx9lcO7UuR/zgUeMyHEzAhs2lPsesXwQ/g==
X-Received: by 2002:a05:600c:3586:b0:419:f447:c323 with SMTP id
 p6-20020a05600c358600b00419f447c323mr5006365wmq.27.1713776069623; 
 Mon, 22 Apr 2024 01:54:29 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jx12-20020a05600c578c00b0041674bf7d4csm19372412wmb.48.2024.04.22.01.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 01:54:29 -0700 (PDT)
Date: Mon, 22 Apr 2024 09:54:27 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Shresth Prasad <shresthprasad7@gmail.com>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 javier.carrasco.cruz@gmail.com
Subject: Re: [PATCH v2][next] backlight: sky81452-backlight: Remove
 unnecessary call to of_node_get
Message-ID: <20240422085427.GA1290623@aspen.lan>
References: <20240421104916.312588-2-shresthprasad7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240421104916.312588-2-shresthprasad7@gmail.com>
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

On Sun, Apr 21, 2024 at 04:19:17PM +0530, Shresth Prasad wrote:
> `dev->of_node` already has a reference to the device_node and calling
> of_node_get on it is unnecessary. All conresponding calls to
> of_node_put are also removed.
>
> Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
