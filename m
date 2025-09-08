Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ABAB48FFA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 15:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FF110E20F;
	Mon,  8 Sep 2025 13:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAYTtaB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E63A10E20F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 13:45:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588BI8Hs013554
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 13:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=esqnV4GgtEbrquLS/zK5rW3W
 tt7Z1gs3taNjcse55BA=; b=ZAYTtaB9Y7SMyW3MEsYa9Jw4FcBylLtuUJgggnT1
 ggSBjKQSPM0bXafiZrmUzWnhTeDn/elXOFafxMai3AEAY/kDCKHX+MBKB8G3DTBX
 6L3JeQM9UJFDd8i9sHQc5H5BnSv/a35X3UP8bEwN63u8E9Ci+V12IaNx3mmrhCNv
 cM0IA7wrC+tWa/DrMDlLdScyBmtmsSlRQjLjNSMjc1GCmXrwxmM7uKbXVkuoVEbE
 CxU30u7LffSpJh+V7iKVEVU0tZWX79nGews7Bfu4qQnMA04l4zl+P3SfICmk14uE
 hv0GFp4UNlNkeuLjD5Ui40WyB+CPsZn+nTG1unjwpxj0jA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdsjyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 13:45:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5f9673e56so64373471cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 06:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757339127; x=1757943927;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=esqnV4GgtEbrquLS/zK5rW3Wtt7Z1gs3taNjcse55BA=;
 b=C4iWLOdpj8ed36CFQrLNlAF+pvWSoTHJC6krQJF8pVYnlyHSyvbFStj/KeWDSZA5bT
 cdryvAwG/DPziEjZ9b7KZrkpHPX3AvsKoB1+HxngbsDFCMRXFgkKiiSWgrnPyqKyLBgF
 b+bgMxf0vrk4RT/XHfJkY5UVAjJl/kEfTkZXDDBec0kqnNSlOJHcqIV2rRIFwlvsrv2E
 g/PZIhzFE0b2PckwI+0vxc42L+jex1Uf2wLNx3KLp3BDMSjYar9TNhwmNzpkp7rpDdT6
 SHnx6gDSFpWFJKOx2PduapnKvE9374/t5xy8jYeJ4/W40U6QPD60vgZPs7r1NAtUgIDj
 3SXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUThKi169yLO1mzCul0luJRWcM2CjithJbkrp7p7tSoXe9E4obgpyKid7lcnRdaa9JkbVqeeYofs0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwM2Vz73diNAcWRBXsv4nyk7pL1tsegLNC/JoGOspvniFuDDbVq
 RUaIWhwJKMUXsHBW6gG1Opq0G8sA3X94mvNT0cJWhWLteweuZQVdqYZfO90xrAA8Za+aoCLRf7P
 bt0sF5jqjQ0MHgvw9OohE1lPwRJU56IAHaL58ZuR1wZFfWPyyCXmzTZqLQnAtXwKe/tZ8j7w=
X-Gm-Gg: ASbGncuUMY2MoY1kf8ml/tqMzT9OkYhMAJNDgqQw6nPiQ763vluUKYbpPwlwqb8BVAP
 kVd7Tu9LlcWbcIxpteMJr5hxP9nTJMO5h0ABlXh/ce+FTiCldohzFR5qsOflyBOK7/clOZtDtkI
 OXJLn1nG8ojcFW35XohG5uglrp3aSqxxQS91n+d+BgQfTEqePUm7cMmdZpb3pad5KwDyDxRBbzT
 Y3UC2sd+f/6VGi/kDx5oE9onNnfXeRDuJNLTrOc9G7g5PTqX5xz1MAY2y3/0C6MDxx1e1qMj8hT
 1sRY0yvTQpYFv1/hK6Q8jdAgj64KEZ4QHhOHgz3dJZd3xFMJj5gZ87+em4QhPC0bFkO8XcK1DEB
 nrBqnrmeIDYWX3duQHDMOTMEdt7ndgpSpyZ+9Kb9E2Bg2U1AdWv1j
