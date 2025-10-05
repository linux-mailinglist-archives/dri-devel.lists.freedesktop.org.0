Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2565BBCDBA
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 01:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C84A10E2C7;
	Sun,  5 Oct 2025 23:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="grCnBlXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D4110E2C7
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 23:08:24 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Lpsj8017997
 for <dri-devel@lists.freedesktop.org>; Sun, 5 Oct 2025 23:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zlApvwg/fcACgNbb2Fz0N2Ld
 p2XyEFilO0F90mEZD/U=; b=grCnBlXKBCQKIfzKto/4qdNVaA/lLy/DcBU20hXk
 aT2Be+NGFcPOQBtRipP82bnngTS8ByYojuftIdtXu+ieQwCpR0x9Zkc+nrljFsIQ
 0YQ7kJRZjVf1j3wHqNcnIqeBcQnXvUNJBEokvPdSOdZShZMj5VBJCilB5jLd45MA
 HOHng9rJPhb7/Q89I2iF8G0hoTwaETdrS300slTO6JTWVgXrPPTC4bA5kht7+uep
 lXdjlwAWXYd6s4cJvOp0xt7VtO4vGaOGIa54g6mh0x9dk6d+doIfSjBOzfjkknHH
 i7j6gUQm/7Ykd93kD77jYHCbcof/qQSrHcuzOkJ2jh9BwA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6tpkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 23:08:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d9ec6e592bso79815181cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Oct 2025 16:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759705702; x=1760310502;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zlApvwg/fcACgNbb2Fz0N2Ldp2XyEFilO0F90mEZD/U=;
 b=ocLEst8cZ/8CirCF4MqfBcvpUqWPbt74dGmhG8dASRqUao3doRgZ5GtjlhvhjJuyec
 RbiGflb0pnXMoNDyBg/V12gKtvGv+WJ+arXvqrOCnzDQC+9+hfn14TJ0Lmdo7mZcgEv+
 04JTAXXqon2NM7AJl6MN7H4IPBmOk3v9LHuEJUUyl45Kk1a4LsZ6RUnauJ8ZB0vRBNEk
 /1a+eeTm/8yHzY4SjzejuuTdgc5mDjh+LS4XlA+9FQGgtgLMfTzjsQUYD9GG0jOvraMI
 LTXb6BiyA0+xFWD/TUo//dqb28hbO6iYHl4ZktHjo9FMJSZdv4nZwcOyivB2lFqP7CaB
 RYHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsmJzEOnCa9BIT0lE6PX+li54VLm2SFTS+nptqiRt1PGiYnA2c2VVRcLOHIYjwO0lSfa85MsWmT9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7XwFjvH4XhuQskna7Pq/YAzE/vDC0Sce9uAoKWrM+iCbOsDgR
 8hVN0mBFdbXpnh1+ZYzgfsw1pSaPJ3OmujJysq7/ieacrPLyw8KvnNGlnhvLAQT0aR4fpbEPw/J
 OYmfXxLtmmf303EvKUGVKFTgSOHmviBo+ZDz3A9mXF8naLNjGOVXRyWyga7jN3Uo0j90+ups=
X-Gm-Gg: ASbGnctGCyElcKq7RF4/zTQ6ER716Eb2LxvtBP+xk/FLBmRtRM4P2WjvK7dSYy8qsKB
 jhTXGqzxUkNu9+cpn8jr8tX/BA8wpDc8tDP3vj13Sr+voj2FAflUhvjT5MU1s9uuP+JWn5c4gss
 Vkl9mzH+ygFIyyPb037UNqT6mFtBgkYMcrL/aUMVCm7Ry6aqEWBKjaQ1jqHWc53BefLkzT7oRN0
 ZZpC+fppy0SuqUKpcWo2SU9Va2EHkZG2RSAQ1SGCNOjPod40CwAnggl984STvQH9/IZKRBPgNsX
 wf0lOpnIx0qIIHjT1g/gKvpAC7tP2qiK855h3aBJSCgr4GGe9Gc/Vnx10dbfLloFaOOGYsjaNBV
 nciMHXvMRYiI2f7xS17MqUof2xlChbj9q3z5EnyJv4GFT9YMQGCeYdQ4pmw==
