Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1685ABB911
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC31910E002;
	Mon, 19 May 2025 09:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9HXMhgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27C010E002
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:25:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INFX69020271
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uVk9PQQmr/kXOrlyU29F1Wn6mjyOqipYEkv8MRojHec=; b=L9HXMhgn+sALb2cU
 vGZM3AXs3u9JKi+1eXAPTTIDY+C7wAXEPqWQH4hYJCsKdbex+OoLKoxfi57MQW2p
 10E6bUMthb+v7R7A5TEHtCgSheBz1PJFJqhov9kutEohNBa9RBZMLDu3pz/fEN6r
 UW1c6qPM4MDaGxSjWSzdYFBG644ClCSXBgW8dgbf1ZQ4/DbdZbwnsdU5l7SJoWLf
 cnimjiIAwyofN7jiISmebuKMCpEuCPwV1bpPh5UXyGwWRxAYzs8sLuWVnTfjxLUX
 pS2Mye5zSRSwIaQa3VLvvOoGJtqb60A7SQLZi6992peIAcidXwdJ43w1yTdC8doy
 eLw+iQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9usuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:25:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8ae3c3d80so70645226d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 02:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747646748; x=1748251548;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uVk9PQQmr/kXOrlyU29F1Wn6mjyOqipYEkv8MRojHec=;
 b=AzGhglwjvh8O7bR7l18b5YfhuqOokVWUPxC2fl3fMNlnT9HCIzWQzNxakM5/qMRsnG
 AlDF3xLiwEu1M0LKubxmQBzF3KjLamC724N+17xw1tROLVLfOHjrrK650WG0dOZhDqEn
 UIN4mgs2RaV2zrH3Jq5ARanbQb7LIOKa2ss+iM9QAZX0HYYaPFAgICK9g+RXutkMVlBw
 oKk7mknwmW7DuSomJvxU8lsrXTHkNp9VdvyJ2yP7pvdfqswuMh3XNHNJrB1cVcfAwFUo
 fjAAYnSdTanfJJQLNCwJdtxb2QKrt8ahw0smzBMqSWU+AleIcgMlDz1uj+xe0LeSv4kk
 /+1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdhEEE0TYMpT30hu3HZdhfivJuom1u4lgQ0y1ttndk/yZgu0MEq17jcuAadu3D6qPBLzROeAwnQOw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyce0irt8SLiQv2DYFhxj5JE2p0wBsxlYo4ZqZVBTk0MQ5nzCet
 QXzIg6qgoZImkarQQFZbdqTy6du8GpBSn6E35c70/YTLP9KB51ppdJiDGq9XYuDz41rS93TLGrG
 NNp1wFF7StNfUk6GHvbJ+J65IJ0gfr8hmayOkgXYaM1UvaeJMM/7sIHgzY0UJ0xi026CRg+I=
X-Gm-Gg: ASbGncuvi0420ybqJp6f/WASeMCE/cs6H90t6FAM3GynwJxyk4Eqtqb5q2coIVZBy2e
 JyM8DZOt0Ij0a9GZtHL5GBO+E4wJhZBAlF2UdDsNiLnGjJAJ2Aq3ci3BQB8PdvthNQciy3z50P5
 qou/eiXmeqbZWZ74pSzTjYY1yHrBmJXGsmR28d+KQRQjqaeXXJufDeU2FFIoRP1ws/c9VU1Q4pB
 y6Ttkzy/+9v5eLsxxyGE+XIp3a3/ZWQfuEmuPJl3FAeQqSdz1lG3WbWlw0a2FCDld5Ofgps1HjY
 CGvN7B+bZSkBmdRCQ+rPeFtYEqu1IbvZFV6gcw==
X-Received: by 2002:a05:6214:19e9:b0:6e6:5bd5:f3a8 with SMTP id
 6a1803df08f44-6f8b085283amr192920016d6.29.1747646747724; 
 Mon, 19 May 2025 02:25:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGiafe5ZWJ8f8DrhbWyQziFJ8QjaA0cqULFEHnBX08KZJAH9eyIz0zuHOhiSLANggQAhMIAA==
X-Received: by 2002:a05:6214:19e9:b0:6e6:5bd5:f3a8 with SMTP id
 6a1803df08f44-6f8b085283amr192919816d6.29.1747646747371; 
 Mon, 19 May 2025 02:25:47 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca8caaasm11928555f8f.83.2025.05.19.02.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 02:25:46 -0700 (PDT)
Message-ID: <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KKnYa_IjdHhN2SS-LTJPThjsULAagRUJ
X-Proofpoint-ORIG-GUID: KKnYa_IjdHhN2SS-LTJPThjsULAagRUJ
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682af91d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cMXQlDtNq5-FbXNvT68A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4OSBTYWx0ZWRfXwyVMqrR11rBX
 Toeslsj08Wg4z+OCxb4QAPvOj1z6UgvvQcKiCBIAWrJBkKP82zLne+AQ+eYMx+jLQ7QRC2ZQ1Iu
 x6PqX3HTokTeS2IqnSQYCaBCy6VKAv1TVy0FViIcze4RIUUYho08uRenOzQ/iFpKVdH0XiGH/Bp
 j624Ie0cy6zmOmXyq2u4I1n3P0ImPSm1LVjJ7NuoIQ7g6uKSX22YuygbU1kuAIL4OvYu+P1p7nI
 aTrMTb1JWiGOnfKwyo2E619cfoPddO6Mv0mcnGnLWM7fMsx3u9d7EaFp9fBd1ObPeGz00qwiBNv
 FNiIn52lVoZQk+/M60fXFQAypbSjxOWGe0+32r/yYCwwVZp34C4lo33ZI+bcMaOVA0QvNjIBVq2
 wjBsibWem28J32PgsW/wQAwn5ZWAxHOj2dL+qJvUprfBvDpzPQS4f9BhI944X5voo3MKih3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190089
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

On 5/13/25 05:28, Ekansh Gupta wrote:
> The fastrpc_buf_free function currently does not handle the case where
> the input buffer pointer (buf) is NULL. This can lead to a null pointer
> dereference, causing a crash or undefined behavior when the function
> attempts to access members of the buf structure. Add a NULL check to
> ensure safe handling of NULL pointers and prevent potential crashes.
> 
You are mostly defining the code here, but not the root cause of it,
What exactly is the call trace for this crash?

> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..ca3721365ddc 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
> +	if (!buf)
> +		return;
> +
Most of the users of the fastrpc_buf_free() already have the null
checks, It will be Interesting to know.

If we decide to make this function to do null null check, then the
existing checks in the caller are redundant.

--srini
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
>  			  FASTRPC_PHYS(buf->phys));
>  	kfree(buf);

