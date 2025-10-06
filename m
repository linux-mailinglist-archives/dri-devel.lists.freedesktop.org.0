Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAB0BBDF25
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 14:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD2188C11;
	Mon,  6 Oct 2025 12:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJCPqW3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A951588C11
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 12:02:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Mnwi5006757
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 12:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DEIWohyV4TRe4//3qeB6UZeY
 hG+0MCT6jVtLZiAZjuw=; b=FJCPqW3Ma4T4Xny202WCSSSn3EU+uh23VWJBCeJV
 GzU1vmFYL2dJsPp5Plj7dpQ1zllyPFtXo+wGUMmybpU8WaUIBvh9osTVT1mL7r3M
 gcZUh141jzJxFzpCLygHwfPKhCYUvQIxPEZnMVWVhAsNdDe4cesdSImRt08KJN3J
 McoE0qbBv9LF/9pqwMF4uEbsqUyCArNK7U8drntVeh/CXO2LmXh5n7ehAJE0c7yR
 4/q0rw3/MPr6iubfY8v3EoZyO3xtEylij29Ik3zaOpTUYQvIcSM6YbGonso2qbpO
 XweGPqN1Bxs/+XRdC2r/wivd1widb0doQRRhfQOeiVwUpQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgku8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 12:02:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7810912fc31so4520131b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 05:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759752131; x=1760356931;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DEIWohyV4TRe4//3qeB6UZeYhG+0MCT6jVtLZiAZjuw=;
 b=UrTDstRXcS+TCIZbJrWGGE1kzpsgG64E78NRAg92zM4b0BG5LdOGi1XvM1QQCiPj7L
 B+FHgk58qqAEdsPmnB7Z6X1lUsJldvrQHBl5cVRXRU3ri4lvlRzpw9ZHfmsIHaiuv2bf
 nIbrhtUFgfp5Tb5BkzFW5xfu6UONcVpC2lmiCm8es3LLChjOVrVvVSCtwOoznLQi01yI
 lCbAtysgtGqyH7Q/wSYMcFbHeV9mCjE2KKP6Tt63X+70KvZmcSOqyaJItQu19BbSFevk
 Dlp2Y6w3SISKVT4h1pLJhcr5MximDGgprYWv94Etns+HaLSOKQaeviGQrAzl4bzOlakx
 pymw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8XXBws3nUPF1AczhGPyuflCMzL7b4d48BK7Jvfnt30Fw2UcQhB+mC540KTQUX0l8D6N0fBAwQJLA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjvqxXUktZcRd0AbNmVHFtQRtIgJTS3kSWyMCGxaKIMpmZWcHC
 stRGUeavaCcwJ2wAzs2zwPp7hJBDhYwU9N63oQU8qH7CGBu7Uuon1ua5k6s74k1YhqDA+sGipOj
 SgkKX9EMYC3fe27zgT2xMlnA4s9tBhWfcAk2oRAisDm4XSGXz1yzytVNsXZTXwtLinU6thrU=
X-Gm-Gg: ASbGncu+XJ78EN6aifl1vMdSpYysUmWCTn9j8aRvvrEQ+B5dOqisiUISsNz0bpaqCcM
 zOh72J2K6GSTjJjixrMCrz/2x7opwvF4x/1Eog5aywgMx5xDX2g5leN5JCdMF80NMpydmL49BSg
 /AYR/5zL1HgO9YOTs6IXRn6PbIpgBkbsqIdMhKwcF9nToGFcPF2A4g+2Rshcs4HjZdGET69WHqq
 YiZRWfR5/jOieneKzTQgLm76HqeFPLtebu2JlgIwNogLSdUMA6K+7QE5ZRZza5nwoe+RLGCps9i
 XRJa0koHbQvH9DJKQOGCBfWF+GqCAvMxK1p8dLHnlMUkkAz08Tkxz0JRuYKmhIpu9pNI5Pr4Nx8
 qWwc0QgYvuG9o/fp6m1U366P7hisS+FjAQmPFl/hoejjJFeZFyaqxXcf3vw==
X-Received: by 2002:a05:6a21:3086:b0:306:51fd:553e with SMTP id
 adf61e73a8af0-32b61e58357mr13767911637.18.1759752130954; 
 Mon, 06 Oct 2025 05:02:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnZ6Jftw4/I+2aJuBHfcBIzABFc5tCF963mt/Fx5kOV89uuJNQzyr0DGxxoXdMJk4kqaEwrA==
X-Received: by 2002:a05:6a21:3086:b0:306:51fd:553e with SMTP id
 adf61e73a8af0-32b61e58357mr13767850637.18.1759752130392; 
 Mon, 06 Oct 2025 05:02:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0112439csm4998490e87.18.2025.10.06.05.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 05:02:09 -0700 (PDT)
Date: Mon, 6 Oct 2025 15:02:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
 Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 2/5] drm/rockchip: dw_hdmi_qp: Improve error handling
 with dev_err_probe()
