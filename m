Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MRTOGkXdGmQ2AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 01:50:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D37BCD8
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 01:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CD110EC13;
	Sat, 24 Jan 2026 00:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2oYD9I6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6ldq6L2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4641310EC12
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 00:50:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NIZfTn722631
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 00:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:message-id:mime-version:reply-to
 :subject:to; s=qcppdkim1; bh=E1+ZSn1cNBpOl6A16P9deXIlpfWrf/mBKSm
 0Z7my9Xs=; b=n2oYD9I6D5s5ov1UktADzE9rvuqA3O/usfjhpGe+mp4n1TPP0QV
 EDyha2MRjAmsXL+v1FCOPfOFP+BN13mT2zPWW+QzLRiFHYgpibwv0d1s+Hk2B0/B
 yG0ayswjJ88zds1z0lTXgnOBhi4ZP712sYxoV0v95+hJ4G0uLTE2WeszfogYKocn
 4Gg2VCOR5FAZmol/lfUZjzpkrfAHY9xwQ63QWti3XnVgz+zPet/eGtkPVGNrn61F
 cho0wIKuDnXNxZHzHwkBnDPFc9oOuCEQmviJjTxN0GMZhhJV0tC4K2/1XWIYDPev
 8zxCRgCjUba1z40EUoB/F5gMtuYmvE8EFgw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv069ky7w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 00:50:45 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-12337114f3fso4052967c88.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769215844; cv=none;
 d=google.com; s=arc-20240605;
 b=FEmLPndxRsZZhmeK7t8kOtR/NR45Qu7ulYOrxDTRAO2hu3PAlnFlucpHOU3i+fKSTC
 3YzmEXW7Q7PGubNEBagLwm8Dvs3YDK8isqotKhaRz+9IfkPrD5Hg1USDhC2nnFo4aVbZ
 qvxe42TVz3zNXr9hhAwl1Xq5XNlQw30I6veQQM3uJs8CIIyYiODTrDNxHkEAKfhEluzZ
 sLzDiNcNI/rULmFJaJaSgxd8MCuVCd4gf59NgQFMZok0yYsF/RPaI+0ApJViesGrC8X0
 PV9a38wAAt86YXfE50oP1apj/Y8GevWDoENDly4buaBRjLKvOJI+0hSVwOfGCJnpcg1F
 hfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:reply-to:mime-version
 :dkim-signature;
 bh=E1+ZSn1cNBpOl6A16P9deXIlpfWrf/mBKSm0Z7my9Xs=;
 fh=KVBj1L2DKt0//O1FZ5st44uVCTtWeIkOTIgqq5G0lhk=;
 b=ZNm1duBb1O68g9BixJYnCNFFueF0SCfXAS6/NsoeIV8ZBYDUB/oXs4p7BMc1YaV0Pj
 Oug2MMg3i5FMoqzgm2s60hRPK7nuZIS6F0l46z4MOXvoNgbQmptrN1lboKCM/XVPBAaf
 IODmHSSMxThxkKQNtIIDOnXnmpclsytxECXGwFbEsEgCVe8YO7Bs/snALDwC7MQiuYZx
 h7VoJNBzhj9sqL+VFJBawjLi5P9ZxY/HFvwVO1Pd372NtqwGV2dH9d/+fCmKtIaxH7M0
 qzF9UEs5NLqgwtrxOx4CxANKt1JTCrCPQBzQjfBYzOWyssE2HqFw7OoQ8A0zz23dm2sO
 FQGw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769215844; x=1769820644;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1+ZSn1cNBpOl6A16P9deXIlpfWrf/mBKSm0Z7my9Xs=;
 b=i6ldq6L22SLCWY6Ogdellf+4fpuJc/Kkdoknwiez+JbTfmANzUOvAe0he7EJCflmMj
 T4+U6J1zgg0BqLiSUyjkYGD8BlG/j+IUe5J3RJZ4oJLWHI5AUe29AEQCQSRU7sTDw8Qo
 4GzI7ugGhxg/iW36gsH8cEOMZIJ0EULCszizzm9tTxThUHfevacGot7xfQCTlGWDZMPu
 JD29+Vw7k9lp5m7m0RbiRv89pysn/lI27nDYKXFF6RBYU4zq0clC0fAnrZ7YAY1IL5Yd
 xMW2ntk5juLVv0755r5J6noLcyc1aThDBJ4U3hrJSB37HH7j4/6eH+K9JgoNVc+SmfQs
 MgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769215844; x=1769820644;
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E1+ZSn1cNBpOl6A16P9deXIlpfWrf/mBKSm0Z7my9Xs=;
 b=eITbpkDoaw4QRL0hs6fHPubGYcpZJQPenuwIhsqbCo++vgJ4RfybaMeY0eQ/M6M6yH
 ZNAmRM0X0B7E6Gux9Fa7w1SNBVZhB+2HabU7CJa3D8D/KXqk1MPkur6CJ2fi4mKhvTca
 dFlYIDgWp2xrua5s4DIl6LxBTRYxDD8kBuyfP0yHgbQoa/5MldyO+b+Yjy5Es2skwV/7
 87NHM/ba7Lyt2g480o1xm33rYvVY69DaDXYLfgsx2S7p8aodc3oF99DfJCRcM4sMVpUC
 eL/CCm+1sV1pXUbSvne1n9Fgw4mkjpCrw1JbdRwv5zcguxIcHDgzbyHDz8qIn/CZ2aOq
 cYFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK5Jp+Trtw10kJIyjqRw2kMSKdmdcm+6ChmsnPv3CGezRJSOtAmkQDZwFoYedViJJIlUAmohl9KQs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfaQmX6YcEWrZfaeaEhQ2NnhMoHFULUHpA1P99Fg9j0lruuej3
 6rOPlDTEn4hPcA5UyF0m8E5xJ+hVU158wDX3QUglk/Vep834Y0YOpHP2Hd+pk51NUA0tkyn3p4O
 mHgLjOk4ZyhBBV1jeVpkUcJGt59e28zUZ+i3RSRIMxMqG2s2WmUXE9D7pmiB7l63HhxbsMsxRWF
 PwCt5rPmkzYhIBQX+QdRfT47uylPkRktI+OIgIKZ23aJjjZQ==
