Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C26A6087D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 06:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCC410E2E3;
	Fri, 14 Mar 2025 05:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VaWprMZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F6C10E2E3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:51:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DGM2XK019894
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=i7ECqdjToXAfktDwl6HxzCMk
 AGDOJLghBSlD2hSuCwo=; b=VaWprMZOG84smP2mJlJGrHWoCNu0uEii2CxUVUxS
 iLLhIODb4aU17fOWAKO37CetGyxlZbon4ddj/tl35EwgWAdagkZGpHoLf8omskuV
 0mDzjQJNcJpe7bKGr1s7ophYGr1bg3/5y5r5DfgmaVEkuZvJ56DCev7iTOGhmeIS
 HIxUDHcL1K1uvs8vxD5HGNftkhQquNnbSfclhNJje4x3nVfNk1qX9rSrbXPF6mZi
 vbs89pMAxb00EdmvJg5qo8dv0FxrVVHHLLXupHlvSIzLpFgRfvFo3h41sCPWy7zy
 E3VYFdZwjvUAb3ludhA2pr6kq/VwdijWQKYRcUgCa/xfdw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bts0k81k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:51:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e900f6dcadso39683966d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 22:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741931478; x=1742536278;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7ECqdjToXAfktDwl6HxzCMkAGDOJLghBSlD2hSuCwo=;
 b=c/DcCqF92PBCPgjuCfjT0Ne5QBLf8Bzi/0V05nr2W0sZf5J/bCfiv8np6sl3J2Uu2S
 xy36R7beE3oBsXqdnRrhuLqVrcrZpxkDIW/Kh1i2vszzoDlajXdUqVtrGMYhkiesXRwz
 P8YCmEQJWPOZ+XrdhOE6QvfRGy82KE8/tueC/kfqIXPGrjfp2WESH+EXb3llLr9Xc9yd
 2sK8SVvMsqm8KHwERNPYfxEYk2YEU0GSk/KAQLTWxYQN349NM7e+jhtcOzyPGduVhnT6
 o9CMFr/6LakcDdXXyeLp71xwp+BKcn/fBkfI9Z2mxInPUda+VnQkfpl9uQEinC+X8eoy
 joVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhjwvv36iR6GyIu+HXS2xDXE0mmQQpaKCpfLBLDAonDjyUjlwGUTuPyiEQWPT0TipwCL2uf32WvTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yziiug82MK/yitx3k7uj/U1aUwGGQibDRe3ppQTMD+iizX7crPi
 /QHDzFvOzThW3vf612TBWyjjezFERJEoGecAg8Kf8Vbe0zTZTSHmWuTRsInTppvCBbpSKNzfTz6
 WHhTQ4PUppCalmRsMtZyx4nEec+lLo3Eu2hUAJ0QGXKVUWOBNqfI6fhhGeQTiT7Hg39M=
X-Gm-Gg: ASbGnctu/02VPfF2v78b9VkXW5y+E3JkAGeZvu5f1gXpKSSZ2UkKf24ypUbklXNHNxh
 S/gqTD//mlA5zE2k5FHZa1tqJjellT6YS18uUfclyou3dEQAF2ok5wP8FwTni7hae8uskevxZdr
 j4xEawcXDBx2SP8z137crlMex8DEtElQ+yx0KpAOPo5ld7JytLrEC4AlaHGIQo2R3LDy73iyxkc
 BgdmKwCXf5r48510jjBD8BKo/QvXzWZY+v0HzlQjZ0n+pwgeo0+Q8McadlI44fy6DskvI2P+KTw
 q2HQQ0+vN5cuKaRuE2l4J+6uSklm/9ytAScLgCZziNiqlfB75h0ILsL0U836Q+2XbvO9g0J3zLo
 Xu2M=
X-Received: by 2002:ad4:5ae3:0:b0:6e8:93f9:302 with SMTP id
 6a1803df08f44-6eaeaa07ac5mr16664336d6.15.1741931478658; 
 Thu, 13 Mar 2025 22:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpVbpOxeiloNBX3cLmvnlo0EP97lsdecQPHWfUunwY16xcqP5mMTKI+A3eAU/B9zOC8zu3sg==
X-Received: by 2002:ad4:5ae3:0:b0:6e8:93f9:302 with SMTP id
 6a1803df08f44-6eaeaa07ac5mr16664136d6.15.1741931478415; 
 Thu, 13 Mar 2025 22:51:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba8a8ebesm411808e87.240.2025.03.13.22.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 22:51:16 -0700 (PDT)
Date: Fri, 14 Mar 2025 07:51:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: lumag@kernel.org, mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 5/5] drm/bridge: it6505: Switch to common helpers to
 power up/down dp link
Message-ID: <2bsuisl4ljsdbxxxejgkevtpwaz3jazcxh4b7otv4s7vhloiop@4ujjobsrafg5>
References: <20250314033856.538352-1-andyshrk@163.com>
 <20250314033856.538352-5-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314033856.538352-5-andyshrk@163.com>
X-Proofpoint-ORIG-GUID: XkXpJ0o5uAJ9oTgm9uG1S5B2dKWq24cx
X-Authority-Analysis: v=2.4 cv=DNSP4zNb c=1 sm=1 tr=0 ts=67d3c3d7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=Umc180e8Ijspp4NO460A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: XkXpJ0o5uAJ9oTgm9uG1S5B2dKWq24cx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=784
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140044
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

On Fri, Mar 14, 2025 at 11:38:44AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Use the common dp link power up/down helpers to avoid duplicating code.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  drivers/gpu/drm/bridge/ite-it6505.c | 46 +++--------------------------
>  1 file changed, 4 insertions(+), 42 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
