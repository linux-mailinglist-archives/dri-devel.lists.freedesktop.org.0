Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D452BC38395
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 23:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283B610E7B9;
	Wed,  5 Nov 2025 22:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="noKnkKvP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V11lhurk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D59F10E7B9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 22:44:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5KEx0m1784631
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 22:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 whD4rrMgKz5k0TcFiUB0yPuwca0R24xTiXw3wTTUxh0=; b=noKnkKvPYm73TfDx
 2p+zQ3ymkDzm/vdVNJWCHMX32ORuTKpxjIDwkgwdxN8Zc7d83WUbIpmxfU8Vp7Iv
 d3uI6phgxxF+cpjAEfx9SyitpyLM5O71jfCkx3rnbu+vZSxm8MUOj452D7/mSDZC
 N3jPnebuLgkURUDS5iXCfqtWsG62gvBg5i+thAiIKH7NPwhoSQDCgBszTONI+w1h
 hae/quhe3gUTd8o9AtRlQDkJmxzNe8fJ2dYaluQHk4r3japtwbPsQe+tbwuq+Alw
 YRUltC/UVhz+ApVpY3yIGmlaMEHG2advE5TV2jDcibrimF9J8EjKLbjAgJykpfRb
 6PdzRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8amx8wux-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 22:44:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3407734d98bso468373a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 14:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762382694; x=1762987494;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=whD4rrMgKz5k0TcFiUB0yPuwca0R24xTiXw3wTTUxh0=;
 b=V11lhurk7i8leHst/Vt6XwfIJNtTEgS4fKYEUvVyRMAI4rd4Z8Shi0BMJMOkSRLUJC
 CqMttY9sEPtqaN6hXKWKxqbF+1yMunmwkyzZZ8TtnGJSGqywh1F8kTH7DwVwmQV69MGf
 rCzF6NEiSUSc9PwwsZiHywn2e/MWKbK5s8QZjDHFCH3l72NBGZnqaC3ZikwjDy4ZG8LD
 99bLHtkG4br+qCQ82LcK1r+x8SrmmI9HWdCt3VMdDAMSwg6QrveMwBBTczAmaEgGVTjW
 WNINlx8G8+I4M2oU1Y+ump2vmTOekNbCJ7A8iLqdqZhoyKg4flPptI0A/bOdDATLpH5d
 APuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762382694; x=1762987494;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=whD4rrMgKz5k0TcFiUB0yPuwca0R24xTiXw3wTTUxh0=;
 b=qfia+uS6R+q2Ya9pftMZZfGFqCeMWcemDM44CiOqdkhigBnfElL63V0ep99NRd+GB9
 3eoMBJ4mIjxxPLaBPuVDUNnmqhLtLsn2RGJF/OrAbPABg43UpzeX6klYqiosF4yTEXcy
 yh6bZeGg0KawbuT2gj90ALXuz5N/S9d55Mrf5AZ1GEJAPNtYLfVbDKKvARmLHSc7EKjw
 ZmNJhbUhU4sGz7vsGbt1BJdvDaB10r7FrGcGnyid9ypV1uwJ8FwtSAD/bKh2YPuqsipj
 pQHFkjc2v0Bcw7/JyDkA/O7IFIrc05b59Aj1HdWeXFDjIohJW67moRGzPrr9fVUrjjJp
 vd6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkq+HRZZEo0Z7vGYlaEIJBo1WEJFTeI6pqrebEMztPh3GRf2U76wdD/nCPXCGGJjjdhsNAQnEwO6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYVTGcDOfiei02PyeK2lFj7knC+XzUfjT9uHVjqk9p3IVv0yzb
 veUIRa/1yYfSKRDXgQ65Di4yrehxhUeGr+sYfsY6qfupOnCYQSQdsoVEbHSeS1AnO9Y9Q/ttJRv
 tJMO04NqbuLQJ3yqcr33CRibxFMUJM+xoECFFCeC6vSve5qD0g68NaYE6sG5808+uYk9Us4Q=
