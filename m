Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F82EBFD025
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC3710E804;
	Wed, 22 Oct 2025 16:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KtU6Ht5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2183410E803
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:03:58 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAcuHE030207
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0bkJ6jeJ29nnDrwRLI2RJgTF7Qjpy+xqM2cBm1hyQ0c=; b=KtU6Ht5Et70lZips
 F43ZCf0jMKmu+sRb8LUDfiRWCnzjKRJNUt2jZEjn2f84EhFC8h8DWq5UC6pXL8qZ
 MqgCSLOc8w3cCucqmoEnfKLj6O06XPPqTR7+n+OvDTsNMqfuWP0NeAmliorDQyQ3
 urNizChjr2tZ4RBLb9iGKpgxGYJX0S7OkOy1+h6CBsCLGP5RXVU9x+9YZfzXxLkf
 bdrr2gByXUhpI3NIA12wx2CaDTQyXA6iDn9JiRRIyAGzhOrGX4ih0qFD0Dcn6j2Q
 u2T5iIPH9LcU1JzhTI1umNAs3mAARkMazs05jauJPKr3+i1enkKK9tS7XB8Zhv7U
 RjNo1g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge582y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:03:57 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-8e48b01c70aso42464241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761149036; x=1761753836;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0bkJ6jeJ29nnDrwRLI2RJgTF7Qjpy+xqM2cBm1hyQ0c=;
 b=TYziRc+45R3zKJVO8rksRVoOdeayvEZ3Q/MWol5TqgvJ39cAads/i+DMAcdv5XlIcJ
 /FwH76T+zB9vezvDWsq3tuhC8ZrWJrydMoT8isdaXIlpas7mNE1sV6pfxnz2QWUVLUV7
 vka2cPLlmsu5/TamC2MweOZLdcLENfRf+NMkRtQJtsy9rMF7m11YF9RB7ccGiK0iK4+J
 eMqNH87BIeV/vYVhzwZu5sJxigkAp+srgz/wbbvMu7dpVB1ZYwslVHY1tl9+YYUMuw2v
 SyDsn0OSKz/VYZ5UPymbDQ3CVjvvyRNy6xF+liCm6HQbzuR0jsElofOCUqIZXgbPFzrN
 XbsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+UQX/P59N2hhFpZmuMzm4yolXD6fyCsRjdY30daZidw1wSkaZsRPLUoJO+rkrHLoHW3s/MVhJ9sg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSTS1bHaz/Udy9Y2h6DH1G/CugNVmLwToStHy3v2YcmWHmYqO0
 dbsMSlJSTk3TXp4x8m2pBxMTzUhGu8h+jE0Rb33BSbgOdYb2wAIPk5xbUs42Cb+K9TVI+fkgXYp
 yVYCEzrRFxPfI8JoUWGV9zU16f6fVh7vT2ujILiBQ5lNiSqKWPTcMe9935mnv9uhRKPeqUjI=
X-Gm-Gg: ASbGncvayc70ZuoNVN9DogsSSXrTIbaBYmmgXqb4Mu1p1nLeMbCkxeLO+gqZsOfz39U
 txOxYednPM4QE5RyoA7QriCHTqjnjMCJByQmJmfs/NVC+jaKIj9MLjHQ11G3WRz7muVPQmkw2La
 O7QAbyqCnUsbX+tuUSOqGDgtFxHhduDh9zuF+yhbDb/flqu2S+o5O+beG9sHscUQkvKY9baTBYj
 a+py5W9OoghruZ1yz4KXeqZ2vh6OGN57SnlR0iHfgVL3CT0Gpi3eYmgU5D0HNtgPq6Y2yaZ84pM
 OvIMgUUGi/aLPfCK3ZBfF+6jJrADElwyufJBsua+bZdV2phKQQZB2S7Oual8jO/UURghIU3gu0x
 X2sqTxfkl4lucNriHfWH1QA3rT0bkk/XvxTmzYZtj3j2y27jK5WBer4P7
X-Received: by 2002:a05:6122:e053:b0:557:4f6:869f with SMTP id
 71dfb90a1353d-55704f68872mr121494e0c.2.1761149036421; 
 Wed, 22 Oct 2025 09:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz2OIzuiv802LcnLiAEsfb0ojC3aqzoP2E8vJYUz3+oYqqjTF4SM4lmLudV7C3wmo90WcQyQ==
X-Received: by 2002:a05:6122:e053:b0:557:4f6:869f with SMTP id
 71dfb90a1353d-55704f68872mr121463e0c.2.1761149035929; 
 Wed, 22 Oct 2025 09:03:55 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d40790b88sm30479166b.25.2025.10.22.09.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 09:03:54 -0700 (PDT)
Message-ID: <77abcd1d-ce69-42c8-9608-4a9557613d21@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Support the new READ_DATA implementation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Carl Vanderlip <quic_carlv@quicinc.com>
References: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfXzq8fqRjmC2BY
 pnClqycN4OU8iVND3ETH+2PpHA/PSQW7H8LLbDtY2X88KgVZgikCDRrO3d9n8LcFkij4pZZ27vg
 c8/k/958wBQhYSCkuPQEOQENmNHvjce5SdzC8MqEqbkNQuUvzxC6E/2WTIuN0/bbj6PKc4XdVBF
 78tSlSa7+GUT9HNl/CxGcfqTMbk+CxOt8Ig6mUHh54rnXawhtDMntqVPdF03pFxv5NY3IhzLVol
 4nCYE3ZCItLj/oAa2KOflY39YN+O/fj/N7RadzuzlUls8IpMyARIF4xRTQC3M8dM5BnF4sKlRI+
 C6uSFXtuOzrRCmfKkJg3UNqlwjSoCqJPh6LG4gIy9DIBUeL+WjQObYqh2+ulBa28zcQV+SU3KkE
 yMP8P1dtkr5EmdM/0u7Bsm9ngz0UCQ==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f9006d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hMcU9Fbdl6L4-kwaL4sA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: U4pj-TVYdOPPw9IgDwaZuU1J7yflqj7Y
X-Proofpoint-ORIG-GUID: U4pj-TVYdOPPw9IgDwaZuU1J7yflqj7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
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

On 10/8/25 12:40 AM, Youssef Samir wrote:
> From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 
> AIC200 uses the newer "XBL" firmware implementation which changes the
> expectations of how READ_DATA is performed. Larger data requests are
> supported via streaming the data over the transport instead of requiring
> a single transport transfer for everything.

tldr just like reading/writing images in 'raw_mode' up until now?

Konrad
