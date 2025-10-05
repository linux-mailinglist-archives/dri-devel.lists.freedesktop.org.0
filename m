Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31487BBCDC0
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 01:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D84810E2C8;
	Sun,  5 Oct 2025 23:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvC5j7I4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894B510E2C8
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 23:12:27 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595LGeX6020172
 for <dri-devel@lists.freedesktop.org>; Sun, 5 Oct 2025 23:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HHz1XHRoPTjYuq1eGLoVmJz+
 8qY4LFrDTanivRV6fFo=; b=hvC5j7I4Y3cfgL2cAabLQxLD6LV8G+NnR546DdL1
 gulUx+Z/m+83VrNRoFhJEHHjS2FjBpJ7GaF/6wJdmj/aNIUokBAmxVGDYFdYFa+9
 VuLYzCe/n1Q3/4nQH63M9lWX6TQkJxRw7KZhUbFKwqWff8zXcGU+7IqN1tzt0avV
 1peo6TVLJnkrJD7li+sM/Xjb6/3ZTVkGbMahytdnmBn1svTWxQL9AoSaFUSSfqrp
 6WTuKMXfwZLyyxhAFvnFc1lKxeBb2W4PBSrAzmEjak1Z9nLgufmrJWTPRAVY6oet
 V4HRyiS/M3G2VkhOAjDvQx1WvFAU6F6ODKa0ABJEdcuzdQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dtssu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 23:12:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d7f90350f3so93853441cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 16:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759705946; x=1760310746;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHz1XHRoPTjYuq1eGLoVmJz+8qY4LFrDTanivRV6fFo=;
 b=xB0FORH2xd8KltGwEDF4akDjpVR9U4rmEVHjPaCS0DM1JTCpKD18Ck9X9mUOTlL8pE
 pU7vfrTpPIChU0llDokWIjGkxHTPxJvgF0VqIgV2bUhELdJT27wVDeNUSTBmy+jSx9Jb
 KiPcUzenqu0fBcFU/7HOrJFFpCplevA2QPEIF8bAbkFPpDEUnBWdmHinDCmTykDCYHrm
 2SJyfV9XeGWf+WWD7+zJE9V8Ky9kgUyi+pslhqcnDBR2iyW09XoSgyIH3G4h5WVUV2pq
 Lcle+hs1LGhgIKk9W/g4IdZPM+nEMqDwYmdt4iOIn12X5vlZ2iNf8sMnjsFjBMbJDJ/s
 CeCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEESBAZqzCDHmhi5FSMVWsbZq4cd+tX1Amjom3onUGoZVH2y6p5ycBK3586o3msn44YgSSCuKptBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybVpwt4jzd49AMyjM+EFTk/Y2ISYH0TUOnkGRsBLSSA3fV7QZ3
 uYHy3f6qyKAh4MPtwQdyNl1XpEzuc+XSWNtb649lA0LDSUHOffeJdTFfCIx/fM44J1gxUcw2pOA
 0PDBNwfaN5yG5RP5jKU+gWk55tBiPHTLUEKw5Z179SqNHIm7hj5qfgwmB+/CtPthyAJvqFLw=
X-Gm-Gg: ASbGnctX8wmk7jOctEF+ZnITju7pDTDfkfcC/pURWS162aIaTGsMHnIzJgynJiUNFu1
 +sPwNYpe6fi3g5Au5+ghTnYherK24ywmF9EQ/emKHuiR7ZU8B5nyzerKSqbrV3adz8AD+9/5ezF
 uvkR+z81YPuqWxsM/Cvcy1+HNiwGPAiPxKD8C98G9t6NWkhcmADAFv65+y1ijzHPQ2JdeL7CEBE
 w+txCiTwaAS6lt+PA5ETJt1n65kr6KkDxTIaMw49Ogy7ZO+PdRn+O2xKJf/khGemPaMH6FmedHm
 V22C3NDc3R+nj2kiYZVAXVAAtp5xwhOoay+23sw2Z6U8t+Y29a7KRD/+bZUp4OO+0ICayC7vIcH
 lDkXfSGo/akuxvep1d8JbgzxOC5riVQKayiMo55YV8kPdcYx6CzjWpdmqUQ==
