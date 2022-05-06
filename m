Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30551D6C9
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 13:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A056010E4EC;
	Fri,  6 May 2022 11:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7F610E4EC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 11:36:46 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bu29so12146683lfb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 04:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XafsDV8I0xHrzVkv4lSdRDTo5FGQ0l18EsU91PxSrTY=;
 b=R/9u2E/dM6T5z3Ufuk0pILf/XaQE12+vA3CHOQMvtmD7vacSqg6PRji9NzlXeQig7d
 MAkwEe8dhqsZ4NX4tfVcYsHhKtMwK/lqOTRA2onnjz9V1JqsDYITp8IpBvEM3+agWg0V
 ddqJltjhy6S6IrcSB70mYwPw3jDWq3Zr5xETNZohTeU4TAnCezQuUHu4ZGwcjSnarNxY
 y4/2AYaGddX/+OYwOvZwRX7jcM4LOkLhcUcHp8mt5E6xarP123G+WCS7y4tnAcYpgsfo
 Epf5pyLfMyFAebYW25CET/ldtijPYr9BX5TxXQ8az+pRZuBS6RSvBctVfMaLD/hiLjdO
 1uyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XafsDV8I0xHrzVkv4lSdRDTo5FGQ0l18EsU91PxSrTY=;
 b=gMp/m2W/4PcAvlg3DkbP3LX7ii4YtFB8qSy0rrbi4XQ0ShDZUv33OaZDg+z3eCW/28
 TchrWsypdXD9sOjtJB3KrndOgcgmHg4ow6i1C7+jN9TxPgFpbkFYUAwZrDI8acPY+ow4
 NWqcHrEGm3pXwaipFf2s4SHDNetqJsFy9Ste6VzHhAGimam+vhJmPp0OY4qaBgW+iMqD
 d1f9kfItumC99j4T8YKIqJyfO94/EuPrDAXcqxDl+iJwnhi4vLCz4HLomGH7gj2VDwqu
 4a+Zepql/3u1/DtlcUwQMJSpuKa1YKVXdIEkCqhxJ05qgoPPQ35i5gl82ZyoMjkWl1DN
 0PVg==
X-Gm-Message-State: AOAM532EArOKzzGjjjUkNo1MUbrdJcZ+iEPbDrfs78Pi7pqky8ybIsUB
 r2tUI+xDLrPa6AilcnQO21K2Vg==
X-Google-Smtp-Source: ABdhPJxADU+mLvDMm3zIaM1F95WrlOimpTGlSy6aaEIi5buS5/Jd61rBVItq1CRnPCHmI8zY3L0ySA==
X-Received: by 2002:ac2:530c:0:b0:471:fa37:1123 with SMTP id
 c12-20020ac2530c000000b00471fa371123mr2255207lfh.397.1651837004835; 
 Fri, 06 May 2022 04:36:44 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651c055100b0024f3d1daebesm603620ljp.70.2022.05.06.04.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 04:36:44 -0700 (PDT)
Message-ID: <dbe452b1-7f6a-141c-5fe3-bd889c62abc7@linaro.org>
Date: Fri, 6 May 2022 14:36:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH -next] drm/msm: Add missing OF dependency for DRM_MSM
Content-Language: en-GB
To: YueHaibing <yuehaibing@huawei.com>, robdclark@gmail.com, sean@poorly.run, 
 quic_abhinavk@quicinc.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220506020300.20704-1-yuehaibing@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220506020300.20704-1-yuehaibing@huawei.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/05/2022 05:03, YueHaibing wrote:
> WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
>    Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>    Selected by [y]:
>    - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)
> 
> DRM_DP_AUX_BUS depends on OF, so DRM_MSM also should depends on it.

I think the proper fix would be to make DRM_DP_AUX_BUS depend on OF || 
COMPILE_TEST rather than just OF

> 
> Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/gpu/drm/msm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 4e0cbd682725..1d710a20ffdd 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -3,6 +3,7 @@
>   config DRM_MSM
>   	tristate "MSM DRM"
>   	depends on DRM
> +	depends on OF
>   	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>   	depends on COMMON_CLK
>   	depends on IOMMU_SUPPORT


-- 
With best wishes
Dmitry
