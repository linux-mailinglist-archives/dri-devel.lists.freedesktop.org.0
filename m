Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF8CD122A2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0282610E360;
	Mon, 12 Jan 2026 11:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0ECFRkf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVYCUkwG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75B010E0DE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:07:12 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C848hM3373885
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=; b=A0ECFRkfnPl0dXD/
 5Ee5jZF6mLYqlKbtPDk/brg8Cfrf1nuCvdXom+4ieEfcwaL/XlTsA44i/rYUTKxH
 T3b8fzAjPG2wY9onrDFkz0uYHbByeMphgdQay1Aty7/Y5+5zB+qj8poPo5xRGkzZ
 /lNnpEuljiGIe9Zt7uc/063Ho6hsBMXjJmCMUcYDP3RKgUGcU/4zC2e1M4EDVXlP
 KaHOHNrQHDG7AaVdqve52k5sjHy4/xWkjef3HbveDEvqtQpBsLqZZb62fOmLgAAi
 14qVbUK1ZY3KQAmSG9jJ4hYCHqaR+Tcq9ZOJK+WXXb/U4AdTrepsc4x+2JWM1mO6
 RxFYEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e4rab-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:07:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ffb8ac2cebso10738031cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768216031; x=1768820831;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
 b=DVYCUkwGUhEVDd+AnaIPmWSgBAV30/p5hS/pUqbiCFmEdPivvbfERWbX7BLp0Zt6P5
 smHr+9ud3FguL9s38/v8xbgWI/9CHAfbZD/DpniQjUaF7ZXhdNLigjDlJj2PBomfz+CV
 qkgSyLs+ChPuuK6XTAFIibCJvv/JYghVrEGNe2IMe2ZedyIi+DwkuFDCgNQkdooW755C
 og+06cBdwo/y3oOyxu3OK+HO4Djsx0TA3XYUqVdufJqIeg0qQkt/rtioUZqctsmRJnSc
 +neJNvKh6v6B3t1ifD1tZmGTkydWHJXFJz16DyiCxVxUl6ypCH9pa1mONpIK1QHU+vm6
 DfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768216031; x=1768820831;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
 b=kFi1ppLG2dyU69ke+iTptXHL2Giy2HjkzREFPB8C9lcH7KCdOtqvkrDhIybNek3amf
 2V5hEPCGwq2Cds/m8Vbpz0bJw+wN5NPH5JA3ORhXDb1dpfXzc3tmZgzE01bhosjbB+aQ
 R8vSWwRFbEgj4fmoSQk/2ySEah5RyZLmtmenSLdCWd3CGmdu5PDnIp7cKObxFRti1SWH
 8GxuDygS+xXjepVdU2ZzDh5KoXhXOmfVtFSnrhzUfZ8Y620JoJXvkqa3fVcW+GMYku7v
 8pwdZAVwYAI/gQbiDS2cZYD7DAMhzMEU4kkXsd7ksP7VLr2pRrflCB6hKqof0Wia+on6
 2IEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt+Ce/t8b2xmehg254rB0204j+cOIJR6xpU4gYcyOxYmS05kYnAwDhiVJ/klhjUNM4EikUpgdyF/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr1krwssy0YKgQxivC/C+ouzoMhRkCiwX5VKCO77vwhiuEWzgu
 Aakm7sBRIZBdRyTNwpFO62KCG1WSXjpYubmxByCRI7sBN9oFh9odxrlwQ/G6HkPGTawdf6p6OJW
 atTWtC5g5+BLAjF0dCbLR9uKfSkox8pyS+mnZN9cicTr0dd2zZunFomTB3v0PEJVXSBGJKG0=
X-Gm-Gg: AY/fxX5INGimeN2KKpSajpwNDjv0O5mBAVMPeuXkaB7a990BzOqniXgF921g+OIVCrU
 ft4TJup6K9w2bburn3jO9ax6hDv307p6XZb5ksr40XPgddpttH0Dsa6d8HkdGcIRdFVonb8UNie
 ASq3VKVM0GXfohFOHOSxPLHX1dXCMECak6knwIg8ls+N4e8DxMZS9kI8b7vKHcm24vJaE4wS13f
 K94PoYveKfBrQOxkEvbtuCdpaM18gVaCQBwuijsQjpPlXIB9oqSzgZalZZry5U1QJkV0Wt9rENH
 ldT0mzvjBjtc5XYbGYe1XEw3svZDH8X4rg/VnNK4XtxNjz8uF19Dd94vZG1zQtNUoVA1aY6pU32
 Q0052XDjNmKKMYyOucJmM6HEG0dG7LbOrzhauPCXfWPgf709rI19ByyQyfDT6ehrvb+4=
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id
 d75a77b69052e-4ffb490058amr190474231cf.5.1768216031394; 
 Mon, 12 Jan 2026 03:07:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8bZ9DLH4NWCdH7EePQEzlpw6QhI9kvYUV+M/ik2/g+M1Hc8pMsJCTVVcitzVSpTEcge8P7A==
X-Received: by 2002:a05:622a:1391:b0:4ee:1fbe:80dd with SMTP id
 d75a77b69052e-4ffb490058amr190473951cf.5.1768216030771; 
 Mon, 12 Jan 2026 03:07:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8706c2604bsm476444566b.16.2026.01.12.03.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:07:10 -0800 (PST)
Message-ID: <61ac4661-77ea-4696-bbc4-531f925d5fd3@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/msm/a6xx: use new helper to set min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-11-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-11-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qND7hNG3UhcvpV_Vi0q3VpPMtlHnNbUE
X-Proofpoint-ORIG-GUID: qND7hNG3UhcvpV_Vi0q3VpPMtlHnNbUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX+xQ8kgsLW/r+
 lts3YZXa/b4om6PfTi/9y1y+iry9AItNy7GkJuK0sMu4rF0hd9RKel/Fz/fQcFipnNHx6juSnb2
 JNzWcFv6LdyIrMmfnrfg7ld0zODPwpQWAw9tvaJcwlZhwXI4r4jXMziH47C2T/xM4CzSBqz8UJe
 LkZzp9QvBqwAYhXwMQO7XPDiLKD+Xry4wXeRLQVaSxAwtRuHwOuMEfo96HIiYxaQZGQkBw5RoV0
 vAHlqmzuDJeuv3RTknQUP6XHI7K0cDXRHR4X54ZHt/p2ayYFjLvriYXnxcp7fwzZR5Dekxb/Yhj
 1HP4tkFoeRhu4hLltRqY4KiK+YfTr8r94WL4p75o1BTu8tCqHGJIyOWjWXaf9LvoN8ZeyhqgB0Z
 wPDctK4OKzsxpcPyn9dLg1tpY4uNt/b7tDgCLhpBnlQxfCLpGyBCD3yvdxGo+o8RB3euOViTjBs
 6Gs0csj9RD07e3oi3ig==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6964d5df cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=su5gWXN3lQTy_5l37lIA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120088
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

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of hardcoding the checks in the
> driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

