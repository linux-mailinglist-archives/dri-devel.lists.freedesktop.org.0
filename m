Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C994BC48B5C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 19:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E1B10E237;
	Mon, 10 Nov 2025 18:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQ8ANLLy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDPcz9Op";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E15210E237
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 18:50:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAD0wNW3676827
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 18:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RrsqLNacV7Ae9T939lkJ95hgRyBZA3cSW6oQvnilp7Q=; b=eQ8ANLLysglmEV88
 MDw9r2QGq2ZNgu8euJvumCzNGM2H3URrC7z4D0VUTCGKH/ruVgQRn4xq7vI8rNsO
 Cjbmw77aXsU65D4WnMnI+8cvbdQtk2oHe1tr9g2YVOZcQnLZ6GJiwmBk7EfEewzR
 WsVmfKBTbozctStCa3UBE3tDRu9akIOj6xTkvAlBzboIO3Ue9A6weUdcZKF3Hkz9
 VjmsOR680noAqDgJklluR6qBErWEV8I8CVaWYSre3ewEAYgjthVBsYjCK6rnV3rq
 WoyymRA2zJRjs4FdGhF/oYObuIL52z0J8++J+FPomv7NvBkBG0E5SrBx0YRWQ0Gr
 DCMcyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abgjh94as-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 18:50:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3438b1220bcso1904535a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762800607; x=1763405407;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RrsqLNacV7Ae9T939lkJ95hgRyBZA3cSW6oQvnilp7Q=;
 b=RDPcz9OpHWj1leQmRU6C/RK2+wVFdSzi3K3dbkUYxlYAYdw5NRK2fqjLLF3qCC8fsz
 8KXL7emO1CqETCWGJ21TCJS90YJL+nKmH5MIyYWlpbCtXVgH5Av/mXHI45OR46gE9O3U
 j4ODp3gD5aQAf2naxNcdnCDAXvbeiFZxZreSWAUrmWpHAL8xMKzi2i5PA/9OCwa1rjsQ
 e06EPor2cNNpTM4jm2d6DsvHpRTJtJJjx2p2tJF6OUkEIhZ/6UQk8L/mrv0BUz8JkOKu
 Qf7tZ88KRSp/j7/mIO+7s2VHkRsJsqsI3Mlmpk7Y4qPZgv8+6QMyTikm58yqMWF+60IE
 bouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762800607; x=1763405407;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RrsqLNacV7Ae9T939lkJ95hgRyBZA3cSW6oQvnilp7Q=;
 b=N0uT5geLJVYPOI2DvmTR8lyIvNMH7akN5mxN5YCTjG42yJvqy/zESBw1hLEU9RUSlD
 VYoDQ56zomE5Fg0TmhEgDihsYOtLESCv6u7IaAr8k+hWjobBC5NpmplFekYRfPDA0C0d
 9a/wlTuWZk71juEgrZIdxZ7ZjA3BfF/qYPgxy6J+sa2xtQW0N0twuxKQbHI2ikWpxfut
 B7uBKJAgdZHK90MswO06/c/xwqHv4JGzCaOB0C3DB9u5RffcNxsFACxcKWwVaFsyYj2J
 Qkud8MGERf2uHxNDqQCYfbldfhQIrGQwl3+iePfLrgcdP0xBZHA0xtnokrnnuJQCqJHQ
 VaFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ8ea2W7ry6vyEyU/YWolNM7taaVRtoVqK/jRsS290+0LTnZsgryDyWYlO8htPiZ2xsCMCc4LWhxA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx27W41lOu4WclFOKXYaalbJPL7on/pf76GQPFw7c3t7A5cygR3
 juu/hVl0TsdBUIWqmBAabNWGnZoNYxO8U4EE6XhByz1KArW8sbGIUmM22J9s6ZlkQ/QAnXRBZvp
 sQPbn8ZkHG36FEIblW+YADjs8ZqcNwmeCNKAMjWTJliKi+MN+DW6Xw72qRzy4VW1y0XKm6ow=
