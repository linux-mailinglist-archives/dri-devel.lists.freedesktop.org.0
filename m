Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654BD737DD2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D8C10E090;
	Wed, 21 Jun 2023 08:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760B910E090
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:51:29 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso766128566b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 01:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687337487; x=1689929487; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BRHVPNSU4tTJknHFfi1ELNcDLjA797fSO46AAYSa8NA=;
 b=zLOYR94ak5xNuZ9vkx8rHsN1IHzUV5POeqdCxnIsDiiVHzTlukQzfWFowBT2b763th
 lXQvt/kpXCqhYwgLAmycyBm8lk3kpJjLv/Hb0aiFYfeh1m66o2267yFtwKSjWRyLwuAd
 FlsljOxQ7W0w7+LiQ/XVI1rh2r39dB4lP7zQqzS3o40l4GJJ0p/yL++nLiK0jxzbL/yp
 wnGk5bfRYG9TmpMk0M9P5TJGhaArdImW0D/NPkY2DPkqZn5DO7XsuIYi2YXMv9vyTcZP
 twbTY/O44MImRRXBL3SjU3VtlXCnBsQiNG1qqEzh6AMbqRGNiQhqCFP5IiEgE57jrTA0
 7SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687337487; x=1689929487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BRHVPNSU4tTJknHFfi1ELNcDLjA797fSO46AAYSa8NA=;
 b=hIpxSY9jS4yNnqWMX0CNP6GO2JnvkEtG0R7L3QIvrt4lq5FKVkK2ijsArCaffOF/AH
 SBcnuHGFY1ojCjsG8rZNmO3YDgC5pxcNjs3pyeZH8Z6iWCFBwt80fU+Lw2GtqO7Igpq9
 6JbqkhmaYp0JV/8YRN6PuMjxEqjhi3lQnjiLKNveeoR++Fz7hFi335n/k9DcaoFLKwW0
 3MqPa+Ao/EXbcIvKtJQUXbK/+M5xYM1sI9XLEpHKNmHAgyCIOp2FbM9K7koRObqgaGtY
 VTKaCAxuxR39BLDpRiOZ3irGq5OOoC/LRd99+sW6ZMeGMqR5PFXJZNQBqs5mxwaRymHu
 kePg==
X-Gm-Message-State: AC+VfDyT17NmsSlNBmTs6lO1FGKuG25H0ir+ZaEurHqyOLjKe6TUBLdz
 RCUuQ/a3G36A2S0nX4Gi42eMXw==
X-Google-Smtp-Source: ACHHUZ7FqSCbAkzrs5As8CZOClg9+TI9Bl1lOHwdAwPH8D2STs07dFYCsBwi/Lit2QpJGi+hd1Y1iQ==
X-Received: by 2002:a17:907:3e0a:b0:982:45ca:ac06 with SMTP id
 hp10-20020a1709073e0a00b0098245caac06mr14025701ejc.60.1687337486873; 
 Wed, 21 Jun 2023 01:51:26 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170906134e00b009828e26e519sm2693980ejb.122.2023.06.21.01.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 01:51:26 -0700 (PDT)
Message-ID: <c254802f-91fd-a9b7-e792-5f450dae0569@baylibre.com>
Date: Wed, 21 Jun 2023 10:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/mediatek: Use
 devm_platform_get_and_ioremap_resource()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230608101209.126499-1-angelogioacchino.delregno@collabora.com>
 <20230608101209.126499-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608101209.126499-2-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2023 12:12, AngeloGioacchino Del Regno wrote:
> Instead of open coding calls to platform_get_resource() followed by
> devm_ioremap_resource(), perform a single call to the helper
> devm_platform_get_and_ioremap_resource().
> 
> This commit brings no functional changes.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

