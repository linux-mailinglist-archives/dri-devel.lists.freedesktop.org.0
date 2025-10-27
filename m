Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DB4C0FD3F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB5C10E53F;
	Mon, 27 Oct 2025 18:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ab7jc/Ds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91ED10E53F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:02:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RG3AdE3165355
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L1FI3SqA9pOfmjV8xLxPSvPGBQ4KBMzND0UQTvKL5Lk=; b=Ab7jc/DsEmquVDPV
 SvOH2MjBuf7UC6B56OYnD8gDunu/OWQ9xygALZPe3HxWqSIRMPTTMkMlr3ucQjEV
 WnUC28yHNDchxqrhUnY1Y6RJhg5ZDUAKaG10v/bl0Llq22MS/iH/Mrx5JWtVifhU
 C8WBNVQbUXsBUk+EKJFGDWcbnknX1VsONTQKcO05gT5HQPx7Av8Npk7yiCTmFNQ5
 xX9u5sxxR7gAeTALQLSkCeA7RVYZ/DItIRV2fJUESZTvilsXWOZtItVaLbKlh1BO
 mC+ZaxbIyAg3Zs7ACzlLoCEns4ru+jnZ17hHWqxglGvt9F4eZ622xMY+HQndcMik
 48QEhg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwx0ben-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:02:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-294880e7ca4so84177845ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761588168; x=1762192968;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L1FI3SqA9pOfmjV8xLxPSvPGBQ4KBMzND0UQTvKL5Lk=;
 b=nXXM08psteGOFUemWgR4QsCTEdHTY+9h6EtmbdACq0SJeKEB8Os2ddSImL+32Nqj56
 QFy9unsvFVfbY5JGAkEyziI9vw3pQN/+ltKSe+DoD/av5ElCCmFT0oY+Ug6GdEybgJGK
 KCORCrCE1/XKvRfp5QdSkv40QIkv+Ev2sBx3g1PJBQB8+FZREgEiD1gmpcWxrVD19A74
 F+rL2/J3r+EeHUuAOq19EH5D2MWFgJm44jU2Vm0s56oEiFLIg7CO6Xk776kd3UYrJ5Z3
 xrY9GqCXxUapWoxQeq+jIQ1DRIg7efe03MI+SxBPaUDBdsdwy3DkgDQ/QW5rku2YDbuq
 /SFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4IlRfgOkirTVhV546PG3Fqc0l+G1FMwkqmBi5XaDmSeO1gdp5slK2dW5K3920D32+B+4YFgYrsPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzotzoQxMcXDcA91W7YCyZ9uEQak8KmmAWkmIkdvhPr+0xFPNqY
 bnvAs8hFJ0gHuinnb6gI8zalDEtSVVUr9NBrqxxdIgd9gf2Whqb4X3fqfJF+OrKJq90zC5vtv8s
 X0vyDC6eYaVm4G0x0kKEYJKcHPYzS753L6XXQFeqOWWgvsk8qYPtOQcVmkUa9/cDC0eDMO4o=
X-Gm-Gg: ASbGncs6w2Fyqv9zsjdIiwlGxMfWDGJTAgMui1aLtu7irpT9NGUE17LhWD4XhlypIC6
 R18CJK5207QDBgcQDAfDZbeGmt8RuL3bd14HR8LZCNKot6h47Ww15C1AIhUC8liXxesg4eLFpkX
 7hOhhR07Mm7Fs57150Be6MskalcEULWQX8weIClIMJafxUojSGlWrvcRp2AW3Ln6HMvCtwxRC/E
 MF0xmFgcOilJ21EdDEkx7s22+a9jcCEP83AmnZF3aHI2D29t84J35a0GUtYRG+FF5/M/qc0yst8
 jzN4AlWTjo9eu/sEiMN3x/SCF+ysDZTqt+OhC8sHscTKkX58y8iMqa6n5WYU1w1cc5MJMbvPhR/
 GDXyc3TDevfJ4GomulXhXsE1CHfuYCYifcerp3cr+uFVLEIjpHA4o
X-Received: by 2002:a17:902:d512:b0:290:a32b:909b with SMTP id
 d9443c01a7336-294cb66cf29mr7399445ad.44.1761588164575; 
 Mon, 27 Oct 2025 11:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX/Fb/soGJ2BOE/l9HvCQ9vc8xa3WqaQ9fp0NImqtyDItfueYfmFOWwyouBl8LEIAw/dDtGQ==
X-Received: by 2002:a17:902:d512:b0:290:a32b:909b with SMTP id
 d9443c01a7336-294cb66cf29mr7399025ad.44.1761588163951; 
 Mon, 27 Oct 2025 11:02:43 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498cf3410sm90362025ad.8.2025.10.27.11.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 11:02:43 -0700 (PDT)
Message-ID: <7e2381d7-346d-4c0f-ac1c-742429e40a8f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:02:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix comment
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2NyBTYWx0ZWRfX3nsrv/PrIToL
 HkSOJ40ybPyQL9vlxf1MwOOP99OntR3mePXGQE+ZBOAFKUxZPMmWHaj0yqOc3nVavcqkIE379pd
 ICz2K9N5in9JrJkGJWA/UY59D10mOfxSmrCGcdN+07w4QkTkgplONf0kMKzgELE+cIKnfF34LYX
 zLWWQbuxoymvrBhtE91cC2cD0ex6/FjXXAyBTgyc7Fz4Mdjuq+zJg2md8BwxBRILjxbAzwBtfWy
 6oEpKTlII1MDdz2+LeQwYVyWVSkWopazStbjyVngZiZw05nHlBWDql8GkIaAaR2FViTtrvTidMC
 pD/JY65yZVw1Rpfl4H55QZIBeryHxKdcJEli+/Y+tTKstbxQmuh5wkAWfRJzRSgJjcTi0oqyjb8
 dY0zNLaSHMMn4pMZaHLoSK/sAD+c1Q==
X-Proofpoint-ORIG-GUID: TY3-6aVqtmLotg4WxkB6JmPJUekxEOPz
X-Authority-Analysis: v=2.4 cv=U9WfzOru c=1 sm=1 tr=0 ts=68ffb3c8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sS_EF5oJ7B5xURoN_h4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: TY3-6aVqtmLotg4WxkB6JmPJUekxEOPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270167
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

On 10/22/2025 6:41 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Replace the word "Qranium" with "qaic" in the function parameter description.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
