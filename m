Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6CDAD2163
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEA010E404;
	Mon,  9 Jun 2025 14:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vn7l4rV6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5612E10E3F1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:50:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55994Pi0001845
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 14:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gXXryfwVQKKpIclvmqazUHr2
 /hWdodYHJK2Hup7V7Y8=; b=Vn7l4rV6d1tRwlfrGew+pDVa/lLUy8xn8yP98UxB
 N6/weTZN304kA9Cq60R5UER39thPS+g+IxkYFuZf/80Jg0cfnUF8KRroc1/s4pYq
 WdUIXvU4UdKSzOaRboNGkgTL3B3biFoOSXpq8PZrMhG6jypUOnSYVI+8bLLMMDX5
 7y5qII6TD+Lujd1hv2uINMblOqrUJmsTefvtcx4BJurdxalUeCZq6VqxmdlJM9qM
 o26szVsf5mqyg1U1uWjoNa93Up8onE5xYUWb2fdgkUMvSSOmzUfQdD5trTMFTgwZ
 LdnCkIolm+douUQRGga5ghqNMDPsyUhmM5VjBe7h7xvMXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxpqm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 14:50:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d38c5c3130so372300985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 07:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749480651; x=1750085451;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXXryfwVQKKpIclvmqazUHr2/hWdodYHJK2Hup7V7Y8=;
 b=Ax5tSAxd+tAUNLpIhDKSKmDVwbz2zrRcgfkRRfTH/I1kcRdIR+tTubhF/Jua3/eyzL
 LEXKxABQ6uBgB/KZgXzvLJmDr0R2OeP5E4eghYyq3xCC1atXv+MQoLTFTUq3M9NPUVQo
 aWBAE3cNAvNUuePHfS1HSWMAKjJ4fUu3IprhmYnbGjCKDf2EHCJOkKEZlNEmrLHZxPlU
 rRB2z9OMuvBfbjMkSqDrhsVnSKA2o3ANVAU/FhC4em0bTndb5Bxne3gfvdW7poYbFJcK
 la94nb+kaYJUgXmFYxhqxN0tGYaToI5gxZhsW0gqrWbfDpOCmk0opRqHE8a0eH4yacso
 mj0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYAHPRS7OqgeCeGPbxDS/U7zuQFGTb4COwVOvpV6IeUUdS0uLgshHsfr2lWRoxofERlKzfIVZyZ70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOYplEvDbpQgrMwu9nxDPgfku59db4hTCuXnWdad6hvmyPrtTF
 74MUSMwDnIskCA7I5N/ngOMrpCocTPrqTXbBAHdlVdH4DakwJ+4nHr+Yss9siH+cdPrmlnU/5Ta
 t7t7K+plm4elvlroSOC23ntGXZph/YYvrWh7HEdX6AazIBHVJxTbcM7MbSQLVTQ0XOQ297E4=
X-Gm-Gg: ASbGncv1z70pHKgj2i2vSttAqvjCHFv8tY9Ymi2y0ERQ0N6yUdb3KxqMf6c8BkXRGCG
 MKiM9sf//ZkgIg1AyPs0z31o8FUzmX9Ky5MWkIyaPxy1yZ6gKBUQDCJpztq55XQaqFZ4zRQS6NA
 j3TQFRmToWgWK4d7bTHyItM2r7Qugk3yIPzpP8ow1/lKwLsL1gHP/kqSNNQrhvS6kMEWEWHHMEZ
 xDeCAcqFflwAUNB/jEPraI24URs8MCGjvFcBsE9cFwbzritFGpqQb8lRlD8L+6gg4PsPd/TLJAJ
 KnUAIXtqnFV46lYQHdmh4LvS0BpLGFDrv6CB8X22WcyHVhGwieNOjQjG/oieCfUKUBFarH+jl2o
 =
X-Received: by 2002:a05:620a:4151:b0:7d2:279d:c18d with SMTP id
 af79cd13be357-7d2298ec94amr2478840085a.36.1749480651683; 
 Mon, 09 Jun 2025 07:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9KQZ5csfFeRf19Lg6Rga4uNIbAQ4j9v76mKsnJL2pr8UbN8vt6wkRD/Yt3tovojhBPPxXCA==
X-Received: by 2002:a05:620a:4151:b0:7d2:279d:c18d with SMTP id
 af79cd13be357-7d2298ec94amr2478835785a.36.1749480651310; 
 Mon, 09 Jun 2025 07:50:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d7796sm1190964e87.81.2025.06.09.07.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:50:50 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:50:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 32/38] drm/msm: add support for non-blocking commits
Message-ID: <rznsg4feyxanhvggxtebilg3ukbcrv3xgi4f2ijadjqaeqfelo@ogib4gythj7d>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: _NVTIkdgynjXtWZUjL8y1tm4fzYvda0O
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6846f4cc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=JLTXKlIeVVy5508LhJsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _NVTIkdgynjXtWZUjL8y1tm4fzYvda0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOSBTYWx0ZWRfX6RCcco8ZjwE7
 V1YTb6vQ0KspP2hsA3o9ePcd97biHozP/kK2DStr7t6jb8nQbP/Ubzm1C2/xbW+A0wGTv2h2Z57
 W37agEwduDAN05jFcx4ZZG+OUq8fE9vjGbojB5nJk6WZXr7RMF3hHTnbcc2G6fsikRl6rkU5Zm3
 IPs4z++XsHcJjV06Fe5kDT1qGp48QzbZCS29ilAmmMxV0E3BxVpOcqFKXr8okYKsTT2m5RZyHd0
 tyyVANiIVRoSI5OB3Rm4GgpysrshmFItMwLRBDXTHbEg3ybwq+FqKR482bL31B4tsVKGepHHOuV
 AcHQlkYpGjckOK1yJDspTgXCuUpolynmdZqUFojIoUNNnGtRurEV2FhG85lH7dejm2tJ06YI2qE
 lNuc5SLvRRcFSwfb50mFgx0eIhoiGdswxU/dM4WwZOqyirBxrrK531ubFs+ZVK8U+/X4qOHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=865 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090109
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

On Mon, Jun 09, 2025 at 08:21:51PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Hook up the mst framework APIs with atomic_commit_setup() and
> atomic_commit_tail() APIs to handle non-blocking commits.

Were non-blocking commits not supported before this patch?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>  drivers/gpu/drm/msm/msm_kms.c    | 2 ++
>  2 files changed, 5 insertions(+)
> 

-- 
With best wishes
Dmitry
