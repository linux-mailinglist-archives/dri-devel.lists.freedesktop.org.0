Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24B66DF7A9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDC110E7FB;
	Wed, 12 Apr 2023 13:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF94B10E7FB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:49:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l26-20020a05600c1d1a00b003edd24054e0so8099123wms.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681307382; x=1683899382; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
 b=B9v3Cr72e/au74c7iF4mlnBofvVBf0by7QnZev1/Fg+aA5h0JtHabAGNwWsTm1dhJb
 QaHZJk3eU9ZK5/S+ufoY0/U9W83wj8VLxD2sX4rqNIlHS7bbp9sDlk6iqXgC1mTacuk4
 +RI4jowaObwXoqScKuNcmsqBGuxn86bKGkm97Dv1CgBDCmVWFt+tnlRyfPEBC9BpQZS2
 YDSEKlsByawXVG/u3DR52AD1jUzzVoJbsyNWCCHPx07GuxHSi/fktwXGh2oun3AqtCE6
 dJNXUJvNoW6UQrP40bI4//QvWskJftzd1z+RQhoRADiCG8FBuJYsaSPonV/kamY1STsa
 0GNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681307382; x=1683899382;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
 b=VW9Tr77SsHCvB9AsLIKiXM3JzcL/Gvm1s5uIvpc1uSNtHIPR1J5GuKEsgprbLmHJdq
 jUgh3T4B1glMR6MMV04dYlekl4YcOZ/Cx7nGA3IxqpnpC4BKW/DC1jGsQKAGOjLLB88R
 M+zKUYQyq3PXZ6sJzTcIPsqoij2IvaJ6dJu0CHxO1UACnhtNtXY4lmehFx45RY4hD4Iw
 SAmyY6TQLc1ItT/8EOAELN/tUQRSCkA0nwP6CE1YvEWnmEIKZlF4nHj4cF62uFWxC615
 MvLlxV+GmV7jB3xiEsZ8XLQB7YXwyclNdT8OJds6ejUM5BAFpj101trKp2aS2bURYYOa
 fWMQ==
X-Gm-Message-State: AAQBX9cLCcEO4jp13LSt2+HKS0M82NDMW7euOBYzeDSoinpZ6R1Tl/gw
 aK1cDc/qmACnrwJf3clbQV386A==
X-Google-Smtp-Source: AKy350ZXbR07ORT2zgwh1nwhJhmgY6mdrSYJvMKUTwK7WgHD/vtESiSZPZKxhQzGEBaaP+LS9j+LgQ==
X-Received: by 2002:a05:600c:ad2:b0:3ed:9ed7:d676 with SMTP id
 c18-20020a05600c0ad200b003ed9ed7d676mr5037319wmr.13.1681307382012; 
 Wed, 12 Apr 2023 06:49:42 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a1c5413000000b003edf2ae2432sm2466316wmb.7.2023.04.12.06.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:49:41 -0700 (PDT)
Message-ID: <de13cb5f-abf2-86b3-d2e0-2b1131cd8dfa@baylibre.com>
Date: Wed, 12 Apr 2023 15:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next 3/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
 <20230412064635.41315-3-yang.lee@linux.alibaba.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412064635.41315-3-yang.lee@linux.alibaba.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 08:46, Yang Li wrote:
> Remove variable 'res' and convert platform_get_resource(),
> devm_ioremap_resource() to a single call to
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Signed-off-by: Yang Li<yang.lee@linux.alibaba.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

