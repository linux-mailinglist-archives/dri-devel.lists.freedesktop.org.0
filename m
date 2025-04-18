Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48EA939A3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDEE10E21E;
	Fri, 18 Apr 2025 15:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KREEHdgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA98510E21E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:29:13 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IF6BGk005236
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zpqSELpT+sKl72wUzcnbK3z05Oav+dEdjR1RRNA97O0=; b=KREEHdgYS1wzV4/U
 pKNiWsGl/Vx4xmSZ4M1zBShgoXmi8jYlCPjFKzpZJFW9xVi7yM+9GPxnk1RYT0w2
 Jk3vHUarD2Tmnj+ZhjkdC3be6XdaAmkoAT7qCBhDcXBM4Hhryn9EuiOjAC9SOmeT
 dIgmo/8yMJ1xlj4YYUdOtoSbByxakTyxcrCmRMYTe1VXr8zW/K8OaDH+cYSl5UI4
 YQawhJumfx0P1Rx59XuZvEpLyh1gG2H18BDfUo9x6McVo+reNQYsuBXeEYcblbUd
 aBmxw3VFs00FRL86ITxscH8ZzwCMjd4XMH2og1SZ0gJyC5fAq4pOXecCpYn8LTh2
 BqpdfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf6a2a1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:29:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-227ed471999so18635775ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744990151; x=1745594951;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zpqSELpT+sKl72wUzcnbK3z05Oav+dEdjR1RRNA97O0=;
 b=eynzl58CFbhD6eEgBe8rRKUoVLIv1KfdIFKtqh3rhIct50PVRw0rg3MYxXsp2GBFG4
 6fcIrio2Bkn8t+K0rTN38dFBwEL+RrE288xSFN7mv1HxSrZ2lkhzgDFBUrC7F/EKFDHn
 JZt/KcYWSsKGk7ymyBHJLZjquyszI/K9ETW2/0EErnrv6uW74hLZQCFbZwlZb4GjIZzM
 dano2l/Z8GSq2cwPSoKY9xdg0++RMDuzSDcjaPLebqESf3ckpGSAoboqSXjIsydzp+Ht
 1tk811bGo9yPNa2nr281EdxsrPVVnKPXV4mfmZsFTDfjs5o59HzVUhvrjr0g4eilf6vX
 ju3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjgPrVQos5Ex9VlUi4x1O+PlcelTDed+hDSKSvWOvYfRhqw/+HO4GlgEz0oGX1sTpX+/XLoXSnIY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAmdk2A0PxpJM8sELLlggvgmj8w+rJ7O5GM46XWO+I0Htvy18y
 XFpNgCubzyYHfuvN9VmdqTlr1wMC5IG2zqFenTTfgJwiDX9AqiZ38FCa6b6YuVWqWnHnEqr6GtJ
 eb2RU8yqQ6hBFzkbQC3V0Pr40CWDLTOcfwbo2/9Pj0eKsCC10/ws6e/MGqLf5Yiae3OI=
X-Gm-Gg: ASbGnctKfeRJARIQXGno5Skd6dOf78qrDFGGjCikRdWXFmAT0DcNaPKzmFSj6J5Uo6z
 Poc2XdAKAQzYkQb3puDrt4t7V3eQ+5M9s5IVM8hQ8Da95R5Vr7PG+HKJsqQZOi+heldEWxuYC9R
 OF/nMV+mpsR3WKZh4ZvNUypXUUWRZebNEmENQQtZ+hXUUfwybtnlvzRE7DZUoIzLfl0whTMHSgR
 uk1mQiYKUfEBJsyBwFoklr/pOfVhrlqzxVM17GMKMWJr7PNqQpJNcAPbl8KesK029JLUVXONqd1
 ZkarvhkWzscR9/7tseTG45YxisQPOZijngvSHOeyY2xsB587+OqtS2Y8X3QcDw==
X-Received: by 2002:a17:903:947:b0:223:517c:bfa1 with SMTP id
 d9443c01a7336-22c5360c7admr54577275ad.38.1744990151388; 
 Fri, 18 Apr 2025 08:29:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjAHXyd1nYzGAb3RhFK+EGxDwI+LzxnDHJpHuyZTtGuUtva7SHVi56Mr6UDL7qM4+EiFoFfA==
X-Received: by 2002:a17:903:947:b0:223:517c:bfa1 with SMTP id
 d9443c01a7336-22c5360c7admr54576995ad.38.1744990151086; 
 Fri, 18 Apr 2025 08:29:11 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbfa588b9sm1736146b3a.117.2025.04.18.08.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 08:29:10 -0700 (PDT)
Message-ID: <70f4992c-a47e-4ffb-8664-0ffe35dfd368@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 09:29:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Correct DCT interrupt handling
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250416102616.384577-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250416102616.384577-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FwMr7bBGkzrh1kIm4g_nT9XpwoZ4kb9Q
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=68026fc8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=uXqb3UxHCVRvgswKmfcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: FwMr7bBGkzrh1kIm4g_nT9XpwoZ4kb9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=917 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180114
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

On 4/16/2025 4:26 AM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Fix improper use of dct_active_percent field in DCT interrupt handler
> causing DCT to never get enabled. Set dct_active_percent internally before
> IPC to ensure correct driver value even if IPC fails.
> Set default DCT value to 30 accordingly to HW architecture specification.
> 
> Fixes: a19bffb10c46 ("accel/ivpu: Implement DCT handling")
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
