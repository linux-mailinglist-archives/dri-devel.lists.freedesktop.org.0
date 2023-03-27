Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275076C9C03
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE6110E23B;
	Mon, 27 Mar 2023 07:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C03B10E23B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:30:33 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id h8so31831284ede.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bTfaKKskPdyIPMxQE6a/OZWVaFKrOdK1xEfW52CBCmM=;
 b=Y9GsxCv7G6E0p6ZvWk21C73fKAs9IBGpMh/FZN6ZSAJ7D1/Me94re24lqWoczuW+KN
 X9YW++uh7j7DBBxGWHbn1JSvcZlwmucYoIsMkI6NCl/Y4cC0IRfFcShS7cEI5IrQ4Z0v
 Uc/cRIPuPnetg1MUX2dnHtaGYv42uR/G4YTasBVIgZ/MjmRZc+1VydR4Mdl8m4S1N54p
 JcAl1GzIND3r4bG4wxLdBZ2VA6WLOKc5KJoCXHWQXrgR6M9enYzxwqPFS0r2vx79BBJ0
 v/E8sQjV3dVddrnyy+fu5W1+lT06VkOaVyaB4HPXzo4Zw/ADExuPzpOG48LmabvljdTh
 89tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bTfaKKskPdyIPMxQE6a/OZWVaFKrOdK1xEfW52CBCmM=;
 b=3hEWckP1j/+Jf4GNU5PkaIXaS/1RYQbyW+OgaqMc1B/Ea/bo3dusYbyc7CnSJi6bzQ
 cU2I9a0OXcmlChA/WUpYF2d6jeEaXblX4+78Co5N41OEf10EF29f286qSeYG0R/ctnjo
 zOUSvMeV4bYiawi5dgSAJPrgMY4HBzSAL4jEjj5K4ejmrBdhE2QWAL7UWKHj+bkKu+CK
 ZnqOuipOWabjBjANmjyrBkx9SlQuUt5rjcHTbSzu6zjsC+a1X3zZmMmUmGOz77bgT+np
 IyJe9MzjOAUUiOgDEFI9vwDV3KC6/S8sMKDH8rAFAqy0bxrRHeVnehC+7P1tX79tJ5uk
 gsNg==
X-Gm-Message-State: AAQBX9dhBgtu6P4yldlZ5KzVilDz5T5MIRvOqTBMafOgKQvpGY4SpO+L
 irE246jjGK0Pe8N2Pg/LQBnXhQ==
X-Google-Smtp-Source: AKy350Yvk9Mfe+tV1ogObK7tgapZ69mC+Nui/Iefyic1/6+fRuWcWMqgZeHzROZdMnS4Sb/micJxnQ==
X-Received: by 2002:a17:906:2ecd:b0:931:636e:de5a with SMTP id
 s13-20020a1709062ecd00b00931636ede5amr11164773eji.31.1679902231990; 
 Mon, 27 Mar 2023 00:30:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:198e:c1a5:309b:d678?
 ([2a02:810d:15c0:828:198e:c1a5:309b:d678])
 by smtp.gmail.com with ESMTPSA id
 ia9-20020a170907a06900b00932b3e2c015sm12887688ejc.51.2023.03.27.00.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:30:31 -0700 (PDT)
Message-ID: <e27b4c0f-0cde-ecbd-c387-6098c39d0f02@linaro.org>
Date: Mon, 27 Mar 2023 09:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 RESEND 1/2] dt-bindings: gpu: mali-bifrost: Document
 nvmem for speedbin support
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com
References: <20230323090822.61766-1-angelogioacchino.delregno@collabora.com>
 <20230323090822.61766-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323090822.61766-2-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/03/2023 10:08, AngeloGioacchino Del Regno wrote:
> Some SoCs implementing ARM Mali GPUs may be subject to speed binning
> and the usable bin is read from nvmem: document the addition of nvmem
> and nvmem-cells for 'speed-bin'.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

