Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A082A766DCB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0743010E6E7;
	Fri, 28 Jul 2023 13:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E2710E6E7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:01:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbc77e76abso21130165e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549316; x=1691154116; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KM9G9UWL460MIs8mOf1NTrNT8jPvFV0ecdNaflzST6o=;
 b=046PezP1WWtv6k0s1Qd7IazqPsZ7Mc4/Cb5Xdfdcm0LGbRFNtDxy7tcvfk4heZHqtK
 kuMMgOAAKuEMn4VsPefhlYkxjN3+a+0AAVZSGxx5ZBpMpmo3scR6Q5BKPhglz9jEvCMT
 xRUDEYA38LxXpU6hmyVMGBwJZF5IVOhGPvcF15Jz/hf7o35Uvp3CGGnc9wb0JxTzqf4z
 rgOeqCF4C2LO3bECXABhd3Hy+N++80m4QGxugzp5/4l4IgeVZhx6/7A65jfmEIdQH75K
 2px4uO1TbhQnQNnPeSiq1AokeTglJQwp8RcqM1TddI086DLJQzovjITFToz/yCeHg7jy
 JV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690549316; x=1691154116;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KM9G9UWL460MIs8mOf1NTrNT8jPvFV0ecdNaflzST6o=;
 b=P5R784rLcutnagKGKuKJSPDgjFlz2xLOoZ666x4xdKy3O1RhGFtdNpmJvvFgSZOtQs
 kcrBU5Nsf8aM9TieMnp+koWQyYrWCc+XRUNX7uG7UD+Jxp+oZmSoRA8dds5Yjp4Kl6qU
 cNb3EjMmet1jpUb6coPJ2Pao5Ii7dJInmdjIkleZvwkv7/iz9tHCecOBUWl+KjJRaNw0
 OGgdKIbsECkb0lI8vC8kRIeLcS0GMdxu2L4X1K2OHJDu7Ps5MgEw570syyRNYLDmt6rr
 Ttv+Jurlm1E/v8SPFY6LFxMtB+xVCiGVhYH+IRuTCgSFeMfFYVO6b26N198ReMhi5AhY
 WMZA==
X-Gm-Message-State: ABy/qLYB37cTtNqCeArjEQ9JEC531Ei2BroPDuAEWbPEgrSQ8ItytsQk
 i4Ng778h0EBYXnio8GLA5zBWTg==
X-Google-Smtp-Source: APBJJlEDFKNwbvv1WM27Au+d3FTJnT6D4PrRXlESZAGL6BtAJ9OoikVkz4a+s3hD1klzf2rdjQLeLg==
X-Received: by 2002:a05:600c:214d:b0:3fb:9ef2:157 with SMTP id
 v13-20020a05600c214d00b003fb9ef20157mr1592571wml.28.1690549316788; 
 Fri, 28 Jul 2023 06:01:56 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c020c00b003fa95f328afsm1505130wmi.29.2023.07.28.06.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:01:56 -0700 (PDT)
Message-ID: <e0d09d7f-09a3-748f-426f-beba43413fc7@baylibre.com>
Date: Fri, 28 Jul 2023 15:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 10/11] drm/mediatek: gamma: Make sure relay mode
 is disabled
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-11-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-11-angelogioacchino.delregno@collabora.com>
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 27/07/2023 11:46, AngeloGioacchino Del Regno wrote:
> Disable relay mode at the end of LUT programming to make sure that the
> processed image goes through.

-- 
Regards,
Alexandre
