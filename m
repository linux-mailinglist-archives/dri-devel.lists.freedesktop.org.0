Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A78EC178D3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 01:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542F810E6C8;
	Wed, 29 Oct 2025 00:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c42zwcBD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9cMjtcP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D516B10E6C5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlGRf2609295
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BA3mJgJEALDSQIU7lzkJCNPe98ZeA1NlvvJIGteEvDA=; b=c42zwcBDAPLZdF1u
 rm7Y3eie3KqdnqllpJIswgqdZu3BXIkUFqJFdU9XgoJgNd3bnPRnFaKyZCi+O24J
 94mhNFH50rJ10UJfnxKvoodqMfG1PjKrUxjnzc0FHZ3PCifct8LtKR9LtqgBHFsj
 divbCHAV8gjOjTsY3TWQdopUfvjm0CSEDiWM11WwWGEPQHirMfF7BQH1YCufGiEP
 85u+89F6fXxKrxTnhLdCmT3AhNX8DqEcfSh3OKIP9DGucnyLJYkTRWdzo49gp6OZ
 6oEYi4ypzPj44bNQI3pyYfTmsLg05ymnQooqI52RcE2sVA2t7/+0nskUp/y2X6sP
 H8TOCA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a00nyr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-87bf4ed75beso148313376d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761697853; x=1762302653;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BA3mJgJEALDSQIU7lzkJCNPe98ZeA1NlvvJIGteEvDA=;
 b=c9cMjtcP40x0RzPkfG+0CJm4hFy+y4vwY9kktjUSKc388m181U/TqLlFfWG7FohQBt
 /CTU8ruaya7LJNA7mXWhxMQXJK0nvYXxT/PkrQpoNLVOuXcpjAN79BjiCUCEMNZ3a2/L
 ZB/3qsbS5Jx0cDdeosoN2tSGuUYoOKpTwVBMXInYaUW8ksuWistrCzzQd94mdr/ATMKB
 0Xdf40AyWOuStjLQEngvy7dr6yIVv1YAHWiodU8VSrJV+5UPeYzrBdrNn6FryQxQl/a2
 uqdtyCb49fgHEpRlnFnTG/8/vg2BccSPf5Qu1+gYCf5/SwUGv5AORwOErpLUwr0bcBMI
 oZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761697853; x=1762302653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BA3mJgJEALDSQIU7lzkJCNPe98ZeA1NlvvJIGteEvDA=;
 b=IME/9AitLstIICNjGAS2zqF/WvlE4sJaa1ZNKG4X+gHOaM5vRM5Qlkmgr1DJQ2LnwS
 XQzCdM6Pf3Xj/qygwYa6m1sTPikh/RLAntPN/s8sjoXD0Qcn6g/I1TUTwY3aDNHioVCS
 ARLMiANLCp2yqvPJU4z01h60OGuDPgPnUHvsrCrwfVbH9ihTUe99byWM+0VgElurRbED
 30mxu6f8oi9amiMCNmfkncxn88y+2F4r7Wz/grV1bmZlKAPU/8AEuF2jImDLQ8bjsG+v
 IFLaTaQoitgb/XZ0Uy1n9S/W+59prFIB7MG99naWt8iRuAXADxokcqnvjkE1eBQifIqA
 uCRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzja602ZCAthbOVzmfP6UbcFvIR1A6UqENS/odpASw2t6QNoY0lxyUPshGGQgyNZFtYyR92DFQNQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW/pMCOwR4fy1FpiAvu718RaBB4JFn3T1OLnCh0cJYnZ2ngUXd
 UWel8KkVnLvDrFnOzBTKa0mjPPiMcXGAcDI38Q78Gr6nnvlfZXwW46V3Dehywl4aXaUFzY9Izi6
 xU57hBgN525N2p7hiAkD6UXtyV36lC92dQJJJOHpeKbw+39vMkjMGofbWneWSZZdJHODVvkI=
