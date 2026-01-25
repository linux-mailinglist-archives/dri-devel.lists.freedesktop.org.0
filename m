Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FRiO8r+dWmDKQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39D080303
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F58910E1BA;
	Sun, 25 Jan 2026 11:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfmqLdEw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfdSQz6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D10910E07D
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60P7N0ft3015884
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=mvGjPy27pCFkjdHDNHlNeC
 iCDhTG5RP93QvZbHsxxUU=; b=pfmqLdEwpQe3NL7aIbRXYAlchzEDdkA252hH/F
 8hg2CBLnyw182BbClxAN7ObC6+BxuRu4/bnFNEQ+fh0BZPoUf7RLWepaoLAe+aBd
 sEMOmnMesBsXSKVYzxXscog89ZgcCQEyYrRkv/5baQiAQC5oUFo9KAk+q34XIeVm
 eYfcXWdF96zV0YwahcSVIlnxb7CCvhzu2eA0mJm7wWClDtcKjsnO1CDg5Gvk57l2
 ET2WW+Lo7ck1k61n+kp8VeUE8fsg8SjzeGIJqnF9jxMQOsJlpEaVaEVn3q0bECpp
 wdDCcv3fdDbFvCBiG3TAT7lkALNpyg8wMnXb8Z6v1NnOR9wg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qj0u1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8946448adbdso118467576d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 03:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769340611; x=1769945411;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mvGjPy27pCFkjdHDNHlNeCiCDhTG5RP93QvZbHsxxUU=;
 b=VfdSQz6hP6Qu/beUfZ5PBNEkxyTjo1gYMseBXc+J3obdFraW5ebvZGF+Fu77S8yl3A
 jMDVV1fnG06QVQjQhmbT63V3hBhVzZsfPwEJbJ6jBhCoiNZDRtX7ATue0Qem/qPUS6pF
 kIXp20RKvK868B5UF956/deltSyMhQQRhfrPrruGeC+a8Ubb8NdxWxdYpL1vo5rDmy06
 CWgWXPZRmbXRYq2b5742mI1Xnq0fjZFAPVy0ABatNGRt7pZla8FxWA4bT0YiIEklbxUa
 3ntllprtoN9DrHFjPxfrY3ZQqiMIEK1zAzTIsgFZWsYlgmeJewk6/jnqPyrH0d6n1drV
 TWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769340611; x=1769945411;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvGjPy27pCFkjdHDNHlNeCiCDhTG5RP93QvZbHsxxUU=;
 b=PAeKGMJI15ysd2FybTZRmqtpRzgmNYA9WDIPF3aryRsaumIqCpTUkGyU07tAJH6uRe
 UdLIYWoI/PqkeQa3LYsI3s4kSsxIbK4VY55aQL7MLM19KSy9D3WxMyQASwqTSplcwGwc
 BWrm/QrmyYrHxQMTYmBnRO6rUWdzXTgdYgtiJWY7p70l9ZsSvJ+zTFdsXqu/B5jPVOBr
 9s0b9GAWIt2nHhnW/eUEZ7QR3+1blJh202pY+faVK1MtizBwwLjSajoHpdnYxMHHXpUm
 32P795Iw6QusI43gf3nsTmcf+ev3rygxO8OFRbfyP9MRof4oviQ7iIGT4l3X7II58sE5
 W+Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7YvPMOX3jlyW72//sM7DWh44Lz7z2rpKZYf9sO+gL3Gk57oA9eNn414pmoSkCNXRzZjRlEedqNt0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxe2hdBjMBSR2SNgzTGjB9+mfraB/Cfnwip/FSsaj0L8NVLYvE
 3LxOpciVwVMrIXy68x6syHQUaDa+ySCQZbZ0zYKMTA3+KIM/nwYYiW9BWJsQp3zZRVWd8qPOnKz
 z4oYmeuRC4x/n9NnexZyqTxLloAr0lhLQtfQGtyDlxvIdVyhNNryNlirfo6gy7quXJMS1XGs=
X-Gm-Gg: AZuq6aLNwlXhxbLpwHRrF6GkgtZ7KeCYxo8KMkqXI5tfDIepigmqvcEHpfOIiYuf+oH
 u+fMC6+ONVGp/q4JUWW55O58Ni6RXNUN9NG/rI3Kn8nUTKrTu8MTenx/bwMd2LrGfx36zZaCY+q
 VBz/jf+QVyNvvCZIymUoKVchi+8PPYMaLmHNpJFoJN9bUI7eXYORwZ8i7O3nNBDPLJq9N5fTQe9
 TN68xbwrU/jCOn2qblcQWTphCaj7rNTkHDA1cG05soVaNAuR3/+kbRbAmpf4k0wXigkgNyHVJRn
 8xH/lRLc/iRt172JX8a9OEXhMazfxjzvJw8+18EiZbZA08lxHrlViTS4P7MWWejs2sNzezQPfwV
 9BFcMoRpmJyV759E75UrsV2qyTOKVrQnMj7OSajX88B8hBg2+Y1h9tEV4CDLqEgibRHTMojHj98
 dDViWI9edGDfdoWi0ocrgIL6c=
