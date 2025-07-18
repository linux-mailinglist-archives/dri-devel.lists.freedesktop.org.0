Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77181B0A979
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 19:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A20F10EA26;
	Fri, 18 Jul 2025 17:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hL3fYOQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB45610EA27
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:26 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IFl9k2001312
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 m3LoWx9DJ0TyeqCc/zXgNGefaOcySK/itM7vHhC503E=; b=hL3fYOQCMSzfdzZe
 ARYdewThhNQpHTxU9N5K5FEGaVx+b6EyURyjSKgeEY05Surk9walCPC6uH3da5kM
 moiRe8ECpMYOhbwKNv2N5EZQP99VZA8OMHEFDTFQkoM6/eThJPecHLpCq6DZWWt7
 zLe7E9CkPzejy4CdqKdIifKZEA6CUdob6+dbeWyHbNUXJyxyzuRpmYtrYWX8XYnx
 Jmv9Zq/6pNmnNLa2Tug6NgWZTA+7oXWZn90cUMOOkoFhaz8iYAL1xILGlbSG6zMQ
 vjuQwEXALfkTvBftllkkaBt9BreiI61wcEFH6BvwLbyNUl7JPgYwRBEnUJgifCGx
 XJbQ8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dryfx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:28:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e095227f5dso370755885a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859705; x=1753464505;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3LoWx9DJ0TyeqCc/zXgNGefaOcySK/itM7vHhC503E=;
 b=Zew8rzFzsmaj0UaUR59ZPEfBLjlceoeJZlP9VfIDq7Rtcp0k2HzfFKkIcxoofaYYwl
 AlV6cnyu5Zdx4pmFTgrEW3OXLcYIcZA99bW3Bf13O+zR0N7ii+Qa5KP5tMr9YLmZZGJ0
 BQROeQYtJxYcdHh7YqROlkjqtyvbNRzuD1Ftd2ONm0n9o8j6JD92BVaBTTr42NrKBEPL
 33Azwnf1NDhPUaIqUAyCmxwVVUyjqdgnhmpV/bc7VMiniPGT1mxkyKimI2GzjQjSyeZb
 8I8KHcH+ErXirsuHucHjZ2XHYQfMvg3HXeyEUCeaB6L9bkZdzifPHnpr9fRwO5ejj+VZ
 S5fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2nj1vjLOGDrTJSm27P7UOLHa4aDC5bSiVL2fEYFlB5aT+Q9XwKwrH7kNzIyvojFeUi4/kxHG8oMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw531ZMKzt7iXpyqGYNZo6vy6WmuIKwjNNsng3r3wci7qse+sjf
 s1SUhxzlPliZxJFh7gsSjxZ+T00ZpYnrnM210oSho6tYliK1G0QlDcg28huJorKYTkgYyIUjvgg
 qyliISD9xWMYS+QxLgZRgFAou72MlFCpABsijN/7VNn1NosDetwBrgvev5bcEHi5GLEsjcYI=
X-Gm-Gg: ASbGncufl9XrNkr5bju1F+/B9TNqaSgsKFyqii35evrh9coZcw1XYc+5ZRVZBpAXh9Z
 ufzOOQCKy97gCrYECHp3e4kHtufc+IZZgx8pk5uIfK2BEjQRBEZwF6L1TwW5RHGMVr+TtjgAAQa
 2c336JPlhzD5+peUYtF10wvsFfzMUVV2+Wux55Zk69Fm/NaPQNSh0xA1vThWw4Yq7Ooeghv+GzI
 BuKRWi4Njufirzc4xnVuhOFSohqVWsw9d2YgmzwT5w44caOmpVQNtYvS2M8PXHL8HeN/XvludoR
 HAIg1Sx2uBwN3NRl7eRTe/uZwW8sKAo+xOYiUHEvGjk6V9hZM20NfCWXvmQVXMqbHLPGlYSfmUD
 I8FTzpU7M0Tk8koz/RMCWj/YG1I/2/SWrbTEFC4E+milwAcwt3uDh
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id
 af79cd13be357-7e342aaa43cmr1705213385a.14.1752859704670; 
 Fri, 18 Jul 2025 10:28:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi1fx7XAxIa0TvF/aFCXfwm8ex0+eb4Ytu8ukrsy0ujfZiAFNB/UKSTVvQ3I4n6jhoSky01Q==
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id
 af79cd13be357-7e342aaa43cmr1705206985a.14.1752859703989; 
 Fri, 18 Jul 2025 10:28:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31a9b71esm334910e87.30.2025.07.18.10.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 10:28:23 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:28:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: Don't use %pK through printk
Message-ID: <kb7m3ybmvpt6ywbzawjeqzzxpinc2k7b5hgm5333gay557hxrv@swg4dz4sh7ft>
References: <20250718-restricted-pointers-drm-v2-1-3d9f8566f927@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250718-restricted-pointers-drm-v2-1-3d9f8566f927@linutronix.de>
X-Proofpoint-ORIG-GUID: A5a-SkrCq_geeFxo2wNItq5RNiDNuJ0s
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687a843a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FzZ3ZiyTMWqXPo3om_sA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: A5a-SkrCq_geeFxo2wNItq5RNiDNuJ0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX5yd456tcVZ/J
 RLpbRjn/WtMDA97ACx/70yVtaludo41XV+tMylkaTaaqqAoqhmyqhuUcs7hdUwuXZH6SAO+sAaC
 VjbVOGqjBMfP8JTXJKhUNftQqszVUhZYygIcmtPXmqE5i6/64Nij/+b4/243nj27usA0CXVlrlF
 8+Kt9KTbaALkUWtzJ841UKwaG8FqKr3jRV/bueXMOPkncBYHpRbmwi9A5zWfI3Z5rVvZiPfooF/
 KM4ksTYawtxWf/yempF5yXBmdcZuaVa3YDiYW+sM3x9866mn5hETvELfa7ikC0b9+RvtU9n8OcA
 C/beNBzMtVd93LbqDPkxHUefmspIw49lxwo6aKN6WpTixRZVB+1W4cVrpWXDNPxAh9BdSWnYzql
 V0DirgfhWO8pyk9DsSBQv0b090sXkJI+owd8fEk/OpWAxxvfFWI15TcTmuoiJyTw5mfVF6Qe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180138
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

On Fri, Jul 18, 2025 at 03:27:37PM +0200, Thomas Weiﬂschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Drop already applied patches
> - Link to v1: https://lore.kernel.org/r/20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 4 ++--
>  drivers/gpu/drm/msm/msm_mdss.c              | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