X-Received: by 2002:a05:622a:612:b0:4b0:6a6c:c8cf with SMTP id
 d75a77b69052e-4e561bc866cmr187860201cf.15.1759705945702; 
 Sun, 05 Oct 2025 16:12:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvSrZ9fGfo4WCllM+4UshMyxEsLlwrMoEfa4edaPi+oczMnlRj/hsY1Ofr3AbckUjsmQn/OA==
X-Received: by 2002:a05:622a:612:b0:4b0:6a6c:c8cf with SMTP id
 d75a77b69052e-4e561bc866cmr187859961cf.15.1759705945225; 
 Sun, 05 Oct 2025 16:12:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b011243f0sm4414769e87.27.2025.10.05.16.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 16:12:23 -0700 (PDT)
Date: Mon, 6 Oct 2025 02:12:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 andy.yan@rock-chips.com, mordan@ispras.ru, linux@treblig.org,
 viro@zeniv.linux.org.uk, aradhya.bhatia@linux.dev, javierm@redhat.com,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, u-kumar1@ti.com,
 s-jain1@ti.com, lyude@redhat.com, luca.ceresoli@bootlin.com
Subject: Re: [PATCH v7 3/6] drm/bridge: cadence: cdns-mhdp8546-core: Set the
 mhdp connector earlier in atomic_enable()
Message-ID: <gtj43rfr2dgegutffma34w5bhvdmvx44jhwxgxb3ficqh5tm53@2iyr6ho3qfdh>
References: <20250929083936.1575685-1-h-shenoy@ti.com>
 <20250929083936.1575685-4-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929083936.1575685-4-h-shenoy@ti.com>
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e2fb5b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=sozttTNsAAAA:8 a=DjEzn2y0vucNjJZnUoQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: iT1RthuNai-OYIESwdqJD2BLaOe3jjzy
X-Proofpoint-ORIG-GUID: iT1RthuNai-OYIESwdqJD2BLaOe3jjzy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX9nTeUd4mWjyr
 3RP0zh2+3lNmDRTLp/Zi0Ftz8eYh+T7rB65vLnrZRNQzszlx1DruxZWcF6lv529NxCZguP+U2AT
 X2Nm5Nw1loI3uj5ZvK0YpDpMHeLWZWIS1Tpa6wcSGQOvLvIyc03huaUapSlmH/wept0U18WbX10
 jqy5UfXUHdu0h94o3E8abWffTCMkd9b65ORH6n9i0KTeJtKYf44dK0cbtjM5FyelHcQZuiPa6Ix
 Gx7I3E3LFPl2IuC69AtuesTw4HNOCSLDr9onDmaW5clcxswEwSwkzLRuzZXwiS5fHci6A6BypQP
 YLfjXY3qybBP9C8guuEJNaCFbS7z5zfjqFVDo0MrABKNhNbT+tCqDXBIAq7uIX0hJWMfBY/2T6o
 scBV4uDJMFPI0gRSuAfmm90z+GhUMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_08,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
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

On Mon, Sep 29, 2025 at 02:09:33PM +0530, Harikrishna Shenoy wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> In case if we get errors in cdns_mhdp_link_up() or cdns_mhdp_reg_read()
> in atomic_enable, we will go to cdns_mhdp_modeset_retry_fn() and will hit
> NULL pointer while trying to access the mutex. We need the connector to
> be set before that. Unlike in legacy !(DBANC) cases, we do not have
> connector initialised in bridge_attach(). Now that we have the connector
> pointer in mhdp bridge structure, so set the mhdp->connector in
> atomic_enable() earlier to avoid possible NULL pointer dereference
> in recovery paths like modeset_retry_fn() with the DBANC flag set.
> 
> Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")

This Fixes tag means that this patch can be attempted to be backported
back to v6.5 (even w/o cc:stable, etc). I know that it is a pain, but
please move all Fixes to the top of the series. Yes, you want to drop
non-DBANC case first and then fix everything. It doesn't look like it is
a correct approach for the sake of maintaing the -stable branches.

> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

-- 
With best wishes
Dmitry
