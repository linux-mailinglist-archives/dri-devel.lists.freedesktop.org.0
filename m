Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44132B0AF13
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 11:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6250610E13B;
	Sat, 19 Jul 2025 09:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwVVF8mn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA92310E13B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 09:19:54 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4FgEb018269
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 09:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fgOH2EMBXPQoK79TfkIp2MYG
 GZpvPv+GXdFI8RzZGME=; b=LwVVF8mn8nWKHE79wwKCX/hA8cQPK322+nqhA+33
 cZ9GvIaRKii2zf/E6zXyQuBfmLMUiAGOHYfbAHXN9BvwpiIPLtQp8EzGPd0Wh3/s
 Mqlp0g/Jg/ymbQnVmmkUpjpOvnqKJhhMFEe2e4gzVKNAga6/SZMG1f95UUkXZmiJ
 HajOJzq1QS8+NBOpnhYbW/boGgdLJjITliS0tcU21xCzgeLbDOYUxB2Y9h/OKGSd
 ltMH1H0ZgFQAuaq1hOCZoV1cB1UKkmWGOdPTOlMRNM9+9cAa03HRYJzUcFA3KKw6
 p8xXhUrb0m6S4uUQPhcKMdAd/xJThltCxqqX/ndoV4Bo/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045h8djv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 09:19:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e347b1a6c7so659444085a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 02:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752916793; x=1753521593;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fgOH2EMBXPQoK79TfkIp2MYGGZpvPv+GXdFI8RzZGME=;
 b=oOZOZdfycFB+k1WhvG+lLzstn/qToakF59RJaeLoN0UIPxyWjeMOigAzdGxGtIktlC
 JBLM3dDyw+q/v4UDn+Eu4oa2ScaHsEVtQSN15JUNRX6TQDqMGrPtzWPbp7W5imFL7aGh
 067r3dxUTTyRpAsIz6z3s5hehFRomXhY6dX/mcFg/0v5EILhfwB1yP/aEHi5vryxhajj
 vh9YJqVVujGfbsQ+szss+5ZTQDYQyZhcQbt0gf5k0knwyL7a0BXdzTUIEL80YFCRxjbr
 HStxRJdcIcDDsLaJBvEdQqiYRtQ3oxyuJSCMyK2l/eagX0N0EVAdEi1aatZmLnmiPduF
 nUZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKk+uDbBkUVq+6ifSARG38axzsHreOfH8PPHJpjDK3VCLhRFzrKehp453gyLbk2cWTDfD1Xsod1fA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHv63HKyZ80zyjqlzXBC0zvuMZozVwFaFdYC6lQlFztrUEfQiR
 TaB9p7G7hElhrqmj6DpSHupdPTJGYHbfY4WGxjk9Q7V+W6/m044iv1A44NNB+/XPswkPmWrUbDS
 XcYtAVXV24KdXAHS7WlCPLZBU75UJvblq/l7hMb8p/jNvGBVqgSqKaFqXjzlTBvhCvPQ5FNQ=
X-Gm-Gg: ASbGncuSWHZ6xTdURiU/g9sKEdSvz0T3P9L0VP1XLEvOez87nvogpwXKheFyLOCLzKF
 e0lDAnibQgs0L63K7+eCFfLkuSyKwbR2hNan84YhbJdTnmb4x4hsEgtHlT1SV4tEGUC8oU7LIKf
 sKJbNZ6zddB9TByaN9OK8Z8VNA72vNV0mUXcjUAmcu9P5FjhYlcvSJraP341h453n85+G9DCeAf
 ykihy9eMgI1Lwu3zo8R1Phic12LeXVfBPDKqieNXasCI0sNJF2odZ4SzSQcTZHjtK7SsICL5O+A
 p31SC9dzZHyaiuV3YcK9XOFoVYEJyXE2y9Mud5vib1sX8K9A3vf/BWbBjkT8V0pYm9YM5EnVPAH
 byC+qA8NFvABysKkjGWEygoX86C/zkrw4/YwZ0pbSgyu1DcLVTf8y
X-Received: by 2002:a05:620a:2943:b0:7e3:2c03:a198 with SMTP id
 af79cd13be357-7e34362d8cemr1715370785a.51.1752916792961; 
 Sat, 19 Jul 2025 02:19:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrTVJZ6H+BDUrXWMtyZHvBXjeITWziIhnLeZNZgm7ut9rW4DupNl8jJmWor3RXExsowMtcPQ==
