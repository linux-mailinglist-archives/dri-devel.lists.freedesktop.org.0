Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC41F21BC4E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 19:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36806ECBF;
	Fri, 10 Jul 2020 17:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717906ECBE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:33:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594402413; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=nBIBjS8TfT8I4G2Q/UfKP196gmJswu2oE3cHLZLGdsE=;
 b=IzlyjOJ1CYJC8MMXnKqJMbRyX3EKGnHO82N3kZz5dtxFYlmqd9nh5reU4oaUOfuyQDS4RJhe
 jDY+U0kj7ze2eEekySMDOzSP9Os0h3JfxHGWdIliQk23UF1njT3FzJmrebT6IMoMFk+jaJnP
 4DkyARoTTXy6CowNkycGHVucWPU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f08a664166c1c54946b3947 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 17:33:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9A9A8C433C6; Fri, 10 Jul 2020 17:33:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 01787C433C8;
 Fri, 10 Jul 2020 17:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01787C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Fri, 10 Jul 2020 11:33:18 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH] drm/msm/a6xx: add build_bw_table for A640/A650
Message-ID: <20200710173318.GE21059@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, kbuild test robot <lkp@intel.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200701030958.24466-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701030958.24466-1-jonathan@marek.ca>
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
Cc: kbuild test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 11:09:57PM -0400, Jonathan Marek wrote:
> This sets up bw tables for A640/A650 similar to A618/A630, 0 DDR bandwidth
> vote, and the CNOC vote. A640 has the same CNOC addresses as A630 and was
> working, but this is required for A650 to work.
> 
> Eventually the bw table should be filled by querying the interconnect
> driver for each BW in the dts, but use these dummy tables for now.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

And yes, I agree that we need to move this into the generic API sooner rather
than later, but this should be good enough to get a working GPU/GMU.

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 74 +++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 9921e632f1ca..ccd44d0418f8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -281,6 +281,76 @@ static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>  
> +static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	/*
> +	 * Send a single "off" entry just to get things running
> +	 * TODO: bus scaling
> +	 */
> +	msg->bw_level_num = 1;
> +
> +	msg->ddr_cmds_num = 3;
> +	msg->ddr_wait_bitmask = 0x01;
> +
> +	msg->ddr_cmds_addrs[0] = 0x50000;
> +	msg->ddr_cmds_addrs[1] = 0x5003c;
> +	msg->ddr_cmds_addrs[2] = 0x5000c;
> +
> +	msg->ddr_cmds_data[0][0] =  0x40000000;
> +	msg->ddr_cmds_data[0][1] =  0x40000000;
> +	msg->ddr_cmds_data[0][2] =  0x40000000;
> +
> +	/*
> +	 * These are the CX (CNOC) votes - these are used by the GMU but the
> +	 * votes are known and fixed for the target
> +	 */
> +	msg->cnoc_cmds_num = 3;
> +	msg->cnoc_wait_bitmask = 0x01;
> +
> +	msg->cnoc_cmds_addrs[0] = 0x50034;
> +	msg->cnoc_cmds_addrs[1] = 0x5007c;
> +	msg->cnoc_cmds_addrs[2] = 0x5004c;
> +
> +	msg->cnoc_cmds_data[0][0] =  0x40000000;
> +	msg->cnoc_cmds_data[0][1] =  0x00000000;
> +	msg->cnoc_cmds_data[0][2] =  0x40000000;
> +
> +	msg->cnoc_cmds_data[1][0] =  0x60000001;
> +	msg->cnoc_cmds_data[1][1] =  0x20000001;
> +	msg->cnoc_cmds_data[1][2] =  0x60000001;
> +}
> +
> +static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	/*
> +	 * Send a single "off" entry just to get things running
> +	 * TODO: bus scaling
> +	 */
> +	msg->bw_level_num = 1;
> +
> +	msg->ddr_cmds_num = 3;
> +	msg->ddr_wait_bitmask = 0x01;
> +
> +	msg->ddr_cmds_addrs[0] = 0x50000;
> +	msg->ddr_cmds_addrs[1] = 0x50004;
> +	msg->ddr_cmds_addrs[2] = 0x5007c;
> +
> +	msg->ddr_cmds_data[0][0] =  0x40000000;
> +	msg->ddr_cmds_data[0][1] =  0x40000000;
> +	msg->ddr_cmds_data[0][2] =  0x40000000;
> +
> +	/*
> +	 * These are the CX (CNOC) votes - these are used by the GMU but the
> +	 * votes are known and fixed for the target
> +	 */
> +	msg->cnoc_cmds_num = 1;
> +	msg->cnoc_wait_bitmask = 0x01;
> +
> +	msg->cnoc_cmds_addrs[0] = 0x500a4;
> +	msg->cnoc_cmds_data[0][0] =  0x40000000;
> +	msg->cnoc_cmds_data[1][0] =  0x60000001;
> +}
> +
>  static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
> @@ -327,6 +397,10 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  
>  	if (adreno_is_a618(adreno_gpu))
>  		a618_build_bw_table(&msg);
> +	else if (adreno_is_a640(adreno_gpu))
> +		a640_build_bw_table(&msg);
> +	else if (adreno_is_a650(adreno_gpu))
> +		a650_build_bw_table(&msg);
>  	else
>  		a6xx_build_bw_table(&msg);
>  
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
