Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73CFB42E45
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 02:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A2810E21F;
	Thu,  4 Sep 2025 00:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SekZQ3Il";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E3910E21F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 00:34:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DxAHt017520
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 00:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XfrJrvdyAXmQJVa0rcNZrHND
 sz8MqqvZWVWKrBmq0R4=; b=SekZQ3IlTy8JL2eV4UuBYUfIC1IkmkZsa88yasc4
 AcXVfeKGNRrY/gJMoIbwvK0vavZ/DMTZOADrXMvbo0VnSCit8/GwiSmjPXfKeulz
 +MqF11KdC0rxEXqdieeCgy6EkMBitpjSq1dgoJ04/kTDwa5vqeAZhv6q24PRL+45
 4qQ78VEX1Cv+B7/+JXavAdpr3PbAE5vwH/e9I+SnqIUU2q6ChBsq4BfbZsxM4r8S
 871oCf6XH/3ijtgwhqSYRlQy94A/3SL2aWg9X7FLlZ5YbT5nko1bsIUwuJEe1/nL
 nNVP48/TFvgcQOpMsibrZ5rCNdLwK71UnQ3xqRsIcAqxCg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj25p1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 00:34:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-720408622e2so8969726d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 17:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756946058; x=1757550858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XfrJrvdyAXmQJVa0rcNZrHNDsz8MqqvZWVWKrBmq0R4=;
 b=m3bt+S0JEHJi1bEkDLnt+P3gvPnHFGbfVMwPiiqSuKAYyLx+nVqp0C03yeCSI6ZmJR
 RfjH/Ra/Or5ses5LsBtCPe6+okh72VLVOEnOL8VIJb08y5aq7/dYIZW3QBS5bvF5lfPI
 jqe4p+szuK5Je3n9dCX2wPUBZgAfscA0X797wnqdV12GATGCq2d2M7h4TsL+h4qbqj5S
 9Q/4Kf7DjEa/1cJ8rXobLoEa8Aj17BVPymjYTbV+Uk0ASYuzm9gImIp0amd97YwvXFbF
 wJaFXHv1cnkB//R6wZ+VXVREi6PthWWt6mYv5AMeEuj8SVR8R5w6Wvgz64PbSGiJx0Fo
 tzgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI3GnHQFGy3VGdeX+Btzpq0MGbKGprt5BKCFWhL/G589XKoGvqvVEhiW/Fvnm1HjZH1OXiLnIEP5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSQlZELuwP4K0nsjDetZjPvvDQt7Qmv5ftgF0R0v3uMh1b9XWg
 tfrlrg6nUK0VAvEBEIXjd/9/LamIJeZZxY1zGeFZr/3S5ylXNN6xoEMbsIU7NP7ZtMBgOS6FzIk
 zwwMi2gVpUTKEGPlZgovdY/AWt9CWLtRaxv1ezpARcfqKIh/tGtM/5ciejde0PvhqlMtzprY=
X-Gm-Gg: ASbGnctsRrA9O2YKPxSbBG3hpglGs/syWISYInhfzkQv+my907MfaqndGFmvTTQ9FVu
 BgF/p4BwEDQKYzlbnk+lbpoyxtlpBcdqt11sMiOg6g232NGImWdf7LeYPuLigzg/uMOkRaKK3LT
 7PVt40D8zGZ/IQkE0zLUBs6xLPVuLKbUoCpV76Ef8dKBJUf2p5sNRCFhIExYRl6+1goV1I107sO
 Hf3HWmTmDAZRRaG+0go6kgNTgPdDOozQpCWsdBMSmWJrRrCA9K6VrA32KaOgAypYNAd9hgSmFIV
 VY92btAJhAG+vVCuHEHT6ktD71QnqJA6/k058eFnRRbXG3kVCNXJBVAAeQgoiEOd8uzW61v+uoM
 BOw4ijN1lABoFrkIyAt1s2Y6LJfaWEJPzo0a8gYAJQW0eQIRr128k
X-Received: by 2002:a05:6214:1c83:b0:70d:843f:6b8c with SMTP id
 6a1803df08f44-70fac8a7b89mr177520316d6.37.1756946058060; 
 Wed, 03 Sep 2025 17:34:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGja7X2uK+OYgomkOzPWpjLsAEHmq25LEESvoGCpov8TlZrxYSLZ5iKF7ssAy+77a5qFU41Dg==
X-Received: by 2002:a05:6214:1c83:b0:70d:843f:6b8c with SMTP id
 6a1803df08f44-70fac8a7b89mr177520176d6.37.1756946057510; 
 Wed, 03 Sep 2025 17:34:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad525d1sm814295e87.139.2025.09.03.17.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 17:34:15 -0700 (PDT)
Date: Thu, 4 Sep 2025 03:34:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
Message-ID: <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX18VaiEIlJ75W
 13ouV8Z9TZPAlYmXFjAt6GIldUsd8OataTnmBPDwJ8aUhVOrH8uPjez4VL1Db7hqee4/i2dQrgi
 iO+JZlK9CIxD5PKCiw9za0Pciga9aHhKv7qgyqnesx3LBLg9AHRmBVQDB9ZYGlkILitEtbL+c67
 Ch70yTHYJ9PpNZy6/bNDuvqmhGzyLVKKoaci2dO/6l2DwwKk3U4pA0NV5CVxV/wU0GjnUerWLXc
 hcOhlHcXqkBUhSOqrnsdAMiTz0G745REdR9KStRgZ5O+ExmNATn3gQYTwP6/T82jS3a7tdxxw7I
 rqOV4SjRu5ljo/8RtC/JJ904bxSrXr2azoB0lyQA/sSqfi7wui3VJfn+MagLWzC+OZnMX0RCP8j
 vHbM6gc7
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b8de8b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YChNujVLCtOUS48-0VMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: u8ktOKwICHWeI2XDHJWAoyZ1wUTDMb5z
X-Proofpoint-ORIG-GUID: u8ktOKwICHWeI2XDHJWAoyZ1wUTDMb5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_11,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117
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

On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller for Qualcomm SM6150 SoC.
> While SM6150 currently shares the same configuration as SC7180,
> its hardware capabilities differ. Explicitly listing it ensures clarity
> and avoids potential issues if SC7180 support evolves in the future.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,sc8280xp-dp
>            - qcom,sc8280xp-edp
>            - qcom,sdm845-dp
> +          - qcom,sm6150-dp

The DP MST bindings were A-b'ed and R-b'ed by Rob, so I picked them up
into msm-next-lumag. Please rebase your patchset on top of it and
resend. At this point I'm interested in DP bindings and DP driver
patches, the PHY part can come up separately.

As for the compatibilities, I think DP on SM6150 should be compatible
with either DP on SDM845 or DP on SM8350. Please choose one which suits
better.

>            - qcom,sm8350-dp
>            - qcom,sm8650-dp
>        - items:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
