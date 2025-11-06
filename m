Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E6C398A3
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 09:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD3E10E82C;
	Thu,  6 Nov 2025 08:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRIG0v0x";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlP5z+DT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E99510E82C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 08:15:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A66MlVq1737483
 for <dri-devel@lists.freedesktop.org>; Thu, 6 Nov 2025 08:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=E2nTnkeSWlK4jeMAATj6ukfy
 ZvRvO60TtToxYqfsucY=; b=TRIG0v0xYSJK7xWSpUeY2FG2p1xUN5EW5P8bE31T
 DhsTOhS6byZpXzsBh+06OC87iQiM2SJdKBdLPuPDZxdJtWUa8aJO023w7Im3r5G1
 SOZuM7BzkAHcbFTIhHpiIPhs47HN7iFNkuTT9B4sgwCx45ihjkXR21FMKZ7TzroZ
 7b6jwcJwnvBDll+Nob38sn7gu+zhJSMdEdqTOhBL0ZG/tFXXZe5kpNYV1ecxFkql
 SgwsMjsNmvxVg1YJGxEBqnhcr6aJ8wsrvL2FhTql6rfVW/raquJuqLNYcsV9O8Nt
 C2kjR8P4sYWuBT4JDF0Vh9fLZ2YTBH6bJCC2F4zLpcR8Ow==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8an3tb6k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 08:15:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2954d676f9dso7173565ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 00:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762416923; x=1763021723;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E2nTnkeSWlK4jeMAATj6ukfyZvRvO60TtToxYqfsucY=;
 b=KlP5z+DT/KHiC5IAWWCUvXkIsUBRMQ6quSKrt+hWhAwLsj24qko5lJSBTJ/ZYQjQ1M
 F1D/rZS6z/UrvB1/xuruJdSqsvlTf5vEtMfBpMMPHiuTlDnJSJmeWxYI4EIbYy89YMwc
 lC67rn7Sk+1iEmQeotoDFuHuQLiMfNJ31moWoMdfZg8+ced7drfF3mCdy6xeaFRkaBNU
 ROlTUwMMIR82veaIphrTyrrTMo3o4yQl83LHrO2lUWNn5kRrD8r1DPxnoqghXKds6CSF
 YMkOt60izJk/ngredJxnNySL4bgBvnOTlZSiQ86H9VUU4KqCOTmdixDOvIRg4bZRj4oC
 VYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762416923; x=1763021723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E2nTnkeSWlK4jeMAATj6ukfyZvRvO60TtToxYqfsucY=;
 b=JGc+RBulmVNxJ4pPMR5Tkob3c3GUPMCuMfSqzJG9jOZyoGAuWyuEkxofWoJwl8mxNz
 w5keYyRlB8Na37WQBsGUvwl1+5XAiXHQceY8rUF50LbtiMzblZv7DydcDOCXIRcOocIY
 GQizTMd7Dg4BqDSEGFYkI+MenHAykiM9sMvkvamMZpxeL4xLpa72DoAT9TP27gRKZ2fN
 FPmVTKQkRnxjuCcAsNFgVd1qQ9B8bqRPbyeBEXJjX3mPi+FfXWXd1xLGV1zqsDyuABXX
 lbXgfucBXu9Uxk/BMLHcK0Toe1f3YxtHVOb79vUqqiViL6I8x2fM7HzVdVqaI54mVXrI
 gSpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbvlLtJ1EgIlHRaFjFBu2uA43nHHSBSq9xwBQq3KHAzKJ7LEaKNxalFeAvGXPGi5CT49YMvqM9Jg0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXBotpmjZVmNdRs//lyQDdbhYGSfqC8RojEnHfO1ilHGSQ8uHp
 hWn+JPNFNRlXaMSK/gEV9rdoWjr0a5dKjRgboeQ7u4xYZuGdgF6Y+LqCuJNFegs9mGyD7K4gUw7
 atfY2lL1AklZSmIzrUlhJVRIMfdc6VIpO2aMFxJFtHHzm5bf2+GxuEukzS3ClV2OrQ4RiZ5c=
X-Gm-Gg: ASbGncvgAmgea90PFcxCzosqz+mibkSG6xOc1HARcnnw3uB20eAk1725cMz7B+qx3yW
 bdWwrYyx4fXmVINeLi1+4aDuBnHxvEcopGDKXXVeU6Ks4vpPywGv74JSYjg8G/5YWNrgb35Cx8y
 Ehp0ODxdjadvq1GrDAiBDbHo0aRjtIeXS8fGJnrtNXJp6lDaQ8Ts7m2jesVRktEpAQqJeHckSwF
 Kc02deKuFBZxa60UhjIZ9frN8LzBNi97px4BVoTaM4F6ftg+xzEFEJK6ZhfrFax44v+kigVDBbh
 GVut9WROP70Zwmo39dWK+kc+k0OZepprDfLwlqpbcGoiBSyXkZxIAxx8z7pO/GBrwlQqwB47avs
 oKSQgQZbnDnGEmk2QRNqf6Gnri4boHZLl6Zk=
