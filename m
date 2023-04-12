Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECED6DF7A3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687CE10E7FA;
	Wed, 12 Apr 2023 13:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E058F10E7FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:48:40 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 hg25-20020a05600c539900b003f05a99a841so14156451wmb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681307319; x=1683899319; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
 b=X5GLXeJDIHOwYV33b0gurB0ztbWSgIyEeiSSG0/C6Vpi4vK1fhMxGZNWKHD8UQZzjk
 RuUJfvCOgJehPIKFMlGxnNZAvJI9GIH8z0noUWQLiVAewf3Ov7fFOfl/1Ho2YD7CuH1v
 Mm0T1u3w2UKESMcBO8HOKdgRlp73K2s5Zp4rc3jAxXmWyikjLX9YlrbmWLIfo2SaHcy0
 uSFCHjhPiRlfecUqaDRr/qTj86ljC3cS5s8uM7A+xA/Kda0UKaKzVyd95X5aCn4lmbSq
 7H3VZFmtr/dj0eo6tq9m9Gn+I5n2PI7CSAnwklU5ceCFwMDUpTortZkODsAaWO8gUi/E
 eEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681307319; x=1683899319;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
 b=R/IyZEit1RkKg4rvinxFHU+lCWvtlPUM26hnYrK8dck5TgkI9Sp6YuT3oWo9/2oL69
 FdmzkL2yMeoZVeG6Wp4L5VZU6a58Dug2XGT2pDfCZUqftdnY/uqNj0ptbJdYPixIJ2Bf
 7u3vmDh+wca5K3g/ycuaeIbhkhBzT+uUnO1cyJfLQR4dRm0eE6TAFR9PaFEb5oxSiJyF
 mvaq8GRcBV2FwHKvDdMKNQp4Xpj0kjOQUQrmnZrPcPRiYeNU47XSts51kjuu6UCPFykO
 MoeYu1T2RjpFv31judrqrIxcSQRZP1VHkhXv0DzomMqK3EVYMOWUlr6eLkl7eXFFfCfh
 747Q==
X-Gm-Message-State: AAQBX9cRydp0CgA/DEsSUswpZvB490y2Cq5/HKrSyx062grI2dr1lEQw
 KgJWaRb81udSEXjNlQkBHuBaMw==
X-Google-Smtp-Source: AKy350Z/ROia9nB7VNPQp9VQ8QMdkRRPlJGnrcpi8r3HW5TGeAv0xb6C9Cd+EosDMxX9OgVXXjaA1w==
X-Received: by 2002:a05:600c:230c:b0:3ea:f73e:9d8a with SMTP id
 12-20020a05600c230c00b003eaf73e9d8amr12320568wmo.30.1681307318747; 
 Wed, 12 Apr 2023 06:48:38 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b003ed51cdb94csm2535939wmq.26.2023.04.12.06.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:48:38 -0700 (PDT)
Message-ID: <3dab974e-4244-feda-4b85-d48a18013219@baylibre.com>
Date: Wed, 12 Apr 2023 15:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next 1/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
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

