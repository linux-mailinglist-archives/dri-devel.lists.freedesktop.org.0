Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8CFC0FDDE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:13:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7722910E548;
	Mon, 27 Oct 2025 18:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lg+/QOYY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A1F10E548
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:13:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RBK3nm2547860
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ko7xtFW+5pu3NdSbzBTPvaaqBJRyQJS4Sth4kjrm0Bc=; b=Lg+/QOYYW0/kbwjh
 ZIBxTQEdQgKw4Y8dQgAuEJC2xS2KHOCSq+fIgy/23g97tiS2Q0Epr7uYqq2Awrk2
 duqYHYkEy1pz33wqd4/gQmNZC/TBbiARZ/ymLmynrVKm8HByVYJC8kxTvyhQUQda
 aHKFTOBWgERdowZd+8HRHnwnXD9vyRtbKAeU5AfVmu/QMzGOy/PgShBqsRMicCJG
 KKmEYCv9t0o4qXawgb8YYLBJWzmF89+8Dksgf5shHR4LwIQFx8ILYSNQ+RKy7ivo
 +5Z22l8Oh31wqp9tXkmwFSKjfcap0KrnxbWN7ghyvih8cjbGoRF7uWAak7pppxY3
 LL6msw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2hbew-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:13:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-26983c4d708so37682965ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761588813; x=1762193613;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ko7xtFW+5pu3NdSbzBTPvaaqBJRyQJS4Sth4kjrm0Bc=;
 b=tSQYNK2YTxxGtJMQhFrVIjZ8t4zf0GcdzaCETmRW3NFg0tGBvx99FfIwBMaUQiVv6W
 vLVVtlaHjn+gIVWJjnAda0C+7yYcGHfcX9cL4e/iPRO8F2YIYHqli9e8VhzGcSH40OPf
 J7CdBb92/uAIOkb2+SLW076u9cRlAB6ajWckIv56ArIWZgJ+ZW1frBJow/HJ5IuQs69f
 ugJO5Me+DYN6pAQ8cmIhbd8V1L9k1xbGQoIx6cYViUPBkVQuDs3r0YvofLxGgO0YfsZQ
 2KVhTe2aZYCoX8orRBTStewct025YoaeilpqxmABQkGPSLT+ppQgD6JgI8ndntoY8V0/
 hOrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWleg+J9rD7hz1KbntlT/WTDPcjoYd+uxT2hLbkmYru2jOmzYO1TodAi/YWS1pnRbzLGdBoZqI3ghM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4BSXl/UWvfki1dn+UssZ4Tl55nQxggUh6t5GeduYv6LMhX5Py
 z+qpwC5Wha7JVFo2cfaPgtWVecZ6HilCTTVUvQGeOgCoHJXogANHDvRcfggYaKw3aqT1cOm2Ho3
 w1YsIzXcfQlBN/IwuxtYMMIfJ6MJl+PMBSYfv8Wvn3lfWjfW4eK7DLnOurmAjbD6HS/rKNpo=
X-Gm-Gg: ASbGncvnN5BiLH1slvqdLy03Wu7bOiraLmsk46ofo9R1WYibyS9fJYsxeNc40fjIdRP
 sfaSGxu00CTMvoDwihOgvbzEiuls9CwVS843yt+5QQxAIB/dhmGgqRxnWPasY1XfF6R39nQUNNA
 r4e8DBRJljcot9SgySCxWepma1ucSNx9SQCBSLFE86rKmtTgvh7YXCubQRBMlv6jATdcYkO7T1c
 SknoY5GmNwJ2PXA8cFN4LAx07RcW5GCdRCtCD+0M8hIIID2e/at/LJCEDgOcnn3vHLJoxPzkL8A
 i2675G6a1B82v60Vq784JuG4F0GwAfMc3v6aPEfaYArKfojSbGLlEuuLVQ4MhxLDPJpw+HHg1v0
 nhnnJUY3prFffhOMxGSZ73+zeJUnkv5FPVGnK31pQHv9QqIs+H7x9
X-Received: by 2002:a17:903:32c9:b0:267:44e6:11b3 with SMTP id
 d9443c01a7336-294cb500981mr8751515ad.45.1761588812676; 
 Mon, 27 Oct 2025 11:13:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBQV0mYg4+c3tpqKP9z33om+xk/9GUbHFLZ9sN5sNWQFbeJeCJmv0IvSmn4u6LKqxZJyDtZA==
X-Received: by 2002:a17:903:32c9:b0:267:44e6:11b3 with SMTP id
 d9443c01a7336-294cb500981mr8751075ad.45.1761588812192; 
 Mon, 27 Oct 2025 11:13:32 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d4288asm91070335ad.84.2025.10.27.11.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 11:13:31 -0700 (PDT)
Message-ID: <84d952ce-560e-414c-a497-b8331e944539@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:13:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: rename constant for clarity
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LONw1FqYW70LIKPYfVxHYY_gPkg1X-JU
X-Proofpoint-GUID: LONw1FqYW70LIKPYfVxHYY_gPkg1X-JU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2OSBTYWx0ZWRfX35EgMGEMMeQl
 lY5MzXpjFSrnQKwDSXkrQJcabBbD5cv6edN21JZwpDD1dwxMuKfKkvz8vivyKPHflZ+qCURVTiH
 vk3d+WEBC47ecUwbbB1nQ4RXyFGCho7+WiJGloSkgdfUsc6XK1nMlN+AyaoWF1/m7fx7OCy2sR9
 MKogqX3J99XeSlvbClQxdyAK/EV1xRqLIaoFToWvQBsVTzjE3fXtc4UZf70Oss86YZQ9yFbBlP6
 D4H/Enx9HEWgjh5CFEhXp0zJIFhX68drRJ8SMQDRqZQruFXPA/5RMUpB/5ZR3gfSjEk+eij5Rh3
 eh5OBRqwf4PzwEyMeV6CVhzAo7ymf+sMX7avtlrRmImpBEJ4GqoqZHYczX5bcEucsTyE8vg0jID
 vxRn/3JU/VfclqtkuqyJz6HPimdY9g==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ffb64e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=f2z2pkWm2ht2ZSlzglkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270169
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

On 10/22/2025 8:16 AM, Youssef Samir wrote:
> From: Troy Hanson <thanson@qti.qualcomm.com>
> 
> QAIC_MANAGE_EXT_MSG_LENGTH is ambiguous and has been confused with
> QAIC_MANAGE_MAX_MSG_LENGTH. Rename it to clarify it's a wire length.
> 
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff
