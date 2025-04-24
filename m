Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57DAA9BA25
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 23:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198F310E86E;
	Thu, 24 Apr 2025 21:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5cOLPW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D1C10E878
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 21:48:55 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJn9DE028320
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 21:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vJjKyI0rQI/9msOKqrosK9Bq
 uNXjcnMHw9Fb+7VsjdE=; b=P5cOLPW8tJRX6P/90ulOi4MeADMGmK9LLjAGy7y7
 0oI+UnDh0e4YfWrxqdBohtrb1TDHB3Kf7H9wFjHG/keMJFsWqfoji1fYIMikm4SW
 XZIbBw2qmwVHrVEcQfah8A5qEelf4WPPY4nSB5MygvuPs21BV+zU1JgR/TcXsJ8p
 Pxc1f1gNOXV2HBUxDOlEePVL27A9uo7kWMsRegqPEQ5EEy4i3bOVPkDwoqE4JREg
 zIwLyeLbBnXkmfH550nYhtvfrszE1pVGbjxNLvAHZkix6ZzUBJlQs6cQC5iVgZAn
 5kvTW6mQTaQ4T8Unwd+A5UgiKTfF0y42gh097fPsfl58XA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0pwmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 21:48:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0a3ff7e81so263343285a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 14:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745531334; x=1746136134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJjKyI0rQI/9msOKqrosK9BquNXjcnMHw9Fb+7VsjdE=;
 b=eYRAYq/Kba3VJ4pfEqjYE5R6UyrWXZ0gDlL5F+XPt+rWWFRdpLc+RIwsQPtwf79eWS
 CvOcvrHDTg5xRQU2+OBg8zhkKKUpfEXx7bUvQdW6rybzeKYX07VvJJC3QUxCLd0zlQRL
 fvTLP0GpBusQ8YoxMl6UiwiL54NS++cv9v5XJVdmcehUYyx+0ycSV+w9DWqoFdW+V/Xq
 tTasREzK8BCE/ggHEPbK0bb83VnsE/W49xYBIi5I9mdqEyXYBhJGBO5CyA31cj8oGwVk
 F2lAKbrM2XwCcMeoD8PAB3MD+dFlfwIY3J82XQ59wJokvHYo5bXXr2/CIoAoiDtHr/kw
 YlDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7spVnBQAR8/wGKUNxKEEELh3MzkmVFPx5ECVBqPj2ylSVP+X5Xn/H82XyTNl2iBxehD3wGK15/Fk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXqOBFODBxOwkj2U2/cuXjZbpmIz0j/o7deaWAsxhnURmrTU+F
 f1TuDV0uv5nZKxH3HmPyCQCTqbBKVDBF87YOFA1rXyN0CeWW2+RgLoYkkzGzWe5JX5oT5MTTBTj
 QlDu5u23sSQcG1OaVbF9vcV4w5jM35OF1czL0N89ympxgrfhOEDcb553RmSoKAZ5uUNI=
X-Gm-Gg: ASbGncsOVnrncGMvGzL62H25+M5fphc4CJfsJX7vtu8jiqWvRwv1EyQCeLgQ5Xt0XX6
 ifW9xyyiZrEOYAfDPykowlh+zskMATf7wqJ0Z/IrA5Y6GtFKjoGJY4GtuYzqCCNWlWi/6pVpZWS
 tWn76Xk/XmPWT8/P8piv/EPwIqmfBvx9UecmEOTH2bjnVj/Z0ioNelzGXxDPLHCQU2MOLmrkiyJ
 WhfytLQOE/BTW5/G4m/hc/flwI3YdnqdspybQf1W9+WSXGADkr+SFHO+CDyq60W5MGSBSi9Ls+R
 XgBbcb2lWEmunWlUkpdEyxX2QPM8yt3FGAW/cZWaEsajZJUkcwD6eUBHs03RU50ctZtFCEIluHM
 =
X-Received: by 2002:a05:620a:2a11:b0:7c7:aed7:907b with SMTP id
 af79cd13be357-7c9607d2caamr24642485a.54.1745531333788; 
 Thu, 24 Apr 2025 14:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0qarO4qVaIHzjVmmbkwRDLZaton6bL+gzlVk0PfxAhAHsQF6WlByLxtZIfk0z6pubJzUsMQ==
X-Received: by 2002:a05:620a:2a11:b0:7c7:aed7:907b with SMTP id
 af79cd13be357-7c9607d2caamr24639485a.54.1745531333520; 
 Thu, 24 Apr 2025 14:48:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cca7fbbsm364985e87.159.2025.04.24.14.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 14:48:52 -0700 (PDT)
Date: Fri, 25 Apr 2025 00:48:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 1/4] drm/msm/dp: Fix support of LTTPR initialization
Message-ID: <num3gu5gfpnu3hw7ofk5ado2hnmftgqw3jfzlp4pi4yganugvu@ntsyr6lwry7v>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-2-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-2-alex.vinarskis@gmail.com>
X-Proofpoint-ORIG-GUID: 4zjtSR8VNsH6eS2FjOztuRb17hzCCyma
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680ab1c6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7ctMvB4_1dO5SEtod34A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4zjtSR8VNsH6eS2FjOztuRb17hzCCyma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE1MyBTYWx0ZWRfXyCUSCmikDcZO
 nTVVuZLceXFWF+jFxOb29IYK4T+4lfACj+maQj/ItWLnKawyj8cCmloDTlqeV6oKBQpsTNnuDIY
 CBNDMz/7i/bVmuiop49mulU1tSfSdb9xhQBuvDj6eqD7ILRVj6lXLyRDHX5mnVLWa6qv6rMuXFv
 9A5oLR0X1eI1xKyJQRjXnZO2OP/qHOY4krjnkl1OdwNnQ55qTaFcYE/pxLambONoVLmFGvWhfsS
 M1BGS/tJ4lq3jD78Rz9lf4rI11Ng0FmSUgZKlfB1kesOx3/9iqvRBdQZvt5GLEKHqXNCD9/ahoE
 4xP5efJlSaqq+o1fhVnJYnWqj0guEJVTzX8EuR/kCPl9EhnfGjeGSc+KFDOvV+Ul47DRq91AE5T
 1SbuZTBf/caVscLosvwF+WjDVC7r6NxPwNdE8RaOQuECsJP7hLdDOHZKp7AvTlWYXrePLh2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240153
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

On Thu, Apr 17, 2025 at 04:10:32AM +0200, Aleksandrs Vinarskis wrote:
> Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> Section 3.6.7.6.1.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
