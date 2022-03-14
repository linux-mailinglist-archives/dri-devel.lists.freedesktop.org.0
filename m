Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BDC4D878E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 16:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2E810E3C2;
	Mon, 14 Mar 2022 14:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB50110E376
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 14:59:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22ECqXdf000863;
 Mon, 14 Mar 2022 15:59:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=3d3xphwtCiYLHwmvMiCMqQ9IdfMaodMtFG7XX2hajkg=;
 b=6t2yZ1M7nzybm88aNxh41drGu5zAh/kl5/YUxPXfvCuhFXuPfENUBGceOg2fhhktapVh
 Euahgcl5npYz0qdtHbX8r47lYhXsUzkdQ74LP3UnWOg6+t6AbQzO95O7DGnBrSQmmQ29
 tVJiq/H7a2i6xx36e7+8vncdzCNUDlQIqaSSnOyzRuLO8sECtBei6xdSwSHwR5aM0iWX
 9SUNucU3FZ+SY43rlLIkhysGZE9rB015a7UEdC2eT3zp9YHpEFQ6rm7QTSvkxidGxjK1
 FBbrI99nh6fjeZ/566FH1WAkyqsO6jnQsn9lp0Uoz5zusORLFqoyZziDDQO+eANN4jey Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63hrtm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 15:59:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8E7210002A;
 Mon, 14 Mar 2022 15:59:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D87742291A3;
 Mon, 14 Mar 2022 15:59:50 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 14 Mar
 2022 15:59:50 +0100
Date: Mon, 14 Mar 2022 15:59:42 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH 16/30] drm/sti: fix typos in comments
Message-ID: <20220314145928.GA529711@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Julia Lawall <Julia.Lawall@inria.fr>,
 kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
 <20220314115354.144023-17-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220314115354.144023-17-Julia.Lawall@inria.fr>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_11,2022-03-14_01,2022-02-23_01
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Julia

thanks for the patch.

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

Alain

On Mon, Mar 14, 2022 at 12:53:40PM +0100, Julia Lawall wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/gpu/drm/sti/sti_gdp.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
> index 3db3768a3241..b58415f2e4d8 100644
> --- a/drivers/gpu/drm/sti/sti_gdp.c
> +++ b/drivers/gpu/drm/sti/sti_gdp.c
> @@ -406,7 +406,7 @@ static struct sti_gdp_node_list *sti_gdp_get_free_nodes(struct sti_gdp *gdp)
>  		    (hw_nvn != gdp->node_list[i].top_field_paddr))
>  			return &gdp->node_list[i];
>  
> -	/* in hazardious cases restart with the first node */
> +	/* in hazardous cases restart with the first node */
>  	DRM_ERROR("inconsistent NVN for %s: 0x%08X\n",
>  			sti_plane_to_str(&gdp->plane), hw_nvn);
>  
> 
