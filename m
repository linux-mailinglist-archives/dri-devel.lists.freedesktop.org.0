Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC4CDD1D2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 23:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31E8113117;
	Wed, 24 Dec 2025 22:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTbnioAZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MtmNnaDO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FE4113115
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:29:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BOKkYsa3995964
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wvQVq6F9bvfy0ys8kp6NNiH3
 ITMTAjtxgfbrAUNz8cc=; b=aTbnioAZLkQRINCOhi4sq4N3TVWLG+eFdLcEDJW7
 6rOOQ0y/YFPW2n7mQrxHNvy6Vc6OXHt8cvfEn0Nxs1tkrHi+aqHCqbGq7qVT7TkL
 K4KdqH0+HxwO3MRI2oMDnXx9aeb4Go3JODpsWwe71RZNwbFXNc6rg5AqDKsJD2JJ
 TtJGeBtiAd+upAwtHaUvIY7jF8OlEV4cGJpfmpBgLM9CzKsmrUSxMO2p+fbkCYpK
 7znEvaMapoNNUT5ZeWNaVDdfNS+XKoj5qsvk3HPiOPe5E55cEqjhkJFCfvkZ3hnJ
 yI7T+ZQNsKs/jattVxcCLPcVIhXq/voS+uRzrG7ZJJqXVw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq3n5r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:29:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8888a6cb328so159028796d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766615348; x=1767220148;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wvQVq6F9bvfy0ys8kp6NNiH3ITMTAjtxgfbrAUNz8cc=;
 b=MtmNnaDOl6dn0v3rtSp4k1mAUamiH4gcBGFG8BDVIvyZn2OhsoyV9pFiE4qxZOrHFG
 bW88k7ukMJPE8lQVFkZwBX2dJEfIX9sk5xmIhWM6AYmKTPnVriCl17svvY1FcCyvs7Le
 wkWMqht4yf5XpIf9S+GuZxR9V8MNlZu3NGA/uuirN8ooyexLBOC9s86hQE8Al3rz7eQn
 l3JPdUoCIym/yaLcnWoKxSUzhxhsjty1xq1Hnkx5xYBezSj/L3nqme1fCWn046NhIEvV
 P/6Ii9PU1Xt1+fA7+tkZ0U5N+SCTRv1cepkS7qCOCMCu5oEVjtdJW/hMKZF9GQj1rmT/
 fcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766615348; x=1767220148;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wvQVq6F9bvfy0ys8kp6NNiH3ITMTAjtxgfbrAUNz8cc=;
 b=AFMCU0XB3d4bZJ2VmNb74Sr8t1Bd4q1DCSA7G7y70P4Dd4EJxyRizURGOlzuwimac1
 whcJC4tibW8q7aVMBHTm6MJ3WGEUJR1BSF//W/uTUb+YSM+QvshCmuNnCTlzYR6fnXbF
 c6oCiefOrand1HHwL5bMFGNGK0uUSVRJPiaBwhx2qlq58ko6oRcKCpGNZho7vAwvv4Vb
 SaGFYGHMxbRcKMLDtYoPOQZFtmhkYWPd+nlPCEPqVIPgmaBKbMQtZMw7lvgpPESO4Uuq
 MEdqvCJWCSSa4iEHk8/8HPQOwTfAsPpt3SuCQ67xPZQw2vT0gnarg9OyLu3kqMh9Ht48
 n9vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoMmHrNdUY3TYygqZDhE1yAh4pN8bhzDvToxW4UwKX/Dek2tIKvwS8TC6YEFujoBYFz7GZmXfyzFQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHHgR0ckneMYZ/mpxtZq4c9rTAfPgPYCao9/VcSf4/eHULN3/4
 4bgIWA1IuxKJJLq6tUxNUvSOIKtMOIx0lQZnPrf6HzIzrqPueDnePulwPCsE3a1YKXJ8y2cYrdF
 Uq4JFK7+KM54IEx+VXH4nCro8krvSCNCGOYnkqMtZFWE0hTZK1tHnxPvMumHstnvbvae86Ho=
