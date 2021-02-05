Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C04EB310510
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 07:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241246E1B7;
	Fri,  5 Feb 2021 06:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Fri, 05 Feb 2021 06:46:38 UTC
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E13D6E1B7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 06:46:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612507598; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Pq6SFpYB7bZzneOPuiPx50qEYnSet0KQsUNB8GY6yTU=;
 b=DwWySghNdmK3CQvHaXYlTpfKTG6U6IbAFYCyqMOwhVjFkf/TmGO1H/bJTQ8+7x6rZduYb9Ac
 cutOhk33HpCXvpnaN2GVgk1uV5EwTV2UB5VSAEvy/MILQCNc7JGqum9RfkSAenursTS5tUVQ
 44lNEEiY28nIolB6Qw2BFtGi0vY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 601ce88f34db06ef796f19b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Feb 2021 06:41:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6A151C43464; Fri,  5 Feb 2021 06:41:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [61.1.238.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 59B2AC433CA;
 Fri,  5 Feb 2021 06:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 59B2AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH] drm/msm: Fix legacy relocs path
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20210204225650.1284384-1-robdclark@gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <dc2fb87e-67f0-4fa9-c920-515a6609a04d@codeaurora.org>
Date: Fri, 5 Feb 2021 12:11:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204225650.1284384-1-robdclark@gmail.com>
Content-Language: en-US
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/5/2021 4:26 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In moving code around, we ended up using the same pointer to
> copy_from_user() the relocs tables as we used for the cmd table
> entry, which is clearly not right.  This went unnoticed because
> modern mesa on non-ancent kernels does not actually use relocs.
> But this broke ancient mesa on modern kernels.
> 
> Reported-by: Emil Velikov <emil.velikov@collabora.com>
> Fixes: 20224d715a88 ("drm/msm/submit: Move copy_from_user ahead of locking bos")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index d04c349d8112..5480852bdeda 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -198,6 +198,8 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
>   		submit->cmd[i].idx  = submit_cmd.submit_idx;
>   		submit->cmd[i].nr_relocs = submit_cmd.nr_relocs;
>   
> +		userptr = u64_to_user_ptr(submit_cmd.relocs);
> +
>   		sz = array_size(submit_cmd.nr_relocs,
>   				sizeof(struct drm_msm_gem_submit_reloc));
>   		/* check for overflow: */
> 

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

-Akhil.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
