Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF4712926
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 17:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B686D10E0F7;
	Fri, 26 May 2023 15:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3491F10E0F7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 15:08:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30adc69c0dbso361895f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685113728; x=1687705728; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RQDPpbfKxYac4dFfl3UOiv7iiv3UKto2YwW9RD/lJd4=;
 b=D8329d5gDBuupuw18ee7CiQedAqaHbalYu/5ad/0HLx8pzNJB/B/nXPqeXbg3zAn47
 UPrnWRMAm7bG90BMHhmY3n+VpBQQlENz9uTjY0+zpdv1cT8jbn49d562/eYMTZuYqhaE
 jYA1F+tj07JByXOexpqVnp32QWw6tjLsztNKTrHvXKu3Davn4xKVGIH1Y57SOpVjD20W
 OMAE1twiDb3hwtTTAn3q+ncHQjS6yUWcoP8TeAY32wV4CwfQ8TRSn904UgqFpjjw7VBD
 bzKazNedaXMHzxlBYF69bMm/ufjJ/1nFo4ejX/7ZVnMxqnyj/xDsr55nL9Aq142D8x7l
 6whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685113728; x=1687705728;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RQDPpbfKxYac4dFfl3UOiv7iiv3UKto2YwW9RD/lJd4=;
 b=VJGNZUpctXqe0rVTMXsiQ20HICSlfhD86NSpkvRUY34eo5x/3U+wOK7kw7J9v1KuGX
 zn/gXSdc5cNTzJsp2DadfojuEr6JzIWA6SxgM0An49bRa4zJ37Jbs6rfvsOVNGBalZxl
 QK6r3GLUKcdp0wtMQBg9TltzWh0DXdDiV6erm785xE77s4x9fy+sRccsot6SVYNO10D3
 pf5veRgoabkKdU2Mdl6WpGw7MdFPMTbG6fegGAOFvSRJdiQmQsNawSo0Lz04U8FlK5Qf
 iQVlHyRcDLvwkEuLwVIPdRu079hEKIlMi/BUalOiBqEUJ6FXQRgNdis+1ZWZ64Or4Gwj
 B5xg==
X-Gm-Message-State: AC+VfDygQASNvnIY3hCliGRBCg4hdOzuw41pA5/SUDeeJVIN47eI4uEo
 6x6cHaDcEoQexgjyj4DeAfgAbg==
X-Google-Smtp-Source: ACHHUZ6Ur52z92yD9zQLf8/rpAwoOXof7X3dA6SmUIkLpPmI1FzD2sW7X7Z8flkFpqVtem4zLqfZ0w==
X-Received: by 2002:a5d:6ac4:0:b0:309:e24:57b0 with SMTP id
 u4-20020a5d6ac4000000b003090e2457b0mr1955408wrw.30.1685113728030; 
 Fri, 26 May 2023 08:08:48 -0700 (PDT)
Received: from [10.1.4.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 10-20020a05600c228a00b003f42461ac75sm9055828wmf.12.2023.05.26.08.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 08:08:47 -0700 (PDT)
Message-ID: <f605a653-ba94-7a8c-1bfa-4c18f5d25da7@baylibre.com>
Date: Fri, 26 May 2023 17:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/7] drm/apu: allow platform driver to implement their own
 mmap function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-6-abailon@baylibre.com>
 <032699a0-9a43-953a-60e9-59a515a26cef@linaro.org>
Content-Language: en-US
From: Alexandre Bailon <abailon@baylibre.com>
In-Reply-To: <032699a0-9a43-953a-60e9-59a515a26cef@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 5/17/23 21:45, Krzysztof Kozlowski wrote:
> On 17/05/2023 16:52, Alexandre Bailon wrote:
>> From: Julien Stephan <jstephan@baylibre.com>
>>
>> By default we will call drm_gem_mmap() unless the apu driver has
>> declared it's own mmap handler.
>>
>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>> Reviewed-by: Julien Stephan <jstephan@baylibre.com>
> 
> One does not have to review own code. We all assume that we send good
> code which we do not have to review by ourselves (by the author). We
> also assume we make mistakes, which we cannot find, thus other person's
> review is important.
I am sorry, I am the one who made the misstake.
I squashed this patch with another one I made, lost my signedof and left 
the reviewed by which indeed doesn't make any sense.

Best Regards,
Alexandre
> 
> Adding own review tag suggests you added them mechanically, so I doubt
> that they really happened.
> 
> Anyway, your SoB is missing.
> 
> Best regards,
> Krzysztof
> 
