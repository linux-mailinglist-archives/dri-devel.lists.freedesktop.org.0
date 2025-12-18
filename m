Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB96CCC6A1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 16:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954FE10E14C;
	Thu, 18 Dec 2025 15:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="foqYbrwT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tty5C82Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B97210E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 15:13:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BI97htQ4147950
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 15:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Tvv94wmxGZ6BaRJhmeiSaOdx6w4/7tIGJR+
 Ue4iFFAg=; b=foqYbrwTYlHzh4plXaeYG4hdxkc3EoBNHrNzajPDbQLH2JX07EA
 JidbJXhlTljJGtzEsUh2Qrkt4VZcy//JTMCZM/OHB1Eaiiw27abLoYKfFGyFVB/w
 BficSluC4QNdwGwLlGIILPV+YjUY8vcpCsS7g2F/t4UqTU/9QV8e7S6P6bfCbHW7
 7k4OxrnJ0iP/CnhO6E+5Tz0GLIkaXuT4XAjkh9KlRZHiOUBh2v0wXy+qK7AyflsZ
 Z/HMlhY8bJHr5fqd9fBx6QvwHng+96Sr40c+mGWBS41lPccG3sTq9I0AeqVq8W7B
 TBnBpo2StXJrZylQ44oRlb58gJm4KI5qdQw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u7bm4e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 15:13:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-5dbcd452924so250788137.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 07:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766070793; x=1766675593;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tvv94wmxGZ6BaRJhmeiSaOdx6w4/7tIGJR+Ue4iFFAg=;
 b=Tty5C82QOuZd2M8EWnUwdzNyoEyp+ZG29Ca/09VeLMB+0oh7nGcKZanCE5SZyc1X/x
 dLC40tavDljm2WWjn6l5Zvwo30v7RwfXk/H8PkXC89SnyoQYiQINeCVQyXS8OXTClowo
 l8ZjnFVnaz4lsNYUlAwM/k3H97Qy1Q7kmasCV1QZMVUMErV7EdRnSKvHhF/lH0Ptwgwt
 snx7BPeewDt9TR5um7jOERreT7Of20rfUKWQvxiihRuVc26j+ySO8raAe8glNmmS/kZK
 KTMYeG7oD1nTYl2p54644eTgXDHBNVnN2QEayg17u4ofJbDokSQhyjMjh0nPUyAPZczh
 Zyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766070793; x=1766675593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tvv94wmxGZ6BaRJhmeiSaOdx6w4/7tIGJR+Ue4iFFAg=;
 b=tDU1us1hexDPZXAKC73rTgQO4fqMFr/kwTrubUdeZOVFyoAzosOvXWcNDB6+bULZtH
 AE1uNdEc862H+tWNYX7nC9pF2Z2IrjQ5AgCQEKZLeEoQEWfSHuhWXdXrPJJHS8onEII5
 SoIaRLgZrULWYq1qmKSxWKpsSSz3V7a9z0ln4/EoI6t0sp/lGudNDjpMb1pZ1LSLaEHC
 ck0w3x18RzjxWmrT0CQDz7NSAL9J8EWpvP0831gDvKvp1ckJ6EpM8149uX42jLjJYxc/
 V/IJkme5brgK+PqMrv8Nevt7fTW4ctWaT2uXcZH54JOTN4G8Nf2NfKNt/LSlLnSOQnxI
 IKnw==
X-Gm-Message-State: AOJu0YyPPUcC1vKQAlUCiX9fIixzZ8Jw6q3QV/gRRXaunU8Oo+NwmoVV
 JT8EpvZJQ0KSd5EliKiRGJVTEyC5xh4zxZzjc/YjswfZU71z7GXXnUtrxvxL/WunDP/jWLFRqs/
 hemIcmpDlQepkj3CChd0QjUK1pzdfB6aBPnxcgAlFnYIU8BwuZRydvlF5W8aPBHxBtG5C5zw=