X-Received: by 2002:a05:622a:59c6:b0:4d6:281a:fe41 with SMTP id
 d75a77b69052e-4e576adb491mr134885571cf.46.1759705702358; 
 Sun, 05 Oct 2025 16:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+6mOZKi+noEiA58aDqmkxFwHw9Tde5U+qx7nYhM9i1S3nYcgOiYN/Ve5cxBmXytJyIFxVdg==
X-Received: by 2002:a05:622a:59c6:b0:4d6:281a:fe41 with SMTP id
 d75a77b69052e-4e576adb491mr134885311cf.46.1759705701871; 
 Sun, 05 Oct 2025 16:08:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0119e966sm4402542e87.100.2025.10.05.16.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 16:08:19 -0700 (PDT)
Date: Mon, 6 Oct 2025 02:08:16 +0300
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
Subject: Re: [PATCH v7 2/6] drm/bridge: cadence: cdns-mhdp8546*: Change
 drm_connector from structure to pointer
Message-ID: <ae3snoap64r252sbqhsshsadxfmlqdfn6b4o5fgfcmxppglkqf@2lsstfsghzwb>
References: <20250929083936.1575685-1-h-shenoy@ti.com>
 <20250929083936.1575685-3-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929083936.1575685-3-h-shenoy@ti.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX+H4+Z5yXSrC7
 d3jdgiZ+AeG+Rb2Q5Vkx2CYN3BMkbdVh49qiZJ252HCayWS1J6WVijsc+E4sFfmVrn0vfaLkMD4
 uMlhRzsgbxjLml4x3GDTNRp2KY8b09+qkeTkGr9Qvk9JKFbGYBM/GVm9MZk9dxM8IPj+9VP5Aw8
 QjGYFbrF1198DA3kHriRuOld2e+Sb3QOjiKaKAU/GVL/gefRcn8hkIme8lENFU4brI26LUCOEM/
 IwBTQsKCKBTwqeC2RkIwVx8yr4bGHhh/9Wz6DyB8vguSyxpY96MerBV7NZ2oMtf+j6v59ZOudHm
 +abcVupMvV1tclMOGK8tZbEEcmLdBqgDm4kAAXBSipXndCKWJFlGvOugZwtaFW/Z9n9CwWZOovy
 3VG/4th4XKD1aDb04XzY6CLraPqY6Q==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e2fa67 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=sozttTNsAAAA:8 a=EUspDBNiAAAA:8 a=J4nYnVWQyAtGn7mbgFcA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: tnQSZBlIdnyq1VjWGhg8AL_6TdimUywg
X-Proofpoint-ORIG-GUID: tnQSZBlIdnyq1VjWGhg8AL_6TdimUywg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_08,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017
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

On Mon, Sep 29, 2025 at 02:09:32PM +0530, Harikrishna Shenoy wrote:
> From: Jayesh Choudhary <j-choudhary@ti.com>
> 
> After adding DBANC framework, mhdp->connector is not initialised during
> bridge_attach(). The connector is however required in few driver calls
> like cdns_mhdp_hdcp_enable() and cdns_mhdp_modeset_retry_fn().
> Now that we have dropped the legacy code which became redundant
> with introduction of DBNAC usecase in driver, we can cleanly switch
> to drm_connector pointer instead of structure.
> 
> Set it in bridge_enable() and clear it in bridge_disable(),
> and make appropriate changes.
> 
> This allows us to dynamically set the reference in bridge_enable() when
> the connector becomes available and clear it in bridge_disable().
> This change is necessary to properly integrate with the DBANC framework
> while maintaining all connector-dependent functionality in the driver.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 12 ++++++------
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h |  2 +-
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c |  8 ++++----
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
