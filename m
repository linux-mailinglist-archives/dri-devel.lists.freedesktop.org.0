Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B9BF1DC2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A8C10E451;
	Mon, 20 Oct 2025 14:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFqUAi+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CDE10E451
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:32:13 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBOQBE026557
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z9XGD/GFWyOwQLNRUGjz4eK7rXcXnETL4d32kW5RT68=; b=PFqUAi+u79dZYAeo
 LOOCFdojEKdYC6KDWsln3euYSFDwYdXiKbhzgoiC9PW2WXz2ucNFRQwh2I6mNZ+D
 4DClCQf0PJQfP9ExIlNgEYyILE9hcieLq1ung/Dvplak428vqFEVlXGBzTDdrGRS
 z0l5u527n6H22e4GsvlOBQGijavT9cXNuieLxCNxRNNq49uNPZ9mFqmdgKnEgB6J
 XyS0sgmozCff839g3U+3RQtBzO4mMBI5m2vOm6ownrPnVf399KTBXl2wokRzkLFN
 Va/vBE8gktLW7R/4/pOjs7r358MsIDkfWznrD6zbDAyRhAI6wk5lPk7xNlBWTJeW
 qJ0eHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfd0mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:32:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-28eb14e3cafso89524765ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 07:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760970732; x=1761575532;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z9XGD/GFWyOwQLNRUGjz4eK7rXcXnETL4d32kW5RT68=;
 b=d9xzYwv1ZM6sUu5B7FhHLkxqBFH3uGQXErckM1PbXhqjqnfM0/NR73pCEbQrNfsDTi
 m0JmitByZdD3WSfWqVk8JDZJkM1X1u+oY0c+IhYENg9q23paltwyLjXWykqxhZxJHn8S
 K+pF11kfQWj15tEbPRvQJMi8NvjNjQBAtlI8e7fH6VxA0cJcZd6C2FnRIlnrYiganu8u
 bkHexv1rqa5IuXaCS7H+pVaBShiW2Zww7OQy/b40KmNVZHVJWByizkJS6HxswTzqVDX5
 d5iEgIx+c9aR8kUH37hbP6DR8LaBjS3KHig56FxyXg+YxuI0KbouwVc2DnexbU7CgrSN
 acYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCuBQozxyjX/Rc0DFq5wYseKb6t8oOBaMh4kRP9K8qw3tNnXW9nP51E1FFZRwiryVjfJjpLVVPVUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw69CIhbr42EWi2BKf33mM83dJyLAXq6NKkIz2xUuR73EtL19b+
 rFXFvmIX+LQZq4k0dGPC4YVFwy2bv/UUeBOGf7/CnRauXkOgNz166Tv103mL6oefE+i0qQl/vum
 p0bvS3bfuQTnmsujwahpvOhijZAFMvXAnqDNZMxay5NGQZmeGVM+GNy/hvz/Y9KhNWjLKu00=
X-Gm-Gg: ASbGnctlnZzaDB8/XCtfvKirDJp5KaAvDKg9iN3o/Std5MNR04Kkz/2PedWRLiBTTcX
 SPt4mDc39omUtb8jTj8tJIwNYUWgZcEBOMgIwrOrZ74W0GuGgaQcRo/huppfFcXoXFjXTjjKCLN
 if7QfuK7eRDgS2xpSdPYGLX6E2LqnEAKLRmhNHsJ0Kkv5zsQwNz3IhOD+p4n0RkE+uMKrsn9rtx
 TcPaPiZxp71YYC0OwoWtUnvv5PEUfphy99zlM2Tq0GlELmWKxmNdQskP18k4+CshEK67bM5q5XE
 EyptoZHBV4rwr8KfJ6ftDhJo8seFHIxe46X9jztaJ/zPDkTTAMcRstNlVH5pmVAmTdKxJGemp4a
 BmFmKrQAUjEQNHek9Y9IuUONEEBiXVcJx3CxNwGYZzHx9DBq0GFXH
X-Received: by 2002:a17:902:d4c4:b0:269:9ae5:26af with SMTP id
 d9443c01a7336-290c9d1b4d0mr166740455ad.13.1760970731629; 
 Mon, 20 Oct 2025 07:32:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS/mIKTl5UbZvn7hMYZrKbCnXYIo9B4gr+dMoKKYxFJoyVou5bnTpWeOCTY5nXHZ5UcoyzsQ==
X-Received: by 2002:a17:902:d4c4:b0:269:9ae5:26af with SMTP id
 d9443c01a7336-290c9d1b4d0mr166740085ad.13.1760970730699; 
 Mon, 20 Oct 2025 07:32:10 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292c6cc17ecsm4797865ad.48.2025.10.20.07.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 07:32:10 -0700 (PDT)
Message-ID: <d161d0f6-ea55-4fef-be40-d4e6f5241096@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 08:32:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/qaic: Use check_add_overflow in sahara for 64b
 types
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015165408.213645-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251015165408.213645-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7bBMyNjMQBvL0Ks8y2AIMvYtNvu4qa7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX8kEzZkfqg/xi
 jljQ5MAYAPoGEoR4E7JkEO5nWELFWBaCdEa+zFJZ9krZClzhvDhI1SBGtiMX3TRl+XIv4VtxVTq
 8T6uyG3w/vxzZVekVLcfD5qM5HQD1KucGkg6N41g2c7OfvKgSQRqJyGAIkbDcL+dili4CBxFq39
 y+vqlgKih43ybVEZwCSaolpYHaXvvejEwK0g42V+6fHxlbuk3aKEBDABF8PoxTSrNOp2l5Gle9m
 kx/Uec1VDUmH/29WiYM8mbPxom0hmk3gNlIBXZf1Cu5U+b8VfFcx5GajxibZshX6RUZdPblO9zO
 myccbroI0Uf6091PRzbUE3xbeCgRM280ThNWvYqSyOF8puIiU4jC5ZCcedz6u/4Ntt/KqKl6b6M
 U+auoKILj6t31RguAcZp4fJ1lglHgw==
X-Proofpoint-GUID: 7bBMyNjMQBvL0Ks8y2AIMvYtNvu4qa7N
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f647ec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LcUbNKWctW3TofkTIeQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027
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

On 10/15/2025 10:54 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use check_add_overflow instead of size_add in sahara when
> 64b types are being added to ensure compatibility with 32b
> systems. The size_add function parameters are of size_t, so
> 64b data types may be truncated when cast to size_t on 32b
> systems. When using check_add_overflow, no type casts are made,
> making it a more portable option.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff
