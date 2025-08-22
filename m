Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871AAB31686
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 13:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E487510EACE;
	Fri, 22 Aug 2025 11:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwgxJk7q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DA510EACE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UZ7M006760
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5mw/UDB/7pQXVTX2eHOkG8b9
 9y464ysBkU4PLObgT+4=; b=cwgxJk7q1Je0QT4YtcE7cnsP1azGpggAmhfeZ+Mi
 cJsDgR490szXH+nqyumFgucJnIVpxN3Rl5GRNRcx0dHxNHetTF4oFROK8L4rwbmx
 Ghlv9JH7CKgqLLhdGhnUFqXB1d+e/C4Y/P7SDkWmr5Q1GqyzF0k+AK2CkWD/8kzd
 1aTmVG56ZXxbUDpLygK5Thh+HuxEqZiPP5gTI+bpblBZOBXqWu4KM19kna3wpM6t
 hjVTn1p19wU9J6IdeWM1jSY4e/s6TMRFdxppQ60M841sfXYhobUEKwZQg3ppo8xl
 SapH4849HNVdbBYuamJhIUfPmiE5Xr6r6WzTYJlTZLDOig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291204-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70ba7aa13c3so78606246d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 04:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755862971; x=1756467771;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5mw/UDB/7pQXVTX2eHOkG8b99y464ysBkU4PLObgT+4=;
 b=HxWXkA7K3CCyohVOfghuqLygMac/nLc90Mym0vJDPTM1uiFypYPPibQptRPdIgLNR0
 1c6/WzawoLlwW/92vEirlxNriXtjTeikirwrClpKLrBv/lXiKlYGOVA7S+Yli8zkHz1X
 JF+uhodyGmwCQBMaSWZgQMEbox5iG/nV67T5tFtbWVjWdppmMZPVgiEGsFUNKpo+SBy+
 CzujdC20Z3WzjRdj7FG0NPHLrD1OjWQ9GYt2TZfVCjvfQueLCsCDC6strNokye2boWqZ
 NSziAOx688sIrz2iG1XRAb044rkb9X8A0wUAO8XGbNVIlburrt1HcWejHv1ldTeGvP4+
 zNBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr8jN40JYcy0u7Bc0BpjtYC+rwr/BXsjaHsWv8Jb8ND5HrhrsGzzlFr3avkHDv1LlMLTORxEn36No=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhi1oVz3XvaXMnBx184/eZadSIHeH6pmv3+HIZoshO0Ome8dWF
 AVR5pM31jTekv9zSNa+07wgdud978ERymHYA1ozev1ts7z72Rd5KGlLBrM3EvaB0FpD5TnLzjr+
 1OHg+16CVyFS+yE/DaLb6RfCan9PpV4NpBbHVa6KINd8hY7/Pp7YpobhRmj+kMjxayjmthZk=
X-Gm-Gg: ASbGnct5iqJkGo4yeL+vRnhlsS4Juq1hJ1Fx1eesa6uNLvSCRS7Jd+J9QKf5ko17Eoy
 q7uUCXCfj1AYc8QhW1GWyOkNoKW9SSnN/MUt0o5oV8QOcBfunKRyRuzNNhclGjMv/L2q57Dq3y+
 ePoRjjrK7/WvAvW3ZldsZ2/Lv6ZyJO64Kj4U/RYWsNrTFUrbcaWlj4xRD1STjgs/RBv8Zw/w8KB
 AR0/OD+5HFE3GqFsavuo/kZZ6SfGEYuFcZJFVp0gw9zqflV9Nzo4az1rWZ/5wx9tSFxhKCf5LUM
 jx4H+9w2Wjg3FLjh59frgboBfFw2R3H+OjQPWSIQqgv3Q/b8QZC6IHrjbf1I9FquKYDm2jJLx/U
 znL5NuSBzr3NLVgq1NmZnqMC3+G6VvPEODSV+ePYuKVP7/YiVwuHY
X-Received: by 2002:ad4:5ccf:0:b0:70d:6df4:1af6 with SMTP id
 6a1803df08f44-70d97238c31mr25038826d6.52.1755862970498; 
 Fri, 22 Aug 2025 04:42:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0KTE4EBh/7HvpDzIMoDw2jPtywPhs513cF9E6lM3AxHNbAFd068WoyXeIrAeKelFl7dCsLg==
X-Received: by 2002:ad4:5ccf:0:b0:70d:6df4:1af6 with SMTP id
 6a1803df08f44-70d97238c31mr25038536d6.52.1755862970041; 
 Fri, 22 Aug 2025 04:42:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3354b208a13sm7287061fa.70.2025.08.22.04.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 04:42:49 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:42:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
Message-ID: <tapfkre772lrar4l6ik3houaq3ki5icqliu3tj4k34hvlha6rq@2tbmqra57bag>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-5-97d26bb2144e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-a663-gpu-support-v4-5-97d26bb2144e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a857bb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mhNRLu-bMZbuYH0aq7kA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ax5UQWXZat9nM_7U-Wd5CVbegx7mkaC3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8nsqcUZLt7yT
 JymlsYaMd9c0H7r+Hs59RcXSBXeJH/Z9YCwPkKBrI/X0EPn7c0DReIKHRgdnAQZQqtyrBGZAs89
 Bg2dCyoi2kpEhHbks9mI4KOHQ0Y+eErj5Av5UX5DGcF0tUC21PmT7LSLZxC8ytckW0HXEAdhzuv
 GBvf2hrAbd7w1Hts9ItQ9LWRkHxC45ESlNdwfGgh4dZ3KIZdSZ0gz6ufEevmc102bI8BMnv6ivM
 1DjomGxzQ+cuv1ZnP85ggRr5pK9aT9j/teGt8y9pZLG3qbgBIP4IBykU/S7gq0gyVoWDKKszbxF
 AVCzowv36w7B7hxFyoPTfW7DAeYdBKTv9O/+F9ncFraS8EWhyuojNwPD7C91m6WxPL7q10b1Krn
 fmamCPyqrUpD3zWIZwV6RxZTgtviPQ==
X-Proofpoint-ORIG-GUID: ax5UQWXZat9nM_7U-Wd5CVbegx7mkaC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
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

On Fri, Aug 22, 2025 at 12:25:30AM +0530, Akhil P Oommen wrote:
> Enable GPU for lemans-evk platform and provide path for zap
> shader.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
