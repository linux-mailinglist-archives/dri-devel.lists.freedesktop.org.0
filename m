Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB77124E1
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 12:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BC210E7DA;
	Fri, 26 May 2023 10:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A6010E7DA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 10:39:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f6dbe3c230so6369825e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685097564; x=1687689564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HytdpLB2BLkS5NjviYqG4FdqHruuJyRPB0ysP9IOgkk=;
 b=DKV+rKHG+vvRFnOB+auX3vzeeI3kmPgtHFrm6CJKW0TTJUlZZ1zj/+LgTeVessIrCk
 APlR/AEoXDcUhz+XodwfI2V2eYTO0+adiIyjZvB/+HjNyR7g3VEDRy8gl6k57Kv/lEZX
 xR1ZAtEMgt2GyvCZ7r21fy4xjJ84D1V0fdTd4wjCJmcOvbQilMVQXzO0o5Am30ebc9UK
 bOlQQ9zqHxH0dv+ZJf3ddkTJoG9r/qohq2TM1gRgOobycD200E028Lgpjfn6j8UJ96EL
 9e1AP3Ch4LKRar0g2hdGrph7H/6kg94155zwCEE9s0b780NU3sg7NRLssV5H6JIDbJYk
 4JwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685097564; x=1687689564;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HytdpLB2BLkS5NjviYqG4FdqHruuJyRPB0ysP9IOgkk=;
 b=jXmCcV9Y2eBHHVdz3QZgHJDIg4K7C1FdutfZgxg5TWJckB9eq7x2NI9RhJiY6fJ0s9
 U2Iv3T9A2mQ/bzYN33iEaXXJN3h4sceUq/0hvn72xgb3CrqD043RpI+onJDP9eVevIV6
 ejuEz3wdd8BxV0lPNQxWvNkRUswmMh7MCiDdQ48RI3VKyBqnAcpHVvmUxYUNpnTOOfyA
 duc1MqTY6Y34YKscxJ4ZsLSqQ0ychdgFW5Oxp6wtiWslXqhrAEGJ7DCIoGrxsiKOThK3
 cg/UhGaLk4iWmXsXBYDopSpzmouIASiUtMaC1IvAuxknV6xv8qKp1oWGbjDg5F4ppBdb
 g2Dw==
X-Gm-Message-State: AC+VfDzC5ojtbYWXNn3l/n7ye/pLAA+1Z2TybbG60+oB3n4FkOj4KEgi
 4ItEBMzSDDCJdUNeNTgRjXspOA==
X-Google-Smtp-Source: ACHHUZ6ubA2MF6JgtRAwxIFIE2lVjUYAKPZfiw6mxaXshnyIKhN55g87E0purMwViHwqcEIS1jrBWw==
X-Received: by 2002:adf:ef46:0:b0:30a:b4e1:a89f with SMTP id
 c6-20020adfef46000000b0030ab4e1a89fmr1135169wrp.58.1685097564174; 
 Fri, 26 May 2023 03:39:24 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 i11-20020adfdecb000000b0030629536e64sm4737259wrn.30.2023.05.26.03.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 03:39:23 -0700 (PDT)
Date: Fri, 26 May 2023 11:39:21 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: adapt to LP855X bindings changes
Message-ID: <20230526103921.GF626291@aspen.lan>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
 <20230519180728.2281-4-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519180728.2281-4-aweber.kernel@gmail.com>
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

On Fri, May 19, 2023 at 08:07:27PM +0200, Artur Weber wrote:
> Change underscores in ROM node names to dashes, and remove deprecated
> pwm-period property.
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> Reviewed-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
