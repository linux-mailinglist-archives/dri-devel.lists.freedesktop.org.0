Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F7C662E93
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 19:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3769F10E4E3;
	Mon,  9 Jan 2023 18:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 843 seconds by postgrey-1.36 at gabe;
 Mon, 09 Jan 2023 08:34:51 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632A510E294;
 Mon,  9 Jan 2023 08:34:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3098KEbE005525;
 Mon, 9 Jan 2023 02:20:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1673252414;
 bh=98nckAPo1vAa2VGOJss+hU8H+5NzLRli7Jdtq00XhZY=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=q0acF1k/8t89ewEtD4TmAH1DhJ+uNyOhwCC3+3eOs+XyUeNukbiDcI8P+4TB3IKG9
 kN+m4dRTxa+/HdnA0A8x4rThnpkpg+UzXS17O8eJhMS4IB9ho2Yy+SBsGOXBjdqpqG
 WeMWjxNXqxjpBNgiV5d0bmOxQwlDIHaWbklT05L4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3098KE8X123160
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Jan 2023 02:20:14 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 9
 Jan 2023 02:20:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 9 Jan 2023 02:20:13 -0600
Received: from [10.24.69.26] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3098K8s1022473;
 Mon, 9 Jan 2023 02:20:09 -0600
Message-ID: <f7bf366a-dc32-47a2-79fc-c6f7f1f93ab7@ti.com>
Date: Mon, 9 Jan 2023 13:50:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] drm/msm/dsi: Add missing check for
 alloc_ordered_workqueue
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <marijn.suijten@somainline.org>, <vkoul@kernel.org>,
 <dianders@chromium.org>, <marex@denx.de>, <vladimir.lypak@gmail.com>
References: <20230109025044.27766-1-jiasheng@iscas.ac.cn>
Content-Language: en-US
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <20230109025044.27766-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 09 Jan 2023 18:19:25 +0000
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/01/23 08:20, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference.
> Moreover, change the "goto fail" into "return ret" and drop the "fail"
> label since they are the same.
> 
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>

> Changelog:
> 
> v1 -> v2:
> 
> 1. Change the "goto fail" into "return ret" and drop the "fail" label.
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 89aadd3b3202..819f5be5fd77 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1884,7 +1884,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
>   	if (!msm_host) {
>   		ret = -ENOMEM;
> -		goto fail;
> +		return ret;
>   	}
>   
>   	msm_host->pdev = pdev;
> @@ -1893,14 +1893,14 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   	ret = dsi_host_parse_dt(msm_host);
>   	if (ret) {
>   		pr_err("%s: failed to parse dt\n", __func__);
> -		goto fail;
> +		return ret;
>   	}
>   
>   	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", &msm_host->ctrl_size);
>   	if (IS_ERR(msm_host->ctrl_base)) {
>   		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
>   		ret = PTR_ERR(msm_host->ctrl_base);
> -		goto fail;
> +		return ret;
>   	}
>   
>   	pm_runtime_enable(&pdev->dev);
> @@ -1909,7 +1909,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   	if (!msm_host->cfg_hnd) {
>   		ret = -EINVAL;
>   		pr_err("%s: get config failed\n", __func__);
> -		goto fail;
> +		return ret;
>   	}
>   	cfg = msm_host->cfg_hnd->cfg;
>   
> @@ -1917,7 +1917,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   	if (msm_host->id < 0) {
>   		ret = msm_host->id;
>   		pr_err("%s: unable to identify DSI host index\n", __func__);
> -		goto fail;
> +		return ret;
>   	}
>   
>   	/* fixup base address by io offset */
> @@ -1927,19 +1927,19 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   					    cfg->regulator_data,
>   					    &msm_host->supplies);
>   	if (ret)
> -		goto fail;
> +		return ret;
>   
>   	ret = dsi_clk_init(msm_host);
>   	if (ret) {
>   		pr_err("%s: unable to initialize dsi clks\n", __func__);
> -		goto fail;
> +		return ret;
>   	}
>   
>   	msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
>   	if (!msm_host->rx_buf) {
>   		ret = -ENOMEM;
>   		pr_err("%s: alloc rx temp buf failed\n", __func__);
> -		goto fail;
> +		return ret;
>   	}
>   
>   	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
> @@ -1977,15 +1977,17 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   
>   	/* setup workqueue */
>   	msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
> +	if (!msm_host->workqueue) {
> +		ret = -ENOMEM;
> +		return ret;

Why not simply return -ENOMEM;
instead?

> +	}
> +
>   	INIT_WORK(&msm_host->err_work, dsi_err_worker);
>   
>   	msm_dsi->id = msm_host->id;
>   
>   	DBG("Dsi Host %d initialized", msm_host->id);
>   	return 0;
> -
> -fail:
> -	return ret;
>   }
>   
>   void msm_dsi_host_destroy(struct mipi_dsi_host *host)

-- 
Thanks and Regards,
Dhruva Gole
