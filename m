Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA454AD06A3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 18:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F5210E089;
	Fri,  6 Jun 2025 16:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEzLZXQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE8B10E089
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 16:30:17 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9Sro023300
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Jun 2025 16:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2er7YMiMgGaUoQqLppT9qGmRcRaZOBQtiJ/3PPPAGE4=; b=WEzLZXQkN/c5e7uy
 N8+BDNd4sd1sEKSk/kP7l0igGL9nhvYu5fSMMerXVgD8vt1LOI+EL+ini76I89zw
 1DceRgnsLNkG9wd3efCr7NUexlsc1c88z9ra2il1K+MJLMzTEtSZ04Q9KjuY7fpg
 18asjaebwuAG6RhviZlUAXpIVDTrAYyO59UKAe/0moOwLUdbA/CP1osDzqAZG3S5
 6hEx3c+mSJ/Y9in8MzI4BS0NUyNWpjYuLdLLIB9FVFrm7kfYryl8Pe4gX9rCkfKP
 3rnikT/5pN1vU+sRdhs1k9/7OYRIPbZoPsLjyfmpR5UZ+lHg87tvTTjMjM3P1xJM
 ohvL1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be88wuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 16:30:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-235e7550f7bso22923805ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 09:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749227416; x=1749832216;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2er7YMiMgGaUoQqLppT9qGmRcRaZOBQtiJ/3PPPAGE4=;
 b=hFnHkiZO6ZHYUoym/VgTMTG5LmiiAq61+Eas4lJafD5VW7gWUSpD+EaBt/TRKmuHLj
 v9LCWw2vjRXKYgiYuh3HRed4qmumBAxQXNOnsst8fngrPNloolFBTuFa7B6Hry7dtIK+
 A1LG13slQM2WFjS/vicUZH6nZiDytHULp7jbD5XsEXDW0i6TRvedE+wVg4/qETqd3YJY
 59uTU0+J7x7ukhOCnXyEGkHi6M3FaTwgQhBc/+3C8bHiiScgP1cVIH6SCN91CnsLlp2J
 Ar2/lotc3UY1LdW4Gzp/YxG8nrzEXq8tqkJJmF9/ihuBY/ZZnvB/SuUOFSbjr9pGAPvT
 X+ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8yt/UR9hVU71p2JYva0DjMVD1P/TrBxI+b5FHyfXnIeRMIVqPp/NU0E6/MA3Z0BKLBjI1B8xU2nE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6abgqUEF7EbDP21mDYRCw70v/dDBK+CXzkcAZPVXFbx4ET9eb
 J/uhlCLLIdEzRqg7U8fzJHtPjVO4osYfpRfUyTUdkqNhc8u/eRx+QZJehNwZBRtFGybRcCP35Ok
 uA3o3V9ZwbZ99ye8tF2rhmTdA42VtVsH9ZhC4FeLWbndexQQhUsWmB0qTHJOUPI5TDrjE6XM=
X-Gm-Gg: ASbGncuf/3y2bzKGRkcU/tzqomZMbNGQ0Z3Y7Eak6TO+HAMLsgPTsXcpxFZwPleI/w1
 dwwvAZCgEeoLlNuPJCSczl7FHazzdnF6tf2e4DhwL1OHnVLihOInVItWVYNdvXhDh6xPDsviJNX
 /FnwpFLh+fd8mCEF6K1RINKzMuZnYvG90cjeSseSZ3Fyfm+pRoSGadbSRuQEvCDHv+Lm/eeNWz9
 4se/YzNMzsQFHTPWjsiZLAXCCYBOT8L+pxtsglu0BWJ/0CA9nD98FVSlQMNTCnAqmNI8+e/yvWC
 fsHUZCwnGVoTFNGq1DHgartlCRi+YJL27+neN3DuKutwf2vOUJ3UAviWVBG7ng==
