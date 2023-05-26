Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4D77124EA
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 12:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDA610E7DE;
	Fri, 26 May 2023 10:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FE910E7DE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 10:39:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f6077660c6so4183265e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685097589; x=1687689589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K5qc+6R+4cg++tOBhrk8VJFcNLpwxweUmH8mmAsqivg=;
 b=ug3+0aca7Ve1E4V3g5YqDWH2Rah4zTe+KtqBd1PONpb0KkyolG2e7f6ABfRTn3y5MF
 /PD3ZAeIs7N0KQ60SO/4iOboLj9TCqEThEF6l7g6n8XOeRQyVvHtdfzfqNtmHmzSBmH8
 OaUC8CbKV7nubP73c45rRrUk18BH8HlTTWekV8vghWwSSBS4/spvFwqxFy8C1i/okZg4
 sALQTgK3P51sCJxOit9k147V8wGaIQ43zEY2oluGz3taJwDKAFV/nBuBIvC2o8KypGrb
 9cwysltv7H4IQP2MhLQwuFQ6fvIIbNtecX+nNVUieULj3JrAUBaKt+7QktPmgmy8zN7/
 dhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685097589; x=1687689589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K5qc+6R+4cg++tOBhrk8VJFcNLpwxweUmH8mmAsqivg=;
 b=lVU8uBkDCaOHwDUy5HC4RQatxnFNon0qNyiEXbFjSY5Nyc8IdUHhjM9013DQpYj8Bw
 Qk46d5mV7hkDsRMoex0rILbE5XonR7CXWdZqadue09/a/4tgnlpIePkxk1JUrSqVe9FV
 gSHHSpm+3cWdJp+pM5sfUK/SrkGV71jdlI9dv5y5+RHeBfVkAyZs5C0HL3w43UKTd/Rh
 4rjxICv/MpgE1n4mOiVkLPunUefHCgk8KSQeA3Hn9FANJAwrgOiis7uLBhmfE9lQOw01
 XYKPZ5SoOCtOPve2l+S1yUXrFJv5o3DGqhc7R+UZIXlVOiUoroGyRwVZiGZqK+tvA0iX
 uiuA==
X-Gm-Message-State: AC+VfDwyC6l0SLNEhx5/fGRezicd94UKdnDgJyDK3dZ62gOSl8VmHL28
 7IB1sGHpckUegMW1iisWlY2dHw==
X-Google-Smtp-Source: ACHHUZ5bWuN3xO60xxeTu2/pEznSg52lRAzP05K3isPLI5aCV5M4pSup4e5FJ7O05LEmuOVeUmWaiA==
X-Received: by 2002:a1c:7914:0:b0:3f6:e73:ef1d with SMTP id
 l20-20020a1c7914000000b003f60e73ef1dmr1240678wme.18.1685097588747; 
 Fri, 26 May 2023 03:39:48 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a5d5272000000b002fefe2edb72sm4638660wrc.17.2023.05.26.03.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 03:39:48 -0700 (PDT)
Date: Fri, 26 May 2023 11:39:46 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: adapt to LP855X bindings changes
Message-ID: <20230526103946.GG626291@aspen.lan>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
 <20230519180728.2281-5-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519180728.2281-5-aweber.kernel@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 linux-tegra@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 08:07:28PM +0200, Artur Weber wrote:
> Change underscores in ROM node names to dashes, and remove deprecated
> pwm-period property.
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
