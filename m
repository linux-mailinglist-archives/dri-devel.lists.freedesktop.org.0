Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CB6A616F9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 18:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AE410EA0E;
	Fri, 14 Mar 2025 17:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjrhRMkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB1510EA20
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 17:01:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EDu5qg024812
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 17:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iZxIc4fXmTh7BmZPiGBzFz5sN8PXR72zH6C4vE4Nqcw=; b=gjrhRMkplGuVsQs9
 DJhFeCrCGcvtiTB/AuOtPcKHM+XYs2NjAmt1N+LV3NOOmzu+FKFLZvnd66OgPO6l
 our+icURRo0c3jm+ikJibDnsUObQ1lUjXjrwvurZoRWQxqiK/NLHzI42+49OcGY5
 y8PT45hp00XR6GRfWPkSG4CKBhMB7fbOaMQ1ukOF/smeEJHxsoLlFJqLsNXUkVFO
 kFDWN4Jie4rpUc/PEyI+xkS+41U7ikM63Jie5p+wW7809koXEfpjU7hr2vAiEF6T
 ccidCVmBHEWBbilRidFoBLuS1tEY8WhwR/Ps7TuL1iD1bln/DUPNUwzWJhaRhv1k
 dMYSEA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cnscrfvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 17:01:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2ff7cf599beso3942227a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741971660; x=1742576460;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iZxIc4fXmTh7BmZPiGBzFz5sN8PXR72zH6C4vE4Nqcw=;
 b=LPJ/+zbana4TmF8xMl/YPzvDSTXX9Nr15sKyIyFkblfZ48Fsa+lFOqb+0XmaLU+itF
 mvHcp6vFDr/7idDGWzCnWYTqn1T23J/poMzYj0kLmv1Z3XawluSUtNSGUhuRQr6LdUHG
 40KwdusYBhhhAxoaqiq0jSL9xLhTR8Z0GMtfgc6fNGzXqQv3UHSPjNJmJCRquncRJHfO
 b19Xa2QTyBMipxp8+0u0Uoed0N+Djo9N5Lwx7zarI5duu01PdfEoSfLVELgQMbuJat8b
 dNG39jfJIExSPfhWFwLr+ZnQrrFRCzP/atoyGwZ3OztCKIZN1APQRbIF6TNGyjum387R
 qecA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFGG05HN0GTfm/QOMfupVdxDhsoUkBYJRb5SsvqwnzXMIKexgaJTqxhuQY9Ea6GM+jfwc3cu0sQ9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLO5v4eOgnb2txg8IcwPmOiWhXsXI0Wucik253+ph8BDDJHhNs
 XG+LXxlutbhiBy1V5tY1c36TCm6DMwe00cNo+i0siQMQCuikitxWy1NgvjIqGOZrvi2Cnq0S96J
 9+vAt/AJqdW8pDl03z17o7V1DD5A1nM3O+E1PJG+T6Xy8FFlDXYo2BYcHF+4NfFWq72o=
X-Gm-Gg: ASbGncsOKq2Pg9MMu8rlJWmeVpSeCh+1C/NbaZK8yHlVJX/kpZzZBIXCnqezqdlgn5q
 lgvEv3RkmSWR/UQblFSxGtFcF+rboD4u8gqusF6QtdAbFzDAHG3Ey+hAAvMIvETtSl0Ba2W5UJ8
 HbC3DMQqIuiJS1aaTibkmnMlgeus6OHQB5lDAOL0MDLSBC5UP48U7R26HI6dyeENLy+ftypjxt5
 yRlrye5/jqqi/SDu6vnc3LhEJG5qAFunof2/gp9d+wIfulYThUsAS/88pBZLOfApiL5lupTH/qM
 RgmzAFP7lDiNYEE3zUXISGpiuwUkfa8F+LNFeipysKDulxMkebBFT0mr7NDQ6ZO74w==
X-Received: by 2002:a17:90b:1d4d:b0:2fe:8902:9ecd with SMTP id
 98e67ed59e1d1-30151c9a224mr3857587a91.1.1741971660611; 
 Fri, 14 Mar 2025 10:01:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7BkWC19VSzRPfQ+JLJt7WQkj0MaPieUPKAMlO8qGoLHk7FT7I8XtR55RY0QuJlSCC0mYjpg==
X-Received: by 2002:a17:90b:1d4d:b0:2fe:8902:9ecd with SMTP id
 98e67ed59e1d1-30151c9a224mr3857559a91.1.1741971660259; 
 Fri, 14 Mar 2025 10:01:00 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3015363278bsm1240065a91.31.2025.03.14.10.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 10:00:59 -0700 (PDT)
Message-ID: <64370d2b-88c5-4663-8746-28bf36c6bdef@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:00:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Remove redundant 'flush_workqueue()' calls
To: Chen Ni <nichen@iscas.ac.cn>, quic_carlv@quicinc.com, ogabbay@kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250312073404.1429992-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250312073404.1429992-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Qbxmvtbv c=1 sm=1 tr=0 ts=67d460cd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=jdnOPd7pnXj7N3RGrIQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: dWZyvEAhZ-1bsPux7_Q6n3nilt_19Ssg
X-Proofpoint-GUID: dWZyvEAhZ-1bsPux7_Q6n3nilt_19Ssg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=943 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140133
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

On 3/12/2025 1:34 AM, Chen Ni wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> @@
> expression E;
> @@
> - flush_workqueue(E);
>    destroy_workqueue(E);
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Pushed to drm-misc-next

-Jeff
