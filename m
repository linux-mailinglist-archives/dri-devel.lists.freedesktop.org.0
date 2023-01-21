Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E3676822
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 19:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C7010E021;
	Sat, 21 Jan 2023 18:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC5310E021
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 18:54:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id g10so6308671wmo.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 10:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yHlRS4tTUF+pE273cablIaIcmSDSf47IWgdXnZSwkGE=;
 b=KjHbVHatwK0tD8m7Hx+j+EgCOIfiVXtw1NcSb3VFwxQfQfrXjgCX9iquP0dlcY9Bsk
 orgCLHG1Q12CSP5J89vrFm/S4r4SXv8o1v+/i5fzZrBYThFLbxhdzN/HWzRlX8DB9Wa1
 CFa9MSHdOgnAUXQ7K9b6N7pVR5agu5gNZLaY32JjYBPkTccbCe3baSUPfk+Yup2yga9i
 wWpAVv/R1x96OoAjty4W1p2PmXQFQsihqXlYORwrOQfbvj2X7vas9cLGbGeowuAhCEml
 /DJwgQ/4E5vDj2bF2pGP/WWcGGRYjVYKzfM1bGhzvg2yFi7jbAKVE57N6JHu2vbDsz6r
 3IdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHlRS4tTUF+pE273cablIaIcmSDSf47IWgdXnZSwkGE=;
 b=u3fTDKDrQ3Kv0ntHwhTzCZJrqOP+oVvqk28zfvkM66c0Rfq+Yn3Z0G807msGmXA9tV
 ZbZc9O4jRuzR26PTF8GvV6QltHBsI6CRtpIgk+tnhpMkRSMRu7YYUljtIkOg4Y/cntGY
 2lu11VQU5Q1Q1n/DV7RWbaBKM6NvMBFF4d4e47zg8r0tej+85EP4NKjgZRJDxhF2fpNb
 6CMko3ncrsTqfGtjwZ+y+8o1GRF4ZLffdGXaAIr0LHbGLeVGJ2Wg8V9a+DMS/s8ZPGSL
 iu6pjQsM6xLtQDk59mAXHCpGSZanj7prSNWyYrlSEyMxeVyTiMzomRn43oQ23IIX4Oq7
 Mx4Q==
X-Gm-Message-State: AFqh2koZ6lNiYm6fReNsxZlq55Yor+w9jb0Wgq5+J9b7xV3oDjmjtdo0
 eSV6yNY8ktJECcgpbCuumQwsDg==
X-Google-Smtp-Source: AMrXdXvWfDyS7nCTlBLmBYH8ggLkgqo3w/dFfyJArIkg5qVFrZbPE41kcAlomNxkx5x9YS9O9pTpvQ==
X-Received: by 2002:a1c:f617:0:b0:3d2:191d:2420 with SMTP id
 w23-20020a1cf617000000b003d2191d2420mr17693396wmc.7.1674327263619; 
 Sat, 21 Jan 2023 10:54:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003daff80f16esm8468327wmg.27.2023.01.21.10.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 10:54:23 -0800 (PST)
Message-ID: <65e15459-16ce-bb5e-a523-6ad35b1fcfb6@linaro.org>
Date: Sat, 21 Jan 2023 19:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 1/2] dt-bindings: display/panel: Add AUO A030JTN01
Content-Language: en-US
To: Christophe Branchereau <cbranchereau@gmail.com>,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul@crapouillou.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230121162419.284523-1-cbranchereau@gmail.com>
 <20230121162419.284523-2-cbranchereau@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230121162419.284523-2-cbranchereau@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/01/2023 17:24, Christophe Branchereau wrote:
> From: Paul Cercueil <paul@crapouillou.net>
> 
> Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> interface.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

