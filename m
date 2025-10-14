Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A377BDAF27
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 20:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2C910E679;
	Tue, 14 Oct 2025 18:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlul6K7r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9415E10E679
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 18:31:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EG9KCi017772
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 18:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S0juoXgHF0YKeslMGNakmRLxGpZ7d+nHIP0t0vVpCcg=; b=jlul6K7rGWmoJNjY
 37wtxqjCpoGtpku8hm03KxwGM3bdFVOzmtbTGDIe13y2YHy8ufhgTvrkjJGe52/x
 /b1FFOkB//Kdd58DArOjPhqLD/2nCEnhCNpgWOT3NHoO2yyH46VEEbPT1sN6ncX9
 f2HCzWnaU/Jr1BjcWG5D8dhPpEjuDpUCMoTJI5qfOGwORq5KGYYvFwe7h79ubufG
 LCYkW9zyBYwP5ekgK9TdTtOyCGS1d1/VDoOm2m3c4ZFl86oep0hTWS/spumcmnlI
 8lJxV/HNdfZpgGh/uSpg4SB8Z0n4ioy/UWnSyc01GI5dmB7U7McuMfgDNuOiE49r
 6TVysw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1adx44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 18:31:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-782063922ceso8166760b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760466718; x=1761071518;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S0juoXgHF0YKeslMGNakmRLxGpZ7d+nHIP0t0vVpCcg=;
 b=LIBgpGKSYuFPnlk1Io6w7bZ4bDiRv325Cp9w58+9/K1JFQtTRzQIrqAhVTtrL1NZtH
 OztB8CL4RWjOyDwlpQTJYzhOovJWCJqivPkDJW1bIlPmKC9gTwBzqjY1Cg6HghJjMD9e
 7A/s0ajmLhcE5TmY7ngmtx4t3Mo5z59wI5Xk8732Zi8QlomX6sSWPLY13vZKfwZd1oFK
 UiqnnHwURJH28j6uxIWsAAH/H0abPZIRj9/eMzrCTtnvvLqch+lkCE8G7Hpa17k4A3m7
 jutslhlcHfdWVeoG0vVsoBdG5Re9Ea6uGnrTQ0TXgmQ2KMnfBMN1zft8dxfnrZfb0GQm
 ygmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlsDjdSOiCQ95dPOuqb45RX/hipsFza+OaXOIZLX+oDpk9GIUcj9zYUNiHJ1fJWYELS+S4+zKpPuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzczkW6HAcuTBvztACdBypA6NJ6lGkywTxWnCiOcMQn9GFBKHVc
 PKsqokSfFYC5wMKLLiCJGrOzxHM1lPoQx3VqPlvufyNIa9b0p/e4LG/OvhXUwqhKbwL553wX/uE
 5PNwG05rF2vx0ZNUBg87HcguuN4M7RDwR65ac8mKgdoKWNknfg7+ff7UoV4e3S4NARqdUQVg=
X-Gm-Gg: ASbGncvs8kiqMft8h8NgKplktd8/IcZBJJmfDO1PGYdnGaXVAyDInQh3JSgi10f3C41
 rsm/Lo7DZsUk3Gp+Hmp5BFjGdmdfNfwKHrN4kpC3h1WGLlb8E7qbTMPPhzEwRBo0MusR3DK2sUQ
 cl1CdGBng+Tu34pakZt1mcZPSAX9Zy3PjHYFkV01265gRA1wCH5TXeyUE+f91+Dne5I3lck/MWx
 fA5i15asnb6eCCBZUVGRTsjaUF7CAfoxWax6csJkniyvN/f+TN4Y/NSvmajQEA2PX0z0XhddG8A
 t3+NUA9Y5meLvOCVFMk7TU5Ed8mkcZD73bz5TvTaJTDvhKzrwomPS9tp31o0H/UdlnoC7gUoZDB
 pKuDbV4gdezx9Rg==
X-Received: by 2002:a05:6a20:3950:b0:250:9175:96e3 with SMTP id
 adf61e73a8af0-32da839f016mr33483838637.30.1760466717935; 
 Tue, 14 Oct 2025 11:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbBMDL+uw1tU0wlDGx+rVeL6nf9dS8iXtPJzRB++xc7b4k2Dblg7aRiYug20pk9SN7UMUf8w==
X-Received: by 2002:a05:6a20:3950:b0:250:9175:96e3 with SMTP id
 adf61e73a8af0-32da839f016mr33483817637.30.1760466717519; 
 Tue, 14 Oct 2025 11:31:57 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b63e05csm15830781b3a.22.2025.10.14.11.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 11:31:57 -0700 (PDT)
Message-ID: <830edf8e-8cbc-41ee-874d-5ecb6450e182@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:31:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Use check_add_overflow in sahara for 64b
 types
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ee971e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GWqr9FCoMw_Da9qovAsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: U_5SY7ou7KfRqrtUxiRM4HbqnWH0SRnc
X-Proofpoint-ORIG-GUID: U_5SY7ou7KfRqrtUxiRM4HbqnWH0SRnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX0AYYAKQea0wz
 GxcB74gnQDNGt0pwxv6a20yhuoPwOE+XMeIwRkugWriKVe2z0DWXGCs7X+chxLMKjg0AqHWRqZQ
 +luRk7gQQa8YFL1Qej1CoIbKPav2zQX2K7MiUyTb4o4CWo2yP51gMwCVcKrhadFF9/KwUZgNTlh
 kLy557f45buXk+QyndyQK7Y5tWfz1C5HPnLjYvcj793zz7F1n8y6+HuzkIP6o4p3FXWuPy3NrPF
 2E3KCPT6wxWf+Wdi47qeVrioqzPJOP+YFoFmCTEOam9No2w+qBTOTS96ZU6zoewFjy9pmHtocHk
 3gDZOOpzhmT19uKlvPZbolri71nHLh2u3kjjPsYyP/gH+x4LOCQUsuYUkJ5mxWzVX+3BCUK7UTm
 W1m6aeoqNEr35QD8aVa1hDSJv1udtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
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

On 10/14/2025 11:09 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use check_add_overflow instead of size_add in sahara when
> 64b types are being added to ensure compatibility with 32b
> systems. The size_add function parameters are of size_t, so
> 64b data types may be truncated when cast to size_t on 32b
> systems. When using check_add_overflow, no type casts are made,
> making it a more portable option.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

I think you are missing two reviewed-by tags from v1.

> ---
> Changes in V2:
> - Use explicit casts with check_*_overflow() calls
> - Replace min() with min_t()
Fixing typecast warnings with explicit casts seems good, but min->min_t 
seems outside of scope. It doesn't match with the commit text, and I 
don't see a good way to include it without making this patch look like 
it should be split into two. Thus, lets do the typecast fixes for the 
min usage as a follow up.

-Jeff

