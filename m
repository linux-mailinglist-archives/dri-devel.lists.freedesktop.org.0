Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73972140B
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 03:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1EF10E0A5;
	Sun,  4 Jun 2023 01:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE3010E0A5
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 01:58:07 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f60a27c4a2so4009786e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 18:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685843885; x=1688435885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yyuq1OAkX1njnwRBO2trMGeyKaw4cQAV1Knyp+U6sec=;
 b=n9E+rRx0AO5FR0rquegNF4I26nDcU5SOvG3whnQ3ArY0bI4PoWP4DRf70ubPAK0bUV
 PrKuzgKBii9XWP0o1uDVQUdljf1CZq2wOOLOZC/XJwDiDu4oB0N3JEOEB19ZGAdsLzJQ
 C/PTbSgKycbx6WyODQdX7b3DwEzWy8rMeDeSKEygJ1rNV8FjiOrVQFwqqSlK2QZgKS8I
 zNNwpJvlKSJs44J3vbiihA+Wup4e38wSUlm31CAdUBdHvJ83laX8iDYOvb2I914vyrRG
 CXXsqR4wqgh5jC9XhNcaQQ/5nbnM/64Q6dlP6kl+ubbZ76B0nBVvFRChFUZZEgYx7EZH
 XwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685843885; x=1688435885;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yyuq1OAkX1njnwRBO2trMGeyKaw4cQAV1Knyp+U6sec=;
 b=gWE6xoYzrXVJD73QTPnQtuj9S5GLTUQdc3ir95qiJz/N2irPKM8++S7nll0vNe48JC
 7FWNzaEiY+oB2WGchh55JhrOLeBMrauxTu4CoUXJbIWHiKgZIwfxlWfO6lmEC2YrxB22
 WthsXoqCq5rEGN310exS+M5N5aB4wgB85yIeA0GXUA4Wv3njv+nBVW+YyLuX3AmKNPG2
 SgCHGA00fkXor34qqrpSLFUzGU3S1QcPPhDsQx1V5LgmdNeKRyipmMpBL72r3INV+HBL
 /NdUYbwrUacbCVL6dKsx1EltAZ6ZlysSiUIH1e/4nYmQ+z5zMSXSBsRgayxYmycI9hZl
 bX6g==
X-Gm-Message-State: AC+VfDxueWsPVn+SNMeAEHorkdDEk4nTdSleZEULtft75Wvu3gL2AH+W
 I5PJvBeL4ssgdMCEQ0jgusj28g==
X-Google-Smtp-Source: ACHHUZ75Cw+rmmH9r3AmD2CjoBK8KWeZVioVZDvuSIkimmNEVZfs8IpYHmDoXKzsvs9dItdifAGhXw==
X-Received: by 2002:a2e:a41b:0:b0:2b1:a8b9:4543 with SMTP id
 p27-20020a2ea41b000000b002b1a8b94543mr2026139ljn.53.1685843885452; 
 Sat, 03 Jun 2023 18:58:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 i21-20020ac25235000000b004ec7c0f2178sm645352lfl.63.2023.06.03.18.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 18:58:04 -0700 (PDT)
Message-ID: <de718a32-cc3d-849e-522a-dca9a17e1a4b@linaro.org>
Date: Sun, 4 Jun 2023 04:58:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm: Use struct fb_info.screen_buffer
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230522191701.13406-1-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230522191701.13406-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2023 22:17, Thomas Zimmermann wrote:
> The fbdev framebuffer is in system memory. Store the address in
> the field 'screen_buffer'. Fixes the following sparse warning.
> 
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26: warning: incorrect type in assignment (different address spaces)
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    expected char [noderef] __iomem *screen_base
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    got void *
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

