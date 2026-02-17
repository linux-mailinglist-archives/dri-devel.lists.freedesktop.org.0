Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNFWC7BnlGlRDgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 14:05:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9914C581
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 14:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDE110E4D4;
	Tue, 17 Feb 2026 13:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YsCFdrWo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5486D10E23B;
 Tue, 17 Feb 2026 13:05:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1EBBD401DF;
 Tue, 17 Feb 2026 13:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE885C4CEF7;
 Tue, 17 Feb 2026 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771333547;
 bh=YncLtiDZMDpaKzOMgaNUhFWgiWcHTE5/iqvNFpH2lU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YsCFdrWo9EgQbwmiUI2JC1d1sVYqNuQHQ1/bcHlY055CMZjF1hmGvgoV8cJ9XAX33
 kFg2zfehK+N61S5bNfn7EWMNHvkkv2BXwjGfJgw9gmmiDor8gKIM0h7DmVhaWHs9w1
 DsLLd3kOeZJJmfju/Q9MqWpR/BJrCajFmF550jZRQ6nlUY4C2I+gpl+3AahkU18xQ8
 444I0w3oni7G24HHzXeO/eE0dnfUPH7J4eEJKOb4M7YXrQunFUp/sLJTtzcxCA5ZvA
 AelTRZLIZPEnnim1ojcvHzTvmj/MfIOj6ZPumng2EBk55eMxsVUn+Ji6acqIDCXS8W
 uVgt0H1lO4nTQ==
Date: Tue, 17 Feb 2026 18:35:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Subject: Re: [PATCH] Revert "drm/msm/dpu: try reserving the DSPP-less LM first"
Message-ID: <hcsh6ql2ylidw4ruszd5hea6zjpquzkacdkr7pbifppi3gpnbg@btdlt4m6znpl>
References: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,packett.cool];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: D1B9914C581
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 01:02:59AM +0200, Dmitry Baryshkov wrote:
> This reverts commit 42f62cd79578 ("drm/msm/dpu: try reserving the
> DSPP-less LM first"). It seems on later DPUs using higher LMs require
> some additional setup or conflicts with the hardware defaults. Val (and
> other developers) reported blue screen on Hamoa (X1E80100) laptops.
> Revert the offending commit until we understand, what is the issue.
> 
> Fixes: 42f62cd79578 ("drm/msm/dpu: try reserving the DSPP-less LM first")
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/r/33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Manivannan Sadhasivam <mani@kernel.org> # T14s

- Mani

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 52 +++++++++-------------------------
>  1 file changed, 14 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 451a4fcf3e65..7e77d88f8959 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -350,26 +350,28 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>  	return true;
>  }
>  
> -static bool dpu_rm_find_lms(struct dpu_rm *rm,
> -			    struct dpu_global_state *global_state,
> -			    uint32_t crtc_id, bool skip_dspp,
> -			    struct msm_display_topology *topology,
> -			    int *lm_idx, int *pp_idx, int *dspp_idx)
> +static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> +			       struct dpu_global_state *global_state,
> +			       uint32_t crtc_id,
> +			       struct msm_display_topology *topology)
>  
>  {
> +	int lm_idx[MAX_BLOCKS];
> +	int pp_idx[MAX_BLOCKS];
> +	int dspp_idx[MAX_BLOCKS] = {0};
>  	int i, lm_count = 0;
>  
> +	if (!topology->num_lm) {
> +		DPU_ERROR("zero LMs in topology\n");
> +		return -EINVAL;
> +	}
> +
>  	/* Find a primary mixer */
>  	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
>  			lm_count < topology->num_lm; i++) {
>  		if (!rm->mixer_blks[i])
>  			continue;
>  
> -		if (skip_dspp && to_dpu_hw_mixer(rm->mixer_blks[i])->cap->dspp) {
> -			DPU_DEBUG("Skipping LM_%d, skipping LMs with DSPPs\n", i);
> -			continue;
> -		}
> -
>  		/*
>  		 * Reset lm_count to an even index. This will drop the previous
>  		 * primary mixer if failed to find its peer.
> @@ -408,38 +410,12 @@ static bool dpu_rm_find_lms(struct dpu_rm *rm,
>  		}
>  	}
>  
> -	return lm_count == topology->num_lm;
> -}
> -
> -static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> -			       struct dpu_global_state *global_state,
> -			       uint32_t crtc_id,
> -			       struct msm_display_topology *topology)
> -
> -{
> -	int lm_idx[MAX_BLOCKS];
> -	int pp_idx[MAX_BLOCKS];
> -	int dspp_idx[MAX_BLOCKS] = {0};
> -	int i;
> -	bool found;
> -
> -	if (!topology->num_lm) {
> -		DPU_ERROR("zero LMs in topology\n");
> -		return -EINVAL;
> -	}
> -
> -	/* Try using non-DSPP LM blocks first */
> -	found = dpu_rm_find_lms(rm, global_state, crtc_id, !topology->num_dspp,
> -				topology, lm_idx, pp_idx, dspp_idx);
> -	if (!found && !topology->num_dspp)
> -		found = dpu_rm_find_lms(rm, global_state, crtc_id, false,
> -					topology, lm_idx, pp_idx, dspp_idx);
> -	if (!found) {
> +	if (lm_count != topology->num_lm) {
>  		DPU_DEBUG("unable to find appropriate mixers\n");
>  		return -ENAVAIL;
>  	}
>  
> -	for (i = 0; i < topology->num_lm; i++) {
> +	for (i = 0; i < lm_count; i++) {
>  		global_state->mixer_to_crtc_id[lm_idx[i]] = crtc_id;
>  		global_state->pingpong_to_crtc_id[pp_idx[i]] = crtc_id;
>  		global_state->dspp_to_crtc_id[dspp_idx[i]] =
> 
> ---
> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> change-id: 20260214-revert-dspp-less-8426dee24b92
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 

-- 
மணிவண்ணன் சதாசிவம்
