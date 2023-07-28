Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 465FF766DC1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5371410E6E3;
	Fri, 28 Jul 2023 13:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7FB10E6E3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:00:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fe104df822so4444115e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 06:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549244; x=1691154044; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aQ7TENtsQkFhqj90o2fCA4gySBLYYAXohXgU0sJf+S4=;
 b=TdgjYD7E5glMNvLk6eOm8Wy4ecM1zmFsHffYKx7OaFpA70eMULEUlnhr6EL5yhYphW
 ZXgzaO13Wjwqi+BroISZ6BxBCOYa39GX3b9vqNLkACsaxu4Rw0XUYwypzCS1i6uPP4fV
 BZHq9PktFfwqULKVHpjNjOachoMGI7Fs5IbtzmHdqJnmKvQpb3qyXiMYwQtZq5y7pmpP
 USfLCCn74J/L4j285lKh2BfAh3Q5EgT44fgFVkVj2SW737O2dF2yiCo7MVfUxL/apsgc
 k5/ZGfkKcLpKJuUzSK00u49bww46McJbYi3k57a/JbSlZObpfe+UmTNo4rJmsYOJRmzM
 38tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690549244; x=1691154044;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aQ7TENtsQkFhqj90o2fCA4gySBLYYAXohXgU0sJf+S4=;
 b=M7L1DpKFqRsDN1/D0SdI8ui6OzxIvZ+uH9emSK8/VRiDW2acfacQUYG/tG5qrEs0lQ
 mwIvmAHkBIhUAg8rAT3yjuUd8t0fnhvI3qKdAtA0yz8LFnSDpUJdzZfIBqEJhJOXHOzR
 ZSO2HJIKu42UNimfbbs8h4UztMfbSNuo4fZkv5AMzquNbRWFNomdk+UYuSeuUN6vB3h2
 UJPNXydKPyMnYDm4KU7JDxrUdZaMNY8lnQNpbk+RYD6lyItFB58tn4CDcHmNl/zwn4VO
 jwoSF0Y8etcZM6MGQP9+5EVwbF4EVPGVOSI5t4C37avLZ8H1/QyuhyauKn0cQUHKoTE4
 1SKQ==
X-Gm-Message-State: ABy/qLakPaMmjslAsI+nYvkw/Xu2woOOaK9FzVQS7f0xaG6OsWEkrG01
 +MHymtRR+YxpAnB/xbZpswcFiQ==
X-Google-Smtp-Source: APBJJlEOKfW1ZGAJOsrsnkH2CgAX1ClU5jm83vu2VnugwVvxyESowVTnZPErdgM6iYKniY4urP6VQA==
X-Received: by 2002:a7b:cd0c:0:b0:3f9:b244:c294 with SMTP id
 f12-20020a7bcd0c000000b003f9b244c294mr1858283wmj.35.1690549244305; 
 Fri, 28 Jul 2023 06:00:44 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 g17-20020adfe411000000b0031437299fafsm4818155wrm.34.2023.07.28.06.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:00:43 -0700 (PDT)
Message-ID: <06162f85-bb38-d07a-38f6-e7303c80996c@baylibre.com>
Date: Fri, 28 Jul 2023 15:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 04/11] drm/mediatek: gamma: Improve and simplify
 HW LUT calculation
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-5-angelogioacchino.delregno@collabora.com>
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
> Use drm_color_lut_extract() to avoid open-coding the bits reduction
> calculations for each color channel and use a struct drm_color_lut
> to temporarily store the information instead of an array of u32.
> 
> Also, slightly improve the precision of the HW LUT calculation in the
> LUT DIFF case by performing the subtractions on the 16-bits values and
> doing the 10 bits conversion later.

-- 
Regards,
Alexandre
