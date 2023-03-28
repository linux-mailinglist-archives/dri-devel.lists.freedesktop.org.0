Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CB46CBFB5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 14:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5007D10E89F;
	Tue, 28 Mar 2023 12:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121BC10E8A1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 12:49:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y15so15666485lfa.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680007790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jCNbxQ3fkGvJYs2TX33NcPDCODW7FsfSszu815y/rdQ=;
 b=MCBz/LZ9QWIqZkNLClNZpldMscplkOY6KzPqm1ilp2RwTVfmV6UEQ0JKtFLu8PoQjq
 3ZurKAErQhtWYyGO5BwuIEOAqgRh+dg2Oncy2FVTzp/93sEFFH55Erv73ZqM1KV/CRau
 fl7jjJbxJMce9RuRypNxCc9n3SpiU7UhV6WJZoV2T+74raMrrfeVr/6V3IhC64sdjQPi
 CO8L8Z7JVDaY8fsyals5wdV2tMO8HswrTlL8cANPYAtmuGW3WIkqtUy23LgjITyVtjQ0
 /clW442b3UHROWdk249Xem0GB/81P6RiyUuhKape9EPSV//F5XCz5zVST5krR/5rUpRW
 ILDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680007790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jCNbxQ3fkGvJYs2TX33NcPDCODW7FsfSszu815y/rdQ=;
 b=IvxGbmsv27remmL5NfntAoGe/zTSTnLXh5oisGulZ0TzdeZEV4+6A0FaG8KwCA2/0n
 sLhWP+evj401gmfLyNuESOaEBzYI2VG7rwNIGYJYgV4s5a9WfBMXe1hJyUi5vt0bBnJT
 Hi1b40FQ/JhDxLDbMqFpbQTEHnc6qt+bp+eaoLObBrYYWLMbe6qfBlNSQGsRQsdKy7gd
 i3r52VdqccUh5voeFo0oDA2LZn/He1Fr+/tksQtj+p1vd0O54QHP6w9EeKEv2b7C+Whv
 yHJbHQOZRby0Cx7qSOfCXbs1JgU2GXNIe2gSjo+baEpNNSTNzha8IfxoXYGBGJOdPI/Q
 WYUA==
X-Gm-Message-State: AAQBX9e5CkKWLnHs/4PPAZUuUFQM2jYxVb9ZxvIc0Odqi0tR1bPe/PdE
 dGzNRVStKixHkuq6Hhock6SWwg==
X-Google-Smtp-Source: AKy350Yz7V22vnXhTlNBr/g4If2TgMC4S4/UxSSsgOQXdwXSlabRzM3x60Oy2TKJkb+WGsIgRC+sxA==
X-Received: by 2002:a19:7404:0:b0:4e8:3f38:7d21 with SMTP id
 v4-20020a197404000000b004e83f387d21mr4456398lfe.28.1680007790309; 
 Tue, 28 Mar 2023 05:49:50 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w7-20020ac24427000000b004db4f2f08f7sm5062556lfl.28.2023.03.28.05.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 05:49:49 -0700 (PDT)
Message-ID: <42ce6819-8a56-83ab-13c9-f49b3167b42e@linaro.org>
Date: Tue, 28 Mar 2023 15:49:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/10] Revert "drm/msm: Add missing check and destroy for
 alloc_ordered_workqueue"
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-2-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-2-johan+linaro@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/03/2023 12:07, Johan Hovold wrote:
> This reverts commit 643b7d0869cc7f1f7a5ac7ca6bd25d88f54e31d0.
> 
> A recent patch that tried to fix up the msm_drm_init() paths with
> respect to the workqueue but only ended up making things worse:
> 
> First, the newly added calls to msm_drm_uninit() on early errors would
> trigger NULL-pointer dereferences, for example, as the kms pointer would
> not have been initialised. (Note that these paths were also modified by
> a second broken error handling patch which in effect cancelled out this
> part when merged.)
> 
> Second, the newly added allocation sanity check would still leak the
> previously allocated drm device.
> 
> Instead of trying to salvage what was badly broken (and clearly not
> tested), let's revert the bad commit so that clean and backportable
> fixes can be added in its place.
> 
> Fixes: 643b7d0869cc ("drm/msm: Add missing check and destroy for alloc_ordered_workqueue")
> Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 2 --
>   1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

