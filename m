Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0ACC67FB5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 08:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C18410E421;
	Tue, 18 Nov 2025 07:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYIWN+iU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gch1q5xt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FFE10E41F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:35:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI68rSn624106
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2Yq8woC8pgbQ3SOPgqnbBsipou8bq9JW5nKurx51oso=; b=QYIWN+iUuJNGbqN4
 oatlEUbyw73N9pN68K47xoblc8nwtDTSX8bptoCYdafw8L0dHJ4yeWaswlW+FVGX
 ZFe8vVMBHNjmxydQhbctYLoOSoU8IjuStEkoAEFhD19veTeXWNmdJWLQmgI0rmHA
 RxOyvjJzr6PJLtEp9c9/bMNAX3dDn3jOGPhU2VmoK+Ku/Q7jCIjiKLnsDAVXfx2Q
 cMA5bYpcv1gTxdg842Bjjm79Hw9y191RxUlROYp6BaAZSeeLASnL7GTflNE7/aHx
 9f7u2ndwnom2hienlImWeX3c7atKuiN30qcZvDDOlPN77iFfISstadrs8WFKWmb8
 fse3pw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahf9jm5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:35:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-345b4f2a8e8so243344a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 23:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763451336; x=1764056136;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Yq8woC8pgbQ3SOPgqnbBsipou8bq9JW5nKurx51oso=;
 b=gch1q5xt4qwUAROMMzphHI/nbnsBx3rIAhWo9fnV9ZDVrF0Ud1dLqGvJWF6KdaJull
 pOSni4460jFvRcTRQdfMdhub09cZqvjEC7OmSHyIpT+1RcIKYSD4J4meN5AWPVXwIGz+
 aJn8PRUsnSnVU13D0z+CHF7SYGUhINA0puRgjuzn9NJNg2+N2QjTQanbT1Oos/uwfRwl
 5DDRPisRa5GNoC2rXnCeCUvJphID9tEf5kr9H8/E+S3d/lnPz89PVgrKzf07OlyMA6aS
 C8Lv0BZDMIsqwkx0O1T/UCedBzeepPovASRSB5bk+bcTpmBiyKnUlIRlTviTEZ92Ovu0
 LsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763451336; x=1764056136;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Yq8woC8pgbQ3SOPgqnbBsipou8bq9JW5nKurx51oso=;
 b=lziM6GUZl5EA6KSGN1AQElMuU7P6UKXAz6/wtZVtD5mIN69Iu7Wtd+psjsC8DDdUfX
 XIts1dYENqpf5VrtnfCpvkWya5cOi8Q7msDNWST4CfPnRX+x21W/EOb3KT3iszC2q2c1
 MBr9gFkRQsj+/BsV6Jr+RmK6auGYampjlF04H4+KpLW1nXfSPZntKhsW7Vlu3scuAIxA
 YMelcuEOQQyiFc/PKA/EohMBXM983x/95ri76BddQ9FnKvAnR9fLjsGhs46fsmywGvqB
 HEIi96oZp95Xfs4aKIAy4AZ+gf059m4kbJuGEb8LxmUZyjcJHNMKFsEM7+GD3PqeAtpw
 JOJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWib4lv8VmOKH5w+c6FL6tppszDBSLo79Otnp/wECBIg9rTbzWJojdLpdVQ/byHxqQ9t36ihAIAXgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrHeV3MMtwq7xNUv8qybChhshgaNH0zyUn3F3SJu+bawuG0p2l
 +1ZuJ1NhhE86A0tMPW7GLEUMhgUcl2PY5gUCM2ObcPu1XIduCGIy4dq/rBVdzSBRoq1zGYDQQgA
 BNbX0l560KEEGT9czwBoFfpR2w2o67j7EUNuY9xxkhllB6pcTN9vkT0lJ7KVbQaOGBq5kxLI=
X-Gm-Gg: ASbGnctnE/3hOvU3IqxJoXNFXRiZWIkLm02DmlL6W+vG5xMAIBwXd7McIe6xioQc0xj
 jWchn7syZoCojsGJkg4GvkiJRzZPgqP9hcW6BOzvmywHaJm9Oi1fYQ0i3YcI7wjzWst/uyATCIc
 6CUdWgTMJdj7vARMoSDQBc+9woNP0kcG6RAJuCo34tNHsPmF2krHUnHV6evJS1KZv5W47fgUnGC
 Nfxl0o7oso+gROCiOFalyqxHe7HC6oncumQXpy1QcxQt/SiQempb92HYLcF08WYsGUW1XLExnG1
 F+g6FgfuZpnMACxfBr/sWWd5pl30I/a1HNqUlf7pwkz1/DD/MSG95toVWzDGl9QBZ3wl+oDjKRM
 yKEoon9Is++orS8PJukIrWVv/ZtQU7IRWjXioH4IW+VVwA1dnH+ZwyX4KQVEQ
