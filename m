Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6716B499F0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EE910E24E;
	Mon,  8 Sep 2025 19:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtgJlyc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74B910E24E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:30:32 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588JSU1s013569
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 19:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=1dRH/lT2me3
 Z6a7qND3TTo53lBcXKiMdwvBOwRXxAeI=; b=NtgJlyc6493cStiodyZRj1BBxxn
 AnRFOx5yDukL//iyajuz5djELscTX/hpTegBneOfHfu6Wako+bRzQ6dqst/n6Ko+
 dcpXZlBTcFygWB8KFUkYLSKcmO4MWvFdlOqAzAN1jJsmakw4bpKA6n0axT9Y1YCD
 GOUzqOSZ4oXFpgaGsc2VvIi6s93Yp0omEDXNTCRmhn6fi/fGZWYJKX/L3p/ICkts
 jBXyfWtYXVsfO4Ggd97xovqn3nIdhsmXaR2a1DJZWfRcY/+XWodqYcssQDvDEEaB
 UDX7zW55OwinprONeGeIawwin45JoH5GD8PMuozkEF1gntUt0TXNWIH0haQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdtjvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 19:30:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24caf28cce0so116828715ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 12:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757359831; x=1757964631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1dRH/lT2me3Z6a7qND3TTo53lBcXKiMdwvBOwRXxAeI=;
 b=cB9sTNMty4dr/htSwOExOqC6kN5bP/RIJByp1J5vVuTkZ3c54HPZfOlUZ8NScb93LG
 Gft3Ap/b2U91TyN9PAFlGesvvqUqwol9eGZJdrYgGlPeLCm+lKcELObS4H58Ba6CwZD3
 inWfTbTP5m5LgwqrrSOc+jyr1MvqlqJlDE+PKMdPWrqywpZkNUch48Vv8VdaHjdTDRFd
 URYlpo7AoGaoYmAe0rY+0LBtXf08M1i2qkrDvHPJh9Xf951sIW90ykNdHi791NeJFyiw
 9k0SjgJ187vLAld/Pw4fo1W7vaaLAub+AFAtCs11W7ruerfkaSTTHaTna7u9b1riP/3q
 U7NA==
X-Gm-Message-State: AOJu0YxxVMGeLrl2Y2pLXLakFebpOaxfsDrFLxxlGAsjJ62m8dIyOZv0
 0dPHVXv4Dm569j6Hu3hF2yzU+m0n7SoPeJjzK/AFJPLZWTlqgvJJwGLnj8gfyhbw1SJBf65/W+q
 yYWNEokqOXnrNfWP/KZvFR6mA7HcbWDOUZ2Tn6g1B0xpqJwNvnHCbe69lcFZOFlIayB4foBiKlh
 nlbbA=
X-Gm-Gg: ASbGnct0XO2tLKF1CW5a6OpwzwhS9JAnkeNwKb3cselKHki+qupfYiVm9qe/nfStrIG
 rq/OGneSAnjsbT04OYm0G/bs2Qc/xgD0vWLMebzHv8KxgparRr0YvBJvASGjDUamjKUXSkZIk7y
 d6kYpz8aZ7CeIwVPZO8ZM/M6sm3CzQ1p7WNOOO6/BEzaRzySdTiCXhoWk6mXYPHbzPv2FdQKvvd
 vGFVdd4ER5zuCYmcR1ApQc/2p4mdSp7iPUmp9UQDpKpXi7QFs9tJakl3eEMeP/jgdWUACC46iHJ
 wzU2sh62ExqaHMv0wMk6cK2+nOkvMMIagHibJJM+IWxZpUqP/NM=
X-Received: by 2002:a17:902:ebc4:b0:24a:9490:545e with SMTP id
 d9443c01a7336-251736deeb6mr143046565ad.29.1757359831274; 
 Mon, 08 Sep 2025 12:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLIdlvQXqWUV6AKuuRDP9+kqFt4lIskYliw2ng0ftyhMrTn2DkBqizO9tSwG1erU4oORzE9g==
X-Received: by 2002:a17:902:ebc4:b0:24a:9490:545e with SMTP id
 d9443c01a7336-251736deeb6mr143046225ad.29.1757359830839; 
 Mon, 08 Sep 2025 12:30:30 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24b11becab2sm183669505ad.61.2025.09.08.12.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:30:30 -0700 (PDT)
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
Subject: [PATCH 1/5] drm/msm/registers: Remove license/etc from generated
 headers
Date: Mon,  8 Sep 2025 12:30:04 -0700
Message-ID: <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0kTa9TdL4avG2i-xsQ5R9tCNbjzYs9XM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXwJoX7cGW5zlJ
 MT3k1fZ9Bck/EJBRqFQrCG6zF+5FfIg1r1xv2VpHGNSV3yuiXN92Op4H+kr+y33QpzeVgkwjmHH
 NYST+1zRzRlWSXF2UBYxLSfCh8G2g7s/I+BEzwv00E6kcpdeWChCnmyNlohZyFcY/XGsP1h426b
 CsuYDPoo+ZGuQcz22kORzxAQpVGq+XulkwRqYQp23HnZy3LK9uzvNlLO/UVJknygf/9yH79ZbnE
 H0hhQqkslcEcUncYH2mnt6ery03+VHYf+6xDwOBtIzK8lQKASN1dPXnPHO70Z7GBhnd9rH/gvKE
 sh0pVDp6xikadSX1E9/cRkgaPHXQb6yCp/PthlHpzYI8hh1WifeLtRx6dLlautGU0VKo19let1S
 YojoBKfJ
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bf2ed8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=24meVJ-eaxx8ovD9fTgA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 0kTa9TdL4avG2i-xsQ5R9tCNbjzYs9XM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
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

Since these generated files are no longer checked in, either in mesa or
in the linux kernel, simplify things by dropping the verbose generated
comment.

These were semi-nerf'd on the kernel side, in the name of build
reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
registers: improve reproducibility"), but in a way that was semi-
kernel specific.  We can just reduce the divergence between kernel
and mesa by just dropping all of this.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 37 +--------------------
 1 file changed, 1 insertion(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index a409404627c7..56273a810c1d 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -444,9 +444,6 @@ class Parser(object):
 		self.variants = set()
 		self.file = []
 		self.xml_files = []
-		self.copyright_year = None
-		self.authors = []
-		self.license = None
 
 	def error(self, message):
 		parser, filename = self.stack[-1]
@@ -686,10 +683,6 @@ class Parser(object):
 			self.parse_field(attrs["name"], attrs)
 		elif name == "database":
 			self.do_validate(attrs["xsi:schemaLocation"])
-		elif name == "copyright":
-			self.copyright_year = attrs["year"]
-		elif name == "author":
-			self.authors.append(attrs["name"] + " <" + attrs["email"] + "> " + attrs["name"])
 
 	def end_element(self, name):
 		if name == "domain":
@@ -706,8 +699,6 @@ class Parser(object):
 			self.current_array = self.current_array.parent
 		elif name == "enum":
 			self.current_enum = None
-		elif name == "license":
-			self.license = self.cdata
 
 	def character_data(self, data):
 		self.cdata += data
@@ -868,33 +859,7 @@ def dump_c(args, guard, func):
 
 	print("#ifndef %s\n#define %s\n" % (guard, guard))
 
-	print("""/* Autogenerated file, DO NOT EDIT manually!
-
-This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
-http://gitlab.freedesktop.org/mesa/mesa/
-git clone https://gitlab.freedesktop.org/mesa/mesa.git
-
-The rules-ng-ng source files this header was generated from are:
-""")
-	maxlen = 0
-	for filepath in p.xml_files:
-		new_filepath = re.sub("^.+drivers","drivers",filepath)
-		maxlen = max(maxlen, len(new_filepath))
-	for filepath in p.xml_files:
-		pad = " " * (maxlen - len(new_filepath))
-		filesize = str(os.path.getsize(filepath))
-		filesize = " " * (7 - len(filesize)) + filesize
-		filetime = time.ctime(os.path.getmtime(filepath))
-		print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
-	if p.copyright_year:
-		current_year = str(datetime.date.today().year)
-		print()
-		print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
-		for author in p.authors:
-			print("- " + author)
-	if p.license:
-		print(p.license)
-	print("*/")
+	print("/* Autogenerated file, DO NOT EDIT manually! */")
 
 	print()
 	print("#ifdef __KERNEL__")
-- 
2.51.0

