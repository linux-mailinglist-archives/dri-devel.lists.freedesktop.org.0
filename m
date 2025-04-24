Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6035A9AA0A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 12:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940F410E7C4;
	Thu, 24 Apr 2025 10:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpruXzTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54E210E7C4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 10:24:01 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9AQ007631
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 10:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=j4BDsTwObQmRXQvxX4u8s4xU
 g+eG5lJxHUSU9lC6EcQ=; b=EpruXzTcKEU5BmMvqpw/QQaUDBzAPkOffdIFSJEw
 FoyxdVwsIhNa31Czq77FhSSby3J1kLf5ezY2h26exod+X8nD+TK44OvLJ1NlMP6z
 yl8IVEbLkDv35gymNNLUqIFB+e0VbbfN/Qf0hBI6/5m2WpXf1Tk9/5e5MIRnfMOF
 UhuCaL7QJee2rrMAqxlHi/OsI5jR3jr7+TLcZxgUWVfOWUkMGy2LMRBmFnz2ZWXA
 kSCEh9R+HxRsWWoHKs2wfE3ECbwU1oiC0VWP095gcpEQykVfJ3KZcc6MpghdUPKU
 eNpEMR7PgVt9V3lDYgN+YpDvFCq8ZSUVLYvMutaFUDrDSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1n53c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 10:24:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5d9d8890fso365331485a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 03:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745490240; x=1746095040;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4BDsTwObQmRXQvxX4u8s4xUg+eG5lJxHUSU9lC6EcQ=;
 b=mpMTYqi8VRa5LpsEfJtn4cKOeDAGNusKJwnn3WMWH+v+bQ9zSOaJl2LhkLsFT6kPnO
 j8mgryWvUZ7MhjdAwYjwhXOqIBuKdWraJoOhY8nWreLnZL8EEf10LU/G0VyVuPulbPW/
 Ve/cQBXWFK1coB4ai6/cJl+qjXVfVUnIoigtf4x8ebLISSapeo9Az15hDSUlDw5+ftiy
 8uhrfsk5q3mbBegzJ5sul8uvTg3xaUwxWvDW7YkJgsbRJ9z3OOb0K611FsavlCnvRkX3
 JPcMQfSW5E3JsDyLCIFQqVws2YLdKZeV1tjw3uxd+JOI+lFKvZ5Mc4Y79/C5DJHrG4Vr
 7Htg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsbq2+RTMqGU2vtXICiNGtw95NxsSxjaFeJV4UKZaAiYLaWZcfuLjyYMVqxDBkPmV30J0la/v4aPw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/nmodrvAI3DP2QRsXekb6FAIjtcTNsugChhlAjui3I+j+7+Vp
 3sCsoGJ4Ao28jghhm9KLv3r1381gcqIjBOwOX0WnLzi5sCYn44R21JPfrUh5Ylzs8IWlmsye0NY
 uxof17DEdj5b268wZr+A6lF/3ZcLHxH4wEJDBoa2fNw/py0lwQNI1Ce/B8v5YKv1NIps=
X-Gm-Gg: ASbGnculFJxmeQdR3qBaTcUgNXcqeBTE3N2Cz7ps+7nIIYOXS1TJwI8gW9BI7I9iq11
 +fuvzIUtxgx2We3VE1tuuef9tFt+Yjo12wQ6uK/mpfYQOXf48H5/2a8I9OrUcLU8qHcvGjXjC6C
 AHLymFAd2j6Iu5cg4XJATzEZnbJvLybSuXkx+R7WolnIIeYe6HlcxDY7cq+n6zIpFn1urVVHwTU
 sP0I3rfIG4ABmiInPGrLHAyyaC8DiE+Y66hFgNWeYwkbWnl2twJ9WGdu3KZYWkINgkf7V06/Dxj
 hzWDZfR4fX23zm4nYsDF8jz/w9yGJ7rpnKHXKyCKEYkavkyu9UZ4CEh6piJ4h4ET/maTMA6+Zq4
 =
X-Received: by 2002:a05:620a:f0b:b0:7c0:b350:820 with SMTP id
 af79cd13be357-7c95859b8d8mr248842185a.5.1745490239945; 
 Thu, 24 Apr 2025 03:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQQEXVZzHdQnlD3zO5Vs5rn2DZ4H/JAobpVLZpVt95WPenNjUM3LZuNMO+8GOdOAF/WC9wFA==