X-Received: by 2002:a05:622a:289:b0:4b5:e9bb:846e with SMTP id
 d75a77b69052e-4b5f83a51d3mr96781731cf.21.1757339126998; 
 Mon, 08 Sep 2025 06:45:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6pGd+MdXBZbW1TIlirM87MxAFCUjEO+5IJdJhKbmEgdqD6cBDX43lwroMqHuWkohubp2b/Q==
X-Received: by 2002:a05:622a:289:b0:4b5:e9bb:846e with SMTP id
 d75a77b69052e-4b5f83a51d3mr96781021cf.21.1757339126299; 
 Mon, 08 Sep 2025 06:45:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032aaesm32757861fa.37.2025.09.08.06.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 06:45:25 -0700 (PDT)
Date: Mon, 8 Sep 2025 16:45:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, andersson@kernel.org, andrzej.hajda@intel.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, kishon@kernel.org, konradybcio@kernel.org,
 krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 rfoss@kernel.org, robh@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, vkoul@kernel.org
Subject: Re: [PATCH v3 2/5] drm/bridge: simple: add Realtek RTD2171
 DP-to-HDMI bridge
Message-ID: <u3qwrzwcr4knq7ueinws3siz2frugbkj75r5zp6i7qmkhnyauf@lrmiqhtbgzfj>
References: <20250908-topic-x1e80100-hdmi-v3-2-c53b0f2bc2fb@linaro.org>
 <AM7P189MB100924E3244B953F0EA6D462E30CA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7P189MB100924E3244B953F0EA6D462E30CA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
X-Proofpoint-GUID: dtq01FntQqnBEjIWHOyzih9bSFbHDk04
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXzSnq8716FmmO
 VlPHuD4wbETnfl0jnYHVRA+V34cdHNypjZrG0sRcuUGmz4q5x9uEKDMpQeRSOeaOGnUUdD2Srg7
 pUDUie2/mSgSPoPQeGOnWbD3jEkn3PUD/k1S8AZNybuqQiTN+DO1oBackwkTQrGox5mR4URrsv8
 PU92yTNBM2kLtrwkCEhr7PNAtEo9BQ8njxZgkzdxm8eevxMMapQ3SuYN9Gzd5qGOol0eJGl2fT6
 6b1yHOA8ZjB0Rs3MnjadrpcSOgBLxoBSEt9cXXL76C8BqV0+o1Ij+wzGNDvcJATOM42MvsOsaKO
 kaa7497vh8Sp2dH6Q5EGnXp7Cs3jdPd9VkV+GPaZJYB6EIvfxoTTwlvZIwGpbALpR6APSs11roc
 QGf2kwd8
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68beddf8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XwVbCjRl897ke_8r9AsA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dtq01FntQqnBEjIWHOyzih9bSFbHDk04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
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

On Mon, Sep 08, 2025 at 03:35:23PM +0200, Maud Spierings wrote:
> Hello Neil,
> 
> > Add support for the transparent Realtek RTD2171 DP-to-HDMI bridge.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > index 1f16d568bcc4e0fb56c763244389e6fecbcb2231..e4d0bc2200f8632bcc883102c89c270a17c68d0c 100644
> > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > @@ -266,6 +266,11 @@ static const struct of_device_id simple_bridge_match[] = {
> >  		.data = &(const struct simple_bridge_info) {
> >  			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> >  		},
> > +	}, {
> > +		.compatible = "realtek,rtd2171",
> > +		.data = &(const struct simple_bridge_info) {
> > +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> > +		},
> >  	}, {
> >  		.compatible = "ti,opa362",
> >  		.data = &(const struct simple_bridge_info) {
> > 
> > -- 
> > 2.34.1
> 
> I would like to ask again if it may not be a better idea to introduce a
> fallback compatible, once this patchseries lands I will be adding the

I'd say, that's not a good idea. We usually don't have fully datasheets
for those bridges, so we can't be sure that there are no strapping pins
/ other GPIO controls.

> parade,ps185hdm. I don't know how many other variants there are that are
> just simple dp->hdmi bridges that don't require anything other than the
> connector type set to HDMIA. The Thinkbook 16 and zenbook a14 both have HDMI
> connectors, likely with simple bridges too.
> 
> Kind regards,
> Maud

-- 
With best wishes
Dmitry
