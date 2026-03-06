Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ElHMxwFq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782CA225545
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556BE10ED9B;
	Fri,  6 Mar 2026 16:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eav/FiUb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKPsAuv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471C210ED8E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr9DM550304
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=f7DmKwVywjuTKzK4AuPgql
 wO5Fxt+zgxrdleTEw3DnA=; b=Eav/FiUbdeooWftx9IysP6JVjbQGp4Bpi80MY3
 SInWm0fJYweLxvpuWBGNIxDhLqaSCPZUzWSA/rKbXTL8wEckpFwdr0Ys3g7KFITc
 39Ya7ROZYt49QE/7HxjnWGRKJgsLKuh9qboTWm6knkivdrfsEtU6/LRR8Y6rcwLG
 xrplycSqw6bwBaz2mxa2zscuNQY/AWLUsKFaBWt83NSquiKvapiEiGLjTQHM337x
 hLUfLJbOAC5tMQgOdcKn2ECFcilkZsW08P/qkdiSCm8CHtOxz9moApNW19dwILlI
 SL4qk2nWH34UUg5pPHE4Bpwj0pITBg9kIQY2dY+QShxboy1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka65x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8ca3ef536ddso2476009885a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815635; x=1773420435;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f7DmKwVywjuTKzK4AuPgqlwO5Fxt+zgxrdleTEw3DnA=;
 b=hKPsAuv+E9XuspC6VdUKGPQ6EpMsQt/icg5YxlFn4xB/LprDIT3sm1c6bwEQ7Jv+RM
 5wppe6jvNHNTRcvjdkCunTyXXNENNwSJ/M3FmcioZJ67ZCoTKjG07GNk6wTbLHfI9W7v
 /Q35w0TR05niSpjWUUoZw8f/c9Dl+jm7k4Dx3GEbqeZjeccDtxTzAUj0TYhTWyomeabA
 JVg8MZGyLO8AwA2WSIuKQ4i76XifYCCES8Xsf5Py8642iHX0bUKnv81o8svu9pns+Yo0
 OtiwaWt9vhG6AF/5YhnyQs3pcK/yRJtY9iyzeFw/fx1+W7JVdGpCNu2b4o1I8TKpam64
 if0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815635; x=1773420435;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f7DmKwVywjuTKzK4AuPgqlwO5Fxt+zgxrdleTEw3DnA=;
 b=iUFNAhkB3rChxj6quqdrWTBkv5gm4n8iZyRrhm1B9NbyZnKcIqjmwZ1/Hmkoh8tF0l
 qhEknYSyR1WQaLthvbQ4giSaQOhSW4Qv9GwCvO0HP+Ime65jK3v1pATd5hwCnpe7LmsA
 IqPPCJBqcsPjILgSCaGxVNIyWfYQS02K2gv5ey3lUqUmRn7z8f8hkwzbyGA9rPlyXV8h
 RTSIT5y5RIwn3TQib0BZ6s/SgXroqUvcHCdE0hLBr3Nloqur6rSWhWaJ6WW2nQi1Shg3
 yOa4vkVZd6UlIUWVKbP8E0fWoyOQvXaEhycEwqrPr7GZAGaCgWRrFHVVjMVFj/owQf98
 ckRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCVtqz2Mrn8k31sXZhVBvnJvqqjAzVICkf9/ZgkPWa5m1Coe5TYg8yLcOH7bbIZ42dB8ogFuCzXHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPZ6g3mHhm678mL+VZbYLp03UQM//4fXpyIu7FICMi3tdBGABy
 EYOwjJwmg3LX4t7pjlcgxOzpvxs4uNNbSqaEqwK4XQuFlRHFTOwou3PQYUUT9VYikyOqyme656e
 T5mbm9T/ebvJ2NDQ/zbxn4XVqBjVAzr2eXTW2brWHnxNyn2wcXp7Sfkga1GKXGGFSUDvrZQs=
