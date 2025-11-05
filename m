Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CA5C364DA
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2283E10E066;
	Wed,  5 Nov 2025 15:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/xQTcrS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHp18tSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAA610E066
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 15:23:44 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5E8D9f876732
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 15:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7oy3A07/anT0IBOVcSxy/MmXrPi4O7gBYhCS6+0G3uc=; b=A/xQTcrSL6ErtiB5
 CKDzUiAzIoX+fsWNodNH8cOKEIDVLIdaIBKj3I9GrvM55/5FxWudd0cjWSLLrGlG
 5UyNBZzRWnLpJ9DUXrCu1CXGZicEt4L9TnbFWo2ejLgpUr+njyW2KvCFkTEUs0r2
 3vRALYetuukUa1UbMIR3LNJAG9GN8R2/oEXiypHhBRux+l7EaBNbf96fc+ebVNXX
 g9ik2IHJGc9817ZIK6lg3GQLhX6HWH/RwrrTZgHUp3hdY047Z2wSAIzYK0h1TSfP
 gk5a1JvY9SD43Qs19OrGjQoNLwgPUjP5i/RiqhR+tSOkfTIM8cz6E0xLhcO/tuyw
 icIhpw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a883187es-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 15:23:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3407734d98bso7240763a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 07:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762356223; x=1762961023;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7oy3A07/anT0IBOVcSxy/MmXrPi4O7gBYhCS6+0G3uc=;
 b=CHp18tSZqKdUUSvh+c7w3Nl5uRlKRKiEkzyOC7EodvOM50IIeWExhz1p2BktgLfhEt
 VwjzePGJq/NLsRFaNmm1hC7e2W+MYinUM7QBZUiYzy684vE+S/ivs97v3GRC5jL0WX5O
 qx5AMi5so6SE1SkJzRhG+VhUfOqkaNGxonmsE4IBAROPgMERdNc+RK1QLv5Jj7535UuO
 YMuQ70oPtcfoDSiDbmlrUkC1w84J7QsnHmkOZFaRpGSDKS4WozuugPKJjizu9D5h6b9C
 aziQnvcXKMiCY+AOckoowEVU+0cdVo3kYRKpk1gk228BHmfV0t95TvGwxjqrEI6Jx/3g
 leOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762356223; x=1762961023;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7oy3A07/anT0IBOVcSxy/MmXrPi4O7gBYhCS6+0G3uc=;
 b=AqSXohoJNXUUC2ieSGXW7He3pepLcStzlWnaWJzcQSFV/GcJJOYIRYgU/9SjzS8vde
 +XUBYy/WIBSSSw4NQEEcimxgs5NF5sbamSMN2W+oV43IIdiHS2Ui5rqgueRSFpg/T31+
 2cdkj3wptLFlNMPqaJ3dbbg3E343dlQwWy+mZNuU8IYYselQboCYPurOKf2p16qqodjV
 zi5pA+TUo7D681IIpd48PtRK5+178WbYn/QwhnICqzzB8OGE204yV02k/IgTbh6FYk64
 vhS7Gox17XHdvwFsK8t35sh91qtRKISGuNOvHyvrclnbScQWUbwtGCxkGFWdUJclH5oQ
 bxZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi5A1lxWZlUxo7DwWKYP0HhEqziZFq178YgCLXH/R/24T4IA6qer/ZLzmfWp0IqBY0JW6bffYJTwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC4bMZF0lFRpJqWWbozEkgimqWa2FxjgjrBAUCxpNnUI48vnYV
 UMnhA4Z/fgurG0FLPl0d3RWhLrnfhMUFwjregv7Bof3349xrHIIGtK1D+8MDspxDCNnmOPK8hlq
 W9qn/nMdRqbavpTyv8YCwgOIG6WJPX7f3eTJUENcavLuTOfgvISPd+vsz5qLgVbgBy8Bkyg8=
