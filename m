Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D7A616BC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 17:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1775910E1C6;
	Fri, 14 Mar 2025 16:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6iOGLmj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354B410E1C6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:48:28 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EDu6vE024926
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e3Gd7H8Bv24SmM10/rMAVCiU7Nh71WaBCpKeMYYM7Qk=; b=l6iOGLmjMQ2zmro8
 GC+8PR3GoStWrvUfBkdmqlJgewPAKU1nMTb0XJT9eooxpUvaMWzqzqMRQhMEUMsW
 eoGiUfOHXoGNK2NGg0qDhEdUwhsxeisOAEtY4qrX7iNL9ZybQpgGhidrpqdZ+v1H
 exebn8Zud0X0BUDdArC0sSJw7FPOrt+qul5gKetTF5NJNxdN2UujzNzvC8Dj5lhz
 sbrlB6IcFOHCtYo3edCw0X7ZT3td3+CaF5IJxf2RjyuiNyTgFAsamhC5wLVN2j66
 +z65QrJdvO3l8p2j0Ieu5Ee+FMOSTGueRN8hde1Dn9coSbGBHmWbFq2ICMvvhvHP
 Kn+TnA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cnscrewj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:48:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2254e0b4b85so38388555ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 09:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741970906; x=1742575706;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3Gd7H8Bv24SmM10/rMAVCiU7Nh71WaBCpKeMYYM7Qk=;
 b=GJbhH/1E2zUkKEfdc3/uy7OmWLAEpjXi6PX3mZB7LBGQb+pbrqzIxXdVeyte8DXvSG
 fXKSIFbQ6W7nF6N6eckCBjMGl5DH/RI3hTwG2U/nK0h2FFIVmMkoM87XUwdFTx1jrent
 +uhFL94OAMpKr2yWFlLYidYbBSukDKuiQkZSWTx03uBEN7wkHNgShqX9Ftn/9u0ijBnn
 4xSBUPJ0to2afSEwCiCal5GzqY9jgzujR1++RmFWGmYb409wC4w7pFNAiLFrFiBliVBT
 30V2Kbzw2zs6u5s5KuRDCS26R7qbi59ds6V8kHED4N8dH+TEYIRUSXK9WpdwjQp5PplP
 Olmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUID2njOMuwl2uwYAfJYXP1DMTkY8gPCwJsvHAy1LlEXLXhQ768MUYc1ZlirA2F7y2W7A1ODS/hQns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG44tAzNzp/LuY917UaaMLn3hm4f56AkXG/Xur4BTcDe6kwz31
 arlMHgwhmck+oMsaoq9wQwQuq9+1RceAfu4mh6npcLVftG0wALbbiFH/YDnVKOJoBcXKgrjXf8+
 af0zjM8+azwVTc7pRNErtyyu6e+PxM8u7qjnMipcWRAe1KY68ULnCJ6VvkdG583+HS4M=
X-Gm-Gg: ASbGnctHDtwwZxFYE4ygCKPwKnAF8ChzNdYRm0sL4Nwv4m0mTRHdMpn+3RCwVkAe0iR
 40C/nfQcMWRqs7juBgOom9jqloxqD8CE5LtJ7XDHny+la6/FKyIZrHm2lyAnky3NE9+FZfBPcXK
 Yn2iKTlGwauVx5/KSbj+0b9no7SMLJWpt+4TmhyvuKPhQnHzCa04h8Q62sO8RvkXdDdUAxahFVr
 LVxrbVWDXaOMV87E5fMybYr4riOo9MPI9KMdB3eyJrH2FwGtGNrHOdk/DVK/OW8hrbxzBxiwskT
 Zk0IXK12NZg7I0Ql7swGac1lbM22qA7nXxfRE2Do8ySU/dXkkPPOoGrmO2xINPKjiA==
X-Received: by 2002:a17:902:e5c7:b0:216:4676:dfb5 with SMTP id
 d9443c01a7336-225e177d49amr44873695ad.21.1741970905930; 
 Fri, 14 Mar 2025 09:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX2caCviEFQxG1FsGN2Jptlu0lqSidyR/Aam+mWuaIlY9mkeg1dHFRkglzhAKx+lkbrUfCZA==
X-Received: by 2002:a17:902:e5c7:b0:216:4676:dfb5 with SMTP id
 d9443c01a7336-225e177d49amr44873495ad.21.1741970905534; 
 Fri, 14 Mar 2025 09:48:25 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c68aa5ffsm30735845ad.82.2025.03.14.09.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 09:48:25 -0700 (PDT)
Message-ID: <96e4aed4-aa08-4bbd-baaf-99418b0aaf0d@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 10:48:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Fix integer overflow in qaic_validate_req()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Qbxmvtbv c=1 sm=1 tr=0 ts=67d45ddb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=LlO3PXAvtcZV46L7pkYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: sYTjdklLrnu1GA5u6mlfS8Y-D4GJoD1G
X-Proofpoint-GUID: sYTjdklLrnu1GA5u6mlfS8Y-D4GJoD1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=924 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140132
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

On 3/7/2025 1:41 AM, Dan Carpenter wrote:
> These are u64 variables that come from the user via
> qaic_attach_slice_bo_ioctl().  Use check_add_overflow() to ensure that
> the math doesn't have an integer wrapping bug.
> 
> Cc: stable@vger.kernel.org
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Pushed to drm-misc-fixes

-Jeff