X-Gm-Gg: ATEYQzwvxe/nYjAmSWOIeLetjAI4rHbU2BQuF4Yi0t6KPO2p03tiDIG1gmw7v34iwK7
 ngRc6+WB0RdAL8kbGYMOyoPvKuSN0AgoJas3BwCwinFHCvMiHjst+KEdJknvqX3FGYQ/V16vc82
 kamlv6hcFVCoZGapfVVdxeMQqoVLH/Kb+X+B1AYPxPI99kD9WMXwBproEihsjqdY7VjX6v9f1CP
 cCJtBcjw4vti7QjgfTEZavd0hdIbPQoXdv4th/NWLYeC8W3f41DgnOB70qSAZEcDOiFVbUTCj8v
 /H/dHBd314IsKbVIppwOf7ciMPiV5L8uuGITeaAFfMBB3XdBIWjjtwh/uDRK3btUHhifz/pjZNZ
 H8LdEZi9v8XsQqr8CxPhbqgass7d8DoTXSzIsuxQ81WYa6YzVim545I5wRXz+2kSNjrwOBZF7s5
 mKdIJ4VCOzmuNP/LdqZQqb2mwOZzOdAwjnZIc=
X-Received: by 2002:a05:620a:f12:b0:8ca:123e:819c with SMTP id
 af79cd13be357-8cd6d3bd760mr356491885a.35.1772815635426; 
 Fri, 06 Mar 2026 08:47:15 -0800 (PST)
X-Received: by 2002:a05:620a:f12:b0:8ca:123e:819c with SMTP id
 af79cd13be357-8cd6d3bd760mr356479385a.35.1772815633999; 
 Fri, 06 Mar 2026 08:47:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/24] soc/qcom/ubwc: rework UBWC configuration database
Date: Fri, 06 Mar 2026 18:47:06 +0200
Message-Id: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAoFq2kC/22Oy27DIBBFf8ViXRQGmzHlV6oseAwJam23gJ1UU
 f49yN500dndK5175sEK5USFme7BMm2ppGVuAd465q92vhBPoWUmhUQhAfjqbp5nui35kxN6gqD
 JKSlYI74zxXTf1z7OR870s7bRepTM2ULcL9OUqulmutfTZEulzP76TLfbAARPOZVDKTDi4J3rw
 ZLZhv8AKTVvfn75+p3WfGARxz4ob4XSYDa5f2mrv+6Ucn4M7cR79MENUfVD1ANq63obFIwaEEe
 ByM7P5wsJHbBAKgEAAA==
X-Change-ID: 20260211-ubwc-rework-e6ce1d8eb520
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4128;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LVEC8YDeYt0+YXI8uhlf86j9fvAB/jpH4rPnw9P2IPs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUMy8F/PM8CFmkMna9fV4tNUgxcFUnfLPRwz
 kAyab3HTq+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDAAKCRCLPIo+Aiko
 1WX/B/9FAZ298A7KyypuWYq/l8KbuCgi7VAX+vD0SN/1Oa/D+mv7h4FfOKAnaga63rmOujZrGvB
 r3FBHK83DEh5VsmYaWKzed5l+bHiL0SHgH1tMpnYAsgiRP4LUvCENgLHD9tixxGkhaacHmRBRlf
 qvHAEKA1EcYXYl8xbRNOktKd/xRia9L0lf1gu5wG2qx5ByENnWIBYGmvQuwlHRMUTyG4o8Js1Nf
 s1LRj6hXP5oQN67IHdzJ+Ke/XBfhfSXQkTbABnKB6uaqiNCQBgHqKgDbbdG2L/2yKhAeWq6s9mK
 grxAm3W41Zv0VyMm/W+b2qKTN6HXM8ZRe+xIsxXuyUlB/bKR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX7KRzMs2gbZAq
 67Xu3Wc8y+HWV05kVkx1lIosI0E25O3pDgZTDJZM7uzp7FRhdhpOsI4a5Xje8q9bbShKMSCPcnl
 2UXfTPtxjjc/s+soCe9DAdJa/Wqsz44+vBmjoA8+oLkVonVgljtpZMgzU3EBipw8l5l6nB94+v/
 v/LB61pzaJcTXw9kSRIk8WSn7xaPJ43/vL6nIyBoTSCylonWtpnurmHnkswDpJrU976MFqxoUlH
 IZs02rK8UkR5HiJXy/sbUr1wfo4ngLx8pmB/QKzhkqohnRYy9EQgP6TSkTVwjXsosrMYvAVhr09
 4Ztb9x1FcRYDCUZ3rU8FsRTGQzc5uuA3GwW4tZmcZMFlfUt5HEXL4Va9VUuOYDPwh7BdDHP10vr
 PI6qbqy2RpJCnqWwY/Wu2/HH128XP/rTlARcs9FZYa1ECcYlxrZck+oHyVkikhPafE7fXBacetC
 iY4Cx9smTb0n70vPdCA==
