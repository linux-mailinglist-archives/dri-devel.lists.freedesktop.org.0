Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070567124DD
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 12:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D198110E7DD;
	Fri, 26 May 2023 10:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0CA10E7DA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 10:38:32 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe934so4051215e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685097511; x=1687689511;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gqVVAm/y1HoALh+s361erx7bMZgCxQRFgtpi/v1PaKo=;
 b=HJ7fBVJqCsT5R4//AmW9AScNLLApXJA8d/6S7+0FY9YgxHH74VnQpWwCehPoOdr0wq
 SQ2JuvmK7sm2lA+i+BrspdAKh4JaEWD2AzLV6FIjF2d7I7ARoWcP75ZGPe3VoV3TouUX
 IFsE/VaWeFtVv+mcA4umKZORliI1NLDFlPa8O/NLaC9owMTeCLNhJrzWzxkHyPF91Phg
 Yw13DjWeDFiBMeKO94urScZMETTyzG7JWyUSgr0OIbueJhL17ZDbdm8bGjcQLXcB5Ps/
 RB2Ey9BZUFnKYilXj0DM97vYkgULbKziaGJx4rJaRpxlyrTiwKssm4TGN1ASwks8GDMS
 VZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685097511; x=1687689511;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqVVAm/y1HoALh+s361erx7bMZgCxQRFgtpi/v1PaKo=;
 b=Zqa7saZqgpbzXQfAcsdzGtnawwCeDM2Vn8rB8lAy0fsTgwYjIGpgnZ75pbTasQ7Nzi
 44XPdE1U+Pcyc6ulbIeqfcYzCYP/QaJJlSYotYbb43DE5hViAtgzvXobzVMWo66rSBnJ
 DD/BD0eZhw9vBKkM1LHwQuAyFvJduJg1v8JnXgJ4pwQ9dsBb77cvxGQQRKn5pyjsx0Eh
 KLSy0hei+SLTLkQyZCG4Xg2vDxUrqjQ7qcJbZ79/YHHS+tUVdmEQpOE4zweBQfUwc81j
 vmwf5RxFeuWB0XY2vyQKYW05uyJ965VjBP5HXpydc4EvH0tYYaPhPHdfD2LkDbK28tvq
 QF9A==
X-Gm-Message-State: AC+VfDzUTUrVVCz9bxMUpVNGznJUUrC8XIZjNTk9vmRYVXkHr8ly0WoI
 1PoZ752TwS2URkJmGrUv6c1acg==
X-Google-Smtp-Source: ACHHUZ656Zt2yUkAzWvrDGzkUWXOvr37WPMqjvtf1rRfMMcu9S7heLTHhVOVYRLwpW1FUroNPr92DQ==
X-Received: by 2002:a1c:f40a:0:b0:3f4:e853:6a1 with SMTP id
 z10-20020a1cf40a000000b003f4e85306a1mr1350782wma.38.1685097510904; 
 Fri, 26 May 2023 03:38:30 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a05600c21c400b003f0aefcc457sm8460239wmj.45.2023.05.26.03.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 03:38:30 -0700 (PDT)
Date: Fri, 26 May 2023 11:38:28 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v2 2/4] video: backlight: lp855x: get PWM for PWM mode
 during probe
Message-ID: <20230526103828.GE626291@aspen.lan>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
 <20230519180728.2281-3-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519180728.2281-3-aweber.kernel@gmail.com>
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

On Fri, May 19, 2023 at 08:07:26PM +0200, Artur Weber wrote:
> Also deprecate the pwm-period DT property, as it is now redundant
> (pwms property already contains period value).
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
