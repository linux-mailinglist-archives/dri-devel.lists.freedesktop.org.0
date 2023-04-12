Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853B06DFEB3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 21:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F39110E93B;
	Wed, 12 Apr 2023 19:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80C510E93A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 19:24:43 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i26so16436685lfc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681327482; x=1683919482;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d9g9ahRSL/zSO4DGF+OFAj8fxv/EE2lcboZZ77eN0Hw=;
 b=pIv4Oy/lSiBkUjQgAKk/WEhpmqvbEkLod2DoK/SJb14VYg/EpvWlx7p5SFf9u4mHKE
 9w4zCnhwQduzfVpUEkhBlYIJEE9Uj7C3C+TsPXM028gC/dFd2cbx229fKPXphb2s61VF
 0axIUrRV66ZSC9wXvP+QF2sf4uIzbXsgBpqhUYoBOzNz+MUl8NxGrdHddPexlNb3Z1hw
 5TdE/oiUEeTMlyA5v9NBwXSqtQTA6pRQ9aTAVGawmsyHoFQ/qhEEOIYNfjpsOuFQlySL
 HxvUtgirt5WUY+T/hTdccBYLCbYzz7ut9BA1hye5hRAuS/WrZOc2osni2qAmwZOmyXy5
 2eZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681327482; x=1683919482;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9g9ahRSL/zSO4DGF+OFAj8fxv/EE2lcboZZ77eN0Hw=;
 b=WFcOy6Z7/35EGY/pJK3+gxtX9i6E1ZSyvvL4fY+0i6E104TWBVHLVlRUFO+mCVa9n2
 SEl7itmeyZNiE1+o+VCgiXlKkJUMQVKbUNrr4DzEHW7FJczLWnaP4JgCPDjcWiZXKPfg
 dgPkebtiqx5RF9jbq+TzEH42w3GC8uy/DXhKld8mU6SvM6f3+QikKPBnf3FdnfUgSUCK
 p+vMR9lPagGAG9Kgg4dIfDohATMWrgBEB6otM81KhDdWZBIXMLk9XNTNjLoXi6fr2nzs
 5CjcO5qWGZ/+KHnLGx2p0DqTl2iV7hH7qb6S48Tc7y5ZD/TNLUvoDws2XTpZuBTp5ASY
 5NJA==
X-Gm-Message-State: AAQBX9d4Mo7dALmoUfDHRplKlCpQWKeFuSoX9yxD8cUDBlZAZSr5VCCE
 VPmiWRgh0OSkjqyYDYQdTJG01g==
X-Google-Smtp-Source: AKy350You/kJYNFRsU4gVILriOaTq9gzSnB/rph927Ftgt5yVAS8j03yIavAELZx8PfNPgtLw+wYHQ==
X-Received: by 2002:a05:6512:98a:b0:4ec:809c:c64c with SMTP id
 w10-20020a056512098a00b004ec809cc64cmr6112lft.20.1681327481762; 
 Wed, 12 Apr 2023 12:24:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a19a40f000000b004db3e2d3efesm3123331lfc.204.2023.04.12.12.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 12:24:41 -0700 (PDT)
Message-ID: <c829ff2f-f676-8c6d-2681-1b5da4f9ede7@linaro.org>
Date: Wed, 12 Apr 2023 22:24:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 6/8] drm/msm/dsi: Add check for slice_width in
 dsi_timing_setup
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v5-6-0108401d7886@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v5-6-0108401d7886@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 22:09, Jessica Zhang wrote:
> Add a check for valid dsc->slice_width value in dsi_timing_setup.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 508577c596ff..6a6218a9655f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -937,6 +937,12 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   			return;
>   		}
>   
> +		if (!dsc->slice_width || (mode->hdisplay < dsc->slice_width)) {

This is an erroneous condition, correct. Can we move it to a better 
place, where we can return an error instead of ignoring it?

I'd say that we should validate dsc->slice_width at the 
dsi_host_attach(). It well might be a good idea to add a helper that 
validates required dsc properties (e.g. version, bpp/bpc, slice_width, 
slice_height, slice_count).

As for the mode->hdisplay, we have the following code in 
msm_dsi_host_check_dsc() (where pic_width = mode->hdisplay):

if (pic_width % dsc->slice_width) {...}

This way the only way how mode->hdisplay can be less than 
dsc->slice_width is if mode->hdisplay is 0 (which is forbidden if I 
remember correctly). So the second part of the check is useless.

> +			pr_err("DSI: invalid slice width %d (pic_width: %d)\n",
> +			       dsc->slice_width, mode->hdisplay);
> +			return;
> +		}
> +
>   		dsc->pic_width = mode->hdisplay;
>   		dsc->pic_height = mode->vdisplay;
>   		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
> 

-- 
With best wishes
Dmitry

