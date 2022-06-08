Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF55432A3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 16:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0396310E374;
	Wed,  8 Jun 2022 14:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC5710E374
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 14:34:17 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h5so28686598wrb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 07:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=smuYMl0mhH56tDeHdXWNQOJZvruGPXatNdGHlD7YYTs=;
 b=lh/wsibIUywoWWz5yLN1RVAdkgCCFrBp+/s6WpZdSKwBaZHa3wcoks5skuKZz30cfP
 nSZWTrzWnqLrVP1W2Wk7qG5pXrVup+/0Wwy1s6utotmkgIgACXZfPb+9Y79qoUfX+oJ9
 ExKOMgNgf/jN6HJ6ywgE+i/QHy5irCgS3+L230B7vEM9DAXccGChvXIK5jIi7Z+x71Cc
 b0iNAVnZ9lvEzXnIlIjF1NlS2vyBb2eyTgxDgDrBW9qowNQ0Zwq9SSLVLFmfM2NmFXQo
 UOvufvy+J2IzDSJrbR/BjQxjf1cfYIk5QRwc+J6D2AYq1DnctbL2XqJq/7cEZA+q/GF6
 73QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=smuYMl0mhH56tDeHdXWNQOJZvruGPXatNdGHlD7YYTs=;
 b=zHZakWOlvqpyrSTCIMvAIWjbsRtlZcxNVsgK6A8mxeOCE/kw3IgKxXOKbWNTfQnn9D
 P0VRH5yS02AU0+7tGv93Tn6/gm04WtpXL9LHh8oJ0QLi3FVIol9dHgPrtQoFOjW+ZaY+
 Gkz8lWpzKc+vd+dAh77fkDw4b3Bjgmj1/IGXvIOvR1xd1sqozwDNo0IegyMrfzbauDBa
 GQX7228OJJxHkwlkUtRp0r8+pvvi0HHu0/1wbr0kGQ1Km/vIethXLGG/XwuCUq5rcu8M
 5X4ee/8IBGNv15mf2BGpgNq/ctHgBEPjpN/i/rgQRQR8jnaKKw/ImcpXDgg5Bn+4uEQv
 TSqg==
X-Gm-Message-State: AOAM533tq/nxMMfPyf/QwdrMJRtBwDh0Kp5oTRO+KGz2KUSSDbTMgCtd
 4c63wsfwLTZqNF88QCqqac+z5w==
X-Google-Smtp-Source: ABdhPJzA4yH9/T+sa0NpsuRjmT5XXk943o+/qsHi0qHrpaB16l7/vjdk7u5BWNDdUZEneCaB74mdag==
X-Received: by 2002:adf:f390:0:b0:218:4de4:510c with SMTP id
 m16-20020adff390000000b002184de4510cmr10350628wro.475.1654698855460; 
 Wed, 08 Jun 2022 07:34:15 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 bp3-20020a5d5a83000000b0020cff559b1dsm21061219wrb.47.2022.06.08.07.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 07:34:14 -0700 (PDT)
Date: Wed, 8 Jun 2022 15:34:12 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 3/4] backlight: ipaq_micro: Use backlight helper
Message-ID: <20220608143412.rbhk4ne7jwubzz6g@maple.lan>
References: <20220607190925.1134737-1-steve@sk2.org>
 <20220607190925.1134737-4-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607190925.1134737-4-steve@sk2.org>
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

On Tue, Jun 07, 2022 at 09:09:24PM +0200, Stephen Kitt wrote:
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
