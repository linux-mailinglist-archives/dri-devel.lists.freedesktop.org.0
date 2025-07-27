Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A673CB130B1
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDEF10E16A;
	Sun, 27 Jul 2025 16:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHsn4DjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C1F10E16A
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:38:17 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RCG8k5001076
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8CPqWy085vO5YMl3J65GS5HS
 Q4F1909nZKI8lDdr2tU=; b=jHsn4DjWuxDfu0b9/M6Bv+x/MbgkKnNhwclXEBy0
 rFcnwZqlB0JbpAFh95IpmeDioV7wnjBh/mflwYb93hgp2V+YfFUunNIjKc2jzhrN
 Sf1u0ePk1VNFCxNXRhLVaZVExziYAGI+sPVZtO39U+dB3Y6R2vjl3r0KNkdxiYNT
 7iGGp1ByVTjbe+zcG+O9EgcXXup50X8qh7jdQgPaQG4HeY4UwivfsB4yagnStAp+
 xuy4DNhB7MTnRJ3fsF9nuQV4J/ldz7NAP0kXNy74Qz91dQg0fr4uzabrg/MCbSLx
 DK8CEJx72l4YFt6GmEicNDT+0JS6nNhEABQST6vEXroM5w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484racja44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:38:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-7073140087aso19820256d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 09:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753634295; x=1754239095;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CPqWy085vO5YMl3J65GS5HSQ4F1909nZKI8lDdr2tU=;
 b=XQPjOrNY2OEOM+xNUR6P6FyBRWAh3OQ9HeHnSxtfx4ZeMUeRsPcNOGl1hoIQq+X+Lc
 cQjcq70JV4GnpUn2vTt3RiVFD73ezQ1hAnxP4gmw38w0zoPKtVMviWc2hx6gNSMwGQ9Q
 t/I+yRRwOlZXExwG0dA1kAY3bYyNyKr5tcWa9pRxf0veaYtYAfBtii8mgC4kkKjcwnG7
 hatl46ukjcjofTCbD+QYstOFHrap/nm/QwSPQK06tgnj9odRrTAzxt6d7UByI8lH5cTa
 Kzn8N8QWs/a1gTA6jsqa+tFC4dzLRAXg6c/GCRG2eCwAGGutQA7NjJexOVD9pGeXwWA6
 467Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5pbUwuSSwoZPQHKtf+Ml7kj2zyFwLFPrqRAmJgwM6Qit6po21bdK3k3HEUlm0SOz0E3//bgu+D74=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwozdPDU35iOYBfyNWVyVqibJDmemFumjWKqw2yZE2OcYVJcUiq
 0f8wo+WGbTGgsGjlNAVBMsuW9oEzoEyhgDXPzin+YhbzeoudVu0qdsJES6pb8rbdgOcWhQsgMc4
 uoF1Im3TQjRGWx0dsUKKlvZZEbEgefXsKJ0vUfyyYcmw4/KTDW3aavPuZDSZsbvV6wAB3he5Gqv
 Ll6co=
X-Gm-Gg: ASbGncvcVoNR86DkQ97bZZUIMlm+iOBcavc0W1CaYnN/gB2YLX1EffY6/tL3HPYbomW
 gWK0MMrnld6LvEXJtfUjpp/+ukClMSlKO5ZPnVTxyiGqBwtddkM+FFe+KjoAQi8Wb9sMgveEyM2
 Rd4Jn/ByUWSYm8eBnzlV4ajjoYK13Nz63a51ucYAyzeQL6wbDP2r7/LANc/ofHRT/8L24wcp69U
 UjM13F9XWUcc0EZFbFssK36n45fmRL1+ddiFQMQUduQsbF2dD27x1O+AY/BAF/8AMXbvBoLNElo
 eqLWRd8gh2rzVYA7Di2ChNS6CTm5ksvFqnZ2YYEGCi0I9SgMtlLe1Rr7ZzznEWB7V00D4Ae0Eok
 8FEVG2hK90/f+78klG5ROwixNwRJY0mVCqD4h8kq1WaW9xFQOq175
X-Received: by 2002:a05:6214:2688:b0:6fa:8c15:75c1 with SMTP id
 6a1803df08f44-7072051a1f7mr122236626d6.2.1753634295507; 
 Sun, 27 Jul 2025 09:38:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfTJn1vhErN8vQII0dL2PBrMXA9vXoTP4b+ejzxx/zw0K1BvXLsKAiCyK3uSGd5H4OalWKoQ==