X-Gm-Gg: AY/fxX5vfV8dkaaDFFJV/jjH2HjM6c/hQA11gV4XK76/rzeC9cNrHPLD68ceMqpQQIB
 SNJng8p7Z/9VXJXzCRjRiBLHsdXVv/zKcbbvUs/c0IFZnRaHYF+HFGiWh89Y9v8BIYT3RXH6Kgo
 +XZfYI7iqNyLP8aMw0FGSjN/AIxinvty2zXXa6nCaxRi0oJVrqBODTMaHYU7zAUxsQQbEThKF8v
 pXpEijYoQxlhHnntMfZUboxSlc2hszF2snBqSECNyTpGNnc3E3pAc8NBqmwpVyDEuUhKYKLXeR8
 ZMxmINVwKZGJVuOqmGAYnSrR6baczK4kNMFTdkvTnFDfJPogKMrQWvPnN+fyTQ5U35OAETluvl4
 8KocGKUmUjWvu6BN+wtTGOFD8qPLGS0rcLHVaDPwkLg8X5Q0qbvbidcG1faG1BDGeBqEFpdYWoG
 C7
X-Received: by 2002:a05:6102:1483:b0:5db:cc92:26e7 with SMTP id
 ada2fe7eead31-5e82783b31amr6951230137.38.1766070792717; 
 Thu, 18 Dec 2025 07:13:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRSsh6e+ChL7l8kjCAE2nEWUIJHPq+NAPLdzVc+L56dbbI6DlUZSHZ7PLzLNZlx14aJHKynA==
X-Received: by 2002:a05:6102:1483:b0:5db:cc92:26e7 with SMTP id
 ada2fe7eead31-5e82783b31amr6951214137.38.1766070792284; 
 Thu, 18 Dec 2025 07:13:12 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com
 ([2a01:e0a:82c:5f0:20ef:32c1:1968:bfa0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43244940120sm5734331f8f.16.2025.12.18.07.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 07:13:11 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: dri-devel@lists.freedesktop.org, jonas@kwiboo.se, lumag@kernel.org,
 Laurent.pinchart@ideasonboard.com, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xji@analogixsemi.com, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 stable@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND] drm/bridge: anx7625: Fix invalid EDID size
Date: Thu, 18 Dec 2025 16:13:07 +0100
Message-Id: <20251218151307.95491-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yBjphaVXhQgf1PSGc5Q3TNIdt_VbitrP
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=69441a09 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cFB0qvqQ7TBn072qZJoA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: yBjphaVXhQgf1PSGc5Q3TNIdt_VbitrP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyNiBTYWx0ZWRfX6hb4F/h87OdL
 m85MV926ehGIXwiIXBknEBIEBUgEc4mRvFt74Z9X7YWyHhsZBVuXsCHqFHe5F+IxQP6Q9Hte2+L
 THjB7DSAKrodfVfquUBiO9mb4R8+BzmujN3aHA1ocDc0cIEXgklcCMZEQ1ePf8F+pZRJKEZDk0q
 3E/R2vo4iW1nUNZ4cKju147gKHH/B2lE208sqdqY28fLvsJRLFvfmcJ5c/cU8p0X342CioH3K8f
 a3mWRWJ5fwvMSd59tcWnamUfi946PW/ekQCpVROjGqAtRC736Lw/2fTMbd+UiWGYlkWbkhNz2h9
 Qh/gvXIBSej+IVsiyNIdYxfVjSw4Iqcrvl91GsRXpwvBYsKZ5F2dWKx2eJRZ8z1YCO+KB27ffxX
 lRhWZI/3LdE/aGDcs2IMphkdyOxntw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180126
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

DRM checks EDID block count against allocated size in drm_edid_valid
function. We have to allocate the right EDID size instead of the max
size to prevent the EDID to be reported as invalid.

Cc: stable@kernel.org
Fixes: 7c585f9a71aa ("drm/bridge: anx7625: use struct drm_edid more")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6f3fdcb6afdb..4e49e4f28d55 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1801,7 +1801,7 @@ static const struct drm_edid *anx7625_edid_read(struct anx7625_data *ctx)
 		return NULL;
 	}
 
-	ctx->cached_drm_edid = drm_edid_alloc(edid_buf, FOUR_BLOCK_SIZE);
+	ctx->cached_drm_edid = drm_edid_alloc(edid_buf, edid_num * ONE_BLOCK_SIZE);
 	kfree(edid_buf);
 
 out:
-- 
2.34.1

