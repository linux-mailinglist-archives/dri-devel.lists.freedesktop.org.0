Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89BA4F7B86
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CC910E0F5;
	Thu,  7 Apr 2022 09:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900D010E0F5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:24:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2375IfKD006910;
 Thu, 7 Apr 2022 11:24:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jjm66IhMmXssBJIGy9+tsQSPGgWrKquMgoKpEwFFvcE=;
 b=fPZLiI2XbDepOd2MTC1IYuiTf2yNBTg9DGHWuEPllYK7cbjIrbf/5kMRR97oNKrJOpV9
 NKduqSXlxz8zYVQdCvC8WG6CwsUYLNOC/3nx0nTDIhUZpbd7Pkj2K2s3E6xIcrdcGW39
 kHwC0SBxXjYRFbdvJiNWxttSpd7iK1gy4PWmvyEHyhCvpIkyj4Bep9fxbEIvNPwRgZOj
 iU2gblPzOlH49dIJCEPQ37uTxdQ7a1zM1pe8Hhed5R8P+BPuJVo2cWvd9xaHl0nx6trD
 p4Q6ezV17XTvudMaSWnSbKsVr12TAujTfN0y/3Br39yO6/4F2QBJBQ4RVTzfCOwoDWXr MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f8x9gjqkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 11:24:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F54810002A;
 Thu,  7 Apr 2022 11:24:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7ECD2215A31;
 Thu,  7 Apr 2022 11:24:51 +0200 (CEST)
Received: from [10.201.22.81] (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 7 Apr
 2022 11:24:50 +0200
Message-ID: <129c5d51-b645-e9eb-00ad-c660d2f16b9d@foss.st.com>
Date: Thu, 7 Apr 2022 11:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm: sti: fix spelling mistake: rejec -> rejection
Content-Language: en-US
To: Colin King <colin.king@canonical.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>,
 "David Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
References: <20191004082706.26478-1-colin.king@canonical.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20191004082706.26478-1-colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_13,2022-04-06_01,2022-02-23_01
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/4/19 10:27, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In other places of the driver the string hdmi_rejection_pll is
> used instead of the truncated hdmi_rejec_pll, so use this string
> instead to be consistent.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/gpu/drm/sti/sti_hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 814560ead4e1..e2018e4a3ec5 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -886,7 +886,7 @@ static void sti_hdmi_pre_enable(struct drm_bridge *bridge)
>   	if (clk_prepare_enable(hdmi->clk_tmds))
>   		DRM_ERROR("Failed to prepare/enable hdmi_tmds clk\n");
>   	if (clk_prepare_enable(hdmi->clk_phy))
> -		DRM_ERROR("Failed to prepare/enable hdmi_rejec_pll clk\n");
> +		DRM_ERROR("Failed to prepare/enable hdmi_rejection_pll clk\n");
>   
>   	hdmi->enabled = true;
>   

Dear Colin,
Many thanks for your patch,
Applied on drm-misc-next.
and sorry for the delay.
Have a good day
Philippe :-)
