Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135973DB618
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 11:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499536E17F;
	Fri, 30 Jul 2021 09:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39F26E17F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 09:35:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16U9QZXK012657; Fri, 30 Jul 2021 11:35:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jh2tP+Ggpxi+nekHH4rWJSAXvsdTZoHAgp4Z+RKPX2c=;
 b=EeOqKCVCc3Y8ISb0x7nbd4cvVUydwLzeEGrOeSgSO4pTcOfmej6nf7uDRvUyI5Ndcppk
 yL9CKMI0fMk0+1rGTycZKfVa4lwQqNFc67bFfxM6PZvlFGKjFLQ0fe89hIF9LdXP7cWw
 QTSamcbNiYD2LLg93iYmlVkZcoxP95y5bj7jfWJehVP4nYmbVdrmqp63DRtAQo+GpcMo
 6Jt4TWBdulyJXYhXGMColzTAt/gImWXazzanWQP8kfSyMwcbnLJsNhSEsrE2IwwICG+Z
 FdvxCzCFZwvO14VqVyzC7rU4ODvldp0MuCYQhT+7GAWu410f2GMhD8yyuhN8+voPLxlD 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a4c0q1257-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 11:35:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31B6D100034;
 Fri, 30 Jul 2021 11:35:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDAC321E66A;
 Fri, 30 Jul 2021 11:35:05 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 11:35:05 +0200
Subject: Re: [PATCH 2/7] drm/sti: Use correct printk format specifiers for
 size_t
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, Alain VOLMAT-SCND-01
 <alain.volmat@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210728153736.15240-3-laurent.pinchart+renesas@ideasonboard.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <5352e2eb-86db-90b0-de58-6e0b794fcde6@foss.st.com>
Date: Fri, 30 Jul 2021 11:35:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728153736.15240-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_05:2021-07-29,
 2021-07-30 signatures=0
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-renesas-soc@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-imx@nxp.com, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-tegra@vger.kernel.org, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/28/21 5:37 PM, Laurent Pinchart wrote:
> The correct format specifier for size_t is %zu. Using %d (or %u)
> generates a warning on 64-bit platforms. Fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/sti/sti_hqvdp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
> index d09b08995b12..3c61ba8b43e0 100644
> --- a/drivers/gpu/drm/sti/sti_hqvdp.c
> +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
> @@ -927,12 +927,12 @@ static void sti_hqvdp_start_xp70(struct sti_hqvdp *hqvdp)
>   
>   	header = (struct fw_header *)firmware->data;
>   	if (firmware->size < sizeof(*header)) {
> -		DRM_ERROR("Invalid firmware size (%d)\n", firmware->size);
> +		DRM_ERROR("Invalid firmware size (%zu)\n", firmware->size);
>   		goto out;
>   	}
>   	if ((sizeof(*header) + header->rd_size + header->wr_size +
>   		header->pmem_size + header->dmem_size) != firmware->size) {
> -		DRM_ERROR("Invalid fmw structure (%d+%d+%d+%d+%d != %d)\n",
> +		DRM_ERROR("Invalid fmw structure (%zu+%d+%d+%d+%d != %zu)\n",

Hi Laurent,

Looping Benjamin (new email address) and Alain (future maintainer of 
drm/sti).

Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>
Many thanks for your patch,
Philippe :-)

>   			  sizeof(*header), header->rd_size, header->wr_size,
>   			  header->pmem_size, header->dmem_size,
>   			  firmware->size);
> 
