Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF11B499F6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204A010E5B6;
	Mon,  8 Sep 2025 19:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVqrTKRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB50910E5BD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:30:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GbJJx017315
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 19:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=WsTaj9aC5GD
 50Hh4uc9YImnv7c9qgszQr9EnvkcFHK0=; b=eVqrTKRBhlWdtP7W72Uxq6NoiIW
 YQ5p6nq/CK9yXaMQQlgEznwtyPAEChT3Cq7Nw+/roK0elBzPbJjkrzDp3xLZk989
 K++0VQvquJXc0CYtc7TXeZQPid3bLSHCXciECvI+EvDEiKyAOOiS0rD/XyThvD0n
 +sXG2RVyKjERFHJB0kzu9fvevv5aX1+qwf8g6LOdS3Eqb0ECxkOuGciKtae6S6EM
 DjDhwp/74ROdDDohVZXEpT7/N4KT7K4o8uWORMNsWH637gFyrpSg8SBfSXu1FKSb
 f423jRqAadm/zn+NpWpiFsZ7QHcz9uHSRU/lIJBjDC71v+sZh0kFohyEbLQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kwmpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 19:30:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24c9e2213f8so65012825ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 12:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757359837; x=1757964637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WsTaj9aC5GD50Hh4uc9YImnv7c9qgszQr9EnvkcFHK0=;
 b=ZilelV1koNY1Tixa2AoLvNn2Mpa7gKBeldWT3bMGnbeTNSURKdUNEp5yxJUfTB11ku
 DurvYpsQsPzqE9ypK45Nj4QlAMKDI1NWHRs0EblYjvYrnmi1fkR5pNUblovUd+YVw3V7
 0xlTQFCdq3AlaVEGNHBw1WqOHccUEHubW5Vc2osbPNc1jrzsb/tkLynPcifxof8xqeW8
 ew/qwLppQGmED7Blnz5KKtbo69ZcRwqPC8i1Pp+LEih6s1VPWzHWZE3cuBH/cwdc9KeO
 KdGaAcaTl9YI+WPsKTaj2rY5GDe+/s8sTC3Zb7iSZoY0+UOvK653+Qzq2A8XUeCIjol8
 qT5w==
X-Gm-Message-State: AOJu0YweDTAB3oE/++fYuegA+WTPQxSR1PoLpC/hrIzxkm+XXBi+EJbw
 2ZIYMCJfvSma1/tCQBlbV0cPbbVsZegdo9rBV5gtnbRnVMAto8jYHk6AFarVom2Zxtc6yfoRE7A
 9cYGnctVClFHePSRimxfWnfpQHMpaRNkp/3zQGUf/8maOEQfyv1zFLk1Lki+4/dBeLGYCXJRmDb
 kLDsY=
X-Gm-Gg: ASbGncvbBruGw0i3hZvqGXSIYPSOb3pE5VbhF2lkVFvVzSCmkyWuDQs4ZtV5A04cqrp
 PWqcYJ1VDDQe29Q1ZRr8p8dIraviEXPZstMOjQVdMwCK1IhJ0Ro1FTyeaTKoisUIzr1lR2GVVEW
 H5XJmIH29o5FnCiD8ggXL/GRhSeJDpQjhP4Pchrbz9dKJJk7ILKplwC/hmPqwA4/sW7aQXG7xx0
 6wv36VLgN0Sbhsjj4lMgML73knIU7F9+PoTgTKsK68JIMwTprZvaLPg2Vgg7/pflRKEjc8jPOrE
 xd87DzgNvcEYNh3m6fPR0TrlTVEt7OZu2KiFXOaZWpxW+7yfgKk=
X-Received: by 2002:a17:903:19ee:b0:24c:bdf5:d74b with SMTP id
 d9443c01a7336-2516dfcd7c5mr124311915ad.19.1757359837122; 
 Mon, 08 Sep 2025 12:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnE8HmdaJ0DQoZXF+EtTS9roT6QVEtH1gZOT81nijuJgDxG0dijPNgZrPVtA0NPjF7Ux7yew==
X-Received: by 2002:a17:903:19ee:b0:24c:bdf5:d74b with SMTP id
 d9443c01a7336-2516dfcd7c5mr124311505ad.19.1757359836629; 
 Mon, 08 Sep 2025 12:30:36 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24cb28c3110sm134810835ad.120.2025.09.08.12.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:30:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/5] drm/msm/registers: Generate _HI/LO builders for reg64
Date: Mon,  8 Sep 2025 12:30:07 -0700
Message-ID: <20250908193021.605012-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX2DCHOiN+aGgD
 RRUGCPIbZ3Nlmzmw8vk4YlgLktqplBiTJ8xHVqqwznxHxHCgTV0snK1gdRR7K8rIXHtzlvctRPu
 ZUtQxIFG7h+uWmetNeDinh1tDBkTARww9jNN7e0l8r6iUZcbe/XpTXF+UCRUfgiOEXCVUVtv2Fz
 m/wcl3j00EEwanNmq4qZ2JZxaVr7Xm8KEuExB/ZOjH7AutQsxCJoIKEmrKBgWDpiY5RnXJ3AkCy
 KqcdMbtrnwJEQYBEWzLPIMsRyf6vJDFneK4ZrX6osigh+tw9iznniwEbv4uMhOd52r4Ae8QaM4c
 PLbIiF5kOg4p9fbouMrS1j11wduAA2vX5v1DSmFHchqKS4a/Xn0jcALdzPJA/EgZpAMEHR5GJ9a
 sf46Avf2
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bf2ede cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=QI1G1A81GPnZtfO3aA0A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: TrQTUUzDmi55GrDhJOuCLbT5VVXiW0XD
X-Proofpoint-ORIG-GUID: TrQTUUzDmi55GrDhJOuCLbT5VVXiW0XD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

The upstream mesa copy of the GPU regs has shifted more things to reg64
instead of seperate 32b HI/LO reg32's.  This works better with the "new-
style" c++ builders that mesa has been migrating to for a6xx+ (to better
handle register shuffling between gens), but it leaves the C builders
with missing _HI/LO builders.

So handle the special case of reg64, automatically generating the
missing _HI/LO builders.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 16239b754804..1d603dadfabd 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -161,6 +161,7 @@ class Bitset(object):
 	def __init__(self, name, template):
 		self.name = name
 		self.inline = False
+		self.reg = None
 		if template:
 			self.fields = template.fields[:]
 		else:
@@ -266,6 +267,11 @@ class Bitset(object):
 	def dump(self, is_deprecated, prefix=None):
 		if prefix is None:
 			prefix = self.name
+		if self.reg and self.reg.bit_size == 64:
+			print("static inline uint32_t %s_LO(uint32_t val)\n{" % prefix)
+			print("\treturn val;\n}")
+			print("static inline uint32_t %s_HI(uint32_t val)\n{" % prefix)
+			print("\treturn val;\n}")
 		for f in self.fields:
 			if f.name:
 				name = prefix + "_" + f.name
@@ -645,6 +651,7 @@ class Parser(object):
 
 		self.current_reg = Reg(attrs, self.prefix(variant), self.current_array, bit_size)
 		self.current_reg.bitset = self.current_bitset
+		self.current_bitset.reg = self.current_reg
 
 		if len(self.stack) == 1:
 			self.file.append(self.current_reg)
-- 
2.51.0

