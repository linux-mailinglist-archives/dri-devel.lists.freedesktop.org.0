Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D93832757
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 11:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6137D10E9A2;
	Fri, 19 Jan 2024 10:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A4510E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 10:08:16 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-40e775695c6so5180725e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 02:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705658831; x=1706263631; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zLXtu6szFeWljVZSoUilDAfrFCs1+Io7uRaQKIIJn+c=;
 b=UVJRpJtVp+/F/lgh7kDNzH7mFhoNcnSzKX+c4p+PxOddv00KQ78Xt8321/FaVOCcaA
 LmKe+m5ir5BNZmGq4L2qVpSHXl/CzUqp7W65s5C02LoZ8fBYbDejETVIuoJzLgL87c2q
 OCxegkVMQewNwm6O5bcwI6XqK3Ww9DpQ3i54aoL19Zzze/L9R6hBtGbtaIYbU4X9nCuv
 WXidli+z0jTpDPMNo0hyhXKHQF/EbABgVO11NfzCpXie1EGhIkpmWujb2vLKRVqVYbV0
 dUIr2VXuloT2AzFw3u0ITrGMO/t31RJtkGbPyn5AndBJfbQdaLkXD2buwFYAAu3NihQJ
 9ZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705658831; x=1706263631;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zLXtu6szFeWljVZSoUilDAfrFCs1+Io7uRaQKIIJn+c=;
 b=cHyJWDCwMNvXAA92IaTVC5LgM0ST26wtZP/EgFMhV6zmznZUETG+GUz5wAQhWdOvWe
 /ekKttugc4YiihyxHuv9cTpHHzxII/0DeGT9wN7l49xYflYEb4tbxXoE+WH61svYBI5n
 6etGDcqSrAgbjSNmlmqHCtlw/xwa3pFro+Gdi23rAg5Lc4xdMDuZJVl7YoNyTri9SdWD
 qv85hQzyEPHqF5/sOkVJqvxzNH86c6M3nosC7n0MmDemjxebXA/kVnEPeHvuSDIlOovy
 ozif6k3/FXRnhyPts17pSFJAzB0yW9qPaycYLxWl4lUruXC77rXj6Ct6z14sTAe5QjaJ
 52sw==
X-Gm-Message-State: AOJu0YyOhpLXUw6ODiR3in1Xz3PCp2gDp9wbgyBXa65SL673iJY2zvKw
 k2WQL+PS0cWBI02ds9wQiFL7kUncP0ODq1aNWOsxbmMiEuAymxb97pNPdkbnJX4=
X-Google-Smtp-Source: AGHT+IF8++eqimkhaOkxMirehfcF2AeHDfKJiw3+NZuqF110PBm1nBFe26FRDTwpJUXDtN6ZBmLrbg==
X-Received: by 2002:a05:600c:2114:b0:40e:3b47:eb71 with SMTP id
 u20-20020a05600c211400b0040e3b47eb71mr1469467wml.73.1705658831414; 
 Fri, 19 Jan 2024 02:07:11 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b0040d8eca092esm32535456wmq.47.2024.01.19.02.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 02:07:11 -0800 (PST)
Date: Fri, 19 Jan 2024 10:07:09 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v2 2/2] backlight: Add Kinetic KTD2801 driver
Message-ID: <20240119100709.GB100705@aspen.lan>
References: <20240118-ktd2801-v2-0-425cf32e0769@skole.hr>
 <20240118-ktd2801-v2-2-425cf32e0769@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240118-ktd2801-v2-2-425cf32e0769@skole.hr>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Karel Balej <balejk@matfyz.cz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 06:32:39PM +0100, Duje Mihanović wrote:
> Add driver for the Kinetic KTD2801 backlight driver.
>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
>
> ---
> Shared ExpressWire handling code and preemption watchdogs haven't been
> implemented in this version as my questions regarding these two weren't
> answered.
> ---

The last mail I saw on this topic was of the "do you have any better
ideas?" variety. I (mis)read that as "unless you have any
better ideas" and didn't realize you were waiting for anything.

I didn't have any better ideas!



Daniel.
