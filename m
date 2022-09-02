Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 174EE5AA7BC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 08:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCBD10E75D;
	Fri,  2 Sep 2022 06:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AB410E753
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 06:06:35 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id k22so1244393ljg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 23:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date; bh=aSUPk7xnJRnPZFtFZgnCdhzsjxOJIfTgGJR8QUiNJRM=;
 b=pUwMQLH1H/5LrZu5x6M+LkcjEzqOhZ6KdsN7YJXqdOJCHNPiHUYu+iioRkG0e2qsPb
 IsmX7jEhnf7bHg2nLk9sVRExHQoBR9JiyHvfoSuuzl+Ct2jCVAQ2dfJRJ+4PZGObRRWQ
 UiCRPzGUbBKfE7rO7HZ2VDZef8TFxzbI5tvmi1jtO9PW7/D7V0OfHkhgohFwz97tuQ6+
 28+GxJJBuSGi+iMYBfb4PMfqpDWl9DISWbe5Ol0eoEqlsDiDW/3N/CpxbTb5D7FGpObu
 cgASyeWQ8Ry6A5nw19+0mUAfbfwSK1FGn2CFAznILyLPRAZxJORaFViPF5m9r1ePp+Nd
 2V6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=aSUPk7xnJRnPZFtFZgnCdhzsjxOJIfTgGJR8QUiNJRM=;
 b=VnWf5o6wRfqqLYPcUUIiEiPIfJQ++XX/c8PsBMhUXCijRkD/S6t54ltazqR2r4i8wl
 K0AdrNZx+pm9DTLho2zyOVYkAJAMLqWyKVCcjnbuz70X/QHrZCWNw+ffxuFkUzBGb5Qf
 IBA+a0w5M/OH9xyAXu6rzKELhhYfRyOO6EgLomdxIj3Q2jL0xW2UrxKIi6rMyD95INHq
 OItlnRlVe+TX5G0w5lMEIuH8S61lnexVqMA0vLY0aTFYsBbsvaoLUi5ZF1L4PP1Sj3f6
 IUBeiWnITRFJYGUhZgtiDZoSylovs4tMoHxfddhGHsUta3KpH/PklaPkjWtluYi+bcza
 xrDQ==
X-Gm-Message-State: ACgBeo3woZ+CSVbMqj8j6EUjZDpqt2x5yOc53STF/Wj0HnGyc0FAD1tD
 LywCxCuGmQLbgFiQytXadtLbYvTpj9t+aA==
X-Google-Smtp-Source: AA6agR6QRbXgRlZvVeUm6D6oqa3ykV6LJb3UiVOoChs1UJZlEhrgk1vISDxupgYb6KwIlUxxLBgBOg==
X-Received: by 2002:a2e:824c:0:b0:25f:de27:f013 with SMTP id
 j12-20020a2e824c000000b0025fde27f013mr10280595ljh.447.1662098793834; 
 Thu, 01 Sep 2022 23:06:33 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.228.19]) by smtp.gmail.com with ESMTPSA id
 u9-20020ac258c9000000b0048b064707ebsm138367lfo.103.2022.09.01.23.06.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Sep 2022 23:06:33 -0700 (PDT)
Date: Fri, 02 Sep 2022 09:06:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_3/4=5D_drm/msm/mdp4=3A_move_re?=
 =?US-ASCII?Q?source_allocation_to_the_=5Fprobe_function?=
User-Agent: K-9 Mail for Android
In-Reply-To: <014fc43f-bee6-88eb-9d3c-69aed2fcd7c6@quicinc.com>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-4-dmitry.baryshkov@linaro.org>
 <014fc43f-bee6-88eb-9d3c-69aed2fcd7c6@quicinc.com>
