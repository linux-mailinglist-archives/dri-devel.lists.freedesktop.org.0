Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2BD2879B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 21:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66EB10E09D;
	Thu, 15 Jan 2026 20:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iA7aMjY3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBpO6Rc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457B010E09D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:43:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYDfq1722673
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Ymt/FNPZnm6UNMpQELfRvR9w
 AD80N9Y40dRUzLFP0hs=; b=iA7aMjY3r6l9ZTZWldzvYZKqDksV8JUcmC7zD575
 d9TZjgzwBxJvPi4jjyd2Iabp9vTegm+w0YK+sUkSIhuHJX/zxHjoK2phqfywq+Y5
 MkwjfgHi0viyyovn6lAsvQMR0BPx47NTKutkz78eg5f+cxyfZ1V/AEqoyl0FUcQC
 RMnX8/qSth0w2qYrf7oRXcVOU+wZ/8xwYMqCN1vBTcbMcd9WKRV22oa/26iypw3/
 gGK8ryFz3RvVwui5mnqRV6qvHtG7AK/rKKocDLGAfcA6mSFVm8osx3kY+pVmgQB+
 NUIttHPzwCiL1ivukwot4mLhOu8u3aUYhN2AdqaZSnggIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna2dv1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:43:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52dcf85b2so517021385a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768509811; x=1769114611;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ymt/FNPZnm6UNMpQELfRvR9wAD80N9Y40dRUzLFP0hs=;
 b=WBpO6Rc3hnuP+1h0gUEsjgpVM82D56BVD2d0pflwQUk/MHmP8CPSMVvmzy1d1pwWlc
 aenSjQ5hRSPpTQNB6OHLoIADcZ7qrp4vYAnbhh8MrscJetX2eefT0+aCPnKR3btqcUL0
 2hXdtFDN5aDMmdTlJjReknlpLnAtCobdfGbIAwp8Mx/AqN0QXlptK2MSkC2qOtO4dk3x
 619L23L/CIcEh5POVvy9VvuosSMS8kQhec/IcN4wDDz8z6ZDpLDhb4Hg4c0Svil7j055
 XKNFvkxtVXLaW1ygnFrov1KLz+oKsCyZKG3Y/vkJqAr2YuKUlG92aX9Z5IhxmT1YoZXp
 u1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768509811; x=1769114611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ymt/FNPZnm6UNMpQELfRvR9wAD80N9Y40dRUzLFP0hs=;
 b=b4Q7OXbVlI2WB1gCXucWUCKA37iJcjfK4MOMBo3NppFHdMoaQsFJdxA5ZofZj2FzbC
 5v7ra+3I/yVENpJ+62g43PbEunsTNtw6L49smtdA74U/FeXp3DtEM64kitg15oGjjn3B
 yvSnNCoehh10C2vZe/b1Ih0KcUIYLBMrSDAk68I7kOCe6IsLZfJJaVAMYe+twzZ71afY
 G44VF4V2RsaksGcFWl/RPt4egyFAiJOT9mJWrrDti1dCGlAB7ceP+v92KAJStVFEhNxD
 tCjUIs6LpjLTOzzOIV4LQWkvueMFnCPqp9sJvusrS0HIvYDLyUwVD0RzWns7m8IDHvUO
 Odog==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8+UlG9CzMXYNs4EHv07VDhmY2QhdeHyoY/Hb6/3Imd9+kNXZOgZtDixyxlYJuZwd1jnhQsCLyNKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQjPYfn1grX8EgwAPso3EDYXHcPYWgU2PpOrefi1bLlvJNORS+
 evPNcmXb9+cxhmzD4so59XXdlizP8s5MuSc8XznltzAOFOG8oOWYSxr+Ze7gO4sAO/Rp/YWwKZ8
 /uCcr38tUincPMLBXX6CAfqcv8tDk6oXxUUcuQcLbb6tPW2ZkKNxpWpvaNbAea1FATwUV67c=
