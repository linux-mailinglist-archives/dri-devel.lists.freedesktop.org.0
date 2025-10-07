Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F70BC1CAF
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 16:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEB610E1A0;
	Tue,  7 Oct 2025 14:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuKS0gYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F9D10E1A0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 14:46:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET21D029255
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 14:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LEC4ZyCM611YcKYlF+4taxz6Yb8ay4YH9CdrKw/W4SY=; b=OuKS0gYQlYykFCRe
 ydh478XFaKYmZ3yWkiY6mWqISuF0JJx8tT4kYRFrCTgXagywcynG0eI+jIS4+o9H
 9PjQSwPqUkLX4vCxJZxJKBTe9YfuuCFOkPWeHLX9HPYAoumE7b97B6WxjRekPxdl
 Av6wwIR2e73zgAifVuBwKY6lvkEvHr9N1cTFJ+tbDSK8u/ZDO8hoDvLQ390/zkiS
 GX9KkAgHPQn91otEAKaIj4apfR3Krmec2k2LjP2wlgfp4QiuNhAfI0+AZPIFLVFV
 07R9STtJRoTxQXCr3QBhyleaJGhvByP2bK5Sz4XT/wdEGJvyM1FwiN+A4ibTVK15
 63MgDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkptd4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 14:46:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-27eca7298d9so126204475ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 07:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759848410; x=1760453210;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LEC4ZyCM611YcKYlF+4taxz6Yb8ay4YH9CdrKw/W4SY=;
 b=hU0FbTZ0fRnyaYpgf2iZyvM0OchmTLXfjZlTcx7BvMppOd7hPbwTB0+bV2JxDOLQ2x
 CBedxAOYyXhVRW7LPHR5O0TFNJiUA4Q1g2u/MNwc/gohEwlclt1/kqKPhVuwcdcDhMKh
 lkNCTEp7aouV6CEI2GnxtHy0XP0m2yvL+XTRJXEbD2zVdR6Z/jgFzQ5njk9/rEk+ht1i
 g3FY8rvX3LjBbFo/pdb7UnriUvb/OacYBM6ry//yspMvj6NHiF4jFYT7UuEojgSyTgE6
 LNJJSfqsyagVm62MlKSax0TQP1r8Z3SYkYwYhnntWVMyFCVD5jhMnW9OV4b200/kl0ep
 mJEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUph3yK+5u3F/3V9Xt9rWkscVpKKD32A2i3jNNYg9eNHD4m+mLzkCSt7C3l//2QWIl+L4N2NCOxiN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw7nVRcXeL5F+PujowgjhMxBzIhXpyH+YiZszLYTuoGBaJ4lOe
 cXd+MzN6KP+bh/cAqAIUub4Bn9fXf5mCPxBvlDGqOekWEDYKzIeVp3dFCkH20Drm5+b6mnez4EK
 NN3mX2W8FgiAuDi16mSIlYXR/uqC0auU47YI7Wzxbo7tTW6tcn5ai6ZMHQp4VqH6RLx6PGOM=
X-Gm-Gg: ASbGncuVKKNCsLfiLG6M/oq7qyL/QBYPjHsteDuihTD29InSwggE8+39AkISS3eNRcZ
 +oakQxrXXS8C+p1BDFkn6LBCysvgsufyrR9h4D0xFMODfxhgSW96Di3ZWbifzKKp7yCGAd2Ckw2
 QYN5JMdPVLYpY7lHyK7L5UMjctZ3UNLSAgSN97B7WN/ukb0mxgpcypGBq8NJQnIAGrgpwlpXTtF
 Xkoi09vn1d0qutyHtfDA/3CQLpKvSyxg/KCmVh1Z+tMnQT5mNc0wKxRNpl1n9b5xrxTaQmXqPu5
 quOmGmSwBaPNg8uPqOqLIHhyaIJDwhVJZ3CklfXmDLg3QP/ybShOTAQds0Br3GJXRrcnTx5XxTT
 ZSiUv/tFKnboatadXW4c=
X-Received: by 2002:a17:903:94b:b0:25c:7434:1c03 with SMTP id
 d9443c01a7336-28e9a564d75mr204912315ad.10.1759848410301; 
 Tue, 07 Oct 2025 07:46:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKXb5oNK16Sb0OhCJZBm5XrkbCmAoaPkWVLIx7vakbweFplqc18TdUNrPsKOAtUO79SY8Zaw==
X-Received: by 2002:a17:903:94b:b0:25c:7434:1c03 with SMTP id
 d9443c01a7336-28e9a564d75mr204911905ad.10.1759848409809; 
 Tue, 07 Oct 2025 07:46:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339a6ebd74dsm20191768a91.8.2025.10.07.07.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 07:46:49 -0700 (PDT)
Message-ID: <deda2750-6b8d-45be-b7a4-1dfd9d166775@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 08:46:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Update JSM API header to 3.33.0
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20251007083451.2816990-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007083451.2816990-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2fQYbkbQiLfzXq934sYC3TdzM0a_YsVh
X-Proofpoint-ORIG-GUID: 2fQYbkbQiLfzXq934sYC3TdzM0a_YsVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfXwiWqR6IXLZq9
 wns9OS+tvVs5Yix0dHv4ALm9cY/Zde2H477h8jfq4+AHx0Z9J9cW1nfCCw0Emiz2z/4ZDh0ULlM
 uaeppIS9cFAPmIUzsMs3qGoWCrsiSiZcmJLN+KLurcV9WbtNutviI2BYnklpbt2NbEtDDaFBsSd
 XYABL9N+N+x9wnSeTZpNjUDKl3soSO6D4V7Jh7cVVyWPIPdaPCBdf8YoTRdSa37xYIZFOXLfPaY
 JRF8Gy9sc+B8GVM0t4PoRoLttWSIx8Ee1nJiJUndRm75HmAQKpNwNW9Z+SyHfJKTnhhN09FfyUC
 0oaeNyIVVMbKbCxbt8yESsVdXEDN2rww+JGPVvKwN9ebArGbPSrGWne1R4BPmVb2mt9LbDDlKYL
 UGywbq7d64nMro65fPtFdKAK49LX2g==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e527db cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=MClQukA7fhNFIgzBhnUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168
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

On 10/7/2025 2:34 AM, Karol Wachowski wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> 
> New API header includes additional status codes and range definitions
> for error handling and improved API documentation.
> 
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