Message-ID: <7D8A3C28-85A1-4737-B6ED-EACBF488FF70@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2 September 2022 03:24:17 GMT+03:00, Abhinav Kumar <quic_abhinavk@quici=
nc=2Ecom> wrote:
>
>
>On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
>> To let the probe function bail early if any of the resources is
>> unavailable, move resource allocattion from kms_init directly to the
>> probe callback=2E While we are at it, replace irq_of_parse_and_map() wi=
th
>> platform_get_irq()=2E
>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms=2Ec | 107 +++++++++++---------=
---
>>   1 file changed, 51 insertions(+), 56 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms=2Ec b/drivers/gpu/d=
rm/msm/disp/mdp4/mdp4_kms=2Ec
>> index 41dc60784847=2E=2E6499713eccf6 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms=2Ec
>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms=2Ec
>> @@ -139,8 +139,6 @@ static void mdp4_destroy(struct msm_kms *kms)
>>   		pm_runtime_disable(dev);
>>     	mdp_kms_destroy(&mdp4_kms->base);
>> -
>> -	kfree(mdp4_kms);
>>   }
>>     static const struct mdp_kms_funcs kms_funcs =3D {
>> @@ -383,57 +381,27 @@ static int mdp4_kms_init(struct drm_device *dev)
>>   {
>>   	struct platform_device *pdev =3D to_platform_device(dev->dev);
>>   	struct msm_drm_private *priv =3D dev->dev_private;
>> -	struct mdp4_kms *mdp4_kms;
>> +	struct mdp4_kms *mdp4_kms =3D to_mdp4_kms(to_mdp_kms(priv->kms));
>>   	struct msm_kms *kms =3D NULL;
>>   	struct iommu_domain *iommu;
>>   	struct msm_gem_address_space *aspace;
>> -	int irq, ret;
>> +	int ret;
>>   	u32 major, minor;
>>   	unsigned long max_clk;
>>     	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
>>   	max_clk =3D 266667000;
>>   -	mdp4_kms =3D kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
>> -	if (!mdp4_kms) {
>> -		DRM_DEV_ERROR(dev->dev, "failed to allocate kms\n");
>> -		return -ENOMEM;
>> -	}
>> -
>>   	ret =3D mdp_kms_init(&mdp4_kms->base, &kms_funcs);
>>   	if (ret) {
>>   		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
>>   		goto fail;
>>   	}
>>   -	priv->kms =3D &mdp4_kms->base=2Ebase;
>>   	kms =3D priv->kms;
>>     	mdp4_kms->dev =3D dev;
>>   -	mdp4_kms->mmio =3D msm_ioremap(pdev, NULL);
>> -	if (IS_ERR(mdp4_kms->mmio)) {
>> -		ret =3D PTR_ERR(mdp4_kms->mmio);
>> -		goto fail;
>> -	}
>> -
>> -	irq =3D platform_get_irq(pdev, 0);
>> -	if (irq < 0) {
>> -		ret =3D irq;
>> -		DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
>> -		goto fail;
>> -	}
>> -
>> -	kms->irq =3D irq;
>> -
>> -	/* NOTE: driver for this regulator still missing upstream=2E=2E use
>> -	 * _get_exclusive() and ignore the error if it does not exist
>> -	 * (and hope that the bootloader left it on for us)
>> -	 */
>> -	mdp4_kms->vdd =3D devm_regulator_get_exclusive(&pdev->dev, "vdd");
>> -	if (IS_ERR(mdp4_kms->vdd))
>> -		mdp4_kms->vdd =3D NULL;
>> -
>>   	if (mdp4_kms->vdd) {
>>   		ret =3D regulator_enable(mdp4_kms->vdd);
>>   		if (ret) {
>> @@ -442,24 +410,6 @@ static int mdp4_kms_init(struct drm_device *dev)
>>   		}
>>   	}
>>   -	mdp4_kms->clk =3D devm_clk_get(&pdev->dev, "core_clk");
>> -	if (IS_ERR(mdp4_kms->clk)) {
>> -		DRM_DEV_ERROR(dev->dev, "failed to get core_clk\n");
>> -		ret =3D PTR_ERR(mdp4_kms->clk);
>> -		goto fail;
>> -	}
>> -
>> -	mdp4_kms->pclk =3D devm_clk_get(&pdev->dev, "iface_clk");
>> -	if (IS_ERR(mdp4_kms->pclk))
>> -		mdp4_kms->pclk =3D NULL;
>> -
>> -	mdp4_kms->axi_clk =3D devm_clk_get(&pdev->dev, "bus_clk");
>> -	if (IS_ERR(mdp4_kms->axi_clk)) {
>> -		DRM_DEV_ERROR(dev->dev, "failed to get axi_clk\n");
>> -		ret =3D PTR_ERR(mdp4_kms->axi_clk);
>> -		goto fail;
>> -	}
>> -
>>   	clk_set_rate(mdp4_kms->clk, max_clk);
>>     	read_mdp_hw_revision(mdp4_kms, &major, &minor);
>> @@ -474,10 +424,9 @@ static int mdp4_kms_init(struct drm_device *dev)
>>   	mdp4_kms->rev =3D minor;
>>     	if (mdp4_kms->rev >=3D 2) {
>> -		mdp4_kms->lut_clk =3D devm_clk_get(&pdev->dev, "lut_clk");
>> -		if (IS_ERR(mdp4_kms->lut_clk)) {
>> +		if (!mdp4_kms->lut_clk) {
>>   			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
>> -			ret =3D PTR_ERR(mdp4_kms->lut_clk);
>> +			ret =3D -ENODEV;
>>   			goto fail;
>>   		}
>>   		clk_set_rate(mdp4_kms->lut_clk, max_clk);
>> @@ -560,7 +509,53 @@ static const struct dev_pm_ops mdp4_pm_ops =3D {
>>     static int mdp4_probe(struct platform_device *pdev)
>>   {
>> -	return msm_drv_probe(&pdev->dev, mdp4_kms_init, NULL);
>> +	struct device *dev =3D &pdev->dev;
>> +	struct mdp4_kms *mdp4_kms;
>> +	int irq;
>> +
>> +	mdp4_kms =3D devm_kzalloc(dev, sizeof(*mdp4_kms), GFP_KERNEL);
>> +	if (!mdp4_kms)
>> +		return dev_err_probe(dev, -ENOMEM, "failed to allocate kms\n");
>> +
>> +	mdp4_kms->mmio =3D msm_ioremap(pdev, NULL);
>> +	if (IS_ERR(mdp4_kms->mmio))
>> +		return PTR_ERR(mdp4_kms->mmio);
>> +
>> +	irq =3D platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return dev_err_probe(dev, irq, "failed to get irq\n");
>> +
>> +	mdp4_kms->base=2Ebase=2Eirq =3D irq;
>> +
>> +	/* NOTE: driver for this regulator still missing upstream=2E=2E use
>> +	 * _get_exclusive() and ignore the error if it does not exist
>> +	 * (and hope that the bootloader left it on for us)
>> +	 */
>> +	mdp4_kms->vdd =3D devm_regulator_get_exclusive(&pdev->dev, "vdd");
>> +	if (IS_ERR(mdp4_kms->vdd))
>> +		mdp4_kms->vdd =3D NULL;
>> +
>> +	mdp4_kms->clk =3D devm_clk_get(&pdev->dev, "core_clk");
>> +	if (IS_ERR(mdp4_kms->clk))
>> +		return dev_err_probe(dev, PTR_ERR(mdp4_kms->clk), "failed to get cor=
e_clk\n");
>> +
>> +	mdp4_kms->pclk =3D devm_clk_get(&pdev->dev, "iface_clk");
>> +	if (IS_ERR(mdp4_kms->pclk))
>> +		mdp4_kms->pclk =3D NULL;
>> +
>> +	mdp4_kms->axi_clk =3D devm_clk_get(&pdev->dev, "bus_clk");
>> +	if (IS_ERR(mdp4_kms->axi_clk))
>> +		return dev_err_probe(dev, PTR_ERR(mdp4_kms->axi_clk), "failed to get=
 axi_clk\n");
>> +
>> +	/*
>> +	 * This is required for revn >=3D 2=2E Handle errors here and let the=
 kms
>> +	 * init bail out if the clock is not provided=2E
>> +	 */
>> +	mdp4_kms->lut_clk =3D devm_clk_get_optional(&pdev->dev, "lut_clk");
>> +	if (IS_ERR(mdp4_kms->lut_clk))
>> +		return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get=
 lut_clk\n");
>
>I can see that you have moved this from init to probe and only rev >=3D2 =
needs it=2E
>
>But, your check here will end up returning from probe because you have a =
return=2E So I guess you means just having dev_err_probe without the return=
 and let the init fail if the clk is not found because we have the hw_rev o=
nly in init=2E

No=2E The function called here is the devm_clk_get_optional()=2E So the dr=
iver will get NULL if the clock is not present in the DT and an error only =
in an error case (e=2Eg=2E EINVAL, EPROBE_DEFER)=2E

Later on the mdp4_kms_init() will check hw_rev and return -ENODEV if the c=
lock is required, but is set to NULL (not present in DT)=2E


>
>> +
>> +	return msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base=2Ebas=
e);
>>   }
>>     static int mdp4_remove(struct platform_device *pdev)

--=20
With best wishes
Dmitry
