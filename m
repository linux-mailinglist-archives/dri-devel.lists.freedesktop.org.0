Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B2CBDA7F1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A4910E64B;
	Tue, 14 Oct 2025 15:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbNAT1Cs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E4A10E64B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:53:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EF8kKt001489
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CYMg/VTxO+QlQZq6ElScXWxM5UsYviEIpp7XWocK60M=; b=cbNAT1Cs9JKt6ZTx
 YAhuJQTmbVGmSzDwrRGLadgnOzyGVxExaRVsX0y2KIn6gUSX2p+OJFg8ox5LFWgs
 N5N3fVx8c36PUjcdy0fY6HlFqQZgOWxj2lqMatL6mnKc3GNYnRrKfwxRAUefyzPg
 hBYjQeyruMWZWYUki+nbWxxapXJ9wHutKH3LG9VpMHf7lfGNle1E3uRwJd6BbWLn
 iQlT5J7Qkqxyt67xsAHuczTyycGMActe8NSWFpm5tAUziEBeocU3ku2uRwOjUts9
 jiXgdC8IYDepAmvSBPltOSnEAzqd9T2/WxqNeiet5Dllc2BJNrYGlQKLNBJ1ZNg+
 F06tmA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa893yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:53:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-33428befd39so22084385a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760457205; x=1761062005;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CYMg/VTxO+QlQZq6ElScXWxM5UsYviEIpp7XWocK60M=;
 b=PHwuut+3/iF9s38wGwdBK13CPtFJnHyWQcfRUWo4cstlLOsfApaoyXweZf5g444GvU
 jhIK5k5Oh6PHJweVOsRndsaAnfmdGGM80AByvSSDZjfmhEKesO67B7x2BLT+kIGn0FAr
 XtMpgiH8tLrtSsqt/G4DH5mt0OkdTXePijGw+5Re4OmUgqcQshZbeYyC+dzkZ2+cj0mP
 N6L3IQMtznmMK4XSXocKRoTzCLvAi7E+rREQPFuOMkqOcn1jqbaFGTuV95+Yi+31odWL
 0X0IqLtVI0NwUPxHz1zAZo0m+bsG5NmDeTdU9ZOtr6HjEAqSGGvRrXaiWzn7K+OxToAc
 Wp9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOzCx5OGaNMDuLWkoUDL42Jf/cFt4A1F+hUkxA6c+me0T/kBO6LaI1Gd6Y3LZdrGj/VoRiha4w+ko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0a5u1wsI6wSEpzxaDzoVrpuL06aPyZXaEbzYwmi4QcxgQjz7b
 d+CJX/95osnbaG4038GTBI1nTEyKdce4BwGWx58a9xQGvoEITHO6U+ES5rKB4aKChNQeenD2Abh
 A/0HzdQ2JkP4WKLQdJo63ZGMnO6jJQlvXCFT/5Kkvz/L0z0Nm4H4GgqEleu24gdm6pum2WrA=
X-Gm-Gg: ASbGncu9mIMFztedqNaXSIWsWhLapXOgDKlJ8H68pY8kwNWtQnTXZnvLEgeFjb4ighC
 fDydE+eZn7xcSOM7XYUnRMhoJjjVUXUMud5VjADTXtzZIqPt2la+lcJl00EpwtAAs3rUmnnxuN+
 kKxS4pj4xJXwy04IrZh1Eg5bKZBuKvP3jrAjV26xFIYMhg9tj0NwoAkSclMjn9aAnVRUrWWiMTW
 IT9nvTBbcs/Zopw8qIxJFooorKfV1/qgvCEfpOiUEgZeYD+rNj8DQWIoQKChwasHYFHzGmOaaaC
 VoYFBIL5YEM7yja1X5Bq7z9p2UmFpLKHQhOty3y9bK2rUbcYMYJBR8PrrWvsN+OuC4YPqx6t4t7
 /GPt6GV2UIgCiNQ==
X-Received: by 2002:a17:90b:1d87:b0:329:e9da:35e9 with SMTP id
 98e67ed59e1d1-33b51106b13mr30016850a91.2.1760457205265; 
 Tue, 14 Oct 2025 08:53:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFi0/h/KSkeL1r/bLVesMfLHrnMwBPy+wE5Y6BoyGC9WWR9jx7AjhcTjqZrx2RwfwgPGyESQ==
X-Received: by 2002:a17:90b:1d87:b0:329:e9da:35e9 with SMTP id
 98e67ed59e1d1-33b51106b13mr30016830a91.2.1760457204728; 
 Tue, 14 Oct 2025 08:53:24 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b7411fcf0sm10350248a91.4.2025.10.14.08.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 08:53:24 -0700 (PDT)
Message-ID: <ac804969-5901-4a9b-b6a7-c8d31c98ca41@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 09:53:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use overflow check function instead of
 division
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iPEA79lnoNJmCvZ_pK0ktezD51pAmEDC
X-Proofpoint-ORIG-GUID: iPEA79lnoNJmCvZ_pK0ktezD51pAmEDC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX2TKGIJi9BV4o
 NC7MkgrU0h1GtHYLD5sk4rUg4xpMbdQw/bAGc0TbT43WAiIO8y2bTU9PB1wZKE5ZP1/nGF8KppS
 IlpQSD3d3Rvdz/GJWV3Q0tBSTuPvhrT10yRbQcb0bdenDrdul3uMyOt2vca+ETctGpQuazwkDMS
 Mor1UkMPgpYCcABW3syZX1eirWbkeZqJw4jvQboNQrh/D7vNt/8hNy7S3OmUUVUshtTTwjqrgsC
 yFnvHEkczWbR3RUn/LgKpvXal5o0Kzc3z3DDVvE7UyKIuECIcyUjFTBQG9tMlGSa/fccw2rHjk/
 C6xz99VxremArOLaiD8yCW7DyEID0iGM4ND2pHuJJPAMhWU6TOh3SyljxKzEngmH+CigX3WdHli
 FW9okXLPg7yy7yEB+F7jRwt1R9kxig==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ee71f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5CQhQK5fGE5c9LPSzNkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
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

On 10/7/2025 11:42 AM, Youssef Samir wrote:
> From: Carl Vanderlip <quic_carlv@quicinc.com>
> 
> Division is an expensive operation. Overflow check functions exist
> already. Use existing overflow check functions rather than dividing to
> check for overflow.
> 
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff
