Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93059C178C1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 01:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A3F10E6C1;
	Wed, 29 Oct 2025 00:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b60cyLLn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3ObrnFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEF910E6C1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlw0Y2525896
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VyEOF+aXLbKYv3f4NZ9fETHTP8oPsdMhgn4tmd3+uZs=; b=b60cyLLnGPIYVqY1
 y1eCbNRllbHQeqtZHhtrK38EbhJym4H3A2ltPD2NfqkktHucHZNlxli8Yo6YJZiG
 7z8vGY8DT7uwZdv9ejfy/B+ng13/Fw4XwVHq3RLhoZL1AKaipqzHWICk5ZoWLFt9
 17Ylf+gC3xnu5DPPTCEBj5XgNtORiUaiq5vDTzUWUlniATBjR7nwZolJ1Xu0oSGb
 yOqCnlxjzZL7hdge4liWmflOYiCtAypGzspZyTGYgw62oBQJ3nFjq1Eq3NgHWHRT
 pquXlVLSLDxNrv2yaxBIJ7VmiKCqDvAoDrC+r4wbX+3iTPf6mHi/Bsoj9FfD68zT
 UPBkXQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3rn39-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-87c1f18cbc6so273544216d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761697847; x=1762302647;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VyEOF+aXLbKYv3f4NZ9fETHTP8oPsdMhgn4tmd3+uZs=;
 b=I3ObrnFlUK1xexVzQ+3KH53VMp6PtP7MD2PCZOILCZnPf2PtSqQfvpc0iMNowMsPcw
 qu1SMcCh4m2msdWRReyLVq8BwCuzf1p4/OdA3B3DP6kfo7XGQNGhSlSJQWPAqURFuEKF
 rqhlt9FkfMJhKDZ+5YSAj0qwNeDoRJt8QGdILCznYLeoDu7+84egKWvXcCEVMhI8z/Tp
 rXsnQmFq+DXNjPpkQy6P53xk/2s7H+DX7yO/nBiALPNqEdxyKQNKSxU4JfSo7OGkmWdJ
 lgyu2AEm9H3pbw/pEmtlE3cozIbroKsGEpSyLtjCDpOKR2MHet6Sn44LOvrLQdmfZDTW
 zSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761697847; x=1762302647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyEOF+aXLbKYv3f4NZ9fETHTP8oPsdMhgn4tmd3+uZs=;
 b=sNxaf0uJetUiou/BsQ6D6Nb4jtipNZ0i8Fbrl0rvjZ+UGlKKyj62pyX8w4mKKsAU/8
 w/+EKU9ftjKloQDShy8RoY8clescO6Agy3JxMGwRegJHDUgwzpZNamaMFFME2ypAAy+i
 0lL7BDX5aKOdf/qTDpXED2xK1z+Ov3UxDutTu7ToiGb1Rl3unGJpap7fs5Eep7HxXzox
 mVghdpk/ighVWwPAlyo0IUAoMkKOtBv1LnMX0WLGDLAMbUOXt4FTbjmR2kau6xIgDz15
 js8jtkIYpAV1HGpFQNSG4owOP3zrKmUSabnvw/AkYThJoVGKURF6SXgt6S7y+LPHTLA4
 HAVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEr8zHAsSb3UkPfmJEJieUFSlS01NeWeDzZoVvUf6kmUv4DXsQeWED2cySUaBkzZkTYdO+ipG3Qcc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCAv5tle0WdCtJgTiDGvtkWJJdojMuytaw1MhjzoM8kYMPKQP1
 +xZcgFMQ/ewqGHaNEXi/ewi7MZGWoVv3KJg5Lo7XqBMaiZMbLgpXudNhCA3f7x2ToxuMviAytzm
 Nvd+uvjRiGhApnBRk0icMW1fTevr0jQCxPUuSlsP6lxwSkxo3d4wTNVs+pUzbxkHKoXDss5M=
X-Gm-Gg: ASbGncsmWCISpL1cE2VJocOjCa3tK4vj7EYUFsq0HDncNW7lTJivrm7Nv0aY0a7oQnB
 Km0rTnssWdpGMZjO6yA3wEHD6+6WmLzsCl8yg7i1UNTYcmf7Nlhge1W5vqKRnlBaeiXkNpnuGHd
 jEtAy2YKjU7WWhwh+6GYT7C05Zw9jFxGgJri3MWewu+2Nn0BUnzo/AK2JU6+W4BaKz5KiOUmBal
 x7cSMhUZXryzx9bMldRgNdw9dIvLKhPhmhPozD5YH+Xh+ondwbSKn8HCBc1qHVUn5xLhU+YuqEZ
 MNuy8/vqO/jeOFtF+PZbkpGgDaeMRTk2owwk80vxWahhtyTdNdCrHheHwfmTxs0Bnzlg6LcbGl9
 uJ5XhQbuwIbcHAEx0hLOHpstoYZIGf9yO1rU4wVA/i7/jfBaY7TE3LPElNKF7RF8W/Yaeih5Hfr
 W/To2D29fk+cUv
X-Received: by 2002:a05:6214:acc:b0:87c:1e27:f7b4 with SMTP id
 6a1803df08f44-88009c3fb27mr16408966d6.67.1761697846995; 
 Tue, 28 Oct 2025 17:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsBFnqbz/J7aBH99rrrrpjG36zD/8B0hEGORviQ9ZerRyWHsasvUR2RCXFVhnR2eDLiEUJxw==
X-Received: by 2002:a05:6214:acc:b0:87c:1e27:f7b4 with SMTP id
 6a1803df08f44-88009c3fb27mr16408416d6.67.1761697846330; 
 Tue, 28 Oct 2025 17:30:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee092042sm32141621fa.6.2025.10.28.17.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 17:30:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Date: Wed, 29 Oct 2025 02:30:41 +0200
Message-ID: <176169780818.3761968.15179413078088034823.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: crXAnwNKs8a85vlLUyFw_TDgNhTvndKY
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=69016037 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=1bp3yVi2_WrJ7BMISZwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMSBTYWx0ZWRfX11u8iYlEvNkI
 Sxs28aojwNTC3QwZEiwPWzf3N4A3rUq/puco5LAxOo4tn2+7dDvwTxcHG5VdXZ3SOZyLFo07jwp
 3Iz2uDmYMdc5KNznNk00EHVk17G5mvSxRjup95lFRfy+p99IDJ/OquskNzwBTTQO0wxsWPIdtRe
 fTDIhNDWhXOX0Yf3oVz/ar3OYo/eooUHZmw/og0/7mW4nZBKYXR+hBVHPBk3qWM/50qhmrGCpRS
 1DErLnzxGV3v3c/4JRxvQEpZUGQKOQlFlBJliV4KcbNeDuQYtPXdVThOYYkpGmjvl+ZTh+e257y
 aVnb3msfx4mlslWPzXtnhNZ19kQu0IHSGDAX3wzl61I5fyGcfXYWXVcjaxzTsbAErWrSVpWHZQT
 KWokGM3H4XkCpzo7fpYLXpFrRv8H9w==
X-Proofpoint-GUID: crXAnwNKs8a85vlLUyFw_TDgNhTvndKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290001
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


On Tue, 23 Sep 2025 16:03:50 -0700, Jessica Zhang wrote:
> Since 3D merge allows for larger modes to be supported across 2 layer
> mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> supported.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f5d079564c44

Best regards,
-- 
With best wishes
Dmitry

