Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJBEI0vkoWmUwwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:36:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3017A1BC0D6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7009E10EBE4;
	Fri, 27 Feb 2026 18:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpkKw+Pj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUdoKURD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8803310E126
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:52 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0G9R151834
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=CB9jX71PpJqF+vh9iq9cLa
 VFVWZdgK9XYLhA7xMJoBE=; b=HpkKw+PjW+36Epukk0N6Wiv7Dt/Q5BhBzCgRY0
 vv3Y9dpIAjYLUceimbRlZmmegPUOie6I9saVZZz1mIoUz3cQ9EJ9y88fNAFI2dJq
 EOBrcpH5LaidTYxQNeOetylS8UOkRwR0J3iq3JbmXLNMe30uHj/97nPEEyIlPjfK
 G/1XEOjs+q+Fh9FXVjzi2YhUfC+iZP41mQR6QLFlvZBwO7arpHGuTM+rkPrdnJgq
 03ntD+aq8N2GyNAOg6268/bVFLQi6K3v5/D3rh/Z7CPq/Qx5I+4ON9JVGcxqRf9D
 Y5DG6Iz2pdyX87LIxH31XhkfUOUuyWRowI/BFo/oUOTs74Qw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r4jyh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c881d0c617so1645624685a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772217411; x=1772822211;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CB9jX71PpJqF+vh9iq9cLaVFVWZdgK9XYLhA7xMJoBE=;
 b=jUdoKURD2MIj2zRnRCRmeXdRwWy2lT8WK0/faZq36QEOJwpHexBwYAXZXBkgjwp48b
 zCAty+ABWg1qLcami3ARVsesu8GAbLyHqxSKcgRYIevuCpJ8rc+fpyKyEZq1VkPer6v4
 5+jUCG4AcIbB1pFKOs4snyZiCacWk5qAMArqhBIoMBIg+yq2sDK+UwOwdQL4dz/ptx3a
 4sKzawu4vZ/S8hs+/ZFkbGH80ZpSU/XWGzcht0BRq4w53ElbRgIsCxAfB9DGDE5DnI5c
 9ImNBnQ6zjZw75DW2bxjSiP/3rsO3JasbFosCib72epmtUXG1cXto9uZh5zbeDMkS25F
 nEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772217411; x=1772822211;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CB9jX71PpJqF+vh9iq9cLaVFVWZdgK9XYLhA7xMJoBE=;
 b=f2m6QmJUn0djX5m0pATtf0xZkEUB6hkHKpyXfguo1Z/6oaa0khYRbM/XI5EVSBr3l6
 N6/gEEfHZ30gVy+9P3Wi/gXfnfLdWLzdp8KdfTFOuIq+939gobqTCHD4pmhmH7TkxwLF
 KAX5ZqEa8Xvfh3fbEoPtUfolbb0J5I+P94bzPkLtSYbADaz3+r86qu854yUl3evq7fMz
 Mg0DI84fh4hE/+WXHsMxOl8yvMUjoUgRrsWsOJLHJWQfs2a6iFQeGfQ5IVAsNuvYW7/B
 75LZUrYi7g5e+Pasc5hUykEnjGmgSDPHyenrTs1gmqC5o3uUk/+/WmfxLXl260JGhqbm
 WLYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR8+08nWTBHmZfZh8wSa3pUG1lxXtOdsxcvq+mAtvhTdxgOpTsvKjJQ1lXtZRajoINWwLhwZLMCVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+9VaOcJD0ztiCay7BsuxktJQW65nhVirK5Pby0wIm6mbDfPC9
 PqecyotgRCXtbfLmMKf434nlu7HU3KW8m7XG66IPy4Nr9/sZr7TN2qn47hIxbDZW7+7oYCFp2zj
 fNQPI5aS4TO5lzsaCKIVZVvuu5WJh1Uo5P4xV0vNNlWWqKcZ1oNPAFylg+6RuRx6u+zARcc0=
X-Gm-Gg: ATEYQzzvcPNBEflqvI1edD25L0Q6MeTqAKqxt9BFnBze1kQTpb9etQWn6GhRujB7kVx
 lsHXQeVq9ZsWEifqdiY6lviOpNbhX2oT8/tKivpYXrLGEBTIk3AlFb6RinK5O3E1VGZHOBokzTV
 74maMBu17wIymHo3Ky7+uOH6XrguUI7rOe2acqR5en1se+BOIqKfUmMcmpModRCTqRAFOkdT7L2
 7Hu82I6Qa5QKnxNF0yY5AjYouMhQz++j82SvNkIKjLm6KvUnm4UleWLpRYWHO8hjrAM92W512PC
 JnDR1FaJh4mqBJps6AVD5DAGlz77KUOoEoD0TKn0lViILa910S0gGMw/jbxVIdv7pi/B56YHBZE
 COSlvRJeZ7/pLEOnAvxcKsAMgJLFEt7Zp8b+ojdivaZfvzaHVU2aMnfnp9EbAbpO4dYIRnpvzVi
 ssPMjdnWm5VmGNhuwsW0rRKHMuO5h1Aj5jjdI=
