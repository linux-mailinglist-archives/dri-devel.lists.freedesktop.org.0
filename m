Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D07D73836F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 14:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C702510E0D3;
	Wed, 21 Jun 2023 12:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421E210E0D3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 12:15:21 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so712131366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 05:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687349719; x=1689941719; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WILflar73P9grdlRUg9RO2U9WLt2s61ZgDHgOf0roCg=;
 b=fA/GToZx8rTkl4+8te9h0sgmdRmFX73L6r+lbNg9D+OIxz5sP/Hh/4vw1yEiS2brzx
 Eh8+ulOe891pexuYL28+KmrKf0hxfWpGiyLPYbH66ZRgS+nYwJBknEPqvpNFoWSaYKTA
 iGPg1hSa7mD/IYXnO6A81bLfXCKZ8owbM1wTTg6vEU+Jq9JihFKP7rZYuy5DAGwDsj6R
 IVmzrJB5seub/+/b1qyZKanzuT8ybBM3bkZJtM5f0SsAKo5HfxihUsTGzapMaoulw2Wi
 kCulasgakjKqR2j0Ff31/2BePi7GF+8WTquoLn/fYBfkquwyOoJZZnfXDmJlhg44U4iv
 CsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687349719; x=1689941719;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WILflar73P9grdlRUg9RO2U9WLt2s61ZgDHgOf0roCg=;
 b=Rk5d8CTAgpVR+t9E5D7Vx0oEtMC0bRQLyD2jwBjb+Es1NWMS2ab7o/TF7wCyj78zeW
 mQp/pWDh50wNTJ9W4Qx7gavSUuLj5JiSqb7AcmDisrCmJzH2viO7cFRpLRKl2IZMOhLi
 gE5pajmPh5IbeMlPllXDdYHvH2kPbLv6LeO9iA9F23s7qcWh3jHyRP8GEb/OlT5jpG40
 POFXKOQX5bu7sE/DWeMMz+hTcqdeXw0SSaCJDtJtKKPYO4H4YVYpcn517mRXaOgMkHoA
 PvPSrygYmBg1Mmw4Q6Ni0oXsegIVUosbnZirkVx1OX0Xlvmf/eT8eeR2WG8YJtnuUxdl
 pBBA==
X-Gm-Message-State: AC+VfDzG9M+4k7pjV2XEaYnrY1q9jldbbV2W8Yh+3rYyroN0F2IGNc9f
 u0PE0f+SRYb4mn3bpgPxvz0igQ==
X-Google-Smtp-Source: ACHHUZ7azvcvHBW+wPfSgRuwA0WGdeEm0dZ/FYXf5fv6pTmWqmIwCPGWA2q3H4YY5S3xPaR/CRr0KA==
X-Received: by 2002:a17:907:2da6:b0:988:99e:9798 with SMTP id
 gt38-20020a1709072da600b00988099e9798mr12028501ejc.43.1687349718972; 
 Wed, 21 Jun 2023 05:15:18 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 me16-20020a170906aed000b0098669cc16b2sm3017631ejb.83.2023.06.21.05.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 05:15:18 -0700 (PDT)
Message-ID: <b0a2d809-943b-d5fe-fbb4-32d23e501ae3@baylibre.com>
Date: Wed, 21 Jun 2023 14:15:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/4] drm/mediatek: Add cnt checking for coverity issue
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230621102247.10116-1-jason-jh.lin@mediatek.com>
 <20230621102247.10116-3-jason-jh.lin@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230621102247.10116-3-jason-jh.lin@mediatek.com>
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
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2023 12:22, Jason-JH.Lin wrote:
> CERT-C Characters and Strings (CERT STR31-C)
> all_drm_priv[cnt] evaluates to an address that could be at negative
> offset of an array.
> 
> In mtk_drm_get_all_drm_priv():
> Guarantee that storage for strings has sufficient space for character
> data and the null terminator.
> 
> So change cnt to unsigned int and check its max value.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
