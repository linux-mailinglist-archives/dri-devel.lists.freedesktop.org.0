Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F58764826
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5190E10E4FA;
	Thu, 27 Jul 2023 07:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA3C10E4F0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:12:30 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51e429e1eabso763608a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690441949; x=1691046749;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lFqE8r5CtlgU1LoE0+yybns5D17+UGGGRnbdRjn75UQ=;
 b=yW9GI/Jeu8KatNBEkbADekfBexGaJp8iJqjHgAcCMGgHuhLPAN6zRT9cFXkSXDFjJI
 SSOw/3CiXedms5XnVwL1ON/Zj5MZHkEm0Prq2AO2oYqzMNaZmp3zTGpXE2tnYQKtuVXa
 alDMwA6SMkod0Jdxn8kGdGxqnSaNp77uLOawOVifFFgwCItnxrrzR3ascsok2DEZ9MG8
 E7pFOEt+cyi+YHOsXoIMycG8OjdVMSIQ4u66J59Ft0KKC5ik0BxWY9NFqZDZqVVhBig7
 s5ptocsgpkmIGx/W+BqIXwrvqJ+NLSa1z+XoiR1NKmJ+j+nwK+TAvvk0MNA/tVUTws9e
 Z+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690441949; x=1691046749;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lFqE8r5CtlgU1LoE0+yybns5D17+UGGGRnbdRjn75UQ=;
 b=kECyJiSdZvyEcj7cOmc7J3Qh5uy4Vq7abbFdNQvrSuj9EYHjGOtQDo1WOi2vx2pZLj
 E8Lcy3rWYRxHPZtvXKpFKVY1WLaXJZtUjCUoflRtNuAOFyiYIMScUAo5vKgLx0jUg0lP
 w+AeZQI3BMwiD2xAVPyyu1ehWM+JU9CSgslmtP5IibXhSNCrKmv1j7LfiCGefFR5mz0P
 KLMyBi8+g6N1Y8wicQe2s95KvUdXXppAwHbJPXuChBP3ACY2fjZAvbJpvFzuaDa7AnN1
 68Ty6AoOeDMOMfEbzFAzpbJ/WIdM4l9xqiI3FpQkMjJrOlxh4KsKnyYGA6YPOlC4oHni
 WiKw==
X-Gm-Message-State: ABy/qLaUd2RKhWMTwAQIjww63NneNVZwKiUJrlWOmADxjkam5MZQv/d6
 KomUhKobFJ6o5fOaiUwUtYYuFg==
X-Google-Smtp-Source: APBJJlGpg+0/nLk4w83EaG6UQXNsZiCVcmuVU3faIKI5eOKHpMH/thLDsVyAPxgz0THKl8q21kARPQ==
X-Received: by 2002:aa7:d443:0:b0:522:6e6c:68a2 with SMTP id
 q3-20020aa7d443000000b005226e6c68a2mr1046551edr.18.1690441949300; 
 Thu, 27 Jul 2023 00:12:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 n10-20020aa7c44a000000b0052238bc70ccsm307703edr.89.2023.07.27.00.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 00:12:28 -0700 (PDT)
Message-ID: <33ae66df-a01b-1f4a-b55e-1a6f70567243@linaro.org>
Date: Thu, 27 Jul 2023 09:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Move HannStar HSD101PWW2
 to LVDS
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230726184857.2294570-1-thierry.reding@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726184857.2294570-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2023 20:48, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The HannStar HSD101PWW2 is an LVDS panel, so move it to the correct
> bindings file.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

