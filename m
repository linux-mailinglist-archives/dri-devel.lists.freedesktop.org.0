Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175D6C1D2F8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C43610E00D;
	Wed, 29 Oct 2025 20:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GHzk/npv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ceJRbzuf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0334810E00D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:17:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TEd8Y8811079
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 x0m7DvrrMgJJzIz3Hd/OQC8pD5PKAz7qk9xUQVn8zEs=; b=GHzk/npv1fBQuCWb
 fiF46ajm4Z5esw15V6oqhTyBji4zKGJsg0dr3rl7/PO01AADutnYHUpOEQERRcyf
 r9henuEKmlPh0H4tfiKguNXt6ufc3LGtA9xZHq7NWwd65W9OihEc/0abBaKd77q9
 EDhUYgET9fxqu2TXWa6oOljW2hHo1WbtOn6bRFqEkJQX18O28j5wYYSmNEx6cP6M
 zL5qjAsFmkKKHlDeMx17Grl5fH15/qAFvODDvLZq2ROzaHYm79UITdHOl20nILbB
 s/qYzp7RbeHKidKcbqgkHTyC2f50l5aXkeXGeJATyfCcGMryE/eJpOVNUByPH66s
 IcS7lQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mvg927w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:17:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-26983c4d708so1549965ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761769057; x=1762373857;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x0m7DvrrMgJJzIz3Hd/OQC8pD5PKAz7qk9xUQVn8zEs=;
 b=ceJRbzufI8oYOTTKc81RRGjDc+a6+EE8wZvzNP652GXu/ulS/BR+tcEuipzMP+jc6O
 oIr1LEkMdmOYZlwkeTZDq4DTbyM3LVKtp3tdvI3nR5ikC93639dVdMq2B5zUxkkHkmkg
 CLXu0uUOw2H5BZV31QOaQTwiFywQfd/gLL3to2858yVj6hWFkVmHswke6gEHLZxssgQJ
 1wgXUZgi0eHcpoDQSnXmyxzt3uB+coNAVDN/UIrtDJ9avNEIGaUkmXFYunODjmCqvfaG
 mbeLKucuTMCexTOUmgROhyk02qz9A7FgBRJ5sY5KDpHn/UuxC0M2sxKMu6nCDi5jjpE1
 lxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761769057; x=1762373857;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x0m7DvrrMgJJzIz3Hd/OQC8pD5PKAz7qk9xUQVn8zEs=;
 b=qG4LVLi6Fieqnw46izz+6I7ftAp+Sr/Q3XXwvBjnTUnOqMHfJO4kReTsZD3qruNEcl
 xzbtkLsUlHdu5zIzTZ2c3APKx6QTdBBKKExitoTNHdt3zIWIZDfXxTH91TNqCGppsfjI
 RiFWGNXHux95TUMTdVfZDehExw/Qaj8pHjJdlxoV0ly7PB9teTJ93fV3QaXbWIVmQsdV
 qAxzJHgMPIUe8vqhqx2cm4JJiU1cb71Z/lZLeaco43rKGu8UlT0R1tPley42h8AABlfw
 mFap4+3BpaDr0N8x56iAcUgWdHrThmHt1ukvLKVyKXKDs9k/1SrlOgpxU4GNnOwBVTZM
 HQhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNfjwH9n4dBZerW9B+rrxSUuABeKr7J54DiA5ed0mIjatvz7DX6TGTLy1z4sdM33l/zCXceXK1IrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytHebwDBg4iLs3SrC0b8L0xXTyaF9LIvbRGIeqXqSEvFuB7Awb
 d+0Kwu4Z/mqaGhk4RqHAwl/j2FQzRosIsb0NcBWmEAgR6zqzx6ERL8sD4PYSwrwnuLTe9TMylmN
 u8LWc6tAdWs+7KzltJ7bqwuxa3TpTlUJbBzgi7gn1UYOVnfaZlNKchkga0DN7lgAwHUDCiSw=
X-Gm-Gg: ASbGncuZDX3BErHn+wGyEORoqyHl2o1+pVW+g9ApF9LnUZyOSAD0QpL02UaN91iyvcb
 nYuPW+QyMjI0ncRYnG2m3vGQzIiV8KfWgCkSAg/A5kpPCkm4+NYQxaKUpwVOge9rnfWfKdLS8dt
 tJ1aPgdHOOLZJ22T+30TtId4+45RJBRg7PSa3bfd6wraUgY80Rf9UBy2hAnkNaabGRXzBKj0KGQ
 0OWRkkZARCDRJ9s/5+fo+0wk9WDlwRPNNt1hs5Gsrk3J4h19vdzfEsJeg/mU8u8exRmywns7LvK
 uOLGoK50Xfb+N1HD2czquSgZoRAkJfrzRSZESIjlsi4BAIX1+MB7Qq80R6E9O/XJicW+gA74VQS
 a4PhBXcrZWxLHYqLlau7LV7HDo34sFUUtGUScB12JySZhxG2b+2Sx
X-Received: by 2002:a17:902:ce82:b0:267:44e6:11b3 with SMTP id
 d9443c01a7336-294edd750c9mr6182345ad.45.1761769056829; 
 Wed, 29 Oct 2025 13:17:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2BYrwqpx8pcaWsrl2lvQGQBBdeSElQTU2FlmK9qpes9rhkq7WmwfJqifzJBVDHEVPh17neg==
X-Received: by 2002:a17:902:ce82:b0:267:44e6:11b3 with SMTP id
 d9443c01a7336-294edd750c9mr6182165ad.45.1761769056216; 
 Wed, 29 Oct 2025 13:17:36 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d230c5sm161581285ad.47.2025.10.29.13.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 13:17:35 -0700 (PDT)
Message-ID: <6a8f86c1-0d7e-47ff-bab1-2ba4efa1c766@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 14:17:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Disallow setting sched mode OS starting
 from NPU6
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251029201554.257708-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251029201554.257708-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE2MiBTYWx0ZWRfXzeOpMZWFUolI
 3TLcg+/fVv0f//wLG4HZ34cknGOSZ1qWn/EqZD6SuUtIIl0ee8FKqlxDxeetdS+c28p0jCvCmyI
 OpeWI+eVCUNF0UyIgEI3InvBwf4sQVm3uSaD2er1WGYn7fn+n9Il3ROC9y+x5yYLogYnZx42VeS
 t1531fBTOPc4H29+CrMHAsLa28CQy1TLF1lPpWQWSHnOrleVPDQVA6b4oS4iUGae7EYRcJFsxjG
 unnr4llmibsnyi6g/BFgrHTTmu3AfYsWMouTbVV/lwu6oz6GTo6Rw/WuuZv8lamQhoFyyURuOo7
 P1MgAse+v5XWnda8rh5Z/vQkyJ46VrNtX2ZWnFwbRLh2Xs/xXeLUlNo8V+gDwiqkRSQb7aGpnRp
 MQviKRD+piAVzGrWMOfpu8TBznJbgg==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=69027661 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=0x_7RVsgVqUBPWEIsiEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: p-ksNzU8q-0JTev-lEhT1dYW-KVc-2oT
X-Proofpoint-ORIG-GUID: p-ksNzU8q-0JTev-lEhT1dYW-KVc-2oT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290162
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

On 10/29/2025 2:15 PM, Karol Wachowski wrote:
> OS scheduling mode gets deprecated starting from NPU6 onward.
> Print warning and fallback to HW scheduling mode if OS mode is
> explicitly selected with sched_mode parameter.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
