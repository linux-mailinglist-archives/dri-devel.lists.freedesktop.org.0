Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BE9766DC3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074CA10E6E4;
	Fri, 28 Jul 2023 13:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A93410E6E4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:01:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3177f520802so1372833f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549261; x=1691154061; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bf2mVoVflay+UuUZTM6QyCoyU7R8Oct66Mg/IJM6lZU=;
 b=JME2b3NVifOSLmvYqpLZ6dYV47f3XRbiSi+7NW889mMqzoXpdDGEKdZWATqZ7ftWdW
 4QWqynSN7bqiM8sQyoTErVMsn/rG7A2MKbUZPyqjqZVGf9D5S1RFFphW0fLwAFwG+bS3
 VS16Jzgi129OW50T+WKR6QWKjI2kmfRp5k/rUK0w3WHXJX8mUsw75CKr9kvDgn/tjXj5
 Vw0+jkIWkzGyjfAdvbhUtv2pG88ihXQEyhshq0MGMI050Ul05iL+DM4oPI9ZHQ+Bt/u3
 ytD+hMbSidKRGWarh7IvfUVqrcJBjwrQYFa+cYgIqW0TIFfuGftfuibIsLfBh9R/Bnw+
 SsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690549261; x=1691154061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bf2mVoVflay+UuUZTM6QyCoyU7R8Oct66Mg/IJM6lZU=;
 b=QQUotNRW8csR9eDhcinswt/qtvofebjylTb3ayn0pJY84B03tltwVItm7KruSJ8Mc1
 NXSA4XZyV36TOcky4z5aFKrgODJbtx7RAb00RI3xtldlijqCjhedPVeKpw6rfo54dJ+1
 K5PA8HR4gM6BKLU/310SyUGtF80kVJrkhFeEtDeiG7wyrXWldKwxJpZrQKIsW7adI5Q6
 70jFsEfteJ7AUtKTXEsrPE5GYPQb/gmXH7Qs3Lq8DCqnJLQat/W5jEnJr3cHhvEnPm12
 wXPqut8cyKtCfrwoOnWEl/omO/QiNNpBZoLMUpNPLg/fHhLbvlpE9kjra8UyjV59stUt
 l4bA==
X-Gm-Message-State: ABy/qLY61q+CwoSEkF7czSmi7W8L7CRLSf/LlE9lm7MsAZt6VLebEkdd
 PpkCmZERjx9BZFOGJ/Z7B6lTYA==
X-Google-Smtp-Source: APBJJlGVqDRGmbAbM0+sd1YryU2znrhwu0i4M4Xf/2epgtob/BhmHayOa5M7HaMRl38LctbCDO00tg==
X-Received: by 2002:adf:e489:0:b0:317:5f35:854a with SMTP id
 i9-20020adfe489000000b003175f35854amr4674582wrm.13.1690549260939; 
 Fri, 28 Jul 2023 06:01:00 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a056000004800b003141a3c4353sm4809226wrx.30.2023.07.28.06.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:01:00 -0700 (PDT)
Message-ID: <05b6bfd6-5227-b146-f5c1-d47881300e6a@baylibre.com>
Date: Fri, 28 Jul 2023 15:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 05/11] drm/mediatek: gamma: Enable the Gamma LUT
 table only after programming
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-6-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-6-angelogioacchino.delregno@collabora.com>
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
> Move the write to DISP_GAMMA_CFG to enable the Gamma LUT to after
> programming the actual table to avoid potential visual glitches during
> table modification.
> 
> Note:
> GAMMA should get enabled in between vblanks, but this requires many
> efforts in order to make this happen, as that requires migrating all
> of the writes to make use of CMDQ instead of cpu writes and that's
> not trivial. For this reason, this patch only moves the LUT enable.
> The CMDQ rework will come at a later time.

-- 
Regards,
Alexandre
