Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8037EC1BB97
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4AB10E7FF;
	Wed, 29 Oct 2025 15:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+mk47Wi";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLAEo/Ln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39D310E7FF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:40:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TEi5Ai818429
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sCeGs3XSV/rs58q+vGbZCIsS2ZPdlsBCFsqQENwr6NA=; b=g+mk47WiZteBLl9J
 dqG08rqqUCi2UcGnFDQDaQNfJq7INw/4lpwy8b6XnQNZKHRLTuDK5iyvd3tBSHeF
 OZVNav3coJthgzpyPdSYMIbQgOSAydQ7dchSXPMD80SG8sj7m5ROmnQp9N2y18UD
 RAyBqkIvAouvSfl6TCbBSkgzBxG9tt+I012oWXXvoeZEKg/Ab33RdRIZ3syfSRjN
 YgF8XmuYcSKr42owPRKsymSJjpd4+O0sgkk3doQcnPBG+I9gIuvFoS49eFL1aXqA
 1wSC1NIM90xWF8kSvWCt+7Ji16byaq2s7JCPaj3ZZLhGw9wYJYXj9coHjXgz6Gco
 odAmWQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mxgg6d7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:40:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b6d0014d416so4410373a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761752456; x=1762357256;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sCeGs3XSV/rs58q+vGbZCIsS2ZPdlsBCFsqQENwr6NA=;
 b=aLAEo/Ln+6Z295CTMEaDJWS90tQstijQjtW7FAyRs18A9Dbl1Y9aaoC9KLm2gpqKpS
 cDoY5jPin7Ol9H8eUKscCIonegZ5Jh9orjHvMxxTv0+T8S/BVEjylgciGY/tLJSK1qGh
 fh8vuK40OlD+eZe0UXgaGTysapiakrEde+ACNfQknz5s7+bX2gbCxT50w/rHtKzjaJl3
 XaR3LWJMo4UtIUFGhe/vEaKTs1LF7h7kjRgyxa6NsnQ+/0bPMr5M4gQUD92nWQoNqB3g
 Dg7+Kerhpnkyplg0EqjLiaxWqlXG0qz9ZhpeWN+99RwREAVt81Mvntz/iY5mN6JoZHJG
 yy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761752456; x=1762357256;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sCeGs3XSV/rs58q+vGbZCIsS2ZPdlsBCFsqQENwr6NA=;
 b=qkFYcxldSSSRCVEPX8XgVjRUwFaPFITfp9LIdt63epDOZQybZzwRTLtqgYBDq+mgvz
 gbtZ3RNtUCauMHoJx9VF0mywB6NRnNUq6NYtNX819jH+0VD4JcHv2VA73dgy1RGisDG7
 fWpH98qfz/uwP6jOpJeRbwjEj+hj0sL2BSufn04kJJiL3weoVfn2YCo1AZKhJc8YOdYx
 b3IVmh71wl9q1XEjPo/dD5lsu4193YLBQIWrH44O8BD6bBHRq9dira6AP4DSTmJ255AW
 tsEclmZpA+A4yZKGNRndaukaYc9MLC/XPDyIwjLQpQgxXZKWNjavqAzNnWvaNyHFU+Hl
 GrdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMb8b8JtQ1YUedJgPOoOcjSj1PGzK2qDEwYAqnXPBlOJZmWqg1UZJQ4y+o8tfvCKzmxntxZLbdubw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI/+7ch9iJ6ZjGDtl5H27uRKuVrHP12DBxULiLMw1lI8STNtBs
 fLc2ho6vT+6j1Z50eWRAQdAiVEbPPrRQrunmyGQHbbo38xaRVpMzBczdJSUEA5YXlXKvHhbvCqP
 szJJiEzhol+db1Frn4Wo5C1Nboe+NUxfxsRkVfAlkUfkHQWs8riEUJDEaX4C1N4ITmihe0LQ=
