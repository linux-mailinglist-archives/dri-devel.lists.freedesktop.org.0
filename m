Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BD3BBF260
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 22:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F106D10E45C;
	Mon,  6 Oct 2025 20:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VeRrI5GM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E8710E45C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 20:05:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596E9Mpu003547
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 20:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VokQyOdAkrZGe951REC0SHkH8iGG4oi8Wa5R5hbvWX8=; b=VeRrI5GM/WX4BhQw
 JxbMkXd7ca6eCCteTDGZk7kC7jov9DvGCDFSi3RtYj0kbAi/vWuB+X4HiYZwyHPk
 Cem8ph/EbQFyvHIWUGAsJAjQGXqFEv6SbKI90o+brGw07iZDpCAZo30OpCSSeW2X
 wn9trMaV6O9z3rJA4ZEwv0hsqTuK7R5Y0OaqplXsBE5XESfXxojRGMkGgEoJDZ7w
 MpMLTmYwpUcDPE0LOa0MEZEIcux6b6J5lT8D7X7uKjGpgkmj/JLwilT9nVwNk57j
 vz+Jtk6PYIII7oJhkAPmj9fRiXmji2tVAO2Dq1rsF/U4q1BcmqPmq+MRGTOdGyAI
 r/l13A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu51qh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 20:05:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-33428befd39so10292728a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 13:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759781145; x=1760385945;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VokQyOdAkrZGe951REC0SHkH8iGG4oi8Wa5R5hbvWX8=;
 b=jSYfK0UJg/95AItBqzAZpoCw4+8ilAJn4Fso1V2dSfO+6DawoJB3ljOubhKSr5XTvO
 cAC/CEopyUTGeYNnuq7obfMg5a+iCcd4wmDfpRihMqsFC/Dt6s5cI9kK9KFzwRY8Q6P2
 EFxBrRAe2erHwkSCmMlpbdB9P1j0Esu5D4hJNqzoU71no4/6RcT4ImryNS7FpvSi4b33
 x7O1Rf/gWb9Ulny6HwBGhJTcjC0ZkqrwtRTUfOKyuks1PypcHFiwTRW1mwyv36kPNsZz
 3LU3O9MFfZtn/xi3rW9TwujFEzCEnni7PH/I4zdU+P/fpjFBMGoOk2LJJkNs9+bp0I2E
 ZqAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIeinKwMPNjJK+URahDzt5jLQ96EldQXAnnrBZQY1sdHXtsTk++znPf6EUSiOExMgqkK1POjZl6pk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOimtfiecvKX0hgpnj1kPm4IH91Vz5YfEB3clrzjBCOkFqxyl6
 uyV1mMHAHYsY7wBzuG0TPXk0E9IF4wlmQRahfcQQhdjbIN3e9YtFPMu3w8iMVuHwqhsNzJfEz8d
 BCcudERR1lSGgMhx3AOT5FRyds+3C+TDGpQ/iJZygmiMIoynccKgtF/nq10fb7p7BKVp0F0zn4C
 CpkHE=
X-Gm-Gg: ASbGncuQwTpDfSl5AnnJCkm10yJ19Zhud1aNz8TPJmAzIoD3+u1nm+l+kCwHIiVLad2
 qY3fFcJPjhaeAjcEdCoXsuyztjATD7pVj89o9zIKA+InXl8gYuwDist9yX+s6+4CIt2ACkMpVxU
 TuzEN+B1Bpoo8RBWAY/zPmag7Mtmhttc7RheWMx6tEOkUMggJ4cXZKAb4QVrLhy6VYHp46s79L8
 lzfGzCJuRcWYii56bc8HoU/Wm2DVdK8ZgDDS3o/tKkdbBpHtmmwFFU9fjzTY+hfPwNBduqWjyRq
 h7Zb8ni8Tvj5H5cLvL98KC40MnGx+1/N9YOm9zbctue+gVaS+QtJquzMj1JbDPbxRt7YnyTBGIo
 2nRHWuha4Gf87JmdfN9I=
X-Received: by 2002:a17:90b:1c8b:b0:32b:65e6:ec48 with SMTP id
 98e67ed59e1d1-339c2707c6bmr17476059a91.8.1759781145336; 
 Mon, 06 Oct 2025 13:05:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrIzvI/Ib4q5OWm/SKnkikSDyMwUjwzWH6VNDAasyPGsw6dl537x1y+EL1bAHyFVRtexfFew==
X-Received: by 2002:a17:90b:1c8b:b0:32b:65e6:ec48 with SMTP id
 98e67ed59e1d1-339c2707c6bmr17476025a91.8.1759781144886; 
 Mon, 06 Oct 2025 13:05:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339c4a0c666sm11899960a91.1.2025.10.06.13.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 13:05:44 -0700 (PDT)
Message-ID: <cd8454a6-8b4c-4aa4-a510-98797d844d4f@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:05:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/qaic: Replace kzalloc + copy_from_user with
 memdup_user
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250917124805.90395-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250917124805.90395-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: czs5GBdkrUn3v69G0WSNpPu6R0hOEciu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX/ib6Q0IXpVDu
 J7b5DiiBG03/InJzw0SzShWX7QxGh6DjGF+dkkDzrx9nU87MXeE9XUXkTt10oFWlougp+kqu1ht
 3mOB3uMUB3G/kdGe+S88Jnx3eHd/O/bElRcRmB+g/d8/tvD46gpLf3xpMQPBqsL+zskNIDBYbPq
 zi7/lqT/f2yUfVZb+ackIYTdyCVT0VCBvdduyDMrtWzZhv4SOShyDCpbip9pxFGhRCcWBLDsEgI
 1sYXbrubKU8AKSY+bLFtGDF2bN2TWbYCEFfuv7hcq6AYYO05rw/ovc3Uu8ZJEeOvQAHyVk2RP8c
 BWY0iNrbR5rSm7mP1LYo/98ea/JfFXKmjL9nrWox/v4ZSwZHb+uEtJvDZfXCuTgavQAKEA7hm0F
 6cvQ4ORROzO7trfEmfLr2Nmb1kdbyg==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e4211b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3NveYEIoZWvbRhgcYaYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: czs5GBdkrUn3v69G0WSNpPu6R0hOEciu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023
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

On 9/17/2025 6:48 AM, Thorsten Blum wrote:
> Replace kzalloc() followed by copy_from_user() with memdup_user() to
> improve and simplify qaic_attach_slice_bo_ioctl().
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
