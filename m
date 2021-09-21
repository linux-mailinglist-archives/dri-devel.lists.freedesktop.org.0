Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D68413A11
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 20:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A90689EAC;
	Tue, 21 Sep 2021 18:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5B489F27
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 18:26:36 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210921182634euoutp01617f38a3cf96fb60ab7a03470fbc13c0~m6aFZlhI_1077110771euoutp01S
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 18:26:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210921182634euoutp01617f38a3cf96fb60ab7a03470fbc13c0~m6aFZlhI_1077110771euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1632248794;
 bh=Zy9BKJolxwh1mQsooLXw3yILwPZ4rbdk0ERKFbkc99A=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Zba9hqk+5GcMGTuwEmZqH7LzZ+9RSeBxL7gqN88mnrnRsTJbPtPHzSpWFm5OILv9v
 k6hyyGDtbJt4T+99g0ikzBU4YKj3BnuT0Kar04F2UEyp4A5S4JAF4NlRVO/wblXXJD
 IaocIGC1y44A4syIRYBenIPbvjZkc52KSQ2MWwfk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210921182633eucas1p24c22c2e7367f8180f969957ac5c86b21~m6aEdgxR91712817128eucas1p2R;
 Tue, 21 Sep 2021 18:26:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CB.8F.45756.8D32A416; Tue, 21
 Sep 2021 19:26:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210921182632eucas1p149acb4f8e51c66df6ca39ca5475b43e8~m6aEDCrEF3108031080eucas1p1A;
 Tue, 21 Sep 2021 18:26:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210921182632eusmtrp1d63221fd80020d9b68b7bffadc073896~m6aECIsz_0115201152eusmtrp12;
 Tue, 21 Sep 2021 18:26:32 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-9e-614a23d838b3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 28.79.20981.8D32A416; Tue, 21
 Sep 2021 19:26:32 +0100 (BST)
Received: from [106.210.131.79] (unknown [106.210.131.79]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210921182632eusmtip2cf45ed22ca6e0c2cb6f7b7b95a926278~m6aDZFXCM2275622756eusmtip2x;
 Tue, 21 Sep 2021 18:26:31 +0000 (GMT)
Message-ID: <ead3bbcd-5d24-5015-e2b1-3a82141708b6@samsung.com>
Date: Tue, 21 Sep 2021 20:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0)
 Gecko/20100101 Thunderbird/93.0
Subject: Re: [PATCH] drm/msm/dsi: do not install irq handler before power up
 the host
