Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15059B03B37
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056A010E1F8;
	Mon, 14 Jul 2025 09:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlmyLUPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E22B10E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:45:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E95gLA026582
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RAwzxfCx7GmXiy6V5DJ7j7sn
 U1MBsuON4yb7/O794BI=; b=UlmyLUPggLg76qotGeFrsy+nINSIvvwtxKOksFd0
 7RVx5g2PJlNVK3FJjpsefV8CCFaAN8l3mS5dgKRvHIvqy4SRHwvCfdJ+RDT47CxX
 ui+ArKf0zncegTI0z5dGjITETgznrr5pTqYUkhOMO2jqIO94ZeUbSITziJ2E3qFv
 1yRk4bmJwAkbHEHC4uaAyZkKrhvVlMY2kr+udDH9zxVjHqF57Li3Qc84ut8fWV9T
 NtiTNLKyoH7qbxW5gIxa5AQmqC36znJaAIoknSukVFnKF9OZHzOrVeHS167fpdYH
 Os8QxOnRyoxEOR+w8LhFjKxzpNmWya5UrQ+XHu1bnjEBgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37v16e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:45:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d444d21b24so647258485a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 02:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752486322; x=1753091122;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAwzxfCx7GmXiy6V5DJ7j7snU1MBsuON4yb7/O794BI=;
 b=wBL12aFPpcUSpEer+sjrcymiLydBFvsXdqYlhueQB1Up3qIfFvhwhxry1yBa48cKCv
 6nxHgF+nKMl0ghwf3hDAFbHHEudhetan1ws3XVUjGah1aCgjoRc45YsrK61s2c4XLZrR
 s3nib540IYoWPyMBCK6+Rig8shOwP+UjYRqQgYzkHGaKjZWgOrH/Q53ugdkBkyrK4Bns
 s/3DNWlD4mYD9gPy5JdO14loBy4kZZwPLHLi6++qQywSYxK2ypOm9ibhkzCzqHRgoSP6
 6TBK/HsFjxHLWmn++wVO90tH/0ZTc3cKqo2/qmwZv/nw2BKUi2UCjfKrZyUQEiF3yDBh
 kmKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5okjbpmtkUBFa+PHNLeGpD7/bv1tvK31p7ZSbAY355JLQSYmhFZrHohsWIBG++OjSEWEXC+cYWhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWLykkoNFPL7GVhhRdDgRmjeMdbKRFxQN1up5gDc0fb3tI1E8c
 M2R+3ZsIAhY4phN+ZHa6RGoCa+S82FjC+kF4TpOObpnVVgXSip2NtUON+S6Agp8RH5ShYa/Y+fx
 zyIPeg7WVTYSjwP5t6z8SXZCVfPbVglx/16IzIzxgTHQnKrevdWt7j0EWLxKzaxh8O0zLPWA=
X-Gm-Gg: ASbGnctYFYuCnQEfE8pZwGYR9PkYaC6/w55RFAAZPYqfQ5BaUAmkNs/VzsS5qfqk3cB
 peqlgg8OUbq4UkLBNBjIftdJcFhM8OSWrNyDVbNIEo7Y+cmCHUy76w8RGLUl9lYbEdY88av1//h
 8/U+4PuE1V2NxGTILAdfD/BvxCcgzRLVRH0lMS8pYpdcq8MxnqapzUETBtGdeT3GNfWPAm6pQQB
 nMMCuLEq4F304LHWrrEF4RtHaFF4yXXuigYep+To4airoBxaVWa6ZKLDRuBmI1kSLySPK/4qET4
 qhaGyXwYlePsgGZOHyRzdSF4VqLEphWRF4NrYKO5wtJ8HbMLdroM/ocoKSYWXgcEAseeZjOZJic
 I69ovzViD2CCS8MFmxFC/Ps+F7YguXoEy8yFo/NQthhD63VprRRvL
X-Received: by 2002:a05:620a:319b:b0:7d3:90b3:28f with SMTP id
 af79cd13be357-7dde9b5fcebmr1665486785a.5.1752486321972; 
 Mon, 14 Jul 2025 02:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvhM/t1FHIrVZWVYG9mhbjIjtg3iUsjf8ZC04xPKQpfbPSy7xMPnq9ivIn1rnjpbbWl2zg9w==
X-Received: by 2002:a05:620a:319b:b0:7d3:90b3:28f with SMTP id
 af79cd13be357-7dde9b5fcebmr1665483385a.5.1752486321371; 
 Mon, 14 Jul 2025 02:45:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c7ea9e4sm1889678e87.73.2025.07.14.02.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 02:45:20 -0700 (PDT)
Date: Mon, 14 Jul 2025 12:45:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <lzdhczkz6irj2u2cwxounro3qcmp3glqzswreoqqvxibeeacny@tiohbb3bv4at>
References: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
 <20250714054133.3769967-5-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714054133.3769967-5-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1NiBTYWx0ZWRfX1kiVUOjzlvzC
 BffpFBPEIQgVUOhnsR8muKmNyn5ruWOLgQITG0AUwunWQr7qfSVS6kkr6AINUorrdYrvfqecs67
 nTeA/Ord9f4Tido3cRiDjiIKQQqeD7y+TTADzptejftoZCj5fuKPMb0IfGBN0k72bSRjsrdhR+p
 4ZdyTrTDoMKQn75twm27gSqS2Ym39DB6FdoGNGRaYBPJZUTuNPhhwzttdOzacrwCW9rOlnGVbRI
 I1ioFasMS8lBv4BfHbKmAygw1SPxdPz2v/Nh1bUDdUv5fql4i6Gs2LLp4TcgDw1I4JSK1o/9y33
 4MZYe5bXVR9wsv4UIFhw/8WH3icEp6MpycfCboDI552slvZWvDHjByJ8CnXCZgSTuIWSL8VLhhM
 51cxzf5A8/NKmP9GwRy/aBAM1gbWza1uiFCrgF2Tq+Ti1eOsRA2RSna+wQsEhc8os59OBbul
X-Proofpoint-GUID: wDnyc9ONWSmiFKKLt_rl7l7B2EVWc1HT
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6874d1b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GAzI_fwOJHwl1SWvAbcA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wDnyc9ONWSmiFKKLt_rl7l7B2EVWc1HT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=841 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140056
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

On Mon, Jul 14, 2025 at 11:11:33AM +0530, Ling Xu wrote:
> Some platforms (like sa8775p) feature one or more GPDSPs (General
> Purpose DSPs). Similar to other kinds of Hexagon DSPs, they provide
> a FastRPC implementation, allowing code execution in both signed and
> unsigned protection domains. Extend the checks to allow domain names
> starting with "gdsp" (possibly followed by an index).
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
