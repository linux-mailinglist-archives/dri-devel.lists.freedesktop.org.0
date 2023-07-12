Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D3475091D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF6E10E51D;
	Wed, 12 Jul 2023 13:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8889410E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:03:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc12181b6so74615395e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689166983; x=1691758983; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bSRULxvfLJxd6xzB1HBFWn8lQ9a6bu29n+o7ble+0oM=;
 b=2Z6WUbg1BWfF9ziHsWsCLY+MUOoAcNFaklTXzSkZTQAlSdmVciQlqSxCkebunsw77u
 LsGvxOMKtNSVgfYjLdg5YVqbnOhiP8Kx0cNvc/UFKgVNXQRKEjCW76Hlm0N+iOv5ItJD
 Mc7CXlmor8Owt0aQp+syL2YDWzajC1YpA9b52xkVguI+01mIMcL0kgOHMvuj8vFS4h0y
 AUYeP1rYDTEW6z0s8cHCdBxrYYD0YRZ85jXAstxebOFMV6J7tD+TQECeCWUdxYJnL7WR
 sotm903lEjclBbYdIgSygvPzQk/sm2XkskduBMCxydqTWvnd/9EX5Xkhn25oYf6hjHxM
 0Frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689166983; x=1691758983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bSRULxvfLJxd6xzB1HBFWn8lQ9a6bu29n+o7ble+0oM=;
 b=ab71bnvnygJQa4HXPXufic6g/ZBVgHuOfVNrhxqNYVXrDxindzIwyfBpPsHqMLhSPU
 juZxoAPZk6NcBwBOJr8HYMjQCCsmhrrrW/KXwvfyVasLGVTu25qJK0iV5O/g7ljwCsiV
 ifylqAwhp2Jb5NEX0OgDl6MkvaDJEiQLrDp9AVln2eUw3f+41Wdex87wnI9Yj/uuDRq5
 bYiVbeWQq2bKs976vBDwzdlmLxMy4qnQ9ZgRXxHTOUKCW9ZyX28+OQLXL5RxwM/yBvMy
 SNuURos2L6MklgTAFLv4ydKvk0jaTK61lsIx+wOWhjrKDimUA6A7ytXW/viSX9il4IHv
 /cwQ==
X-Gm-Message-State: ABy/qLYuEobMbwF89Dc0DROhxwYU7TH55emqN2cs6TbPmoqvFSFPDGrU
 m3B9kxMbDCAsntiRMEBvtIDj/w==
X-Google-Smtp-Source: APBJJlGSQc4f/DWJNPIm30X0RCk8ibYVWS/PzA68G9YIu/iC0V9OZ7UmT4v3sNNuC5ijsDPsj3unFQ==
X-Received: by 2002:a7b:cd8e:0:b0:3f9:b9e7:2f8d with SMTP id
 y14-20020a7bcd8e000000b003f9b9e72f8dmr17191551wmj.2.1689166982085; 
 Wed, 12 Jul 2023 06:03:02 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a1ced03000000b003fc0062f0f8sm5101025wmh.9.2023.07.12.06.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 06:03:01 -0700 (PDT)
Message-ID: <c331bfa3-443d-0976-fb14-e6e97fbd7d58@baylibre.com>
Date: Wed, 12 Jul 2023 15:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] drm/mediatek: Fix iommu fault by swapping FBs
 after updating plane state
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230710093253.32224-1-jason-jh.lin@mediatek.com>
 <20230710093253.32224-2-jason-jh.lin@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230710093253.32224-2-jason-jh.lin@mediatek.com>
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
> According to the comment in drm_atomic_helper_async_commit(),
> we should make sure FBs have been swapped, so that cleanups in the
> new_state performs a cleanup in the old FB.
> 
> So we should move swapping FBs after calling mtk_plane_update_new_state(),
> to avoid using the old FB which could be freed.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
