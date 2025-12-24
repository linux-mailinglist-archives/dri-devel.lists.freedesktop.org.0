Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03CFCDD1DE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 23:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA2611313F;
	Wed, 24 Dec 2025 22:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAW8iMZh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CV/YqZji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C5511313F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:32:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BOL0Hgg049827
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L0jPL7mGfIp00qPtZgEa30xxEWpNpT/MXZqO5NVIGKE=; b=PAW8iMZhAX/qVe6S
 UZgFEPbjtgKTrQorh+dhGw1pFjpabn/8S4IKfwAtLujfsLqTSAyiUrHtn5j8+VqM
 LtNq0BBIiBQGDej1WXSlw5O8oydvzuIpQnB+xZ6GUT4E1ZvXjMgddjQ5+IEJ7xGr
 us1fhP3HqW1WsME56PdNBM9i4mENErpHJqSLoi4I3JW6FN1pWFsnA5SsynOi9++p
 KnwCNVLn0Isv4Ozv4uEtlJitSTxSzIzW4BqsmE+iNRzvS/t6DLLwDEqGBIXi1CnT
 Ax6TNsiXP2QkVLdVSVWitkF9AEPeZloze+rTXspo9Alb+xymMxTubvBfN4G3WCmg
 Ytt/3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v3esv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 22:32:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f1d2aa793fso161532551cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766615548; x=1767220348;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0jPL7mGfIp00qPtZgEa30xxEWpNpT/MXZqO5NVIGKE=;
 b=CV/YqZjiC+4wx6dngEWKr//jOb+wFu68bDrfF3/vr3ksV1ldGuWU+V32S0H/XrskKf
 S3tU9MuLmwefCYDGp2yX5VjsiAZFvVeQekNjSTp7A6c7pXsQiB94R/7MCAic56gC39N3
 yjec8LjPt+UIENWgT5+mvZTfRiEyDslePKlSpaxpu0LjNoz1WwfV8x76kCiqHw+R3Kl3
 wG38O87ouQwfR4EXoM7uFCvL/XuJ589S9ORir7TxOJEa+nKHJLSVTP2DhnMIgljOzPxW
 NP/GPk+gupDmE9smBh71Wcv3NBSGYbP5BuL5KwvZMYovV2zccTQA3h/ca6EJvrED0TEi
 5Kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766615548; x=1767220348;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L0jPL7mGfIp00qPtZgEa30xxEWpNpT/MXZqO5NVIGKE=;
 b=iX5nkg6pM6gx5x8ro/CDihAyEGXYU6X5T7fRZBzi9UN/HXUU7DWzQ1uDE7XQG7Bz2x
 QufP2YA1Wqq3AlqK9t9kukyypEOYuJks2oo5omUD3oJp6eN3lrhl+4vGRpm3xanSML69
 wnbwlaDfR7J+CIRjWzJmozHzBiXzHL3szLEbeLsRkIbmOmYXF3a0siI7/oypSD06D/5J
 CAW6h0KmdPBgNwdC6GWi52cAXCb1U5ryTzDjguNvWKJWlL+Q+OWrrOC/5IjGhuym42Nc
 1qCuwRqPce5LxtsZrjRf1mlPmce2uZNB8GLOT4fdsQO3tDez0o6UiJrK9qDz5k5HYoTT
 /K2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQp/3r8mNsTQw6RklK/Jhk6u3sv5yKcGSorvlFXcmBz+nTdlVmefaxjcA0udPlxg2tCXpXHFSajrs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz57bDhMBpU14hLg1mZcUcDmfkR7fkKPQWHPQhTPNLn5gV9rU59
 nk98vNuTZWsfB7bKJsg3m9VTY3n0A5cxlWNov6OhSyeG12qujzv1vAnZum7ds3XKKvSNB2CVvZG
 YU+JfBDTMhgCee7UEFNvAU9wZzAW/IXTXYhnzJy0pIEmF7piGTkOZeeNrdyls/JIaaJV3cr0=
