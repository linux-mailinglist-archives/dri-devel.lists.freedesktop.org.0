Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED1670FF0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 02:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3441610E627;
	Wed, 18 Jan 2023 01:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288BC10E627
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 01:24:37 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id vm8so79647140ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 17:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hCw2/tRfMHxdziYE7u5XMHonH7hwIjkmwIJuVfBRNWc=;
 b=nkdE03+Z0aIn/+n7c1/I2F3pJkSHHVfoKP7G8X9gUuTEkxpuUwMEtVoc0Q+WUvSkvd
 A2H/THg65gzR0hZgMbt2oPoKf4nCe5i/l6BjLfuin4U01myYpCXjWorb+1mTTzkDuhk+
 mCiQUtSbLtdcOWtWJ+KRejJGi/NmzqWORt/S7l/3k66JUoNrsREYogsLyLY9EldEHZAd
 PsL1wjKb7nQ9OgsnYZGOBNaPZy9TIY5EbGcsIFJCz2t8kQSQcm9Uxy1IesuXV/QInnfa
 1rUiZs41LNJEYzESPz3fByvOWWq3gxSP9vx82MfGgPxkgTfoUoXvKS+9zNGRrN+o9uHZ
 YGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hCw2/tRfMHxdziYE7u5XMHonH7hwIjkmwIJuVfBRNWc=;
 b=cDMf6Ms6fbfh19kW3J3c++iQ6HM2Vv6jsWTkp7HoicNVK4lIL/swbcb88Nr4Hx/pYO
 YADwv3itjzbjIkPLkec8nxA8544qBcBanTpKREBlMlAbAQ6cZkb+neIJZ4uM78j24IX8
 S4spZ+ZQW9b1Cm1VqqsR2U3gM93ShB4uj/dHbbXSp9LQC1gPfrnV8rPEg6V7AaSEhnng
 BE0+tgO3AplG+fpEw8piqMORr9md7R1H7tgPMcSuV8jtusupFEJBXOYkSynzHGi3/dLS
 lF5kYHpgg0ItcSgM1Cp0ytGh/DV0gN8UjQcb8FF/q0ex/eGPFSk0UK7quGwcdpRWUtjM
 wiaA==
X-Gm-Message-State: AFqh2kq/J9QcfooAKao52Px0bK2sbEUX+ktf/Y5rS7gi12/IyLrfzcNG
 qjFkNfOliuREF1JOmHlyEKKK2Q==
X-Google-Smtp-Source: AMrXdXsas82xe4F5cGHedGjetCtbabIxMQUCoeuWsYdgrdP89CeJeAfXys09rvlr0gPpyI7oo6dygw==
X-Received: by 2002:a17:907:6294:b0:86a:1afa:6dd8 with SMTP id
 nd20-20020a170907629400b0086a1afa6dd8mr26337861ejc.69.1674005075726; 
 Tue, 17 Jan 2023 17:24:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 fn4-20020a1709069d0400b0084d4b907ff8sm10941430ejc.120.2023.01.17.17.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 17:24:35 -0800 (PST)
Message-ID: <b9fa44e8-3387-df90-7997-cac74312cb3b@linaro.org>
Date: Wed, 18 Jan 2023 03:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] drm/msm: Add missing check and destroy for
 alloc_ordered_workqueue
Content-Language: en-GB
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com
References: <20230109022038.2163-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109022038.2163-1-jiasheng@iscas.ac.cn>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2023 04:20, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer.
> Moreover, use the destroy_workqueue in the later fails in order to avoid
> memory leak.
> 
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog:
> 
> v1 -> v2:
> 
> 1. Convert "goto err_destroy_workqueue" into "goto err_msm_unit" and
> remove "err_destroy_workqueue" label.
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

