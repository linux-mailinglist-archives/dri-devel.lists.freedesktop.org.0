Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9D69B09D7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 18:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256DE10E10C;
	Fri, 25 Oct 2024 16:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CoUFYyXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C5C10E10C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 16:24:45 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53a097aa3daso2089028e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729873484; x=1730478284; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uFxGQ84TzgKb5slx95M/+bzD3Js6QUjK6CpY1vcd89A=;
 b=CoUFYyXfbJ2XZUN91g4jzl2VDVUC/k7iJ8apCYroudXDAhihuAcgh8o/F+hif7JOMT
 FB0TYhU0eF5o06OGhntoLLSnTUlfJyzYU9xld21khAfNa2Xc0jnH6/8t0/nRYi2ha6mi
 mTPqw7LgUyzM6ZX490GAkpMr68bzy/RVJYqPvikRn3qJzz7ktQVwfPEeRHj0MqdPTyyF
 UGB5giNGRcMeLoEpMqrqx4jbIMCiwfLJLE/OhSrqHfZhq7spd9MVJtj9lEbY0npJ0Fnd
 7LaKSjjd8te397vkSUhY3OlJwNxXz0myP1GLdo2hneFF5eCRzvRykaLvOsh8IuqIR5pC
 p05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729873484; x=1730478284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uFxGQ84TzgKb5slx95M/+bzD3Js6QUjK6CpY1vcd89A=;
 b=DSV8LDU4e95zeEneAgJOAtnJjFKOYityk2e+xvK6Okg6zgE3u7SjmxYeEtCh8TtlFC
 XmPqUi2AbPH+DodvnSX52Sm4DQ8EU1m2bL1DPWAQFGvCUBxorUBNUo3X6+fhk46JTJdq
 1Stovd58rdFNDaQQggBKLRaOg6n5Q7hJPMKSjfoFAYiIBjnAmO6x8oWP0pd5FcL8WVsu
 outPRLmR/Zm1DuWp5J6P76mWBe3B2m1mtJ1vxsx/jTyfV02QLZ/sw0umIS+3XNMXgqlu
 1muVNeRKp8siRR2mYfJo/lH6QV9oOt2sm2AV0TWFiTRsYjSgvlz5Wvuly/Ir0WRCbqCe
 iRCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0hYQDuVvNLneXBSHZBasuhHnPH9DD2l4/XZfqMxrZ/d9Nq7SPdONI7pgLTVR7cn4oGKk4r4iDM1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3vGujgkUkG0M/JBdMgVWNG8T682QHBZ7nxaElcgGHAtAOS6Oe
 gqo19argBQ8Iqq3RgvX0DA5iBCkaIvlda8Plj5MoCREV/l21/hBIIYtzMxPwnl1pZxI8V+Rb782
 dhzaC3J/xwrssnsmNtoajMekrvENnkvLiiO6NPg==
X-Google-Smtp-Source: AGHT+IEfpJ2a3ZiZX+RQPhobkt4J8q70FA0o2YD9ICo8hjOQkce3gRZLgqbQg03WL2CrnH1fCWI3UEeT8tJywgVGdn8=
X-Received: by 2002:a05:6512:12c5:b0:535:66ff:c681 with SMTP id
 2adb3069b0e04-53b1a3615demr6698254e87.48.1729873483988; Fri, 25 Oct 2024
 09:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729738189.git.jahau@rocketmail.com>
 <1a3b08a4bc9944ebe05ee48bcd8ea11bcf3e9103.1729738189.git.jahau@rocketmail.com>
In-Reply-To: <1a3b08a4bc9944ebe05ee48bcd8ea11bcf3e9103.1729738189.git.jahau@rocketmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 18:24:32 +0200
Message-ID: <CACRpkdbPgku6qAkaGN-AC5zSgwQTs0JnXT5RYOgWddU8TA301g@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: panel: Add Samsung
 S6E88A0-AMS427AP24
To: Jakob Hauser <jahau@rocketmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Oct 24, 2024 at 5:18=E2=80=AFAM Jakob Hauser <jahau@rocketmail.com>=
 wrote:

> Add bindings for Samsung AMS427AP24 panel with S6E88A0 controller.
>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
