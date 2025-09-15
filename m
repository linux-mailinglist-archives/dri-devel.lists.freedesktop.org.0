Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B88B56DDF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 03:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5406710E287;
	Mon, 15 Sep 2025 01:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfsfyYJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4135710E287
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:32:07 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58E905AX020505
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=L2NTX765/GLBc70cqhGhsWfR
 H7iv5feao/sj54eTvHs=; b=dfsfyYJQjQlGBQERRuhpyDMMSArymyJ2JVkJBosw
 FjmNwNQR4eaBvHz7ScxIjMDfdRvAiJKG3wuFDN3HbkU5XeYXXssw+nbE+HN2RdqM
 Rm0Q1oRAXLHHNvERyxwlY3X0NeaoAaZAsr7D11HjFkMQMh8SodDpc9BQCHXQ2M5X
 Qm9DfdBvKGIRWa9xigTLXvSjuEQuCK3VwJ33i2nXEVPxbmOJTA3St+Is0V7XxEEf
 F4+WEyquxlaJEqNpoc6me/osK1B6OLQCeQEv+VD/l2WKnYXqp8J6qFpPguc3b/Y2
 SEjX3b9eSLMXcGWDiY4zsyohPqwK4OV5TcWC5GkB93//Fw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49510ab1wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:32:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b49715fdfbso133036001cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 18:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757899925; x=1758504725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L2NTX765/GLBc70cqhGhsWfRH7iv5feao/sj54eTvHs=;
 b=DhPlx8i8uBZxI2E912EBPv6nsnlV+PgPLUkgMtiAtIe413/pX0OA7vwKCg+4fDFG6c
 ogUf9vZZkI7iBZ2FDJQAiAS0bawi6Yk5BGy0pSvursZ5m0wzjDQPPF59NqrH9+x7MLJ2
 kFRWTnYreUuiacKG/Go0WMMoBd/HDi2BL/liDOT4zSJPVKgtMynpJBh13BDgCWIe0W6V
 3iKBXXQj6C6909HDXFab1dwA4VRcQ9rhWeKiIXm2ur5IH9jxvPPZZg4sHnjoNU0jNRgv
 yeB361a9zRl0RWdZG2q2OS7gns6iP4DPcMeQfac8Vui95FCtnAXaT0HTHbiVtvFVt/4d
 hGIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrYbIubu6N84iI9GjJPgZKabkTjHtQXU4qjxTXed1bAorUQ8TWTO9u1uBZQ9hrGKebPFzCkAKxpFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg/a0uVeFkToXuvT9EWX2VbQrCBw1ETfuCI3UZyKjKTi51vP9G
 NC4LFmBgzdnwNMUKwyCNAj3JJh8YKH3/ignDpA/J1P1wPY/QI0bYqbhCzvvbuEOlPDI05sMolfr
 Xg+l4obc/n+d4TG80kZAsRJsSlz1EWE/aO2Erj6jO3KGfEh4Jd2sAMlr1LTglazwNBvR93+0=
X-Gm-Gg: ASbGncvaK++evh60xuNEzia79FBJxsqxyE3OFbdSCaaKkF14fnSScwmOpRlR5Y6htTH
 0Rb/F9UwvVB9y+QRwOooOS2wUq2n4djHJ8g1EnXA/Ub16fokXjqIfcP11ioXD2RAWw5HRnxK+uV
 CbJ4+uhNTxlv8+Fm5R+doqfukNMjUNJm0zkBUpc98MaqrCWDNTpo3ZfDHSf6x9ONyvuS+d9IJdn
 a+v4GNjPeGK93YgGq1XoAjh4kP5OIsXDMyagYkktcJhcT0E/ZughZprLxE/g+zvjZ/Jzl0xeiTU
 B6SDuYn62kgjhFqs1sPFCAmYg1aUrWhVzS3zYNb0pjVa6BmsJso5LtfhllIxi+r1ynl5XJ/9RXa
 9H62yq08rOVOgeZzJpi/QHEp+HmswFmxuFdv/L/2C5SjO1R58zRRH
X-Received: by 2002:a05:622a:14d3:b0:4b5:e8f8:d79e with SMTP id
 d75a77b69052e-4b77d0c8413mr145136041cf.51.1757899925603; 
 Sun, 14 Sep 2025 18:32:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIRphhZ8pdE7c8/Iq9pK+oZ5EVGXoKWdHtWdfHe4OFvQoc76dVf/TqwAUi+N2fI3ngj4GnFQ==
X-Received: by 2002:a05:622a:14d3:b0:4b5:e8f8:d79e with SMTP id
 d75a77b69052e-4b77d0c8413mr145135801cf.51.1757899925198; 
 Sun, 14 Sep 2025 18:32:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56ffcd4545csm2882855e87.140.2025.09.14.18.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 18:32:03 -0700 (PDT)
Date: Mon, 15 Sep 2025 04:32:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org, l.stach@pengutronix.de,
 dianders@chromium.org, m.szyprowski@samsung.com,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/bridge: analogix_dp: Apply DP helper API
 drm_dp_clock_recovery_ok()
Message-ID: <q33wciy7eygu5kx4gtbj3h2vdoqnqzjhff2j2ksnpftxqbmst7@54uzyhw23qr5>
References: <20250911112756.4008435-1-damon.ding@rock-chips.com>
 <20250911112756.4008435-3-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911112756.4008435-3-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=I/plRMgg c=1 sm=1 tr=0 ts=68c76c96 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=GvRoZV4vhj9c5SIpLqEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMiBTYWx0ZWRfX589myenbT02U
 ARNlJFaXEUnSGuHDx6sk2pxk1WxXI+Zmu4gjjU2EZagWKL+D4jZ4OmjVo3OCKg2KhOrfnt9WyDt
 lUloPku4zBOZHAytrUDXYVoYP7nZR/aaYWuwoxYQuD9qxkpGD6+laxc81JmbyqlURyAgmaa3+J4
 ndBxrWyx4siP92Jvs0kxAG3EyHQ5qL4VB/UxPgc7F1Ywx+woLnBr+iX2t6MLr8QVEk6my93RpB/
 V9ewQ/wvR2SeLMh/qVmim4sN0lCuKBp8X7DvBAhE8TwV+BhiZFEk3zm+88WC/IbrOFmKpsluO8x
 H9+eOwD7Cnu1w78zZG7BKG93gbNmDmQiwkjaQU/V2XXLMvxJrMCVHMvMvrQPNGEHkh86aNyJqQV
 jjXqseLU
X-Proofpoint-ORIG-GUID: ioAPP9qQUkyzgylrJtNo6KG9xzUghQk0
X-Proofpoint-GUID: ioAPP9qQUkyzgylrJtNo6KG9xzUghQk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130032
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

On Thu, Sep 11, 2025 at 07:27:54PM +0800, Damon Ding wrote:
> Use existing DP helper API instead of analogix_dp_clock_recovery_ok()
> with the same function.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 20 +++----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
