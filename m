Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1359413F69
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 04:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5CE6EA1F;
	Wed, 22 Sep 2021 02:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC41E6EA21
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 02:26:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632277594; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HBIj9y/dOEV38bF8oglc0yFL8IUbDQo6kKXrXgkmOzk=;
 b=kwoiZntXjQ3Bu4QTZx52YoLjWfrdlk4jiIiICld9TMIArHMCD/bD6k6hJDWui4wcGoe10XDg
 zg0Cf8S+qNnucUQabiXM23w3RsKTzqOjwPGwvjUqncOvkzlEJl2heb8OsmNwE1cLXsNeywr6
 Aoa8j7qFux5Poi3yhjhqPsJj3ag=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 614a944aec62f57c9ae8e795 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 02:26:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9C9B8C4361A; Wed, 22 Sep 2021 02:26:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CA0D0C4338F;
 Wed, 22 Sep 2021 02:26:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 21 Sep 2021 19:26:16 -0700
From: abhinavk@codeaurora.org
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, swboyd@chromium.org, Sean Paul
 <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v2 08/13] drm/msm/dpu_kms: Re-order dpu
 includes
In-Reply-To: <20210915203834.1439-9-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
 <20210915203834.1439-9-sean@poorly.run>
Message-ID: <f032fea59dcbae853333a6b25e5146b7@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-09-15 13:38, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Make includes alphabetical in dpu_kms.c
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-9-sean@poorly.run
> #v1
> 
> Changes in v2:
> -None
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ae48f41821cf..fb0d9f781c66 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -21,14 +21,14 @@
>  #include "msm_gem.h"
>  #include "disp/msm_disp_snapshot.h"
> 
> -#include "dpu_kms.h"
>  #include "dpu_core_irq.h"
> +#include "dpu_crtc.h"
> +#include "dpu_encoder.h"
>  #include "dpu_formats.h"
>  #include "dpu_hw_vbif.h"
> -#include "dpu_vbif.h"
> -#include "dpu_encoder.h"
> +#include "dpu_kms.h"
>  #include "dpu_plane.h"
> -#include "dpu_crtc.h"
> +#include "dpu_vbif.h"
> 
>  #define CREATE_TRACE_POINTS
>  #include "dpu_trace.h"
