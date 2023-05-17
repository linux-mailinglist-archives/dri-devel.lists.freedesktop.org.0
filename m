Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E4707286
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 21:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C52510E470;
	Wed, 17 May 2023 19:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E3410E470
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 19:45:24 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-969f90d71d4so183467866b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684352722; x=1686944722;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DE2bkq/ui14lTBLwtUifajE1EvCpc5Pz1BLS66HrLtI=;
 b=pv0XlTzQm0AHDjnYWXA2DFOwY89iONL+pcihwOPnY2/55ELz63O65AuRo8sYRyVtfY
 j4tyirV1rIXbj4sCHOWqTTlOuOSMW2jmK6+rtIOpV7Ka2tulKz/6eWhdbUWijx9Bu6Gb
 ByIIf6pn51KS6teavMyaKat3eWK8I4nOHiWfDQvcdP/Uw0gfXBXnQIrIc/pz6cz6nVR5
 Iy4x6JykOjawxDUZa1NyETS4srgGmwuaVLOaP/oJC0+uKgaPHr9cFO+fpRAAlIcMNtcy
 nhs72woQacj+sq+ZLnu7DXHUJfQ74vtfFxKgtJUnmVCafSnNEWvepe5r3nD9pz3VWUP9
 vy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684352722; x=1686944722;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DE2bkq/ui14lTBLwtUifajE1EvCpc5Pz1BLS66HrLtI=;
 b=IGyjLRttPVJqM9ucM/f0OVK4p35L0qJWQFiNVI5w1+N9d4hXQw4/Ih6TVfFJ04RCJN
 4N5LurFGxvONmUtUKYvQ8yMUIiNziRgWU3oQw1v1XWv/eTYgx3xixqYVYIgOpSKmJwNB
 66zb/Et806OrlTYtpN9K4+5jkC/Z0GaFyiH7hPZHg1aeeu/3gC/53mj1LT225M16KmGz
 X+gV8yxw1vzpVJ6y6f+T4WS/I9ZaD4HfPYyS9buSsfnrlkF+KKVPkPeiEp6T5wqxd8mF
 cle2sB3W5ptmgoDAdczgoUv4svwvPk2X+waGjg0e2cqiiKZzZ6EvDJzf1ojgCIda8IfV
 f1RA==
X-Gm-Message-State: AC+VfDyQBSy9xutKWMDEJzPHEAVML6KlvosK9Aya+l5yOiWpmE219DSz
 uIrDupglS1U1tnox4Obbu0hEOQ==
X-Google-Smtp-Source: ACHHUZ6Tj8zelM2VZpR/AEzeGAQ8zj37niuO6NRBJvg0WI4NbhdxMvKTFTAAd3TJm0rHrq+VS/nWuA==
X-Received: by 2002:a17:906:eec9:b0:94f:73db:b390 with SMTP id
 wu9-20020a170906eec900b0094f73dbb390mr34695874ejb.65.1684352722678; 
 Wed, 17 May 2023 12:45:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7a:e7cc:21b3:c435?
 ([2a02:810d:15c0:828:d7a:e7cc:21b3:c435])
 by smtp.gmail.com with ESMTPSA id
 tf8-20020a1709078d8800b0096a2b6de3a4sm10504747ejc.122.2023.05.17.12.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 12:45:22 -0700 (PDT)
Message-ID: <032699a0-9a43-953a-60e9-59a515a26cef@linaro.org>
Date: Wed, 17 May 2023 21:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/7] drm/apu: allow platform driver to implement their own
 mmap function
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-6-abailon@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517145237.295461-6-abailon@baylibre.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 khilman@baylibre.com, jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2023 16:52, Alexandre Bailon wrote:
> From: Julien Stephan <jstephan@baylibre.com>
> 
> By default we will call drm_gem_mmap() unless the apu driver has
> declared it's own mmap handler.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> Reviewed-by: Julien Stephan <jstephan@baylibre.com>

One does not have to review own code. We all assume that we send good
code which we do not have to review by ourselves (by the author). We
also assume we make mistakes, which we cannot find, thus other person's
review is important.

Adding own review tag suggests you added them mechanically, so I doubt
that they really happened.

Anyway, your SoB is missing.

Best regards,
Krzysztof

