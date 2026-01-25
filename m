Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wErCN8/+dWmDKQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A818033D
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B4110E2B8;
	Sun, 25 Jan 2026 11:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzX9Zpij";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6dVZSFv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC4610E2B8
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60PAkqGV973873
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZWyU5iLBcslHTuzqAkiDaYWx6VDtoZBu/CjOdAj1NDk=; b=HzX9ZpijRRWNYdG+
 BzW6dFzlHeJl5zCl2DxawFhP2HpaQyW2PXmLetlcn5XBmX/lnD8tfItkcIP7jUhV
 SS+kp4Z4peRcp/Lt4O7ZreSOKTLEwbVqu58hK2MHETOz5NYS8x/m7j1D3Xp1w2Cf
 bmob68oxBoJpI8SwOtnzNL6feONebdK9MDLqcz8M+dbxdPSEwVfAJ95apx+FGVYd
 +QgG/Kqf01fgCMd1nwuYkoVuANSfczeDkbA+JAHvUrIYxWGbYT4gflMWjTZrkH/7
 Du1j+n8mZguCuZMMZUQicz3ZRKMGWxCb6NeDqB3IoRgl95vq/J0fnr0/KUTAL0Qy
 IUWDBg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dj1gb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a2e9e09e6so176012066d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 03:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769340616; x=1769945416;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZWyU5iLBcslHTuzqAkiDaYWx6VDtoZBu/CjOdAj1NDk=;
 b=W6dVZSFvgVv3ma+OW9/PSfc7DgHa0xyyimGHMC4ts1QQIJIeWhRa2Y6O0rZp53P/fZ
 0qllQd50s52EBUaHn9ZYNG7DNhNlvKvwjSxFZ4WHd1sgQUeLNarnynNmX3Kt9vLLgHcs
 OPGp5WZHju99KA4OWRqWZn92Ji04v8NjyZ8wV0mVVZlaMarIyKY0OZZEOPYalWOPEHKp
 Ck6jZVbZTZMUzyxzulur3rV60pljab92LUTaFQeDR1gHP6Trxy9YQCpkxsigyLiJj+7/
 pMT2RVF6+MEFnTBBiTOypCz7c0ECfO02SrgkQHGr76Vz4vWT5QFaFrhjvnJWytvk5d8d
 Auhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769340616; x=1769945416;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZWyU5iLBcslHTuzqAkiDaYWx6VDtoZBu/CjOdAj1NDk=;
 b=TgBvq+68zbDmSiyLIyFXHM7Zf4xsj9yNxAErPkoZiukdsKzlsX71afq4/NyVI4VC60
 mNF9iNNzHIOW1HsrsPYRZoIocJPB2jVJsPDyOEWRC1Xz/4UGGXSyKjc6vAy30i4bqZma
 1ETLa6rytiwn0yy5tFQDUhcMNBc6/g8U1cKn1S6AEgpWm2go3Kw1Qy10gSTFthMaz/mf
 RYSBOPiOY4sPH7jXJ1+1KYEki9MLZzZdM5RSMi/wuhtvw1VJIBG7iLR6wm8xWHtwOniV
 D9NSxeMsW4uqe2WcLhQ9fMwYK1KFJeD3raL2wIetj2RLtXei6zbRZL3IGBNmj/pcgVpb
 Sg5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0doxmJd+4wg/AFWXSjfT9LkoeOYZXuXKtxZ3YLxS+osI4/xw/sw/VzP3VeyqnOyyNuj1vQnJrE0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDelFxsOrgGOEcNsrSBvuZrDEzsJzZwoIRqgN4nXSw6YlurKd7
 /Q4JGFlQljPf5TZm+c6Efjq4JSr3CLo81q48Ky6zF37pu0o8iwu6dUCI9E1y6IRSi95Ft/GUdXK
 EyUQMaSxuijvRAOow+ktInVtIsGqMCkCHZz6FnTS6cGb2mns9ffkXUSvrSqmmgy0nCTsB6LM=
X-Gm-Gg: AZuq6aJZZfYv0tgwjvii4K+uZ+hRicAOC+uOuWSlg8rp6H8LVAe8oWxqztc18xOVAYj
 3DY+hQgeDm8CcGFmsQYdV1KbJ38LmGW+oph4eV4lAqT+tNZSvoL4w3OkotMQCH9G94BpttlolU4
 S6zFPsd7bMyJa3aLaLomeZlVrIlmE2ndx/DhqdunYNAecTQvibgj+VJV4IWIlm+A3pl6YobqHj6
 YUwUmlo+0Pc+ablA/5+8UKNRy7j3TSsljgmeiDZdGzzTJfzX2/A9WpaAWdy30m6aXjZ+kvrbtMr
 N9f/jU8Pr0RimrU4AmdE2e8bbUfx/5O0wy0bCPPZSjmpScLQTq8CDZT/rrdAQf8DSgpiCgmF7uq
 4OodfSU+pgXZHJZsWto8jt1Z6Zw2AguP+5cIrBXOslPcWl9VTuV5cVLgFus1g4hXXnb37S8YnMm
 y2PrhbinVjQshp0vc3YQFxrA0=
