Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF2D106D7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 04:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D3D10E2A8;
	Mon, 12 Jan 2026 03:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kg1DY6AM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtF029l+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76BA10E2A8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:11:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BJ0RdQ2679521
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rED9lwvork3PLMQ2f9ebapLwUohNxkXpM0yGp5P1L/4=; b=kg1DY6AMxLMNu2Vk
 y86WfTV+kTzAZ1DSgxFbOALuUHuAaDpQ40+cmHkQHOGqb0hMj3d5+zQw9z/pdRtL
 +BYSri6MXHy22jt8gnvO2M5HY5oJuSS+2iWDP3AC5qqSSK5xq1EpTNsWe2cnW+I6
 J1HrVAFsTSMAJnCP2Fjtoz97FX/TSiUBotC+OO0ngbmU6rpJU14DV7h+QQYqPM2s
 wEg0SjyB2ouN8j91l3eH+j/hLEXUONvV7/lpwJglD/lCoTtaFaKRjTbtfN+Wvlw+
 u+M1usmbVBnW5e2IWtiqZzbhJYfjIw7ww7YtLq0jP0H1j4GFikX2atSfxBulR2Lo
 81WGlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57b9y2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:11:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2e41884a0so1228940385a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 19:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768187501; x=1768792301;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rED9lwvork3PLMQ2f9ebapLwUohNxkXpM0yGp5P1L/4=;
 b=EtF029l+BcMsNgqJ+rwlMAEhjt54ob+78/VxeEns7wA/8V7DWX8VbbEpv8PJwjqnRR
 enfbMAIww34T6GhB27OEdN5watsU+NHcoCD652Fr6U/SZysdBw4FEGS7rjvKfp3a1xbj
 Um1kaB+Ny5/+WW64hGBr2DmZaGMPXcXoPkdXdTjAc0L8FlLunw5Gujf8Ou6hxTMu+EA/
 2o6It3NE0tdV9VfIfF9Z57uNH96+ubut8W+NDJpUoJHMxZbnJtiasy2P++JY+OaPe7aX
 A7MXDFqlvlVI2Y0mtOVk+5AMu52FIhE3DSIq3rkVkkWWKrpRGc5ryKeZ+ETPSxTEB/b7
 H9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768187501; x=1768792301;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rED9lwvork3PLMQ2f9ebapLwUohNxkXpM0yGp5P1L/4=;
 b=ULQx+WsfAocHDj1ledQXTIl/YJ7YwvTuSAEryN+zJAgi2Rr0vc6+WcWwiFMKurth8o
 9HkPqV9Lr1eftbsEZC5EKfwyT3FAd52XEUSxesE93unvbdwcMMS7k5Yb+8czJVKTJ/zg
 OFel71p0e6Tam0bXvxAYVKWVcgk4bGl6+FgM7ASaxI4kgbBnabeWq3Kg5Gi1RUzozpf8
 eLpmWuUtEZ7VwZRg0CC4WzqJ/dm86rSA8McgwaQaR5hAxAGSf8lJ+Oz4+/tdF8AAbkmV
 Ca8KD0PaYRb3YjuhGIgSvMyaUdQe8zfTC4F68eUEUTKCDgFh271Bi+lrZyNuhe+Qe0eN
 VqPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQVUF84i8FKct3xGfN8HVFr2J88tjnNDtXZkJfd+Kjxk+0Iuo6F8dIrNtz2BlrtQKtOl6Cfvhvl34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL5Vn4t1TCW4dsFj3tWJjlz83YSicICrxG1sZD/qC8X3JicfsD
 k0atpvg0Vhi1BM+E6D7mijp/f9el5dF9mh3SBhKAUEDWQ57rEyXNWOq7JNfgzJ+xTp7KK/NJGVV
 BNsz6X37DZXJqAnWR5MD6s1uw4IZAEI9HYviUxydf/p5wbYV5hUAqprA/HB3Du3q54DSjJsg=
X-Gm-Gg: AY/fxX7pFyAlY8a33QVgy0Fa6W/7k2pmvFRzDy+PXqOuXV0t+pQDD/6n8mXrUV8zizm
 8QqOnePE5EZwZob09VmrFlTHevHfCoC7aGYBvFFLJGQ8UmOQi6y/5E7NQr6s35U1GtGIbqqaYrG
 ImS8gb8VtlAx8HLy8NOIyigFIR3mzPvP96GImQ//lobAX3H2/p+1FJQ/VSTlhTTYmT2CnEIuH8o
 5N/hF+C7zKiVZLfvrl35U/ZPxV9Bz7PgWSAKBmA5N+pMOHHkgpoNyw3Dk1yRc3gvI+dnLtmqaNG
 39mZx2BMNm8TJRDy2k9hLjY4tDVHtIl9GeDxzsI+cUE6hXnnw6QYteYq86FESg2vihx3sQyNYLu
 N/sEL4mLXBLONaJvdjhi1c4/8nYDsI821gn+XiDebQ275ukzRcOuO4/9r8j3U1r8SKArmgxe6OX
 Xe9yzxwAy4WAaU55Imc+tqdcs=
