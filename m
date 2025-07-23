Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC52FB0F0DD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 13:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6CD10E7AA;
	Wed, 23 Jul 2025 11:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGGBfEPr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0925910E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:10:36 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9feTO001641
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=o8v/bH2NBjx6+BJ/r65MfwKr
 xmq2wQHUa+XHZT7+W+g=; b=SGGBfEPrF/eX72+93Lw6lKpkf16xoPZWUMRMXU4D
 rqgLNltlyAsee1NqncEyKzv6vDJ2sW6t7neWKE1jKxMxpBXRu3N/9AmswkySAh//
 Y5CGliP2+qiQ0ijEKd6ya44NXX363WjF6Lht45zGyvD9plt6/Zi/BHsNXaLPd1RI
 JZQvyh+ZQp9db6fw8Fsv+UjyjMfBoLBR/vhtDc8wqA8qC9fIXOR7sC8hj2QzItMp
 Oib8Z8wsvOOnOjEGPDsumsAV3vj3tWINJPoTX2Rn9SW8lben9deCO4iHKprj/qun
 QyXxhJlAuQ54sAoUfuLXi3eK/ogxdRvskC3FfNXKruPJGw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w39xe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 11:10:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fe182a48acso15710546d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 04:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753269033; x=1753873833;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8v/bH2NBjx6+BJ/r65MfwKrxmq2wQHUa+XHZT7+W+g=;
 b=uR9zxgNkNT+PtJ2L6v5P9S3LmlWpDPim/Br6uq1aXdmjEG1M3fBt0f2YqHMrCgN/nL
 POv80Jvd6l3osAPyuF74E9G2cHRGZjstUpjsZ0LPIp4Gvn0Ow51s9FC5BWm4bmTbov8+
 GUqKMjyn43OsL2CJEAyvprtoeZ/j25bZAenQpeN/6w72MU77Nk6Sjjs1Aqj8R8D8yGbB
 G+OJNkgT7h+svjlpywEDHmvKh4FFmDAGj4gd/zByk3LLJ+wXfb6xcpsV1HZLiiVbmGK2
 nSaPkkkIJiJ7bIPKlTSsChCaFgsuuYFnGFN/yITSkwi9yu034+/CsQSh/UNGYn7Ye8Ez
 G/lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOIUnnmR8Sl7HSRZ4X9HVvfPrDq176tYIfSHJALqmw5sv1xFxs8iM6gL/whr6DwVUaR8GfbsT7FWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yygj3quKz9oztZEHH+WO6IcRjxcYNrq1FtcUp31gS21hyvyBhwX
 FGw3C9VVvXS+d+ZzgZTveYufjPDypFqA6HOwxpQBOP+jM6m7O+sAUlEuGb68DQTZSNBY1WadTER
 YT/4JH/IbSKkOiikDu+NJal/AuiaUlNl+UYygRDmMa3pLKAnMPniY0oVrUPuCsSJFeQG5H5o=
X-Gm-Gg: ASbGncuZaeq8qTkYstewiX3NhOrJMNAA1GJh3NkkITqiAi2gX7BMacUqKM2GKMMGffu
 K/NDQra3jzRKNeV0qY3o+JFprpLrQt/xdBZxuaXEncFfzk4EWquQ/fZ5hK4WFwvbH53EnM7dhtX
 /IJ7+wVn/yGkHp5JS4wq/8Pw+2pePUsD1f3Wq40u5/q0WiMQafiYimtitrJDnBSuzOVkjKkCVVB
 f8QQoAiYu30oL//Ism+N0PD2WGxRwoKciQeM9tcxlRFN2Ehq/IS1HpPeKhkLviT6Z8ks45ZKLkV
 LcNNT9deseZnyf6q6xVRlxrYZ3N/rnKsobP3r98/FjSgUU9nEZaHALHxSLNst6kbtXRGqRYaFqs
 7RUtYEkj9jx7/BrtpBouqyyXWeSYA5qVp3anRlcuAeQEFjh8qAjYV
X-Received: by 2002:a05:6214:d8d:b0:704:f7d8:efe9 with SMTP id
 6a1803df08f44-706eb97e401mr95429476d6.24.1753269033042; 
 Wed, 23 Jul 2025 04:10:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKX/yJfDO+WKJkcweygCNZ3fLCTvl7U9+hFOTGqWhqzh7qpDIFbc61paUsq4qoz3Ql+XOQtw==
X-Received: by 2002:a05:6214:d8d:b0:704:f7d8:efe9 with SMTP id
 6a1803df08f44-706eb97e401mr95428916d6.24.1753269032389; 
 Wed, 23 Jul 2025 04:10:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a9102bd7sm20831921fa.27.2025.07.23.04.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 04:10:31 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:10:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
Message-ID: <jeg4dw6wpxpfaio5kd5vcbqswq5nlclor7tbbh7er7zlwgdgxr@ksrw7waxj3mp>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
 <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
 <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=6880c32a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=k4jRfATEMmhf2Y4IZEQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ojB9eMXrJWcXN7d8z9Onzi3Ad8YoOPet
X-Proofpoint-ORIG-GUID: ojB9eMXrJWcXN7d8z9Onzi3Ad8YoOPet
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NCBTYWx0ZWRfX4iLozlYBzmP+
 knDn4YqJwvxdmP5s4HAGB+sM7zpH8+ducbp/624PbPq1HWFwoLYPkW71yFu79pVew+XAuYeh+XH
 d0dAwKRR4bDH2SpYo1vZVtMRgB5GqKz+j4O/UZtw3QusZzBC0GIBt4LcwUfwr3druCb3LVEWcmf
 y8/Hf1QR/zgFJMQKF01vfytq8zfBBUT2XXxGzWlhkHbt8BdA4dzTCZglmsi86cvCrsUuqzARQb1
 z64CEJU++pTExxwNanExw+9leUgjzzJa3wg90SxNW7Q7xezWanxREnvCg5UOb5SVz5FXxkSKt95
 GzuB1ej5FnG0walSt/tG2jQitrjhEyHlLedKFcRslTfhiT3TgL9WymMzHvJwUQ/B5kNnb1vSFs5
 ivtXE0nJ7+oUwf6oLHZtNOjXPcN3tN1aExQTZ87F3bmIGLVxtSz8WnH/jEhn6yHBec84KCUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230094
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

On Wed, Jul 23, 2025 at 01:22:20AM +0530, Akhil P Oommen wrote:
> On 7/22/2025 8:03 PM, Konrad Dybcio wrote:
> > On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> >> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
> >> different in A7XX family. Check the correct bits to see if GX is
> >> collapsed on A7XX series.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> > 
> > This seems to have been introduced all the way back in the initial
> > a7xx submission downstream, so I'll assume this concerns all SKUs
> > and this is a relevant fixes tag:
> > 
> > Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Dmitry/Konrad,
> 
> We don't have to backport this change because the existing code reads a
> couple of unused bits which are '0's and that is okay when IFPC is not
> supported. So there is no practical benefit in cherry-picking this
> change to older kernel versions.

Fixes tag is not about backporting. It is to point out that there was an
issue in the original commit which is fixed by a new one.

> 
> -Akhil.
> 
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry
