Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843ACE9C76
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 14:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC79810E714;
	Tue, 30 Dec 2025 13:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLKZdTaj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Voi8Gcpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E1510E714
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 13:23:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU9wPl02723214
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 13:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lBamiEQy3DN3DCzO+ay2wPm3yXsvknh9NRFFfscsXcE=; b=KLKZdTajAmQZd2KK
 DmQf3wD5kU2AFMCawtEBQNHaXcSnTgjeNAVIb0i6E8fOCY/JKoqrNTEnzdGZW6GF
 kckEENW9V8fhfMVrO+GrrmWv/WDV955MRsuMuSjBXPPnthD6zjveCsB9+GzCiJA3
 LXPLbQaQwcie6rNPHbUSLiwn8PB1hEpu7lH1XLBOAPBEknRZ12+OkBm9lTzgd+2C
 WA0vNWvdfnMCB9BGX4PSbViDZLi1R8suPnu+858XMvH39ucHRJy25jMH9vWkunC6
 R/5ZNtQn9PW8OryvSkotuOKZRzrTen/JWQz18E/h1G5MNqnHvaBRMpfKdk2ZIIQa
 VAfwEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdhww3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 13:23:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f1e17aa706so57699821cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 05:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767101038; x=1767705838;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lBamiEQy3DN3DCzO+ay2wPm3yXsvknh9NRFFfscsXcE=;
 b=Voi8Gcpcn0vK12RDlhkvwgS1wsqGimUEnLAAcVTUJk74jB4Zh3f37xwKJD9BNbfsV4
 3pyZszeM1Z+P3ZNhPIgrpNcSenMfN3UiTIC+iS+1MD5s+jEdAMENi1uQCz2zKI0rqw/w
 Li4FMUoMZYOo5CXengFZ2gHCKOHPN0nB9llaoIiznaZ/QBjUrWnlSyozWC9koRAub3SV
 4Lt4sL/5lOSrAVsBDA+Fdpv9R96qslxC+Wu5uA/ZRXwlBPxXjlQvV0w03KbjxcdjRwyH
 oZPo2qNec0H73K1Prk0KwXqiVX96wBlBTsImnwPgLAKDSa8JK4ymLrCsWkvapMa/cClo
 kiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767101038; x=1767705838;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lBamiEQy3DN3DCzO+ay2wPm3yXsvknh9NRFFfscsXcE=;
 b=EFV0HpP15AZd4RRiJBxQK1m+yrfmo4jotq9QBpj967IOuWTHyMe//m/RjZ2unlcQXF
 UYCRGOwElMHsTYnLNazgllSe9UdJDWQg8Qa3TLDKfc/ObTqDBZn1f6Dh+HIMyNgiN0Zq
 LNiM21eJmAFQUzXhaFuVx9bb4QkCyHkoFRaBtLvHi3dYuhs11XIue436hjo9QltL4qeo
 oGv02mnYcYgEoXSfhEGouIebG3hs7RJiwU1oedvvHdcDf5ydw7iwCU7lYyCK+/ydPk7G
 l79WVyXQdTfBsUXAa2QJpGR4ECGcrf4mzkWfSnF0nBwC/MT3Y+TtJrSgWhMGMaxZBypr
 gGrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlndThXRRHNFnhHTmW+qaNs2/5Xs8Axd8RYRkSplgt7gXj3BJ5P0HC6ZUd51/MvCKn13VCrMOTgJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxluo92reCB+SohNrnfJXH4ryrqh23p3yuLCd84eBLnaNng+cJr
 Tx+pGwu+2+I8yRQXUnNwNI0q2AROXQsfcqbwdCgXYJ7Vqu6CdJe9N8AnLMNkdqrJMIf7iNdb+Yb
 O7r0+M+f7QszMd+BlRhnirHCiL67eoMPfL4URcRH5pnUNvqlTDQma8QGIPr/1Snxujbcsf8o=
