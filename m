Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9C9B31584
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 12:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9877710EAB8;
	Fri, 22 Aug 2025 10:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbJHNySp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5E210EAB8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:34:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UQT6018010
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kveQ+tzxSixYaW9ElHHUjKWE
 uXQ0n186XTdsODdNbAY=; b=NbJHNySp6cGBngKyWzHr7So4mttf5+9GBE3hYVFs
 ZEd6u2yMLX0GIOPRWpZg0P+mTOKlZC69c1twVJFxi4UZ4JMTDfEl1CbY8IKOuhQR
 /azdpfol49X2Vyx6kaZwaxPr4pe1g3MjDloys9oQeyikt/r2p36HX/r1Wmjek2pZ
 RCkZafM7HAjwxsvM15rtswXP1qsP6d6FhDBKHDZuGQoYv/TkuipsJLcNIZ/slQLq
 3YCyx/mrbJCQFqrXw7neMCIYfEVDm92cZR0Lb29VLbOlcvAfG7z98b62y8iEbn8H
 M87g89SlpvBZQBzuoUogJ7QyylEaPwQPASW/1ljOS630iA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52b0rrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:34:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109ae72caso44657731cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 03:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755858887; x=1756463687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kveQ+tzxSixYaW9ElHHUjKWEuXQ0n186XTdsODdNbAY=;
 b=UK7VRPo1kxYg/3YdlCBu1DKoGqwC4Vzm3KGIodk/H6mPF8goCUnZbQpm5WigZtP/Bq
 yF/Vu4XP1QpJc+qeeO+uPqa5sNO5WeWOYoG+ckkasdEpQ19u/aaEu7XIKuf0K5TeCy1Y
 JqqbkHvnQXb2iyI8I7dFkzeM9AvWUVSGTzK+aZkr+udP3VNG7Q46BMWkets8zvQpNR7V
 XHbN8MB2Ikd1lEZ/26n4OhiUiMS9nYRNEIOdE1FDlIQAXZawUq6NXR19n9QctEts349U
 6zEjJ37L6PcqByYIkHSUqhgajYA5OwAQFA0CWfzQUbgWuErce8/pQjjaeX97Lrde1yff
 Fg1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUx8EvcUH7Q4eXyecfwfizaYiHmnHn+iZ6DrI1X/Y/p5sb7WTu+DFPma9/sPrdZfFt39LS9JRrJDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuQM3AIKsFRXMYV8B8CgSCLQpmM/XW1VAyNxQIuAywBkuvQUlj
 aKUc95FKWeK1MYbot0EZXIAATI+gXZY7DyW2wCQqmL1UB1NElIId4MorPHueRJOD7blIJNtVftq
 riti1W54aJf0F3ST5GYA9rnqFssZbF7r6tNUKc8YAa1BJ5FactxMGJrj0atuN9J0hZaxygfA=
X-Gm-Gg: ASbGncv8m5aFzFaRsGxwz9QyllLT3epsDUxUwMOm1zWv8kPuytQDUXmBUxqu3TT0DA/
 hVcy+3j4k4qK/wUo4wh4omvRqHJo/w9SfhkfbLigjmtsbtJNuyW95dkB13KSn/GnJawEb5MDpBQ
 SGHMVzNr0I/H7v2TbFCeIciUuYMbM8me8pjpz8ql1TYKUFqzGM6czq0PovwW5ng9jwhtcXKBq0C
 5p3Cn+PFGFETNwB+/Wah6t4noi/ZMym7Fj+Xsf4kuQCABTZfUKvsuuLojUvSzxhUyXyemBBYQ7W
 nc+rfQQSxajCXSofO629vBr2RdD4BeU5uTNlrGw729dDwXHklhHGm5F/c5/aDY3Ltb7BIxaLjqZ
 VSE9CkkFG1xRqB4MMaRV2y7q0pxGUs2vigkhP6wNK7t1uhdUgTPDq
X-Received: by 2002:a05:622a:1a27:b0:4b0:65cc:f64f with SMTP id
 d75a77b69052e-4b2aab3c33bmr22432911cf.54.1755858886925; 
 Fri, 22 Aug 2025 03:34:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGitENoH3QIhDfrMsc85KABpbqP+cmpwOZOUhVCbOkZutTUgU8nZ46PieBebtYJ+AhzzSGsfA==
X-Received: by 2002:a05:622a:1a27:b0:4b0:65cc:f64f with SMTP id
 d75a77b69052e-4b2aab3c33bmr22432591cf.54.1755858886489; 
 Fri, 22 Aug 2025 03:34:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3513c9sm3554851e87.29.2025.08.22.03.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 03:34:45 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:34:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/6] drm/msm: mdss: Add QCS8300 support
Message-ID: <iza3iyj6ztuudm5rqfrxtalwxfghzsguf3pieulylebdblq7sw@divpjvwwvmsg>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-5-e9be853938f9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-qcs8300_mdss-v8-5-e9be853938f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2Nfq/swYdHzK
 ENV2U1kpkR8TrgrEx4TwKkaDOEdt7ag9CXZdz+hdAY05W7eX0TG8FXIFWcCxzbAmVkcvz8RBZeH
 zySRL4Eogu8A9DBN4ODPBiaJ83BxtbtvWkU7iKqPMH0nPOhBTbErbwWJyATNlkI8BSyguMUeqTN
 URG3TqAO/OXzHuupytDG839uCas2hI1eGpjFqDEfZPJ+w0oYcHxM7C9mYd5yq1KqiGp9gG9IhoY
 la9Ot6uSbGDbgpTsd8l6o/j6m6IAA6YJ5jnYCgN95+/eVGekOoswaFKPLxhFSNBbSDofxSjk981
 9v7mk0kLeE217+EDac9qvnzLdnXpS9x3+NXpP2xaA7rsqXU2cR+CLLYmvLmoXaIWImKEapPIZbF
 GRTw7qWSZNNT8PbiB4ZVpw42RIpIcg==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a847c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=PV2lBtblPjvqxubg-rEA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nQ_J2I-7QYpZQLGiHUv3tH3qthOCXkWP
X-Proofpoint-GUID: nQ_J2I-7QYpZQLGiHUv3tH3qthOCXkWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Thu, Aug 21, 2025 at 11:36:00AM +0800, Yongxing Mou wrote:
> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