X-Received: by 2002:a05:620a:2943:b0:7e3:2c03:a198 with SMTP id
 af79cd13be357-7e34362d8cemr1715369185a.51.1752916792436; 
 Sat, 19 Jul 2025 02:19:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91c1575sm5342391fa.52.2025.07.19.02.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 02:19:51 -0700 (PDT)
Date: Sat, 19 Jul 2025 12:19:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org
Subject: Re: [PATCH v3] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
Message-ID: <y7tffafhe3skb7pgx7r4hx2dxccfl36jylko2ujndejxktfbiw@gzbrhnesntxn>
References: <20250709140836.124143-1-loic.poulain@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709140836.124143-1-loic.poulain@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZtDtK87G c=1 sm=1 tr=0 ts=687b6339 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vVdACntxX79Zt9NN4_cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5MiBTYWx0ZWRfX9Stv8E1Kmn4z
 hcYgVEPiF567Jgq61/9Pm+Pu4SM7o8Myz7FpwIxdU7jVgCXDfQ8igy6ORuz4iTIJvQJ0ZVCpV60
 K1LvpSkS+Wo9BcNGmYpW92z8txVx2Wn+oy6aojY3vo8tFLUmMt97xHQk21d9DUAoFKo4ge4fr45
 qr16vwnPpzY0JFFlZwdFJYpoAkgaGoSzmZYNWSQQwNAUxzgxxQ9MHSbmBCS4v3jbBz6pjZDJ6zY
 ubf0UZR1MKnWfS61t7VouLyArb4b2Dnt0bVFvGSWlrs9WS/tNmCXihksSkFHiwk2KXCbbQg0aUz
 CnUhKNz1OEaC+jQWOJtqQllK0cRhcsCnfP85fO/Sqp8iqubnPAEV7fAP6p7KPS3W+vlZji7dlSO
 RIxYZacfRy0yaJCOaLrAuULr+Dd/rlmbu0e//AoGnR+Yw9OAETAwQTZw0htVYUS10TklaNlp
X-Proofpoint-GUID: JCXHe9AGcbriYHegtczixAxZY-KO9CBv
X-Proofpoint-ORIG-GUID: JCXHe9AGcbriYHegtczixAxZY-KO9CBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190092
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

On Wed, Jul 09, 2025 at 04:08:36PM +0200, Loic Poulain wrote:
> To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
> be active for MMIO operations. Typically, this AHB clock is enabled as
> part of the DSI PHY interface enabling (dsi_phy_enable_resource).
> 
> However, since these PLL clocks are registered as clock entities, they
> can be enabled independently of the DSI PHY interface, leading to
> enabling failures and subsequent warnings:
> 
> ```
> msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI PLL lock failed
> ------------[ cut here ]------------
> dsi0pllbyte already disabled
> WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa4/0xac
> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
> Tainted: [W]=WARN
> Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
> pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [...]
> ```
> 
> This issue is particularly prevalent at boot time during the disabling of
> unused clocks (clk_disable_unused()) which includes enabling the parent
> clock(s) when CLK_OPS_PARENT_ENABLE flag is set (this is the case for the
> 14nm DSI PHY PLL consumers).
> 
> To resolve this issue, we move the AHB clock as a PM dependency of the DSI
> PHY device (via pm_clk). Since the DSI PHY device is the parent of the PLL
> clocks, this resolves the PLL/AHB dependency. Now the AHB clock is enabled
> prior the PLL clk_prepare callback, as part of the runtime-resume chain.
> 
> We also eliminate dsi_phy_[enable|disable]_resource functions, which are
> superseded by runtime PM.
> 
> Note that it breaks compatibility with kernels before 6.0, as we do not
> support anymore the legacy `iface_clk` name.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  v3: Drop extra pm_runtime calls from probe
>      Reword resume error on message 
>      Document compatibility break
> 
>  v2: Move AHB clock into a proper PM dep instead of manually toggling it
>      from the PLL clock driver.
> 
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 59 ++++++++-------------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  1 -
>  2 files changed, 18 insertions(+), 42 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
