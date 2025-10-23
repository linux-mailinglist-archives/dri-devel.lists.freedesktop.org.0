Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CBFC000A8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E5A10E09B;
	Thu, 23 Oct 2025 08:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmWBgYYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1FC10E09B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:57:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6qMuC029135
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lNE18kBABKPwFEGxjEK15XM1
 n6QIS5Dy2gILjWbl5oI=; b=hmWBgYYPMNr0aXe4kDE73cLq6UrT7cQfheOL3949
 tL/IbSt+IPPQvIwMYJRpZllCA5YrsJF3jIz2SwKesiyC7fTRP7czgo3Y0wUmfKmI
 B0w6nCA9eQIqnkqbdk17wmgQlfaTg4zosMnHNDzhstqxqpuQ4OeSxk85bvibYdoC
 9BI5LkVGlmWTIpgP41oqKERoL5ZP8edJv65j0WOtMwxT7jkfIE5F5VLtcCjmGyCy
 ypLbvbd16ESkz/huYlwTDaZzTj9pGJBBbbM1OrYpFHcqgYewp8b0u361Yh1eIhap
 ozvQ40VMKVGmyVjdu73MaUZxdCFbtFNpQvj2UQHFO2VO1A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdcx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:57:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7a27837ead0so297238b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761209833; x=1761814633;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lNE18kBABKPwFEGxjEK15XM1n6QIS5Dy2gILjWbl5oI=;
 b=Zl8JOWebLCSlpU6l3B7EtHCfC736MTq/nnyVnEcexXWlc8YOot17QfZr++vRK/wG+F
 quoacWXCqL7Vj6IN4g1aztD74Fp/pJQEHKO6kkxV6VYLNp/zeXM+Dd3o5jBUqe+apuLy
 waJPHiAcrOhQ5ftpUM4ZZqca6OmuLIrxqukwpAaW0rxTzodpZ4i8xjzeJhn7q07NPreE
 DJAa5wjJzuqM4Op9xMZbnVrvCpNJPZA98u2V1YmJ48i50s9te5JV7GucGbIJA/DwJyUY
 8OlB6aX4h7Qyuanr0tqkzGF2gNrzyrPCY1aJzzHxDkdZwVW/CvX2OKSyp8IONeCB/WQH
 mdOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVljlHzVvh9ilBl3O3Qg3HJrua/a5geY/PEP9YElaC5ymbl72Ci9DeZoxbyt8ntMZXPQfj50JdYLkk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO6i70uEyxMLivJKmIrb7H6Nuh5Vfi28wpeFvimCleIRT0UJ1Z
 2HbeUl5+Cx7a9cyi0wH0hGbBsO0VfIg4nVBmZdUNh7fViW2Bnwq1Tb7LnQSOdgzXsW0gV0sGzDk
 1nj2olZlg2p8rQdpW4c9MsLfup60WN+dNpz1QCUjoDhLedMR+K8C/lvS10OID2/ftG+CxcDs=
X-Gm-Gg: ASbGnctjas8T7x/OO5klmtLsDDkNSMsA/nFXauCLhYNCsavlfMvUqNC17HfCB+1iS07
 k7/6/6zhiHu969S5B/bUEdRdpYPK6BzSw/PgadGruJPFC3b5OSema+SrsVuyR6WqwymyZFwkCDd
 1q1zWWGWHdNVi/7Ck0e/F9rXQ+vGAu6FIB/PDw2R3iCMlD9E6K8s/bUr8dqfebu9Tnrq43IlchX
 /soGPN1e/Ek7vCxamma7WU1hXWqmXB9NF5C1EdpvEPZqqVEhVtA6wzR0VFx3fRSYYFX6PVUrg92
 D5unm72MmlP/VT/3MFca4m2NuiAR8RE5jJgLj0/mmAlBbCOvWsFw/UKhxfrvtU2cxoJ6TMp0hAl
 MJkCP1zDEbmlpLPDlXP+jn0YGlyXT9MV6NHusBaWetfG4gRwIzXbRog==
X-Received: by 2002:a05:6a00:21c9:b0:781:1a9f:aee7 with SMTP id
 d2e1a72fcca58-7a220a5e607mr31700911b3a.2.1761209833364; 
 Thu, 23 Oct 2025 01:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTrMxusQO9d3YWrx7AOvOf5y+PUG892+AnS4bSXJmEY45o17kf1UUxWKAK1eYBqr8xrk+JcQ==
X-Received: by 2002:a05:6a00:21c9:b0:781:1a9f:aee7 with SMTP id
 d2e1a72fcca58-7a220a5e607mr31700874b3a.2.1761209832869; 
 Thu, 23 Oct 2025 01:57:12 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274b8add8sm1795740b3a.41.2025.10.23.01.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:57:12 -0700 (PDT)
Date: Thu, 23 Oct 2025 16:57:02 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Message-ID: <aPnt3quCWKLh0bcp@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <4f9573d3-41a4-4478-8c19-39716b29f587@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f9573d3-41a4-4478-8c19-39716b29f587@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eXYShIHGN9uUuzmF16h8-hRTLIBQzJ6l
X-Proofpoint-GUID: eXYShIHGN9uUuzmF16h8-hRTLIBQzJ6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX3TpcjSHpZlHI
 kEG+Xo68P4PRZ0dZ31i4w0WyGMg91/yDzn1La/9bAocXbU1fbxlrCyQqlVQz3YjXvKw55Z+8Rav
 Xca0WqlvFLI+T2x72fAG03yndibPh812hEcZYYCN2ptTaoF4yMTwZFYKsae1mwroBsnNJ/3Amku
 LmwTMK5IOsfVBU78FMuPiVJsg3hHNmFPSROStI+z/ovehcZgDLfMCIba8bJD2ufjB5eyjU0gIxJ
 5a1iTQZOcjmlN4pVdzFRATb5cDuET77UQZmwSV1S4Y+zyUqbzgZgTvKS7KlolnlO+avFfiRO3YN
 /Ugys5TjiHabRglsEZnsFCf+PP+j8zf0DPhk3vFgOrqZAHqOQn3gM18d42HEuqezPG0QPUrXbkQ
 hO0PkgEFS93/LOHZ7w1nTeEbwsoU9w==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9edea cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=C7owiK3y1AEyg5OQH4AA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
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

On Thu, Oct 23, 2025 at 10:22:12AM +0200, Konrad Dybcio wrote:
> On 10/23/25 10:06 AM, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> 
> This patch should have been sent separately as it's not at all
> related to extending the msm display driver to support Kaanapali
> *and* it goes through a different maintainer

OK, get it, will split panel patch.

Thanks,
Yuanjie
 
> Konrad
