Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC99CFDE9A
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 14:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3922B10E5C7;
	Wed,  7 Jan 2026 13:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kRsT0N4t";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6bbNPg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C22510E0FC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 13:24:14 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607CsSHg2239477
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 13:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OODq+MR881T26/qliKu8HGN0
 8XX/qGpYIY8dspOojVc=; b=kRsT0N4tRhM+q/cpN46briNUvgRqxmnvhawiDOYy
 qSSpdcC8Af/8LpartX+p/XK9SCKpI7TwW9YIxo6e++XytZu6HtkMJHs1IN7Vnem5
 hJWZZHDQD9jquahlBdrUJG8Qxo1ImbDOyEHF0xhmruLGM/2KolDHXaS38HVmFmyv
 YbDHEurizo0NnLOMgCcx8zMEQuXdZV8joRrdWGdhtoAI8OzzidKjdDmv/C+Yn62T
 lvtHXpNq3hQoB1ALxWartjl83joy6gHEauApS28TywjnAfeNewaZ83NnJqyh0MFl
 4KqXKYK4VEsYy9mhqhiQfPULfxu196C2JflNdBCSn3jBoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg02th-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 13:24:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed6ceab125so58007551cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 05:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767792253; x=1768397053;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OODq+MR881T26/qliKu8HGN08XX/qGpYIY8dspOojVc=;
 b=O6bbNPg+xkkMmlVfHKNNNnJrbh3YKzhcz/6HqnSIVEeh4HIvqb95RYrEPzeAf5P94M
 MY3hxiUriOXbobeL8x6/VoA3bdEazXiL7vh8BJmkZF6uCpL9T2GZuh0yAigHBd6wGclu
 FHsZw9GWYZfwgUQy2QMxJl8OmIzrv1uQfvKkhereTQs3CMqVbW3n1koz1IVFRF3t8K41
 jdvv2VmEGBwZkf6gqgbUWsBb6/CDpzHyBJSl/ucQIeO/eU10xTYLRk86ZJlho+1C4xub
 h5DpEP748j+D/Na6E0wyGKfVnOJwyOW72EfLUd4JFAZVXGGAeZRYeOatj5vX42KUxO7B
 Yn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767792253; x=1768397053;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OODq+MR881T26/qliKu8HGN08XX/qGpYIY8dspOojVc=;
 b=QtaXM9V3U10VSbW8uYmBfEMwOZAR/oX8C5a/0h9QvNAvAnJToUwlqGi6V+F/82TLMN
 jR/CpB3hszKmt+dglFQphcUszFNi3VL8sRXQl0Bp4FJvB8tmt0y73EiYOJel/vPIkQoA
 cVx94AHufGQTBT99y+/GP6UgKWSv1ibMwtNslklryesE0aRGSP5bmQchgPJXBPI5z+pG
 UBmmHk3S7qJR3/abWIHsbPGg/oifHQbgXTTVfzICoLLbHKuzpz8/AxRSSIerNfU2dn9A
 +tsCpwneA8b0KbN7wqPluRdgEKCuXx/6h4cQ4qPL+HN1zCU6D+jYW0PN9+eFM3eKShKX
 xuTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyHDZfvVJ11ApjLvPLC6GLqn+bERMA+iPEZNBWGA71U31bBqOnYEpESjIcSQ331ol+ZGxzzC1TRC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZuO/a+NZh3vzqMrFPIgNVlk7/AZKSDWDahubTLtOpUKmE0VpS
 Hfvlzk4FLRXPkDkOHvsSCzdd5c38cKt0SdOe0rwv3pk+oWUhlMOGjvscHBSgL/3GkPABfDUpw9H
 9TEuLPnaBrmtmqoGWSNrcBpW2G0DZ253jsxTl6KIKZzLtwXmNrw1PxOezxZfWlh82SLpKuTY=
X-Gm-Gg: AY/fxX5uRYKbQ6IxZKPll4QNpJdXOuvMsjW7khNY4sitdvSnYtsm3oAE6VFD4r++vgW
 oJy2vzYZ2lpAeP/muulJ9HLiOo4n8EptUxMUJwBEcwkB1r14EEMTMPvYMvRXU+rMpC7EVvZOhfQ
 6bznLR3eZMEMjA4tG42zyn1XdoyFKvVJhBy2JfaJmjbLr4L6sFq4ESSVWQ8+2JB2GZBU/5rlI9U
 APLHvBFeQdPvg1I8/2QJl020MOdMOdx2qu24mRq9kuKOEIMnhm/puPV7m3S2HA5FEHFXX2wjvPI
 pQ1J+KGPhUa8MPL0mzLH/fzaQ6fevWNAOjY5c3tm8hGMd1PHX5tcSgZKoxw/dGMLnuRacKnnWit
 GG4/fWVQl3iwG+mFK9rQcTDc2/N/zUbiIHZj/Qlyrg6XV9AO13iOmSu2eOFR4Z6JSsbSfJtwcvO
 X+oo8IDJymMm4lypyFbphiaBI=
