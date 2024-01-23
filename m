Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B33839649
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 18:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6107C10E835;
	Tue, 23 Jan 2024 17:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B26610E826
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 17:23:30 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33924df7245so3373023f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706030549; x=1706635349; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1Hfc6n+pM6KQNiyZQNXhNkFf773fzhUlASTk4Tfi3oQ=;
 b=C6mLQGoFuD2McphZawgrnpN+Jv4t83D3IvttBrKAih479K6GVQV3/BYla54U02S4ID
 yawSV6cWa8wK8uRODwGXYry4FKQpf7cZmRmfC3BmeHH+0oj5GJAvYEXu6Xko1MWWKDtY
 RYpgy2dJx3VZ1UlyqSN90CIhizqc20IejGLXsBcuGIUBWbZNH8ZUVjfHA8Y0Zla13ToW
 p/k/eVcmurXqJfPzuGFxwmWnU/iWJMINUShI3C3epm6VA8ncD0rbcI/q5i92renyG9vz
 FktZzLfDqdebbt4WYKOSbB86IadOnmeBQt32aNdNpQAkb9XRMviuNlCsRSSX3QCWQY7K
 /aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706030549; x=1706635349;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Hfc6n+pM6KQNiyZQNXhNkFf773fzhUlASTk4Tfi3oQ=;
 b=fZ/0mzN43meZIHGHKrtJOmYIrFEsxnw+hlMjd4Xpo+LGGBzi6zkD2Do+CDQHElR/CX
 JASG4VQFHxnWU/baRhuRMAYlqSmFDNhFjJDlZtSJ5tY6T2j48ngHAeIvHoChtHAC/CaR
 E1Z8XFR6ZeD3czs3nps7rCSE1A44KbSD+8OFzEzfEMiM/ACJWEvK8V11lcouJc7MXn5g
 UIvVBRE3pwwR2et/eYqpzLeK+WUttMz7xTKvRa0pplKdryevkzOv5W+P24nBsflehqSM
 BDauHYdzd3qfcAuK8K+aMM6eMQIIj1wHghiiZI7YGrCY3F0jv48bdYZbhpf5vkTk988e
 GE1Q==
X-Gm-Message-State: AOJu0YwNmSd+Fp/CvZczUzirtFONyMvYjsRtN8WySE87Rh5c1Dqd0Yyz
 RWDXis8b99TQ2t8oEpBRKroLJFSniEY/IBmR6k301Z1OfhQzKIuwQwLPTKUKKUs=
X-Google-Smtp-Source: AGHT+IFoO7gQRGdGA6peiV/mTL2CvpmYneI+ojl6fbQ6l0AX59DKNiE6xTLu71LBrqA2E5JpU1OYmA==
X-Received: by 2002:adf:a459:0:b0:338:fcdc:ad21 with SMTP id
 e25-20020adfa459000000b00338fcdcad21mr4255272wra.49.1706030549105; 
 Tue, 23 Jan 2024 09:22:29 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d4bc8000000b00338914eb90dsm12032927wrt.82.2024.01.23.09.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 09:22:28 -0800 (PST)
Date: Tue, 23 Jan 2024 17:22:26 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v4 3/3] backlight: Add Kinetic KTD2801 backlight support
Message-ID: <20240123172226.GC263554@aspen.lan>
References: <20240122-ktd2801-v4-0-33c986a3eb68@skole.hr>
 <20240122-ktd2801-v4-3-33c986a3eb68@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122-ktd2801-v4-3-33c986a3eb68@skole.hr>
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
 Karel Balej <balejk@matfyz.cz>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 08:50:59PM +0100, Duje Mihanović wrote:
> KTD2801 is a LED backlight driver IC found in samsung,coreprimevelte.
> The brightness can be set using PWM or the ExpressWire protocol. Add
> support for the KTD2801.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
