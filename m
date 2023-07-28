Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F31766DBB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142D710E6DC;
	Fri, 28 Jul 2023 13:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5524C10E6DC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:00:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe110de46dso3590605e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 06:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549207; x=1691154007; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dcKLSf6eqeHNfF6j88elstYU7E8m3+v2pua4wp1GvKY=;
 b=jIvtnVvWbUsKicso5gytUax24NIKW4KB/E3d7PJYP8WoWIer2+xxareZ6Mb+27Y22w
 WnqU/Y4WcQqqdjU4MYDkjAuecPOdh6OEG5DgbZJqX6UjVQJPtAu81xtpHR88WrvoMsD5
 hY88w9Nm9sniK0hoxVYbrVKKOKQK/BXMfbvCWjVCrm5cRovsuo7eeEG1NSs/Mh4RWPmf
 QHPJS4yQLUen13TXX/glq3sa20jl0fbPOdEKB8+uQ5XyAgS59khJxV6e3uemqgBhR4Qv
 s2DKMbFGUlLjCyFN+Wpa0xiAAANtLxJR1RQXAtAlJ42rIBhLJjA09upT9jlqIle7P7Hz
 uWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690549207; x=1691154007;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dcKLSf6eqeHNfF6j88elstYU7E8m3+v2pua4wp1GvKY=;
 b=Oex84YYSMCVieV57r+hRz7YJgyi0unNVA/9CDbtkn4KxYMu0qb0mRCKsJVgVGq58aH
 +nozayjr02h+Bs9+/P63LEzHv/S05DIPff3zBLfqktmn0CoSJFj9FFjTFCRxp1ONthYD
 PjleNCZFOlRb8vG2l0hevr14c+Tz93VhsrVesknht7sYuWwm0Rw5+yjR5pTzKHz/G+WZ
 M2VTvwR9G3h6cfCAFuQQaHLZHMTgipkuc5Hd1S78T95AuUBWYEZ/Ywuo8I/SKuHedG9f
 LiY7Q4O3MXkmdrUn4PPAJgfDIEipgO+OM/ZO/Pai3uqx1CYDjmPQr3PlAFs1kGIo2ywU
 LOwg==
X-Gm-Message-State: ABy/qLbGPPmraEFar2EYLinhulcwSNgm2evwCnQs5rUThI+HPQSg4swd
 dCqq/XG4AFQjng14l4ImbynLOg==
X-Google-Smtp-Source: APBJJlGuVwTkep94/YrL0o8XuTMW4QyNix57ZU5EauEPig4YFvwYocrHTQEry9NYmVRz7W36RYtFog==
X-Received: by 2002:a05:600c:2946:b0:3fe:6f7:60aa with SMTP id
 n6-20020a05600c294600b003fe06f760aamr1514434wmd.12.1690549206657; 
 Fri, 28 Jul 2023 06:00:06 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003fbd0c50ba2sm6994646wml.32.2023.07.28.06.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:00:06 -0700 (PDT)
Message-ID: <e695ddf2-b129-3671-2aec-6e96da3f8be5@baylibre.com>
Date: Fri, 28 Jul 2023 15:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 01/11] drm/mediatek: gamma: Adjust
 mtk_drm_gamma_set_common parameters
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-2-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-2-angelogioacchino.delregno@collabora.com>
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
Cc: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 27/07/2023 11:46, AngeloGioacchino Del Regno wrote:
> From: "Jason-JH.Lin"<jason-jh.lin@mediatek.com>
> 
> Adjust the parameters in mtk_drm_gamma_set_common()
>    - add (struct device *dev) to get lut_diff from gamma's driver data
>    - remove (bool lut_diff) and use false as default value in the function

-- 
Regards,
Alexandre