X-Gm-Gg: ASbGncuLvoq0ggXHTTzWHeP6va2YDp3IYZ3AID7lBDmjSXp2meKKSFHqzWmpn90Ie1j
 OyoexcGU+VbJFR3j1yjNXDHFkrPnfAOSlF054tiGyoHRnY5OgPH71XWhG7+WIMsIxiarVSpfniN
 mrquQ/ucIcNylHJ/wUCdTyd06ldPWRNrh56OCmER/hmO/V8jk3v+f0myc52bwWsi0t+BbBq+d7U
 /pdQLcAffHCL1bS2iJlBQ5CDw6otBPTMv6RcoAjvtdhL9SHDfJTBOKOf1osgOY0c+K6N56U00Zz
 fz109iqClvNiatUpFhttkkt3RYrSimwhYLEE57abX42/baDGbGBlKjCgzlgn1x52xAFQ4OTvtMg
 XGNLm/zbwovdczUwfhbaBOst1fmdIgsYxgTVZOKNAuWsM1crWtXBx
X-Received: by 2002:a05:6300:2189:b0:334:a901:78d0 with SMTP id
 adf61e73a8af0-3464f8ada1dmr3878751637.0.1761752455893; 
 Wed, 29 Oct 2025 08:40:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJZDDf9pwu2FYUvSsIceeOtWJAIo5p3nPfeqRqTg2+NuZf41Il9/kuNyxdPIg55y7MZ4LH9g==
X-Received: by 2002:a05:6300:2189:b0:334:a901:78d0 with SMTP id
 adf61e73a8af0-3464f8ada1dmr3878682637.0.1761752454701; 
 Wed, 29 Oct 2025 08:40:54 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b7ffeab2617sm8729959a12.33.2025.10.29.08.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 08:40:53 -0700 (PDT)
Message-ID: <8d14408d-6a29-4c2a-a96a-24355bd2130f@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 09:40:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Fix race condition when unbinding BOs
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20251029071451.184243-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251029071451.184243-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AuHjHe9P c=1 sm=1 tr=0 ts=69023588 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=I6CEikiqoV9Z9warEy4A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: yHzwt9rZul2oTtFOg7aN95s6Ric1Hbhv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyMiBTYWx0ZWRfX7YYTf+Y3yGTS
 eS/mtrcyMnYJYwIyK+Wxe9dwX+mlfNOii0PbyeOGK+OF03wt5KUW7Xr4dz2FvR0PHYGIb6NtKEw
 25uzSh5EzN9qCWtHgs/1l2EktflqJn/t407YmHr431r+0n/OEGwjDYPJGLYJcaoNwCRFMkh2vPe
 jGc+47qmjD7EYUJz7iaFnLzRbHbRPFQmClOmHN7KCxaPyMGLOhGnIjZSwaHh/g1LScANH1FMu+E
 XdaQ/pIGtE+X7KEEa53SFYDh51IZW80KoYQ6+nLqjuVqPFWusiBkBKtC8KViVJdwk8or4fDaqti
 ZX9NdKHLIhFVUy3xw2zzz29lvgc/qFl9YyOIZWuuFh/Xp3gjL5IzHbmH+0Jp/kxO06q32I6hKgf
 4V4cnST7GuGXyKCPnW3npf1XEBsxVg==
X-Proofpoint-ORIG-GUID: yHzwt9rZul2oTtFOg7aN95s6Ric1Hbhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290122
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

On 10/29/2025 1:14 AM, Karol Wachowski wrote:
> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> 
> Fix 'Memory manager not clean during takedown' warning that occurs
> when ivpu_gem_bo_free() removes the BO from the BOs list before it
> gets unmapped. Then file_priv_unbind() triggers a warning in
> drm_mm_takedown() during context teardown.
> 
> Protect the unmapping sequence with bo_list_lock to ensure the BO is
> always fully unmapped when removed from the list. This ensures the BO
> is either fully unmapped at context teardown time or present on the
> list and unmapped by file_priv_unbind().
> 
> Fixes: 48aea7f2a2ef ("accel/ivpu: Fix locking in ivpu_bo_remove_all_bos_from_context()")
> Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
