Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646AABAEF2
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 11:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E542C10E194;
	Sun, 18 May 2025 09:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="adQzHKR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9EB10E194
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:24:38 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7iqUc018487
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cassb7i5I8/SYZylgZkn2Lai
 Ek52xXRH5Ohypr5QZYk=; b=adQzHKR2kXA8BIRR3Kai8lgmv8my4rTW8F5Lo9Mv
 84JOrGTiZpixym+d5tEvtAyo7J6ykla60xAfumz6ZiZ7+eRiiG6HGx+sgX7IJ9zd
 MObM+pANPBeKL6/tq6uPTi/vHqnY00uCnzekngAgHiTPnfrdbODPI6NgnbJ/wEX0
 WSaQC0/y5+UbQS1wACa7oHoXvdmC00V0/RJYWvbmYrVBXU6EQSP186e8vfCPBRzI
 4aSPvVRG8D3fka2OiH07bZVhM354RlDA8dt7/9sO380ED17t6aDlJWGID79XkJHp
 00BaJPN7fYgUxj1H8g/TELlPuVKYVtzAE9rsO2ig34bdQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhssp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:24:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c7c30d8986so1086334085a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747560276; x=1748165076;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cassb7i5I8/SYZylgZkn2LaiEk52xXRH5Ohypr5QZYk=;
 b=qRNoSuoaq51OLbiuOGApQhn7o7PDp6U/1EehKW1bF30GD6t+zcC6kxhgnyhubgiYQ6
 1ovl2IUoq0gDCGvcfbReH8E08A6oQXDd3Qg4QIYcOJxKh0/biIAHQ0J/X8fOIQ0YOg1/
 g58XrkDhcxvQ/9cxrTlRrmCHYoD6XtMxgGxQtTPBcIwgAz/054lY2h0rzdxVoh2sTrxg
 +Ya/4dgsdRs3M66cRUmbyCq1BRMJI0MtLTbTkVTQOr6xERBXDx2WV9njfkhGrBc48qCn
 tEsNxi7G+pH+7NBDZA3QM2iJROYUSlyneN34PrIQ4QHodGEqIIUgV4fsc+lrkxe0CtAy
 xYUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+hScf9eL+lwPfYUdWcZ+8ps/nPtBFj41HCOBLDhtecdm0THcJ10tRDHfxRpfOyMBX+ewaZR+Gaw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlkCZ4VXEdD48Oxq1fsdGG1H4VD/EhXu7yPx7j03zy7J1inUh1
 5bmMKy2IEAzSrzXtmChU8c1ASghkGbJa64+U8PSU4xpNRC4sd+66MeMpf0MVku0WtOLjnV/8usI
 eDjBta/Jo0uCTMTooHT0CCIb0UilKW3t9Z8EcuADHXSnSsTxwzevNhGkvb/fLBkWij4XUB8k=
X-Gm-Gg: ASbGncuHP7RurbuYnuKQtkAtc2NaqGiEKD+XOAXGa6LP3WmZ5zhOrAxMwvHXen7xNpT
 o0bvcthv0L9atzB6SBrAz7H/+QvueKYbvKn1wWSZYNhLUQ9Gcb0EWlZFtAftKcDEl5XdpJrMqXX
 oO20OCP8Wvr5xhw2elK4T/A6LY1FMXaBe58/3M0FImoLPFdCoaaq93EoC3XlVP8vxwOOcErWGIN
 NsryANI2n5jWT2BUFX26PfQ71kHP/D2UT2TfgqwJGT0tec2DUxRF29vh3VtfE/AVV7BlUuI/lmW
 RDJbkQEXoh6iM6sn2iqK/O+5noI24VZxfVf+vB+CBawbb8m8IZrXOeehXBeh5uHrgbeXa01I5kA
 =
X-Received: by 2002:a05:620a:258a:b0:7c5:9fd3:a90b with SMTP id
 af79cd13be357-7cd47fd378cmr1294154585a.47.1747560276263; 
 Sun, 18 May 2025 02:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC5ZqsVwWr6A16sgKTeonBBfbSpuGBerXLhUNTVdBGhWSe3zc15GZX5mKJSEeRqdCHfL4ZFQ==
X-Received: by 2002:a05:620a:258a:b0:7c5:9fd3:a90b with SMTP id
 af79cd13be357-7cd47fd378cmr1294151685a.47.1747560275904; 
 Sun, 18 May 2025 02:24:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e701b684sm1359006e87.148.2025.05.18.02.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:24:33 -0700 (PDT)
Date: Sun, 18 May 2025 12:24:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
Message-ID: <aza7hgcraahr56qhmremmkfqqvpodgohzmn6iogwqx7x424hny@fopwt6tk3uyu>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-5-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-5-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: P6UjriOjzVqqR48DJPEbWUGxLuRB2qZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4OCBTYWx0ZWRfX8VJYqxI6VhAB
 /2/vUpOgQftV/Zp6bk7+MrC3IGU7/H/VCsQLNhpm0TCokWy5xcp7RpJSn84Ue83AIhJtyLGZLSl
 OaHzcvHjfzrh9/44i4ki+AqyPA68xQ9i0/mEMx5W7E3fFjiXAyzshQKdRhKGn2u7+32s3gb7JPs
 GaXZDTH7pSMgWTS/BwfPdoKKrlDcA+Ul2cwV9Vh5CJEILLSp09vZVrZGs+L2WKyOHT0B3heMrUY
 FywX3a3XrNAnZIeQzLw/BH0580ZSH6KLP61XYP+YeeqDc6DNm9nPF3jqR2O9z6MAd3JCAxgFR7E
 hc9HeeS3aXL34aOuLkf271d3AhpzIMknHF7977ONYjIq/+rafI/sVhJM/FUlywKOvwcV1BH8NLl
 SafcRczmOr31UIz77DMPQ9co1d6jkTOv7K7qwabUCn9H5ypFGBOEent5JbW7AtTgtrRJXzgZ
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829a755 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UiqBTq1rjkrdqcEHUKQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: P6UjriOjzVqqR48DJPEbWUGxLuRB2qZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=863 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180088
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

On Sat, May 17, 2025 at 07:32:39PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
> as a separate field.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
