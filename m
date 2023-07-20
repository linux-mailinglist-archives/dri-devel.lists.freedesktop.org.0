Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C7E75B3AC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 17:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C190510E5CB;
	Thu, 20 Jul 2023 15:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5006110E5CB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 15:59:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3158a5e64b6so816283f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 08:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868787; x=1690473587; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UcoTh2sPWLNGHJ3Cv2AGwq+IgylpFtXMhSdz8hYISoE=;
 b=UmPa1+4v/9o9mWbgQ4+lTjHyeeBR6u7UK62B2H1gjePd9O4M5WG8vZ1+10En2Ioyht
 DQukURnmcZUFBpmE1xXeoKbtLz+nZffiIBRaLXOd1l5bv875j7Y2Cdoj4I8fzGfFqrDv
 y7CHlWO74e94RmAnpjS2RfG/G9ccZzWjI+6B64dprmx+qFwc7h/V8M/IplqFotElaQnO
 5M2XhPFrSM2KpYSY6I0T9BB9XatgwC8EPBZQR2YXgGKjq7X/cl8whnHow22WHEU4iVPd
 ww0CAnHyjJivEC8nxFwsV1d4w6mtiaUfK+RCeBZIBYJ55mk0+O16BrueLUcB92Eftq2v
 CtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689868787; x=1690473587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UcoTh2sPWLNGHJ3Cv2AGwq+IgylpFtXMhSdz8hYISoE=;
 b=CxPV3J1NhFyFVXMYrpu9/qNBFGQqS8MBLb7opSmdKOzOAwdUWC513iMDcWlusJOZlb
 LQR5XXEvz9n4BC9QrNUJJjO1BfJVBg8zyg0SJ7DKjMeDyZQ8WZuJZHLyveS5Ik6vFA6m
 YjzrSQPQ9LWA+O8KdtGbn4U7wwJhbW2Qe2ZHAGg3WStl5LZ4kY0udliRbdCuYifYTrNX
 Hf8J4/B0r92p+S8DHyctBTTIpQIvznWQwNRGFxozizhz75tgf0DHYbu8uudKX6773YsV
 zM2zES6LqqRU1WmmkJy5AL/htHo0QCHCkrdO1kCU4B6flRjPY/giVsbjwsknbhfg1dGb
 pZKw==
X-Gm-Message-State: ABy/qLbPYX3Fww3MtkbqmkyFc/LrqV3sxUiux/65qtTe1xGzoC6mFdDV
 kVYBvIw0/Od9u7j53lpXKs60UQ==
X-Google-Smtp-Source: APBJJlFJuKiSkpnQvuDgXExLT/wiie2rFVl7aKA4X/43U+4HxIZMk304KppNq+dx3eQW0WuzlLtphg==
X-Received: by 2002:a5d:530b:0:b0:317:ee5:b657 with SMTP id
 e11-20020a5d530b000000b003170ee5b657mr2227731wrv.44.1689868786711; 
 Thu, 20 Jul 2023 08:59:46 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b003144b95e1ecsm1685245wrz.93.2023.07.20.08.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 08:59:46 -0700 (PDT)
Message-ID: <89c36f34-5172-8a88-c389-0cd338458371@baylibre.com>
Date: Thu, 20 Jul 2023 17:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 05/11] drm/mediatek: dp: Move AUX_P0 setting to
 mtk_dp_initialize_aux_settings()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-6-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-6-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> Move the register write to MTK_DP_AUX_P0_3690 to set the AUX reply mode
> to function mtk_dp_initialize_aux_settings(), as this is effectively
> part of the DPTX AUX setup sequence.

-- 
Regards,
Alexandre
