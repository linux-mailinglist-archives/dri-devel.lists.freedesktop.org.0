Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E305EBD6A94
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 00:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3E410E0C3;
	Mon, 13 Oct 2025 22:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFZT0wOZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863C910E0C3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:48:23 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDBoX003101
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OzaxprL0hy54kueijR5k8+wCbR88Om596F6g5ZjXXGI=; b=DFZT0wOZtLdXfJ70
 oGrw2zRjnFe36NN69YxLD0jj8U2JkTYs5rpJsCZEN7kRSQDOe/iYn32SoIqD6nvA
 zU5pkZhgMPONgxxah0/8AiVqiwOnRd1FrvjglSH87M4Ievb9jpZVn6KiEFA4BFZh
 DNzGo1dPGI8WqhZ7+BbWgAGZfQjUnlz3Xl+8iFXxMnMppb1R0L5BummDeEfP3MEc
 1q7DWRvJuFSjEPpysx2ngyEi7th9EvD17K3W4RIBw5rMS+lzUDtHoGqEiUGYen3a
 oJEM7PM0jTAAzT2KkSdEL8zfylt/ycnuC42xFpkcyjLp3q9YDCKBnFo13CM1L6uN
 eatOPg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0pcuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:48:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-33274f8ff7cso12008045a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 15:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760395702; x=1761000502;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OzaxprL0hy54kueijR5k8+wCbR88Om596F6g5ZjXXGI=;
 b=tRM20p7Nk4+bSzybPLZgoDRc//r4j9RqHnXVQXh2BWBQX5/7Wc23fz4c/Y3zBoVwTI
 v8XjdfR2XY97qkEJQbe5JyyQydCdIbNL1czo0TusTPvPeDEC4p4W4dLSgiz0iRJ/w9zh
 nseMMOdPYbylaebOy2rjliJ8xsQICTkcWDaQSuJUkNNVZxouVL6RSunHsEayjW3xP+Uy
 b++Z47u2XvHfVEFJBuANuVm9nW/MAgnDkQqjEeAqPFAMPEQPxt1JmHFsyFtLYHOCgkwC
 I9BCZJiI1DXbQY4015jwmHgKhg3zo7ug45N0GAzlFpOO2DujO0KdeAkJ2iIT/MVicaLL
 WqUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6RLV1Geh8mBtFNDcaME2lS/oouyVShEaHg/EYp5XJlBpkgrJU7eb5/YwCUz1iMtwo8Vw3Qr0duHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkGVDLfu5CkCTvDS6KDBVvbnIY/EH7nxYg64FURMT5yIV5U15J
 u2fqI2yiQgRX6mcxFFcIFoQvXuZzL7Ym6IjEC3epd6fITlMvpjeXllmMw8kUbQsq7JvyU8Ds4E7
 8Q3oXd5G3819DfG2/iU+W4oUy4kzeHQrXu/9b2885ejZ7aWYsmEk+dun0SWtI0H2b05rUvp8=
X-Gm-Gg: ASbGncu1BDmlY/kZwhj4rB23o4XS0nJp2CNxOFnT3eLHd5n1flT7/FvDSqTeACddrgH
 LE9S/nW5VWPbU/ecX5eOV5n7iaofhyGkIJbPR00IWdPWV9Nw024sFsimK2YpUXebFsjZqrGmNG1
 KrENP+c8klAZ/LDjbKnWeCzWhtoUu79DnGotONshGRggziikloOg8hjsyEF47U7ARVMUzJldTea
 dpAk03+7Loe6bxBMU+dSJzNOrBsPd4CBp+1SRSiec360+kG3uyzc5YcBoPrZ8EGiEmXRpuaRPCD
 sgQhbZNZnLjl6bRoYRHX26l+Jx+B3RZwHQe8w2SkqyKYgd/V6Uf0T21NcMRlwTKCSBF3Ez+M6xN
 tbr43qAAwvUWjEHRD5r5wRFejnqM=
X-Received: by 2002:a17:90b:3ec5:b0:327:e018:204a with SMTP id
 98e67ed59e1d1-33b50f85081mr30999001a91.0.1760395702284; 
 Mon, 13 Oct 2025 15:48:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+bBCTiQKDvO0nij0dxpozGC5LIKm6Lol8ybZt6yT6NvS0+WdijGGHZT2qZ8pvIBc8MN+PIQ==
X-Received: by 2002:a17:90b:3ec5:b0:327:e018:204a with SMTP id
 98e67ed59e1d1-33b50f85081mr30998982a91.0.1760395701899; 
 Mon, 13 Oct 2025 15:48:21 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b62576614sm13291419a91.0.2025.10.13.15.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 15:48:21 -0700 (PDT)
Message-ID: <e9b0bedb-f5dd-486e-8b9e-43e754243eb6@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:48:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Include signal.h in qaic_control.c
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX4RLNXivLi8rI
 gGQCGC/bEdEd/kR5p/sWHX+Z+TAE4GyrrY26IscI2jKAYopfC8qL0KI54kIuVf1S56eYsWHVzv7
 rB/bluj6jmbfSL0hcbZn13Tl7nGJ1chuU3BJGLJixgOTI0ghKyclCYB7iykPqrgFuFDdpT1kiWW
 R1lJXfAi9ZW1wRV4ARUQHMB5EdgG90P/eSDmNaRq3jMNu48EgDcZa2EvKqeFlAsOcksqJpeSKuo
 RGlLgxzVo9NibPiFpiBaG8X+BH2xtdaAR4MgpPtplgOkm5F9EqOSGh8YcyeHuo1Jb13+eACKpW8
 x6mlZpeIqRiHZ5LmGF365Gcf4pTiolmF4xgTLZ67U2OwGaTe5He0pb0ELkdIhnct9gTcpFaKuwM
 c1awCrM62A2qJfGMyOluoR+5v8XNzA==
X-Proofpoint-GUID: M7gXWt36nfsQ7eDrgRL4yMSmaYJxziws
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ed81b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2vv6iFeKVT2olVQFumUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: M7gXWt36nfsQ7eDrgRL4yMSmaYJxziws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
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

On 10/7/2025 8:45 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Include linux/sched/signal.h in qaic_control.c
> to avoid implicit inclusion of signal_pending().
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
