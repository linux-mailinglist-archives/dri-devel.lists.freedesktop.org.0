Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B4EA3FD65
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 18:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1357610EB0F;
	Fri, 21 Feb 2025 17:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPVUzs/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8453810EB0F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 17:26:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LBSlSi015237
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 17:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T5ynMRmaq5n9zwwwNcuq3LdcHoh2ot5zXwn+qCbZa9s=; b=lPVUzs/ntpAjnoAO
 gJ/UzNsf3qRMWaFpWZaYkdiRL4ZFuscGlLi5GkxQPvRhUyLYqw2P+x1LVLBuwqZG
 DN6kxBOr1qXgdrd+DY/lbolsajdvajjrhamBAzlAE9ONhiXcfgJ6Ikpomau+sbdM
 R4cChQP74q99o7nxJaYzuPOWBpuLKvhrL1V8fzPZk8UF3v7IgHeS3XZSe3hweux/
 pwcvDVX9jFQF2DVS9bEpDo42QOk2w7RV6N6XmkHLPWOR5Rp4EJmIS1DjzLUXcipx
 vv4kNjmKzpGyAqDbZ3+HyTIom2bRZemRsXYD3NexqgPhe5RQhLCLvdj/VL7vjwaT
 CWlhrA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy4jt1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 17:26:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-220d8aa893dso40184505ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 09:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740158799; x=1740763599;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T5ynMRmaq5n9zwwwNcuq3LdcHoh2ot5zXwn+qCbZa9s=;
 b=EseiOxcNcpxs58MBfO4wqzXQyo7CQwQSd0R5eTt1+T2z8mA6kvUVpkMXBYfjFreX85
 yIFwNDxEURx9Mds7Cq7bwHdVoHbr7NVi1aSe9bknJ1zv8Mxv5VDvzhOWAJFgdByBHc+e
 HmuAyJOHLIrnXgBtiZFwSooLAKnhBiZjZKF2y+uuyGTwYVeJaDGOj8aer4JeU4Xl0vki
 +QEB649Id3fkhYSMRGyvGIpcivOajFCw+EmZGVpCqk8RcDx4cJE0iCCtpsC/cuQRH6Dp
 paoG0NXwXAIHrME3ecF4cTNC2fNo3vqVlQGE2c78cGLaninmClEmarQbiYanUEG7nL9A
 BHIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLjNcT8WErKawqnSLwZqnfGHP1AQPb5UJ1MZXRdRH8gCZDRH8CsaGPzQnoX0L6VtYRAxuHgvoVL3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3jKMhWF9QaNzhmjZ+8z60aLe0zIDAJUYxkKpueGHDsPXxzBXR
 ITgZ6mkI3IqM/7M6YO+ODjWicnHsJIUKbKrlKIC8SqLJElpwhCrgwh+1rCcoUWg1HhCFjdo23k5
 T/7Wv5n0lzFJsaDxOuOCPDojP4eTsfRG/mNHNa4+w0Tzx+TjO3jWH3nBFL4wpT/xjNWc=
X-Gm-Gg: ASbGnctTyYAZ+/Y/sJaLMcueLYCPOziAGSDOeOEOp9N0/WY1RmfQMYGBb4W2AJG8tKr
 paIEoSfyjKKhG7g9Tn9dviaYWLBtdxr/MwAWifTL+AZRnlDFPcCnMtTR3YxjDgdaWPMdEzmjJF2
 5M9XAN6FzNiQOPpQPR0cD6jSMhjW6PNlbRclWqCTp+1XiWSCrUN8LgMxN2q1Dhw0nbQIqGEuwno
 QIY6upEAD/ZraunI66UNDXQqlb4439NVI72S89ZeBXjNM8QplHfJBBV9Iyz5DcH8hiBHSwlfleR
 836QP89BLTFGLpXEJEAMi3sqzk850tCFxZ/pR3akwUWSzufpBwuxWHuUF8/jSoowSg==
X-Received: by 2002:a05:6a20:3d89:b0:1ee:e785:a074 with SMTP id
 adf61e73a8af0-1eef3b1fc42mr7610287637.0.1740158798707; 
 Fri, 21 Feb 2025 09:26:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAvLjLEOT3k5eU+kwjUYn9QMNPwU+VKGSKihPzvcJYaCuOS/5cB5+9Dgq+to9a/pw7RBaEZg==
X-Received: by 2002:a05:6a20:3d89:b0:1ee:e785:a074 with SMTP id
 adf61e73a8af0-1eef3b1fc42mr7610242637.0.1740158798226; 
 Fri, 21 Feb 2025 09:26:38 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adc7e4aa183sm13131316a12.4.2025.02.21.09.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 09:26:37 -0800 (PST)
Message-ID: <21fa7a70-8c35-4e28-8d09-e7dc71350b4d@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 10:26:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update my email address
To: quic_carlv@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250219214112.2168604-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250219214112.2168604-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qHs2ChmRpCM7tkhYM3UdzuWnfiyO06Kd
X-Proofpoint-ORIG-GUID: qHs2ChmRpCM7tkhYM3UdzuWnfiyO06Kd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=910 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210122
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

On 2/19/2025 2:41 PM, Jeff Hugo wrote:
> Qualcomm is migrating away from quicinc.com email addresses towards ones
> with *.qualcomm.com.
> 
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff
