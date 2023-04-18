Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63A46E60FE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC9610E78D;
	Tue, 18 Apr 2023 12:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E68810E78D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:17:55 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8afef50f2so20048741fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681820273; x=1684412273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pm8kfo3XeSVwAetxgwT0FTokY6mXbT03bQ/HeaTO5sg=;
 b=BWqcSSa5M/DWIFNbg4ZO7UwMLj5VWEnGqqVHDgNleYwqCR1muKHmvjPz+dsv3fnn2p
 HgM7l3NZx/91bqWIEawAklbJXL2QVGOnYXVVVFVhqXENv1C0TdDuYJSAolh5BBlEZ0Z0
 /GMQTPZBJeD/7MkmZ333jRL+8Pci+PndkxJOw+SeDkZ7a3z6e9r4PbJgkF3D8BeYXLSw
 Jpl3cULrPqEgROuaQAndgzk7bPtuUEGIBViUYdwlLIEI8+z+IAfMETKw4lLh6wvUgswp
 D/QF24yUGT/4W28VMJMsOWCdfyShdXqgFMJ976ajfy0d2E7i7f3bASBD5qAKQ9yuNskX
 +v5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681820273; x=1684412273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pm8kfo3XeSVwAetxgwT0FTokY6mXbT03bQ/HeaTO5sg=;
 b=AXBInRiH8FSNM8N4s5aw75p6mWkWohw24iiLtndJ8/kFJB4T2ewE6T0jifPLDeUvWr
 WukeEqO+wFQo/h6AnNb/sQN6neielyWRvmLrLsShY2WV5pc/jHZllYtil0OyHlbfGQpn
 ht/IGX+3Kj0FgfOL02yvY/zjKhXX5Jrjx2DDkp34d3dQI+JtnUBtMAdg6gb4PMqNsumc
 VShKXtGWLmQKZL9zjzlulDlv6zma3KnG6lJYRqL9BYb4q02IDTswtJFTeQubqPeNEsRv
 V30jqfPd4nweRUugAlHGmeZPQi+WsPd9wDluHAKPzQWCg2NXxWM4gMgKzWaO2K16ZqhI
 aB2w==
X-Gm-Message-State: AAQBX9dnMtJRpGtqySWl9IakxnjH2giTubBHf3jC55W3H68c/d9JYSVy
 hjCTaPDSK/SoK+5eUbx6echM8Q==
X-Google-Smtp-Source: AKy350Zpv11CFVrXOJiJ6pDXhJb1NwLe8eKm9EyvXhDLS9nC5cGtz9y89V2oYVJtwOv8s5AcCLi44Q==
X-Received: by 2002:ac2:4a89:0:b0:4ed:c089:6e5a with SMTP id
 l9-20020ac24a89000000b004edc0896e5amr2759303lfp.23.1681820273493; 
 Tue, 18 Apr 2023 05:17:53 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a195202000000b004edd4566114sm109236lfb.24.2023.04.18.05.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 05:17:53 -0700 (PDT)
Message-ID: <8c102e7c-3ec7-5ffb-9d99-cfdc183acf19@linaro.org>
Date: Tue, 18 Apr 2023 14:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 05/17] drm/msm/dpu: Remove duplicate register defines
 from INTF
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-5-ef76c877eb97@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-5-ef76c877eb97@somainline.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.04.2023 22:21, Marijn Suijten wrote:
> The INTF_FRAME_LINE_COUNT_EN, INTF_FRAME_COUNT and INTF_LINE_COUNT
> registers are already defined higher up, in the right place when sorted
> numerically.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 84ee2efa9c66..b9dddf576c02 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -56,11 +56,6 @@
>  #define   INTF_TPG_RGB_MAPPING          0x11C
>  #define   INTF_PROG_FETCH_START         0x170
>  #define   INTF_PROG_ROT_START           0x174
> -
> -#define   INTF_FRAME_LINE_COUNT_EN      0x0A8
> -#define   INTF_FRAME_COUNT              0x0AC
> -#define   INTF_LINE_COUNT               0x0B0
> -
>  #define   INTF_MUX                      0x25C
>  #define   INTF_STATUS                   0x26C
>  
> 