X-Proofpoint-ORIG-GUID: 6Vptf9nme6d5f58RpgVn31my6nSF5s0P
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab0514 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CrYQme8I2PAYreAbDuEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 6Vptf9nme6d5f58RpgVn31my6nSF5s0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
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
X-Rspamd-Queue-Id: 782CA225545
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Currently we store several settings in the configuration database. Some
of them are incorrect or not completely matching the expected
configuration settings. Others are directly derivable from the UBWC
version. Rework how we handle the values in the database, trimming it
down to the UBWC version, HBB and several flags.

Note: I don't have a good merge strategy for the sieres, it depends on
other SoC/UBWC patches [1], which are probably going to be merged
through linux-media. Any suggestions are appreciated.

Maybe the best option would be to:
- merge SoC patches from that series and this series to the Bjorn's tree
- create an immutable tag to be used by linux-media and drm/msm
- Merge relevant drm/msm and linux-media patches to corresponding trees
  after merging the immutable tag
- Merge the rest of SoC patches in the next cycle after drm/msm and
  media changes are in

WDYT?

[1] https://lore.kernel.org/r/20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (23):
      drm/msm/mdss: correct UBWC programming sequences
      soc: qcom: ubwc: define UBWC 3.1
      soc: qcom: ubwc: define helper for MDSS and Adreno drivers
      drm/msm/adreno: use qcom_ubwc_version_tag() helper
      drm/msm/adreno: use new helper to set min_acc length
      drm/msm/mdss: use new helper to set min_acc length
      drm/msm/adreno: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set UBWC bank spreading
      drm/msm/adreno: use new helper to set ubwc_swizzle
      drm/msm/dpu: use new helper to set ubwc_swizzle
      drm/msm/mdss: use new helper to set ubwc_swizzle
      drm/msm/dpu: drop ubwc_dec_version
      drm/msm/adreno: adapt for UBWC 3.1 support
      drm/msm/mdss: adapt for UBWC 3.1 support
      drm/msm/dpu: adapt for UBWC 3.1 support
      soc: qcom: ubwc: set min_acc length to 64 for all UBWC 1.0 targets
      soc: qcom: ubwc: drop ubwc_dec_version
      soc: qcom: ubwc: drop ubwc_bank_spread
      soc: qcom: ubwc: drop macrotile_mode from the database
      soc: qcom: ubwc: use fixed values for UBWC swizzle for UBWC < 4.0
      soc: qcom: ubwc: sort out the rest of the UBWC swizzle settings
      soc: qcom: ubwc: deduplicate UBWC configuration data

Konrad Dybcio (1):
      drm/msm/adreno: Trust the SSoT UBWC config

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  11 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  91 +--------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c       |  13 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
 drivers/gpu/drm/msm/msm_mdss.c              | 122 ++++--------
 drivers/soc/qcom/ubwc_config.c              | 281 +++++++---------------------
 include/linux/soc/qcom/ubwc.h               |  95 ++++++----
 10 files changed, 196 insertions(+), 439 deletions(-)
---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260211-ubwc-rework-e6ce1d8eb520
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-change-id: 20260228-fix-glymur-ubwc-f673d5ca0581:v2
prerequisite-patch-id: 7982b5ad797f83303a7fc6c932c0c6973114e2a4
prerequisite-patch-id: 5bc7dddd09fcdb4f534f8468ab3ad51781667066

Best regards,
-- 
With best wishes
Dmitry