X-Received: by 2002:ac8:7d12:0:b0:4f1:e8d7:fda6 with SMTP id
 d75a77b69052e-4ffb47d604emr30428091cf.8.1767792253399; 
 Wed, 07 Jan 2026 05:24:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhoicICXGJbzLdJX6o6M8e2x863fcTO+PIAkHa0P/xplCxJo1nU/u+fKVyXirHLAmKyt4FYg==
X-Received: by 2002:ac8:7d12:0:b0:4f1:e8d7:fda6 with SMTP id
 d75a77b69052e-4ffb47d604emr30427651cf.8.1767792252778; 
 Wed, 07 Jan 2026 05:24:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b69db36casm1064352e87.86.2026.01.07.05.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 05:24:12 -0800 (PST)
Date: Wed, 7 Jan 2026 15:24:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Yakovlev <vovchkir@gmail.com>
Cc: luca.ceresoli@bootlin.com, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, andrzej.hajda@intel.com,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: Re: [PATCH] drm/bridge: lontium-lt9611uxc: change to use
 devm_request_threaded_irq
Message-ID: <4piczs6rrmpm6ga3vuo5fz32fkogjaemqlxstsqgzs7hn4ikwy@zhyfcpemkuek>
References: <20260107030700.326843-1-vovchkir@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107030700.326843-1-vovchkir@gmail.com>
X-Proofpoint-GUID: Ox0f5Biv4Wpqp8Ioys_WIVgwdB4DxZqz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwMiBTYWx0ZWRfX0a1eQQo8tBny
 4ENCggrEIBjAdBM+FoptsT6QXBgAECGCxJCxsaKw5VFa5jEkNhCnkEcc1X5gIBEj0oiUwEN4YAZ
 AXfvQeDQ0HPSchXy60R/WiqeAIVqof73nhFfwzpzR46qptZjrFrCXnr8oYAbBgFqrDTnpRAL/tE
 CJtblujAnofgLb05neEGs/v90LCTaGuNsOxViZqcduAPcsqAf7C7xLoEhCZHH6EpOZxNttG9+F2
 bc5nQgiOTKqaB0rWMYtlX8I6fOI2htWFFoay8LSGm14acU0BYKTOjO+2ZzxcxvxLuzWBH9BKYWa
 B9CA8+otsfb9eDLK3yjMuenJSVSLZOD7juGjtDDYDMyF/WFJAhVQiPqhx1wawbrisH4KZ9gzLEG
 K0evoqj49Cxl9vMoEFRuAPQH4RoOSVGaG2MD+GkCHICI5FuJ2G692qBhi25LHuy9U7fRuoJpcIu
 w6RhHm6QrRqVGo1cmnA==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695e5e7e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=QMR95be3rX-PDGzRVDUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Ox0f5Biv4Wpqp8Ioys_WIVgwdB4DxZqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070102
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

On Wed, Jan 07, 2026 at 06:07:00AM +0300, Vladimir Yakovlev wrote:
> It's better to use devm_request_threaded_irq because resources will be
> freed automatically and no additional checks are needed.
> 
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 3868ad05e011..bb5cff021c93 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -851,9 +851,9 @@ static int lt9611uxc_probe(struct i2c_client *client)
>  	init_waitqueue_head(&lt9611uxc->wq);
>  	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
>  
> -	ret = request_threaded_irq(client->irq, NULL,
> -				   lt9611uxc_irq_thread_handler,
> -				   IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					lt9611uxc_irq_thread_handler,
> +					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);

This makes interrupt being registered until the _end_ of the
lt9611uxc_remove() (or lt9611uxc_probe() in case of probe error). Are
you sure that the code can cope with the stray IRQs being delivered
during or right after lt9611uxc_remove()?

>  	if (ret) {
>  		dev_err(dev, "failed to request irq\n");
>  		goto err_disable_regulators;
> @@ -892,7 +892,6 @@ static int lt9611uxc_probe(struct i2c_client *client)
>  	return 0;
>  
>  err_remove_bridge:
> -	free_irq(client->irq, lt9611uxc);
>  	cancel_work_sync(&lt9611uxc->work);
>  	drm_bridge_remove(&lt9611uxc->bridge);
>  
> @@ -910,7 +909,6 @@ static void lt9611uxc_remove(struct i2c_client *client)
>  {
>  	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
>  
> -	free_irq(client->irq, lt9611uxc);
>  	cancel_work_sync(&lt9611uxc->work);
>  	lt9611uxc_audio_exit(lt9611uxc);
>  	drm_bridge_remove(&lt9611uxc->bridge);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
