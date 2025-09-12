Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E78B54AA1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D835510EC09;
	Fri, 12 Sep 2025 11:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HogY8K/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A702210EC09
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:06:58 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fJNv009054
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ObqOUZTyrARl8ec8JgmHRIoB
 QhBr/qr+CrAYCMGQmus=; b=HogY8K/EpkV/pbnGmdiacBZ3fg5WnhBQc14tPHE8
 dGFAFY15Ke35AX8wHNIxpMICYLjk524LwDwH7+ESLvSWfHG0jX+z3POOceLoiFtd
 mtnH/kgcCGF7eD7kjQg5pV141NQ/4vaq5p1iQrVBevtotYv1dq86UHBuBdNSQITU
 +G+1vsOOMsDnwgnCFcy8uVTCL2GuIWHBcliJ2eDN96TsP1+TpiZOuRLLcJhEdxeg
 brvRfxMyhf6EKz5PpJsb8EZ8HVP7Sb4Pzxw8kqZtRJ8s8XJk4yO0IFKWn1zseqy9
 n9dvE2lcfcF9bRA1T8jAva9OKWZkM4p6WBf7GfvB3GEAUA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj13chw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:06:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-76485dfc1f5so41436356d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757675217; x=1758280017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObqOUZTyrARl8ec8JgmHRIoBQhBr/qr+CrAYCMGQmus=;
 b=FZk4PXIhYjYJfZgBv+hyTDFmliUoFvGReFdjJOkC4KrNakKW+GjbZh6AJhfCeWJFF0
 3L3pMYS+aNeF99+d14Nlb5EW6Xe6Ay3qN5dWHyMdQDybyWGUmoadQkyGV82T3t7Q0dAW
 nlu+HzjN5AJHMdUs0TPHTdqrrkHACTVZXY9YBWRJNKC09gy/1FduxFjb3z0/QjeO8epx
 9U5a7c0V+YZRfFoHOcwo2re+5but5iK/KKo8Y4VpR61A7xHgQB+GP21AQXa0t72gU1rl
 LyxUllAIkjGh1NJszSmcXeIaNcmlmPNNklcoRV6o+IA3xTbkTLR2RYirVoGOMzHFDzJC
 6PbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxMDuk5TI5WjDFmrG2ePD6porXI56r5ajMpRSfR3ITrJkeWIIh5lri9ElZ6Ogb4I6VbMX7SsFkT3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6+CYyOAMf/KtIca8RK+YWpVqzq6oTwp40gCy3tRQkb8/jTUuq
 0ZgcMjHiAAxt6v5abszpWJ0ElykTUbunbXaBvycJXLL+rpG8Rs3+60Vryj/wjfFyi/9WcT+NwQv
 DGVn1Q95Q3QkFazl/3V3fwHIL3Qg0JuZfgraHTY9Bz5R/vkZhJylzxOge8V4qUtB6U6pPefQ=
X-Gm-Gg: ASbGncuUOzB4azyQeJomjEgKrqOPxc9I+CxFD7cYnY+2t458yqWJWOej/8vPushW4py
 JliGLRWN/j/9j42YAWkkwbYRq3FNJBF6/mrwRBL1QYNxh4a++EU9Fqz8n7Dd2+x2+oXxb0SLtmT
 q4M7cWhNeFt94PWRCo79kQzAJ+Jle7V/jtfUb3/scYTf0r/gVzZ0Y52qR8Alu1wzCPaeT0/C2lX
 mMX9k/d/ODUb7KmoJOoqAe/FziC8yRxgT56EY/2QEOGBfeUneTMeiGHSEX8lE6xae7WRUNKhfmA
 r2wN2ORbN2QtwttQcqtglOuGFrIzLGuuwb5W4HXXMO8eqIrM3SCz5tvf7rtz5AY24Qt9/RmIzEA
 9bjb9zulODvMAqpgEXXhdgqXe5BbBYKmORfZYT3TlLDCbR1wRLVnN
X-Received: by 2002:ad4:576e:0:b0:70d:81ce:ec1f with SMTP id
 6a1803df08f44-767bd2881a8mr34381696d6.12.1757675216791; 
 Fri, 12 Sep 2025 04:06:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzL4AO8dNGPWgFHm6qvxn4ogauEObB1TwGr9YSH5AEOx8Q+cb9zElyfiMXPvqBFGwT80wJCA==
X-Received: by 2002:ad4:576e:0:b0:70d:81ce:ec1f with SMTP id
 6a1803df08f44-767bd2881a8mr34381126d6.12.1757675216206; 
 Fri, 12 Sep 2025 04:06:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f15a5834esm7432661fa.10.2025.09.12.04.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:06:54 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:06:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 16/17] drm/bridge: analogix_dp: Remove bridge disabing
 and panel unpreparing in analogix_dp_unbind()
Message-ID: <zt2kyoq4rnn5gbb22vvpphqwmbbv4vecjvc2iepa6t5iljhpgu@xckynlkyyjiz>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-17-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912085846.7349-17-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: z_lBO6ATOkltcJMYTCfhaeEX43F7szJ9
X-Proofpoint-GUID: z_lBO6ATOkltcJMYTCfhaeEX43F7szJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXydbua8Pd//Vb
 RXGK70IPy3qi742YicRR6IaZYoHYnANpmPTt4fBQ95KDmEHEakOEtetRst8AXrvBzaEGJiiJICt
 7CkyARTc3v3D5yiDhXsI3aNvBnFaeG+GMrdch5y9d5A5Vq5iku9OFqb0xiTYNoyvwpk7T3YnXrW
 5z2q74RcvDs93yJIlCP9Ne3QWwJwtGiyrRtI/gto6SsCxwqdufS60m/1tfv8ZLVODaUBxEpRFRi
 JXXxsqzuGgnnb4/sdpyZ+fXw4J/M4SM6Kul7gb9Gta/50Gh3VntV+a5chm/21kOd3dw9zSbeDfo
 Feb6iITA/JP7EobH2L2LwRtjzGbs6XsURAHsqyfyd0+1u/AheN0nGTwaHzcEdLpRPCqN+c6DVO/
 pibiUkoC
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c3fed1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=0i7CoW_5q_0ZA8A6Ya0A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On Fri, Sep 12, 2025 at 04:58:45PM +0800, Damon Ding wrote:
> The analogix_dp_unbind() should be balanced with analogix_dp_bind().
> There are no bridge enabling and panel preparing in analogix_dp_bind(),
> so it should be reasonable to remove the bridge disabing and panel
> unpreparing in analogix_dp_unbind().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ----
>  1 file changed, 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
