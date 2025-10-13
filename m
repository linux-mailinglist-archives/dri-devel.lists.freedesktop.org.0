Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B385BD6B9F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 01:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681F410E507;
	Mon, 13 Oct 2025 23:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAcypO4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBE210E507
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:22:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD7xV002351
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ifhsVFsbJ/327iShGQMRKqlAPxmX4MkOGJ6f1VNO4Js=; b=JAcypO4VGHQJkgFx
 IWsTsN/Rx7MTqYuVO2i4CS1x6IocZGd4nNlUsRX3O18CcByfPb31q/fWSx7qHIah
 +poYC3O6e/GEgZNZ3I8pDWjiJk4E5vL3Iu+99H9xmQcyQ6JrP2MfqfUS8znCUCXz
 AhBfiFQwBpUxyKM2Y0rFDEwcxlXG8HKtm84iPvIf+fMOiqrgn+qx8VAhpyT9bFal
 KigJvudEjhP3ZRyAb6+ZBKSMIbDrckjjg83zc7976xcSKGM/btnleEPPn0hoJMO7
 3lcbMVPtgqD+t8MS6t1y6cndZSMUnw+ETBg7OMKTBubob7RCpoyjq1vYymBS9Lod
 Pcyzmw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk6fns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:22:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-78117b8e49fso15177482b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760397767; x=1761002567;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ifhsVFsbJ/327iShGQMRKqlAPxmX4MkOGJ6f1VNO4Js=;
 b=JIP/VKty/D8MVhXAiTFbZJ8F5JYQuK04od7z2orfjI7x3JTswl+aL+EODIEnAQ3pnL
 HxUj1O/y2RaTUSZwl6wwDV1SbxH2XlnmJgj2LtynZHc0jxWqkYIdWiN2ghKM4D7yJaF0
 ZgLy5E92mBC8SkOAwiuJI/vEXfsISFoFyt0pfsiU9+KJH82SiV09p6Zj+NZ0qDL8nPgK
 QZAfREeGamlo3zw73fG8ZnHAkNJUDgO7g4laGihEzqpUu+R1JwW2ztYMR6D5ejDJ5CYd
 wCzvYU+tE0VZ0AH85V3PixPwsAGF8y+gspJW8J7X46/ekoiudHUfnAjHiguslqYu715v
 hodg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnBmm6rOYKUNu2YHPSuDPcsreKg0cXwSgsBELNXb4cbcB8yVcfY77P+j2mEfC0VIL/87t4p5o3fQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdDoWWyvLR9/lNJXcXIr7Tsz0S5xZb3wFeJrv3Uo2JVdcELR+r
 B4dBEKHYEoIGV1+giGCPcOL2wpXlYmt9fnXPaxQwMVzLIUZFCziDVrnO088bIxv/i+weNLP/QrY
 139L+0ARBdrbtm3yJ41K2u3wZV63Shq7rS91Z4zRkDinBscYQzqxnAHZuVgv5tVE4ySgcD3Y=
X-Gm-Gg: ASbGncvq/2K4y10IxfoNQNoq6wdfmI4kSl9pb6koOTBok+0X+Up3WAihrFikxvFmxFc
 Nfpq98ICDRz8DnODSisvRqswNdYMLYNWVw2qSl67d72bV5z3JvylOaKjM+pOgUOGuWOfB/N7GZ9
 5C7hnYlen8BKTTIsjN1HR7VxRnQtXyZ12b496XuyjZtJy/r4XCJXupji0YVrBk0Bh65DV82Rxfn
 vuSTItMJM9TKV9RJmG4fcXKwC50eiVdHQkgn/zNteuzQq8H3XXFJrdWrZrQmlBUTca+UDYSVIRG
 4E74U5W8dmyDC4uqfEwOQ3uxcuuQ88mBRHYg/LFzJz5z9Mc54XAmhWVawjghxi/In9M7d7UbQn6
 1PcTRQv70kTUVn8OiCwhYIJisEwU=
X-Received: by 2002:a05:6a00:1a8d:b0:781:b23:6b7e with SMTP id
 d2e1a72fcca58-79386e50a16mr29364088b3a.15.1760397767244; 
 Mon, 13 Oct 2025 16:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQxZCypHkqwpji+LttTougxbangSFkk7NOFVax7EIjgiUXhLFr491MRWYQ0gk5W6RIFZ0l3g==
X-Received: by 2002:a05:6a00:1a8d:b0:781:b23:6b7e with SMTP id
 d2e1a72fcca58-79386e50a16mr29364061b3a.15.1760397766817; 
 Mon, 13 Oct 2025 16:22:46 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992bb1e50dsm12914303b3a.33.2025.10.13.16.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 16:22:46 -0700 (PDT)
Message-ID: <404c9bf6-e4a2-429c-9b36-4bc300fa3cae@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:22:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use overflow check function instead of
 division
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vDs0SR7dup1qEFYP8xDJjVpKyxpcuRaG
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ed89c8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5CQhQK5fGE5c9LPSzNkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vDs0SR7dup1qEFYP8xDJjVpKyxpcuRaG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8AP0gt6IREdD
 KCO+Fk0zzxih5lLHFJLa3rkNjhcYcBzTWsUko2fh+njcBd7ztlo7zTgaXmq/Rb0EcdicYzISMmU
 CCzj8+JjJdbLSG/0EuymMAvBJC/fckv4Y0m72iwnvzadEzp0uzLoIzWX8Y+zvWCWmfv3CNenLKu
 foAFl2hO0ShSZFv8T5uWSo+kHXHieie6VEz3TgtiAVkpKSOpn10QLVE3xxCWgz3n+yLdmQWU918
 TaXOQ3E+PNXawdYzhCbjvRWMAnj3Hx7zsDV0dRCQFRJvEbsBJ66o3juf30xSlJcEIWKYu1YqfUt
 De8v5EZrSa/iwxRypBkQnxarY8FVAPwwx7ivaNfoBBZEEYF8pbTLv1EFKRQ9dAjTgW2I1HG/Fu4
 idYE53XOKfl3nZIC6rsUFoYIwt7sKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On 10/7/2025 10:42 AM, Youssef Samir wrote:
> From: Carl Vanderlip <quic_carlv@quicinc.com>
> 
> Division is an expensive operation. Overflow check functions exist
> already. Use existing overflow check functions rather than dividing to
> check for overflow.
> 
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
