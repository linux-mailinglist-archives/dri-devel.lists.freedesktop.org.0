Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81250AC3057
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 17:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F8510E090;
	Sat, 24 May 2025 15:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhcYwmwU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B20710E090
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 15:55:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O29MXq015438
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 15:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ENaXaAptX7hV0LnSeomxQb
 fTAaRBDEz7YM383T9ESwA=; b=LhcYwmwULS5KfUeqGBzXGcoruxONco/eBptlY/
 nM1vtfzRk5rUckwf11bl6c8rdzYN8frmxC8Az0cbDkZRSZK3FcSEJIrFqIrIyiEB
 MKTJw3/ehE7aHXwNeS/cIzqi0PW3nTF50HalXOvQC83Pf75UWiKOYzfigigLv38I
 weXKpwY8VkZgKz7K1OkE3kCAEWLBZN9O+mwSn19m14dhC92kGZN87opWCDpK2kWU
 lwtVj/mQITdmtbukbCtD87LgnriAef/AaZC44X5p5oW/+k+jmyLuXXTOzz52FGA3
 oPWHvbEtDf1YFGd5WTyFsjfjfzfhioH7+2ljeC37eOuffw5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u52urxv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 15:55:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2342205cd83so3086595ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 08:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748102147; x=1748706947;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ENaXaAptX7hV0LnSeomxQbfTAaRBDEz7YM383T9ESwA=;
 b=atLfAWXvWXy8K+msUA+RRPTknWYz8/oLgu+EJmofTBaVz2eC7M1DUTuQl68mKHx9Ka
 on4yNYAWRTEN6N4mbMP1Zb4u1MSZpU9fB/Pi9lB/tq2VDj9DTsF403QAd3KzTysGG0NM
 RC/dvPWu3aKbVaSuamZCgiEv3qmTYvk/aZIH50dCmRvhWefsM9reLlg9xiFTJQAJvkgI
 q2bp74sdUNBQqFYurT/qxHQajz3NO+vMPK7rd4BpChdCXIi0s4lv3lT844E0V6hx2TJw
 opnBPMGfw+frT8RBrNoAU3FW6rbCsnDlUvpFo89tpuDiEGW8/J4k/6uf6ZSCCzBCdg99
 Nz2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFoft2lduPMYxBACEbe4W7JTEBLhMbZ0UGMyTZLrCYKIUkpM+/jxJIGq1y5W8mpxvyMPloGfDzS2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgDprKvuUXxoFABkRQMQjUifN/Tv3ywsN8cYVQoyzPq7k13f7T
 TUuZjcoFfqk3ejCQ9I649VVIGhn1/H8CMaJ6Plw7dAAHV3XB2WgIgBRcFTBTjhaNg78PqENLlql
 nchi6aFeWby9arD3glQnpXjpEOXu+/TMG3uBRWko/P4o5vNu+XDMuXhmyjUBNe5muwRb6L+Q=
X-Gm-Gg: ASbGnctdthwsO0ta1zFBT2D45g1mTBlZLFRaAEDXG04l5HlUoIEqRhhERzQVuB9uRvr
 qg6IqbGtsdKY/OgrZUkeAfsvPZVJ0H6ebRKy0lYG9V8wM1+4oXBE8BXg6AUPH3Qdmu8ZG9oOKaU
 bfMoD4DkLROTfCtI92MddPRzLb+R2E5PkNQFSjdUeEysAuI9+LiUh+Np5Fi5kr94ySyBXFhbXMH
 t1n67r5us/y8aVxqUd6QCWOcn+E7geSk1oaFvHF1Oao4r/vHrvPnOSAq6GqYwp6N40rW+WpIAYz
 qrmTPkBBIvXmx8HVUzlHqMsTYxzAbXYQTKnz168CEczummedZ2U=
X-Received: by 2002:a17:902:e544:b0:22f:a4aa:b82b with SMTP id
 d9443c01a7336-23414f62af9mr58433775ad.21.1748102147396; 
 Sat, 24 May 2025 08:55:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6qiynLRSJOmSDekV7ueADk6ZcUv9RFrAPGuFI8AxKbhuiTjsCzxUbRLDcJyHbQbuDV90JCQ==
X-Received: by 2002:a17:902:e544:b0:22f:a4aa:b82b with SMTP id
 d9443c01a7336-23414f62af9mr58433375ad.21.1748102146905; 
 Sat, 24 May 2025 08:55:46 -0700 (PDT)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2341ccad6fcsm12090755ad.170.2025.05.24.08.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 08:55:46 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Sat, 24 May 2025 21:25:37 +0530
