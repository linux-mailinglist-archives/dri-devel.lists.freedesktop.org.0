Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA576FF1B1
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 14:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882F010E1CB;
	Thu, 11 May 2023 12:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E60710E1CB
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 12:39:36 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ac87e7806aso79710111fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 05:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683808772; x=1686400772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sguCADxh6/8JZhFfgnCw2t9kQNtuJnhKvTXcCcJKeVo=;
 b=N+cChiVGWGTovdxW3imjqG5act1QQ5KtOXb3rtHLD0O5XukjYbg4R8yAFzaKwsj0LV
 sw26mEJ4W2mmwpCqPIz/MEc9EQoRXJRPXV95YPcUdrkNXSLeKcwBT2cm9C1L+p+15dpr
 2I6soBLa49oUYkTYkhbTtNs8tOFwxOiBNiP7z0uAqxtfQjmImVisFnxkF5u0k6k/t6pY
 O0XkPrRpnSIpg9+5p6XpcY5Ax06D8WwHsdxn2h4MDX2SVSW6otTrHULi2pD5B9+N7Syy
 eDWZx0fD9yAF6aAbOvxMrxefdna9pQ7gzLCjaHjYmEXVDiUUqx04bgounx98mhAekQTd
 QfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683808772; x=1686400772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sguCADxh6/8JZhFfgnCw2t9kQNtuJnhKvTXcCcJKeVo=;
 b=AADnmbbvfmB5mS0aed1aVOdobVnb2wgtL/vDgpNBUlnjVb0GP2QsRvggZ6hJ4We6gK
 c+yk9r9s/BMFc2jGh68ieEh6T//LT0idZZPxBCDMy41dEVyobb6llzuQyHIxAGx0TgpD
 Ki2vg2iJ1rMOVCkdVEFk3Wg+W/WgQBC2r09aDaj51uQmGPMjAOQNJvQdxuVTTHmPcF7a
 8O5tiPN9TPxDRHyfAeEXKJuN3EjMkotlyqaViO0rdpREV81GNbaJDnv1hF3k9f7VODGJ
 /xoTJjt5D//rGPt4e+dRdSGHJIOABowZyOQOvKGSgw1ijymiKoYbLr27oUo+LCTTF8YB
 uZvg==
X-Gm-Message-State: AC+VfDxLxIKdCMIh7Zm3noINoS3k0aYb7697iNBOFqJp00VaCgy0xcvV
 NU4Dr6Rm6ZaAExJxXBTNS8/daQ==
X-Google-Smtp-Source: ACHHUZ6+tTZyN721QPlPxPuC2A0OHeNX3tT1BQq7UBNV3ZI/xQJB2a24CSnNTYmrGnjbCg+GxE97XQ==
X-Received: by 2002:a2e:3211:0:b0:2a8:ba15:eb6f with SMTP id
 y17-20020a2e3211000000b002a8ba15eb6fmr3164629ljy.6.1683808771890; 
 Thu, 11 May 2023 05:39:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a2e9617000000b002a8bc9918d4sm2374591ljh.97.2023.05.11.05.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 05:39:31 -0700 (PDT)
Message-ID: <894ea5be-5126-b72b-ad88-4f06cb5c11ca@linaro.org>
Date: Thu, 11 May 2023 15:39:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/msm/iommu: Fix null pointer dereference in no-IOMMU
 case
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230508-6-4-drm-msm-iommu-fixup-v1-1-a7a21ec94f5b@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230508-6-4-drm-msm-iommu-fixup-v1-1-a7a21ec94f5b@z3ntu.xyz>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/05/2023 23:26, Luca Weiss wrote:
> In the case that no IOMMU is available, msm_iommu_new can return NULL
> which should be handled. Without we will get a NULL pointer dereference
> in the next statement when we try to use the mmu variable.
> 
> Fixes: 8cceb773f565 ("drm/msm/adreno: stall translation on fault for all GPU families")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/gpu/drm/msm/msm_iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

