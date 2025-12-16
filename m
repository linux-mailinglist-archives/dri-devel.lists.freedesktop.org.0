Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A5CC119D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 07:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422F610E6D2;
	Tue, 16 Dec 2025 06:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNMP9DtO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvQ+S7a6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0F910E6E2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 06:30:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BG2Hkgi1131673
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 06:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZOKoVU0nO8MaG0cbLAOwDYoo
 QPDcG7ORKxJsSltYtdI=; b=eNMP9DtO5xC1pnAdknWowTItD9/iL6uXQrNs6YJV
 zqfEb8DNDRPCC8IyWFZ+a56YLNaNhaZqwgD8+oZDZYbAeviU4AT8/h2m9HqigJ4d
 shxQesNTZPpiBM7JJxNlWNlDAQ1x7RAqBgzKkml8sZ/OGOj8AG09W69jXpBgnyWK
 f6Q0+n+nMwVy2idyqwGM97a4m8f8iyF9JUzcvplbQpNFMAEzaLuB8RPR4wt6dNxA
 VuZgEohVNjXbYS4CE7jF7BfXapoJtpQx6I0PY2HcjJviIKb8TQUJiTtARNmAOIL7
 YfkU6ovsCSsnVykvAOVSBrvj2gQpnHW0HyY6JSOFjDw2ZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p3uajd2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 06:30:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b9fa6f808cso1145098285a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 22:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765866612; x=1766471412;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZOKoVU0nO8MaG0cbLAOwDYooQPDcG7ORKxJsSltYtdI=;
 b=PvQ+S7a6XxlFazlAgb4GOUKG8cFPCsQhTQYKaquafEM9qGd9zgulAloknCtSkhU3zn
 fZNah+DSqh33oWDrspK40+ADMCyoKu1+nYUkOoblmz5t6Cn7PsPizx9k6ux1Kf99AFg6
 A8FSlO5aDpJJMuwVGX/LbDaqbDTdNtW17yf4t6i4yOoHFIqhjDb3bLQoxFGo7+6TQGGm
 tCfSzP3gopUjYvojkt35r4gvUa4JpuKNbUuCq8PJzMyqauQJd88CbCdZs2GANx7uqvqk
 psTwGwEGWgPDFI4cMrhb/fRG0MhMdIgy5dmPWiDflJcvwXqPNiGHkuuVfyeyisHT4qNO
 cCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765866612; x=1766471412;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOKoVU0nO8MaG0cbLAOwDYooQPDcG7ORKxJsSltYtdI=;
 b=DYY6EvF/IkxyekfL+kxxHn1X3XBg41rwCSiZz7djDLAMJdOInuM9y13W8j6a3wPaLy
 I8OZ0qSG+mkpLGc8pzku6MzwuSVmBCRSsuBHI9lnekIyjUs7xcllIg8AmpM5VXLa2xaQ
 lWv0vqoqWs4VnR9eam1qi8Yj17CzSeI5xmZDxpzFJkA1+C6n6llpTLHuzw1Qzt8Fzv8P
 LgtEQdcudm3MWOHbkaEHzq0iKZXbDu7AUoohu/nAe9wa6TPqgzm0gM0uJTAtxRebxFm/
 Z3ZG8pu2E5NRHlas6e4jWEVFbYuyq7j5NaqHCu5gqGHRz3/w2IPRNOE654t9EpRAGHfe
 CFkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX13JWxjhqsNnExVqpsFNe22YRo1FLM1fHj8V6x9LboHtRFeUCFzG9K74Bpm6p+4FA7N4iYuTQd2d4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzork+vbKyY3xftLSKeOr07Otm4y9yb7UBKD33tNqChKX6nG1HL
 9P/y/2wSdLLmFkiys+UB5/UbK8RampkFfNAs/wjWlSMFG4bR1ItUPSsslWUD4qKsnl7k5oyaq/2
 6PxPyc/drtV6FHMqD/6Jl53P4+/IwCL1WNYG4+vjVaI5VAyIC7pF0PRYAFxF5chdZrr3q/eE=
