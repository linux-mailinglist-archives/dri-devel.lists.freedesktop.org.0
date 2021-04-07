Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4875357419
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 20:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767766E96C;
	Wed,  7 Apr 2021 18:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692586E96D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 18:20:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617819608; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=v5hhCBxMu4t8ymRS5UeQli/Ao4wr7txEYWAKX3ZDl5M=;
 b=R3UJCcHFv9rQIcqLvvDdGTbrXiC+6zZFUw3vnIPI7nlEfRjAVvzJcXLPi0akxWg/IhgeoyAJ
 3e5x0REaVw9lKd3JcIZRsfhgFxPG5r1UYPxVVuEs4phf14IAlaIP/U22r02y7bHswP/goDuf
 ziJfyMPcVIlSRuDGwPFmrqNNPoI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 606df7cb9a9ff96d959133ea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 18:19:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DFD5DC43466; Wed,  7 Apr 2021 18:19:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E9852C43461;
 Wed,  7 Apr 2021 18:19:53 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 07 Apr 2021 11:19:53 -0700
From: abhinavk@codeaurora.org
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/mdp5: Configure PP_SYNC_HEIGHT to
 double the vtotal
In-Reply-To: <20210406214726.131534-2-marijn.suijten@somainline.org>
References: <20210406214726.131534-1-marijn.suijten@somainline.org>
 <20210406214726.131534-2-marijn.suijten@somainline.org>
Message-ID: <6413863d04df9743e2d7e81beff5c3e8@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marijn

On 2021-04-06 14:47, Marijn Suijten wrote:
> Leaving this at a close-to-maximum register value 0xFFF0 means it takes
> very long for the MDSS to generate a software vsync interrupt when the
> hardware TE interrupt doesn't arrive.  Configuring this to double the
> vtotal (like some downstream kernels) leads to a frame to take at most
> twice before the vsync signal, until hardware TE comes up.
> 
> In this case the hardware interrupt responsible for providing this
> signal - "disp-te" gpio - is not hooked up to the mdp5 vsync/pp logic 
> at
> all.  This solves severe panel update issues observed on at least the
> Xperia Loire and Tone series, until said gpio is properly hooked up to
> an irq.

The reason the CONFIG_HEIGHT was at such a high value is to make sure 
that
we always get the TE only from the panel vsync and not false positives 
coming
from the tear check logic itself.

When you say that disp-te gpio is not hooked up, is it something 
incorrect with
the schematic OR panel is not generating the TE correctly?

> 
> Suggested-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> index ff2c1d583c79..2d5ac03dbc17 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> @@ -51,7 +51,7 @@ static int pingpong_tearcheck_setup(struct
> drm_encoder *encoder,
> 
>  	mdp5_write(mdp5_kms, REG_MDP5_PP_SYNC_CONFIG_VSYNC(pp_id), cfg);
>  	mdp5_write(mdp5_kms,
> -		REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), 0xfff0);
> +		REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), (2 * mode->vtotal));
>  	mdp5_write(mdp5_kms,
>  		REG_MDP5_PP_VSYNC_INIT_VAL(pp_id), mode->vdisplay);
>  	mdp5_write(mdp5_kms, REG_MDP5_PP_RD_PTR_IRQ(pp_id), mode->vdisplay + 
> 1);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