Subject: [PATCH v2] drivers: gpu: drm: msm: registers: improve reproducibility
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPjrMWgC/2WMywrCMBQFf6XctSl5anDlf0gXMQ97wTZtokEp+
 Xdjt24OzGGYDbJP6DOcuw2SL5gxzg34oQM7mvnuCbrGwClXVHFBbjgnv5CgrWbBUCeYgyYvyQd
 876Hr0HjE/Izps3cL+71/icIII1YYKY+KaS1Pl5hzv77Mw8Zp6tvAUGv9ApwpD82jAAAA
X-Change-ID: 20250523-binrep-f8c81fa0d31d
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>,
 Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE0NSBTYWx0ZWRfX3jTl0mxzf3ea
 ZCZaRk7e4gt1++UYeprlUJOOZiKEPC90uPSjZDQ5wg/m8d0ey9IhQPd7o6zy6HgVr8HL91gaXPb
 8ST9QLlZi8XqyJVw6a73a2uvcIAzgyDdAjn21MRemMsNn4hHDwXlC8a9McWq3Sojupqf+QI/4Vs
 HZKjs4/sulJdBUC75IRw27Aw49RDWJXz+mcGhAZvYx1dyjmMqlPA0jzC8ABFdpv96rNqMAxA6C9
 VgNhY/CRH9J7UrHgsai3Z+rqkVWmZjBejIhtK1J6tA3gxjRJmzT7lpfjqmIXWC9XO55q0hgv4Qs
 MQcJ//EVIvuNY/3/4kWhdT0j+EEBUhML5Ca4CkOzabJ3gkX1c99nUn1CagNlCYzIkDQMZ3J3byY
 9Matenq+oegyu1YKcbRIl+V7eauk8wlgHp7HIZfMluMOhCFzx9NJmXPapg/T+rFoNqlEq52T
X-Authority-Analysis: v=2.4 cv=f/5IBPyM c=1 sm=1 tr=0 ts=6831ec04 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=k2a8_r_j4jiI5Xvw-VoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: p1w-zdg1bz_kAtWk_QE6uOaHKUwjnMEz
X-Proofpoint-GUID: p1w-zdg1bz_kAtWk_QE6uOaHKUwjnMEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=929
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240145
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

From: Ryan Eatmon <reatmon@ti.com>

The files generated by gen_header.py capture the source path to the
input files and the date.  While that can be informative, it varies
based on where and when the kernel was built as the full path is
captured.

Since all of the files that this tool is run on is under the drivers
directory, this modifies the application to strip all of the path before
drivers.  Additionally it prints <stripped> instead of the date.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
The files generated by gen_header.py include the source path to the
input files and the build date. While this information can be useful,
it inadvertently exposes build system configuration details in the
binaries. This hinders binary reproducibility, as the output will
vary if the build environment changes.

This change was originally submitted to the linux-yocto-dev kernel [1]
to address binary reproducibility QA errors. However, the fix is generic 
enough to be applicable to the mainline kernel and would benefit other 
distributions as well. So proposing it here for broader inclusion.

[1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
---
Changes in v2:
- Corrected author id
- Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
---
 drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 3926485bb197b0992232447cb71bf1c1ebd0968c..a409404627c7180d5b0626f0ce6255d7d0df5113 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -11,6 +11,7 @@ import collections
 import argparse
 import time
 import datetime
+import re
 
 class Error(Exception):
 	def __init__(self, message):
@@ -877,13 +878,14 @@ The rules-ng-ng source files this header was generated from are:
 """)
 	maxlen = 0
 	for filepath in p.xml_files:
-		maxlen = max(maxlen, len(filepath))
+		new_filepath = re.sub("^.+drivers","drivers",filepath)
+		maxlen = max(maxlen, len(new_filepath))
 	for filepath in p.xml_files:
-		pad = " " * (maxlen - len(filepath))
+		pad = " " * (maxlen - len(new_filepath))
 		filesize = str(os.path.getsize(filepath))
 		filesize = " " * (7 - len(filesize)) + filesize
 		filetime = time.ctime(os.path.getmtime(filepath))
-		print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
+		print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
 	if p.copyright_year:
 		current_year = str(datetime.date.today().year)
 		print()

---
base-commit: fc5c669c902c3039aa41731b6c58c0960d0b1bbf
change-id: 20250523-binrep-f8c81fa0d31d

Best regards,
-- 
Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>

