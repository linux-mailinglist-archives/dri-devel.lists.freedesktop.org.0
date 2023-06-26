Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D0E73E24B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 16:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D5410E212;
	Mon, 26 Jun 2023 14:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18AD10E212
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 14:39:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-313e714342cso2386942f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687790381; x=1690382381;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GbmG/0Wb9nQ6z/PJEyshEPOBYP8Ve8ZuPqHoAlT0PBU=;
 b=v+xGmGJ0qIKRU0aurzhYHzIhjNpseb32nFxtt0cVXyZgxRKLexvjA1I7WRCD30AJL5
 Eh+qbIjAP4NQcnlNR1I/NzBsJKqid+podoDPCDocJl+LEfk/pJHXsu1L4EtQQNKsx5dP
 fef50DtyMYVYCyHso5OggdKwQmH6wr7etq++Nio8hL9QiYjg2gVJtWMqiO7yErYgevzf
 8IKienQinE4jICssw7dY926yyBUebZc/1seLsWOtDpNlnlmAc6/i5uAzbdv+jtLbsHnA
 hNiVcwkKf/6G4yupLdqBQJX93vw8ruAa85Bj++UM8ySsTwFkZPPROGk10fcd/nOaXpWw
 /H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687790381; x=1690382381;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbmG/0Wb9nQ6z/PJEyshEPOBYP8Ve8ZuPqHoAlT0PBU=;
 b=Mbgav2Q3Z/qhmi8FdsVBzJhbg50dyzN8VtynByAdahN8PzyVoFVFCQSb1KEuv77psk
 P6BrUJXKJo0MiDWNprJ1/ZEHJo05Gc2B6lie8QqVMGqkw9oahFrxgWXT0t+XL713a5m3
 y9wxTQdZRDFj3/rF9JzuGtyMB+y2ZYG7brTk3BwI2hxp0txFqAqwAQtfR48UxePS8u1K
 RlrXpBAm5cfqSNGymfesLoCptWeTBYTVU5f6tVHRrwAwcmVoSjrK3Nma31mriZgrrV3/
 u0xz+ikqnB2OaNRpI4pKAba/3njfI3tjAInRLr/+3vPQ1lZVwFkrzIEgw/JgKoGFm6jD
 wGNw==
X-Gm-Message-State: AC+VfDz4YusPHX7nv0+hL42xos62Nd50gEwYUKIvLp+32liKi9UqcQqe
 xPppxuSmReYr0fGY2pASbXbCFA==
X-Google-Smtp-Source: ACHHUZ5u0xLo84AQuU8IWtL8/XKYwsSCcaLqPaN0OzwE1PROPfhND29UAU7NVe45aBYE+KDJ8dq3Jw==
X-Received: by 2002:a5d:4250:0:b0:311:170e:8d with SMTP id
 s16-20020a5d4250000000b00311170e008dmr23526468wrr.26.1687790380687; 
 Mon, 26 Jun 2023 07:39:40 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdb8e000000b003112ab916cdsm7675793wri.73.2023.06.26.07.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 07:39:40 -0700 (PDT)
Date: Mon, 26 Jun 2023 15:39:38 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Maximilian Weigand <mweigand2017@gmail.com>
Subject: Re: [PATCH 1/3] backlight: lm3630a: add support for changing the
 boost frequency
Message-ID: <20230626143938.GC95170@aspen.lan>
References: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
 <20230602-lm3630a_boost_frequency-v1-1-076472036d1a@mweigand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602-lm3630a_boost_frequency-v1-1-076472036d1a@mweigand.net>
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
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maximilian Weigand <mweigand@mweigand.net>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 14, 2023 at 09:08:52PM +0200, Maximilian Weigand wrote:
> From: Maximilian Weigand <mweigand@mweigand.net>
>
> The led driver supports changing the switching frequency of the boost
> converter by two means: the base switching frequency can be changed from
> 500 kHz to 1 MHz, and a frequency shift can be activated, leading to
> switching frequencies of 560 kHz or 1.12 Mhz, respectively.
>
> Add this functionality to the led driver by introducing two dts entries
> that control the boost frequency (500 kHz by default) and the frequency
> shift (no shift by default).
>
> Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>

Driver changes look ok (or at least will be when the DT bindings are
finalized).

However... I think patches 1 and 2 of this series are in the wrong
order. See #5 in
https://docs.kernel.org/devicetree/bindings/submitting-patches.html
for details.


Daniel.
