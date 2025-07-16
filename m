Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830B3B07236
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 11:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4BA10E770;
	Wed, 16 Jul 2025 09:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K8G5rT3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A766410E770
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 09:53:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6Gta6025752
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 09:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BrRuWIrtJJsRpQld/wY76CeJGwT/OepkhOwph9UVdAc=; b=K8G5rT3VZqEf1Xsz
 L2slA5Scj2znACUJCnn1os3ea0JrtuofpHDS1HGmWV762DG14K0RBeW0OpHrlJG4
 /8zB7xOEFC6ER+rGOYjiFJX1NF5GTwCBe3ckDzwMxd7d2uiuXZ2ESduVj+NGZPsc
 kZygABe/78Kk3d3e1lkcIu+HLNpZhjcd9dsipjdP1HzyFGZsKk0AEjyhm9GvynDi
 zhK4bW6VQsRF350uyZ3MrOasq9Do3YON2XMkEd+7PHGRFxxoo+Do70eqbGyfjZ5e
 jIbooR/RsXlpQ+KkKhdFNJhuY2oY2PfGj7cjNoR1QUuOCoeLCESnryhNi31gfmTH
 DdbZtQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy37gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 09:53:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fac0b29789so19128506d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 02:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752659634; x=1753264434;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BrRuWIrtJJsRpQld/wY76CeJGwT/OepkhOwph9UVdAc=;
 b=PY9JU0vCdEKtYRRhaSiAcv9C+O8KyrexSIg8+dnitCDRR9etHkOCzPSKV22Rw+N//J
 +uM64305tpIKxj4hNS04Dk0PTynV5SVGRNrKjfJp7Az9OYAFPDbY2nrArhaNt4JJNMGs
 aKn8GQlPXs2BVjkMD+tboV5MLBVWGuR3sGH4iBTk8RsXB74o6Chkw9pAUE9DSNBlZOhB
 hcsi2EyIecTbIIGaG/GbDj/wilvSBHZjQn7LRnXQkD6BtGgOKUm7yZJx742gj271ulmn
 f17OeVaZ2oifKnojIthaDHatQdzFQFopVE35Psb4rVBcERrhSx7ctA2d2eWvotQcKnbB
 +MlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd6GUduOFQRdFc3aGWbWDybxZ4VMLG1amDfB8q3m3fXlc/brIJID697Fe3PFj4KCg+eqiO3jyh4Sk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDtQccCFNsqSeuWdSP5EVqM8wL+BC/VKC5VICAGJBK129IoMZ2
 Rxtbc4cxsJElcj2z0vAXcXcAH4YkjnnRQSGQyYTeD6j4TiSTJ/LebTtNjlQypz0zzt5xGWs7Zxm
 Pm4eiDD+q9BiQ0cOx2f3mwsXyFBGKWULbEhm2MPki1hLZw8OvxCNKE+jNvoA4YQ5DtjTFB5I=
X-Gm-Gg: ASbGncvza9ijqQHqoJfT/BA5P3uMgjD54njiUynyn0Nlpu+Ras+phF4V8ESw2RpbtL9
 NGnaP6X2KMnfbr53NQ+smZ9uMYeIG4ML/8k6tfDH5y6hNMjDmb5RtpA+3H1gIioS/I5Zjxcb3lx
 XDvEvZJNajXqrCBwbjXvrPDOs99vQ+51gUjSlBdWNgAf1kTY4vmQpWNOty9MnS/pmACqJrjwxW6
 NzyzEfLKpRuAwPmSMUSWK7y+CojRUhNbwnUJhTu9LJhSvHVv2WgdKWIRlQsXRJjGWpz35hLff2A
 mxnydnDuXCjxR4Gy41Apn4fZQvsKBIk6Gqfu27cREU6PTiGkWzOLwKiZ9t80k/iCaBPWOHSnkVR
 NznvnTjDaXxMyf+CNUHoZ
X-Received: by 2002:a05:620a:2949:b0:7c5:8f36:fbeb with SMTP id
 af79cd13be357-7e342b5cf66mr131697085a.12.1752659634375; 
 Wed, 16 Jul 2025 02:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkLEZzcnbHfPM3SUr928KwExQhJl+kNQoZGqThwXwhpNJlenla0nHYpg95UHWVYUVk0gHrQw==
X-Received: by 2002:a05:620a:2949:b0:7c5:8f36:fbeb with SMTP id
 af79cd13be357-7e342b5cf66mr131695185a.12.1752659633784; 
 Wed, 16 Jul 2025 02:53:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82669cfsm1147729066b.83.2025.07.16.02.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 02:53:53 -0700 (PDT)
Message-ID: <273b7fd1-2554-4466-baeb-792fd7967209@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA4OCBTYWx0ZWRfX+WyQi3kw7UCP
 nxp+8CPraumOrCWJytYdgvdpnaV1M4iuYtI/mgU2svvKyMBnJZCNVF888lr3/bxohz6SZJRdIo5
 yOfZkkOP5k7QeFboPpgZNeq5xUCgivLl6Tkmot04FPJQqF1wzxUb9MP6mk+jr4OJqFZgSXWNtRQ
 GAjIrL8JssgS8gRxcrSmqMzdxZ0BmjK8Qz5yZvo3cEa6E+1S6yDs91A4+mbFnOcjiF3CzMx89if
 qxSE/3OVqO85M7qKQopOzPSGs1gn9wCAuq5MIhraYyhNOaml27AVl7f3k27zuSj4cy24ekiQBsd
 zwJqj8ilPMEfHkTkNuL4wNkQwDKqY7FSOrlgirnSJT/Mq2oUdAdjs1QTLegEbRja2uKwwOWxkIC
 aWzjlISMxnlSK1631n1OnFMkrvN9bmuEVh11KVrv2fDu7t9q/DECHd/573fLVJtv6dLnYdFp
X-Proofpoint-GUID: expPw16HRLZzog0kBGbjWlmV1vhRJfJA
X-Proofpoint-ORIG-GUID: expPw16HRLZzog0kBGbjWlmV1vhRJfJA
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687776b3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=GHZGt2_Oay3Cuwp2bz4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=606 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160088
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

On 7/15/25 7:28 PM, Dmitry Baryshkov wrote:
> Fix c&p error in dpu_plane_virtual_atomic_check(), compare CRTC width
> too, in addition to CRTC height.
> 
> Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507150432.U0cALR6W-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
