Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBABCB07252
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 11:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5020E10E772;
	Wed, 16 Jul 2025 09:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD7TaINl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6377210E762
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 09:58:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5uGv3026001
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 09:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uCPi2EzrNB692xy9We9a/N/3HeKk+7QZjy0Feteaw+Y=; b=TD7TaINlKPIASE36
 u/IbN+GDCE0I8aXSUbZMgWJU5NLyxC3OiBPrp/w94eJ2CIRTzCtvErpjFnPBsIKY
 dEoPnit2bh26v+QbjDsA08VXCjUStPFtRonIes9qDcEcSPf1Rckx0ks9IgGr0Ulp
 /ZFd1CGsPFstiDMvrOhiTJ+CgMKmcQIGvXWRag6QCDVN7AqIXuLa09ElQm2W61WD
 uKJ0GCCuX6oqQhJhFdSaFr/LcQGPVOUHdiQvg7iD+itE+anVeK9B1Pra+Nj5ePtF
 RlFj1INTotKb96Um/t3VD+YR/PYkYlsdtQMWFKJERhJXZMf9bOiynuOEB3PG8/no
 JoW32Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca4nxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 09:58:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f539358795so17550476d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 02:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752659909; x=1753264709;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uCPi2EzrNB692xy9We9a/N/3HeKk+7QZjy0Feteaw+Y=;
 b=sEEnBwErg4qCidyG9Oi0oXLLORX4EY2fX4ViOLxT7n/pL8I3tkBANWgyQEWjEmPqn8
 SgUhhVdkN9FkLQupzqn6Nuir5XRG99vPJSQ5IZY2jXZLUOZYxyHDmgOPRk2zoh4IOvWg
 zBe9/wGEi735JoJpIk+0FD8oQhFr6Xps1lXW7Kz6L3r/avbcTYbQDEar9DH/WR858B62
 5+vbO1iJaon4W7AM0RRIItM4Ed2SNNL7hROKpIQszIrlUoXTTsGQTJWY9mvjbITZ4x6i
 EIbyjuSGGd1wPnY1BMI97rFJxLKn1lvsvHSZepkZkZsrGO0MjdemgjwxZrPSmjrbXcgP
 ATqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUakKAs3d/j/2LHCyjCpKQKsF2cLf2UFmyCDqwKbgSHNR3JeqpR5w9jmHo/ex0jdpHpOgplRzxE90w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVWV0XV7+AnFgQQJEa+U2xGYbVhU13BoTEKG7rG6vDb4x3NIHs
 nsfils09Wvn3Vowv3kWzD+kp5Vhhgs69jF+Qw3fl+9GwQuh6B7yB3WdPYEUalceIoTtGjggDA86
 L1/IGqq6/sOetO/mSSHrNiqBOgAFcuntsbb9I4EOa5M+bqo0YKPdQXV/bG3pRGotAMYOaO881Cg
 j9WoE=
X-Gm-Gg: ASbGncvsyEaSQxw0hN8vDgV4ARulttu4bWCBXxQvGSttvRV6Tz3A0T5SFZQRpcxyI+A
 x3ctoOXCxNrG1zOqKjVl0c1AaRbzZ+eeI0PMtqZomlF9Thw+TwfJkfhRa/oagavZNLAZt88uIgW
 6a/hvDUMsBjHdaa75iqnPGjReMkNQFZ2nKSQ2V8cy9Rf6bCA/uIFRs9wbhFGsqis13hrBYduHX2
 8OelvubCQxkGLhNYau6Ehs3DPscx8ttiBO9amHvSQmZH5XXs4nlVJx6fm9y4kP2/b714DY5RQHx
 D4b3wmYukn5GRh6JgLFsU/wSyovNH5eV6lSpVcq2f9/gzBam2LiRWUao6mI/RfwguAnm8t4dGSu
 lwtldvnxN9N+aIlW0XcKr
X-Received: by 2002:a05:620a:28c1:b0:7e3:297d:ec32 with SMTP id
 af79cd13be357-7e342b37074mr137700685a.10.1752659909173; 
 Wed, 16 Jul 2025 02:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpnCpN/dC4tnBcVCDR8doy3/WCq6HZeBLkingkmeSVXbTv0Ng7Hs+rCJV4fx9aFN6b/RA0hQ==
X-Received: by 2002:a05:620a:28c1:b0:7e3:297d:ec32 with SMTP id
 af79cd13be357-7e342b37074mr137699885a.10.1752659908851; 
 Wed, 16 Jul 2025 02:58:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82df2efsm1166796766b.151.2025.07.16.02.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 02:58:28 -0700 (PDT)
Message-ID: <ad1afd1b-9cad-47d1-8dc9-0d62b25f502a@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/kms: move snapshot init earlier in KMS init
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250715-msm-move-snapshot-init-v1-1-f39c396192ab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715-msm-move-snapshot-init-v1-1-f39c396192ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA4OSBTYWx0ZWRfX2zFg4s9JU+5e
 9pRPFxpbZMc+aPvI5ozyT4gKPdxuYfzv9DNt10CBc5hFrrg5geNy00/tsGWNbeGQILJVdW52cvp
 5NYsW5ab1lJI62fTWCLHGUta5gbL8eXz4UlVL+S9/+UI/pc4FKux1aPzb5gbf116y65m6ypDDmY
 Xq+9PzcubJ8pH2YVlh0IWb/iTDAHpOX5QXdHgUrcjkJvp4s3nnm7vq2dTZPy47IbPKM7B1MpDow
 DpLFcrq3FHw9n1D85zN9ZYXCvh4C9jXZU6g/rXaAEJisqBOghCJEbsNDjA9pPA7JDFrqJjrMDEj
 +vr9T0qBAGmkifs50wuJtaIJgEoAm0l1VUTE3JkXrA9e1bPjPKsixjh9DCjP77htikfMAGCTNBt
 0KVbjZIjYt3MEzXcdj2ZD7P+8+HXxqfpUxMBLlmegTK706Zyn8adnpYMN8Y5lRYq6an/94+A
X-Proofpoint-GUID: 796GdQ-6gBt9Mg22zG-mnO_plu96sYFo
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687777c6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=qnTbvVf9oJKgxClKmkgA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 796GdQ-6gBt9Mg22zG-mnO_plu96sYFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160089
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

On 7/15/25 5:50 PM, Dmitry Baryshkov wrote:
> Various parts of the display driver can be triggering the display
> snapshot (including the IOMMU fault handlers). Move the call to
> msm_disp_snapshot_init() before KMS initialization, otherwise it is
> possible to ocassionally trigger the kernel fault during init:

[...]

> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
