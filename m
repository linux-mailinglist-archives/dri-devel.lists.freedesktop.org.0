Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3718CCA9E9B
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 03:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E308F10E0F5;
	Sat,  6 Dec 2025 02:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Si7Qznv2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ct6Xd5/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF5510E0F5
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 02:26:07 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5FBIuT1075546
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Dec 2025 02:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kj+JkVLe4NHXA10M5x5aCfKh
 3mIUou1FJnLXKG7p8Ek=; b=Si7Qznv2D7rfwREYtPQv3XE60atmLc6PGs3y/+HB
 3IpCffcJjNqspgVQzHQ0SSxvMzecxqXYBsOSvnjiJCcg3meMk1olOTZrqWhJIM6N
 FM4JUJAIn1B2RPZrsldwV7Zu2g7v4ePLyAK3m45E8xvoMqFhQD903mnbhfm8WADI
 zNYAjYJhzbFumlUKeIVweSWpZGZMAalmd9l9psundBEzvrQttljmeT5EZWfv3PiT
 ebLmk5AOBsk8v2WSZ3g9ewInZcE0K++DJOuLVuQup2EQTeJl6O7MvaRzEQc6/8f4
 voO73guNq7vti0qgyV5lzmMd5r1EE9XBp79te/hJDXa1CA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ngsse3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 02:26:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b259f0da04so576689485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 18:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764987965; x=1765592765;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kj+JkVLe4NHXA10M5x5aCfKh3mIUou1FJnLXKG7p8Ek=;
 b=ct6Xd5/6AC8dOtdZv6QBwz5t89fHI5OOuIRW19pvGuYrzQZCYMRJ70esF9zi9CLRi9
 oHAdDQiJxbO9KXBEW5oOcGGo1f8cR1ABlTo1faRCz0FPWyP4j1s0lW5dErgoPqYHSlAL
 xTjS/QXKk8Ard7FNWlSkGwMeC9RGLD/tE3+9ystz1DKFSpmMuVn3W2hUmQPoRqfxnuCa
 CEWb7susz5fbyH36eA3w9mEu2k9B/RXGiwe4c699FyCANHRbf6CKYO+TCfOsX3k8Pv6C
 739idCQA/rhfRF19382iXfwBFZ348P+tYJaJexh8OQFdVkMKDuWiAjk3IKUyo8DhKJdB
 HcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764987965; x=1765592765;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kj+JkVLe4NHXA10M5x5aCfKh3mIUou1FJnLXKG7p8Ek=;
 b=WEc1+pal2ViD1L9+txpw+7EzwOzX9Gl98omOEJ3SWO7jyDaJWWb/u2fj35y02fg9Tv
 3BY95zSPvBnOMgh73tJQvNWsMfDuGIPORDnQGBYzX1pNafdoNPAoSZlEbJRTn69qdPfN
 56xV7n7J93eRTgZgjq7rfhRVF+eJnbqCABdK3NffwijfwhDY9rWNU9chEYGJwLKGxsLH
 N+2rgiWAbirJyex8EtyZaoiSzhhQpjv2LYm5nSUlwqA4dv/OviDJrRijkRy1w5aKCCk5
 WyYVzRpBy89yfZFbWbvj6SS1Jmc0TpqUpA6Ia/po4002ZBgkRbiwU0WIuLo8BXIo2Fsk
 eMag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgJkrtCVEBGqsXPi62TeVPdHIs9BL4ScIL3nh5wjHnPaz8AqjUDSy3yUfeuWfD/1l30nB/72/GIxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaBzQ9UnQAoLx2Ydgoo2LbhUsCNjuVPIdM2oHr3Ve3uapb0JpF
 v8ksqpg2P7uSgvK7OMThGwy7otjh2hZSZL8hPvRsYzhC/NMy0s8t9rXcXHq6DGwOwQxakE6+Ite
 bazk6AhpNmTt6PV0h/Rk+N+88nMSdmuZGMmHz2LTExhyIu6tLsLKkfJoAmsuc0hSeA1B38hc=
