Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F4C6A4F5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 16:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4494B10E4E7;
	Tue, 18 Nov 2025 15:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsciJI+e";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B12YxdW9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7B910E4E7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:29:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI8l8gR2755312
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=I+VDmgEGyB6TgQRIfvWH0W0zNDau9SODpdv
 whVSLYSM=; b=GsciJI+eubbH2Zmbgge245eKjnyy1XkJFZ116YUk6WP9LAt4OV5
 chSnlm/0lB2NYYL5CAeSzv/WDruvnDN8rmlEYZg2J5gHafySfRbC+4LpEeX/ctqh
 ZYlwpK7AoME1ijgGfm92JuoPWq9+mYBeeZKZK9CKofoT12BKRksywKrzwrN7fbz/
 pzODjAdPZtmg37xmbOqaTBmlMrlVBU55fA+tmV4K/RvOT+1WrhJ6AcB2dueFiYiN
 pJKKN/5ZQIzBFwLl82W09vE/M3hdBAzylhO6mBHzUs/QLRwK78/ayMJb7BxDHdUF
 BAYRgkcQ7cZRU/P+cOcGR5zqwWA4HQlrdgw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj14e2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:29:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b9d73d57328so5046555a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763479797; x=1764084597;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I+VDmgEGyB6TgQRIfvWH0W0zNDau9SODpdvwhVSLYSM=;
 b=B12YxdW95xvBx548Z9H+HULWXw+felUvfOqSS2rvpGWwenRJgtjwEV8hu7fZakLUSy
 8rzRB3yCFAlBKWLuwH7KuUN5uBOS2x+n5YluEVp+9fYYolNFZjRYPlnqzpSjnsxAzLJk
 fGOZBB9tpNbAT6GiQrR/aMY1cUpLK2f+UNz65uUjV6MVrdPbUKU7XHKOCtgOo98SkzYd
 GT61r8eoXtYVlhyknRfXpyfvuM/YRzMXtaMJwhWYlJ3t9Yzjz8p2+P5walpIw1Pie7/v
 pNZ2t4AxGV4PtTPI4OczqQYwJIiyaPB2LKTgUBRcFB7NYlzB2BMFgUNzZE804J2hDlJF
 U/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763479797; x=1764084597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I+VDmgEGyB6TgQRIfvWH0W0zNDau9SODpdvwhVSLYSM=;
 b=g+IOYAp7NZAj1X10bU1yApTjfI77eLcvGWoNtH8KNB0INJDUeoo40wLtkOB+Vh6coe
 BVRpIf8n1Tm823mpG/ypjx3Cauh7SMc4S1ARdJwxXyJwDLCq3EBYHFSFjci5hCLY1c1t
 Q+LT1YDU0FynaX6qDIWEFTaNqfNiaOidZ5QN2r+Kya7zV6/InZaT+mzSQxTKTz6fpB2D
 IpOj+pR2BmUSzds0c6LyLkO11t/RZsczilsjdpCZTx/LvUMKeopJhg9f6ORUZ/H4Zsnq
 zT2aAX/PaS6XpduyY2VgYdocsaJOg+994iGcHko+zdd0KFhf6w52WhvQr/z3gWJwHjKc
 5I2A==
X-Gm-Message-State: AOJu0YxgT0DinIq3AllSZTs3llMPz2PrzOKHRDHjU/sd1KV62jLXZ8i8
 B7C7fHPPI51WEDpgNq0m1dWwOnbvEaXOhsfDDs9mFYDliXgXjAkVfaEzQk/Kih8ZWVoZm/5PX0B
 auyOnNft/pVoL+qrLMRPhkE5d6d2WlQFjR05IkK0NU2ya0F1gidzVB2ZQfucbD2+fRv3RJ7Wotj
 foR+s=
X-Gm-Gg: ASbGncsQGUc/0Xrjd89Q2bvXCadQOPnF0FtfzxDpXggh41ASpL8NNjFG3rIbptjr2rT
 4FX+AKb3uDFAbgz+BuyUyDobq1Jei3186Wd6GTXodRLxS0IW9ZG/2yPOddTM2yz2oC6v6mX8C06
 lIT+K1gNCVx55ZDf0i+yBoli+OlLALPBnyHn9OQaqhkAhoBzfPAvJGrptjcVZ/fge8YT7FHhJk3
 lVorVGdo3NTcSJte35gRzYVxoD53lkTtNLZhwiGytVMFFy+akve2u32C9+qsLamtEfH7PkC275U
 xzwMz7Fso3Avhtl4/rOOTz71+W3SNfhA6u2bnT0lGUOyrkmQSGYQrBKwRICD2A8CJCUgyGdyKsf
 gx03y5xoO/UshJGvXtowOHb1RwLCj72xSV9NerEZBI8w0mt1hnCAD5dJE
X-Received: by 2002:a05:6a20:3952:b0:341:84ee:7597 with SMTP id
 adf61e73a8af0-35ba228b7c4mr18420526637.47.1763479797459; 
 Tue, 18 Nov 2025 07:29:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEe4mHSbCZax4MAs1NmPegRHOtwX0Q3zmqbi4opsIbcLXwrTwyddGfmcrdprr0gXjZZ4jZQ0g==
