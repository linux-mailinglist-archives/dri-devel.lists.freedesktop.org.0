Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DD7B1243
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 08:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464D410E583;
	Thu, 28 Sep 2023 06:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6F810E583
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 06:01:48 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so29807376a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1695880907; x=1696485707; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/un9SCO8NQAaFwwS/v5Hgk7wmnwT4tzJzG9xCDorHU4=;
 b=h5sV8tV7pCKjI6nf695oLckOWDakNYkjv0gy273sFx71xUuh4TlFJpSv6RNTdmf0jN
 f8X+Dy41o1TQxzlOIZp49lHYcndbSHpPv52Wml86X6qkFISmV0mvVwdqMRnR/YICiONk
 B1P67caOHfy/ZnPwg1sVtl9v8CleEy7HKtYeDJyyYpFCc/qlMUUr8umZ1yn0i2jGsWvG
 2vkCesnrh0UPYpp28FojM2zlicWisOl5/L2hQopcglYnrFUSglMg/CntARJAYscVPAJr
 zZTWXEgyiFc0BhRgLgfsaU6E9ySWr7OB7tfam3E3Y/Pcz1pa4PYOBiuNffJElK1MImhA
 QQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695880907; x=1696485707;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/un9SCO8NQAaFwwS/v5Hgk7wmnwT4tzJzG9xCDorHU4=;
 b=H21Kqy6WhLohsysrsFzenX4JF3Lq+OszZFzISi18mgLWNhtXN9duteetbGDo4TrELX
 nzPdlicN/2/9Cb1QcMZeZBZGurcOYnrMWBMtVNVoo+F+NGR0raDPfIvIptkCwadCccDu
 TY+6lVF0ZpauNt+M2M+jq4PsxvqlN3M/KyeRPFElF5UbVZLWVWt3cJEnOwa+5wVoTAnO
 uimwZg+WPyjYP5SqlMzqhXoiDgU23HqVSxm7rZ9kEX/brGfkAQytvtZeGsby/xbEqvmL
 M269NhWGf1waEHMM2KVXfyCaKZrFCPgIBn/EKV9xHLUsG3eN0R43ieSNqa+0fG3e+KlP
 xrPQ==
X-Gm-Message-State: AOJu0YykHlsnNJyJ0GwX9JQ6BZ1L8atg3brvySc0Pn75BLHYHG6tDe30
 Sl3VeOpfT8F4IfDSUuFEyKaBCg==
X-Google-Smtp-Source: AGHT+IHXb9MrwailC9Z16pLKAsLb2LIAcdlIDi/yek1TmJBbg8D2/I0CLSC9kn/rBKIYcrF5oG47zQ==
X-Received: by 2002:a05:6402:26c2:b0:533:5d3d:7efe with SMTP id
 x2-20020a05640226c200b005335d3d7efemr300757edd.6.1695880907095; 
 Wed, 27 Sep 2023 23:01:47 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.177])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a056402061a00b005313c60165asm9195535edv.77.2023.09.27.23.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 23:01:46 -0700 (PDT)
Message-ID: <35d861b5-eca0-c817-684c-e39a841f17db@tuxon.dev>
Date: Thu, 28 Sep 2023 09:01:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 1/7] drm: atmel-hlcdc: add flag and driver ops to
 differentiate XLCDC and HLCDC IP
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230927094732.490228-1-manikandan.m@microchip.com>
 <20230927094732.490228-2-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230927094732.490228-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Manikandan,

On 27.09.2023 12:47, Manikandan Muralidharan wrote:
> +void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
> +				    struct atmel_hlcdc_plane_state *state);
> +void atmel_xlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
> +				    struct atmel_hlcdc_plane_state *state);
> +void update_hlcdc_buffers(struct atmel_hlcdc_plane *plane,
> +			  struct atmel_hlcdc_plane_state *state,
> +			  u32 sr, int i);
> +void update_xlcdc_buffers(struct atmel_hlcdc_plane *plane,
> +			  struct atmel_hlcdc_plane_state *state,
> +			  u32 sr, int i);
> +void hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane);
> +void xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane);
> +void
> +atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
> +					  struct atmel_hlcdc_plane_state *state);
> +void
> +atmel_xlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
> +					  struct atmel_hlcdc_plane_state *state);
> +void hlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
> +			 struct atmel_hlcdc_dc *dc);
> +void xlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
> +			 struct atmel_hlcdc_dc *dc);
> +void hlcdc_csc_init(struct atmel_hlcdc_plane *plane,
> +		    const struct atmel_hlcdc_layer_desc *desc);
> +void xlcdc_csc_init(struct atmel_hlcdc_plane *plane,
> +		    const struct atmel_hlcdc_layer_desc *desc);
> +void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
> +		   const struct atmel_hlcdc_layer_desc *desc);
> +void xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
> +		   const struct atmel_hlcdc_layer_desc *desc);
> +

These are still here... Isn't the solution I proposed to you in the
previous version good enough?

Thank you,
Claudiu Beznea