X-Gm-Gg: AY/fxX5yi0XfLr3rgM4PXF4bvlMthpZtyCu0MDFsAVZsCXTcbbZx1UKuj6SeY9sgb6/
 C1cmoSZSxmBvHv6ldOg6sRe5TfLvd4zPONEwWgvBuBSxGU23YJDcQS0g5bBIR1cvG07IanduALo
 EgMeOEatctSfU+XbjeSapCxgQgw8Cg6QK2Nvwa3e4/8cd3E3glajJRBbTTDjFgoq6Ab3A96Iwll
 OcshpVHsRPA7SCd8LkBRtsACKYU9i72cDIqCjq35/CEqNMNptgLmdKD594ZKdWDldykBp2dreCY
 psJ7nF7TQ8vlBrmJ8J5FOueRTXg3eDvmaB2IuuJknkxOdBMnj6E7utPSytarfMX6VNcxMjtlWXm
 d3mq6w52BctyN3vLP8p67XsQ2VyT8qwJScI2WHxw0o1kwXdZJIXHQK96B542+m9TvtIRnqArxGv
 bzYWqaojG8ECW4QMp9lX7E5TU=
X-Received: by 2002:ad4:5aaa:0:b0:880:57b3:cd04 with SMTP id
 6a1803df08f44-88d81668f4fmr311316736d6.1.1766615348582; 
 Wed, 24 Dec 2025 14:29:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ/U+oO/Wi5GUJsyhcFlaDH6iMTsM1T7URvZxN8P3ucroQ5KwYbZNXw/6bola6LCgTDOv+4A==
X-Received: by 2002:ad4:5aaa:0:b0:880:57b3:cd04 with SMTP id
 6a1803df08f44-88d81668f4fmr311316426d6.1.1766615348127; 
 Wed, 24 Dec 2025 14:29:08 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185dd90esm5381856e87.31.2025.12.24.14.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 14:29:07 -0800 (PST)
Date: Thu, 25 Dec 2025 00:29:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, mripard@kernel.org, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v8 2/2] MAINTAINERS: Add entry for Innosilicon hdmi
 bridge library
Message-ID: <qvyyiys4vxf7bosauha3lov7uttzwdzehf2kwsu32xxzwyn3cy@jhkdjc2cvwcn>
References: <20251016083843.76675-1-andyshrk@163.com>
 <20251016083843.76675-3-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016083843.76675-3-andyshrk@163.com>
X-Proofpoint-ORIG-GUID: 76uZfAKejn8Qulgppzt9CU7lzMf9p-wH
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694c6935 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=7XDKy0GsjqpdM7yUEs8A:9 a=CjuIK1q_8ugA:10
 a=0lgtpPvCYYIA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: 76uZfAKejn8Qulgppzt9CU7lzMf9p-wH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDIwMiBTYWx0ZWRfX2CrbYX0/X09J
 SM0kMQJYsOl+ulN2BHOcr9qPgSEezqeTG+S8lpmyZg5ISMJFqFD5NRLltwAywGH7QI4r5e8Aje6
 qb4nVv00BaaV06mvPVWArbhFk2JyGrqn+Gd2IAZpFX/LsZAzw2AZhgpwIyowtn8TIzkltv7lnJm
 N9kVROvAMkT4CA3wupOmy+5myoQPe+P4LEsLV5IndA80D8h1kOuNgSdlEWF1uNJfZGH7TBCsPVT
 TOzt2NOVE5LNl02kpQzQSruFs69P58NgYxKlro73I0ncyDmxdylzWtae886HVZ/0jeES5k+vBhL
 Q5PmvjrCe4M1FgrcvIWDPm75pP+7ryBCaqkZHHAtQg+BWV9rvDfMadcDy34tfJuexcC1WNGA5F7
 zUNulsHWe/4LxjRXlSmawtx05N2dFsqUZ9elHjuzf8J6caXB4KOXart0w4YOSBJJDPxYOc8USyp
 NyLAaMfG4L8XcARcS3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240202
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

On Thu, Oct 16, 2025 at 04:38:32PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add entry for Innosilicon hdmi bridge library
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
> (no changes since v1)
> 
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
