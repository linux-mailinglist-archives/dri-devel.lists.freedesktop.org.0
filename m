Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123E7D1CB0A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 07:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330CB10E31A;
	Wed, 14 Jan 2026 06:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7MCmfJ6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jg09HAZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE1910E1C0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 06:37:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E663D11688531
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 06:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GCcmZoBzN/A3JPIeppt/PGfNgz11ZDMQFaZXR2up6DI=; b=P7MCmfJ6SjTJn5WA
 S+Ivy2xD7sKNHJkxILSng+KfJQrOT3sOR0vk7rxx/c8eNiv2IgNKrkFQ2vTN6Wnw
 CR9z7nHplebMmdjNOrsA5rqhAUxv7BSp8IN3bB650qa+8B6B99B3QiavNcbeb1V8
 qX9TtiST1LvPD8nVDVVBK8gMwhUfbWzvq5r/F0Mx4Q7YckEIb5Xg1FHFab03vi+F
 YcO4vUWqPozCV25NSIgsVyIARdSkqzjpX3Ckp7xp9mmBECiuZBuY+A6BdOHrkKY5
 2Sgm8bwsI2Gqg3VLQK+HMrPrOujeqLnmPr3c65SZW1uDO8rwlpB75UxIagre0G2s
 FJs8UQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnsybaeqh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 06:37:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a0a8c465c1so3867335ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 22:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768372648; x=1768977448;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GCcmZoBzN/A3JPIeppt/PGfNgz11ZDMQFaZXR2up6DI=;
 b=jg09HAZBLkCXwjOVCcHB5CDBEKMa1xHp3OKK9Z/YfAG6QFvrdNJ2+iyUm7Yv0Y/XIT
 Qhx8+Awfv8NkEoGJTcE51onUETUM8prtXDNfk1uCzlKOwk8ED0VDdeTSiUQUbuQrmtkX
 +hWyFATZIGW5vqs/FbbciYDBTJxuees90G0NLsIZhWpA1s/vutbD0X4CNsxYyE/WCyIj
 LwG4FEaxXWQGb9d3F0ABSGDqotp7hg2sGZ7gbEV5u9MBPpfpRU79exLn+A4JKT8UY26R
 ny5thy+XblEW2v5YwkPD9k1moD031PsQNzutqxh4F9JRtm+39lirXn5AhR4S8mAOfKmN
 6ipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768372648; x=1768977448;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GCcmZoBzN/A3JPIeppt/PGfNgz11ZDMQFaZXR2up6DI=;
 b=iVW6hlFuOx1mmZZx/eh70nRuNTW9uu3nzr26kL7gHCQkj5P6WxbeAeD75h9HL+hv3R
 E5klNpgYux0sX7vJAl4aEXQWLlE97ef8V0l98FFkW8Thsc9ncCB3Cnwcb1IYHsMX1qIe
 EO0jLSFC4DoA1dCwudDyI3jOjJ4ghrPQ3sG6duSBoecRF7g3bdi3/7s1B7T4ubbuFY7H
 JUqPd2IcZDLi4fEljZodKZb5vhS2pn+El/jAV5HrG/GtkynLssjp2Qpyb+wdxFFOaUPZ
 0Ic0XRlMEs+ycrHBMGPAkGZwbNAdjc2iESndEeAYuHO14+bjrsdLUIqfNxVIvcCjKg3l
 tuFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3qEvQUs2VKaXlXAyI8dQhieKqv+V7ntexWXmR26et5cWqr5ThkfRYTXTQtOaUZfxbiwxKHHdmOso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeiVaPjLeLWYbnd1qomF7lZGtpmdO/qsLvTYxvYDTLqK3RJZ6S
 HQ9VelEIQdzwa67y4bbVNuG6VOLM7c7br+iE56vYGDIGI2pvJlrpWMCjYKes4gtqkUjYY2SvZuq
 pn9Fkh7R4EEY/OZCOPAbevIvCkXDxKS3beKD2ClwW6zwfCFncr45SX/Zk4dhvAJkXo6TIqeI=
