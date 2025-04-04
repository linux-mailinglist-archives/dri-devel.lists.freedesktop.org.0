Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F2FA7C06B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 17:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D2710E318;
	Fri,  4 Apr 2025 15:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="joBN8Fkr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A502810E318
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 15:18:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534ErfOb020921
 for <dri-devel@lists.freedesktop.org>; Fri, 4 Apr 2025 15:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rj19UX4H2bfeOYxofQikCqOIvps2GqoDCotdDquU//U=; b=joBN8FkrnFE/pRI/
 9D0SrW21pkDfyWAwxDDvsfVsvZJ5QpeVaXpvnxiPcXwR84ICAytAhlT3KIIpKNqs
 sHVZkfTKJevYj3773QDq9wnIea7QNjJNB43qMMOe1NDLivE9acGdGzmXdAn4+Xi0
 Sslx9BhaJ60y0mESWLznMN8Goqq34eS6+VWbum7M+t7rCIxEoLSWOpcD8Ra+LJ9J
 Rmm53W8R4GKW3ygnM7o7xy5tR3Nw0ONn8TyxYN9o4HsNq1Fyy+Aq/1EyRvraXQWU
 PQeynzAnVOKfQpELIoY08jKRJBFZ85QSMz4bP3kZylfeiEquqwx4agI4LTkEsHi9
 eC+Qhg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d427f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 15:18:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-736c0306242so2991962b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 08:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743779889; x=1744384689;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rj19UX4H2bfeOYxofQikCqOIvps2GqoDCotdDquU//U=;
 b=XTa8SyMuMIY+monJ4fS90jdKIxZvgvqyjQzX1+hPis6muyr3SzzFi/IAcHAh73KYGn
 zgygQ+Ijw4jGbvrFlg1mUHfq7rGoysHyQ+P254KdG3POblJAMIzIMyXyITIC6LRQns7s
 n0GvPNx6N6soxXzlRqPqHUJ0TuXnGp/QDm8WeIrEYXPuXkV00XG40yoZMKitCyUG/rkP
 6ADnu/wRG1mmiOQcL7m24TXwMnTgMMyoiEjFK5t6B6foXmRh3YB7ik5VKkssVO3iep8D
 AcMV4X9wlBSYmKlq6P9zaNlNz6cilYj2cfrQiFVqnEFeJjcMqmJwiPxSqF9hMngBrZs/
 KGyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEHf3RV/pt4Nce/Ark4OGVbKFhjNlbITT7O/WezMn4q2O5NVW4NHiw6DcwjM4XS08wqbHr8u+gvaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh41jaHth0hO1u73k2fcfDh4h3Kn1maAoxOim628R1C3hHq5CB
 ggXSjkoVnF4YbtTDz9MaMewprb6EJtnngpnUsJGRpjeljFjmg2UA9D+J763wvHFT+LZv3Esv9cv
 8HbkKe5qHDCdnQEsRL3Qje+lOFvKl8wVIUEqt4ekkeT2o1aKFvUtyqGlrZQ7PElKJLBw=
X-Gm-Gg: ASbGncuSvWqalqh2jkSHFbFKSujdilGA5zpkhAx6/gRT8EM49CNKpLww96p1hxvfaZH
 4vkXxDot2LPS2roZdXJlpag+PzQyNNJulWyj7sd0Umxd/e10c5b87+97435dVm0VthZdV0z2xMW
 FdP8g6K2E1Ckz+geRtJllv3s/tksTD9lTqASkwgEvejecuJobE7Z2PiTBX+rYMHfnf3bQSTSo/S
 /4RWXL9nSR65982zuCNT+JGqy/zzL6YZp09Np/6lIqSsP/T599cVAkKff9ZzdxeZhcZ5JS5NBAL
 o2/3I/YO78i8QkimRJ9p0eMBfq3gOy6F/jX8Ag1yV6PRGpqtE3Vf9KjDsdM4j4ktUQ==
X-Received: by 2002:a05:6a20:a11a:b0:1f5:7df9:f13c with SMTP id
 adf61e73a8af0-201047921bdmr5420314637.41.1743779889219; 
 Fri, 04 Apr 2025 08:18:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9sYKXkO2opjqVutw3nN1PPqDRid+LWS6tTJn5GUmqOSewrunWlzDH/YGq95wub68Z8Zpn6g==
X-Received: by 2002:a05:6a20:a11a:b0:1f5:7df9:f13c with SMTP id
 adf61e73a8af0-201047921bdmr5420274637.41.1743779888804; 
 Fri, 04 Apr 2025 08:18:08 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739d97d188dsm3495191b3a.7.2025.04.04.08.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 08:18:08 -0700 (PDT)
Message-ID: <7508a003-7a2e-4525-8466-099953e31497@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 09:18:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add cmdq_id to job related logs
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Karol Wachowski <karol.wachowski@intel.com>
References: <20250401155939.4049467-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250401155939.4049467-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 38mEINqBgjza2ks79vjwovJNgwWvfXB7
X-Authority-Analysis: v=2.4 cv=HrJ2G1TS c=1 sm=1 tr=0 ts=67eff832 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=XiuP1iakRwcYsRaZ35sA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 38mEINqBgjza2ks79vjwovJNgwWvfXB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040106
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

On 4/1/2025 9:59 AM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Add tracking of command queue ID in JOB debug message to improve
> debugging capabilities.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

When reviewing this patch, I noticed the kernel doc for struct ivpu_job 
does not document cmdq_id.  I think that would cause an error when 
generating the documentation.  Please address that.
