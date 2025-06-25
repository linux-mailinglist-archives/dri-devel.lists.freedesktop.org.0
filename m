Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C0AE8B90
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 19:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D92810E7A2;
	Wed, 25 Jun 2025 17:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwloIaqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF0410E7AF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:22 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAVXQK005493
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=L3IkuLMHxBT
 vbI+yz+IctwdTPNqPbXWCWa1wtpGui48=; b=VwloIaqYjPnsCDbew6FnKFsRP2k
 zWH1+upcU0ueRhEgPIQ/2T9l4y8v06qiu3ncrrPihAaCWKO+GkmprCMQ0ySuD/f1
 SIVl8B/5uTq/i1MPyjdcx4LZeQOU/00hw4UUhLh127/+tuyrbjUuQdFyQFHJNK13
 KpGeKgKMfRMGxlPzbRtvBptBfq2Z0e4jGrLDqTgX4lQPga0mxfbbPm+k4e1ERYoB
 u+1SZqHRm465Xarn39lxM/TdlVdvcY24u/GKjMMdGZBbZwB6a6DSj4o831m5xoSN
 EGya8NUKx4JB69Bzorsde4Z4nHAITx0d2PVhavSqVXttGyNCBf3q2IVX5tw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdakqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-748a4f5e735so137208b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 10:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750873041; x=1751477841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L3IkuLMHxBTvbI+yz+IctwdTPNqPbXWCWa1wtpGui48=;
 b=uFDVHuvUHzw/3Gv8IyrBu+/dETdB/ynnq/1yS4iSFH8pGKhjxi1ES1Q0QWEcnMblcg
 3vF7BunGAi3/HrR6oskoFhG5+aCoEEFqIjGeKvzLjqBhQa/7MUQ8/ZUZZ2oJWGWxqsxn
 64U5KF9NrlPNF3A0JV/gMfwvSNUqKoWfj38El3msRFKV8CrJSmGf0WxA7WaKD55307EN
 muts+YEdPAw31ATjy2NbTuNoGmxOhort1YkQCayhrJtzWGYf97GZaBwza6dGP1/He0cW
 DMJjFPszmgI0DmkL7qley+q39YiVyn0CdJPkEEWgNP7K88V5u/jFqt/m0TwciRFfo2uk
 vpkw==
X-Gm-Message-State: AOJu0Yws3QjsngtFJ0+VJYIoQSIKALLrzy7Q2i+x5XiDDsVwj8DjVNE9
 jih9Wo2lof0EEJlw7b6dhjfMfV7vjJBPokUioSgHQT1aqL751HGjWrW1Voxv1iKmQ0Ic/yLQ4w6
 +TeGJTRDFDgFWTDzNfnsJhusNXSZuv/Qtn5M+ck1xMtwbnSieEzHqmWlFTZqJtg/IDcWZ9UapbS
 BWUi8=
X-Gm-Gg: ASbGncvVfWrXb4UUoBsX8xFGJk3xd3dtv3d3YE3SLF/BX5ls3e7ks6eEPMDcUs+aGWM
 AQi8S98tk/z/QPdU/AUQg+OyLNmg97IOCo125zSNOSrG2SvULd5fTCNptNFFREv9Dyag8AREW92
 9UtR5IGdF9Mm+sBgjm+qmrp84QMRZ8OhkD0SBCEX2ebkBJ+6FN8JDTWbK5ikhPnITVSkrUHYtUj
 BlJDvTJns38lhseIBUSE4epjFgTwR60FNNMD6Ty0Q/aQYL8xWK2v0R8rQCsJq+SitwU9WfMTai8
 QfkJbqojkUWhsREq9BI3cxJqKN8FInoM
X-Received: by 2002:a05:6a00:10c6:b0:749:ca1:1d02 with SMTP id
 d2e1a72fcca58-74ad446b920mr6496024b3a.6.1750873040865; 
 Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaPLQjjw1Mco1AYfNaO1hktOiz7kntJ0uT+EkN12nTw8n3p877U5Ag/TwdHyi0A1rBcURknA==
X-Received: by 2002:a05:6a00:10c6:b0:749:ca1:1d02 with SMTP id
 d2e1a72fcca58-74ad446b920mr6495985b3a.6.1750873040378; 
 Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e09e1csm4775934b3a.5.2025.06.25.10.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/fourcc: Add missing half-float formats
Date: Wed, 25 Jun 2025 10:37:10 -0700
Message-ID: <20250625173712.116446-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
References: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685c33d2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=M_I3Rqd0q2e7SYdxXhEA:9
 a=IoOABgeZipijB_acs4fv:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEzMSBTYWx0ZWRfX+UuatWxfY3ii
 xwXVZMr2Ic6iCHzZe5O5QdK3aqLK7RB0ExPzIlQ6Bb7puWQl5d5+diNkDv8EGnpMUwPfTKiwfJw
 DAqUms9jTRbn2/SHASXVi1a8fuFytNLiOVo2UiiFMBzKcarfggeR+tYt84d4vPcABunYvcBBfBH
 ZL2/Buqb0ocYv2kSnBgs8qBOToeRWe7u1s9+9FiIEvoVii5bjGsVTwhKuUKFalt3QQ3CJi7zQTV
 m6hwfXY7Kjgz87p24AlqrNqqc/UPY5cW6FEsK+47QzWHspLs7du7SzsYuPYuXNUZW/7AZUI77YE
 arsP+ieAOmhXsvoPwIiU284x9ClhFzG67n9W/hI+4BpPSgvG9DBwVhC77Sw9xTskaXhur8YoUqz
 ozP2d2XiDDZDytD5+05Fa0Em+CbxRnn4J1ghtcw90layhseyqDrIWsXPlISlV5ClbpdEOFNu
X-Proofpoint-GUID: gln1odgVeoi87RVWCgyaQNnJaUH7It6y
X-Proofpoint-ORIG-GUID: gln1odgVeoi87RVWCgyaQNnJaUH7It6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250131
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

Not something that is likely to be scanned out, but GPUs usually support
half-float formats with 1, 2, or possibly 3 components, and it is useful
to be able to import/export them with a valid fourcc, and/or use gbm to
create them.

These correspond to PIPE_FORMAT_{R16,R16G16,R16G16B16}_FLOAT in mesa.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Simona Vetter <simona@ffwll.ch>
Acked-by: Daniel Stone <daniels@collabora.com>
---
 include/uapi/drm/drm_fourcc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e41a3cec6a9e..3560ca1ffb8b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -218,7 +218,7 @@ extern "C" {
 #define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
 /*
- * Floating point 64bpp RGB
+ * Half-Floating point - 16b/component
  * IEEE 754-2008 binary16 half-precision float
  * [15:0] sign:exponent:mantissa 1:5:10
  */
@@ -228,6 +228,10 @@ extern "C" {
 #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
 
+#define DRM_FORMAT_R16F          fourcc_code('R', ' ', ' ', 'H') /* [15:0] R 16 little endian */
+#define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
+#define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
-- 
2.49.0

