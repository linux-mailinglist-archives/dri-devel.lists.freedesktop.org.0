Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4283C48B1D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 19:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5562E10E4BF;
	Mon, 10 Nov 2025 18:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PL1AEmln";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnBgwjeZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9932E10E237
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 18:49:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAGYO494070802
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 18:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O0m4SsGXFjn2QrveGO9bZZGQsmQpk9SLlkT4+HpNpjY=; b=PL1AEmln8Wp5xl7w
 if42V9d8kC2vO7KoDJ8J7Zziit+76YgVx6P4OGUTF5++Avt5HSX8vh+zX0RZUvST
 j1dialVZPYE8Ips1+6OIaaQimcYMg2Rn4/K568KCdb9SbqHr32ryC0wvm2u4zxYs
 g9xlzv4+LcBTGoUQHp2W2lIH0nh8gqt0+vUZJu17tSShwNIDii8PR5J/nrj6wGVm
 OzREJZiylPjgoeRGEdO15OJOUvoJuYFFqK/rfV93oA6LGJpq4UvqZU0W0Kqpp0hK
 vuyDnH+32MhvEqVv/cJMVpHn4smdPUT6TLB8MQL9pKkMIze7h4234INZE0m9diIZ
 4+WCEA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkpj8dew-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 18:49:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-340c07119bfso8173997a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762800593; x=1763405393;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O0m4SsGXFjn2QrveGO9bZZGQsmQpk9SLlkT4+HpNpjY=;
 b=TnBgwjeZvKdjb3JQXB7MeiLstbMc28P0s3X3rRlnZo3g9tZk4cCQoSw2+PuhIkpvIz
 serg6HuHZrNJrsOUHujSMMDcdFa7wSt1NwqQmGegtSYCIuA/Se+cZkj7tklkMAJdIfMW
 CCj340fQ8Hxy1e+35rcmq77jQYEoUcGeIg09H32QQIl9v4VrKzsxIHxKHlHIuE52PBSO
 Cq2iFdvdlV49D/hdcVdHG/sbY4HKo9+Yl6625qJrjDkjLHETpLJNMZTqIyDwxLm/0X//
 XdQs+LvTD3ZNFUMhle55IfqTaDvQKGG9pquZ3wTTXFDrfdwjxjDkSLGjb8GkC2DpXpxJ
 AqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762800593; x=1763405393;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O0m4SsGXFjn2QrveGO9bZZGQsmQpk9SLlkT4+HpNpjY=;
 b=MWko9AhanqG1XIKFTginoDjRdS81sbI5MV2WqWjGQtO9VNed5t3Ho74CqGUUAFktxY
 KznImuOVTINkQ32hEZqnwqM4FpJfiHLgtUhb5Rdgfc5K1WIfM52VAR4A21sGd3zv8VzE
 qUSHPGe4HX1QGLvYeTSUBmbRqHVvGa9tn7F2RCohynh4VPjlud10CatIYr8ynSXivTaF
 +S45aIYYVXrNEJBICVYVMRAlW95KkJ3IA/gOXqqklyizzJcQj5vH0zti/4tHngxHW4JK
 kzVyW3VEI8cgcW/KFMluVyeELyrZOYx1pwwdNxKhPyprtpdpm58Aw63rkyOhk3kk7v0Z
 fqpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsAwJY5vnMXbpnKwMMVH27Kevx785YIqKZTCRiv6iVMbcdf5Pntg4jpiDOVuXKJem8nfHLxswgP/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNjITkARhB+Vys6hzmTXe1Rx/xNO9saybAol9sZTq9OUblXJon
 IMqKEzQptR4Sf8xltJBO7CvQJHUZc3Ujgg7mJMWb3LQqwLlFetbLW94+ZwpRoIpHqf+2JhYx6ls
 EGiQnYuKrcVoxtjn80QOrvAwcNzS95/m0tYuDEw1RtrFbpaPUpE3K9iSQxdLzhit1ihWriQc=
