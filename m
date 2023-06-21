Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF673737F0A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 11:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2359F10E0B0;
	Wed, 21 Jun 2023 09:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB7910E0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 09:34:01 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9881b9d8cbdso745757466b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687340039; x=1689932039; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ljGl+r+k1qbaLYIuL6tG07702g7IZr1fWRM+mo+h1Rs=;
 b=qAziTwFRi+PN2EIJAqo6CLMG8v1BgjgVrGJ3TOyUJe9FvL5/UBiAizWtsUc/fOBflk
 x9N7PA0xXWDdHjTYI2OAk5bIgwMrZ12xZi4hBr/PA/Q52tforWKejbIa+Bl1JX5NuXac
 j29s4Sz9n73z2jxc1D40fW0Yv3om1I+ge0rzg5yOiML2c/wCkIYBMezED7e0r1jkJBKt
 i4x0ROrnHUnFyXhSCykcsUOYjX9XOoD/xKFAuJALwh/z6TfkCnlRxg3QXTZUzfN/z5ZO
 Wf3fh9ZxYEiiSQL+JK/uCjRRLw5NOXJutgoilHNnlUXqPSKHjxkpUbQG6jpzSy/2hEiy
 Kcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687340039; x=1689932039;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ljGl+r+k1qbaLYIuL6tG07702g7IZr1fWRM+mo+h1Rs=;
 b=Fb1+LdBqIocuedn6yCprYvhFdNNPVX6FCLCngX5KAbG1qYg0Tl/oATptL1qKnqlQjc
 RUpLdP0MAkcL5OyfpLr8Cn50miwmtPj21yvQJg9qqwFKt3PQjelt1TIVj3XEhqxBzzsd
 W/y6UKBjhTpu6vPgd1iNnYwo+1nZYxFbAK7TlIjiytLlXBxErQyj//NNuV+L2P+ip3qz
 XjhqiaQvYT62xmUq17GKZj/hCSL7Op6PVuXX1qTGsq39rc/WyoK/72BlrHSW2/EuQuiG
 v1wbb9W4WeYX8+OPekrm/8YUxTGspnyCQ1wEO0ndjFdsgIMYGmnZHq+Rp9GlrdpTPFHc
 hKGw==
X-Gm-Message-State: AC+VfDxF/+Eee36lJWbGgUT8R5y/su42MKZMMW/6fT90f3y6r7gnCvJh
 E3XduIerKLqxHnCCF1hKdtqXZfhXVeMTApon/J0=
X-Google-Smtp-Source: ACHHUZ4JX2zU1zAxBi3DbRV4OCuh8CPKC1bJlK3xGSb5VZzjGA+4Pt30r2DDo2hInl2arzbiOPL/GQ==
X-Received: by 2002:a17:907:1ca3:b0:988:565f:bf46 with SMTP id
 nb35-20020a1709071ca300b00988565fbf46mr9062378ejc.32.1687340039335; 
 Wed, 21 Jun 2023 02:33:59 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a1709063b4600b009891da61b1asm2684086ejf.44.2023.06.21.02.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 02:33:58 -0700 (PDT)
Message-ID: <e4fc7141-5351-479c-368d-3d469c053a81@baylibre.com>
Date: Wed, 21 Jun 2023 11:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] drm/mediatek: Use dev_err_probe() in probe functions
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230608101209.126499-1-angelogioacchino.delregno@collabora.com>
 <20230608101209.126499-3-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608101209.126499-3-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2023 12:12, AngeloGioacchino Del Regno wrote:
> Convert all instances of dev_err() -> return to dev_err_probe() and
> where it makes sense to, change instances of `return ret` at the end
> of probe functions to `return 0`, as errors are returned earlier.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

