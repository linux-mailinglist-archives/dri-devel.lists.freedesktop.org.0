Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C665EA7D039
	for <lists+dri-devel@lfdr.de>; Sun,  6 Apr 2025 22:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FCA10E11B;
	Sun,  6 Apr 2025 20:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jme3Wz73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F8C10E0F4
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Apr 2025 20:26:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536JUpSf024726
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Apr 2025 20:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UjGwNH6c05e2ZJVyDxHhI0Wz
 SpJhkNhQNLiWVKWtit4=; b=jme3Wz73pGBnVPz9xxvf3BndomAwtGrT41KUZrFn
 a/bY0uXX2DhhFLvBbxjV09Xx50nfeSq5YZW1IwlYe5S3nAdnflBvInjMY18BZact
 9iNjktSyC5TeSb9FnGJxv3RrP9nRsRl85+DkAIcjoqOEow0v0La7aO+iNyTLo7eF
 j49cLVexYSYSLTawBzvd4YCTsYYtjsIffF8iHe6ze0tSufkwsVeC6eHyP3l7pTCy
 b49giFZM72EY6krXk1OBSp2Vcao1GU7q+yEpPE2nmI5ZR0t7zV0I/iyCjUbbGMzv
 HkG3goKEvBYXV38HXCLnjJ4SYDxdhFfkDQ0K+kPNZX9EUQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm28yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Apr 2025 20:26:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c77aff78so1119981385a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Apr 2025 13:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743971187; x=1744575987;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UjGwNH6c05e2ZJVyDxHhI0WzSpJhkNhQNLiWVKWtit4=;
 b=kvZkoymWkUjNk8pbwLbY5dYlN9nflyplX7A82B0CxkxsiMTrnXDkAATQt/Fkf5RYTX
 ilLP5cTzf8YDgct5eh595dUOd5qKr10I5xweY9ppCAu44ZoT2U0oJRG20FO0IoYHa0mE
 eG7Ma8VMo/njWRQAy9XS/E+o01pN5Onv3KOOO8YDWuuir6Vk3JFVpoUNbjDKZrLKXuy/
 qHO1ZSSP0PYSKyN+MB6w4Jr4E2/4+7UyJhoGK3aEbfq9S9rpn5B9UdHqR/iBTIfqDqAI
 R/kxrcjOk6S1aobualXnfprf4HLjrnxPBBWJoeQsMur7NIqhGz4eMiwnyvkEiI9LBfiE
 uDoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUr+cJfmOp0pVO9/b2ZmLzQL3Afw2M1IQFf6JFNDxi7qwtkR+90cLhrDrLQeHpFqmK5vLsOvyT/78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzpzPES7YlmaV/terPUCTSZsRHIXpk8zwGk/Te8Q2KO85wCHl7
 rkChfLovrNgbLqS2cbyNozZWtdLaCr8sAqe1L7rIonz4Tbf9SPmRdEhQWEZqaDt4IZ1yhwpfKxs
 rVrGaZzY0S7QsUWQN+aAgGFjxcABWz2GQ3rk2dgPLftFb2TLa7sdTONPtXapqwWmpKAA=
X-Gm-Gg: ASbGnctUuOLxSyMCIL3mcvZbu29kg9T27Z0qBKiBKpuOgj1vkbhZWZVzMAqgW5WgzEH
 qaG2eZli7v9vkzLmiKTNQ46+xN4TERntuKEHfcqMQ4jMiNZPMhZi8Tb9167+RHhJo/e3WWN6gyI
 qzP5EQJE3LsV5/PCgL+TBooV0JF2+nklZccjLuQ0UKVCoWCvAHX2TbpNl/8S92RT7x7lxMST07F
 VwBqwXol6g7JTPSVb2dCAsh6C+GRDSWBVRECofGOO24B0lwOUa0w1V6U7m2d62r3NYXWxu2DanN
 NjQ6tfNbGOe4af4uBRruWdm/HPu+XC9eY2P2GRv5NmxqGTHly1258+sakcs9Wus1HLHO2GUCmty
 g6Yo=
X-Received: by 2002:a05:620a:430c:b0:7c5:5cd6:5cea with SMTP id
 af79cd13be357-7c774d2cb64mr1319173985a.15.1743971187509; 
 Sun, 06 Apr 2025 13:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOUC8/sge2Zws3JbtbtlXIqzr1w+PRoazsYS05/FRkX06ItoCneX0X4IELGp4ykgdikcb+3w==
X-Received: by 2002:a05:620a:430c:b0:7c5:5cd6:5cea with SMTP id
 af79cd13be357-7c774d2cb64mr1319170885a.15.1743971187219; 
 Sun, 06 Apr 2025 13:26:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e671b8csm1078793e87.223.2025.04.06.13.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Apr 2025 13:26:24 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:26:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v3 08/10] drm/bridge: anx7625: enable HPD interrupts
Message-ID: <srobukvnruqkgwbtfeoc4aiam2zw7j4oe2eyoqd24fn54m7s7v@v4roslimt7gn>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-9-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404115539.1151201-9-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: rUBvRHU6DbJbnfmKN2BU1YLKqZMDnRpw
X-Proofpoint-ORIG-GUID: rUBvRHU6DbJbnfmKN2BU1YLKqZMDnRpw
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f2e374 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=dfltxrk8hYN0BGuGiOAA:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=711 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060149
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

On Fri, Apr 04, 2025 at 05:25:37PM +0530, Ayushi Makhija wrote:
> When device enters the suspend state, it prevents
> HPD interrupts from occurring. To address this,
> add an additional PM runtime vote in hpd_enable().
> This vote is removed in hpd_disable().

Please re-wrap the commit message according to the recommendations. With
that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

-- 
With best wishes
Dmitry