X-Received: by 2002:a05:6214:1c8c:b0:892:670e:e60c with SMTP id
 6a1803df08f44-894b07b7e86mr14217946d6.68.1769340611606; 
 Sun, 25 Jan 2026 03:30:11 -0800 (PST)
X-Received: by 2002:a05:6214:1c8c:b0:892:670e:e60c with SMTP id
 6a1803df08f44-894b07b7e86mr14217486d6.68.1769340611183; 
 Sun, 25 Jan 2026 03:30:11 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 03:30:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/9] media: iris: migrate to using global UBWC config
Date: Sun, 25 Jan 2026 13:30:02 +0200
Message-Id: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALr+dWkC/3XMTQ7CIBCG4asY1tIMPxlSV97DuKBALYltFSxqm
 t5d2hWLupnknXx5ZhJd8C6S02EmwSUf/TjkkMcDMZ0ebo56m5tw4AiMAfXBRzo1b0MBW5SmaQT
 TjuT9I7jWfzbrcs3d+fgaw3ejE1u/e0piFKi1CmQtrbGqOY8xVs9J383Y91U+ZMUSLwFRAjwDU
 kjU6FpQuv4DiBLAEhAZQOTagAOFrN0BlmX5AV3o64QrAQAA
X-Change-ID: 20260110-iris-ubwc-06f64cbb31ae
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2628;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yxvtY2TcUe9da2eqiOyfy+I+clyA9zCVHu24HYwUfeg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6+PTUsGvtXPFQGrsOHTPISCh3U3cXBSjbQv
 x4loN6j6VqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vgAKCRCLPIo+Aiko
 1RkBB/9g3KkwEkAJtt3dPWgX3Onu6us4HIzLBdpWi6pwUkmdyJRsfNJ5wM/IRUvP5lwERwSctcL
 rohYYLsxPRbtDqSU7ffnD8bLQ47mac9BD4iiLwc+PKUnw4eGobMk9oHnHNFXHWtjVirjIu4AOGv
 E4b4iYzrdGbRp4HF4ZdrXt8ziR9fcG0vw1c9mzexGdexfre7yySIzcdb39c5HpXD4OIJhyyFD/h
 EnYSa8MdO+oRknF4IYQEnAa032FYoQNJDK5N5ZU1NELxMAXtw1UeXFfWlLzpDC0b7pKPp8MDF8L
 bH/OgXuJnSxOkxWFSASL0ONMGvJV34tYWLzgtg3KseD5mtVR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: xEMtCV8Neyw5h63XNyUSKfgB_mSqqlAz
X-Proofpoint-GUID: xEMtCV8Neyw5h63XNyUSKfgB_mSqqlAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfXzW+i/sXyCyMg
 cVGvpm7O+tk/CALAys7Sin/Zw+8YfK9x9Rx5jhRiPfCg/yylRl7SkfEXnf8Ti9z7w7DWe9ED9cS
 DqLLeyicexfXYyzEksRerIrxlQAlBebE6kHQHyhmWBjvPE8DMrELpPGl56J7B+DvSy5YXCglr4X
 wdJDhsVPdIS4L4L42N40h80XVJqyC/Vqz6OQo8s7UcsaGX03SyhhCe5nX6xFOmRdK1NRTi6AVEa
 N7jIoazgj8w8EB9EfDXCcNgRq5eFGMStMBa7yre3W85iR1u200YiaVTIRZCI8IvEUr41uRixRMu
 J68DqNsz0cri0EcTf1r0Kv33w0LSvvKsndYJ8bHA28lwkrXEye300CB3b++onwL3xwYMrMrLglb
 IoiLIu5T49qXRZIAtiC8tswdXwGZJD29oq0LgfJr4N+2azbwlENCKzz/X6YM45f9dkj9SCS50Km
 rokwH00MGxecUwro4yw==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6975fec4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A39D080303
X-Rspamd-Action: no action

Having UBWC configuration in the driver is error prone. For example, the
driver specifies fixed values for HBB, while the actual value might
depend on the DDR type. Stop defining UBWC data in the iris driver and
use the global UBWC configuration registry.

Merge strategy: either merge SoC bits directly through the media tree
(with Bjorn's ack) or merge to the media tree through the immutable tag.
The drm patches will follow depending on the way the SoC patches are
merged.

Note: the patches are compile-tested only because of the lack of the
Gen2 hardware at hand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebased on next/master, fixing the conflicts.
- Link to v3: https://lore.kernel.org/r/20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com

Changes in v3:
- Dropped applied and unrelated patches (they will be posted separately)
- Include printk.h, decoupling the series from fix picked up by Bjorn
- Introduced additional helpers to retrieve the data.
- Link to v2: https://lore.kernel.org/r/20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com

Changes in v2:
- Extended the commit message and added a comment for the min_acc length
  helper (Konrad)
- Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com

---
Dmitry Baryshkov (9):
      soc: qcom: ubwc: add helper to get min_acc length
      soc: qcom: ubwc: add helpers to get programmable values
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration

 drivers/media/platform/qcom/iris/Kconfig           |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 18 ++++++++++------
 .../platform/qcom/iris/iris_platform_common.h      | 11 ----------
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 14 ------------
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++++
 include/linux/soc/qcom/ubwc.h                      | 25 ++++++++++++++++++++++
 7 files changed, 46 insertions(+), 32 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry

