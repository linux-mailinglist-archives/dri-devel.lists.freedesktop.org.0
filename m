Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8EB259923
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CDF6E886;
	Tue,  1 Sep 2020 16:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B963389B96
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 11:09:14 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200901110912epoutp04c6ea1d845a2e30a703b6156e95ae7cdd~wpFUFX9D-3144031440epoutp04U
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 11:09:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200901110912epoutp04c6ea1d845a2e30a703b6156e95ae7cdd~wpFUFX9D-3144031440epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598958552;
 bh=ln393y8fuOqkR5rfKtX5PMD/RrB2vBw4AuzvUPUfPcw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=UbJk5lGbgXnobVuEuqCVH1sP0xmvLdUjQlldEO2v7b1BvsTPLZTzF4r18EtVyJlhx
 GfVo5NvTRGrPZ8fSgqXCvSwmtKPlUaAnZzHIv3MWb6E9tJ2q5ZS2WE5KeZqJsf1nGb
 j9z05fwSr4pc85SC/Zg20sBWv8VBOn3hI11EQstU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200901110912epcas1p2481b6b4988a9ced45b659c1c17f105ba~wpFT6Bp191035710357epcas1p2A;
 Tue,  1 Sep 2020 11:09:12 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.153]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Bgkps2C8pzMqYkj; Tue,  1 Sep
 2020 11:09:09 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 80.52.19033.5DB2E4F5; Tue,  1 Sep 2020 20:09:09 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200901110908epcas1p1187737a9b58b1dd8b868c1a3f520bd0f~wpFQKiytE1134811348epcas1p1k;
 Tue,  1 Sep 2020 11:09:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200901110908epsmtrp1fe02625d823aed052a4c5ddcc2f8c6db~wpFQJt9g82800628006epsmtrp1P;
 Tue,  1 Sep 2020 11:09:08 +0000 (GMT)
X-AuditID: b6c32a36-16fff70000004a59-35-5f4e2bd5e0f3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A2.A2.08382.4DB2E4F5; Tue,  1 Sep 2020 20:09:08 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200901110908epsmtip1b27fd75b2e63060dc5505a48f1cd9f57~wpFP8ZKCm0094600946epsmtip1M;
 Tue,  1 Sep 2020 11:09:08 +0000 (GMT)