X-Gm-Gg: ASbGncusc5kSp+3jTUZSW3mp9wJBfkizS9zSeTJb+r0G28UWFGaaIPthDj6ficBsHtm
 hKTbzE35u4mb6noH8SKzHwH+12kkUkzKsXEXQOeI35h8yHkuPGPdjQnMG8L5OPMTfJTRa9ZTnsz
 6qx/LDwoSwzX3elefPg5EvOX+C6aWm3BKPtBmWZrdNLWW+W3YnL73Hoysm4/hkD8Rr/aaWP/8bc
 Y0TE8/yvgDPC4DzDLpzzNS0vCgE2p1JUQPwm5Qs86h2xDGTzee0CSouQEG4YM494X7sGKVT8YBa
 kX2zUPkwdYSvQXZoSisCyBMQ2hdfwCvZ6jzlqYs7mPK5744AsQKJe1dVEnIBVYkIiqqtK5zHiRq
 bTsHAjaZBv5fEcp0e5VJmBu1KJdT8+OyIGBR9JXiJLaNQZ8OfOvzi
X-Received: by 2002:a17:90b:264a:b0:32e:a4d:41cb with SMTP id
 98e67ed59e1d1-3436cb73f0fmr10032674a91.1.1762800607070; 
 Mon, 10 Nov 2025 10:50:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2ixeW1TzGwl+WOFs/7oSmDpLI/67kOgWoub7CURXWxtpro6vNnQTPq5GNpFvY22qB8U2+fQ==
X-Received: by 2002:a17:90b:264a:b0:32e:a4d:41cb with SMTP id
 98e67ed59e1d1-3436cb73f0fmr10032634a91.1.1762800606409; 
 Mon, 10 Nov 2025 10:50:06 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343bfef789esm48975a91.1.2025.11.10.10.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 10:50:05 -0800 (PST)
Message-ID: <8f1028f5-039e-4040-a7f9-58ddb3b06cf4@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 11:50:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/qaic: Format DBC states table in sysfs ABI
 documentation
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
 <20251110035952.25778-4-bagasdotme@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251110035952.25778-4-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE1OSBTYWx0ZWRfXw3MlAPBht3SU
 gi4RaXdbBXOsA1Y1gMWQjy8DGjg6S1V/Ak6TGY3OMuMkfC4vVmrp3HJM226bSuDQ5K6pYj4T/7X
 EGRR6keb02LxKvw5KY0bje9Wrm4opmL6H7itUJK6E9Bao5uTd+Du54ITrlleUbmO7VN09AQhb9v
 TDilamGWQMAhqwFaXFuQjN6veRZ1GDub//5EntASpMTO5Lg56f/hqoyt9uE4ol0suaPYy5pDJQ8
 D11MrIFCmI37TBIhBlm/GYo1HHFIlssdRhr6ga+vO8WEi8FMRAouZ4VA2akcur/CgSAS5QeKbqo
 VjyIVf6fGxpkWL/7eRn1WlINr56Sfh1uHxZgwxj1j1HVpLennJf29QwnELew7a1nDW/+O2VwqiL
 o2kJM7zSOS57J0i8nGA4IZi0QkCHOQ==
X-Proofpoint-GUID: ndgSGPM3PDZoHDo6yfS0Fz7T55qdgF8k
X-Proofpoint-ORIG-GUID: ndgSGPM3PDZoHDo6yfS0Fz7T55qdgF8k
X-Authority-Analysis: v=2.4 cv=La8xKzfi c=1 sm=1 tr=0 ts=691233e0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=p_F4U7gO7gGRQ7AvxbEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100159
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

On 11/9/2025 8:59 PM, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:
> 
> Documentation/ABI/stable/sysfs-driver-qaic:1: ERROR: Unexpected indentation. [docutils]
> Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> 
> These are caused by DMA Bridge channel (DBC) states list in sysfs ABI
> docs. Format it as a table to fix them.
> 
> Fixes: f286066ed9df38 ("accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
