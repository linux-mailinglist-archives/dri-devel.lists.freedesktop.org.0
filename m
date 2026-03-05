Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEMkGTBYqWkh5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:17:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C098B20F8CC
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF3810E24F;
	Thu,  5 Mar 2026 10:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRNFmW1p";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T90zTTq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAADF10E235
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 10:17:16 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AG4wG936997
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 10:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=LIadV7BRF9LYFllJ7Yhh2a
 +90a+1bxS3+rs4FMEgwds=; b=BRNFmW1pIXDzhhRsEW/L6PpmEuBklvK+bnLtYL
 u7wLidyxEqCt2WmaW4OwYBh7lo7EUNVH0uzi/6WhviZX2gE8K70CoHW33Xn2TS/k
 umby5dqekVuKmFzWCWpZ6P+sGr1jtncT5AaXceKSvxXZwnM/9pK/k7w0ALqIHhit
 9eQI0F/IYOqdUr0RzWFyDqS/9vOCod4GEQtronFlarpPw6JFrszPFVQyMG4sAnVH
 G5FvvkzC17rW8ZhbF4lATXGTyt7K+Oq1gOeZ3E+YivYf3GMAyQsKFerB6njzFQNE
 daWZ0cVMKBbZyxDT3KqveZaqzxxRAHLbPFAiH6TAKUJOtEnA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u1m7f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 10:17:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-506a936d7afso741174011cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 02:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772705835; x=1773310635;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LIadV7BRF9LYFllJ7Yhh2a+90a+1bxS3+rs4FMEgwds=;
 b=T90zTTq1i54ELPhtuM/Xo4AHFSLw36rRsw0nwbHHHhBMd7jmYlnY8wd1YltTKxfGtk
 lAK7my/9uY+pfEeE6KpCCWzZF0tTRo1/F1erIEgETTCXCfVZsO88ktOufyVMSC1mXZGh
 +VgZEQen3/eCxvBnXwgTjzIsdKJssUMIrPdUdkOQPxmpfSCfi9E6ZLRIseeql2NycSFN
 x2f1yIrGafaOYU1IzNUl8W3bUBfDCKpJUfycr5szMbSwjr0MLHrRmy4LFBZjWOttX8+A
 b3kp7faywYcC3R0yKilvwf6c8K4ILYuqBmiTPmRcARg7WQYlAT/kqdIB87p6qJiiJuB3
 h8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772705835; x=1773310635;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LIadV7BRF9LYFllJ7Yhh2a+90a+1bxS3+rs4FMEgwds=;
 b=mQMzftdHT6bVrrC5FP+ntSIovGeYG/rIoKPMrDEu19YnXsrrbbJAQ0jqXeMZRshXdg
 5fO2ppubKej6UAEF+7Fm5VQ929Zv/TI2llFkl1SxZBVIGu4Dor4e1QlfG/Bwj6gF7JMH
 4Qklo+Rq+2is0kAt5Y3WScEkVPF5DtL1dCAYB1cPAsljrvN0iyYjstIM8VZdbq+Ywkis
 nzUQO61Y90PyWWkCSz45hMWf8MdA4fWIC3yjYhO5tSqJg3dam14b0HUzkpkES9a+OYUo
 8dvemfExbRct9zbYOGK97Ts++0SXZsYgpPNiZ03/M6aNv6sCDwpGA9CzvXSpicayeFuI
 gYcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/urSIUiQmkIE7b6dgg4Wjxa0DLcm3/XOTn136owI8q1BMcf6d+nwQLH0Z5YLr/ywPyu0c7bZauak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnLp3hA7xyHLRStpOlJoRalmDBhrR61DmoWOH2p7Ij6iWkIB/F
 /D6TB1qOzJQbQnCwlJo2DxWOYd0gnzS28/FxmY0UGVjZQhwc97zZKUG0STGx6Gpu+PkOQX1Cw7P
 WhHMy9SB5O3t6NjlyyDw65ilDPnK41JzMa9iZ8oA1WjPvO4gN5/SgMUJQahb8HYkEqqSo23E=
X-Gm-Gg: ATEYQzyPBue//Vgem+Nqnah/jzHQCCPef02GZ2jCZUzM90ojPbMAweTXTsWqgxI3ojt
 Rlu4n29nrdH2ye0kZmrfzkhndqW3EtcSTRckHmTHeoIgHS60YXlANbYdcA98CaRpEUxzMvep7Ny
 5+emXz8ONUOvllQrBkS+sOr/zNAF+HtQ+YlcXxXlEHDFNdzsNc9yPRmMWnL0/xh5MeTrN1OWHgV
 ADdH/5ThcX+lRiznGgUfGuHT6I3MN5ULiJC0b+h4b6lavp3/aPjTz+nSFLBU4jGEYYT9Cjv3OZ8
 3ihoTooCy92LygYmhEAQz1Gxv3FWpfi7L/ZjUeSnFRL2U2q+TdhE/QBwh6JyEzvRuOklaJsDl+G
 YBdWxdnTZ2kLBAmGfmGNrSl7ASxciEOx8PxeJBPEAKgZwl/mqrhhYHsvxQIJmGxSA1ZSP+vy86T
 vSw6frQhw=
X-Received: by 2002:a05:622a:11d4:b0:501:4858:a6d0 with SMTP id
 d75a77b69052e-508db3dd455mr69791721cf.56.1772705835150; 
 Thu, 05 Mar 2026 02:17:15 -0800 (PST)
X-Received: by 2002:a05:622a:11d4:b0:501:4858:a6d0 with SMTP id
 d75a77b69052e-508db3dd455mr69791511cf.56.1772705834741; 
 Thu, 05 Mar 2026 02:17:14 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-507451cda0asm194096731cf.24.2026.03.05.02.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 02:17:14 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v5 0/2] drm/msm/dpu: Correct the dpu catalog config
Date: Thu, 05 Mar 2026 18:17:05 +0800
Message-Id: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACFYqWkC/22OQY7CMAxFr1J5PUEkTdKWFfdAaOQkDkSiBOJSD
 UK9O6FsZ2P5fcnP/wVMJRHDrnlBoTlxytcK5qcBf8briUQKlUFtlZFSGTEG5l+PE17ySbQY+66
 PzkbvoJ7cCsX0t+oOxy8Xuj+qdfqG4JBJ+DyOado10XdOYqe89cF458LQD3VvFVrdW2pJU2sGH
 eDjOieecnmuTWe9yv4vNWshRYjWyOhQdVu1z8yb+wMvn7+bOuC4LMsbcn1zL/sAAAA=
X-Change-ID: 20251125-mdss_catalog-3af878fb6fcb
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705829; l=1896;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=pKtXrrBm5cADdMiIG05brIdEdoiEsw5uS/LfS5KfQBo=;
 b=sazVMnVsTwYrtjRD3pS/v0hpCNtiD/J4kvbX49FrOn/ZZ2x1cf9GtFFmOhawB89i9M7kz9BgQ
 x6xXQ/e/w1LASlxRG+e6x9BGUXPUWsSkDeEvU+rHi+ktsvn1tYlvfiD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: BDjOwyDrmlg_Tsw3GqC4NXLOxy59XM44
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a9582c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=lNr4chmq66KuSy7Lpp0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BDjOwyDrmlg_Tsw3GqC4NXLOxy59XM44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MiBTYWx0ZWRfXyBUniz4CFSx4
 oMu7jJ5QOfVfZBz6Y9hsgB0Ppw3QwAZGGlJh85paFx5+mlHktkPaMYxCEmUV3HqT+hMYLV13KdM
 mfrdgMWd04t2iMsW9R+aYn+CJMOAPX/ns3wYQYk+7HXym1MpSWBaTMgzbcxWIT+RAVCAh2FRNju
 hrokkAfV6F5PP3OfoLKvtmfV23YNxIBpAZDSF813FTxOlJCI+jyF8LRb/Xu9yUAvA/asFDe98sx
 AmFestybDpo8fWAYbSqVI6IRP9xtVR+FJuuY2BBTrl4Uq+xIB36LSpEJoVbENOF0G6EHZuwH/Hz
 pMucDzQGt9ugNVrQlH5PgGcY8UCDbuMHpEXSGc8qreAwQuURTNTiN76zVTRMG/6lpQjm4t6o0Jo
 YGWsn8k0k0pHK5/tKGTZVqW2Tv3GT64I1E1l1BiUmiEz6I13FTCdeR4wBYzfBeU2viJ2It9eOAZ
 Vizd6uC5ljKI4jCz8Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050082
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
X-Rspamd-Queue-Id: C098B20F8CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_mahap@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Previously, the pair interfaces for MST had their type set to INTF_NONE,
since they were not used. We are now preparing to enable MST on the
platform, so the type needs to be set to the correct value (INTF_DP).

The second patch fixes an incorrect interrupt number on SA8775P, which
causes DPU errors.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
This patch was split out from the MST V3 patch series:
https://lore.kernel.org/all/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com/
---
Changes in v5:
- Rebase to latest linux-next and modify glymur catalog.
- Split out the patch that fixes the interrupt number.[Dmitry]
- Link to v4: https://lore.kernel.org/r/20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com

Changes in v4:
- Splite chagne out from the MST V3 series.
- Link to v3: https://lore.kernel.org/all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/

Changes in v3:
- Fix through the whole catalog
- Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com/

Changes in v2:
- Change the patch order in the series.
- Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com/

---
Abhinav Kumar (2):
      drm/msm/dpu: Update the intf_type of MST interfaces
      drm/msm/dpu: Correct the SA8775P intr_underrun/intr_underrun index

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
 4 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20251125-mdss_catalog-3af878fb6fcb

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