Subject: Re: [PATCH v4 03/78] drm/vc4: hvs: Boost the core clock during modeset
To: Maxime Ripard <maxime@cerno.tech>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>, Eric Anholt <eric@anholt.net>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <a4f6ea62-441a-8e5b-5383-13d7f2b1a920@samsung.com>
Date: Tue, 1 Sep 2020 20:21:36 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <b04341887fb1acb9ed4adc28d109f9e21f146c7d.1594230107.git-series.maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmnu5Vbb94g3nL+SzW9h5lsXg7dzGL
 xZWv79ksDjReZrTY9Pgaq8XlXXPYLCbe3sBuMePHP0aLbbOWs1msu/WazeLR1PuMDtweTe+P
 sXnMun+WzePOufNsHve7jzN5bF5S79F69BeLx+bT1R6fN8kFcERl22SkJqakFimk5iXnp2Tm
 pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
 SVXIyC8usVVKLUjJKbAs0CtOzC0uzUvXS87PtTI0MDAyBSpMyM5492gCY8E3hYodm26yNTDe
 lexi5OSQEDCRaLn1nLGLkYtDSGAHo8S/04/ZIJxPjBJv1l5jgXC+MUqs+9jOCNNybtNzdhBb
 SGAvo8T07fUQRe8ZJV6+PcbaxcjBISwQKDFhtxJIjYhAuUR7535mkBpmgR1MEh2nprOBJNgE
 tCT2v7gBZvMLKEpc/fEYbAGvgJ3EgVUXWEFsFgEVibZnM5lAbFGBMImT21qgagQlTs58wgKy
 i1MgXuLLDlOQMLOAuMStJ/OZIGx5ie1v54DtlRC4wCGx/zPILg4gx0ViZQ87xC/CEq+Ob4Gy
 pSRe9rdB2dUSK08eYYPo7WCU2LIf4h4JAWOJ/UsnM4HMYRbQlFi/Sx8irCix8/dcRoi9fBLv
 vvawQqzilehoE4IoUZa4/OAuE4QtKbG4vZNtAqPSLCTPzELywSwkH8xCWLaAkWUVo1hqQXFu
 emqxYYERclxvYgSnYC2zHYyT3n7QO8TIxMF4iFGCg1lJhHfmDd94Id6UxMqq1KL8+KLSnNTi
 Q4ymwOCdyCwlmpwPzAJ5JfGGpkbGxsYWJoZmpoaGSuK8D28pxAsJpCeWpGanphakFsH0MXFw
 SjUwKa529f1t7HOK7+zuu7uMjoWKvLL5sEvZbdX125ovLaZET1rdXHz63L6LWQ8fBlzza1rf
 mTztttVtr0lJfJ4i6Sf/rnZ6vKHPn/fPt2Wpa1w/fjKMSOXV+bxp1o2ae190Fn5N0e17YL+k
 MS3JXDC0p/vjzaAsjc5epinNnOm7nUqjnvbYyutPq9T78e7JPJ5jEYH+e6X95B30O69tu8JY
 GPmPwbmPZZOUlenlhDXGzKcC6q1WfRUXbFjR2hQ8u9xbv/Uwl6n1A5ZOyZAEAd/lcVEuNmL8
 XhclJx/lfnJ2T2+ATJHxJhFfecFbmst4v5Yd2TX5ENdxV97Mej+eX+XOC6t2XnSPuuU5l/Pq
 nWIlluKMREMt5qLiRABzPzYwSgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsWy7bCSnO4Vbb94g9O/ZCzW9h5lsXg7dzGL
 xZWv79ksDjReZrTY9Pgaq8XlXXPYLCbe3sBuMePHP0aLbbOWs1msu/WazeLR1PuMDtweTe+P
 sXnMun+WzePOufNsHve7jzN5bF5S79F69BeLx+bT1R6fN8kFcERx2aSk5mSWpRbp2yVwZbx7
 NIGx4JtCxY5NN9kaGO9KdjFyckgImEic2/ScvYuRi0NIYDejxJLW2cwQCUmJaRePAtkcQLaw
 xOHDxRA1bxkljsw/BxYXFgiUmLBbCaRcRKBS4vOcXcwgNcwCO5gkuh6fZoFo6GWS2PNnOztI
 FZuAlsT+FzfYQGx+AUWJqz8eM4LYvAJ2EgdWXWAFsVkEVCTans1kArFFBcIkdi55zARRIyhx
 cuYTFpDFnALxEl92mIKEmQXUJf7Mu8QMYYtL3HoynwnClpfY/nYO8wRG4VlIumchaZmFpGUW
 kpYFjCyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGC41FLcwfj9lUf9A4xMnEwHmKU
 4GBWEuGdecM3Xog3JbGyKrUoP76oNCe1+BCjNAeLkjjvjcKFcUIC6YklqdmpqQWpRTBZJg5O
 qQam0Ne6Nx77Zj6N9rumcXjnkfl5zQ7y26yTQmq/F5kkzT7x1VIgaPu3XLa6Fuk57cKLGjtz
 /1y0nWnh3b17nvaPV4wpgteSEqP5eauPL+K4t02kZRqLu1VhSYPDpM2qEn/U8ybevhB9qfD+
 X075E5O/6bcx67Ff6N0z7/+ZSQnWMqIzuVWma++/+Lom+njakXzX600xKqELl70U4/tXMz1/
 xpOfXxjStq274VqhdeVIymLdgMvFnjbOpyUf9PAu0XC7eLHhrrdEcLBsRtohVvNgu3cFCv/3
 b/xwKbYkulZY9J7Iqt8dzUt8ZPxOpaWZy+Sn3qubphvmv1TqtrzVC9d9IrUzl0fOvWXDvtWw
 eKkSS3FGoqEWc1FxIgDiyowgNgMAAA==