X-Gm-Gg: AY/fxX7qEZJO8CzhsARxj4XNHVhyVRNZyhO3y3AR8cH38K0vr2pdVR4ZPfYMA0EC7Qt
 ePL5iPD1c6TVTbe18KZ7jrA1JtOadax3QxDGjwQfJX3J7zqD57IjEyiBDxgyBBuBdwYuZYQYErw
 GsN0e0MtwDbdrfubGed+KbJrbHkF4Ax9XQjwdsROG9yRsXkseKGiJYGw8O+x7ZUHNsHwTUD9pp3
 uCmPw4zcFKvb6s9ongvWoZSsjqLf6lC/S0nFvy1zQebyCOoBC+6BWhhRWuZu66K3c1tWzpE9lzu
 KoRq6MqxuGeFkT56OZej1dgMxiOCxfGPx2g6Q3bonV60FUWxJnQQg9uO4xW0wW8g0ocPDqCiFNt
 qEZ3BQJtotmydHMhuxLe5JueDX/hJorNQig==
X-Received: by 2002:a17:903:41c3:b0:2a0:f0bf:197a with SMTP id
 d9443c01a7336-2a599dac241mr16267495ad.13.1768372647614; 
 Tue, 13 Jan 2026 22:37:27 -0800 (PST)
X-Received: by 2002:a17:903:41c3:b0:2a0:f0bf:197a with SMTP id
 d9443c01a7336-2a599dac241mr16267315ad.13.1768372647065; 
 Tue, 13 Jan 2026 22:37:27 -0800 (PST)
Received: from [192.168.1.7] ([106.222.229.124])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cb2b72sm218575885ad.51.2026.01.13.22.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 22:37:26 -0800 (PST)
Message-ID: <3149158c-a6c4-4c5d-9011-de4db8d1220c@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:07:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B07qYWPYwQmsuwHwF2NWcCVYAbIPD6ai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA0OSBTYWx0ZWRfX8UW1h2UgZzm8
 OgTtF5RD6roZPDNXaPAfmm/20xaabu4UbcLZbSBwGw7J6yiGFYZZ992N0jBiy5LU9yvJp1GQDUR
 cCKuxCOEnF8nxLh6c7bocwzzHuIhQEQl3hRMszHP72NfMOn4PPjsZZCklrJuBOy+ozuCqSgNuyc
 c6IvrOuxxEJiLjGxRr2HTRwEoAgElH9Y9+d4i91AAzqiieOCJLthfmuL71WNKu1Wo4bt0ne3+68
 DzxO9WYeuD7OSIF+zXkOK1oYJv+rw0qe/s/tkzgfQjJqh+b5Uj1xmqd+S4RvNssNf3uRhsTKx5T
 yOaEJT+zj4Rm6h/WmuAafVU9pLrpmzfWMEzG4VwyBTLIHgoCg+yHOHVg6/zE/+13a48bWSjpQd1
 gLyfh/0df425hNSaavoJlfCB7kDao03iDuhitaPPCmIdSTFrajOLCvMVG3RNfkJNuTa1KALKqjv
 ujP0VSU+J5T5t5EliZw==
X-Proofpoint-GUID: B07qYWPYwQmsuwHwF2NWcCVYAbIPD6ai
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=696739a8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZIcQe8sNaMnfUD2ODhXWYw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=9eDHubkGBslCoLSAWpMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140049
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

On 10/22/2025 6:14 PM, Neil Armstrong wrote:
> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
> the GCC and GPUCC sync_state would stay pending, leaving the resources in
> full performance:
> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
> 
> In order to fix this state and allow the GMU to be properly
> probed, let's add a proper driver for the GMU and add it to
> the MSM driver components.
> 
> Only the proper GMU has been tested since I don't have
> access to hardware with a GMU wrapper.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>  drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>  6 files changed, 192 insertions(+), 195 deletions(-)
> 

Niel,

Could you please send the follow up revision of this patch? Lets get
this fix merged.

-Akhil.

