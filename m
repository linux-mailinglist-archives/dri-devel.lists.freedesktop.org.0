Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C834B078E0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 17:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD72810E7CC;
	Wed, 16 Jul 2025 15:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="at6/24Ga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5838010E7CC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:00:42 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GDb2XK026001
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jF52cvUSvshXb9p4qQS6TK4m
 /ZISonXy0nEmQgM1hBo=; b=at6/24Ga+F+8Vvdxi5MQ8Z/aKzQ+QzS5eKU482hu
 9yw7KL38x0cl/MFRl1/agbWUDihD2bPPA9Z3VLwiNLilwY71acLUupABwXtBJDEX
 Q/99juCdVfXgVkrAUnnQ0xK9s/rY46PtJ5H3pRN4ACywXoxJsB5yL8Qlubg+xtJ9
 qkY6T2OCkn6b7Ded9apRS8xBXeXIzJjtB1VVMnjzpUpXhL3K5QwQMRexB9FKn2Kc
 YlTxEGxEWUaA3DeYyR42WIQwgaQ4M0DR4VTYG/b8+NpNyHSJP2MPn4bLVkqDb8bV
 pHwiLJAUN6BzzUv3YRl5q2uuLFCspjpjsdcWswkPVvayZw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca5k05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:00:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e32df3ace0so266805385a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752678040; x=1753282840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jF52cvUSvshXb9p4qQS6TK4m/ZISonXy0nEmQgM1hBo=;
 b=eBPmjGAN9j+O2kxVupJ3sTmy4UX4HxEVGDuuoBu0MXENXFFXwTlYBxo9wE6AU1SmFl
 lp0Wk60QLXrpIEVZMdLC8xe7HzpiN9tHSxTOx3T3LWEvpwBihnBvov2QrwHCnP1IoAJ/
 LUpwY6ZyY/+6cJb4VtlmuqCEBmou1oUMLG5s7AOP3mGO9PYnkpjWOzOAQyyMuhrBdR9/
 +E1LckFAJ/9Z0M1LJ9+qQi5agOhfgxLB5zwd/k0aLneOPCOD2rQ1/HpkGNbh2K1eMXai
 vSRnlipZXIXJ63kCXeQPaBLcQAdvPYwNkz/8qtTKWtcOal3VGwiBZHxXd3rwc9KfXt4d
 KwQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEg+qWwCC7xiHrrhzdVuBH9y7i8/KGhwYQp3BUk/nCz8ZkgJVSYnBFnnXDThnE7ekyYkmD/58IKyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1r36wzNaY12jvAgUSMRD4zqqwQeHK0qXadKd74giN9QtHwFaC
 wJdiXyf9TVlt8wLR4WzpECiUMr7TMikLTzl1J1bEgaaGgLM66fBYB50aa+L0Nw3zC6u+E61l47c
 IlEG5YSsgWzsa9/r0wj05qXHVwu3BE8OmsH5HH46/Ih+0tHSjZvhHI7dzZGAUkazkPKJPRdg=
X-Gm-Gg: ASbGncvRa9kpr324ZQxANxxZw9LnNVfG6BGt6c7m7B7KLYrtHVL6Fcqk7BLBJ3tlSdI
 zc8XOnaM7JpNmSVfyitX1OVhjEzegsOCnkUNaHPCTMQ5jbdOEAXrFdIi3jDZIBaPSQv6rr0e4kT
 vJgcsp+qUR13tz0bgp6IWsCu0iF1Urx/WkTu9ucpHmHyootS89BzcfgjFunY0vjyUw6LAP0FDoW
 GiPIXVOkMyeNaqvh+mXFDxq3OKY/u2vKJv9jb/MmH3ScOjCuC6VbHnSyXcO0kGFcVJ6rwhk4Zbx
 qz4mJPjYW9SYgf3lmoJ3S6k9VBTYoYGfJDY6Yws/zwHJvJxbKRlJ91gtudkSSc6YYi7MYVg6kGM
 IbxSW3fBLM3xlb4ppI6aB72ucWyQKEIJLL6BPPrVUCwYdOrFlATwZ
X-Received: by 2002:a05:620a:688d:b0:7e3:3019:e16a with SMTP id
 af79cd13be357-7e34356f603mr435572785a.17.1752678039056; 
 Wed, 16 Jul 2025 08:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxt4H5FXg39a4tOdmD3AP63qnFyd2IRuTr09Fx8yHgRyZMJ6icisMhrFI2Cre9KzAr64FPuQ==
X-Received: by 2002:a05:620a:688d:b0:7e3:3019:e16a with SMTP id
 af79cd13be357-7e34356f603mr435563585a.17.1752678038354; 
 Wed, 16 Jul 2025 08:00:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fab9134b5sm21435371fa.102.2025.07.16.08.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 08:00:37 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:00:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/5] misc: fastrpc: Remove kernel-side domain checks
 from capability ioctl
Message-ID: <aepmtv6mxlzhpncwcwlmgfrb3m2c4xe2edl4y5qsnjpxmvivla@gwufrh37y473>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-4-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716132836.1008119-4-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNSBTYWx0ZWRfX1aF8SkX3snaj
 qDMdS7FXOngvikjeFyJeolxBtmkX9TB3wGSiPA13DwcvlUYX4+wlYe75kqkkoNWXPnB+uPLJMZt
 NrZo5MMb4Aw2Ymiea2aSg/h0t+n4mFQw6yomEVkFFn5xlxdB6H0IikzfRwtxoYIBk9Ez85iH24H
 Oks23X5M+ibw83WvKzpFxAmErB7ryC/DGU/nwphkJyzg+cox+As3aKoh/QRkyFL7hsp91X4sfIy
 Q599iFVpuPPEy0xYS+UsRMKCn2H/yxgTZIuG9tdpTOciH+7io82goXkeldn+6bqynXSAzGt1wrn
 p0zZ5cgy0emMgvgqsVJ2taZ4sNj6rxgEn+A0/tQNAfBkWmCFv7Xg1uNTIGFkSAbVpfDgCoqqY8c
 6pRPMJENXRWFekSRO/ElsMItOz8h8p+4M48o5/zTHV485xhuUnjB7i2ijkRThEEKDs2v1W6Q
X-Proofpoint-GUID: wCHoI7qud5nXchfn5b48KrPIn1GWhM5r
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=6877be99 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=lc4KdpPQecCvDiYUKO0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wCHoI7qud5nXchfn5b48KrPIn1GWhM5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=811 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160135
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

On Wed, Jul 16, 2025 at 06:58:34PM +0530, Ling Xu wrote:
> Domain ID in the uAPI is misleading. Remove checks and log messages
> related to 'domain' field in capability structure. Update UAPI to
> mark the field as unused.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 14 +-------------
>  include/uapi/misc/fastrpc.h |  2 +-
>  2 files changed, 2 insertions(+), 14 deletions(-)
> 

-- 
With best wishes
Dmitry
