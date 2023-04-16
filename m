Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820D96E379D
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 13:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B55D10E0A2;
	Sun, 16 Apr 2023 11:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7BB10E0A2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 11:02:41 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id xd13so23028591ejb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681642960; x=1684234960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+s/B4eOWujes2P8w0FQ9OyTkSIgsXvTMJtbi4pA4Ms=;
 b=LoJwkKaHZuLQSpe5mfubX2q90+8KP8SJSIbv7eWqc8stVGUcbxKNHGsdxIwqVVTBOr
 wK32WqOXG12XXQ3ASKOSRixBJemSYGKBwZiaFabVcI3T/RVZapqspnvqp8+fVVxh4sf1
 mFqvhaY6XXj3q8+ku3B0es/COgLcTxplSqHsvN0JXOuHsRYhMsz11yU99fejURyty62H
 8E+2X/exTrtzWBnnF+9eKHEK+ENL+Rt8gH5r8d0OzNq3RSgJY1DXayP7e/Ha+3Zs1+5S
 VfJM/jiMhOrnV4W1wdXDRLzLkjj38ElYY6xzpcE/Qa9pNmhCkiftvA2O0Zp1TZt6yl3K
 d1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681642960; x=1684234960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F+s/B4eOWujes2P8w0FQ9OyTkSIgsXvTMJtbi4pA4Ms=;
 b=OjBgAq6epICrg7mvS5E16BeXQtrFTY40IzkMXWjjg3eTnYQU21m+/Av91JVjWN9cB1
 8k9JUPtWh6jV+/PJR7wS3JdqaYhaOYWrdf+6s0PagfvRrh74ywzmToss+Mc//dPHkDUP
 0qzwlKTi7mki/OmFcCixcy9z6utnT2deiWX4rdrnJInvFNADqJqNEt+Vrk0Q9c1FNnJa
 l3xy+HJkz/piHycNHQBjnILcnQmGhr+tBfYgF385Oqvp/BFmBgDLg1yBhZJrdkBg4Pmv
 N3tsSdIlEdof8YQpDzEjTN9cwJ+gufa/cEq62OF++k6y6nPEtUMZ7nkqJArs4BHnNUy4
 BzHA==
X-Gm-Message-State: AAQBX9csXhq5zwXYYDjucK636DLxdSEnx21rsQ4qK6WtyHLAwG9GzdHV
 yOJi21fh5EcX66RgZZoMc8VjnQ==
X-Google-Smtp-Source: AKy350YdAKWNPsFVv4cdGqySJKoT8asIrHUdwyGPD1r62LVITFLHykWctNjuzDA9OAUXGziE0T3tng==
X-Received: by 2002:a17:907:6d24:b0:94f:3980:bf87 with SMTP id
 sa36-20020a1709076d2400b0094f3980bf87mr2622794ejc.43.1681642960178; 
 Sun, 16 Apr 2023 04:02:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db?
 ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
 by smtp.gmail.com with ESMTPSA id
 ry13-20020a1709068d8d00b0094ee3e4c934sm3395556ejc.221.2023.04.16.04.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Apr 2023 04:02:39 -0700 (PDT)
Message-ID: <34c6632f-8fe0-f8d7-8900-3a9089faa14d@linaro.org>
Date: Sun, 16 Apr 2023 13:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] MAINTAINERS: Add myself as Samsung S6D7AA0 panel
 driver maintainer
Content-Language: en-US
To: Artur Weber <aweber.kernel@gmail.com>, thierry.reding@gmail.com
References: <20230416100139.13741-1-aweber.kernel@gmail.com>
 <20230416100139.13741-4-aweber.kernel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416100139.13741-4-aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2023 12:01, Artur Weber wrote:
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Missing commit msg.

Best regards,
Krzysztof