X-Gm-Gg: AY/fxX6gLKJ6KUKgkxO00bEC2i/lXZZvxhbO8zSPXTtdV4EebR480XhoDfa1kF7Grxp
 sfPH8nrUuNXjzN8dD/+BgD/6cTWu2YBAEe43KY6pliedG6umZlF5cG1jltdxaxiVQQa45Xy2hvs
 QckCJ6TmtwKdxxp9zl68ZXi91fX+kzTd3i0Lp2PI/vlIJn9QgvCy1DiPc6SZGDYXtHS9iY3Ara7
 thsgqJzCOE0AUVwxVLIf1XaasaZLmGsVrMxM+laqScmhM7KLd/J5lRv2ISmDIHGLEiXeT97jask
 W50os65HlWUXtHkDg8CQhWUujrbm7zHh1arC740313C4hBXbWeHso0rL61KbnNZrsFyv2hQkf+v
 H/5Mhy0cQkqF4esnJ4/UqJGZyJ8G0ScBYIll/XiFshps+FzVDX2DeljGkDjC8gWcaADPuD9smkp
 ahJK9NIdj8Gv6I7vz/ooACtt0=
X-Received: by 2002:a05:622a:1b92:b0:4ec:eecf:66fc with SMTP id
 d75a77b69052e-4f4abd799ccmr273103971cf.51.1766615547906; 
 Wed, 24 Dec 2025 14:32:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG19rNmv0We3MFkyk6sQSUrSfINXHL2KxbCfoVrSCCgav+j8dPUIqzPwOReGX6y0l9q4HhyGA==
X-Received: by 2002:a05:622a:1b92:b0:4ec:eecf:66fc with SMTP id
 d75a77b69052e-4f4abd799ccmr273103711cf.51.1766615547520; 
 Wed, 24 Dec 2025 14:32:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38122693ad3sm42746951fa.49.2025.12.24.14.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 14:32:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: heiko@sntech.de, Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org, andrzej.hajda@intel.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20251016083843.76675-1-andyshrk@163.com>
References: <20251016083843.76675-1-andyshrk@163.com>
Subject: Re: [PATCH v8 0/2] Convert inno hdmi to drm bridge
Message-Id: <176661554529.2411515.14933651749352627609.b4-ty@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 00:32:25 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDIwMyBTYWx0ZWRfX4tnpbxUuUOZK
 WgFYLKnBdMPMBV/vVkZlcko92IrbTOWZMA0Jeo+6wIDe9dgJm1Wk2L2lJdOEkvVZYIu+cajnmrv
 xiuhkA81bt3V99IYNDpDm8yaOa0QuVoPcayrukHG5fK5bTR0cNBV8foQbH0qOZzP2/XGnRoygK7
 0ess6+RY0yoPPWcXghRSzYFyW5hHGm7qLqg1Q/feliPd7IPYgtQf/MdA1B2c21Kbj49nySdg40U
 ZtzOkMvTW91cJzYDTSIlxvO6gfUDISJ7K4tOaL7NTmJrZGRjcBYzgaO20+A9Fs6StneHaoigAGw
 IXy5SLQe1AiET+v1JwiolwD+JeEquAxxmWhHMtpUJduPmEfW32tW/xGzhSd1e+iARwz9cWtKWMi
 VZk7wpbpJFYWtWFU5i3SRj9j9uOZ4vYOSby+9e9WS/iBp0xL8aXz6fR+xgH6UndAQGy+/YFlJG8
 7QwlrSByZzP7hLH6Cxg==
X-Proofpoint-ORIG-GUID: jf8xUbv2LwS1oDVQs_8wDDb3sYGQ4Ym_
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694c69fd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=nruGSBBzdhYNc4dVb74A:9 a=QEXdDO2ut3YA:10
 a=0lgtpPvCYYIA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: jf8xUbv2LwS1oDVQs_8wDDb3sYGQ4Ym_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240203
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

On Thu, 16 Oct 2025 16:38:30 +0800, Andy Yan wrote:
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Patches that have already been merged in drm-misc-next are dropped.
> 
> 
> Changes in v8:
> - Rebase on latest drm-misc-next tag: drm-misc-fixes-2025-10-09
> - Link to v7: https://lore.kernel.org/linux-rockchip/20250903110825.776807-1-andyshrk@163.com/
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
      commit: 969325a2597ebc4cb001a92992f06f698ab2b467
[2/2] MAINTAINERS: Add entry for Innosilicon hdmi bridge library
      commit: 130343ee6bca9895c47d314467db7dd3dcc8bc35

Best regards,
-- 
With best wishes
Dmitry