X-Gm-Gg: ASbGncsxFVd5u3xEzC4wbxldWYoTXlObdsSkWCQGATSMo6lqn2z5j3/IfS/YWE7RKep
 oz+4zBx+vdHMLvRlY1tN1cDIHUjsidjjp3uXea9jcY8NksgmgPLzjrglccCHJsyCTU5OsKy50Fe
 zGa9lk0X1aW8YRMDE+L4zIa6bMCizwuJ8QhnYqzGkmSCTnEiAj1sfqm5Pm4vx3Cv5OoabNKq4uO
 hmX9DxVx4oLjA6iK/vSteaGAgD1YPAPqvWlSpkNptYBwEgDk76QD9Tl5ZmExNgsey3lEXDZx8mu
 yy4O2U2NxctMjqG1d+DWIk8u2+wBWPBF7Ox9jtx/6+EBqUqVt6oxN4b9/aXfEJPb14Hyjbmj3sk
 7Vtxke3TQf8hNFE2ov9AuVbgJ55/MCZ2tAJw2leMqS4Yr1DeLwWJU
X-Received: by 2002:a17:90b:3c11:b0:341:2150:4856 with SMTP id
 98e67ed59e1d1-341a6dd9a57mr6345348a91.17.1762382694099; 
 Wed, 05 Nov 2025 14:44:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE63ghWY/re3DtQ0T2wbxh0aL5eHg3L3Lyoqu7VW2Z0ndWUR4MkwlpZJaYlnH/MyBsNXJwQYw==
X-Received: by 2002:a17:90b:3c11:b0:341:2150:4856 with SMTP id
 98e67ed59e1d1-341a6dd9a57mr6345322a91.17.1762382693613; 
 Wed, 05 Nov 2025 14:44:53 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341a68ce9e9sm3896933a91.9.2025.11.05.14.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 14:44:53 -0800 (PST)
Message-ID: <803ec0f2-31f5-443b-af3b-0ebae776d864@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 15:44:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/qaic: Add support for PM callbacks
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson.kernel@gmail.com
References: <20251029181808.1216466-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251029181808.1216466-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X3_K_hEg5LVZn7Tx1hw-dQAtAVbdZ4ix
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=690bd366 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8xjd3bi9v8xYZN13gnkA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDE3OSBTYWx0ZWRfX/KMqTI4Uep0X
 PUOv9OasVBmLgJEhBTWBKYy5HRLhWG4Fg0mZHVs30BiSrH3FL0mDF12AAYar6EV9/67oDZZgTuu
 O776g2dY6+BC6HV4AB51Il1NtKpHbMs59+74RTwq3DBx3LhOul70ivGzD6cJ0vYTmwZnjbap52L
 W3QpP9I1DfIc7Be9BScHS+1c8MfYIry7T7OBkGe0l9/sBwjcydUgqVNi7OO73rDpvHtMsPEQ80D
 5lDGh3N9xmSk4QmE1HK4R2q8RWhiLhgHg7f2wXlZYnflJmZpu9jSy2g1wT23jM1rLOlGlrpPD4M
 znvHwEW6VWmj2X7pdv45ihn6TD1cW44ARBnul+ujMaeY2KNhkDMcBdmlT6s3F0XSULG+mKs5IYL
 MRuk37D01z+fyia6+hklfgXEoilPzg==
X-Proofpoint-ORIG-GUID: X3_K_hEg5LVZn7Tx1hw-dQAtAVbdZ4ix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_08,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050179
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

On 10/29/2025 12:18 PM, Zack McKevitt wrote:
> From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> 
> Add initial support for suspend and hibernation PM callbacks to QAIC.
> The device can be suspended any time in which the data path is not
> busy as queued I/O operations are lost on suspension and cannot be
> resumed after suspend.
> 
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff
