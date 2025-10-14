Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB29BDA652
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9BF10E1AB;
	Tue, 14 Oct 2025 15:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uw+IZm5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2A010E1AB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:31:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87J3i025684
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qYCwuW0vXBxbrPSEhIdNBbrGQgPRUXUIkwUiumHmDSc=; b=Uw+IZm5TUtXaHxbN
 e6+iah/6Gbie2qrjYetHaNom3EYrNd3vGAXNmMN02FxwQgCUqghDSx9uXBOeeQsl
 hp1BGrxh8TwwcGRD5GJ07QrwzLgqdU3bc8Cozl484vKzf+clIbMJSZoZvv4G6Y2w
 OeItvnaD8r16cwNVF7SETpV0lPyrWrAUy9abBpD/xOT2XD5MIqvULKaKO0WBAopL
 7n/uxSFpo5W++Y7nJ6qd3VRmD2WnCspPBRdhnkbnLRJmhQo1Dda8n24qDtkvAkQO
 QmMv99demaYqTtCGv6UQRnoaZHiXaGqw41Q6xRyQ+lxovZTH1CF4p+VMaHEit4a4
 ACZ5og==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg0w5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:31:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3306543e5abso12841215a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760455901; x=1761060701;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qYCwuW0vXBxbrPSEhIdNBbrGQgPRUXUIkwUiumHmDSc=;
 b=druBvLlc/k5eYBB5iXg/xPS6iQCqa6Yxd8wCpxOEFEExuDFQ42gKibzuFRhUkj3/DA
 1OPBA8cbndM8sXk7nbArvf2jeOLIhORjWhp5szfyVb5LV31Tig+24VQKa+OcS0FWPfe4
 Q29zqKpu+yQg9kcLuQ2fJzxM237AZ9uKQTofdwxlCwSH1XoGPyGeDyFiAgnNaN19scg6
 5ZkxZsZ2LiMSOwX9a9jfA7LZucXw6ZDhJAyXIjKTE45TRE1bR8IgkxXzVwrb1iKQqD3h
 eNcDeF6AKqvqg4hvZ8OUPniYuV8WkD5CinxrFgZkCsleQUBHrJZggD/xKalC32vC6Tld
 C3Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNwcW/GP4vILFxx5X5cs3z8HodmTnwq2kLVNlTAaptwuCEq3zMXKcncv1APKA2RhAZK2U9zZNIDDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxrQSGvBGsN1lQVuDGR7rvdOw/EcvyfanUjmQLS4GL6Izq+pKB
 MvbSWp+v2sYO7ClbDFp0HK/Mav6PBXg490zy7iRLe6bNHbgz30TCPlvKLjMqd4SlLXDIZ1/xbwk
 NVEioUbuQMYp3T62/s8GU4bjFEVUqTOUX0CUorsyIYA6f3QQwDG1hbXct+1K9uzs7B+BmFDo=
X-Gm-Gg: ASbGnctubz5TBLnW7vTLqpC1z9kCoiO5SJkZsCa7v6Jn5SttNUhmk9fpD+Dz3b7VAR4
 /ZKRnKmfY0IWyGrBEGTmb2ty2hMV+/yAvIX02P0IAlB3cwvhU2TLSdco/t6H6iDN6oBpRwaDWXN
 bWJ2HEKvbrgOkUGR1Wy+KkcbkXinhYDq0+nzAXkPDxHNEt1n5ZYSFhonCrhxHri5okhq5zU5mJO
 ISFA+8k7KabwtRmXZJnQ2yCCjh2QCi388/Fwl+4whT3up3Br5d9iiKfXninu16cBhpcd9VcXjes
 bsTDgaDY8jJBfWquI3hTr2ucBv/5Fogfw+twPdD88Zaj4yInEqcHF15yl7pLTk1VeqSK9IeP0oo
 zhaJILN9PJrcn5A==
X-Received: by 2002:a17:90b:1b51:b0:32b:7d35:a7e6 with SMTP id
 98e67ed59e1d1-33b5173708fmr36344710a91.18.1760455900693; 
 Tue, 14 Oct 2025 08:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpLSoujw/GWBt/kXucsfodcNlV7U7As2HjtzADrWR+/8jdE2LSLXhLWWtKkFSdYqf03k7x8w==
X-Received: by 2002:a17:90b:1b51:b0:32b:7d35:a7e6 with SMTP id
 98e67ed59e1d1-33b5173708fmr36344665a91.18.1760455900131; 
 Tue, 14 Oct 2025 08:31:40 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b678df24ac2sm12372790a12.22.2025.10.14.08.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 08:31:39 -0700 (PDT)
Message-ID: <dc8c8467-0227-4b08-abb8-97001175ce5c@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 09:31:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix incorrect error return path
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX+p4nu55FArh/
 zqKX8WWM2Y6BDajlFW0Qd29l20Eht1i6PctckSGyXQh/2NsxOQJIWRCdd09BmVaYAA8SefUNfPo
 B6Y2XE1cUlgKcUxdjYXzJDGyEkHystE2LSrvGumF8Mlk1aV4fJyA3Hn8OSLMEsvqHAnR2rt5xf3
 WwX7H+ZDb3RKWpRHhRNqXDgtDjUwEQocMvq99dYta5eH9XgX8g9tEXds4/hgwZPTXgE68+QM0+0
 D01vTCqo3qiPx/scWvvbCIj3Ap/wKFtwuOrb5qNP9AWM3TIQYPtXLWwg5EzH6g1/uINVueuZz/H
 VSxrLWpYbe9N/0Gej2ieCExQFipmIxifGXJQsuioqvFyM+elH6ut1PV1HA+b7WATNLUtJ/yE9gE
 nYxT7GXXOM/eUogyz6sO/sIzHHIVCg==
X-Proofpoint-GUID: SxQU1xmNqGqNNKQxn4Y1DJENi8FPUlh6
X-Proofpoint-ORIG-GUID: SxQU1xmNqGqNNKQxn4Y1DJENi8FPUlh6
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ee6cdd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=owB73EMJWWjvXzXBjV0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
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

On 10/7/2025 11:01 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Found via code inspection that when encode_message() fails in the middle
> of processing, instead of returning the actual error code, it always
> returns -EINVAL. This is because the entire message length has not been
> processed, and the error code is set to -EINVAL.
> Instead, take the 'out' path on failure to return the actual error code.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff
