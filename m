Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09450BDA339
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436C210E631;
	Tue, 14 Oct 2025 15:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPO0HSwl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F11C10E631
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:02:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87GiF008981
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zY9fYZt0VHzzLu4AS37iClxJrmCgwWUGWEX6cCe7rKY=; b=oPO0HSwlaPRSxDP5
 9gQ5lCgTqPbigDCOKFpbGW7IfXH/QUvDPE23IuFgkPxIjOpjt8wwrxPvFeGbkYO8
 JF9wYP092lj2g4XV3eAfFG6uxcN5oUckj6RWmzqxQCpZ55HL+OtfKK1h+hy6CHNv
 xjmmJNxXlSXE569/D53qJkSWSGADSjlHlVtaHftpnFCRiD1aXnZS4TwYLll53/sx
 meK580HN+3muQi3pcwQoBF+rc8Zbtp+3vOd9lu4aAqKYz0VHwo3PqZ1uipzJfCb8
 UAS0pwDUEaHcSnouRSRZ/xq8xJmQ9rvRBliywzU5mt1i31QALg62wukZ6UBQQ46y
 2R458w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5gxtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:02:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-26983c4d708so76175465ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760454156; x=1761058956;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zY9fYZt0VHzzLu4AS37iClxJrmCgwWUGWEX6cCe7rKY=;
 b=VpqzXKZTD9uWyHzSll+OgHCmB1DIb/47V+dwWt58TrbJ9mHFw4c45/dA2BDCMWEra/
 4lsa1rQAsf8xvdjdjLFQ/+msqS01z7/UXP0edXcVxr3kpqZ5weKTg/rINfgBbLPQVMGq
 yOQpZdvFC+nBpkF5QmhHrFXcMBfj/XlqcknPE/s/XGiZ2kmvurTMKLvqE4fhb23YzgDy
 tEvplNb+M4fI3+vMW2TxSOqeI6WCzwkTPRE0u1Y9g7oOl+c6gGmC+3KZv34f+0zHBXF4
 uIyyxQegK611s1pxBKscTgu/B9Y+rTjFcIohKX0YR9QheIUKrHRM5CsdNdzyFfwcYynU
 m2UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD1i+VFzRNuNd2Ze3Wd4gjrTK4GeldSXy97Z1DUbyYsSl0LCzx31cm3TiBkzBmn5pW9jWWHJ/MenQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9WCMDBo1AGX8PZtruE5NTjY8G46x6xcFoV1rZainJPurW626y
 Slwxe7RlGuUb/ewV3Mn3cGObkCegIW6pxMLjpr19zNn44OO9v5Kk+yA9I8mPgH16a3SwYl1N2qF
 qSkbwjG4/BRKcj0jWD4m2SRsrdQikgJN1N+TmVIiAA0N2I3S5vE6Jge3mY28O495NRMj6X0I=
X-Gm-Gg: ASbGncvRZYhTeSWBESrXYjr8/HYae/sLZjTeHlIKXx7d3FAMQUOiKgsU+03vAEJH+Vb
 UkJhQOHpTQBIL6e4nxzGGHvahBOL6zv84x4hDcVMiFRc/9AekbZKflEPfjeoXt3wSp3HvQWvjKl
 uWEiED4OFPWm1dnfZx0rRckEJozEJyAXf0TmBzR8be21ZsAv1/9A1xHvdhjt42G/G3tXFTuGV0E
 Cdjx1/ClP5ycSG2uL3sxatoLnOZR/QNCfDJ20hV/Rbstibw8ylmVjkSBeAD0TSmxBiEcFqDZrFe
 kFy0pTpCeS6qP1Vxq0UYAXdXUQK/vcvza83R3nRtRvH/3SZb+4TUXjrUi6dLE9Pq/Qe42i5GXrT
 +NpakLFHForNSwg==
X-Received: by 2002:a17:902:f541:b0:27e:ef27:1e52 with SMTP id
 d9443c01a7336-290273448d4mr384789705ad.35.1760454155515; 
 Tue, 14 Oct 2025 08:02:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9fnX8gHGoW+trOGmD9OTA9Gjrx3jZSKjxxhVH8q5E9QFBXHcFfn09p6MjggvvVBUtsjf3rg==
X-Received: by 2002:a17:902:f541:b0:27e:ef27:1e52 with SMTP id
 d9443c01a7336-290273448d4mr384788905ad.35.1760454154788; 
 Tue, 14 Oct 2025 08:02:34 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e1cbadsm167062495ad.33.2025.10.14.08.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 08:02:34 -0700 (PDT)
Message-ID: <17ae8bd5-6153-4388-b2f1-2cb2e2b9ae72@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 09:02:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix race condition when mapping dmabuf
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 "Wludzik, Jozef" <jozef.wludzik@intel.com>
References: <20251014071725.3047287-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251014071725.3047287-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uSN1Bgn5OJMexNZ_nJWidlLtGsBekjcV
X-Proofpoint-ORIG-GUID: uSN1Bgn5OJMexNZ_nJWidlLtGsBekjcV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX/QUGSa2oN+lj
 dIrussEJQYvIk2huMi7NMpcEYatBXJK8/XWZoU446hPrwNg2GZ84DmVoz5N6P5JXJDRjAapnhSU
 SC9UX1JCSCuFcXwpIBiR7/PJ8FVPAGDHROr2//qPdlv5kGdAwfp/fqM45oVOLQDK3tj6/I9uu+P
 zqdxWTnVokfkkO4UDfeMooJDkX6eRmmIhMlGNBRUNW3/33jgJ5F1u+I5boUhyvGpSCpohnW3Q6L
 es8rgYTjfC+rFpuVHbL5btIzYVO0N9Znrrvzmk3oItL+CTvmcZyVJ7UckRM1U6PonpA4xoV1iAN
 WCyCs0xCT7S3Bj0rJKP54JgszxgSGQ3rPn88QCsQjoK0GAihPuqq6qYnR20TVKv04Fi2KIUHCTu
 yPRDjvJDfWWp9tGmv9D/FgUniWXsxA==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee660d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=FUbW5QVwp-ViQwghRQoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
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

On 10/14/2025 1:17 AM, Karol Wachowski wrote:
> From: "Wludzik, Jozef" <jozef.wludzik@intel.com>
> 
> Fix a race that can occur when multiple jobs submit the same dmabuf.
> This could cause the sg_table to be mapped twice, leading to undefined
> behavior.
> 
> Fixes: e0c0891cd63b ("accel/ivpu: Rework bind/unbind of imported buffers")
> Signed-off-by: Wludzik, Jozef <jozef.wludzik@intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
