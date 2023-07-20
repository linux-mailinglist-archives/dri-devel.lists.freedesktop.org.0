Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F4C75AF1C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 15:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5610E125;
	Thu, 20 Jul 2023 13:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAFF10E125
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 13:05:05 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51e429e1eabso1005783a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 06:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689858304; x=1690463104; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PXEWaHqf0lWHOwfVBdFzP3gPi6ixm8kTT6knvLIOnrY=;
 b=wT923Xj1PAqxw+yaDhNJ/nUV/1XxpP2YqGKBg93pGqqICwOMUb0dd2qWkGps0F3RWv
 A9BYnTGB8k2Ky18llb2v3KVscxfx2n4NbBZYQU/nOjTRUYeVcwKvrbIxDaW5nFs/0hTf
 UGUk7Fr17e1IEPgeF1Qzvuole9rel2kVwbOhNDixj/ikRtx5sIMldhYoKXFxzBIthrSh
 HgCaqAFjrzZqqcNquDtWyne4GU/oTbwe4otfgdZA1SZA1EwVN6MRKYsbgrko6pkWXyjg
 uMpLOexle7flElpiGnShLxE4u16lsZnmcYSklUTMtphFCpZ7tCCpARdDy9JR1qqSSoot
 l6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689858304; x=1690463104;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PXEWaHqf0lWHOwfVBdFzP3gPi6ixm8kTT6knvLIOnrY=;
 b=OW0m5bNf6vu4kUXptYyMI59kUrqGMdvEtT46ur2+W1lt0ra+1dQljjTgVxNVc3HMaN
 r3GVsTeKT2H9UPuSqR/TPnBrkHcLvH/VmVbcmtuGDCp2/i0P1C1PSjKbUWuL/u/O23s0
 YkIDW7PqFKdKwH42PrvfAF8Ig+FZl5TB7h2aRq932i/qbBQ/Owd56h/QLawBHEotMyeZ
 TMt8Uuc+uzOHuxQFuxTdxaeX10rcVkhEtOlGRN3LDbYbjTms10F4rlMTRr3KFaLOYgAz
 TvQd+I9O0fQuwLnDd/bMZZsU6SfSlaD7N/rkzgvV5gCJ17oae88dpRQZeTA6aePwji76
 niVw==
X-Gm-Message-State: ABy/qLbqlfoV42uC9/tYLmWm9LYeD1dz1FLXSnR4oziDABguWOmSI6z2
 9R7HG7jx5tG/xifa/u0CxSYp4g==
X-Google-Smtp-Source: APBJJlF3czr78AaBbYI9Dkak734DtCkiU5pcGw2eai4oYTX2OPvmfRHYRclHZY5ITbbeNeFmedVu8w==
X-Received: by 2002:aa7:c1cc:0:b0:51e:ca0:8a2e with SMTP id
 d12-20020aa7c1cc000000b0051e0ca08a2emr4997368edp.36.1689858304071; 
 Thu, 20 Jul 2023 06:05:04 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 x19-20020aa7d393000000b0051bec856cb4sm734747edq.50.2023.07.20.06.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 06:05:03 -0700 (PDT)
Message-ID: <9d73d7e8-98ae-e5f1-706d-8c6128f2877b@baylibre.com>
Date: Thu, 20 Jul 2023 15:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 07/11] drm/mediatek: dp: Avoid mutex locks if audio is
 not supported/enabled
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-8-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-8-angelogioacchino.delregno@collabora.com>
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



On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> If a controller (usually, eDP!) does not support audio, or audio is not
> enabled because the endpoint has no audio support, it's useless to lock
> a mutex only to unlock it right after because there's no .plugged_cb().
> 
> Check if the audio is supported and enabled before locking the mutex in
> mtk_dp_update_plugged_status(): if not, we simply return immediately.
> 
> While at it, since the update_plugged_status_lock mutex would not be
> used if the controller doesn't support audio at all, initialize it
> only if `audio_supported` is true.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