X-Received: by 2002:a05:6214:301c:b0:87c:152c:7b25 with SMTP id
 6a1803df08f44-894b06cb233mr15709946d6.13.1769340616182; 
 Sun, 25 Jan 2026 03:30:16 -0800 (PST)
X-Received: by 2002:a05:6214:301c:b0:87c:152c:7b25 with SMTP id
 6a1803df08f44-894b06cb233mr15709786d6.13.1769340615792; 
 Sun, 25 Jan 2026 03:30:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 03:30:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:04 +0200
Subject: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
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
 linux-media@vger.kernel.org, Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EVY6tWzslv4AHxvSFMySxldw7RL/nbikmol0sYNXrdU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6+2Qgol13c0DjNgwyXJ5JTgAJs5JFoRZAeE
 ea6G4tgkCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vgAKCRCLPIo+Aiko
 1Z7NB/sG9VpkDf09AkabCBI7DhBitFyP1ZPKOk3ojEwX2wkoXQVXsCPiYxUDI5rFMPGZRMKwToY
 IvFIzI49YRSxGuQIKnNgzQ5qXvj78pwquFXZ9J92+/ri0tjQFq5s1xmK/l/OoQSj7E31gewaRKf
 UsKNUCseJ/TSxaWxK7fPCdupRM+cn1BAk9x24wFpwIyCPpfs2BWQfNWxBMChe5PVHZntNsi5DCe
 /lutMN2ZhUffkNA64Tmq2P1qrSuN/UmAYGY7C0DMBezqbkEbc6cc0Ri9OOBjuQS+RKqVc/4L0qW
 SvyGNnLtibbRUjYS9jt1mzpkCXSZFLHnd0UE2OLD9taWsVY0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfXxMwzbZCA3spU
 W7Q9GX2pH7dV2tE+cPXFuMSRUebXqF4y7156vj6Pod5k9jHD+UFDcIKXatg343onZ61n9jmT1Rn
 353s4C8tQqn9/uLAu6sj54Ev2jYXc6i0s0H/GZHwpHbxCRkTR+S7WwwCcjrN4REo7HKrkJgONps
 1+tAPOPpPaaS9+fl45zMu8XEnayIGxrdvfLqB7sN3X9GT4+JyRZ7O/N4xYDxeZIjIe+kxl4dWkR
 DCNeY2b/9i3vMZNpdyrN8mLg08jy2T9r+PaGa38vGye/QyT028D8vvecO7vabScS31/hn2Ya1K1
 gv2G6giLxU62igwqq1EN8KQBWYJ+kkyYwO2WxMt5LQvE4e0LuBfRlE60oDWYLj3djyEJkDVEXXO
 BsSapdYNdaJrkpK6TDuwFx4q7yG+cGaim+TrKoM8Nxku37Dq6mwBLS5INVQfrThBSLCRqY8S1Ry
 nXiPTdUj5uJ663VBE3Q==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=6975fec9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0nnIczzv09DC-zKiMkwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: GEnM4rCUuFGC6WBCngkN_kTXSjyG5qMf
X-Proofpoint-GUID: GEnM4rCUuFGC6WBCngkN_kTXSjyG5qMf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
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
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
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
X-Rspamd-Queue-Id: 83A818033D
X-Rspamd-Action: no action

Currently the database stores macrotile_mode in the data. However it
can be derived from the rest of the data: it should be used for UBWC
encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).

The ubwc_bank_spread field seems to be based on the impreside data we
had for the MDSS and DPU programming. In some cases UBWC engine inside
the display controller doesn't need to program it, although bank spread
is to be enabled.

Bank swizzle is also currently stored as is, but it is almost standard
(banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
being Lemans (it uses only bank 3).

Add helpers returning values from the config for now. They will be
rewritten later, in a separate series, but having the helper now
simplifies refacroring the code later.

Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 5bdeca18d54d..f5d0e2341261 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
 		 cfg->ubwc_dec_version == UBWC_3_0);
 }
 
+static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->macrotile_mode;
+}
+
+static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_bank_spread;
+}
+
+static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_swizzle;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3

