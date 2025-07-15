Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3827B06531
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 19:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3113E10E231;
	Tue, 15 Jul 2025 17:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lm0sNmuS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4863710E231
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 17:34:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDHJN031217
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 17:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JypJyhcFPpnntV0Fi6GrShtL
 07+iXRif1HlidBTcgdY=; b=lm0sNmuS2x+XCWmaFseLstBKv6hHjV2VnOcbQsqE
 m4vsZ6uFoBU1v6SIde6ad4NqjtsdfVYqG7BRZ7VdzDxvAonzBo5TuyHmiBa7AlK1
 e58hAlS4q3eEPhoEd3QPrRUjuhfLTGLz1asCgXsrZfsF/pgaF9MT0Ks1QoLxy4Rr
 Madhr/xqRmhRlWXq2NXMvrCvlo6L5WxcCMIKukJgJDE9UEYszhe0BnDYxVdmpeAH
 pMgry9I7roDBK+22QwQwUKD12rf6iYqHLnKcGl3+xCoHbLDMnXsHvv32BndIUsCF
 r3C4IjA5KZa7WAbFvSA7urg1/Ci41puF5ttNAML63GEGhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut9125-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 17:34:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e269587d8eso433034885a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 10:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752600849; x=1753205649;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JypJyhcFPpnntV0Fi6GrShtL07+iXRif1HlidBTcgdY=;
 b=KwQAqiVa5TfSRHmqgOyURR0VnLZOkAgHGJqX82x300UX1Ihp1QoP0c6b/rxg/PhfMT
 Ok0tJoitBUSpebHqkfZ+XRiuXW0QWA6uIqf2joAydsuMb+5RJhbWEeJzZpEI6061AtF1
 HD91ZdPL/UjG7/armSIRtWA45FpIl1f8oCVt2w3RO+kK5N9yh4A8hamyT/SaPAFqCPFb
 ejHP+CpA0I5KWeleGDzl62zUVR8P371eN8e+mYLhmlkUSNr3SI0kTYHhBrCqJIWkJrCo
 ezop3hcu3HtUBoZG14A9Su0S8QP//j0KvQAY2RjoUnTT/xfmO/9MzEPNV0AxVV96Sos5
 2LTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE6xNzHrUVqUwkDDeyl9MMlTPepTy8NI3RWT12fOxbaOjO5zeHwri4yZ2LZusArbb8amzKM8+ZNNE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyorkCyOpXJrVcg8ROEuFKy3IlZ/89stmW2H6cZkjUVZaUkzdih
 STdPbXOVh9rzJxxb/VkC4Ds5Xqab9oRcTmRzuUVuN+5uIbF06vDgThjwXqQ2FsxL5J9br0+7eEN
 21orX62kb4nDjwBQmzSVZIHgCQP4AYQK35GVjQZUrXQkMT6OcP5eMFnfgEGuIUMRhEa1Ac/A=
X-Gm-Gg: ASbGnctG46rurhNO+zoBSntHS2X6YB0SQlP02ax2NfG37gw+M5qQRz/zutD13upMu9v
 21bjv30USFCGDnO7r8RQuZGM6p/LvLfi/CxXn6ZBVMYUM/RguKx8+UNmYpWmHcqxE7zPJoYVAdz
 viFMhbFVXmtWWgSb/AOaaJyNDi86lpYsWTv0+YH8FewNtVfAYr/WIVTP3CfZq1NEehjQfMlN7yn
 dN0tIrDlAhy4rDS6ZzclOFzqjbreJmfkaaHmdHPRgF311CrVs5bJQkwGYjXE+551tgWgLvYMIYo
 13zM31CCVVCM36pZ/95cda/9BDiEoWcD7ZqWTjvB4yslIYRledgmjtbZ60LNmMxJEnq6SRaGme9
 6yTwebtT7rucue2LZnsifQ3E5/yAEcQG0LYryygkadsmbC4lOTHEF
X-Received: by 2002:a05:620a:8804:b0:7e3:2db6:1163 with SMTP id
 af79cd13be357-7e32db61251mr1076167685a.43.1752600849370; 
 Tue, 15 Jul 2025 10:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL6kyp3qxt9/dJrs/jluSwSavkVrcfUF4Y8b4Wh9p7uPXySyslxIIgIxjH20UBXqn/LFCbcA==
X-Received: by 2002:a05:620a:8804:b0:7e3:2db6:1163 with SMTP id
 af79cd13be357-7e32db61251mr1076162885a.43.1752600848967; 
 Tue, 15 Jul 2025 10:34:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c7bbd4asm2349248e87.2.2025.07.15.10.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 10:34:08 -0700 (PDT)
Date: Tue, 15 Jul 2025 20:34:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/5] misc: fastrpc: Remove kernel-side domain checks
 from capability ioctl
Message-ID: <u7djktpqezpscjjuvdwa45x77cnkkiis6wdvah7uhjonbi6r7m@cyjqsarrxegu>
References: <20250715085227.224661-1-quic_lxu5@quicinc.com>
 <20250715085227.224661-5-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715085227.224661-5-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=68769112 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=yJLdw4DFOlQ0Sc0dKNYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pzXBgl0EPaJqtwQWdhv6VpIdIpJnunkx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE2MCBTYWx0ZWRfX5Cq4aYG5dHpG
 0VeyyUyeiZxZmB8ElV2PLqes56UQaqSMw1phsmt7IzUxnJE0WPhWL1TastdqUmc5cSdZiSnefYA
 n4ypbFbCgbGUVwlCDGc5f/149nkWmOsykpYQ6wuz4DQrJcIckTY3Bg4P30BffhwsQ0Di4VlxccB
 09lY/dLYzVcoRty1edYGZxuobqxqp6/7WcAWyeSdSRyXyyunCOG72r56mr37TluKXeyZ5NUrZlZ
 abqc/AoG0Qm9JJNPpJt0pEaL22qf0KO+5+1dPKdaKPbeVeTWZ6sp288e2SqFn+/1Lr7VWJEVHgt
 SuByDk0JqzqrBid7Qvcg88j1Kqlt1n/vjvxLsV115TXfI9Rw/rqqUfi8c9Oh5V+iX0yCvQvvWT0
 rOJRQrz/cW7O15EUIOj5J+80ng08Opkx/Vg5IdsSWTol61mFkzB7Aja6YzRCrIicRJxyRzn1
X-Proofpoint-ORIG-GUID: pzXBgl0EPaJqtwQWdhv6VpIdIpJnunkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150160
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

On Tue, Jul 15, 2025 at 02:22:26PM +0530, Ling Xu wrote:
> Now domain ids are added for domains, which is different from userspace.
> Remove checks and log messages related to 'domain' field in capability
> structure. Update UAPI to mark the field as unused.

The order should be opposite:
- Domain ID in the uAPI is misleading and should be ignored, drop it.
then
- As the domain ID is not visible to userspace, drop extra domain IDs
  and assign them to the DSP kind rather than DSP instance.

Otherwise you break uAPI first, then "fix" it in the next patch.

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 15 +--------------
>  include/uapi/misc/fastrpc.h |  2 +-
>  2 files changed, 2 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry
