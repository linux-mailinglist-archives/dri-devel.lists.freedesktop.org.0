Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093E62C173E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52816E0DC;
	Mon, 23 Nov 2020 21:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE896E0DB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:08:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606165686; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xctod4y8H2RB6ARM9/cplLeTPl8gam1WWi1GE5ItuhA=;
 b=nRd2lH/znl2olZUFRisXu/Ebfdv9b0RQzOahiS8KkjJycBChowQGkQKk7mGpHattiGAD3KSR
 PUV21oQgJVUqpqfZ3IvuNeOk5ISuae6QvvsJrmZ8j82HjTr+MydrtCsyz+QKOtBggwyHGYvd
 X1qVLM2l4JA1411SdoFBibP3E+Q=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fbc24b2e714ea6501f9b10e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:08:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5BBDEC43462; Mon, 23 Nov 2020 21:08:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 51327C433C6;
 Mon, 23 Nov 2020 21:08:01 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 13:08:01 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [PATCH 12/40] drm/msm/disp/dpu1/dpu_formats: Demote
 non-conformant kernel-doc header
In-Reply-To: <20201123111919.233376-13-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-13-lee.jones@linaro.org>
Message-ID: <98cc3d66e28b4fb863811f595a05277a@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, Fritz Koenig <frkoenig@google.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'fmt' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'a' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'r' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'g' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'b' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'e0' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'e1' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'e2' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'e3' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'uc' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'alpha' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'bp' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'flg' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'fm' not described in 'INTERLEAVED_RGB_FMT'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c:50: warning: Function
> parameter or member 'np' not described in 'INTERLEAVED_RGB_FMT'
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Fritz Koenig <frkoenig@google.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index a05282dede91b..21ff8f9e5dfd1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -22,7 +22,7 @@
>  #define DPU_MAX_IMG_WIDTH		0x3FFF
>  #define DPU_MAX_IMG_HEIGHT		0x3FFF
> 
> -/**
> +/*
>   * DPU supported format packing, bpp, and other format
>   * information.
>   * DPU currently only supports interleaved RGB formats
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