X-Gm-Gg: ASbGncuf38yl8Nk1lwScXnPgHHWOsXw3l/wU191cjg5JiY5uh/VkPI81Zv9cmTwRMy1
 8eV+N04wRs9PFoPFm7G17PAAcZ0+WrIaS8fbwk3kIU/BGNs6goQG2LcqWmfNkwXG6Yoi4uCu+SE
 PnuFcfGs9Wv2lCB5vBxuuLc6f/KN86nHBmd47Shj/fOLsU/j9b/0iZJhIxwl6yIRF058zhN6FzO
 jjuFnUlmby1d8evk2rvwzsGM/frwrrcIFqqiqe01rskFJhpZcTJ/3phJTVQXV16YqJXI4BxbnHr
 TUpX/cgW1kwpxhO8PWQQwbm8i7odmP7YAShJm9bo1RHj60edoUhdH6MfPaW/59izoRBk9pXTtNJ
 ArN39BcLK9Qby1+xeWtJeAROJc/Z2+BVnKk8v8IbJ54OHLSx2+aaOOKtSR5LkqZRKbI2UKytXuI
 D8j1ei5x+y3C8w
X-Received: by 2002:a05:6214:2385:b0:879:d13a:109e with SMTP id
 6a1803df08f44-88009c125a4mr16066466d6.58.1761697853294; 
 Tue, 28 Oct 2025 17:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyr/bWQydXn9qOo8x46NrfEYfRXvfQLrxprPj6QzPNkBQLdmOHSiqC1X0kLR/y0Ii3Ai42aQ==
X-Received: by 2002:a05:6214:2385:b0:879:d13a:109e with SMTP id
 6a1803df08f44-88009c125a4mr16065856d6.58.1761697852700; 
 Tue, 28 Oct 2025 17:30:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee092042sm32141621fa.6.2025.10.28.17.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 17:30:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm/msm/dpu: Fixes for virtual planes and 1.x features
Date: Wed, 29 Oct 2025 02:30:43 +0200
Message-ID: <176169780824.3761968.9764192918741349867.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMSBTYWx0ZWRfX1E8+MU4R4sT5
 gqTFObR7PvBQ25Vdi04aT4Vk5ORfKOBVRs9PI4R7TRR6HsiONz1XcaSfQYDQctHQPn09mMcBx4J
 53GXaEkzIm3OKAP9/TI1dSVd/QRQYPrDFVXyjRyPJdiA0VVCeXELa9uz7R8oWEMUHo/2Cbnn7KP
 h3WoWFfsQhcb7Bpbs/TLi7aRjD64VsIkjdH6CHaRzGoXw6S0Um/NcrxSwmFv2MIOzbh3VNCDSZj
 Dkvw9Cc14Xr+/aXSa5CmPu1vM8bPt5nTpMN0LxbLREEKY+TAeLolIjp4vvVzHL1YZEY4WDjhovT
 yJhUemdrDYeD3jgn11QSDMXz5arh+yzsk3x4CJjCh/bnfFFMXpKfW3LwewwyTN+NeKMrvSF9zWv
 0YmSj49O+IuYYca797NFd3U6jNHc6A==
X-Proofpoint-GUID: SgF1I7nWjrJj06xE08gF0PaDaflY4Yx5
X-Proofpoint-ORIG-GUID: SgF1I7nWjrJj06xE08gF0PaDaflY4Yx5
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901603e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=aMyzyzqXAEIezWvZdfUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
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


On Fri, 17 Oct 2025 19:58:34 +0000, Vladimir Lypak wrote:
> This patch series fix some issues found during testing on MDSS v1.16.
> 
> 

Applied, thanks!

[1/6] drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2319551e97f0
[2/6] drm/msm/dpu: Propagate error from dpu_assign_plane_resources
      https://gitlab.freedesktop.org/lumag/msm/-/commit/23ab0d6228bf
[3/6] drm/msm/dpu: Disable scaling for unsupported scaler types
      https://gitlab.freedesktop.org/lumag/msm/-/commit/425da3305972
[4/6] drm/msm/dpu: Fix pixel extension sub-sampling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f8bed917542
[5/6] drm/msm/dpu: Require linear modifier for writeback framebuffers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5e0656b12534
[6/6] drm/msm/dpu: Disable broken YUV on QSEED2 hardware
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bbc65d1bde82

Best regards,
-- 
With best wishes
Dmitry

