Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C778679A57E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 10:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0919310E19D;
	Mon, 11 Sep 2023 08:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017BC10E197
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 08:06:54 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-403012f27e3so20264425e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 01:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694419613; x=1695024413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BQAVKqReSVnSI4Ydt6YoC8xFDTISY4VfD72WdfhWLqk=;
 b=ewVJgKhby8PuIOdpveEKxUI+yCaUqhGYWbSxGsPnXADHz5OwauHLNg5/kU7wM3Jp+i
 D03C5pcJ/LRS/GouT2fJUwJkysKAB+Go0ILaR8ngBv2Y6tC950RU0uAqefsBlzWeIhd4
 4Qt2lKMFm0YbpU2bFnfo3L/hJNWIor7sA48hffHPz/aL4hPMh9pZesFLV0iKlmnk21J9
 6mkvaTTbm3kDk2pOl2+Cg1eU5jgsN5k4iTMrs/6pM07Kq5gG2meKOXpp72QcnkZSfXx0
 pCgBz44cPBUoEyXuVhdtflBWwns4f5Y6QPOEy9IfC/NIv61kd6JUhvKLEypyqCf3u2kF
 DQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694419613; x=1695024413;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BQAVKqReSVnSI4Ydt6YoC8xFDTISY4VfD72WdfhWLqk=;
 b=eUcK3gbsjHAEh8LWifHyhd/8ib1T9SX7R7GscxLj+XnM5htqsOkrgtC7C0DtSCwUL2
 xbdp3OGBymHMEcsOJ8bn1L1JxEaxJwFMtquefsPFdiuVaaHl6TgOX6SDWQq0g5i1OBGw
 MCdGMCwSkm4Vhef8iCKRw77KZ/RC3SEEQ44cDtycptkeadcEY8LPD4vK5Y6DFsOfgboJ
 kpOGikltjucf9lNVUaJPlqLIb4wVP7NvOkfF/FSHoJWbZDkB4J5fbJgdKYkYj8JDV8a6
 FBbxlCIj4aH6/5OMaDpcNKMSnAQP2z4S5OEEk7T+EwxrOGzlmwv6niLT+WfwpS/LQ/70
 4UDg==
X-Gm-Message-State: AOJu0YxMGzIJhwBUDJv+I+Hkajz7EIC9WW4h0lfu4q/gLsb/0hICDplM
 cFMb48xB33SyyYHmcai7QbO/0g==
X-Google-Smtp-Source: AGHT+IEftHwy4siFn4uU6kwdtQfQwwzQkqPdTFYx+b5Hws8/3fiLDhgz05H5RrbONLPKhHuEKen7EA==
X-Received: by 2002:a5d:624d:0:b0:316:efb9:ffa with SMTP id
 m13-20020a5d624d000000b00316efb90ffamr6497563wrv.35.1694419613045; 
 Mon, 11 Sep 2023 01:06:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a5d634d000000b0031c5e9c2ed7sm9318751wrw.92.2023.09.11.01.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 01:06:52 -0700 (PDT)
Message-ID: <9ba6da84-6ef9-1f28-75f6-bbdda571771d@linaro.org>
Date: Mon, 11 Sep 2023 10:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 0/9] drm: ci: fixes
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230908152225.432139-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: emma@anholt.net, virtualization@lists.linux-foundation.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, agross@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, daniels@collabora.com, linux-arm-msm@vger.kernel.org,
 mripard@kernel.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, dmitry.baryshkov@linaro.org, guilherme.gallo@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2023 17:22, Vignesh Raman wrote:
> The patch series contains improvements, enabling new ci jobs which
> enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
> fixing issues with the ci jobs and updating the expectation files.
> This series is intended for drm branch topic/drm-ci.

Please send DTS and defconfig separately. These patches should go via
subsystem maintainer, not drm.

Best regards,
Krzysztof