X-Received: by 2002:a17:902:cf04:b0:234:c65f:6c0c with SMTP id
 d9443c01a7336-23601d2472dmr65683505ad.15.1749227415860; 
 Fri, 06 Jun 2025 09:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjMPcU0Ts9u5/7a2DBmhnjfotzgPv60fw03v+B/5yWAth5He6s38r94/i93gQdYgO1yr4h3A==
X-Received: by 2002:a17:902:cf04:b0:234:c65f:6c0c with SMTP id
 d9443c01a7336-23601d2472dmr65682745ad.15.1749227415207; 
 Fri, 06 Jun 2025 09:30:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fc747sm14256605ad.121.2025.06.06.09.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 09:30:14 -0700 (PDT)
Message-ID: <3a3fc0d9-afb4-4a37-bbfd-944fe7721e0a@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 10:30:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add turbo flag to the DRM_IVPU_CMDQ_CREATE
 ioctl
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250605162001.1237789-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250605162001.1237789-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=68431799 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=QyXUC8HyAAAA:8 a=W1TcEry7lgE_xL2IDyUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: C1vAXYXoeYkdZzBjdkw2tBA0aPSADYgB
X-Proofpoint-ORIG-GUID: C1vAXYXoeYkdZzBjdkw2tBA0aPSADYgB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEyMSBTYWx0ZWRfX31B/xOinNC1+
 lXgwK/SScbAaeqYfXtAtzR4SwZIX6S2gSNX5BslGC1P7aWnuCzp+GXhTVE4O0UjCPAUBQKXXeVS
 mEhYJapk9cHI3jaj1ux319W8mdQLc3Rf+WE3A0J1rvRcK3btH7YVg6vFrUumP9zH4LqNrNc6Ax0
 yqfijTnq3b8XmL4jUVzzRfdUsE5UVHhbvfGtSSkCpYay+Jofc16GW45Igh46RvkdsegcLWo4A3T
 wR+LbrDQkZyd//v6m6ahAZKTAGHuMMtRjOAgacmcTsnn3+Z51aaaTZ6V9YYaq7bPNF6N+N5atCF
 OoRUSyS1V5o8mF6uzmmnCM5+jwBrdJfufzYXveFEGqQ4spB+jOpBn0f7s63fMq2HZwKwfwhn3O0
 QyXoCcbiLEjfxydBNPgUdeQMs6fJ3T/MeoUi4o0XapKGztItg0P89HG0EbDquUG7RtR3Mk94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060121
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

On 6/5/2025 10:20 AM, Maciej Falkowski wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> 
> Introduces a new parameter to the DRM_IVPU_CMDQ_CREATE ioctl,

Introduce

> enabling turbo mode for jobs submitted via the command queue.
> Turbo mode allows jobs to run at higher frequencies,
> potentially improving performance for demanding workloads.
> 
> The change also adds the IVPU_TEST_MODE_TURBO_DISABLE flag

"This change" is redundant. Just start with "Also add the..."

> to allow test mode to explicitly disable turbo mode
> requested by the application.
> The IVPU_TEST_MODE_TURBO mode has been renamed to
> IVPU_TEST_MODE_TURBO_ENABLE for clarity and consistency.
> 
> +/* Command queue flags */
> +#define DRM_IVPU_CMDQ_FLAG_TURBO 0x00000001
> +
>   /**
>    * struct drm_ivpu_cmdq_create - Create command queue for job submission
>    */
> @@ -462,6 +465,17 @@ struct drm_ivpu_cmdq_create {
>   	 * %DRM_IVPU_JOB_PRIORITY_REALTIME
>   	 */
>   	__u32 priority;
> +	/**
> +	 * @flags:
> +	 *
> +	 * Supported flags:
> +	 *
> +	 * %DRM_IVPU_CMDQ_FLAG_TURBO
> +	 *
> +	 * Enable low-latency mode for the command queue. The NPU will maximize performance
> +	 * when executing jobs from such queue at the cost of increased power usage.
> +	 */
> +	__u32 flags;

This is going to break the struct size on compat.  You probably need a 
__u32 reserved to maintain 64-bit alignment.

