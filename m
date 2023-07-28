Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4870D766DCE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6D710E6E9;
	Fri, 28 Jul 2023 13:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BF910E6E8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:02:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc244d307so22508535e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549336; x=1691154136; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v0IweAoRlrs81Hqx3ju5nKOAZc7hekwdByAQiZx3BgI=;
 b=MFIkdh2MxKwZLX00E+7feiCDIvAAfb+BjKqW1IYNP9UN+HZbLXUXjV3zIGMQtXOjrz
 ljVocwo7jsA+CZLnvltvU+cqIYP7zwcGnDSI6GA0W7czWDL19UmROBhbo6JtVK5wkW2H
 r6MKh85kYkdzrREN+SPXU2ctkr5nS3Vsxu/o93KCsqmdis81mV9pcHtq9KooPM1d5L3K
 ExdpkIK/rh/dDXyYxwhmq5POxbiTmkfMg4wa01ZMPXlB38xDJ0I5739PFy6ujC8yHVvt
 JA95yIC6iHks4izPJBfwVj5HfqT28YGi5BKfjwhaCBKY+IOF4AvoA+UHhMVk/HbjBHzi
 6YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690549336; x=1691154136;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v0IweAoRlrs81Hqx3ju5nKOAZc7hekwdByAQiZx3BgI=;
 b=hiWbgIGvpMn806lKB+S2kkdLqC6eHHmJFp5X8Lohq2y7jdGlz2rC1V+K+HZeLnDHFf
 4Cudh1/3wlwb4Q/F8hPZl/hXJGK00VqJssPy++B7eodIIxXcRnzM6oVaBUG2gehjNx/U
 Ebi9iS7AXriz9I6ND7m7Mfg4TIKisYaxbR6dr3fZ7ALOFP1oCnlWySQkdnzTi+4U7rTj
 KUfAV2kF20EcBpu+5/E3D8U5dbij5zIR40+d/TaLsnOabIYmiNamVSpxOUc0UzdlHtqG
 /drz2c9aA8oEPrnmGoQoPwiA0k8BXU+sYGjFyOB6NpY8bpi6epdldJXmiuji/8Xf3U3b
 veEA==
X-Gm-Message-State: ABy/qLZv0XLGGY9OfVwSoFDpCYzv5nvSY2wJIWhrhklNXJ+FBRyLwsDa
 CY+oIOiZZBa/SosYh8gDDiNpQQ==
X-Google-Smtp-Source: APBJJlE6Qtmoe8hIQ8IB/hjAI5S514771NnW9Mpe7jo8MzfBMxn3T4fQGMpr8MjUP0wB+/7mlCn3Bw==
X-Received: by 2002:a05:600c:2288:b0:3f6:9634:c8d6 with SMTP id
 8-20020a05600c228800b003f69634c8d6mr1572683wmf.18.1690549335836; 
 Fri, 28 Jul 2023 06:02:15 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c025200b003fd2d33f972sm6925221wmj.38.2023.07.28.06.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:02:15 -0700 (PDT)
Message-ID: <b6c962ad-d5f5-bcb2-42b6-7d956b0ec3de@baylibre.com>
Date: Fri, 28 Jul 2023 15:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 11/11] drm/mediatek: gamma: Program gamma LUT
 type for descending or rising
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-12-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-12-angelogioacchino.delregno@collabora.com>
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 27/07/2023 11:46, AngeloGioacchino Del Regno wrote:
> All of the SoCs that don't have dithering control in the gamma IP
> have got a GAMMA_LUT_TYPE bit that tells to the IP if the LUT is
> "descending" (bit set) or "rising" (bit cleared): make sure to set
> it correctly after programming the LUT.

-- 
Regards,
Alexandre
