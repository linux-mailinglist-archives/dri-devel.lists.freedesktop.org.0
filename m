Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F1DABBADB
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD2210E023;
	Mon, 19 May 2025 10:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3Vk66tE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC6010E023
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:17:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9IMVP008335
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=38yFzxzLP7WsusMjcMJPjscf
 7gCZ50TIPoH3b8yCTvI=; b=f3Vk66tEMveDPmgf5+iiE5bbqSNBNmKzhHQLsJG4
 dBmkEHKjeJtGW7OrlNcPf5AayrEQOABgPVAgScYBUpK10FuH72/WCc5L889u9zm9
 H4SujaIn8/6eLeM0RQyF83SJ2IjSKN+wYhysPMQmD00qtItHI1Y1mi5jUQGczcm2
 F0/ZMNBe6LqIrvD+PM7RluaySQeOo/8RdjMg7WlzTD/cOjp3Ssj8P1raXOchwn8U
 REUY6Y4KRsWRx3eAtDf0uR4yhpT9sky48xP7Z14Kc6T76XE2N+/V1YoWYkTAp2nm
 zvtXan7l+7jc93Hnr4ralvO2u3gtJiaO3so8B3z5lA7HCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnym0pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:17:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5e2872e57so774140885a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747649820; x=1748254620;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38yFzxzLP7WsusMjcMJPjscf7gCZ50TIPoH3b8yCTvI=;
 b=Yam+MW0KSwNCBMNW8MSOx3Ze0gTD0YlWI03oWrS2df5W8y5El2gvYzsh5jI9WSXU53
 RVM/snt9vtkivZUSrggniO5drcUvUQbJhWjEkUhi0CZTQtNhj0GKWmjOp74WNjzNh/sl
 3xxSrUngaqOJvt2jVTXNz/nAYfJI1UeuSYgpEcg/yq6cZpfXNFTd0xqNybolxCaehJPu
 aYJXX0Eh3IFs7B3QseFg3hpbDpBMT0epz/2rfxxS1MhwKY/QSxTKud84+M0f6TXeRTMK
 WShA9rOHhSYWCqoHVg7LoRSf1qw41b9mU9/vzxX/DQBXEayQz7//Ylk18M1rER/60tlb
 dW+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnNeQ9Cxv5kEoawuieiZAfAlsIagjzf8kOga9En6qDZtoiBFiXeKcXdnd5qunFZQybgdJD/Irsucg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtsEvzednwV4Bf66XQalw1j4xOShb46O5wXC5yuhbqWhtyvDSI
 gIHXKvkrhyBKs5ZwOMbLk1HBRneGctQx6O+D4yeaArXRCJuvF4KPo3hzjAAvIyufq/fZA+CIftX
 X+tWlNSR/CuiztSMITSHXqtOpA20cfU8STit+RpWIjxo5sFgq9AJkRQJDNQdkmQMz26rZ9uBpFu
 Nasig=
X-Gm-Gg: ASbGncvJhuWoUkWag6U23vlX2L0So53MLRa3GorDFQnC3CrxQpMoHl9EslkC4oOF0ua
 QpDdyqIc0uvpePd57YRROIyytXkWg9bpPVCIfkz5vmFf+DrY3WYQ6hV5iSLOm6k+FE35lfeESZ7
 d5RjqrVIPLTnWsRP2I3W/oYrTbLonG7Uk59McYuhpgxQjVBEnmzIiFzlV2bSQ3nLDcSEMrqusQt
 SAX6Ex+0ylOHTRdy92jED7YXxOSidO7we10I36jTuA9xWgzvYphgkHIpMfp0CCFz4PQhyw6Mlys
 ieZssuOmsJVMZKkXXfx54EE9CsIJn0Ivn/EaUo5z2Y8oe5/JWLlfJ5v1mYsC4AUJ0lC1MylWP8I
 =
X-Received: by 2002:ad4:4eec:0:b0:6f5:473d:e5b5 with SMTP id
 6a1803df08f44-6f8b087c74emr194929936d6.12.1747649819756; 
 Mon, 19 May 2025 03:16:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+oCZWiMuQKd0V0u/hu5x0ZrwQMkcvyy3CgWC8JSOWfYmSMsneaNA31X6/lkqwY/cjCvhyXA==
X-Received: by 2002:ad4:4eec:0:b0:6f5:473d:e5b5 with SMTP id
 6a1803df08f44-6f8b087c74emr194929606d6.12.1747649819411; 
 Mon, 19 May 2025 03:16:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f161ecsm1787219e87.43.2025.05.19.03.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:16:58 -0700 (PDT)
Date: Mon, 19 May 2025 13:16:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations
 to a new list
Message-ID: <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NyBTYWx0ZWRfXwpNE24JpB4kk
 APoq89/yhIDjzh4njgdbCmYBtpmwfoED4MRSUIU3lYgI3Pp1mUETwz+DQay9nKJ4s07v6wca0qJ
 y5s5xwphDyEcHlIHgBTJJ7j39ey0MKzZPiY/bZHhig2gPKT4ZzfI5Kl/eo7DFz0xhRXYXoyN8Fj
 wnTFIp0sahx8y9hpCX59oJtiAlT/BAwuFU31mo+JpBLMrOYVFgE16vye5ieN25p1XP5tJTtLiQc
 W2J8BgyUhe8BXhzvt1uTwHXtxCLLC9WguU0fWU0pllbfl/36r3+DtWa3B96qByeX/9C7JG7zERM
 p4fvL7mX+4HUAVskHSO3nx1Ke475PSvgZRXnj1U0VouXCl3va04SzCoXCcuTY0T0/jIXZGW/gKZ
 JiFu/hb389Th3uq2cMbuIdY3J+MK1QOwPux9+ZOjGnewyF6VFdKuupEetE6z7OmPqaYsnOV/
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b051c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S1xa-9Qv24Ug1fQ2RIkA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -N8QDikVbPccjNenZ_zOxeVONBFG5SBF
X-Proofpoint-ORIG-GUID: -N8QDikVbPccjNenZ_zOxeVONBFG5SBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190097
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

On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
> Remote heap allocations are not organized in a maintainable manner,
> leading to potential issues with memory management. As the remote

Which issues? I think I have been asking this question previously.
Please expand the commit message here.

> heap allocations are maintained in fl mmaps list, the allocations
> will go away if the audio daemon process is killed but there are

What is audio daemon process?

> chances that audio PD might still be using the memory. Move all
> remote heap allocations to a dedicated list where the entries are
> cleaned only for user requests and subsystem shutdown.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 72 insertions(+), 21 deletions(-)
> 

-- 
With best wishes
Dmitry
