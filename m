Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CFB54329F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 16:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002D510E495;
	Wed,  8 Jun 2022 14:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131DC10E495
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 14:33:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k16so28643294wrg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WG0Tg8LMw+6v7cVOptDrWGidi6Emu/7DP7YsEfxFl6U=;
 b=w5ns9byp/YevaOrUVFMpt6yWKTxidJfob2R42ggpIXdfZryqVTt3BWo/JEXVWZr1j/
 8MQNNoSDO31sJw5ZxAGkWLRTguwolkAR3GkglPLBkfmQicHsLq0mpDWMII4t1rzJpDSJ
 1qHXNvuzp6rjxNOWug5lHVQ1Il0O3D1ScFGdxV1xsT2LMfxiK259cV7VikZuqUCgPH4Y
 abglkbFh7NIHE458XQ+pUluGsmU1Zvwx68tYsCfUfH4jlgyCZa/rIEjXR31fayXJJLKS
 imGwHjwGsoi0YKCMsil6mG/1USLI9QpcLwjnixUtFthbfRihxmZjOD7OcuAzV4fAmJI9
 /Umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WG0Tg8LMw+6v7cVOptDrWGidi6Emu/7DP7YsEfxFl6U=;
 b=Oq/BXq0G9J8rN6L6+qVN/qv9REwkzuRh2Uaavg8Lu4KOajP89Lh4tcN1JAD1o6a1L8
 ft24hV90+jtwuvhD6fEgI+ZSMUZg7ImKxSTbULrwzT8h8kDzdmFCZldigPPWP04799RF
 Di+sUQ4veATjOXyD6wgiJlHmqrimen0HLXHPPUcBxBYFa2Yx3O3tpBKPyl/PkdCtW7md
 OU76WRQMEKwyVGPiijxtyzQbSnIF+lj2ApoaBz8afMxB8TXn2qXwzIB/oYxLYleMdocU
 SaKV5hQXIPSXqKaljJ9O0tHMY0QS6/iiJ07IDIyf9wr55S1r0TVJsC9jvOoa3w2g3Zin
 5eoQ==
X-Gm-Message-State: AOAM530eRrU/AQJVC0B0Y9KI3r/1fnexAc1F9qJHsYImbFlyj/qiJfed
 ZOA8rQR7omw8NFZSt+wc0ZC5TA==
X-Google-Smtp-Source: ABdhPJxvKQxEHFDay/r4QAKbU2kqfhMU+/AqDh0VaknrdyOg+5OV5Q/qtMdENt7I/tH2UsYyr2+h+A==
X-Received: by 2002:a5d:5410:0:b0:218:5b98:425 with SMTP id
 g16-20020a5d5410000000b002185b980425mr4976962wrv.243.1654698818607; 
 Wed, 08 Jun 2022 07:33:38 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 o7-20020a5d62c7000000b0020fe86d340fsm21422134wrv.55.2022.06.08.07.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 07:33:38 -0700 (PDT)
Date: Wed, 8 Jun 2022 15:33:36 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 2/4] backlight: arcxcnn: Use backlight helper
Message-ID: <20220608143336.duk2g75jjnwxxa2g@maple.lan>
References: <20220607190925.1134737-1-steve@sk2.org>
 <20220607190925.1134737-3-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607190925.1134737-3-steve@sk2.org>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 09:09:23PM +0200, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
