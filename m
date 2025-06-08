Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36801AD1540
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 00:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C300410E4E8;
	Sun,  8 Jun 2025 22:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoRg3//g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCAC10E440
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 22:35:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558KaT2R000970
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 22:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EKuV41kanFRSiy3Jvl+j+58U
 7yzzRT98y5OAQjFVSAM=; b=EoRg3//gq2JD1FZDiZXRNu4ss6L+3/+TdBYSFM8v
 MCt7mnIrG7J1tyjIgsTLDCGO2H63GH+5fUk0kmVSI/aT/Zayj20OzXzWEMLuhHPQ
 hJ6E4YCFqVzhnATNkkyooUQDK0gRaiX7lDliFZICPViNDuQrz7kovvIwRDo3LAdD
 TFGv9OxI3xzQ7TLCm753BP1Dwj8JV2TYVO337cH3+/JYJT0Gd8CNrrPTZ/QRywAd
 vp1F0/3PzoCxzRC08NTfLEDJgLYlHaZyhd/q0g/s6rZHLe6R1x/mxMYJV8vo4Pmb
 yzZ6h9JbaaQKbwYgP7Hypd9jcfFTPGNTT3KnjmWk7bLI7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxm901-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 22:35:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d097fd7b32so916694185a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 15:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749422141; x=1750026941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKuV41kanFRSiy3Jvl+j+58U7yzzRT98y5OAQjFVSAM=;
 b=pM26ExYi/Cg84g5Jdld6UpkNA5e0xoxoxcmuZYyA1T7vYpRcERTP4RVhj6AEVnbw87
 PWPodUW8AsJN8SzTCUdLdVHxJes/w/m+lRQYAz4kQwcgwVxTV0896wgYm/3mMIbOywkX
 Wisp5FjvjcYftl4iYo4i5YFybk74e1pE9Zt1EQ6rkAsjmwzyyUT0w0gtGyO3pGaW2cc+
 Czo/m0lhE+qaarlSA2r+WaOTGa/Yn+TXAKL60NOt/veMuRl+ZKy6xRlQuBx7xSw1tnel
 esSzt0j8jpBk+Pb2ESQVU1cPkK9GVX5Ce9PcXLDP5qBOr5hTd+1hSioqbq7Snse+vLsh
 KGmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1G7PUaV/xVlcPckpO6CAqnEF/EJkEgpcdYjkjx4MhTx3dT7LtE2h+YYypUtal2iIO6v0K/qpWeFQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywne4HWBrJ7XR8/IrS2tA8+ibdsfPXvs+qVxncG1Uon9BD+r3ci
 KShNw1ZWFA0DNHuZySNw2EJghqbA7ciW8zBm7qNiLAbjN1mIQJPu55RVVnyXzDn+oNQfPk1Os0G
 EjhbqhrASJnfxlwa3MU4871im9bmwaPDS+XYhxIrZwtYjTGC3ObodlzPCOdRAA+7aSbTv2wQ=
X-Gm-Gg: ASbGnctfQyusIRRniw0fwWx4s2yyJ7bPqMo8972ac8OzcdvDkEMDgn8uDOKLVUqyjt8
 nXYaAvTnFYNSDuMQnWpUNHPVSMp1uDYoIa8rUBJg7qIJQc9P28DQbq+5HnsENZVMF5LU1nDxXzj
 QCdNS6WK+PixQINslNYfDrcmtfA5i1Z1jVHZlxMJxd7mKsVziuEVZqg0N0oFDEecLasI+vyrN0s
 CPjLCMfWepwJlBxMqQCzShhexENmpgxnT/DoVlGoXnOTF2L03cc4zkNXnn3GyRfgWyuEa1P+lK4
 5SzKKCbHxzb35/+z7/lZOUmqXhhQGPHwIei8ZuqqUxheuOdHA7qor4rFKXiCtBU+RG5mDhfQpTf
 fOjwetK+/xw==
X-Received: by 2002:a05:620a:318c:b0:7c5:a423:f5b0 with SMTP id
 af79cd13be357-7d229863426mr1907149885a.7.1749422140871; 
 Sun, 08 Jun 2025 15:35:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjoOoW4vYfivFJJy31TrYZtEgVAcRnTjvKyrzMsvVqgoz2mkewEAd2QDC6UYYNCWyWKNoopw==
X-Received: by 2002:a05:620a:318c:b0:7c5:a423:f5b0 with SMTP id
 af79cd13be357-7d229863426mr1907147185a.7.1749422140521; 
 Sun, 08 Jun 2025 15:35:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a61esm887119e87.163.2025.06.08.15.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 15:35:38 -0700 (PDT)
Date: Mon, 9 Jun 2025 01:35:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <t6gtx5ygd4dkizpgupedef7tnldwlbvhcp4m4ypw4447fctull@35hwlznm6lv3>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
X-Proofpoint-GUID: V4KlqemiVpY98dqR_pGG2N6yho_DT9ez
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6846103d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=OnwjkJn3o8bp6UkAWykA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: V4KlqemiVpY98dqR_pGG2N6yho_DT9ez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE4NCBTYWx0ZWRfX1GIwWyylyWGI
 ox6nial4QMkXL/dCAA7Hf6coqZ7IkrUGR+20z/kPSXNQxP2XtVaQD4tYzCYs3AguMLfNyuBP11o
 UzGG6PrM7GmgUztVY0J9oIJ1YbhUNNw4cvLIA5ONHpaCa/PjjZ+HFW1s9RD7z2g0eNA8VqU+NOW
 1fIKaL17exTSzfrQdvUlz4NaN+H7N5auMlN/D7/dQc+s3oNDMQkdrJPdpP4hWiW1qr3J1rD+DfD
 TcQhiXEIOX0AFRm6AUpAYs/JtYel9QFtN85MDcuTvSoYyFYsHqD80d4Qd5JDQFHSnHpHya8EFl6
 m6pbbmLmG3w7IHr8tgRI/04j4RQOEjkMvjEfbqFmP5R34xqfdjaIyVT9ioEcKGybxKu04vAaf7P
 CdcXIAH0Cblay4D6/2Je/0dxx/wupFAuy8UHK9hzJOVXd4NQVbhsd9Pks2AuiwjVLGEZMqKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080184
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

On Wed, Feb 12, 2025 at 03:03:47PM -0800, James A. MacInnes wrote:
> Type-C DisplayPort inoperable due to incorrect porch settings.
> - Re-used wide_bus_en as flag to prevent porch shifting
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

I was able to run DP tests on SDM845. These changes are required on that
platform, disabling programmable fetch is not enough.

-- 
With best wishes
Dmitry