X-Received: by 2002:a05:6214:2688:b0:6fa:8c15:75c1 with SMTP id
 6a1803df08f44-7072051a1f7mr122236246d6.2.1753634294947; 
 Sun, 27 Jul 2025 09:38:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f427e0a2sm8710101fa.83.2025.07.27.09.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 09:38:14 -0700 (PDT)
Date: Sun, 27 Jul 2025 19:38:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henrik Grimler <henrik@grimler.se>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/bridge: sii9234: use dev_err_probe where
 applicable
Message-ID: <opsrp4mlhwzoldthsna5wx32b755wl3uxrbqvocvnl5ssduf3k@76a7fycatbho>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-2-faee244f1d40@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-exynos4-sii9234-driver-v2-2-faee244f1d40@grimler.se>
X-Authority-Analysis: v=2.4 cv=WqsrMcfv c=1 sm=1 tr=0 ts=688655f9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EIN_TQxVNm9RAPmfLKYA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: wWJ57Fz51riShfUQTzzbEz6f7k0QH0zb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NiBTYWx0ZWRfX7ftWFZjYCbx7
 ndow1IOjtDHa6R0RVbgatum2A7HXRqwTBFNoyN+f9OHFwc/A3xbsKnl/qy7zW1AIFaCoFYWG5ef
 NxCOQCVBuJgVawpNe48YXzpnPi2oZ7JAcJ8XTyIhWec01qAnfSgCuu/h21+MReQXQD+wW8vWInR
 6ETk9KMnHZu6am4fWsRlHpz/IkSqdk4K2nvYVmuQ5MuRIbNQ6zUuLsDrO4iW2f69/yWOodylPs0
 rgXXrpXf++yEbCQaLRGYsoSVTmIoMc978/R7Td89mLdrhedQMnIvy8cvxO/ohAKQKPoYi/yE1t8
 qFMpFEyB/z7dEnhUtSCjQ0NJ+6IyghBDdt1r1VsHN3XVCD9dEnrPK3BRcx8/0VIR/XWN8IiYkpX
 M1T37XlCQh4NdxJhTKlLlqVKXm3lGytSGxV3a5gllryp2UmszwMXCletptjxCUfMhcY0U8J8
X-Proofpoint-ORIG-GUID: wWJ57Fz51riShfUQTzzbEz6f7k0QH0zb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270146
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

On Thu, Jul 24, 2025 at 08:50:52PM +0200, Henrik Grimler wrote:
> In case of error during resource acquisition the driver should print
> an error message only if it is not deferred probe. Use dev_err_probe
> helper to handle this, which will also record defer probe reason for
> debugging.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> v2: no changes
> ---
>  drivers/gpu/drm/bridge/sii9234.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index 930117bbba87285e62107389606897740516eb0a..0e0bb1bf71fdcef788715cfd6fa158a6992def33 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -825,10 +825,9 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>  	}
>  
>  	ctx->gpio_reset = devm_gpiod_get(ctx->dev, "reset", GPIOD_OUT_LOW);
> -	if (IS_ERR(ctx->gpio_reset)) {
> -		dev_err(ctx->dev, "failed to get reset gpio from DT\n");
> -		return PTR_ERR(ctx->gpio_reset);
> -	}
> +	if (IS_ERR(ctx->gpio_reset))
> +		return dev_err_probe(ctx->dev, PTR_ERR(ctx->gpio_reset),
> +				     "failed to get reset gpio from DT\n");
>  
>  	ctx->supplies[0].supply = "avcc12";
>  	ctx->supplies[1].supply = "avcc33";
> @@ -836,9 +835,7 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>  	ctx->supplies[3].supply = "cvcc12";
>  	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
>  	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(ctx->dev, "regulator_bulk failed\n");
> -		return ret;
> +		dev_err_probe(ctx->dev, ret, "regulator_bulk failed\n");

Drop the braces, use 'return dev_err_probe(...)'

>  	}
>  
>  	ctx->client[I2C_MHL] = client;
> @@ -911,10 +908,9 @@ static int sii9234_probe(struct i2c_client *client)
>  					sii9234_irq_thread,
>  					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>  					"sii9234", ctx);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to install IRQ handler\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "failed to install IRQ handler\n");
>  
>  	ret = sii9234_init_resources(ctx, client);
>  	if (ret < 0)
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