X-Gm-Gg: ASbGnctbsSIY/Lh4Rk8aLEcHyq+UFPnW8x9HyUGhwzyctkFMX82IWaTzIFvtFhMHUaO
 K8Ux96ZKg94FAnyIRqWK+WdZq+L3dnv2Sz1UMN9a5VEfr6AYf1loWWP+tnUjjQ2mfgZuAvgrAgV
 7HHlbjYfWQtVfk/8dBk4au5zLgT6BTeUtve+x+ACQzVmABn/opeRb/hH+YRScTb6tsxGuqZDnPu
 o55fclm/OZoOOEF2EwiWRCn7lgAPEhPjcvxHQfnLKyVaKo5Tl6T4BWunm/7GDlZYiA7XdMMyCAJ
 wF2rWB+udJNxJ/rhTTZ4xc7gKsxzuU5pAG016afGZ4P+RpFJ0u287hTFjZ9q1CLL4K83xNzzhjr
 +1f6hnXOV4EQrzu/2RsjkGi5QnSu0z8/U8dPPUXslilvqmaGKd20+
X-Received: by 2002:a17:90b:2ecc:b0:330:7ff5:2c58 with SMTP id
 98e67ed59e1d1-341a6c1e327mr5200608a91.7.1762356222993; 
 Wed, 05 Nov 2025 07:23:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlrZRl7egxuVMy0d1OODUkuxed6UHluC7bwHK4F9UcSTtFYFzhGGgWezpFwZeOpFSv4Gb3VQ==
X-Received: by 2002:a17:90b:2ecc:b0:330:7ff5:2c58 with SMTP id
 98e67ed59e1d1-341a6c1e327mr5200550a91.7.1762356222452; 
 Wed, 05 Nov 2025 07:23:42 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341abdec3b3sm2804594a91.1.2025.11.05.07.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 07:23:42 -0800 (PST)
Message-ID: <4006e05b-db5c-448d-bbd2-256253353da6@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 08:23:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/qaic: Add support for PM callbacks
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson.kernel@gmail.com
References: <20251029181808.1216466-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251029181808.1216466-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Lz0kE9gZ6IKa2fk1d1V5ZmBHCoI83Xu0
X-Proofpoint-GUID: Lz0kE9gZ6IKa2fk1d1V5ZmBHCoI83Xu0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDExNyBTYWx0ZWRfXwrWmiBYxhoTy
 yRt5Ol9vFxNZo3lQ0ejOTEMne3NvgSz6FXFOOVDkklPBhxTAQxCcuE1m7h+gRZoAbD8KAHVdlZn
 rIS643sdQcs6mjFQloW8DGzpb3BaDSV53HTroTXyHvxT/mWSEshfv97yXQMyLnpzFJucAgPOGa3
 lh2yeO/LxzC8unsPZ24NTGUuNKHv+s+JRTS3F98IomxkyANAcllmYyBkB3CNbrfNYZATlRKAlxN
 u9RlGxNKWWoHdklO/qSWNXKgwTcTqwgiXGsjoWT25R9g61sV5b9zWt4iNutQFqEBXfgrzlVbfi3
 8g+KamvyK5IAhL8017QTcclNAqnnzKRUdjxTFDWU+ubI7DneUhvYVDbKxxCz7vVr72b2srvcJZS
 WebjQmkzaRMbtyExpJXCWpLNLB0Kiw==
X-Authority-Analysis: v=2.4 cv=Mdhhep/f c=1 sm=1 tr=0 ts=690b6bff cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8xjd3bi9v8xYZN13gnkA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050117
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

On 10/29/2025 12:18 PM, Zack McKevitt wrote:
> From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> 
> Add initial support for suspend and hibernation PM callbacks to QAIC.
> The device can be suspended any time in which the data path is not
> busy as queued I/O operations are lost on suspension and cannot be
> resumed after suspend.
> 
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
