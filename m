Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24CC83963C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 18:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D68810E7EB;
	Tue, 23 Jan 2024 17:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD7410E81A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 17:22:02 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40e80046264so58075985e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706030461; x=1706635261; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pHYOkrk7p0+vmd6Q8AhuzGmsx8q6iJdxMRVdgXKdwN0=;
 b=zfhGNrVETQ1VRI2XJsJzKy3RtLgJ3jlAX3l6YFvNOmgwnLYQBNoxkSI5eCZIKoeiNX
 iKSMx3o5ARXRTw28MbYkalHWSKvprF9c+CoTTVkQggm56dAJNRO9VyW1OZq9k6j7ShYg
 AVlFr8djMEBckvYmjiXdoXPO4ABPUZMaY+JEiGu1F+IomcR2CgYYp4eeg9rTLB2fOIGm
 1vmU3IDvNv6pTEa9vvYlhf0Ur29d7E/lpBZxKFDzt3cykAm1QTn1+CIjjS/2stp1Gq96
 8iKzhy5dsb+5FVNZHrOfJYnmN3ATlXNWXy6puDa6k1sIULMxeRpxT0L2b9DfPODlbiKA
 cvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706030461; x=1706635261;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pHYOkrk7p0+vmd6Q8AhuzGmsx8q6iJdxMRVdgXKdwN0=;
 b=p1s9FPg5iQj5ExWNaLUbdLTOkxtIDyPWY29V1KGZJgBVHDN17CP3vrIGAG2a+OprqF
 BCbwlSRtJt5rUsDsAv9odnKLeKszQqh3dDGaJ3+dDfiT0Qd0qc3I/tN8ZfR7+ucfA5UH
 na6fd7n7tip4snBJmwa4nP5yKtZ6mwYCGohTP7trCfbJYyEpWlR/cSN2cMBwpg83cqRs
 2X20onxInqT2jO5RC2RqwD/JGYZcSDECAi43rANREpUcmO+z8kpm8Xq67ArkYup3dOb6
 vNnGQoifkikEkdgkK+JQO5HTuSg5qWOXvCsSf6hPBmHzKgbHbFTTQnJoT729lNHDy5cA
 L99g==
X-Gm-Message-State: AOJu0YxgITEKz94sFqaPg2mhU8loWqmIZeQCLXhTUpNnX5TpAjcQzMjP
 ZBisbviXwR8SsKjqHurNPl6rt7XPL0am62Vi5iILpuwTf18Jcs8a4eH2sGwFZ5Q=
X-Google-Smtp-Source: AGHT+IFYxEMGAchUt1W+s236kq5ZJsRP++aWZYwhc00KUVO1+MAAo2pe7nmIdLdtu4Jj4EfweoOMzQ==
X-Received: by 2002:a05:600c:18a5:b0:40e:9512:5056 with SMTP id
 x37-20020a05600c18a500b0040e95125056mr368796wmp.61.1706030460793; 
 Tue, 23 Jan 2024 09:21:00 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b0040e541ddcb1sm43283295wms.33.2024.01.23.09.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 09:21:00 -0800 (PST)
Date: Tue, 23 Jan 2024 17:20:58 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v4 2/3] dt-bindings: backlight: add Kinetic KTD2801 binding
Message-ID: <20240123172058.GB263554@aspen.lan>
References: <20240122-ktd2801-v4-0-33c986a3eb68@skole.hr>
 <20240122-ktd2801-v4-2-33c986a3eb68@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122-ktd2801-v4-2-33c986a3eb68@skole.hr>
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
 Karel Balej <balejk@matfyz.cz>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-fbdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 08:50:58PM +0100, Duje Mihanović wrote:
> KTD2801 is a LED backlight driver IC found in samsung,coreprimevelte.
> The brightness can be set using PWM or the ExpressWire protocol. Add
> a DT binding for the KTD2801.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