X-Gm-Gg: AZuq6aLQTpAlI8k60ftbsA/3OCHj8f1xQtNDp8l/lMhYbNHgdHohNGAgKHc2vNuRlHP
 YSJhJSh5FdrsbX6WyARVoNJXUQuWfoh7w04joewX+rc/vZ/m8n7sr/boybEUp/LB2AvBLaaHT8E
 8kzVIR+mhMtunUeaMfl29qJ5yeoqtSXdZD2F9wxz9b/jQRrNuPHLsrHg/0mNrvDD8sd8tG20DFR
 Sk4gAK2BbzmUUAkot1nOTUfJg==
X-Received: by 2002:a05:7022:1e05:b0:123:3461:99a4 with SMTP id
 a92af1059eb24-1247dbaf969mr2236335c88.17.1769215844069; 
 Fri, 23 Jan 2026 16:50:44 -0800 (PST)
X-Received: by 2002:a05:7022:1e05:b0:123:3461:99a4 with SMTP id
 a92af1059eb24-1247dbaf969mr2236311c88.17.1769215843483; Fri, 23 Jan 2026
 16:50:43 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 16:50:32 -0800
X-Gm-Features: AZwV_QhIn6cEGANv6cxLIYIViPvlMi8qso2Zl5jGvvZ3pkrPDHs1ieK9JRyVMmQ
Message-ID: <CACSVV03Sbeca93A+gGh-TKpzFYVabbkWVgPCCicG0_NQG+5Y2A@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2026-01-23 for v6.20
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=eLUeTXp1 c=1 sm=1 tr=0 ts=69741765 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8
 a=gUizIwldGzazjyWfi0kA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: GMakh6rQMxDJ7TQFkYKRL-ygem-ggbja