X-Gm-Gg: AY/fxX5vFgEuMA+rGKyFXAQAcR4z94z9Zw/0BofnEZTNAs27+znEv8wQe10U5qJ0BOl
 TDB1rc+Z4rUu4HKxHMm6iBqOmw07tNr1W63rvhiZPP3QN/keI9bVQtSa5/+sJyTs5rNDnw0WBTf
 cxsIc9BD/Mab1IEoys/ZPtYLHtupyaJEEJfUtcSUNPoGOvwy/JYAXVs5GVl3t1eAcWEZC9g96uK
 1HOfhWUFdjPZUfePSIhcjq99s3VVZiQ7ogGq+7G+I3t0xid457ghYJbVKz/kDY0pFgioQWlTEum
 Utin0yqgrsKWCwKls79GzWPFPQy2MwpE2nxE00sXxKLp+wxmxlm9mOQggoe7HR7KCz5Ocyxpo4N
 DvuUbRILrmJzGsFu25pwfOnwsZrQBPPhlQlD0IUAd1I3gFPaO/gNvHqyOez058Up6OA==
X-Received: by 2002:ac8:5e4f:0:b0:4ec:f9c2:c1ec with SMTP id
 d75a77b69052e-4f4abdc5c87mr381306331cf.9.1767101038031; 
 Tue, 30 Dec 2025 05:23:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL3EgR/boC+rDExbmIrfZeSeIUUjNzzXVRssTn+sUtVRW2phBtE0fgvFV4J8KeAfmDw7S9NQ==
X-Received: by 2002:ac8:5e4f:0:b0:4ec:f9c2:c1ec with SMTP id
 d75a77b69052e-4f4abdc5c87mr381306081cf.9.1767101037616; 
 Tue, 30 Dec 2025 05:23:57 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037a62973sm3702301866b.6.2025.12.30.05.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 05:23:57 -0800 (PST)
Message-ID: <a8c6b4d9-83b6-45b5-9432-134023e2eadd@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 14:23:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] misc: fastrpc: Sanitize address logging and remove
 tabs
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com, stable@kernel.org
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-2-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230110225.3655707-2-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=6953d26e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=97OCAh6v3L_eXYMdJ_MA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyMCBTYWx0ZWRfXyOM7nfqMtf/Z
 tK2iu39zCCwMX/uIQpADkX3A1W4kNhBaSPOLo8WhDL97Vw0EEpw+mPjA5OJbOSAEX3xpsoZBRJx
 rBLOcQwpiNhXHVm49syXwNRrbB5291/FNv8QmTn9VWqugNWgbbRIYbmCNVG9SPeSNt+6SkNEIKe
 fUrLc+M0fotnI4YG1ORnIWtB6EyacAV63lNtDD/8cW/Si0jufddTf+6Ep7txJxBukTyj1mBiK/w
 Xtp1bEDIx7UQHWMzwfOaLCjovupHN5WZGSnSsb0fNmsudnruKT7ESurWGqhT/RSCfdV9AbSRT6P
 l+wI/uDdbzQA6RgPECwZwlh+yDow8BHV0ed8m1j3jPuKoqmwxbwsE6YViMPbpIDhF95Sl8zwnrw
 6JJW5XwSee2ITg9P6HxjyuY9hqyZg5qIqb33fNBDLdpxT/5Y1hvjC4HQePX6JJ6PQcX+Z+PBaEN
 jO/W6Z17rS+9nbSYUyA==
X-Proofpoint-GUID: oz22a6VA-frF3kcsagUTzmxlhcSc9cco
X-Proofpoint-ORIG-GUID: oz22a6VA-frF3kcsagUTzmxlhcSc9cco
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300120
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

On 12/30/25 12:02 PM, Ekansh Gupta wrote:
> Avoid printing raw addresses in driver logs by using %p for remote
> buffer addresses. This reduces the risk of information leaks and
> conforms to kernel logging guidelines. Remove tabs in dev_*
> messages.
> 
> Fixes: 2419e55e532d ("misc: fastrpc: add mmap/unmap support")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ee652ef01534..408fe47e9db7 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1830,13 +1830,13 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
>  				      &args[0]);
>  	if (!err) {
> -		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> +		dev_dbg(dev, "unmap OK: raddr=%p\n", (void *)(unsigned long)buf->raddr);

Would it be easier if we did away with the uintptr_t, since the protocol
seems to assume all addresses are u64s anyway?

Konrad
