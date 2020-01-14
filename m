Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9E13AE36
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 17:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CAF6E425;
	Tue, 14 Jan 2020 16:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A2D6E423
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 16:00:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1579017602; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=SP7KtqJLhxcHuH5kxq8tGE8k0HxhmfSYXMOApVPO+zk=;
 b=miT9eNfJo5zWe3VFTvtqa+KnguuImibR4zNVp8Xr9z88JOEyH3uN/7+ZsXg6TyeVshK6QdT7
 jy0nAPo++6/Pscu4WpqvNv54EuEtYXklWfwxhVuZIUFnKJ0zBN9F0LUMF9IB7oEHeoZxzFLQ
 f3ydokMvQojhnhhb+Tlu4t/r1+s=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1de581.7fb13a285420-smtp-out-n02;
 Tue, 14 Jan 2020 16:00:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 61B34C447A4; Tue, 14 Jan 2020 15:59:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9845FC433CB;
 Tue, 14 Jan 2020 15:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9845FC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 14 Jan 2020 08:59:55 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/msm: Fix error about comments within a comment block
Message-ID: <20200114155955.GA31665@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Brian Masney <masneyb@onstation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
References: <20200113140427.1.I5e35e29bebe575e091177c4f82606c15370b71d7@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113140427.1.I5e35e29bebe575e091177c4f82606c15370b71d7@changeid>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 13, 2020 at 02:04:46PM -0800, Douglas Anderson wrote:
> My compiler yells:
>   .../drivers/gpu/drm/msm/adreno/adreno_gpu.c:69:27:
>   error: '/*' within block comment [-Werror,-Wcomment]
> 
> Let's fix.

grumble something about the road being paved with good intentions....

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Fixes: 6a0dea02c2c4 ("drm/msm: support firmware-name for zap fw (v2)")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index c146c3b8f52b..7fd29829b2fa 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -67,7 +67,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  	 *
>  	 * If the firmware-name property is found, we bypass the
>  	 * adreno_request_fw() mechanism, because we don't need to handle
> -	 * the /lib/firmware/qcom/* vs /lib/firmware/* case.
> +	 * the /lib/firmware/qcom/... vs /lib/firmware/... case.
>  	 *
>  	 * If the firmware-name property is not found, for backwards
>  	 * compatibility we fall back to the fwname from the gpulist
> -- 
> 2.25.0.rc1.283.g88dfdc4193-goog
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
