Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77F0BC64CE
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEED10E88A;
	Wed,  8 Oct 2025 18:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NPQ0JvwW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A2810E88A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:32:25 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5LkN028512
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sxarXiX1GMKIyFyY2fTHJFWuNA0u8+Vt8KpUQFDN2G8=; b=NPQ0JvwWdgLTY4/B
 TGoQVpDcAkeIQ8UT5BW/YQZyjX6ku+NWCMXQwZ1YHT2baeJzazQQ04IxDmsn18Rd
 vxyk5gxTWkMA7u33xRgb/Jn3IaCi0m0+ymXV9Rb9p3haZUaOnxDHsCsqXqPSeinn
 JG9b54FAA7e1c2y9ibQc/EWTm7mDrFq7vEQEbMXcPiSNVnhopn/Teb01RO74ZBVU
 FqpAl357mVeg0qhcWFNqHTx+9iB3qgoSfSwyey00F3A5lC1hCv6WIiNdJq8XCvpp
 TkMSTa10EKG+MXc4I/yBVy8674tMnPSUPQ7AYzi5dVs32BS0xCnVvkNUyFhYd4ru
 mI4aBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u07sa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:32:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-267fa90a2fbso17484615ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759948344; x=1760553144;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sxarXiX1GMKIyFyY2fTHJFWuNA0u8+Vt8KpUQFDN2G8=;
 b=X3DNHN78vMq09UWiQJ8MuLfpGLCaZMJJPxvzChqdg8xnx69VWTyjy+9+sbEIwoM8Uu
 7LXcLk2MGOC8k7Nq6wzOmHycHDqpc4XNLbFCjmoBIpOV4gvgBoWD9mQV1j6r2lTLMrox
 b1StMl8nrjRU6Iuj8JN+/P/MnaqyqIOB3wa6mPlTlkYevqZRBQ8LbBedsJKHp5RqZAw6
 rjNNkHoZBcU7eFDk3lXRFy0431lw+c/hJyNEW+IL2tKZWj6ifwONlYiCKRInK6vzURUQ
 ya9obVyXDg8+HMuLbsc/bboOOXzSIKE/gNClTpvrTDR2LKVnf50PEJTUVt3EJg9KfdaZ
 GTNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwHKb0R/nwqBhFjdzcBC/xRANiPQV17luD9MRAqgLr6yepS31AkxILtVZNCnivWZ8yIIP3N26NFFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjMBUDmYaHoUS1Zqj5Gzp0vLU4Kp/bZyeRbJOhZz6SnvqcDrQ+
 Mm8Rei0BNvQz6lk9ee1CIV3FsbdpDDFJ00IKH2HnuIPnVVc6IryRpJviwpzRB4uis9fc71W8Nrh
 ZyFBDPx/Xk2Rdaa9RlUlk5OpijvAh/1z0DjFYGHF884jEa0lYUr7FC6F8aqRzu5N4Ye30cQs=
X-Gm-Gg: ASbGncs/vqzLB5Eb0IAeFbIgb9bJ8yUS0tQZpre+EKsk0asU2/grRPnehu4QIzAfoul
 OplB++wn5HTnJuZOjaNL5V5eUZawpvDe8TgN/2fr9OAA9A85fV9LQgR89zAHfgtTpSNiEBGDScB
 N8xKKZcBo2rlTc2pgyXYWS0W61bq5sT6nqPSyzhOvQ4RTyp+uEALggzHf+SBbawSLLMY59JmKr0
 zJEyoiP1ZftQTJcaQ3DV1bjhcTT3S4Xrbxq6fQxHB0KAolBy9yr7kH4UY3LfuP2tYFyVviYabli
 +1Jw5UX4H+xIkynIMeMkttggSpjWs8ultNNqUfBpVNzduze2DJMMEx6axFx6nuEVYynmODIsnh6
 rZUsyPTz9sU0OhEcaWoc=
X-Received: by 2002:a17:903:286:b0:26e:7ac9:9d3 with SMTP id
 d9443c01a7336-28ec9c97670mr111370325ad.18.1759948343789; 
 Wed, 08 Oct 2025 11:32:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG188KcELEkW4UPAjYoiSp3SrjHFty3fkVfuG1ImYr0uJXwhqvnWgiVuFLowcI2zc9DLXkpbQ==
X-Received: by 2002:a17:903:286:b0:26e:7ac9:9d3 with SMTP id
 d9443c01a7336-28ec9c97670mr111369935ad.18.1759948343348; 
 Wed, 08 Oct 2025 11:32:23 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e1853fsm4280925ad.41.2025.10.08.11.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 11:32:21 -0700 (PDT)
Message-ID: <21d22b78-a844-4c86-8be3-e07b8b61cd4a@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:32:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BMW+bVQG c=1 sm=1 tr=0 ts=68e6ae39 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3QUyYiSUeFS93uMjaC0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: mjZl5or5fmuj5EN40aqAmj1lo4BN_Iqg
X-Proofpoint-ORIG-GUID: mjZl5or5fmuj5EN40aqAmj1lo4BN_Iqg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXyHFQMDvDHXdo
 L8wn9SwStHgDP3QUkzymT5kTE2rWnT2GsoUgRxkWr0BDzIQcX9Ht36K+DWM1NbyGGpB6KkEKwYS
 KVF63tpV/xbuG6vLiSMrdkbqojlFRKL5+5MIPOlbiiCLLdBUnwozbnMUr/04dVwGKfiBiRJxrZ7
 87UORNDAgKmBBQ1DlyXf+6WtHQCxPsuta0Ukokvizl/6YiK1GK7wxbhwTQPjhzotbW7wB/2t5yd
 yVvR0R1fiUF2GYPLvWCeC2rFSRK0vO3t1Cu0m/4PSMyjW1X0yYWrMcJ7Y2gbF/2gX+ycK8hEXdL
 HFaWifmtS5JSFVfhRpUxlyiBa1fixjO54KePqWX7wUu+3P5y4vJIjxyiJxusfptqePnTjY/5G5t
 XPX2oYPf92n04YMwZtlAk9l2G1UPiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On 10/7/2025 4:15 PM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
