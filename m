Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83250A7A293
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 14:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EBC10E21B;
	Thu,  3 Apr 2025 12:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fv64jfy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D551810E21B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 12:14:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339rxSf028887
 for <dri-devel@lists.freedesktop.org>; Thu, 3 Apr 2025 12:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dLykAhXWunHI8kSEy4WPYTUf
 hVytF9OGgggs8oTBDs0=; b=Fv64jfy4d7VRv6OsrA0sxh9Ku25e6unlukHU6c8p
 8wQRIVptsYgJVqd4mxFejsLZQnguSeTRwvPFTYtvOfNMLE8+o1xkA8yzM1wwWX17
 prCeJ45gxLCpz281i9Zx8jhwFPi45eQrnO2je3DMhgdPaFhJj5GlTsQvAnErxwUu
 1XWG+1JkZ2GKOrbDR95XS8ecyAmk8rLhItrK0frTlP/J7nsK8ooiW1ihsf1wW26f
 +K/8K+vwERjvObuiVkQqAmMG29cif/nhfrpSqm9hcHZbBpBEG9ZeGphNmLww1rkW
 /NFr51LzS1VWyJDoBuHowhLSC6T20TBssRh5KzZ0aLcizg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyyqan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 12:14:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5ba3b91b1so169274785a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 05:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743682458; x=1744287258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLykAhXWunHI8kSEy4WPYTUfhVytF9OGgggs8oTBDs0=;
 b=aE5zL4Y4ewihd6vbSEAP5EhMpM0F9jy29DQp0yNvDk4dFth8pzva4DzgT+nGpfU/Ut
 bvWKCdKwKZ94BJXf1a8v1nF8GU3rmCAjitRN2Yzk/JqbUSur2Y80JM4y3i89gjyTnh04
 XxwT64G6zKFvj1oOZWA2jr81Q6nfzqX0JndpSUZqaR57cCBWfcXU8SFZunT8lzEZ/lTx
 YbiVDpXEufFksWb+0nWno7uL0aJFKIEPo4V10E+8XSFJgD2mR44EBrvzERRBfaOiJSGS
 NK4/E0mcvIpgOSRN4m4R55tEF78kwfKKil/HJ4lG9M7wusapNx05wzcuRubGJEwYpuhE
 SmLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjYy/NOY0SRecSOSOoa2T1WHwy86LUw5PQjOEBVhChVv/Htg8UUcDiXc7nqPhYl7FKlK4jbQPFt/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvgjZNW94U6FiQaWcrcGqukZbPRkBhOmrlkWFIAYPUSTfWHZRi
 d1gidfXufskkMfIbBE6NYhMpt8LwxvxLjSWK7lOFGT0VcBBKPrjcF/pGdQXiFpci/A2sY/CfVjt
 alROddcSevbr4S6DazkDJbxRdkEWKJY1tTeKvVJLd3gcyWoy6cQ/cP9sEPJEU7pz/soM=
X-Gm-Gg: ASbGncsDg1rjpomsiilAlzfLJgB96Zc8QS/uAowy3z5fxkVlEn3e4gT64IvOej3ndLW
 pL0RrZTrMqMa8K4iV1wGdO54GmI36rDjgWj69dgb/iRArKyfQiXpNb7gICYy6GIOmsbld8XVzzu
 SGTgk7UubSUsEx9fHB1Y6F+UDWKgVeE3bRxOy4ftRHbFWOuoKCggfr7R+irGIkSBk/+vNkuizIC
 8ocIzMksFlHsgeIRC7N0QoF2MjacqkKvFVFOREmgaNIPyupvX9dVGWn1Q/1BKZKlVGU1U54dVIa
 wnUp/44fCrUOuv1BjUa5G4aVN5pI3Ib5vW5P3DzQQmPAfc2IaWEKhqF2obZj9b/xsjEbalrm1d0
 ksAQ=
X-Received: by 2002:a05:620a:2910:b0:7c3:b7c2:acf6 with SMTP id
 af79cd13be357-7c76c98f7dbmr511677185a.15.1743682457780; 
 Thu, 03 Apr 2025 05:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQP5HNZ7qkcK4qHlBcQj9o3SAvJ8aXKNFHMdgvICYbDg+OhKlKPefSoRKfg6pRpmiRTZ1ysw==
X-Received: by 2002:a05:620a:2910:b0:7c3:b7c2:acf6 with SMTP id
 af79cd13be357-7c76c98f7dbmr511673185a.15.1743682457414; 
 Thu, 03 Apr 2025 05:14:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e5cc52csm138973e87.105.2025.04.03.05.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 05:14:15 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:14:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, 
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 5/9] drm/birdge: simple-bridge: Add support for radxa
 ra620
Message-ID: <mp6dgybevy5uercnqam3ok4rorpmo7a7ok5jcgadmxypl7ueaf@yl64do47jnp3>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-6-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403033748.245007-6-andyshrk@163.com>
X-Proofpoint-GUID: u_KHQgFza0CEfHS-aw2Fsk-M_uFnnQHo
X-Proofpoint-ORIG-GUID: u_KHQgFza0CEfHS-aw2Fsk-M_uFnnQHo
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ee7b9b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=mpY5dVvo0S6m34Ll3HoA:9
 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=994
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030051
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

On Thu, Apr 03, 2025 at 11:37:33AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The RA620 is an active DP to HDMI converter chip, basically
> no software is involved to drive it.
> 
> Add it to simple bridge to make it can be find by the drm bridge chain.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - First introduced in this version.
> 
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