X-Proofpoint-ORIG-GUID: GMakh6rQMxDJ7TQFkYKRL-ygem-ggbja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDAwNCBTYWx0ZWRfX/pBd/YY5rY4i
 tNuoA1RQmAkUdTojaFCuIUvax3+HbQnISmwnViBRhjLdU+7ULMs8IZjkQGqltgle7z5PNwvQswF
 IVv5a+FRwbVhQzxuLoU4p2p54zQdbRwNO4VhJJlbBC55+VLUCGpS0nD8q3n+mXfJtLbfcP9nuK0
 1OqaSPIPeXmuWjzl1BdUuPKtLnqEY4OPDUu0tSlTb39C9/rHdwH167kHkxybBZ9HHXpRfkACp+m
 9bC18ZK580IvREljlwlvIPiHul6Uj95al2jJ5ZjrCuy39usZXooXZ0iNhTJkBeARW5AZv0t6NpQ
 2rr1jPTUo8e3jfcnEOPOSAq0rxdJoWCpxwSiA4pLiJTYioqb34rPK5TWWBzG63m0hO+8wCNUL/Q
 lt4XHm3Mdc/h5/Zmbe/MkLRtkOqWXwOq+/bKAmdDJXbdf30gJ2JXKBynUB5qwZA3eiVQItvDm8N
 6u9RihQF/7kX0inxRdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240004
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:freedreno@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:lumag@kernel.org,m:akhilpo@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qualcomm.com:dkim,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 910D37BCD8
X-Rspamd-Action: no action

Hi Dave, Simona,

Pull for v6.20, as described below.

Includes display support for Kaanapali (Snapdragon 8 Elite Gen 5),
Gamma support, UBWC updates for a840, and various fixes.  And also
a225 support for those who like very old hardware :-)

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2026-01-23

for you to fetch changes up to 50c4a49f7292b33b454ea1a16c4f77d6965405dc:

  drm/msm/a8xx: Add UBWC v6 support (2026-01-22 01:23:22 +0200)

----------------------------------------------------------------
Changes for v6.20

GPU:
- Document a612/RGMU dt bindings
- UBWC 6.0 support (for A840 / Kaanapali)
- a225 support
- Fixes

DPU:
- Switched to use virtual planes by default
- Fixed DSI CMD panels on DPU 3.x
- Rewrote format handling to remove intermediate representation
- Fixed watchdog on DPU 8.x+
- Fixed TE / Vsync source setting on DPU 8.x+
- Added 3D_Mux on SC7280
- Kaanapali platform support
- Fixed UBWC register programming
- Made RM reserve DSPP-enabled mixers for CRTCs with LMs.
- Gamma correction support

DP:
- Enabled support for eDP 1.4+ link rate tables
- Fixed MDSS1 DP indices on SA8775P, making them to work
- Fixed msm_dp_ctrl_config_msa() to work with LLVM 20

DSI:
- Documented QCS8300 as compatible with SA8775P
- Kaanapali platform support

DSI PHY:
- switched to divider_determine_rate()

MDP5:
- Dropped support for MSM8998, SDM660 and SDM630 (switched over
  to DPU)

MDSS:
- Kaanapali platform support
- Fixed UBWC register programming

----------------------------------------------------------------
Abel Vesa (2):
      Revert "drm/msm/dpu: support plane splitting in quad-pipe case"
      Revert "drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case"

Akhil P Oommen (4):
      drm/msm/a6xx: Retrieve gmu core range by index
      dt-bindings: display/msm: gpu: Simplify conditional schema logic
      dt-bindings: display/msm: gpu: Document A612 GPU
      drm/msm/a8xx: Add UBWC v6 support

Alok Tiwari (1):
      drm/msm/a6xx: move preempt_prepare_postamble after error check

Anna Maniscalco (2):
      drm/msm: add PERFCTR_CNTL to ifpc_reglist
      drm/msm: Fix a7xx per pipe register programming

Ayushi Makhija (3):
      dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
      dt-bindings: msm: dsi-controller-main: document the QCS8300 DSI CTRL
      dt-bindings: display: msm: document DSI controller and phy on QCS8300

Brian Masney (1):
      drm/msm/dsi_phy_14nm: convert from divider_round_rate() to
divider_determine_rate()

Dale Whinham (1):
      drm/msm/dp: Enable support for eDP v1.4+ link rates table

Dan Carpenter (1):
      drm/msm: remove some dead code

Dmitry Baryshkov (26):
      drm/msm/dpu: fix WD timer handling on DPU 8.x
      drm/msm/disp: set num_planes to 1 for interleaved YUV formats
      drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
      drm/msm/disp: set num_planes, fetch_mode and tile_height in
INTERLEAVED_RGB_FMT_TILED
      drm/msm/disp: simplify RGB{,A,X} formats definitions
      drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
      drm/msm/disp: pull in common YUV format parameters
      drm/msm/disp: pull in common tiled YUV format parameters
      drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
      drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
      drm/msm/dpu: drop redundant num_planes assignment in
_dpu_format_populate_plane_sizes*()
      drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: use standard functions in
_dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
      drm/msm/a2xx: fix pixel shader start on A225
      drm/msm/a2xx: add A225 entry to catalog
      Merge tag 'v6.19-rc1' into msm-next
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+
      drm/msm/dpu: correct error messages in RM
      drm/msm/dpu: try reserving the DSPP-less LM first
      drm/ci: ignore Gamma test failures on Qualcomm SC7180

Evan Lambert (1):
      drm/msm: Replace unsafe snprintf usage with scnprintf

Federico Amedeo Izzo (1):
      drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property

Jie Zhang (1):
      dt-bindings: display/msm/rgmu: Document A612 RGMU

Johan Hovold (1):
      drm/msm/a6xx: fix bogus hwcg register updates

Konrad Dybcio (1):
      dt-bindings: display/msm/gpu: Straighten out reg-names on A619L/610/702

Mahadevan P (1):
      drm/msm/disp/dpu: add merge3d support for sc7280

Mani Chandana Ballary Kuntumalla (1):
      drm/msm/dp: Update msm_dp_controller IDs for sa8775p

Nathan Chancellor (1):
      drm/msm/dp: Avoid division by zero in msm_dp_ctrl_config_msa()

Neil Armstrong (1):
      drm/msm: adreno: fix deferencing ifpc_reglist when not declared

Nikolay Kuratov (1):
      drm/msm/dpu: Add missing NULL pointer check for pingpong interface

Randy Dunlap (19):
      drm/msm/disp: mdp_format: fix all kernel-doc warnings
      drm/msm/dp: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
      drm/msm: msm_fence.h: fix all kernel-doc warnings
      drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
      drm/msm: msm_gpu.h: fix all kernel-doc warnings
      drm/msm: msm_iommu.c: fix all kernel-doc warnings

Rob Clark (2):
      drm/msm: Fix x2-85 TPL1_DBG_ECO_CNTL1
      drm/msm: Fix GMEM_BASE for gen8

Swaraj Gaikwad (1):
      drm/msm: Replace custom dumb_map_offset with generic helper

Teguh Sobirin (1):
      drm/msm/dpu: Set vsync source irrespective of mdp top support

Yuanjie Yang (12):
      dt-bindings: display/msm: qcom, kaanapali-dpu: Add Kaanapali
      dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
      dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
      dt-bindings: display/msm: qcom, kaanapali-mdss: Add Kaanapali
      drm/msm/mdss: Add support for Kaanapali
      drm/msm/dsi/phy: Add support for Kaanapali
      drm/msm/dsi: Add support for Kaanapali
      drm/msm/dpu: Add interrupt registers for DPU 13.0.0
      drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
      drm/msm/dpu: Add Kaanapali SSPP sub-block support
      drm/msm/dpu: Add Kaanapali WB support
      drm/msm/dpu: Add support for Kaanapali DPU

 .../bindings/display/msm/dsi-controller-main.yaml  |    7 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   31 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |   85 +-
 .../bindings/display/msm/qcom,adreno-rgmu.yaml     |  126 +++
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  297 +++++
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    |  102 +-
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |    1 +
 MAINTAINERS                                        |    1 +
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |    4 +
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |    4 +
 drivers/gpu/drm/msm/Makefile                       |    1 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |   12 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |    5 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   17 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   14 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   52 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |    4 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |    4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   13 +
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |  492 +++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |    5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |    5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |    5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  124 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   47 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |    2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  174 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   45 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |    3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   84 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h         |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   54 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |   32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   89 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   49 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |    1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  180 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  103 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c    |  321 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |    7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |   18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |   16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  137 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   72 +-
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h     | 1155 --------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  314 ------
 drivers/gpu/drm/msm/disp/mdp_format.c              |  614 ++++++-----
 drivers/gpu/drm/msm/disp/mdp_format.h              |    6 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   80 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |    2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    4 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |    1 +
 drivers/gpu/drm/msm/dp/dp_link.h                   |   12 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   93 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    8 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   13 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |    2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |    7 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   23 +
 drivers/gpu/drm/msm/msm_drv.c                      |   24 +-
 drivers/gpu/drm/msm/msm_fence.h                    |   36 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   49 -
 drivers/gpu/drm/msm/msm_gem.h                      |    3 -
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   13 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   68 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |    4 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   12 +-
 drivers/gpu/drm/msm/msm_perf.c                     |   10 +-
 88 files changed, 3051 insertions(+), 2551 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h
