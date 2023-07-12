Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30236750927
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BE910E526;
	Wed, 12 Jul 2023 13:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579AF10E526
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:03:43 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fc02a92dcfso51564315e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689167021; x=1691759021; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3gVKLalCnKJyVFKEYA/aeQE5NMhQhDJSpVDflsC0RHE=;
 b=yS2Ymfgh8L3mPR+FT8+S9ZseYw10W47Ifo8rhgAW43xrjdyH9QSUS5LxotXGW4pM4j
 LCLIRcxYm/XsY4hUvCG9UZCcIeM+zOwsz2MCi+1Fce3BOGQ03vV56S7aLFXb3JTfLCzo
 nigRNcdTBLQka0/SbQJvcjYTp5xXsGeBqzYKX2NnMVmKQx/IGvqJ4rf2IhcIwl4dZKlN
 2PvDu/UtuPimR3goJZDNwu2DopYqClTptxG4Q8SEDCTVnjleElknDIndTBvPv270AqSH
 OGMg3kWOxudgkaggCpcRd2jwVY6HXoQNwGjd6uxLP3xmSaP41B8WjbbOBj2nwlpXl2et
 o7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689167021; x=1691759021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3gVKLalCnKJyVFKEYA/aeQE5NMhQhDJSpVDflsC0RHE=;
 b=Q2kJHAtcos1u6LnxU4hqCFy8PvKp6lXmYjTTGEUAnsp2Hwyk2as+FvUYOPgGvgnlou
 lrr1Omt7Cq39cMMOVVByDNbzk+dXLUkyk68cgEuFcoLFV78QYFjJoq1WuBwU7KTnC9pu
 WASOe/aVEmUKzPU+oOHHKK+uE2v8xN9H9FHC/DmDxyZOOSnl4WLXFPM1UhVJFYtVolaV
 NtyLg/BWaBKRHRjPbwEfPk80w89938nKPDvqJPkPn5buXoJO1VWOq6nBSz7PgWBG9507
 lIl2s3F77dDdkWEvQGAzehtAaNBxtI0D15hXW9U7T9fqXv0FZIC1p9qqvPSX8xwIW8m6
 6KMQ==
X-Gm-Message-State: ABy/qLYnPtslkcoQt4bCHY3UgY4QFmb+jIVf2dgfLy6FS1fmEMkXDqwM
 t+Mdy5Nr5PjpypwpQhmSqhw9eBu/DHDJ5swWRIg=
X-Google-Smtp-Source: APBJJlGI2b047RWaYG6CTnzPtae20KR5OjN1EgJIkCgV1cLrD0xJ5uB3HcXw1wrHwP5ZVgcWayCYmQ==
X-Received: by 2002:a5d:58cf:0:b0:313:f399:6cea with SMTP id
 o15-20020a5d58cf000000b00313f3996ceamr19407509wrf.4.1689167021315; 
 Wed, 12 Jul 2023 06:03:41 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5182000000b003143aa0ca8asm5082491wrv.13.2023.07.12.06.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 06:03:40 -0700 (PDT)
Message-ID: <3fd78e84-b16d-e1fc-85af-d19efafc83e0@baylibre.com>
Date: Wed, 12 Jul 2023 15:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] drm/mediatek: Fix iommu fault during crtc enabling
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230710093253.32224-1-jason-jh.lin@mediatek.com>
 <20230710093253.32224-3-jason-jh.lin@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230710093253.32224-3-jason-jh.lin@mediatek.com>
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



On 10/07/2023 11:32, Jason-JH.Lin wrote:
> OVL layer should not be enabled before crtc is enabled.
> The plane_state of drm_atomic_state is not sync to
> the plane_state stored in mtk_crtc during crtc enabling,
> so just set all planes to disabled.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
