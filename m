Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB63E85BE00
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6170910E134;
	Tue, 20 Feb 2024 14:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UGSs+TZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6177B10E134
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:03:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4127188dd5cso1813705e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 06:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708437811; x=1709042611; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YIgXLQrn14CWmrZfowaGPAblUiVDzjmJHLps35gqblg=;
 b=UGSs+TZy8J1t3oeUYY4j9JKnq21p2Ykd97Nif1d6S3X3wK5/OTCYJyq9+tsa0CiDoy
 hKE11LLU85LWOr3vQJ3hwy3Ob+UH2gJzoTT7k70J+sS7hrQZWTy8nxgKP9XpUeRDRc4u
 Gvjz8ApSdbZcaAidTdycNhYj/CgotbkMZW2HdZpn9Qyqly2j420zCrcLLmDGW7/6B21j
 RgvmU2Co9oONi9CozIGwrmp+PT8RbEQ439/NaBi6WhrL5793PxI1nEMkdcvTjWRgVv58
 MZMGZdKW4zZi2cwmt3eqE5P1Maagp9maqdwh9/XUUGYr84OnSv3lK14EboOV7dhoMGIL
 wY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708437811; x=1709042611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YIgXLQrn14CWmrZfowaGPAblUiVDzjmJHLps35gqblg=;
 b=eOE2iCWfALjUh4ykrctC2SnWdcRMg0BB3aJcc6mVwx6r0uB/xanglI6HbCGKydzWyx
 xF3NXJD10HPXDMX7og4ZpsnAQvzZ3AxzsVUlEo+NXh5/59GmObuwT70G2a2PXVJr1kIn
 a43ouPgbusU7mVykJ87SoeKccPyXfqfit8/nzgQmy35A0WvIE8jTsX4PUbRLYeFFizHN
 2dEObuBiQSNQDIGpxrmoyT6Qute+Rk8W/Edn16rOFydM5WuA1oCL0TPokJJbFDDkxcFR
 dFuVrbaI3daa+s1VvpZo0NjxkVaG6dt8+OH14ikI0bwqzqb0LCiZ3kLVEv4QUy63Dfd4
 Ul+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW77r8fffvvpO4DTUqkFpvDQFIeg5T8y9wm7whPwXIT8bV9d1mOFxi8lZehONyKey1XlunRrmkpsUZqjLwBjgdIVjn3/MrN8aJRWMJB9/7I
X-Gm-Message-State: AOJu0YxzX2UNLtLNNmGdT3/GgAJN8dlTbCTroVFSrWoLc51qQRZ5zvHA
 +fLl4LooVCeFV5CRYpmzz3kNxmgFQ8/9kSHJXhmiM26I/C4a+luA5+41bAthcHw=
X-Google-Smtp-Source: AGHT+IG6vkgZ+8zSvP2/8Ap20RRDORuDhGSZX+BUAp6ws2+0Tc+tQb9sjACW+5haOxYS7Odl/DVhmQ==
X-Received: by 2002:a05:600c:1553:b0:40e:d30b:6129 with SMTP id
 f19-20020a05600c155300b0040ed30b6129mr11941148wmg.13.1708437811534; 
 Tue, 20 Feb 2024 06:03:31 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bj29-20020a0560001e1d00b0033d5c454f03sm4888305wrb.114.2024.02.20.06.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 06:03:31 -0800 (PST)
Date: Tue, 20 Feb 2024 14:03:29 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>,
 "G.Shark Jeong" <gshark.jeong@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maximilian Weigand <mweigand@mweigand.net>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] backlight: lm3630a: Don't set bl->props.brightness
 in get_brightness
Message-ID: <20240220140329.GE6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-2-9ca62f7e4a33@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-lm3630a-fixups-v1-2-9ca62f7e4a33@z3ntu.xyz>
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

On Tue, Feb 20, 2024 at 12:11:20AM +0100, Luca Weiss wrote:
> There's no need to set bl->props.brightness, the get_brightness function
> is just supposed to return the current brightness and not touch the
> struct.
>
> With that done we can also remove the 'goto out' and just return the
> value.
>
> Fixes: 0c2a665a648e ("backlight: add Backlight driver for lm3630 chip")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