X-Received: by 2002:a05:6a20:3952:b0:341:84ee:7597 with SMTP id
 adf61e73a8af0-35ba228b7c4mr18420492637.47.1763479796936; 
 Tue, 18 Nov 2025 07:29:56 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc375081bf8sm15591289a12.24.2025.11.18.07.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:29:56 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/registers: Fix encoding fields in 64b registers
Date: Tue, 18 Nov 2025 07:29:49 -0800
Message-ID: <20251118152952.226510-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _5X6EUPC3icmoFIeKj9bR8KgWx1lPkaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyNCBTYWx0ZWRfXw/neMj6ZchHS
 Y/36uFwixq6Rc6yopOfXSh+BDDqiQl/XeGdab1q9kDREI1lnVreY91jkioQfd3KEANN958kQTk9
 IJXnw5Vv/lfAPyCC2tm+4dFGaUhobP5AwMdlaVArPhHrXHxfHn9gMuAh7nEb/tXYC3w9dD6HD+q
 Cyh1Uof2v/LJOmjtKQ1GUKQkg5MPRz9wutEN8OG/AyZLp/D/XJsiPAdO4skO0MYEtWMRKH1pIdt
 sJ1sM6Av+O83K9BCwLu1FCbqnzsVbpbOaWQthG1eFLKjoPK/8nsckpkEOJI5jiyIUYJ7Z6bmf+p
 NF0DgC+jG8zhkxcdhy8hTXPsLNwre87K5Rq2qMI2tLWlqyfSE3Xx2VOKzeUvv1hIUS6oTzQ72a2
 kKYRih9636BOWDuiGYYUHap4ep6hhg==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c90f6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OSLXHSMv42BtIwkUFNYA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: _5X6EUPC3icmoFIeKj9bR8KgWx1lPkaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180124
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

Based on mesa commit 3f70b0578402 ("freedreno/registers: Fix encoding
fields in 64b registers"), but with some fixes to not skip emitting
interrupt enum values.

v2: Don't append "ull" to 32b reg MASK defines, to avoid printf format
    conversion warnings all over the place

Co-developed-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 1d603dadfabd..2acad951f1e2 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -189,12 +189,13 @@ class Bitset(object):
 		print("    return (struct fd_reg_pair) {")
 		print("        .reg = (uint32_t)%s," % reg.reg_offset())
 		print("        .value =")
+		cast = "(uint64_t)" if reg.bit_size == 64 else ""
 		for f in self.fields:
 			if f.type in [ "address", "waddress" ]:
 				continue
 			else:
 				type, val = f.ctype("fields.%s" % field_name(reg, f))
-				print("            (%-40s << %2d) |" % (val, f.low))
+				print("            (%s%-40s << %2d) |" % (cast, val, f.low))
 		value_name = "dword"
 		if reg.bit_size == 64:
 			value_name = "qword"
@@ -264,10 +265,11 @@ class Bitset(object):
 				  (prefix, prefix, prefix, skip))
 
 
-	def dump(self, is_deprecated, prefix=None):
+	def dump(self, is_deprecated, prefix=None, reg=None):
 		if prefix is None:
 			prefix = self.name
-		if self.reg and self.reg.bit_size == 64:
+		reg64 = reg and self.reg and self.reg.bit_size == 64
+		if reg64:
 			print("static inline uint32_t %s_LO(uint32_t val)\n{" % prefix)
 			print("\treturn val;\n}")
 			print("static inline uint32_t %s_HI(uint32_t val)\n{" % prefix)
@@ -283,14 +285,17 @@ class Bitset(object):
 			elif f.type == "boolean" or (f.type is None and f.low == f.high):
 				tab_to("#define %s" % name, "0x%08x" % (1 << f.low))
 			else:
-				tab_to("#define %s__MASK" % name, "0x%08x" % mask(f.low, f.high))
+				typespec = "ull" if reg64 else "u"
+				tab_to("#define %s__MASK" % name, "0x%08x%s" % (mask(f.low, f.high), typespec))
 				tab_to("#define %s__SHIFT" % name, "%d" % f.low)
 				type, val = f.ctype("val")
+				ret_type = "uint64_t" if reg64 else "uint32_t"
+				cast = "(uint64_t)" if reg64 else ""
 
-				print("static inline uint32_t %s(%s val)\n{" % (name, type))
+				print("static inline %s %s(%s val)\n{" % (ret_type, name, type))
 				if f.shr > 0:
 					print("\tassert(!(val & 0x%x));" % mask(0, f.shr - 1))
-				print("\treturn ((%s) << %s__SHIFT) & %s__MASK;\n}" % (val, name, name))
+				print("\treturn (%s(%s) << %s__SHIFT) & %s__MASK;\n}" % (cast, val, name, name))
 		print()
 
 class Array(object):
@@ -437,7 +442,7 @@ class Reg(object):
 			print("static inline%s uint32_t REG_%s(%s) { return 0x%08x + %s; }" % (depcrstr, self.full_name, proto, offset, strides))
 
 		if self.bitset.inline:
-			self.bitset.dump(is_deprecated, self.full_name)
+			self.bitset.dump(is_deprecated, self.full_name, self)
 		print("")
 
 	def dump_pack_struct(self, is_deprecated):
-- 
2.51.1

