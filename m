Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1055A61462
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 16:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B76410EA04;
	Fri, 14 Mar 2025 15:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bq0JgtMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FC510EA04
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 15:00:22 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EA3KOX023475
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 15:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5Q1/t28eBE47VhslKnKzc2xe
 LvFBD34uadwrGYmHEs8=; b=Bq0JgtMYKQTYFkthrwll6D6i7x2kHLEY1SZZOluH
 Jpbxvynhgc2jljLcuBhAY2pJ28v1sMxcrSpBzPZo0DciI/4ER1SjszylH4fcFtT4
 PXOuhysQ8iauOg2KD3qJjakXZSZwltWLuriHyqSgpK8Zt2r5Hq7Kp8wMCYZ0A8er
 VrEsbkiCqk/f3Rwh4HlefbfpW0GwY7++kN2sx3QfFc5m2Lfd2W827042ws7w22j+
 zDqgb/jJIF6mGTCrI3uEHDzbVTHu6UKq8d9uQrMytyKiVIVMErJu0IXx2HRPB6qx
 Izs/yCSnpCVS6VyuNyq4fnA0bsDLuGFyOZ2R3F9N3/mAgA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cjc58rc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 15:00:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e916df0d5dso42138066d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 08:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741964419; x=1742569219;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Q1/t28eBE47VhslKnKzc2xeLvFBD34uadwrGYmHEs8=;
 b=R/RjZd0/XQIo9lZKvL0gzShm0jXeyjr0uhe2PGbhx2ovrLLUFNwqpsa8fhHUae7gG5
 qOabl1BvRrDKi5V5p0mC7XhIi2RzQDvg5WBJJE0LiJ5AaCBZ13mxiRP2xVzADom/lRaI
 tL+3He8u899T35ADhdEWIzJVAze2/uOGWwlA05hvDP3VKvQwWjzT4EA/lc2W+/HM/jbV
 S/AiuXEIRKW5yJTq+E5BlSjdpMXA66siCX/Hc3leX9A60/gdD+TX+JjSR8ei+4SObi/7
 9JPL1lH757aW7Nsmy/hy5u+hXsLizO1ZfpDRW/hxT4DXFiCHK16HmYa4ZyBjrAtdE07P
 ZO3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr+oX5uGL51GpYYGIaoOKOllTRCWreX2nHfMreDQoE+68xsilmXGgeHgyBLoKkjwH1Xye7HxYoqS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbsfn1DDsGh8t311gJj0yIIIh74iR4v230I9sS/oWoQ+DsGCPH
 Q+e1t65RSfkvV15wMxGOOcw9O4zSRoEC8esOmoDJI8o0NKPjrP5W+zEA5ger1bZNWTElPS4XFKL
 nLqPnlZ796sfFuhFwnZkPxNGwOM5MNY3Clj8KhSDB9j+tVgwsTmqrICgR5pSpjK8y7n4=
X-Gm-Gg: ASbGncuokYl799sN+BS+1ZjzASnJppvlqTZHhG/MjnCBqnA6p+2gUYhUWDNi2Z5hlVv
 Imb6mv3KsSOZ8KZRDM8QU5v+LMiJPX5yxmyMQ1HXexErIAz9Vqi4E91RIBuQ2wwMaz4ozS/SsOB
 k3e826a/8HyWzQ4v7HyNB1Qk/PdHbchT9y32QMeymC7QeBa08egEI2vum2maEfofROYGb6t/rUe
 HdtZxDfBcXmZrdMPbRcXCX0jzR4Tb9oh7ZOnSnUPcI+5IeyetvaGclEbWGsvE73htKOBSewBdn4
 wJt/1B4NUUlrKb0SlTH99Y57t8RyAS1a2P4ujrMduu4lk9kcKDZ/uTWpkIV/hRmi8Edg3RAEWV8
 iH5I=
X-Received: by 2002:a05:6214:c47:b0:6e6:5f08:e77d with SMTP id
 6a1803df08f44-6eaeaa64726mr38922666d6.19.1741964418931; 
 Fri, 14 Mar 2025 08:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElOf5VcuP4Qfeqk7k77duSbY0HMHuiCaGOzAq7nuu0v/lm1rSxjObW30d/t+f4KOijDX3OSg==
X-Received: by 2002:a05:6214:c47:b0:6e6:5f08:e77d with SMTP id
 6a1803df08f44-6eaeaa64726mr38922006d6.19.1741964418512; 
 Fri, 14 Mar 2025 08:00:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba88536csm537756e87.177.2025.03.14.08.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 08:00:16 -0700 (PDT)
Date: Fri, 14 Mar 2025 17:00:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
Message-ID: <zfbamnotz4smuswgzhtp7maqw5o7d5boi5urvqfrqylszbbyok@jtwqtjmji4qr>
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-4-fbdb94f02562@collabora.com>
 <20250311-hypersonic-mature-leopard-d3afdc@houat>
 <g25hgb2mocl4sjny26k4nzn2hwpwhlodenqganzcqfzzg6itms@herenniualnw>
 <20250314-airborne-magenta-corgi-afd52c@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-airborne-magenta-corgi-afd52c@houat>
X-Proofpoint-ORIG-GUID: 01eHXKKaIqz7PlGF-gKWWL65eMQB1Vfh
X-Proofpoint-GUID: 01eHXKKaIqz7PlGF-gKWWL65eMQB1Vfh
X-Authority-Analysis: v=2.4 cv=G/kcE8k5 c=1 sm=1 tr=0 ts=67d44484 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=QX4gbG5DAAAA:8 a=JkxHsKVaOhtT2WVG5y0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_05,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140118
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

On Fri, Mar 14, 2025 at 02:47:53PM +0100, Maxime Ripard wrote:
> On Tue, Mar 11, 2025 at 09:46:39PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 04:55:17PM +0100, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > I think the first thing we need to address is that we will need to
> > > differentiate between HDMI 1.4 devices and HDMI 2.0.
> > > 
> > > It applies to YUV420, which is HDMI 2.0-only, and I guess your patches
> > > are good enough if you consider YUV420 support only, but scrambler setup
> > > for example is a thing we want to support in that infrastructure
> > > eventually, and is conditioned on HDMI 2.0 as well.
> > > 
> > > On Tue, Mar 11, 2025 at 12:57:36PM +0200, Cristian Ciocaltea wrote:
> > > > Try to make use of YUV420 when computing the best output format and
> > > > RGB cannot be supported for any of the available color depths.
> > > > 
> > > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > > > ---
> > > >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 69 +++++++++++++------------
> > > >  1 file changed, 35 insertions(+), 34 deletions(-)
> > > > 
> > 
> > [...]
> > 
> > > >  	return -EINVAL;
> > > >  }
> > > >  
> > > > +static int
> > > > +hdmi_compute_config(const struct drm_connector *connector,
> > > > +		    struct drm_connector_state *conn_state,
> > > > +		    const struct drm_display_mode *mode)
> > > > +{
> > > > +	unsigned int max_bpc = clamp_t(unsigned int,
> > > > +				       conn_state->max_bpc,
> > > > +				       8, connector->max_bpc);
> > > > +	int ret;
> > > > +
> > > > +	ret = hdmi_try_format(connector, conn_state, mode, max_bpc,
> > > > +			      HDMI_COLORSPACE_RGB);
> > > > +	if (!ret)
> > > > +		return 0;
> > > > +
> > > > +	if (connector->ycbcr_420_allowed)
> > > > +		ret = hdmi_try_format(connector, conn_state, mode, max_bpc,
> > > > +				      HDMI_COLORSPACE_YUV420);
> > > 
> > > I think that's conditioned on a few more things:
> > >   - That the driver supports HDMI 2.0
> > 
> > Isn't that included into connector->ycbcr_420_allowed? I'd expect that
> > HDMI 1.4-only drivers don't set that flag.
> 
> Yeah, I guess that's one way to do it, but we don't have any way to
> express it at the moment

Yes, we do not have a way to specify that the connector is HDMI 1.x or
2.0. However I think the code that we currently have ensures that the
flag is set if and only if the HDMI Host and all the chain after it
actually supports YUV 420, which would imply HDMI 2.0.

I know that drm_bridge_connector has one deficiency wrt. YCbCr 420 flag:
it is impossible to "inject" YUV420 in the middle of the chain (e.g. DSI
host outputs RGB data, but then comes DSI2HDMI bridge which can convert
RGB data to YUV). I kept that in mind, but I'd like to see an actual
usecase first. And anyway, this currently limits YUV support rather than
enabing it in the unwanted cases.

-- 
With best wishes
Dmitry