X-Received: by 2002:a17:903:2f44:b0:272:f9c3:31fb with SMTP id
 d9443c01a7336-2962ae94115mr86504845ad.58.1762416922671; 
 Thu, 06 Nov 2025 00:15:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0r4zBjWbLh4JTzVOhjkocrbeoCzUB4DY4f4S0D0wECmNRrPl3V9nkwaxCedsZqCk4kkR8uA==
X-Received: by 2002:a17:903:2f44:b0:272:f9c3:31fb with SMTP id
 d9443c01a7336-2962ae94115mr86504495ad.58.1762416922173; 
 Thu, 06 Nov 2025 00:15:22 -0800 (PST)
Received: from hu-vvalluru-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2965096dbe4sm19486625ad.11.2025.11.06.00.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 00:15:21 -0800 (PST)
Date: Thu, 6 Nov 2025 13:45:14 +0530
From: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm: bridge: add enable gpio for display-connector
Message-ID: <aQxZEi5oHsJUb/GR@hu-vvalluru-hyd.qualcomm.com>
References: <20251028-enable-gpio-dp-connector-v1-0-2babdf1d2289@oss.qualcomm.com>
 <20251028-enable-gpio-dp-connector-v1-2-2babdf1d2289@oss.qualcomm.com>
 <20251028154929.GA797@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028154929.GA797@pendragon.ideasonboard.com>
X-Authority-Analysis: v=2.4 cv=W981lBWk c=1 sm=1 tr=0 ts=690c591b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2BB3o41RQBCR0pyYnt8A:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: VR-F9dAmBAo3678xrBvsSp0NwB-XzkMs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA2NSBTYWx0ZWRfX2BUURHdS0B7J
 MX7YvYLgJDQ6mdi4oX9D76JFfcBMqaeQdUzIJsVzEg3rjZFbDMNkOL5IsfSnOC40veth4+IDLqP
 zL9oBYAXLvdefKcdGiVl9kAfP2PlP5W/YtJa2ccnXmZ62/cKNGqoftE5wwl++LRufLGAFqsYOtZ
 FToGXN20a6nmS2OBkIbSN3iAxb1BffiLgMh369CZvA7lkzuafl6eT73eiEVcl0xltL5MQtjpGwK
 ZA8xYx89jrxQwxypUuh0GjOaOS5AMq9w+NOk2U5BYgUkLlv6cLYZMgAm5l37h0nEGG0EQ8rrT3x
 MMbJ/6ReJEikQ0Toxsim5VwCEiqpJ4cMtrzzp5vfwPdzotg3eAw9jEkIGWJJXCFCY6T3vmxl87Z
 YxUsSSSTvEqa2IWlvhFbcReWwb6wDQ==
X-Proofpoint-ORIG-GUID: VR-F9dAmBAo3678xrBvsSp0NwB-XzkMs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060065
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

On Tue, Oct 28, 2025 at 05:49:29PM +0200, Laurent Pinchart wrote:
> On Tue, Oct 28, 2025 at 08:56:50PM +0530, Prahlad Valluru wrote:
> > In some cases, need gpio to be set for the connector
> > enable. Add optional enable gpio to display-connector.
> > 
> > Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/display-connector.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> > index e9f16dbc9535..52f5e4175e64 100644
> > --- a/drivers/gpu/drm/bridge/display-connector.c
> > +++ b/drivers/gpu/drm/bridge/display-connector.c
> > @@ -21,6 +21,7 @@ struct display_connector {
> >  	struct drm_bridge	bridge;
> >  
> >  	struct gpio_desc	*hpd_gpio;
> > +	struct gpio_desc	*enable_gpio;
> >  	int			hpd_irq;
> >  
> >  	struct regulator	*supply;
> > @@ -298,6 +299,12 @@ static int display_connector_probe(struct platform_device *pdev)
> >  					     "Unable to retrieve HPD GPIO\n");
> >  
> >  		conn->hpd_irq = gpiod_to_irq(conn->hpd_gpio);
> > +
> > +		conn->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
> > +							 GPIOD_OUT_HIGH);
> 
> What does it mean to "enable the connector" ? Given that you don't set
> the GPIO value at runtime, this seems to be a hack that is probably
> better handled with GPIO hogs in the device tree.
DP_PWR 3.3v for the connector is enabled by a gpio. gpio hog will perfectly
work for this scenario, thanks for the suggestion.
> 
> > +		if (IS_ERR(conn->enable_gpio))
> > +			return dev_err_probe(&pdev->dev, PTR_ERR(conn->enable_gpio),
> > +					     "Unable to retrieve enable GPIO\n");
> >  	} else {
> >  		conn->hpd_irq = -EINVAL;
> >  	}
> 
> -- 
> Regards,
> 
> Laurent Pinchart
