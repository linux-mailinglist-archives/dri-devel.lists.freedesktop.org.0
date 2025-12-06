Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DA3CAA084
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 05:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3E010E03D;
	Sat,  6 Dec 2025 04:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlWnlHXh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHkYEsJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA4810E03D
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 04:21:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B63spJE2076005
 for <dri-devel@lists.freedesktop.org>; Sat, 6 Dec 2025 04:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MIl6XBPonHXUnHVSJ8TMiVi2
 oVgOFanoHbye0ig0/PU=; b=MlWnlHXha51f6CYYMYyBjEJ4fzL9OfWoWS7IjfId
 stpyBdAZJTADRk71ICd/gY6r4Jl1TwFOPENsPws2o7sxAl9TpKF68CRueG/S8zgD
 5uPYyt65+E0WpsqFQsFLsYVED8K8MtTFb4kcxYiE0vWQCMVEgpr2UFsi4taMQ4Vk
 OlDNxBsh6H8TuQrkXiAeb6joIcw7sFQKNJM4Y6SnyN2Vh8aXpKMFJCkuh/+C4ci9
 RZNvYooNqaQdHO00/EftfnhDy495TWW0/4GVZYBCReHebRFH5h/drP6YDxqgQnKg
 Td/iWmBrKqkOo5vJdwTwaAllM0DvqSFIG1G0+HB8FYGXNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcq30245-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Dec 2025 04:21:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b55a033a2aso724124485a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 20:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764994909; x=1765599709;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MIl6XBPonHXUnHVSJ8TMiVi2oVgOFanoHbye0ig0/PU=;
 b=cHkYEsJAS9TNRJrBBe/uq6zxUGtHlDAZCYXHeyKoQXdofFLnNuQDDAmkTNtStnCq39
 uyHAH26R4eib/VF+WK3igx9VpM1DVw6Hnrm/uYj/9rEdd7qlxP6Rads6tQVLLTV7/yad
 6vPgdpzEmQZtJnjQcD5dUdWDG5iEOdASeU6LuxaqY2fKalsWXoGNsu+VmUrVBS+AV9t8
 wTtVN0+Ri3SzSZ4ioZKx9L5YOatQyVLRXLhiMp03I+naxBKOU5ow4wup2telRLkuPe/y
 6Klfpk2WVVXSOhBwimj6pAlG6aQpOnHCMLGzvsL+JbZ7Xhul1jaDYj2erjpPMK0Nxktb
 RJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764994909; x=1765599709;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MIl6XBPonHXUnHVSJ8TMiVi2oVgOFanoHbye0ig0/PU=;
 b=YuSGf0mYmuBJHGSYBK++jDBfL0sr2yt9f5C489MMTtmRxkyFIt1vwV2vBITvHQs110
 rod1AykqxFIwlKCu+9pQfCEs6yZNtBLlRHHf3AdgzCA49Q2tNtpXqnj3mxWQLchQuigm
 K3Fc2lskETZx2QPGBppOY2l4TomAYHHZSfAeNiOxrVYZ2RdWvALIRl59gHpT9Ua+/sQy
 ZKmOWijIPy6ckzGYKsAIcm7yZMoYFEXngyXgmhc1+Lg9VKQyRZtaM4hNNX78fHmPs8LQ
 zPK0YAfGCiduKmXoInqNcJULL5wk1e6ImBKl4mxP/2Plo/crS4m4H9EW8dbO6w0XU9xc
 mpzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHs9vzXJHmTI3pgUlRmTdMomOB27cC0oRhP+sBzTXSieQJP1UzwFb9LJSOvQwS+AMsc+86Wf8QfPQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNlOljrQYD+hzl+88C246g+w0MpoW4MNu5nJ0a2Sctrn2Wvzcv
 arfr65XvSkkRsGc517oimv1u2ln1y4egJQht3ghoTzzCNdzbRn9jHHqKIWX/IiUpEipAcynCrB2
 I5M8JYrYMJ1jYEmahLnjBsz5YkWub8YXSdjfF540zx7nKeIqcrIH08rnR7vy1rFoA6ver3O8=
X-Gm-Gg: ASbGnct7Sxup3M79dceP9HQuLQMLFR26unkwSZXVhZSSiH7rdJHoQMolQvnNDX8EChh
 xvUnUOUOUm0aJBzNB6sk9GMj/wTCK8yvK/7/UROOq4lU6ZqrR7tctvuXOyrfKyksijDlopGBusX
 mghnkRJ0Ig7g3O62U0/PJLvGC2Id7EiWsiynsDErwbSvMRYF/lLLHnrz3jjm4rohSKU8GsbhAks
 XTRzm+s6BjX3ACKSZXVKDi5WJV9sY4XCH/kBpSwQca9uKj/j1jLS6OXQfgJbWGV6XUKm45bWDAe
 wxAGs0xCsvbwp64Vgrmq+qnNOkdMmEKhnixZpoaIuyI/308cm5ppOxpKD9uF2G9eMQy91CRWby6
 l/BYCct7Prt1Foj+7S57xTrYJMUvEXy4DK3ZEXuYmleEhnhYDEsaUF2hfeBVhqFg5bOG+J2Mr0r
 PwqxObh+mTwlpZlbBl+VJMpfE=
X-Received: by 2002:a05:620a:4403:b0:828:faae:b444 with SMTP id
 af79cd13be357-8b6159b7a2dmr1285812285a.20.1764994909517; 
 Fri, 05 Dec 2025 20:21:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELa5NmXVgr9Zv6oxMywPl1XxvP1p4dQoPyF1U0OXkr1ix7ky2OcNXwph+K27pGJXPWF5P6yQ==
X-Received: by 2002:a05:620a:4403:b0:828:faae:b444 with SMTP id
 af79cd13be357-8b6159b7a2dmr1285810085a.20.1764994909061; 
 Fri, 05 Dec 2025 20:21:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7b1a7dbsm2064122e87.20.2025.12.05.20.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 20:21:47 -0800 (PST)
Date: Sat, 6 Dec 2025 06:21:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
Message-ID: <3272g7zalfqdyobcic33edhiqsj72redn7yl46s72giv45adin@ggvhorkee7yy>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
 <20251125-pixel-3-v4-3-3b706f8dcc96@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-pixel-3-v4-3-3b706f8dcc96@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAzMiBTYWx0ZWRfXyXEhC+N+9eGy
 rkYRDAsiGh5adUPDgaQncpAieqsr1VNs7YzbzIL7E4v4ztCvUJ7VBPnAjhiJH3VZXl5zv54nQE2
 Ml3uZJtPm24o9KArSJmD/WHcM4cNzkTW4m8KCOuHnrWR57PdaqS34LqqxeQbpkx3vUTWTqSVVva
 knTQgt9V74IsL58wco2FTTi0GqT4k3jCxhWTnRguxViY3LyL5TtW6pagxrpACS/x6O0mYnlqLoT
 JRpqcM85bTa7f1JXNpL3cZaeL25gJ+farFyy+vEte/aiedJLFTfbBQZbV2uoOSDJ+oRBowCySmO
 sMfb4KmmEzKAZFNlOXUgq07SJ7tdj46x3YeK0bAXmptcR5UPe3AV7R9u4q2mwNSEKJa00VSwrso
 Q7B6/aJGJAJOisFa8L5j48NljPwOlg==
X-Authority-Analysis: v=2.4 cv=as+/yCZV c=1 sm=1 tr=0 ts=6933af5e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PQw9IP25ZL8ef7FIWD8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: YIT5wHmwJYzZnJ0SwtSyUXZP1mfX8VeG
X-Proofpoint-GUID: YIT5wHmwJYzZnJ0SwtSyUXZP1mfX8VeG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060032
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

On Tue, Nov 25, 2025 at 09:29:38PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The supported panel is LH546WF1-ED01, add compatible and adjust the
> struct name to reflect that.
> 
> The standalone compatible lg,sw43408 will continue to work, even thou
> there are no users yet.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