X-Gm-Gg: ASbGnctyTGfR4NuU5RVgq7RxP5jGpejHZEdWUMtHPdevMPllu+vGEAol8GuM2yPms/u
 dYm6rA+WFDFh6/9XuAWgoOxFiFa5zDgSmOChIvLft7jZfKoqKjHNVyBzDY/toBjfBpk0hDLs0OR
 9AkiaISUL9aggxIcflmHVYrUmemGpNFY1RtQX76ow12f8V9VQvaxiWHtToGFEsotr8zCI6G7vNv
 x7eqLRvlO2J8jPGCFvE5hIC2RM0VhzMNF903iN2/Yxw5eo0SiKWKggU9VbfXFmXWp3tSUT7E2DC
 UQ+tKDrhOCIsVzLD1XMfLFzWneNkWrIUndgaPPbWVDCVwI2fKiYtQl7JsEDwQ//yzix1BjvvQjI
 FpYZbnJLyUG5oyKIVWHZkoNTlPT63vDGNoJI7ArOfeEFU5ZL2y6+jcXLFfbwqP2Jgdc0XYYESEd
 CFEp9dVQnV0tWXw30iDeYMPDE=
X-Received: by 2002:a05:620a:7107:b0:893:1c7:4b with SMTP id
 af79cd13be357-8b6a25369ebmr198285185a.31.1764987965373; 
 Fri, 05 Dec 2025 18:26:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEo47S/Ao1gsGym0DfLeSYhJEMj1JrY+A/SJJoulcUMV14qcvN7fbVZbhuq+l6aihmu+l/iMA==
X-Received: by 2002:a05:620a:7107:b0:893:1c7:4b with SMTP id
 af79cd13be357-8b6a25369ebmr198281785a.31.1764987964838; 
 Fri, 05 Dec 2025 18:26:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37e70595ff7sm18817431fa.30.2025.12.05.18.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 18:26:03 -0800 (PST)
Date: Sat, 6 Dec 2025 04:26:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v5 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <xefaz7ljox5drnf7gl4aymwp3cygc4fhxb3mksarqpjxm3ozrh@co4e4okm6hzf>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-3-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202060628.1869967-3-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: k4rRlw_1eoFnoPHEneruBFHKPFtvRN7v
X-Proofpoint-GUID: k4rRlw_1eoFnoPHEneruBFHKPFtvRN7v
X-Authority-Analysis: v=2.4 cv=DrNbOW/+ c=1 sm=1 tr=0 ts=6933943e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0jdaQYcEcLoElLJ8wKEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNyBTYWx0ZWRfX/NJypQKsodN4
 IJ6Jw0AANW2+swVQUwlW/WZ8LO/Jy8UZ121pK7wC7m30p9ImcBmsNgwDxZ7AcvpErlzRmLHaud6
 LuzRSV8/YGGXRXAM/53O27Vr8p6iXnOy6cMWowJalRtp8cnKYKVjWxyMpzftjzDwzQBPtO1xFrP
 rbKQtdU5gPN7ttodE9fqZtqGwCxLODMUW9AZ2Fub0eAfjFDXAgOUkg0iiu7K/zrUx/vrtMccwJb
 LR/Pk7wTeheMmAOtDF/e2mVUE0t6Y2qgzg+CpKBzbvUB8RbPXb/IMdM6CpmHM0eRHDP9AKj9RIW
 C/ZJ4oHAcA79e2QkhgVUnS8R14SbQGC65xq5hKAcWjVevR8wh+1JvbzDQQ75f8p/ufN/K8mN3Of
 WKaQlm/C3YmGUh8n2MQx5VK3/b81vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060017
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

On Tue, Dec 02, 2025 at 11:36:26AM +0530, Kumari Pallavi wrote:
> Update all references of buf->phys and map->phys to buf->dma_addr and
> map->dma_addr to accurately represent that these fields store DMA
> addresses, not physical addresses. This change improves code clarity
> and aligns with kernel conventions for dma_addr_t usage.

Please _start_ by describing the problem or the issue the patch is
trying to solve.

> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 77 ++++++++++++++++++++++--------------------
>  1 file changed, 41 insertions(+), 36 deletions(-)
> 

-- 
With best wishes
Dmitry