X-Gm-Gg: AY/fxX6fVi3nYFSsWyH5gNpjodEknRrxvJj5MBbikJjMwKGKpg+WGsh4tFVp+c8q8DR
 kupZR5DJU4gIn+WNwhOnv8qDdKY8aHtWiWugYDxRENiWfuvyOEqblZG29CEjR8W0CFbSVHO5Atd
 9QvMsDxvC118WHuFMz7SSXU6NezXHYy2n/uEFAwUtezvIYyqBXMqrZCZSLAH6TiMoC5czcd9i0B
 oYyX7gZruLZaaQSgH2jYGrguBZiB1PcQTVRWcHyBpnfvzKLQagVMb3u3M3Pc3lqzkYDiOCj2xaf
 gG1rK+YkC39KHMbEdsAuIDjEEh5qVqPcVRc4xvfKCPb1N3LGo3O+c9ZkCXXCWspR05esBM0ZXQX
 Uy8luEB+jXM2cQ2jPsz0PmlpD8oMP1bWc2tignavB7ASvLAs6fu7VFnKhtFVBXaqRE6D9fJIMzG
 bOSVMLPlB2OKbTkRoLNb363so=
X-Received: by 2002:a05:620a:2802:b0:891:a6b0:7cda with SMTP id
 af79cd13be357-8c6a69631a9mr103535385a.81.1768509811670; 
 Thu, 15 Jan 2026 12:43:31 -0800 (PST)
X-Received: by 2002:a05:620a:2802:b0:891:a6b0:7cda with SMTP id
 af79cd13be357-8c6a69631a9mr103531685a.81.1768509811206; 
 Thu, 15 Jan 2026 12:43:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384f85c18sm1440881fa.38.2026.01.15.12.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 12:43:29 -0800 (PST)
Date: Thu, 15 Jan 2026 22:43:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
Message-ID: <6usjefc55acdchitwe3usqtkr6ca4rtaen3at5knwygakdkze7@caqxdadvnz44>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082851.570-2-jianping.li@oss.qualcomm.com>
X-Proofpoint-GUID: QjGXWV4Qvbi-r8zyLiz4ZDF42ErwMLx7
X-Proofpoint-ORIG-GUID: QjGXWV4Qvbi-r8zyLiz4ZDF42ErwMLx7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2MiBTYWx0ZWRfX4jMY2Sbo/ap0
 YE5sSyeRu7emoGl24gImhQrU/MfMmKsWhM4hPkprJWKKj0ZB2Vqo+QLg1Xy+1KMpRMuQjTPz4W7
 unPmh66tjz1BqJQUsAvy3NKcGrDwp6frrMQ20trsTdbZwlvSMXkR8xGMbjnrhq602C+I8+1Uufy
 KOH0tbEbkGK9X3vay98Y9Tj/rg+wTs+IEujUJt1qMfXrMRW1tvLqtzisibzqVx/6dv7jXhKfSJ4
 jO9fFe5xdMVt3OFIJGqebiug22DXa6oNFiPye+cZInqQKzJbq4Ral5A0Iy4AiU1NsCIdMy9Ji/B
 Yn8WqNyyWfxUM9hoD5+84cyCLd7jB5o2b9F+4ZpdtHXsUhX2BLMvmv+DrOsiJuprdwZgjcux5eq
 a8ltZKvkkufiqK0pTOOyk+m9unnlawZwdgqHt5PpauqfC0Bs5Omuk7FbBsMgMs4l7418sbMKyIR
 FQOjsEeUeP0SagRfulg==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=69695174 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=EmNSPOy90j3J4AqDr3YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150162
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

On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> The fastrpc_buf_free function currently does not handle the case where
> the input buffer pointer (buf) is NULL. This can lead to a null pointer
> dereference, causing a crash or undefined behavior when the function
> attempts to access members of the buf structure. Add a NULL check to
> ensure safe handling of NULL pointers and prevent potential crashes.

When does it happen? Do you have a backtrace or is it a safety coding?
Do you pass NULL buffer pointers to the function?

> 
> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

-- 
With best wishes
Dmitry