X-Gm-Gg: ASbGncvoVXEtAMwA7QxWqt8ejLR3g077d5w5OEvpWUoh8sZMrdiuO/4JeQu75exYlzX
 n6Kt3REDquW9hoswNSWrYUi+Pj2XIjzBFmta4KdVDHZ1GZvRPJ3C3vuqAk9y8YbMcD+U+QGUitN
 KlJuj1XcsKRw4FFayr21ez5VNeBrq3iqhAZOWh73auCepElm7vq7iFfhNFUwIJdWXj+fSRJXb69
 Atsdi/bQtl/SGlXi5LWgOLPxnW4akwnrn85S6CsmbuQ+j3cdC12CWesCWZXO28rFY4DEnXc2Bbj
 vlF4LKERj8EDCtYEY21PBJ5Ivbl2ajewI6lI/lk0haiMMBz1okYtCBkD34UxqlZXZ6WuIB7V3nR
 x0hliZfYLmlqo6gvvkzzbDBP+yxoyALbqgjFcV0HwCCHyMC0MryJl
X-Received: by 2002:a17:90b:3904:b0:340:ec6f:5adb with SMTP id
 98e67ed59e1d1-3436cb7beb3mr11459417a91.3.1762800592648; 
 Mon, 10 Nov 2025 10:49:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEly7/dDtyVvwZoxb1UUG2yBv46sYHnPdx6WiV4Ldjd9d3p/YphCmNqkTgC3gIcVgA7m3+7tw==
X-Received: by 2002:a17:90b:3904:b0:340:ec6f:5adb with SMTP id
 98e67ed59e1d1-3436cb7beb3mr11459389a91.3.1762800592166; 
 Mon, 10 Nov 2025 10:49:52 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba8f8e750c1sm13402258a12.1.2025.11.10.10.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 10:49:51 -0800 (PST)
Message-ID: <507160ca-a3ba-4705-984b-ef94a56e3b8f@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 11:49:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/qaic: Separate DBC_STATE_* definition list
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
 <20251110035952.25778-3-bagasdotme@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251110035952.25778-3-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U23FfMmAx8tdaDgRnN45T8iQtn94tFV6
X-Authority-Analysis: v=2.4 cv=GZoaXAXL c=1 sm=1 tr=0 ts=691233d1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=yxMg_K-rWnv8iLjOS7QA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: U23FfMmAx8tdaDgRnN45T8iQtn94tFV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE1OSBTYWx0ZWRfXxF65n4PUk018
 80WXhOuvptfMe9eg6g4S87dXY5ZKAqNsfGbH3vZZvnT8yGQxarxkIYpcmxEQ1k7I2gaqADOU9RN
 Rtz/fXHTg9yfkwe0dMtT7yVA4syYi5eQ2nMYCD4+gh4DjkSRX6w3mVSrL7uJv9bt7GZtTgqlRco
 e1gwdMfqdvMGrBt8/rtNzB2dnpBEY7jbaouma04RNqlpi9i+zOYXblVFjBpCJd0SqUlqzzpGVB/
 6xlLtjEhCHn5hze34DxTMWfwH5l0G/K+rLzZp+PHd0weR7rkK2RrMZFTDWMcmngIhD7He1VXdzk
 y0tYYW8IpBPU1PZbEx2oSwRbXvQfFYKr1owNPWqg1Rqg06hLSc5TG/xFvap91a8b/gxMTSWy6TI
 BkQ/oUgjgS1DlybEMVLaHAxXDLza+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100159
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

On 11/9/2025 8:59 PM, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:
> 
> Documentation/accel/qaic/aic100.rst:502: ERROR: Unexpected indentation. [docutils]
> Documentation/accel/qaic/aic100.rst:504: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> 
> Fix these by separating DBC_STATE_* definition list from preceding
> paragraph.
> 
> Fixes: 9675093acea04c ("accel/qaic: Implement basic SSR handling")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
