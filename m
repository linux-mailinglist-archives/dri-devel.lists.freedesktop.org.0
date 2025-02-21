Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ECEA3FD99
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 18:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2D310EB17;
	Fri, 21 Feb 2025 17:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUZwCVv0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD3910EB17
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 17:39:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LDupcZ018859
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 17:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qJSZPZcYP2Ku91jA3cNCQdXAiJurh9tb2+YQBdWVSRI=; b=ZUZwCVv0j6gcP3Ol
 y4QrFrKnpNP6ezP6ra+jV0NLBs9dnDZYaKTeftAJMcDoJxRZfAQ/MLetUSQ+KRuG
 x08WpcWk3mrJOPSBpJZLdUpgLg1NMyCb+cS7im9iAVXVExLve/1PAE0YjCKJZ7OU
 G7iy8IBWzj9/oFJzm48LD6ycb9xJtRZBvPmhnnyrM7LBs3IjViB+G6aKXFv+iJng
 vE0l/xkpztjNl657OlOVVZJDzFBgGMrgbZILTag4swpnsMwJUxJ77z4Wr0O+jyZN
 rbu1HXlfgBY00wfjROmImC+x+fSMBalVU91CvS5fFs3MzwZgcDifEmGqzabmIQMk
 rG2VjA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xm3rj37b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 17:39:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2fc5888c192so4684897a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 09:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740159543; x=1740764343;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qJSZPZcYP2Ku91jA3cNCQdXAiJurh9tb2+YQBdWVSRI=;
 b=MgY1YbV/WbZgLvKZIociHrChmUuUuZhXRHSCjYRP7mc6UjFt/gVIDj9GZ+QIlHUPSA
 v/4r+PFgyDkMl+76UBDw6db3g3LMr9sdVljF8sF43QpuDHP9jIulm8EXzbEqIaVJLAIe
 KBTTWI2kY7pSU0Z+SL89uX+Wf/nJn1bLRdlwZFKuk4b6/9hPA2O4sV1ihrVPQ3JKYB6W
 IS38UlcBt6ksoiSLPx2bMcn2UPJoEeJdWoYXsLbEaTUI+a2+XyopsKeE0a/V5cLC64LY
 i3OVXnpAde/dM8JvPcnJsxLDWL6HM1pjD8IRVgxmEAW4bw+uNfZTKTqvzJDG+txvLaIQ
 Z9gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuHMwybBoawTZcqzdbqPh0ss83x+8KM0rKTx4qowEPpduf82NJgVn+X/pGm/wHak9WJTCLDPkIUic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHmlEK+tO0ta8mbDTQZppPBMkrCq+FAFD7vbYKCHzlMjwkgV6N
 JdkkS4wPMUDLug8OtRlzczgL8okcxKeoCi8GOhCW4SB6Ze82XMlYKzbsy4bIfjcl9OcnAdhZvex
 t/daXy3ecAy3djBfA5ikTUh5zaGfcFkYrjzZYYF3BNOD8ij3UUQUqmPeqob3zfbLrg5k=
X-Gm-Gg: ASbGncsJSRzSiCeTV/oLZvbimlAewa0owXZtczAs8pMPdPXLTMzVoaU6sGZ3WvgumsC
 C2Xej1B9PrwIKxPsRDdZFzL8eSB5XtSey0ZPUQogVdObCkPiOIyjQGwainDHbzgA6d97PRvvMTn
 B9gjKVN7BbQ6JdAbe4IO45Gb41goMhnBpWv6C38WX2VBicbvdl22XegwaTvOnNlbEEW0j4BEvwU
 GnJhDBBq15luNQjqWWCByBsJYjxfq1NoZpm4/EKHTrvKR8ZKgrZFZJe/TeT4PUPbA29Sue/6PTo
 QDO1mwn0Lsi/uAywRJDJjdHvQogquX/wFyouFyM+yapo1+ZBa8CNHFcED1e0J2h25Q==
X-Received: by 2002:a05:6a00:4649:b0:730:9567:c3d4 with SMTP id
 d2e1a72fcca58-73426c8d910mr6952848b3a.3.1740159543064; 
 Fri, 21 Feb 2025 09:39:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqXkz8zxBhllIdfokgGDpZd3ZGYeLK117KPq9Iou/QAcMb2F/WpEbiYZCEY3zGYwBgVKo84w==
X-Received: by 2002:a05:6a00:4649:b0:730:9567:c3d4 with SMTP id
 d2e1a72fcca58-73426c8d910mr6952649b3a.3.1740159541244; 
 Fri, 21 Feb 2025 09:39:01 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73242546177sm15929995b3a.5.2025.02.21.09.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 09:39:00 -0800 (PST)
Message-ID: <3294d770-9653-478c-bbba-7b76d1970270@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 10:38:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Avoid possible uninitialized fw_load_type
To: quic_carlv@quicinc.com, manivannan.sadhasivam@linaro.org,
 quic_yabdulra@quicinc.com, quic_mattleun@quicinc.com,
 quic_thanson@quicinc.com, dan.carpenter@linaro.org
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, jacek.lawrynowicz@linux.intel.com, 
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZyTzB2MdW9Vx4xYCE7OwnkwL5xZAi2_x
X-Proofpoint-GUID: ZyTzB2MdW9Vx4xYCE7OwnkwL5xZAi2_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210123
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

On 2/14/2025 9:21 AM, Jeffrey Hugo wrote:
> If mhi_fw_load_handler() bails out early because the EE is not capable
> of loading firmware, we may reference fw_load_type in cleanup which is
> uninitialized at this point. The cleanup code checks fw_load_type as a
> proxy for knowing if fbc_image was allocated and needs to be freed, but
> we can directly test for that. This avoids the possible uninitialized
> access and appears to be clearer code.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain/
> Fixes: f88f1d0998ea ("bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>

Applied to drm-misc-next.

-Jeff
