Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E06205AA790
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 08:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB0A10E749;
	Fri,  2 Sep 2022 06:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA4210E749
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 06:03:06 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bq23so1809299lfb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 23:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date; bh=ffvbLl1jFsmA7m/s4nl7FyHc0hFH1L5jLxXME/aPLu4=;
 b=ZJoMUA0CzdUCYA4eJRyo7DLyyhB/Fsx8fQ/GFLCh3ehKhSFwb/l1+9+I/EHCI+Cvld
 MJC6IuSNfQDxJ99OsIpA30LS8c+Lcxw8jSJCfrt9ptEKsRMfUZK5U1lv+Tjz7vG6b5WE
 QwqDKqiWwAF+SY64GT9dbsqM3favzq0dY/2r/OfYAE7MNQ+jiOS/+rL3xTTiG04xjAQQ
 LzjVd26yukIxs6G/z6BHddJkQ2KTB2G/17iWSxrRYUV/7f1v50FKCeIv1pBzgN88lTaC
 ytZ+0ViLmyLQ8kM2bg6lSHa+IzL4+KIBVZls/jEX6WZMY2zstIbGAtnmFUDFoNkGLoHu
 3TdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=ffvbLl1jFsmA7m/s4nl7FyHc0hFH1L5jLxXME/aPLu4=;
 b=rrN2MzdYGkERMMVG63th6EVVZJ+falsa6KOhEBvtCjPNncGlwG64SsCzEybZ56k7Wr
 tBeP0XFqJskmGc9vYtLPqsD+4XAjYRkWS00Mbp5gkmZM/SS7ZCsY4NjL0q2Foeczqq51
 WmJkllBd/sU2S9+A6P8e8dIjqd/EuZoQjgTsb8nXyj3hxEVIGjV4sskcz8X/xnYJAoRx
 Iur6Kep3VSsGaW/+9zwBcc8Rno8kYPlp+Hl0YqUEju7Vm4Opgc/g8bbNZM4ck++ehNyz
 7YwDEcguNwQ4XdBgXxVq0xTF2VP28tPzwfgsrF6qG1mpNAKedZokAiTVLUirEvwcn4/v
 WB9A==
X-Gm-Message-State: ACgBeo0Y9jXSabSDsDOKu+fhlrEXeueMApLeifEej2sgqpRKlylaquYU
 HMou4dEdxwUeVgmmS0feenIAGgZ6vbA2VQ==
X-Google-Smtp-Source: AA6agR6NPHOKfoGhpIWRmH8tuIUycivkQLTgGb6ER/1vjV/cqczRuQqHyi2K0W/l4IGo+q5iOOo0HA==
X-Received: by 2002:a05:6512:2248:b0:48a:f8f9:3745 with SMTP id
 i8-20020a056512224800b0048af8f93745mr10821431lfu.256.1662098584229; 
 Thu, 01 Sep 2022 23:03:04 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.228.19]) by smtp.gmail.com with ESMTPSA id
 g9-20020a19ac09000000b004949761d330sm135634lfc.128.2022.09.01.23.03.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Sep 2022 23:03:03 -0700 (PDT)
Date: Fri, 02 Sep 2022 09:01:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_2/4=5D_drm/msm/dpu=3A_move_re?=
 =?US-ASCII?Q?source_allocation_to_the_=5Fprobe_function?=
User-Agent: K-9 Mail for Android
In-Reply-To: <9627ff41-6bd8-e380-0e8e-438aecdb824f@quicinc.com>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-3-dmitry.baryshkov@linaro.org>
 <9627ff41-6bd8-e380-0e8e-438aecdb824f@quicinc.com>
Message-ID: <24DFFDD8-955B-459B-B9C7-06BFAB32F817@linaro.org>
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



On 2 September 2022 00:37:30 GMT+03:00, Abhinav Kumar <quic_abhinavk@quici=
nc=2Ecom> wrote:
>
>
>On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
>> To let the probe function bail early if any of the resources is
>> unavailable, move resource allocattion from kms_init directly to the
> allocation