X-Received: by 2002:a05:620a:f0b:b0:7c0:b350:820 with SMTP id
 af79cd13be357-7c95859b8d8mr248839085a.5.1745490239479; 
 Thu, 24 Apr 2025 03:23:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb8055sm176606e87.234.2025.04.24.03.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 03:23:58 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:23:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] drm/msm/mdp4: switch LVDS to use
 drm_bridge/_connector
Message-ID: <s63lvzn35d7xcvw3kkmtasyinxbqa35juyxosdscfk6vhty4pw@hu3dotyklo3r>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org>
 <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
X-Proofpoint-GUID: e6AHOd3lJgz3gj6zrATkuNpQBw8uWhVJ
X-Proofpoint-ORIG-GUID: e6AHOd3lJgz3gj6zrATkuNpQBw8uWhVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OSBTYWx0ZWRfXww/V7G63hygd
 +hRB3Aa25mXyuMfidX1lmHG5KiDBtPa6ncB0WVN821s9DzlLNH9mD/udSGi7JdgRi5Gj6Fv+ijA
 BDiXfHuGpDDR+pnepwScxrPb0AAWwcGkXArmpB4/GwZZzl4VqOTBwGnHyXN26+uRDZlbRjGqHnW
 0o94wsjwDHTbiY0ACPOu8z9307Pz8N7X6DplFsL6u5u9NstJ+mqAVZO/2roocy1Iof9lQ53MlUb
 P1kz+1UqiGst4mI4f7/ImfkllVz+GuODXPp+oE2rUZa5mvwT3qA/VBxO6/MKzIkSc3uwRcek+xJ
 WUV1q04LYNMMxbnQHFp0wm4C+7ISjMozC83TBPmqINB+WNa3XHlCgKCfFSZVVuyMf9LriKTAPnr
 HbkdmsHRRiCOmb1bxjUzkbYdRwPKIl3FkkyCTPeDs/vAS/58ppmqKser/AgAfolii0dixurP
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680a1141 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=OCSEMTtbVqUzc-lEabkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240069
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

On Wed, Apr 23, 2025 at 07:04:16PM -0700, Abhinav Kumar wrote:
> 
> 
> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> > LVDS support in MDP4 driver makes use of drm_connector directly. However
> > LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
> > them to use drm_panel_bridge/drm_bridge_connector. This allows using
> > standard interface for the drm_panel and also inserting additional
> > bridges between encoder and panel.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/Makefile                       |   1 -
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
> >   .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
> >   5 files changed, 28 insertions(+), 133 deletions(-)
> > 
> > @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
> >   		 * bail out early if there is no panel node (no need to
> >   		 * initialize LCDC encoder and LVDS connector)
> >   		 */
> > -		panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
> > -		if (!panel_node)
> > -			return 0;
> > +		next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
> > +		if (IS_ERR(next_bridge)) {
> > +			ret = PTR_ERR(next_bridge);
> > +			if (ret == -ENODEV)
> > +				return 0;
> > +			return ret;
> > +		}
> > -		encoder = mdp4_lcdc_encoder_init(dev, panel_node);
> > +		encoder = mdp4_lcdc_encoder_init(dev);
> >   		if (IS_ERR(encoder)) {
> >   			DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
> > -			of_node_put(panel_node);
> >   			return PTR_ERR(encoder);
> >   		}
> >   		/* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
> >   		encoder->possible_crtcs = 1 << DMA_P;
> > -		connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
> > +		ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +		if (ret) {
> > +			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
> > +
> > +			return ret;
> > +		}
> 
> Can you pls point me to the lvds bridge used with this apq8064 board? I was
> unable to find it. Just wanted to compare that against this while reviewing.

It's the panel bridge, wrapping one of the LVDS panels.

> > +
> > +		connector = drm_bridge_connector_init(dev, encoder);
> >   		if (IS_ERR(connector)) {
> >   			DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
> > -			of_node_put(panel_node);
> >   			return PTR_ERR(connector);
> >   		}
> > +		ret = drm_connector_attach_encoder(connector, encoder);
> > +		if (ret) {
> > +			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
> > +
> > +			return ret;
> > +		}
> > +
> >   		break;
> >   	case DRM_MODE_ENCODER_TMDS:
> >   		encoder = mdp4_dtv_encoder_init(dev);

-- 
With best wishes
Dmitry
