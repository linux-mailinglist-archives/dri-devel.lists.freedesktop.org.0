Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEC07EE045
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4DF10E27E;
	Thu, 16 Nov 2023 11:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F12110E27E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:59:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4083ac51d8aso6116625e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 03:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700135977; x=1700740777; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Bgu/OmIil+m+pgaiPX4vyBYRM7q2Oj3pmqGujW+IM1U=;
 b=FonKypbm25szp4VahgEqSmigRsVOsj4qSKnHDhDbxzmI5s8yrvs566bq1Nr7QRuGjc
 vC4qynK16qptNIUTAmthL8ZZ259NvI3+NpBrX0WJoHdyNeRIOuilTC34Qp7fC++l53yL
 eMzZwknK4ffIjlvDg2Upt8IwId8SR2EXNDQFmLBPcsSlG1Uhu5UfNYElP+RhERig8ce1
 Rvgcf3tuPVZg8flWbbRHl4hTGH5AS4Ayzkz2+KuotsVXStaiSCP1cu0111uXn06dJi8k
 GXC6HaxjlDN3u2X76qSXvhdEXDyIDc6ZtGjKZqNs63DEC9ELKiZOOr4qN8tqWVIQFZQq
 Ad6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700135977; x=1700740777;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bgu/OmIil+m+pgaiPX4vyBYRM7q2Oj3pmqGujW+IM1U=;
 b=mw9WjcXVwZ2ZuQGVwETH+UyiZZ0J+Ma4HJtelUWQl9qhsSxEuLAlMkwImWWo55h1WE
 TSUU045cF41Y8dsl3W2JXTx71jonYfm72jeyWKqsMDNIBuyUj8kgJ0h8MCl6VH99Uw6J
 kkIUBMHVzGD4ZmgG4AUcnSTmR0H5sUl6AaFudr8TZd1w+iCGSto4fZjLpMEr553fY11m
 PyAgkoPAbiQpPBN5poOXq+UYZyKXUat6UC9U4+T0ub1mVHokU8wUJ57kZZ6bPwjJLApY
 ua7EDlbyBHKSss4LtPuXzwpOXfpzyFeOlJU/Ak0eoxlbgG9WPpP+6ShS8imn8UV9CbsT
 wrLA==
X-Gm-Message-State: AOJu0Yw6Lm8Lw/TI9jnss6LNh+PGrEt3MLD4y/8jMNcFPtARmvZqOPJo
 TeuUwwscJiifPRXCu5gUzZJyTg==
X-Google-Smtp-Source: AGHT+IGgShwNUHy7UmmpWIBZdQEdCnXfXFJTSulfEi9aWAIItDdqiFC8s1dZy5fLM0CanEYV7W7KHQ==
X-Received: by 2002:a05:600c:310f:b0:408:3ac4:dc3f with SMTP id
 g15-20020a05600c310f00b004083ac4dc3fmr13808290wmo.29.1700135977363; 
 Thu, 16 Nov 2023 03:59:37 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b00401b242e2e6sm3259951wmq.47.2023.11.16.03.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 03:59:36 -0800 (PST)
Date: Thu, 16 Nov 2023 11:59:35 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v7 1/2] dt-bindings: backlight: mp3309c: remove two
 required properties
Message-ID: <20231116115935.GA56909@aspen.lan>
References: <20231116105319.957600-1-f.suligoi@asem.it>
 <20231116105319.957600-2-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116105319.957600-2-f.suligoi@asem.it>
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
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 11:53:18AM +0100, Flavio Suligoi wrote:
> The two properties:
>
> - max-brightness
> - default brightness
>
> are not really required, so they can be removed from the "required"
> section.
> The "max-brightness" is no longer used in the current version
> of the driver (it was used only in the first version).
> The "default-brightness", if omitted in the DT, is managed by the
> device driver, using a default value. This value depends on the dimming
> mode used:
>
> - for the "analog mode", via I2C commands, this value is fixed by
>   hardware (=31)
> - while in case of pwm mode the default used is the last value of the
>   brightness-levels array.
>
> Also the brightness-levels array is not required:
>
> - in "analog mode", via I2C commands, the brightness-level array is
>   fixed by hardware (0..31).;
> - in pwm dimming mode, the driver uses a default array of 0..255 and
>   the "default-brightness" is the last one, which is "255"
>
> NOTE: there are no compatibility problems with the previous version,
>       since the device driver has not yet been included in any kernel.
>       Only this dt-binding yaml file is already included in the current
>       v6.7.0-rc1 kernel version.
>       No developer may have used it.
>
> Other changes:
>
> - improve the backlight working mode description, in the "description"
>   section
> - update the example, removing the "max-brightness" and introducing the
>   "brightess-levels" property
>
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
