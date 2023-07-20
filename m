Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3E75B13F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 16:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A8410E093;
	Thu, 20 Jul 2023 14:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F108210E093
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 14:30:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fc02a92dcfso7132665e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689863447; x=1690468247; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+p4cBe1pMgniHvXw2LuLYSKKIqQxquV7AY6YDbEUJdE=;
 b=oUUiGCS8pw8J7VoaCzy8JULE07XXLKQOywKwVV2oQdH9glG0suWrzfMxKYQOt3ySck
 Ts0lKmWd/zI8NUEFA7MocNG6AsBcCcndzq6dFmOETbgezPyI9Gt7rf2OlH64v+25Euau
 k9VG3h9NIkRhJXfLy3TxRJe9/sUX8C21mWgXHJYnipC/B0i+tTHZtGkiYoAC5Wa0BNTB
 6eJ3yjLPwsZqapd4dJadZng5ywjpfO4pFWOY51Zml2uoJZXQi29eGMyZhe/xuCT2mL5H
 YmT4g/d/TFxVLrKFvgheNOiI874jPDyzqzdVJJ2tOFcU+3kaW0OGccacJPta4HJuC8nb
 RDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689863447; x=1690468247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+p4cBe1pMgniHvXw2LuLYSKKIqQxquV7AY6YDbEUJdE=;
 b=Iarp/B372LtqvQ0AmVsK2auSegx0+pknQECwMT7//U5usbxV8wycgtb6KNfq9l01EB
 TDJbiSEk3yy8MXG/ynu4P2ov/A6jC2AjQvBzI2MHDnx2rtmE6arPfcNkDg7623dcCKIk
 xKFcMZomlzxQk9+h/TNkHPBb8aHwxf47hEa4ZabVxxScU740ZxrKspEi2KLqmWXNC1tO
 oUnG4ODH4I9lFkDE6orUKiVG7DAW1YsP/XEja9rrNuxjkRZm1gGG3gm1SCpJ1JLgXSf+
 kjbXC9YqKl27IBqfB7LIxlmGY0RHzZQCHoWlKsaKZcu2LiieFga/4+OM1Vf78cvpILOA
 aGQg==
X-Gm-Message-State: ABy/qLY9fCUa2ctZDg7bO3mwTxa7Cf397TGyO+XEQXCMXcXtxvOa72Z5
 6utWdCp5oeYazMaF3cicwQFSPhz5NIoCM3qNDPI=
X-Google-Smtp-Source: APBJJlGvGEcc3bxXa6+U1YfrxHHtDMiie6SxWyukbcPySyU+1GaZAiblUjugsW40vgKcbhSAJV0t3A==
X-Received: by 2002:a1c:7507:0:b0:3fc:f9c:a3e6 with SMTP id
 o7-20020a1c7507000000b003fc0f9ca3e6mr7262763wmc.9.1689863446765; 
 Thu, 20 Jul 2023 07:30:46 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a7bca4a000000b003fc00702f65sm4028031wml.46.2023.07.20.07.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 07:30:46 -0700 (PDT)
Message-ID: <a2bde8d7-8a30-3f29-b4bd-629416ae20c5@baylibre.com>
Date: Thu, 20 Jul 2023 16:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-10-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-10-angelogioacchino.delregno@collabora.com>
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
> For the eDP case we can support using aux-bus on MediaTek DP: this
> gives us the possibility to declare our panel as generic "panel-edp"
> which will automatically configure the timings and available modes
> via the EDID that we read from it.
> 
> To do this, move the panel parsing at the end of the probe function
> so that the hardware is initialized beforehand and also initialize
> the DPTX AUX block and power both on as, when we populate the
> aux-bus, the panel driver will trigger an EDID read to perform
> panel detection.
> 
> Last but not least, since now the AUX transfers can happen in the
> separated aux-bus, it was necessary to add an exclusion for the
> cable_plugged_in check in `mtk_dp_aux_transfer()` and the easiest
> way to do this is to simply ignore checking that when the bridge
> type is eDP.

-- 
Regards,
Alexandre
