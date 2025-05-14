Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82943AB79EF
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 01:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBD210E759;
	Wed, 14 May 2025 23:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPZ7BrCu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20ED210E093
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJHbYO012664
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zJghl17vB9yjaHgteK11rQgf489v27pk8MSeO1QlklM=; b=YPZ7BrCujttzWefS
 7k52LLoHd8QJTzwQO/vxTEVo9omV/tg5k8Dew05cPjOh3isk1cwYDX34iIzw1g4j
 igq5KYXFwoEyKyvi0bNt9MULlip6eOdwpfYrybNgmvysUcI6oJH0VFcU5zM8HrQQ
 Irzoqvvf/eY79bf2nqrGaeVMPviY4WXHShYDDWAp7QtrrkXnUPiywGhfIvViZ5Vu
 nzZSkv6EfS6+wFybzFLdurzPV7/1Xrb5inNYNri5rz8JjZRXky6MX+ypwcFJEKKY
 CKFGl/L/LXe10A0wuItAt71F8Fq2KVVZBzeZUjw7qP6EL2hV8QO61ld3Xj9H38Rg
 oUlBpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcymeqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 23:52:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-22fb8cfff31so2813045ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 16:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747266766; x=1747871566;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJghl17vB9yjaHgteK11rQgf489v27pk8MSeO1QlklM=;
 b=pI/XuneUQqEp2Ok95gUzt92UiaEo0NPi0Sx7iyclQf4oC/1XJ/4ZAbKoarHRjrpadc
 E95WsDKX9JDaHG/SILTRyJ3A25yCYlX4KRdg0zPyIG/bUvcxqGsgalIzRDUa2r22Tf7o
 MNXS+U4PWVB4d8WaG7dcO86hc2wTbKTq7tNGoVoKuRxqFr0JP5xc555Ip+jyMbMpiXdr
 4KbN97mc33EfIc+3WZOPs8W9mZhX/R+Q151ZhPWJx40BS8SLkUyzpbtnt9nHMJnHw7av
 /jNofqzS41XWDLdpOzqi7O4bhXLhQX7V/rpNZcMr2/LidhgZfPi80qaomvyN2P+Mgd4J
 jzjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDMKgC4XcdX8pK6CK9SvQYP/WyI1FnhtNrxqFtxEdZYPZFKv/WX2Hz70839pbDVCGY2NNLPnte0zg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ4+qb+sGrllGHeBa2D3FOGoKnsbCXYwWOQnCdZUBtnits5gh9
 dvm2gM1FVUFgfCMZ0PcHAXPYljjeAs5d3Y/6eQ6RsqnVq0at3+tbXVG0BoM2hcN4841Ho1MH7+N
 OsAiMUg228UOaiTagFgo4bbu1K8x2JV2Qajpd/Awi0dtUkkElgymlWsLJsXfxnK74BwA=
X-Gm-Gg: ASbGncucjHInJ2H9evlsiBR8UwiRuqre7PtCtSXKo4leHc/Ek1700SmSXRhvY7Ir4Tb
 3h3JG5VKSFRx2/SaJubQejKwjSv594WWKGd8EZptArxPNKVHZLkQh0Aten89cOx6Riu47F0HhIS
 roViO4vwF60LG/fBa4KttiyrtStmGT427UocLytZ2ezTWeO8yvqW1paTt3JxcuPf584cR8t7RIU
 xQCOe9PvggxQ+eNr+j1bXCw9Jlj202j8p02I0YF6fjajin0wVocObCtPIBuoAQNH9FyAmSHNOOP
 zRW4IxeDm7DKI4CT6NjlDmAhAkiC5l9MGMlHOxFZppcijiWoV1/iHKuwGE5cpvNsN8+p9pMI
X-Received: by 2002:a17:902:d58e:b0:22e:364b:4f3e with SMTP id
 d9443c01a7336-231983c8d26mr78384235ad.49.1747266766587; 
 Wed, 14 May 2025 16:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElBMMtlFs73GOE/CSJfWpv6kvzPVBPciQe95hl+3ogbQol8ic5ww8zShcsAEXLyX/lBBTLOA==
X-Received: by 2002:a17:902:d58e:b0:22e:364b:4f3e with SMTP id
 d9443c01a7336-231983c8d26mr78383945ad.49.1747266766200; 
 Wed, 14 May 2025 16:52:46 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 16:52:45 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:32 -0700
Subject: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=1350;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=OIPNFYLkdGomhmus1/0s4dYazfcOvIpfe1g5WVjseBQ=;
 b=0lV/29bwfrvOOIXt1cQk9FuWEEWPvaC+02GdLvIzrV3TQ9b+8xL/6i24PUe+kv775VH6GIiyB
 PYZR7MOt/YnBvHbmvbU+ftLOqf6bUJy37F5YtG9ufV0E3xKiNFyxO3V
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: zN91yvyG7AuUa95PIYSdmhUPgI-BTaeX
X-Proofpoint-ORIG-GUID: zN91yvyG7AuUa95PIYSdmhUPgI-BTaeX
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68252ccf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IdaEjn1bWG-LatOizd0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfX8osblX+wRqvL
 t4uZmI67WLVn6ufDr7oUVZK8lYSrg0RjKgalgkeCo9Ny4HyXVZeCVt6mhXEQAKZYnR2eakGDGfs
 w69os638LLh/fVrC4IYeWMQ2qyKk1KgRhkC67aXf+yuW6SOJrt1OR9wxPSmwRu6hQSGPofG8HtH
 LYFVSYRGFuuGCEesHCzYysydARkwtYhPTxvOjbdVqDENwGkKLQT6+/y+ZGJiT/Ccm/zlBbxcd5G
 /3qwese52bFpOHB38OvoYHTF2h4+Cb/DHnlOO9mPZytoyQCUT+xdDSa6QF/xO69ahKDodko64HP
 gWvW6wRhV+3lDf9dduaIHXN5PS++cQGQ+LwukxiC5HpBN7aE2YCSVY5GY3YTXtOCHqLxOGTUFo+
 asErd/d8rx0OcTTdl75yLoeq0E/pblA3NA9UW46vJ+TlcX8WQYyVhtjvs8MXEYj+T1QlNEVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140222
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

Since the max mixer width is not a strict hardware limit, use the actual
hardware limit (the writeback maxlinewidth) to filter modes.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 8ff496082902..0a198896f656 100644
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
2.49.0