X-Received: by 2002:a05:620a:28d4:b0:8a3:f8c2:5f03 with SMTP id
 af79cd13be357-8c389421df8mr2032890085a.83.1768187501430; 
 Sun, 11 Jan 2026 19:11:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy2sOPSG9xnspRGe3S50DMCS9lvh724LPP3uuPnBxMoXPZql+DuoZXe5XMhxwVlt6UBPrypA==
X-Received: by 2002:a05:620a:28d4:b0:8a3:f8c2:5f03 with SMTP id
 af79cd13be357-8c389421df8mr2032872985a.83.1768187496172; 
 Sun, 11 Jan 2026 19:11:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b792cf330sm2758871e87.102.2026.01.11.19.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 19:11:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 05:11:30 +0200
Subject: [PATCH v3 2/3] drm/msm/dpu: filter writeback modes using writeback
 maxlinewidth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-max-mixer-width-v3-2-f98063ea21f5@oss.qualcomm.com>
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
In-Reply-To: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zHSRfRG/yEhgqLh6Odv+yciJer7YgF5rsUQscTWE1lE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGZj86aFD68n5Ir9ySTR6r3+b7J6Z3y0AMQq5
 gzT7WbLmQKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRmYwAKCRCLPIo+Aiko
 1VWSB/9aYazlDtkhbS00IerH0YtRm2wj0D6n62SQ0+t78++Kjfo0KnbLQUG6u4ToJVsSE1/uesR
 SiNSI4iPmBkLWk1/b5TteDZnWpXV+prZDGMOt+x1U6cDdcB0i6AnTeUB2z+mRt22PjYA+xBURlk
 xmQV3sDKQq1ckzDOTROXFDSUZ0heuHRZ1zL0oW49LDAEpdSwlo0AQZxGM4O+XjLqAopJrZ3Rmee
 wFiM4d3EAYgxcJY33rkSDohsk9V6oL8eFAR6xSo5QxyqOakPPdeOBoCLRW1v1wyI33tl9e7cDKV
 qijHaBSid8o2tyLDhR4QaUBuvypNXp/LrBaNGkYdy3xOoePM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6964666e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=K26iOwrG_T4ePdtMxkgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNCBTYWx0ZWRfX42z6Lm/zzwbj
 /KsTPWLmh8Gu1wIZqbYse2J+Ru7n6+3/xeXlNFu2nb1XTp3mJmBnJ5qlrRUGErjUFRWBWJLkkEl
 5MxyRsKyLYPlwwBCx6cbdYhJ2Rwz+OTWGpSMaO1M0iA3mCIZlYeOdTzS1oI5xtCsgWNMP5gNDFJ
 n49Di2xo+j6EBYBAeXwZR6r5V/7hFewjKWMGaq3+SnLObkgMtWdiMj3lLRAe9bBGcTGkytdCVnn
 OsIoRTzlynYHEEE5UXTXEEI76Nu5z0XyM+yapJxz9TFuyGn3GWbIqjZXpwRG3pcUsRInWfCUxam
 KwcyvRCh8DwA8kTzXcdRfpFLIVKFTLVNo1/Drlhd2e6OPOfIPIF73sg5nG0OXW+tX9Hl79944GJ
 2rfCOWg6ShgpwtIRoMXaq/fDVypNxs46D8J6f2v8eOZmgEN8vtV3VT94S7zvkBrpJQLQtIHx3m2
 v7DL5vP3UC6mBzSJaRw==
X-Proofpoint-GUID: k_3gq8vLOB1G-H16UGqv88L92wNOZ-QT
X-Proofpoint-ORIG-GUID: k_3gq8vLOB1G-H16UGqv88L92wNOZ-QT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120024
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Maximum width of the writeback mode is limited by the hardware buffer in
the WB block rather than by the LM properties (LM doesn't have an actual
buffer). Use the actual hardware limit (the writeback maxlinewidth) to
filter modes.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
[DB: fixed commit message]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 7545c0293efb..209b1e27a84b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/*
-	 * We should ideally be limiting the modes only to the maxlinewidth but
-	 * on some chipsets this will allow even 4k modes to be added which will
-	 * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
-	 * and source split support added lets limit the modes based on max_mixer_width
-	 * as 4K modes can then be supported.
-	 */
-	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
+	return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
 			dev->mode_config.max_height);
 }
 

-- 
2.47.3