X-Received: by 2002:a17:90b:5405:b0:340:a961:80c9 with SMTP id
 98e67ed59e1d1-343fa74b8a5mr16652638a91.30.1763451336264; 
 Mon, 17 Nov 2025 23:35:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBoN0HzW8pQq/whBUvfkVN5aiUXblrVdghEnXtwzRxzuYGPyg1BqfuJZkOol16XFTb66lVSg==
X-Received: by 2002:a17:90b:5405:b0:340:a961:80c9 with SMTP id
 98e67ed59e1d1-343fa74b8a5mr16652601a91.30.1763451335790; 
 Mon, 17 Nov 2025 23:35:35 -0800 (PST)
Received: from ?IPV6:2401:4900:1cb4:7658:a83f:a091:98a7:4ddd?
 ([2401:4900:1cb4:7658:a83f:a091:98a7:4ddd])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3456518b32bsm11932558a91.16.2025.11.17.23.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 23:35:35 -0800 (PST)
Message-ID: <8d94324f-80e0-4952-b344-23740d1dbf54@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:05:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: adreno: fix deferencing ifpc_reglist when not
 declared
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251117-topic-sm8x50-fix-a6xx-non-ifpc-v1-1-e4473cbf5903@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1OSBTYWx0ZWRfXzEFqubyG8bUm
 7kl9eaO05yyybVDPY//JUq/OKXrVJLlrCEE7F6ucF2g+T1aT5TkOUTVEAySwXNO9C8s3iNASrMW
 7usSzubzoihzc/jv8nYhS/FIB9bpOHjMeVBw34oWmF6De62bq22i0pHEOBwgOXpL244AvtXpdeY
 AH+S9R4JjfRk3kGlHgdp6LMOst+BR4EcQsnzlJLLcsmIR3Pl/3rFQW12c+oSdJH/rk3aNkFnIku
 cb8NjZlLIaIEIu4ZP/XVVpBfd1jK8/E3WP48ywZTbydRxlji7NQITNBw5v0MU7TD9AFCcLEhr1S
 6VK9+5Y3ZBW99HxZOY8jjLvyeOuU6OZzhunBC7iYqgNpnTUiXwr2kJnxyAs4kHYix/m3UzlxOD9
 dmcLMI9hdQzsOOnflRIlRO5iw8dJTg==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c21c8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LXHpuTL_QG3F6QEsHmwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IQBqIlT4QfDWl4izVgQC-bUdcshUzDQk
X-Proofpoint-GUID: IQBqIlT4QfDWl4izVgQC-bUdcshUzDQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180059
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

On 11/17/2025 8:21 PM, Neil Armstrong wrote:
> On plaforms with an a7xx GPU not supporting IFPC, the ifpc_reglist
> if still deferenced in a7xx_patch_pwrup_reglist() which causes
> a kernel crash:
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> ...
> pc : a6xx_hw_init+0x155c/0x1e4c [msm]
> lr : a6xx_hw_init+0x9a8/0x1e4c [msm]
> ...
> Call trace:
>   a6xx_hw_init+0x155c/0x1e4c [msm] (P)
>   msm_gpu_hw_init+0x58/0x88 [msm]
>   adreno_load_gpu+0x94/0x1fc [msm]
>   msm_open+0xe4/0xf4 [msm]
>   drm_file_alloc+0x1a0/0x2e4 [drm]
>   drm_client_init+0x7c/0x104 [drm]
>   drm_fbdev_client_setup+0x94/0xcf0 [drm_client_lib]
>   drm_client_setup+0xb4/0xd8 [drm_client_lib]
>   msm_drm_kms_post_init+0x2c/0x3c [msm]
>   msm_drm_init+0x1a4/0x228 [msm]
>   msm_drm_bind+0x30/0x3c [msm]
> ...
> 
> Check the validity of ifpc_reglist before deferencing the table
> to setup the register values.
> 
> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Thanks for fixing this. Chia reported this issue a couple of weeks back.
Probably, we can add his S-b tag.
https://lore.kernel.org/lkml/CAPaKu7QvBZmx0b8SDBY1H3u-Em+0py0BrGkmrfGUXkx1uQrg3A@mail.gmail.com/

-Akhil

