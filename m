Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6237771D56
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 11:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC4210E1E1;
	Mon,  7 Aug 2023 09:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D227F10E1E1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 09:45:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so3766198f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 02:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691401537; x=1692006337; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ImTxFrGkAb789gW58cUuVJn9oePTNlXvzPB5nJrZCQ4=;
 b=F8E8v6VCabwPufDFg52rLMuhHjcVTlKRIkxSchTMvPMZvYyrHlb88+ruQSwa9aS8o+
 ecPuJfre8m1B3T9UCIUAWhmtm8WxAEJP/1vvCQulIVBvbuAvIcLrFAeIwG7fvHp6xYyW
 rS2Q/C/CaNvFsf2mvN/RElo/LPHvXfCZxeDnKOACOZFS1rN5USa+JIugANj1tKyraWz2
 lwnOwzQO0UoH01bs1joHvmBKFe27HdhKZxO2cxH97j51YKJKWkaqGSEe03V/Dhy5a3yR
 HWWq0IA29ZPUkeHH/kjNQH3mlNVUB9jY7+Fzsljudd5LBNYDTjEbAdD76wnUXJckbCWs
 92xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691401537; x=1692006337;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ImTxFrGkAb789gW58cUuVJn9oePTNlXvzPB5nJrZCQ4=;
 b=lJW8sUlZCv135N7+cUbWF6mkKUg4zedbYlHYURiC+LCYhexiS02eK0MFkLjUDoJl/p
 HWMQYPSU1RLo0xxGw/zZG29yidroURVH545V9SXzxrwIO3JAZG+mX5K+zUvg+e4vjast
 COJWaAuJBa6YmOYvFTJhJF8Mfc1BIM0Rw0oSGlifj82tnygyt1IHDz8dTGuj5pFMngrA
 Jjd+ecLGQXUuEwDW9JKnpBCn9IHaxLrcO6/JTeB68VJkmVnIzn1qUFcC5iNGuSdNx8kF
 wXU/ksZ2qmmYULU/QrHqi0t74VMoCC0KDeqvL7usjVwXILPrTyFMJ5JzoPSIzpLTSCTM
 zVrA==
X-Gm-Message-State: AOJu0YwByTUHX2F2BbB+ucnvKUtNJumshHq9l7koIfyiJplaEpi908TR
 cZozo5YC91YN4FkMDXHrq2ef6w==
X-Google-Smtp-Source: AGHT+IHz363ez884R4/+bJfvf59hexuHu1VfipBNOcFTwW09jwsazFEehtYVAJh1NXc2ExFcVlICdw==
X-Received: by 2002:adf:ff8c:0:b0:317:df3e:13d with SMTP id
 j12-20020adfff8c000000b00317df3e013dmr3290134wrr.38.1691401536950; 
 Mon, 07 Aug 2023 02:45:36 -0700 (PDT)
Received: from [192.168.3.194] ([89.226.188.45])
 by smtp.gmail.com with ESMTPSA id
 w17-20020adff9d1000000b00301a351a8d6sm10042906wrr.84.2023.08.07.02.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 02:45:36 -0700 (PDT)
Message-ID: <98fe8211-52b4-37ec-a0eb-7dc0ae5a0615@baylibre.com>
Date: Mon, 7 Aug 2023 11:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v4 2/2] drm/mediatek: Fix iommu fault during crtc
 enabling
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230807015110.30579-1-jason-jh.lin@mediatek.com>
 <20230807015110.30579-3-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230807015110.30579-3-jason-jh.lin@mediatek.com>
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
Cc: Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

You forgot to put the Reviewed-by got from the V3 in your commit message.


On 07/08/2023 03:51, Jason-JH.Lin wrote:
> The plane_state of drm_atomic_state is not sync to the mtk_plane_state
> stored in mtk_crtc during crtc enabling.
> 
> So we need to update the mtk_plane_state stored in mtk_crtc by the
> drm_atomic_state carried from mtk_drm_crtc_atomic_enable().
> 
> While updating mtk_plane_state, OVL layer should be disabled when the fb
> in plane_state of drm_atomic_state is NULL.
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> Change in RESEND v4:
> Remove redundant plane_state assigning.
> ---


-- 
Regards,
Alexandre
