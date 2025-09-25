Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7AABA1C75
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 00:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B7E10E2FE;
	Thu, 25 Sep 2025 22:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNA42WuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F7910E2F6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:22:12 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPsTg004166
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jRfNzZCnLAcaDWnEKn5/jyR8
 JVxVY0FW7A/2m5ca+aA=; b=ZNA42WuJqPUVqpxupotcXOSumqsGQeqSTS9bIWOT
 CGdDK2bPRKCjKOU28jFPVGSaR0l2q2VAwm4qc5UaMvaj4Raf1iuRJRvHDmvayXsz
 mSyEmWADs103GsYG6UOzNp+qUL4PmHVyDmLYi4fswJJxsXPplAshI0g0azKhoO1/
 /EJqarGPth2iqP5D50/vTFy30MYniSxbs4d3CIV1FXj2uJTfhiZ0Fyp0mD/4bv/S
 SsNkVQWnrx19iDWzDS82A2vKP22k0IQXgflA0Bog1MIFatQPfKQ1aRP5zKJenhEc
 qsl4Q1LMsXztc7W3eE4SKfzxFilm9pZRc/dDuVenWZgSdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u0jm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:22:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4bf85835856so40258831cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758838931; x=1759443731;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRfNzZCnLAcaDWnEKn5/jyR8JVxVY0FW7A/2m5ca+aA=;
 b=gcsJt/V32tYMqQwmkLCGBBbYaUeIdEwpTSekVitYRjMyMqM6A8A2E4mJhu9AmaXQUZ
 NEsdJxgH2MN8bZCIvTSAIu/W7LDUWsh+k68f8MRJ5xypOhmm69fuk1BoIn+jAA4GMdo6
 ybfcyMfZZGbjUk+UYluwbjd9E8Em8w4Qx93arJz3Bw+KEFEwvnh7Lsalfmv9aW6NYhHy
 nESJRnPx6qoFIW11hETbGC8Y2WiHO4iQnOJVrTrcu9iacW0cOO2C3nZw3bVsmKcWkCqG
 wup9SMNUtGLSJPZfmU0QZpHbkIDaanxH4IGx3JYIxA/2pungrCla2J8LGVzHplvNy6n3
 zx7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXprEzxxFhyDDUAx+0lV9Fug1eiyfK94fnVzSQavKI/QmqgH0xol6AWFIFM1sHzEKiVtW7cbYZEjVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm2ryLgkM7rQfjCersphklEZyP9Vaoof3ti4lWIoPzISwQZVE1
 guFInQV3xOv8fF27bmHbJhA+ia+xlMJw3RwwB0DICD1DKJExwvX8bcoUHzr4wUzBa9Kfl8sqiFk
 ECCCyxOrbiO7gHNgnHaUP0XgcCFxulPAJC6/IV4VkDoXtfPHQ5n14FE+W/EAY97YXCjnhN+IHV1
 XuaRM=
X-Gm-Gg: ASbGncvE3Qs2e8FS9cGJkEe7HoTW0VWQ1WOcIR+3L9ASdb9q/NN6bT+Htkbs0LRIP1S
 gip9eNSLCZme1EjF0xQMWwIbUZCZs5ae/QJ/djeRT+M73Fu68/K5t2zDtvZMb9hnItLMdLTEBWg
 rBCbM6msjLNNf2SU7f9y6+t67GuKK8KZgD/SbCGFqOVwPGdPjCmnjILTbWBRmRyn/vnoEcSmo6l
 MBa1JsMA4eymp2f++tFGFSgsq7CbucJtPAVrc/OSj+NLMxuwUb2mvyPQmXIlk2DPHAf4BmgQtEG
 TovKx/7F65JV7/QKnJbqmOz3iYwBY4XaSfoBFWxru6uDxdLsh5KFZxkN2g5VNgQ6NZPu4G9Mhww
 mWPzHwx8fJps5gteROHKHgx8yU9ze6ctt5l/+uDWHhi5hLOVaVYrN
X-Received: by 2002:a05:622a:4b:b0:4b0:6a6c:c8cf with SMTP id
 d75a77b69052e-4daca1f78f0mr51621381cf.15.1758838930635; 
 Thu, 25 Sep 2025 15:22:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO3r+ySgumuy0R8ZW76Gz42nyn6z1QUTob1YhU0jpfjtecRv5c1wNLaL6B2ApNmXtWNxgQww==
X-Received: by 2002:a05:622a:4b:b0:4b0:6a6c:c8cf with SMTP id
 d75a77b69052e-4daca1f78f0mr51621141cf.15.1758838930184; 
 Thu, 25 Sep 2025 15:22:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316a31df6sm1135993e87.111.2025.09.25.15.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:22:09 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:22:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Message-ID: <g7kqqed625hlz7yq5uwxyimfupxryr2et5jxsrmgw7jk5x5zg7@zdrgqf63n4w5>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
 <krinjfouhgak2fvrv4runtv4kbocvfjpwxq6y53no3ajo3ykih@ooucnj5peu7j>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <krinjfouhgak2fvrv4runtv4kbocvfjpwxq6y53no3ajo3ykih@ooucnj5peu7j>
X-Proofpoint-GUID: zEl870-op3j12uCrZoBFUN-BMIaG0NFz
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d5c093 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Nu1Um9oaDxGSo2OYYacA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX1PvBYXCybwyG
 Hx6pNoALHUciVZD6AxwcwU5LEQTxGI024ADufeiHXsIbTFT9ejTZBl1uMkfoKqiaUBYN7BKmpiB
 RmqmlUoMsbJ4mt05QE+lSKQiLRPxRPY4D9KbRRARYZF/7JuLL33IQNbl7DIgoCJH0YiGwS7vc+Z
 B24GmsdarFmmmDtMdNDksMFHS4G+AKD/pJODAXVSedckQ9xz1SPuTH8xRn0te2dtZ+bK2nrl0En
 VDQow9SngJxlTwzJa0G0tK/x0X969X9bUm7sgOEyegbGx4CU3wxryzjRyCCfOPXGy+zYAr8QS0S
 6MkCCZk60TKNO8wwxT6SLgToV5SouVo1/Q+E3PYkuwhrhEtf8juIZWU0zJbpNN1PKMEEtocqqHX
 H8yWDpls2cpVvV6Sb9YSfbBHZkPYQQ==
X-Proofpoint-ORIG-GUID: zEl870-op3j12uCrZoBFUN-BMIaG0NFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 09:51:28AM +0300, Abel Vesa wrote:
> On 25-09-23 16:03:50, Jessica Zhang wrote:
> > Since 3D merge allows for larger modes to be supported across 2 layer
> > mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> > supported.
> > 
> > Reported-by: Abel Vesa <abel.vesa@linaro.org>
> > Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Is it also a T-B? ;-)


-- 
With best wishes
Dmitry