X-CMS-MailID: 20200901110908epcas1p1187737a9b58b1dd8b868c1a3f520bd0f
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200708174243epcas1p2b5646e3d45e412d1cd1286d90cb9cc37
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <CGME20200708174243epcas1p2b5646e3d45e412d1cd1286d90cb9cc37@epcas1p2.samsung.com>
 <b04341887fb1acb9ed4adc28d109f9e21f146c7d.1594230107.git-series.maxime@cerno.tech>
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:37:23 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 7/9/20 2:41 AM, Maxime Ripard wrote:
> In order to prevent timeouts and stalls in the pipeline, the core clock
> needs to be maxed at 500MHz during a modeset on the BCM2711.
> 
> Reviewed-by: Eric Anholt <eric@anholt.net>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_drv.h |  2 ++
>  drivers/gpu/drm/vc4/vc4_hvs.c |  9 +++++++++
>  drivers/gpu/drm/vc4/vc4_kms.c |  9 +++++++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index e4cde1f9224b..6358f6ca8d56 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -320,6 +320,8 @@ struct vc4_hvs {
>  	void __iomem *regs;
>  	u32 __iomem *dlist;
>  
> +	struct clk *core_clk;
> +
>  	/* Memory manager for CRTCs to allocate space in the display
>  	 * list.  Units are dwords.
>  	 */
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 836d8799d79e..091fdf4908aa 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -19,6 +19,7 @@
>   * each CRTC.
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/platform_device.h>
>  
> @@ -540,6 +541,14 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>  	hvs->regset.regs = hvs_regs;
>  	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
>  
> +	if (hvs->hvs5) {
> +		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
> +		if (IS_ERR(hvs->core_clk)) {
> +			dev_err(&pdev->dev, "Couldn't get core clock\n");
> +			return PTR_ERR(hvs->core_clk);
> +		}
> +	}
> +
>  	if (!hvs->hvs5)
>  		hvs->dlist = hvs->regs + SCALER_DLIST_START;
>  	else
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 08318e69061b..210cc2408087 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -11,6 +11,8 @@
>   * crtc, HDMI encoder).
>   */
>  
> +#include <linux/clk.h>
> +
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
> @@ -149,6 +151,7 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>  {
>  	struct drm_device *dev = state->dev;
>  	struct vc4_dev *vc4 = to_vc4_dev(dev);
> +	struct vc4_hvs *hvs = vc4->hvs;
>  	struct vc4_crtc *vc4_crtc;
>  	int i;
>  
> @@ -160,6 +163,9 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>  		vc4_hvs_mask_underrun(dev, vc4_crtc->channel);
>  	}
>  
> +	if (vc4->hvs->hvs5)
> +		clk_set_min_rate(hvs->core_clk, 500000000);
> +
>  	drm_atomic_helper_wait_for_fences(dev, state, false);
>  
>  	drm_atomic_helper_wait_for_dependencies(state);
> @@ -182,6 +188,9 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>  
>  	drm_atomic_helper_commit_cleanup_done(state);
>  
> +	if (vc4->hvs->hvs5)
> +		clk_set_min_rate(hvs->core_clk, 0);
> +
>  	drm_atomic_state_put(state);
>  
>  	up(&vc4->async_modeset);
> 

This patch doesn't control the enable/disable of core_clk.
So, I think that it need to handle the clock as following:

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4ef88c0b51ab..355d67fd8beb 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -588,6 +588,12 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
                        dev_err(&pdev->dev, "Couldn't get core clock\n");
                        return PTR_ERR(hvs->core_clk);
                }
+
+               ret = clk_prepare_enable(hvs->core_clk);
+               if (ret) {
+                       dev_err(&pdev->dev, "Couldn't enable core clock\n");
+                       return ret;
+               }
        }
 
        if (!hvs->hvs5)
@@ -681,6 +687,8 @@ static void vc4_hvs_unbind(struct device *dev, struct device *master,
        drm_mm_takedown(&vc4->hvs->dlist_mm);
        drm_mm_takedown(&vc4->hvs->lbm_mm);
 
+       clk_prepare_enable(vc4->hvs->core_clk);
+
        vc4->hvs = NULL;
 }



-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
