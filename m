Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6218875B39C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 17:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA9310E15C;
	Thu, 20 Jul 2023 15:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6FC10E15C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 15:56:11 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc59de0e2so7861255e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868570; x=1690473370; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cDZiEbAryDtT6b4dJ7CPGyIFUH+xNqjsXBnjfT/64bw=;
 b=cSR12mqNhibdO0PRFT43zOAR0T3KpTWjOTJf6mtMCd5S2VfDkUvrRiHzfUN+ysC76G
 1Vz/wz9kexOGjG/HNgqMJ/Yt+K3aiYoN6SAElL4uUDDmi2msQiHOt2NLoOTDE3K0WhJx
 UltMt+hDQOlriTB0Be7nM5Qe7LSAmx7WnrYcXbW/mzt7LGAQuaVDcsTOjJ57sfWMpZYv
 5xK/WXx174ScXkHqFQAJvisYnu3Pqf4O9XbgOkbWw92Xq3CcdiJtzXEWV39OQGwvbmj5
 Kb1xH8cLb8wgUYjhbDABBgs082b/3ReRSdMP8DXtMqdrahQd8YEY4KW6xjrxW3SjkxRK
 qAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689868570; x=1690473370;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cDZiEbAryDtT6b4dJ7CPGyIFUH+xNqjsXBnjfT/64bw=;
 b=HUesFpQ6R+/7KCBLawJKk9tUZ6Lz+SSlPQO1JwhEesZsqgBiNpj4VQCAsnLK/75utg
 kxp5PuLqz9EhLQ+uyDlBlbjEUZ7CDYbUVOKaOnlIHlj8VTGFeM5rs2nbNtBH3wtlmvn2
 pdX1KTElkiSITPhlIK0ERch0rDbBWY0aZz10rHxU6Rwuh4emrEX209to+BQL8ggasqNv
 lzBEQAvUxsCo4taaJwOtzrvqEPFNdR94/qfNxCRtcxVVoWnfv5CB5vlxyJA/gFME2unF
 tgr/oVYFpQJKmSJlPQ8IJY/wLeKq48nGFqxjQbHRJZVhpipkTKA5ekJuDzSZaOVAyX4d
 OBwg==
X-Gm-Message-State: ABy/qLaQkphI6dMXUA46K+9PaFuyrTSV9hyFiA3mRbxlrz5e4SZpTFSB
 0HbSlGm6eBzes6ksgpMroILkBQ==
X-Google-Smtp-Source: APBJJlHkaJLHeTVodXnfjyaWtUl9ixUdRLHPGNnR93G3Z+1iFPPtUHNv6avOf2uwAq+mH+s77ZG5Kw==
X-Received: by 2002:a1c:7507:0:b0:3fc:f9c:a3e6 with SMTP id
 o7-20020a1c7507000000b003fc0f9ca3e6mr7462943wmc.9.1689868570376; 
 Thu, 20 Jul 2023 08:56:10 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c00c600b003fbb5142c4bsm4285451wmm.18.2023.07.20.08.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 08:56:09 -0700 (PDT)
Message-ID: <21596789-71c0-351e-bfc7-8e81c7b1b175@baylibre.com>
Date: Thu, 20 Jul 2023 17:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 01/11] drm/mediatek: dp: Add missing error checks in
 mtk_dp_parse_capabilities
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-2-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-2-angelogioacchino.delregno@collabora.com>
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
> If reading the RX capabilities fails the training pattern will be set
> wrongly: add error checking for drm_dp_read_dpcd_caps() and return if
> anything went wrong with it.
> 
> While at it, also add a less critical error check when writing to
> clear the ESI0 IRQ vector.

-- 
Regards,
Alexandre