Content-Language: pl
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
From: Andrzej Hajda <a.hajda@samsung.com>
In-Reply-To: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBKsWRmVeSWpSXmKPExsWy7djP87o3lb0SDXblWPx82MRs0XvuJJPF
 6f3vWCz+b5vIbHFsn73FxPM/2SyufH3PZjHn+VlGi6l7NjJaTNx/lt3i+cIfzBb/rm1ksbg7
 +QijA6/H5b5eJo+93xaweOycdZfdo7/xILPHplWdbB53ru1h89j+7QGrx/3u40wej4+9YPU4
 vusWu8fnTXIB3FFcNimpOZllqUX6dglcGXsbr7AVzBGu2HxxMnsD4xb+LkZODgkBE4lt094y
 djFycQgJrGCUWHnqEyuE84VRomPqaWYI5zOjxJyj69lgWu6dOwaVWM4oseTmf6iW94wSj5qe
 M4FU8QrYSSz9fogFxGYRUJWY+XQ3M0RcUOLkzCdgcVGBBInX9zYBTeXgEBYIl9j6VBEkzCwg
 InHjUQvYTSICp4FuenmDHcRhFpjEJPGg6T9YM5uApsTfzTfBTuIUcJa48vM+E0S3vETz1tnM
 EKfu5pRo+i8NYbtIdM2YzARhC0u8Or6FHcKWkTg9uYcFwq6XuL+iBew1CYEORomtG3ZCDbKW
 uHPuF9ilzECL1+/Shwg7Sjxaf5gJJCwhwCdx460gxAl8EpO2TWeGCPNKdLQJQVQrStw/uxVq
 oLjE0gtf2SYwKs1CCpVZSN6fheSZWQh7FzCyrGIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/d
 xAhMfKf/Hf+0g3Huq496hxiZOBgPMUpwMCuJ8KY+cUsU4k1JrKxKLcqPLyrNSS0+xCjNwaIk
 zrtq9pp4IYH0xJLU7NTUgtQimCwTB6dUA1Nv3MJvOZurjr0+X7ImIjZ3yoGXX36eSVtbu0O3
 /+2aNxUsj9ilWhozJ+4qWiCtcF8g0OmJprmsbcXc818nmq2bffpYr7gqy6smuQzj7cfu352g
 f+zZnpTsz0ej9q64qGbmX3JSv9Y8cOF798JuT1GWCt8lW3jfx1rmSGyyMWB225iddeJIpP7z
 39lpxXZfY6/UnFz83OHu+schdk6eq25uCrkUyc752J5x+2ce+xNqRkp95idFbuvYp+xiPBA5
 3eoin6oFb+sEJeZyMeWHDfbPr/xXLFkpf+LFO+vzf/dXO52p+BfFeCp2WckanveeCcIca3na
 OD8px7IvCevtn3QhIHdLfa3I+dKplTqmj5RYijMSDbWYi4oTAUn/qyvrAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRmVeSWpSXmKPExsVy+t/xe7o3lL0SDTY8VLX4+bCJ2aL33Ekm
 i9P737FY/N82kdni2D57i4nnf7JZXPn6ns1izvOzjBZT92xktJi4/yy7xfOFP5gt/l3byGJx
 d/IRRgdej8t9vUwee78tYPHYOesuu0d/40Fmj02rOtk87lzbw+ax/dsDVo/73ceZPB4fe8Hq
 cXzXLXaPz5vkArij9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMy
 y1KL9O0S9DL2Nl5hK5gjXLH54mT2BsYt/F2MnBwSAiYS984dYwaxhQSWMkpsaLSBiItL7J7/
 lhnCFpb4c62LrYuRC6jmLaPE6y1bmUASvAJ2Eku/H2IBsVkEVCVmPt3NDBEXlDg58wlYXFQg
 QWLyzXmsXYwcHMIC4RJbnyqChJkFRCRuPGphBJkpInCWUWJFRz+YwywwiUni0+xNLBDbpjFK
 3Ol4DjaVTUBT4u/mm2wgNqeAs8SVn/eZIEaZSXRt7WKEsOUlmrfOZp7AKDQLySGzkGychaRl
 FpKWBYwsqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQKjfduxn1t2MK589VHvECMTB+MhRgkO
 ZiUR3tQnbolCvCmJlVWpRfnxRaU5qcWHGE2BoTGRWUo0OR+YbvJK4g3NDEwNTcwsDUwtzYyV
 xHlNjqyJFxJITyxJzU5NLUgtgulj4uCUamDqlvzAeCRuVUtA4xmRBPsJX3oO/PhS6Z+lwtDT
 UWdepMY3reF/1ZPMAGe9f70MSRfbmxOtZl2f/e/UIa6gKRJT9ujc2s62t6DMKE7QqvtQo8Ml
 bkHFR7P/Hv012y1Zxi5947uT9idt9n7dyn7vWLvO2hPVj2azXXzv4v+2ZoWEzr3kt9+etOS/
 TEneZy/d+nVS6oTUrF9fr+uqn/655bjDvj3ep3TUT+Tq7BRKvXy8xHZN4nt12SuPlh6Zr5+n
 lcu27Yx4TGvms5NX/3veaZPujy2tdBVZXLj76wqpRRXGH0uv1k28xSeYIvCNfZaU45SvM+cf
 7Vwt/Humverxm+v8Jbzf33pi6CDmWH6hrnGvEktxRqKhFnNRcSIA7yzj1H8DAAA=
X-CMS-MailID: 20210921182632eucas1p149acb4f8e51c66df6ca39ca5475b43e8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210921162311eucas1p203a8c6477b03f44887f76e99c9c60e28
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210921162311eucas1p203a8c6477b03f44887f76e99c9c60e28
References: <CGME20210921162311eucas1p203a8c6477b03f44887f76e99c9c60e28@eucas1p2.samsung.com>
 <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
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

W dniu 21.09.2021 o 18:22, Dmitry Baryshkov pisze:
> The DSI host might be left in some state by the bootloader. If this
> state generates an IRQ, it might hang the system by holding the
> interrupt line before the driver sets up the DSI host to the known
> state.
>
> Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
> so that we can be sure that the interrupt is delivered when the host is
> in the known state.


The established practice is to request IRQ in probe, to avoid 
auto-enabling use IRQF_NO_AUTOEN flag.

Then you can call enable_irq in power-on.


Regards

Andrzej



>
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e269df285136..cd842347a6b1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>   		return ret;
>   	}
>   
> -	ret = devm_request_irq(&pdev->dev, msm_host->irq,
> -			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> -			"dsi_isr", msm_host);
> -	if (ret < 0) {
> -		DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
> -				msm_host->irq, ret);
> -		return ret;
> -	}
> -
>   	msm_host->dev = dev;
>   	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>   	if (ret) {
> @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>   	if (msm_host->disp_en_gpio)
>   		gpiod_set_value(msm_host->disp_en_gpio, 1);
>   
> +	ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
> +			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +			"dsi_isr", msm_host);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to request IRQ%u: %d\n",
> +				msm_host->irq, ret);
> +		return ret;
> +	}
> +
> +
>   	msm_host->power_on = true;
>   	mutex_unlock(&msm_host->dev_mutex);
>   
> @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>   		goto unlock_ret;
>   	}
>   
> +	devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
> +
>   	dsi_ctrl_config(msm_host, false, NULL, NULL);
>   
>   	if (msm_host->disp_en_gpio)