X-Received: by 2002:a05:620a:44cd:b0:8cb:62c3:3690 with SMTP id
 af79cd13be357-8cbc8d734cemr502725485a.13.1772217410678; 
 Fri, 27 Feb 2026 10:36:50 -0800 (PST)
X-Received: by 2002:a05:620a:44cd:b0:8cb:62c3:3690 with SMTP id
 af79cd13be357-8cbc8d734cemr502717385a.13.1772217408861; 
 Fri, 27 Feb 2026 10:36:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 10:36:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
Date: Fri, 27 Feb 2026 20:36:39 +0200
Message-Id: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfkoWkC/x3MQQqAIBBA0avErBtQCaOuEi0yx5qNyhgRSHdPW
 r7F/xUKCVOBuasgdHPhFBt038F+bvEgZN8MRhmrjJ7QS8p4Ow4Y5cLdjX7Tkwo2DNCaLBT4+X/
 L+r4fpX0iB18AAAA=
X-Change-ID: 20260219-drop-vbif-nrt-cb7da190f6f4
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4303;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JAVhVbhVQlCqwSiAyvYiIJKF2fu3vIOqz6xoppA5iS4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ9WxlAWyJ4gaCXA2VS3F8Y+w2k7S0pIPJHU
 r6Y5z2vJdeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPQAKCRCLPIo+Aiko
 1V0NB/9pGOLAft/TuUuE6MJPAQxftVZcFlhBWnUO02aTDnmgyq3uamXF05INx8RLzFFRl1WPLt2
 d5QN74IzmPipD/9BEUh7OUEYhWZtS9YweyXp86HVSNW6alH1x+nuuuyUX55EIhmZo8ivOlA9uq7
 fgPB+6n1V5G+50v5cY6jIMYGGl4wfHIgJk262jO8PFUCn/mUHCD0rSEQ5GcQD+EpnXYwlbX09LO
 CaEGEEu/X70x5Z2lBIiotB6LxTVJDzYSaJEa21xt3TcBndPjFHsdpcbWjdlmF3bikW4fpsJL4Ob
 TiQHvYzyyL3cVinclKppEAJmtPQfAqbfOxbc75fzPZvpp79j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfX5lkbluVXMcMc
 qQDQFn52yy/aA7wS+REYpALze4ma9CcDY+X1rz5nWr5P5zd7GbmRG/F1PHgYw+OrvQrLGzWvDb+
 b6403ZHSW/UuEsjWDvOhgyBO9l6IG9dxd2bhuXYV6rU0BVvL9l9wlJC16zxhhjyYRydkDBrgV34
 RGukbiXv1WRbgmm19BpnV/gnPx97ipUe7KGtDTyHSPLLpi1E0KYGVB4vrx6WSUvZc05canVwiKy
 fEEyI40Mcx3uDPdPBTxJI83HkN0Diraoq9K+gOZ2A3fyPtHEFBBcpdjNBp3CN0uoehkKorLYvHc
 tw0oa8OUPzpu9MC9+q/ZmFM7oclZebeYf8Y0r47NBMm6DyWfjrnwsWUKSpOepDO/DRC2SUSub45
 e5JUV5Zca/4Fhk1H7yQVrUBqshIfbSmC5yzpQf/i2oNMg9s6y+3mZ4IzBNO7KXRp/+2poSqjdtN
 guBMwJpzlfRTbtuszSg==
X-Proofpoint-GUID: jtLRJ3731QNVDEIdQor4la-KI3sWBOMM
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a1e443 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=T-p-S-tFZ4_u2FNYb-YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jtLRJ3731QNVDEIdQor4la-KI3sWBOMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270164
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 3017A1BC0D6
X-Rspamd-Action: no action

Once Konrad asked, what is the use for VBIF_NRT. Answering to his
question revealed that it's not actually used by the DPU driver.

There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
VBIF_NRT being used only for the offscreen rotator, a separate block
performing writeback operation with the optional 90 degree rotation.
This block will require a separate isntance of the DPU driver, and it is
not supported at this point.

The only exception to that rule is MSM8996, where VBIF_NRT has also been
used for outputting all writeback data. The DPU driver don't support WB
on that platform and most likely will not in the close feature.

The missing features don't match the extra complexity required to
support two VBIF interfaces, so drop the second one and all the options
to support it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      drm/msm/dpu: drop VBIF_NRT handling
      drm/msm/dpu: stop declaring VBIFs as an array in catalog
      drm/msm/dpu: replace VBIF-related array with bare pointers
      drm/msm/dpu: drop VBIF id, base and name from the catalog
      drm/msm/dpu: drop vbif_idx from WB configuration
      drm/msm/dpu: drop VBIF index from the VBIF params
      drm/msm/dpu: drop VBIF index from the struct dpu_hw_vbif

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  70 +++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  19 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           | 163 ++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |   4 -
 44 files changed, 144 insertions(+), 296 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260219-drop-vbif-nrt-cb7da190f6f4

Best regards,
-- 
With best wishes
Dmitry