X-Gm-Gg: AY/fxX5yWzl5DnFXo/4qCzqLAjyKgXZOhFjuuo9wHP9JEx14d9GzPel05ufvNm5Hqir
 Dt+Ux0TuE9w5qMSp65pB80MeRVm0muP5q1jb8Gy0KCsVXrjR5Njo0QHTJAyvHSVtVWcdzF0H0T8
 cHJ1xnHzek4ZVa0iu9nxJeMZ761hD+RCMGvSsxou/arh90hsaZ6nhasR7dzxyHtn7bPsiF5G+oy
 DJago63U9AlHMv+itt56ziBhuGEXaPu7EaEXmHMTp/MuYWee6rS7uSEDMo20uqw8p/PUecVdAPP
 9xIiCAOI/kQnEkAYuQTQMoEbrWMLyWuaoWpstL+cKFaFWUfuPFNkVxef+oRrjAO7QFseS9vJMgS
 V4Mj45+Hp0sDTw4KlR2zc65TduXxYLn5gy2VXg493AD+rC6nHXBZsiJn8nRsXNdvxY0bZd3M=
X-Received: by 2002:a05:620a:1a87:b0:8b2:db27:425e with SMTP id
 af79cd13be357-8bb3a2113camr1826050885a.50.1765866612062; 
 Mon, 15 Dec 2025 22:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmgbzqVkC2sXrT+x0ZCW9D4FsdZmJkOPQHKCtJ3rLA4qYdqbCXcJCXegubktDtZajGh89Q/A==
X-Received: by 2002:a05:620a:1a87:b0:8b2:db27:425e with SMTP id
 af79cd13be357-8bb3a2113camr1826047885a.50.1765866611625; 
 Mon, 15 Dec 2025 22:30:11 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8be303e7e51sm131155585a.7.2025.12.15.22.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 22:30:11 -0800 (PST)
Date: Tue, 16 Dec 2025 14:30:00 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 05/11] drm/msm/mdss: Add support for Kaanapali
Message-ID: <aUD8aA/5J93KBZ8Q@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-6-yuanjie.yang@oss.qualcomm.com>
 <k7k7fpmlde4tjiqxhzbf67olcdzsfmctendyjeewwh6v2kkl3i@33t2qfjxhwdp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k7k7fpmlde4tjiqxhzbf67olcdzsfmctendyjeewwh6v2kkl3i@33t2qfjxhwdp>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1MSBTYWx0ZWRfXxy6FYHZACVRu
 g5Y8Le5/FMFWpmdY5sAjZflMOzXL1mYZr+HFW3ahnUNtLrcy+7dzFo1FD+YecjCcRrbHCe4JZR+
 e5AQtoK0CHT3VlpXDY3My5rFdjq/iMokg4Au4SYO+gsP0W8sLCYLzovPFKse/lkp3SipHBV9YvN
 LFpWZmZIvPQIg/j0Silm9+nRpKb/kIwJo9K68jWVvKroUFzme3ADEv4fpxkQUSUdZtfEpbI5NBl
 3qarOfENubWMioDiHpAbXSyj8hB+mRsWGcu/h3OA+eXnqvGTuvc4efVjPym9uKeEiGQZuejKZzY
 n7N3cZpPMv110frA/vIyQ1G9aRYjO0K21Rj7MedzBYMR/i4w0Gt5DRPhcaxXVacxkcNR0KTmJbc
 +pNyBczEa3rtrPeNVlPBkWtGwnTMXQ==
X-Authority-Analysis: v=2.4 cv=Q/TfIo2a c=1 sm=1 tr=0 ts=6940fc75 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K6Vp4ACmwqLtMlq4UooA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: lxvcCaqQaAIiH43ynPqeQfWdztEKHSNP
X-Proofpoint-ORIG-GUID: lxvcCaqQaAIiH43ynPqeQfWdztEKHSNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160051
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

On Mon, Dec 15, 2025 at 09:58:27PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 15, 2025 at 04:38:48PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add mdss support for the Qualcomm Kaanapali platform.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index bf9a33e925ac..cd330870a6fb 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
> >  
> >  	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> >  
> > -	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +	if (data->ubwc_dec_version == UBWC_5_0)
> 
> This is the _dec_50 function, you can't make UBWC_5_0 into a special
> case.
will fix.

Thanks,
Yuanjie
> > +		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +	else
> > +		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +
> >  	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> >  }
> >  
> > @@ -296,6 +300,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >  	case UBWC_5_0:
> >  		msm_mdss_setup_ubwc_dec_50(msm_mdss);
> >  		break;
> > +	case UBWC_6_0:
> > +		msm_mdss_setup_ubwc_dec_50(msm_mdss);
> > +		break;
> >  	default:
> >  		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
> >  			msm_mdss->mdss_data->ubwc_dec_version);
> > @@ -552,6 +559,7 @@ static const struct msm_mdss_data data_153k6 = {
> >  };
> >  
> >  static const struct of_device_id mdss_dt_match[] = {
> > +	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
> >  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
> >  	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
> >  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