Message-ID: <gai5hfvu6xbbqpk4mu3i6nejolijeokjy3mkzca5xwzb4xwic7@jmee36svmwnb>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <20251005235542.1017-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005235542.1017-3-laurent.pinchart@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX26Fxgmh/mdFK
 It64JvsXiJdvnnSq+EvuEWrXHSEmQnmGAtgkPDSfc3QViI91tCMBKj6krb9YMVn/LrLrzTfGE5h
 jzxl7H/tcvfy/foX/6XvRBNybXIi2FFI+NH716EgekWFTpN54yMAQzCVv2XAhYhNvBCL/Z2RTQE
 dlnE7JMlIDAUm0EBoE/nPfozZQ4UoRIRfaULj1h55rO3vUND+EzCElmQz7fWHnIXzo5Sdyle4oD
 5n9ryYbEfEvaRxqYIgYtWevIb6ucDt97SvwlQ34QSAIFHM4qUA3586X2ZYWpkKa6cztfwRmr6OO
 Wol3l89ms/hX6j6JK1Zib1ktqviSQrFpzh//ZkZhFUsKXCcKsUCmdkso5eVZpgDWC7w2i461c7k
 wWNQwGhDdCikX9IBYGJCV7OWG6tBPA==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e3afc4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=QX4gbG5DAAAA:8 a=P1BnusSwAAAA:8 a=nUXw1gjoltVkaJc6RoAA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: fzpMn8E1O1VGBL8gmGDPzx_mSZPundkI
X-Proofpoint-ORIG-GUID: fzpMn8E1O1VGBL8gmGDPzx_mSZPundkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
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

On Mon, Oct 06, 2025 at 02:55:38AM +0300, Laurent Pinchart wrote:
> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> The error handling in dw_hdmi_qp_rockchip_bind() is quite inconsistent,
> i.e. in some cases the error code is not included in the message, while
> in some other cases there is no check for -EPROBE_DEFER.
> 
> Since this is part of the probe path, address the aforementioned issues
> by switching to dev_err_probe(), which also reduces the code a bit.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 62 +++++++------------
>  1 file changed, 24 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 7d531b6f4c09..4e7794aa2dde 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -457,10 +457,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  		return -ENODEV;
>  
>  	if (!cfg->ctrl_ops || !cfg->ctrl_ops->io_init ||
> -	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback) {
> -		dev_err(dev, "Missing platform ctrl ops\n");
> -		return -ENODEV;
> -	}
> +	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback)
> +		return dev_err_probe(dev, -ENODEV, "Missing platform ctrl ops\n");

This only makes sense for the purpose of unification.

>  
>  	hdmi->ctrl_ops = cfg->ctrl_ops;
>  	hdmi->dev = &pdev->dev;
> @@ -473,10 +471,9 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  			break;
>  		}
>  	}
> -	if (hdmi->port_id < 0) {
> -		dev_err(hdmi->dev, "Failed to match HDMI port ID\n");
> -		return hdmi->port_id;
> -	}
> +	if (hdmi->port_id < 0)
> +		return dev_err_probe(hdmi->dev, hdmi->port_id,
> +				     "Failed to match HDMI port ID\n");

The port_id can't become -EPROBE_DEFER, so it also unnecessary.

>  
>  	plat_data.phy_ops = cfg->phy_ops;
>  	plat_data.phy_data = hdmi;
> @@ -497,39 +494,30 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  
>  	hdmi->regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
>  						       "rockchip,grf");
> -	if (IS_ERR(hdmi->regmap)) {
> -		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
> -		return PTR_ERR(hdmi->regmap);
> -	}
> +	if (IS_ERR(hdmi->regmap))
> +		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->regmap),
> +				     "Unable to get rockchip,grf\n");
>  
>  	hdmi->vo_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
>  							  "rockchip,vo-grf");
> -	if (IS_ERR(hdmi->vo_regmap)) {
> -		dev_err(hdmi->dev, "Unable to get rockchip,vo-grf\n");
> -		return PTR_ERR(hdmi->vo_regmap);
> -	}
> +	if (IS_ERR(hdmi->vo_regmap))
> +		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->vo_regmap),
> +				     "Unable to get rockchip,vo-grf\n");
>  
>  	ret = devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
> -	if (ret < 0) {
> -		dev_err(hdmi->dev, "Failed to get clocks: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(hdmi->dev, ret, "Failed to get clocks\n");
>  
>  	hdmi->enable_gpio = devm_gpiod_get_optional(hdmi->dev, "enable",
>  						    GPIOD_OUT_HIGH);
> -	if (IS_ERR(hdmi->enable_gpio)) {
> -		ret = PTR_ERR(hdmi->enable_gpio);
> -		dev_err(hdmi->dev, "Failed to request enable GPIO: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(hdmi->enable_gpio))
> +		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->enable_gpio),
> +				     "Failed to request enable GPIO\n");
>  
>  	hdmi->phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> -	if (IS_ERR(hdmi->phy)) {
> -		ret = PTR_ERR(hdmi->phy);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(hdmi->dev, "failed to get phy: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(hdmi->phy))
> +		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->phy),
> +				     "Failed to get phy\n");
>  
>  	cfg->ctrl_ops->io_init(hdmi);
>  
> @@ -558,17 +546,15 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  
>  	hdmi->hdmi = dw_hdmi_qp_bind(pdev, encoder, &plat_data);
>  	if (IS_ERR(hdmi->hdmi)) {
> -		ret = PTR_ERR(hdmi->hdmi);
>  		drm_encoder_cleanup(encoder);
> -		return ret;
> +		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
> +				     "Failed to bind dw-hdmi-qp");
>  	}
>  
>  	connector = drm_bridge_connector_init(drm, encoder);

This one is also not supposed to return -EPROBE_DEFER.

> -	if (IS_ERR(connector)) {
> -		ret = PTR_ERR(connector);
> -		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(connector))
> +		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
> +				     "Failed to init bridge connector\n");
>  
>  	return drm_connector_attach_encoder(connector, encoder);
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
With best wishes
Dmitry
