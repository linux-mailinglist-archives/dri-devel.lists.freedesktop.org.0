Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726ABBF287
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 22:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F07D10E11B;
	Mon,  6 Oct 2025 20:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Roau5oA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4BA10E11B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 20:12:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596EGFta029411
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 20:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kzzfGKAthQsK32eoN+vctDu8EkjUGMKdzeqRRipQt8E=; b=Roau5oA/f0BJNXOr
 awk9V0RkOdRYyBe1J1CGjENsMDsihPoqtkgqE2o4RVm+JIZ1bJ9ldraBXh0/M8kl
 Xl6z9I4RmamqqMZuH9eQ9MHjDhWMbMYWjCnfnpE79rv0gv1X3vVb107ls6Q8qztD
 5/2ydVwNIV7uhLxQ7sLLxpp1mkwBmhpS5wK/QuYeRIzr6eiHl4rDizC+xVKSey4K
 cCKZ8e1DNRXLdXdwaRe8Jckq/pK93bhdA/e/1u9gunIGh2JLU4tANiD6xF2PZC5i
 SjQgI5wl+u81Uk3nUPB9/vu8BynD1H9/+YF6NyT9+0j6Zp8Ty5BIMHa2HdYox3cr
 zlS1QQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgn3te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 20:12:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-78038ed99d9so7143756b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 13:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759781535; x=1760386335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kzzfGKAthQsK32eoN+vctDu8EkjUGMKdzeqRRipQt8E=;
 b=G5UNaw6YOpBK8DGi2XeFmR8538rv+doSrGO5iS61UTP/nJ6r/b4JLvy4psMJ+a9tYR
 AjeviWbuwH7Aq4vxtvGjf3e3yubkFntQapJCo68NScyYjpSsybBqsdH2wrhf0Mr6IwV6
 HCIWRROvxWqNPucP4P/z07HTdDfi6oQUdLL3wYDvGW+oIFna2pOvZL0zBDraZ3zL3woj
 mr4/vKdBpZPQ0LvNZAMtCY8OhyAFLnJPby682pnAgHrkFNpjsbnl/EEJp9IJ0AdBnSoB
 KaTbBrWOj6ET2NyEgKAbKX96jXQhL4PIWq3T5p9B9/9n+v6q2N+PqDvIpxSfZwC/1Mb9
 ftYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsvLucoUINpuEkBtSU1vlkSWK4cSi27SVAhzg61Fz2t60UGnJd0Dtyh06X+7v5liuIsa9pWXljbsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAcXM6us+qpfHFrIiZ6MUa+9U2ZtCMIjuB4Pv+DvDwbarhbZe2
 DJY+wST0THCxG6OR+IINWdV5pWGmtCY2lC4InrmoD2dNMBnijCVR2/rlQGWbYuLk/HxdrarBaej
 T/YIvdw5jvqPbDOpfcHG3hYrPHxO67iWcL1LMuQHIvKfZJpVJNuryT+0euZQD9KsEjwHc9vjC+m
 jDWQ8=
X-Gm-Gg: ASbGnctBhUA0kna3Z6RhTyGclyY2BsZJly10FpVPgSMuAYlePFr6RMw9Xk2rhGW3B30
 9DqGDRCEqmdvqM+aYYr957BEvqFwkoksbgY0EON64ezjoJaD+CII0vCHJ8Pdw4BAufYgOZU6VI8
 Y631903CfRlXhZtYJzebiAxmKLz/hFKAeYBh5IBq7EsyTCdIeuca+JoXONXNibfa1fdaiCAdcu4
 2MWrFz9stldeqFbpajoYKDElDaB/jiWRN03/ZnaSxzAYPExrgPpX2P+Y+CvtzNJ86X9T/yTju9q
 NzTKdnqA4sADGM1jD0dkB2YZnf7UM6muxRiFB7t+4AFDqlSn7ew3PINjS/wGkm/qf3RKMAsbfuJ
 hUgNaio1ZDxTAWbeRXHY=
X-Received: by 2002:a05:6a00:1746:b0:781:17ee:610 with SMTP id
 d2e1a72fcca58-78c98dd9621mr19310698b3a.17.1759781535062; 
 Mon, 06 Oct 2025 13:12:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAZFG8hgyCdPxR6zWs2eZUlAvUOkgVWHAtpD5hAmxgbNzV4Q7WaKJn+d5pIr25u8O4YLH65Q==
X-Received: by 2002:a05:6a00:1746:b0:781:17ee:610 with SMTP id
 d2e1a72fcca58-78c98dd9621mr19310669b3a.17.1759781534579; 
 Mon, 06 Oct 2025 13:12:14 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b0206e50esm13321566b3a.62.2025.10.06.13.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 13:12:14 -0700 (PDT)
Message-ID: <ee526600-05cd-4ead-88cd-ceca776ade80@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 14:12:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/qaic: Replace kcalloc + copy_from_user with
 memdup_array_user
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250917124805.90395-2-thorsten.blum@linux.dev>
 <20250917124805.90395-4-thorsten.blum@linux.dev>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250917124805.90395-4-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfXxfbkhxGSaJAA
 vuYZLQx2XWcZN4y8JKSsY6AMOU5sxSeuGSkGibHdzC1A28slgijmjdoNVkCb9njG2pQMjTuAEKZ
 bwqlVJOm+QcsVUHsYxK2grI8ZcQ1y/iWui4SIrEESt5fEpqj2wE7oAPZv5G3otsGsMcBTmt+mP4
 n8kf81Y7AfR1KxG7oblR7sftpeea/CoxH+hlw+FaKHw3NWbwI982HKhIOwG63/8Ic6h9NROb3Ag
 +TPpKt3mphoR+wAyq10dXE34sEcmEGYtkvXDbilaH1bB64Cu9FsnTHSttC4gBBDI6oK6LIM/wr1
 MiPKu+DKEqWbJ3y/o7A6oLmakG3PNGAro8NF8dns+2pcCAq+lLc8fRO0WF9qrTQM22HDFL3Bd/Z
 7h3mXLhU4DYo8TTtdPUXfLqWbJqpDg==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e422a0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=MFX6GGzU5ss6K9bJXPMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: PEPsytoxFlsj29vF929h5nvHXxI0hq57
X-Proofpoint-ORIG-GUID: PEPsytoxFlsj29vF929h5nvHXxI0hq57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
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
> Replace kcalloc() followed by copy_from_user() with memdup_array_user()
> to improve and simplify both __qaic_execute_bo_ioctl() and
> qaic_perf_stats_bo_ioctl().
> 
> In __qaic_execute_bo_ioctl(), return early if an error occurs and remove
> the obsolete 'free_exec' label.
> 
> Since memdup_array_user() already checks for multiplication overflow,
> remove the manual check in __qaic_execute_bo_ioctl(). Remove any unused
> local variables accordingly.
> 
> Since 'ret = copy_from_user()' has been removed, initialize 'ret = 0' to
> preserve the same return value on success.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