Ack

>> probe callback=2E While we are at it, replace irq_of_parse_and_map() wi=
th
>> platform_get_irq()=2E
>Any specific reason to replace this?

Yes=2E To use generic API rather than the OF-specific unusual function=2E

>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>
>With those two addressed,
>
>Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc=2Ecom>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec | 62 +++++++++++++---------=
---
>>   1 file changed, 32 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_kms=2Ec
>> index ae13a3a5d8a5=2E=2E756be04d804b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms=2Ec
>> @@ -1206,31 +1206,13 @@ static int dpu_kms_init(struct drm_device *ddev=
)
>>   	struct device *dev =3D ddev->dev;
>>   	struct platform_device *pdev =3D to_platform_device(dev);
>>   	struct dpu_kms *dpu_kms;
>> -	int irq;
>>   	struct dev_pm_opp *opp;
>>   	int ret =3D 0;
>>   	unsigned long max_freq =3D ULONG_MAX;
>>   -	dpu_kms =3D devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>> +	dpu_kms =3D to_dpu_kms(priv->kms);
>>   	if (!dpu_kms)
>> -		return -ENOMEM;
>> -
>> -	ret =3D devm_pm_opp_set_clkname(dev, "core");
>> -	if (ret)
>> -		return ret;
>> -	/* OPP table is optional */
>> -	ret =3D devm_pm_opp_of_add_table(dev);
>> -	if (ret && ret !=3D -ENODEV) {
>> -		dev_err(dev, "invalid OPP table in device tree\n");
>> -		return ret;
>> -	}
>> -
>> -	ret =3D devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
>> -	if (ret < 0) {
>> -		DPU_ERROR("failed to parse clocks, ret=3D%d\n", ret);
>> -		return ret;
>> -	}
>> -	dpu_kms->num_clocks =3D ret;
>> +		return -EINVAL;
>>     	opp =3D dev_pm_opp_find_freq_floor(dev, &max_freq);
>>   	if (!IS_ERR(opp))
>> @@ -1249,21 +1231,41 @@ static int dpu_kms_init(struct drm_device *ddev=
)
>>   	pm_runtime_enable(&pdev->dev);
>>   	dpu_kms->rpm_enabled =3D true;
>>   -	priv->kms =3D &dpu_kms->base;
>> -
>> -	irq =3D irq_of_parse_and_map(dpu_kms->pdev->dev=2Eof_node, 0);
>> -	if (!irq) {
>> -		DPU_ERROR("failed to get irq\n");
>> -		return -EINVAL;
>> -	}
>> -	dpu_kms->base=2Eirq =3D irq;
>> -
>>   	return 0;
>>   }
>>     static int dpu_dev_probe(struct platform_device *pdev)
>>   {
>> -	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
>> +	struct device *dev =3D &pdev->dev;
>> +	struct dpu_kms *dpu_kms;
>> +	int irq;
>> +	int ret =3D 0;
>> +
>> +	dpu_kms =3D devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
>> +	if (!dpu_kms)
>> +		return -ENOMEM;
>> +
>> +	ret =3D devm_pm_opp_set_clkname(dev, "core");
>> +	if (ret)
>> +		return ret;
>> +	/* OPP table is optional */
>> +	ret =3D devm_pm_opp_of_add_table(dev);
>> +	if (ret && ret !=3D -ENODEV)
>> +		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n")=
;
>> +
>> +	ret =3D devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "failed to parse clocks\n");
>> +
>> +	dpu_kms->num_clocks =3D ret;
>> +
>> +	irq =3D platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return dev_err_probe(dev, irq, "failed to get irq\n");
>> +
>> +	dpu_kms->base=2Eirq =3D irq;
>> +
>> +	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
>>   }
>>     static int dpu_dev_remove(struct platform_device *pdev)

--=20
With best wishes
Dmitry
