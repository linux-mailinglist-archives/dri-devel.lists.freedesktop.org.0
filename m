Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F88C0FD9F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B8C10E16C;
	Mon, 27 Oct 2025 18:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="de1RA2UM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B36B10E16C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:08:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RE4RN33018086
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Hvn7LJasZvefGH9/xPy6TvYTOwT6SohrY6oT5mpUx/w=; b=de1RA2UMmZR/C7Fi
 HSdjA5nbIFrg4EfkFE/4UIllX7bmzHc9vgvEwFDZfqCRhEuUF3j4g4l5X/N8kMrU
 aFT8BYRxA79MPKtUElLQ31s6Mc/B3n/FKNmUxuYdrWXXb3bSXCklblNDdS9Z4VzP
 6yBbWEBdB8Ki9zDML4X6+jgcAJBnIwIigFzQmdO4cLSXspsZEeWoIMdXU92dX1oi
 O/WWyNrFlZ8Ppd4htrELT1joRQT5qwzpG2ytpye1vhEPVhsbnxQ752aVvzudanep
 R0qAqkPtKyYKd1J/9zMNZvylqb8anvL6o3vOlDTS1/92UVeXbaK70tn2hDIgw5Ho
 qAzeIg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2a6a8uh2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:08:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7a432101881so2340034b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761588531; x=1762193331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hvn7LJasZvefGH9/xPy6TvYTOwT6SohrY6oT5mpUx/w=;
 b=wwcbB3H1ukiwhOlhXwC/DaMn/Pl8zxUPfNTqaDDCNFP1R7woprPnEEN/Cp7qEBa3nQ
 xq86q8U9vcYOd5X6G5ShVmq92vX5UHj6+oXbGhkp3MD3kdRtPtoTfUZwciWfnEHpo3Ln
 G7sZcmEIb0dg0CW3qgCp1ZLZxXDO8J6WxDxqERkRTLKR08GWYIU2zi7W7ZtAymW/LW6c
 J2LaOCyn2O75bUl7kJ14ON9vIJE/LPbtxJgnPD5UWv4b5iOGS3CM2QD9PDjnYiwkhHav
 d9cTeEmnpAxCqUr6+Pj+WXWGANgOjYgfJh+hxmqecPLg0yxKEVpAkkE102FgOepkNfmq
 iw/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyZauSTghBZAvM543OG91BQ5YVQF7YSHy6kepLBomnrLc2W0W0JPXGYnFeZYO0lYj8L4zCv7DV+Tc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgCn2oOOjGpObIvu1k4H+Uz1IALZxQqSKB8vsXUTFwNJB69iIa
 dbHZfszuRQEVBorwWNuo+8rkr/FzMcuMGYuYXskwrBhirG4mgzLCX5w6xJv3J2v40UG3MBu0+hN
 fCNjpsDz7bewHwRZpN/bxEDNP11BF5uFGRHM/OcstdEcGQ92xXXJIXJtEDsJ6SXzBGay9t4lLN1
 xV9Tk=
X-Gm-Gg: ASbGncvKuxEBpxaM9OoiPG83vopHQmaB80NK39ta5MMVj6KvUasTq0MaM0iCizlAHwA
 Hlxh3jTpFIat5HDTwMpvEwqn6Lr1h7USNnGZVqfR+BExaElfZZ1keJ8rhw70LqYoWkzXUGu2hAQ
 Px6vkdloRN340JmB+mwvs0Q/PWVy4RcMNxkK35kTI4Oby3zevPSOVF5P8weSx0OPc78xEuqq8Yj
 Ij7xBrXapzCN1LK3tuvMM1vNGt0YiQsl4F+avP+D8EzcSuW8nl94o8p8sofMCmJjMq5hoUIxlcW
 adofNgEqgJINhrssXk86+t4bSc1lpgofvkLWw2/sgYx09G4+teeVd1yedmeK8PqcrDZUucNoQ3O
 GgUPv5l+0pgej+e+wQpsiEnPRwCXf8gR6egtuh/hk2cXjspD/nRnf
X-Received: by 2002:a05:6a00:2d09:b0:781:17ee:610 with SMTP id
 d2e1a72fcca58-7a441c317c2mr1072135b3a.17.1761588530706; 
 Mon, 27 Oct 2025 11:08:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnFqQqxMR0ZuuYg0MuwEfEzhNhp2ik33Kx9l+7eRLMndtABabQLoRqA3ZlvV32tZ6Y/G3PqQ==
X-Received: by 2002:a05:6a00:2d09:b0:781:17ee:610 with SMTP id
 d2e1a72fcca58-7a441c317c2mr1072072b3a.17.1761588529993; 
 Mon, 27 Oct 2025 11:08:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414065418sm9024634b3a.41.2025.10.27.11.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 11:08:49 -0700 (PDT)
Message-ID: <2a35fb51-028b-4dde-99d4-ed43aa4bf399@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:08:48 -0600
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2OCBTYWx0ZWRfX74KOCepgVeCQ
 rjGL/ilCq23Nmgu6Gd31NTCzd63B5aDBIGMJtZ55Ure/VRf2IgxLKy7uJXpPDP+0D1j5bcKr1rw
 IW6leJEsMqab8BEckh92+YSYg7j7xx/p1oc40JS6XSlYniM9OURv8tfEbBYdpnISlnvkqAsKYdu
 /HAD6s6r3hwedSMtE+FZA9ggYPpOJED/alAIv3OPdwFzmll04XOupcVczVT/PpyhzoV1IyxxQ7m
 UgxYk5PMNRixqTgpvHTS9XrqsLkwb0enAewe4zmyJoEPeaZ9Bg/ARNxjhnG3EzFAS49oyXiTmiM
 48qWch9+0/Ik/bhFX/34/jf5QqjmMHYJ7p80TkQmfxO+CUx71lJs1iS4GwOMnTwmBicEXOKhwt7
 Uzfz3DJhgRli2fXO4pPTtpmiqr12AQ==
X-Proofpoint-ORIG-GUID: SA643O58NEmMA6j6NZe6Z3QyL0w_SnCz
X-Proofpoint-GUID: SA643O58NEmMA6j6NZe6Z3QyL0w_SnCz
X-Authority-Analysis: v=2.4 cv=A6Jh/qWG c=1 sm=1 tr=0 ts=68ffb533 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sS_EF5oJ7B5xURoN_h4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270168
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

Pushed to drm-misc-next.

-Jeff
