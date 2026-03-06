Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DdpAstZq2mmcQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 23:48:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAA2228639
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 23:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF4D10EDA9;
	Fri,  6 Mar 2026 22:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpjziD1q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPp5yxh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A41E10EDA9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 22:48:38 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626KWXd02623969
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 22:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:reply-to:subject:to; s=qcppdkim1; bh=oMUaOh6YZEwrJ
 P6PXRf60XJBVPb36qvAj1oolI33MWk=; b=ZpjziD1qM2MB8Z7mx4oo4106BiG6x
 EgiujczrfDPgrCv5CrY43YLSUxPeDNRwPb3s9b5ZsLA5U+HaQPJpQm4UT7qc5V3v
 HscwjdyVfi7I6JKzGqYQ693xSzSZGrPaDpo7GiqgHOGc3rZmSK2iSOIOx5Q0AZsu
 Gv4nEEzLhSso4cFISEb0iHOWGxKIkkCeiznqC49cFhRhdWVw1eLxDWKXKrKLLJZC
 FfylnibA5QLXDLSTLH/TCU/ytTqNdDvPFa5SYD3w4DvakaP5tt9IJTdUSYAzIK06
 c2SW10BPd4DkHMuq950rNp1j8n3UJlhOGURpQAcx6PUlmAgZG5FMM+WQA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ajfe3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 22:48:37 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-7d4cb5810a0so61067907a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 14:48:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772837317; cv=none;
 d=google.com; s=arc-20240605;
 b=dsvTp54cmGgZn6vKoB/VB6qTo0OIufd5uOCFPhdqeiNJjKzzwRUDelP9AvMSej6ocD
 pAvEmfMEgi+E21pKXDuVsjjutdFfFRRnZFrXGuqVwCPG2HVxvjyIM39CUxV7ZOnrtz5I
 Ajmd3kjI26Owf0NuYmyMaFyy7cAYgAv/s36jHGHdv/l3KuTGXnJpy+6Y4AY7uhCbTWJo
 ak/qQNOL+eL4kdEjcnJahzRc0IAjUdD2SclNyFPJ+7xVTTdweGA6SYTH4O6JHBPcnzW3
 kFkrKOeNlx1sIGygM95xKuZMfMMKJxJNDUbbll2AvAY5pif8mlUNEqwdrGglA49bOFH+
 f5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:mime-version:dkim-signature;
 bh=oMUaOh6YZEwrJP6PXRf60XJBVPb36qvAj1oolI33MWk=;
 fh=0IoYQx3+FKep+BhJeVnH5PgpeGjAYTZ2ESLYVR2ZKsM=;
 b=awBYqLz6oF+pd57uZDBGqe3LdlmKscd6+X8cBIv5dfu9zxfLvTnD75QilMM6cu2cdJ
 JT79/42xOOxL114Z4XvOcAGz7maWh22KTsXAAOvyRDXkjvjR1XL75svXHInxAe6WtDGz
 awMMzIfjQ/B4UoiDGVBNm22gxhFJpBxNMKNoc4X8OfMiof12NrT3C3kfEVoY6YD/Nv0A
 QFsAoJXIEDno1j2tjRL6w++2G2QKNRtPOPwhBY8uL17nQrU+u+jw2ysuZ51oaM9U3R6x
 s7gPdRqtqReM6mN8D84ce/b6ixISi2dFkrDMaekepHmuuG2xaMXDrsgLLgb2ITWKkpVD
 bmcQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772837317; x=1773442117;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oMUaOh6YZEwrJP6PXRf60XJBVPb36qvAj1oolI33MWk=;
 b=fPp5yxh6vj5kFHw2viazSQoIFNMf03f+OfQSB4b0Be+KWDv6z9aPCXRwrlAlGjlpO3
 22TQ7W3jHu+1sMI2/0v8bJm/3+IHBbJim8zLar0YGe3U77FBE/euk38x+4Uj5rDQ0rEz
 xviH8rfkZNhFsAdSejUhh09Dyh9M8NJ3RsqIfRgq7CdpcBzOJjjYdXNeBhmXl5ZUC9Ul
 ZnB2D+Js+NX+0Ep2WvINL2h2os2mC8dXftM9ysT8ky0Gr/AjI2JSpHRJM990Dowo3kxD
 HAwmbeZEIjCHvgEUJIrp0OzjxynirLxNGb4fdnjbYcUgJKSF75NT8RDDQmu1JIqdJq+F
 QkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772837317; x=1773442117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oMUaOh6YZEwrJP6PXRf60XJBVPb36qvAj1oolI33MWk=;
 b=qYHBbVUvfW7MzfM3lEIPBKxB946QgZyXrTDsWnnchMBkZq8vp8l9TKUgk5iKtZy/n6
 /q76E++P/SPVc4N5TRFWeFyub9HKDn9tCudDms4JfP/8L7OOmTh5/VYCmLU3gKLlFWAM
 TbOasPb6debaDAHyf1Zqj7fV0ypfPd9b52uq+Ey0BkpVlRxUarwWGJ6aHlUj69baZKXK
 1egPj63p9BPLzojkaZYsYRmpELXAVKBdoP4COI70DrgfwS4lnut5FvcwCUIQuvXji9Np
 SYMp3tEcVkXpDfhcCqZNk9dbiCi9sIzLbc8vZAOrB8EC+5GSgZu4w/ZCShNOdc5jmhpW
 XcFA==
X-Gm-Message-State: AOJu0YztBrjmIIfNBnlyW/i55L+UfFG+PpYkCLmr0QUs/R+ziC9Tif3Z
 3UgWWKUviFKQLo//o0LHllLYu3aA15PTFNg7/FEvb+7aq9j6qSUIe05Tj2UPXnCDRXU3uku7fll
 tTzFEHX/SlYsqXNHo/lyLNkJiiFBRKrlcUpVTpDFauguneURot0CGYbzQr6T+23XyseWH4IWh0y
 YBNa1uXOUZFN7ekTvUH3tzXDrO66NZPDR787m7YOrPbUpdEA==
X-Gm-Gg: ATEYQzxEgGs39+/yoq/apqA5Nb+/IVCfYOi/AhHMEu/4bDYQchNjl3kWyqxvrpqsYij
 ELwdoZYzPSn1dVgVYwBJ5bhFm1PG2f5TUP5z/Q7Sm/LngsEh7K1y/1Ajp5DoYF4mWxu8/RC4TiI
 2r02sM3rb7yX8b3YMEHEAYvlJSAXGUs9fX2RcbVLhhjaxs2PvIe+kiyzmivxj6GbDthOCOuquYB
 ZcjXznxSyKWuvJsnYtuCmoqTPIk5+UWM7sNnw==
X-Received: by 2002:a05:6830:438d:b0:7cf:ddb7:8823 with SMTP id
 46e09a7af769-7d726f574d8mr2889562a34.11.1772837316944; 
 Fri, 06 Mar 2026 14:48:36 -0800 (PST)
X-Received: by 2002:a05:6830:438d:b0:7cf:ddb7:8823 with SMTP id
 46e09a7af769-7d726f574d8mr2889524a34.11.1772837315626; Fri, 06 Mar 2026
 14:48:35 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:48:24 -0800
X-Gm-Features: AaiRm51AYeoEkufoXsxcQxnfri5PKTYQMm_B1RWY1_hpBCsJBI4B6OiBJNeEwpI
Message-ID: <CACSVV00wZ95gFDLfzJ0Ywb8rsjPSjZ1aHdwE4smnyuZ=Fg-g8Q@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2026-03-06 for v7.0-rc4
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: bdvcAndQAXPHw_IXi2adECvpJLSppbZy
X-Proofpoint-ORIG-GUID: bdvcAndQAXPHw_IXi2adECvpJLSppbZy
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab59c5 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8 a=_-K9eTw_oR7D26KFscAA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIxNSBTYWx0ZWRfXzrFgh05b8Yyz
 /cfJowVL+EdBz3ApD4212QMkgPPGOBNajHuJf5vNRc8lDtkcBESVuOM7fMdbTy5x5j097jlD422
 AV4tUz6e9Py9+Qo6Hrl7kRt0aiRE3gs5bWfFx4sKXc5fMqmxfnFLcrvfj1Fm2jnPdt3POWammoA
 MxXhnhObARh1jxxqCxfO4hRQY1wytLPi0i5SwBphFAaxq/xRUa2S9Uo/y11VgFIAk77kmYvxB0H
 MvFBgDC1y5ciGZvNrQJ4dda0RJLYMQz0boBkmTEoKsngPDJKx9I6x0Q3soXZ7CKYz0WewoRWnUr
 sKDCm1Kl6wYLTC/Zungmtaf8HEshyXFTz82kvwguV6o9Vvj4vnmvNCLVJQ4NWVH2Gwa4FkcMA1N
 J2PMaNuKToyoptdbJww+OUJB1y00NgSjnkkw9MKnJvbUTs+oPkVsjDGBrd7t6cJdMVpCelC4bNG
 8eUrwC48LAw3Zk6f8BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060215
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
X-Rspamd-Queue-Id: ACAA2228639
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dmitry.baryshkov@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim]
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for v7.0-rc4, as descried below

The following changes since commit 50c4a49f7292b33b454ea1a16c4f77d6965405dc=
:

  drm/msm/a8xx: Add UBWC v6 support (2026-01-22 01:23:22 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2026-03-06

for you to fetch changes up to e4eb11b34d6c84f398d8f08d7cb4d6c38e739dd2:

  drm/msm/dsi: fix pclk rate calculation for bonded dsi (2026-03-06
20:41:08 +0200)

----------------------------------------------------------------
Fixes for v7.0:

Core:
- Adjusted msm_iommu_pagetable_prealloc_allocate() allocation type

DPU:
- Fixed blue screens on Hamoa laptops by reverting the LM reservation
- Fixed the size of the LM block on several platforms
- Dropped usage of %pK (again)
- Fixed smatch warning on SSPP v13+ code
- Fixed INTF_6 interrupts on Lemans

DSI:
- Fixed DSI PHY revision on Kaanapali
- Fixed pixel clock calculation for the bonded DSI mode panels with
  compression enabled

DT bindings:
- Fixed DisplayPort description on Glymur
- Fixed model name in SM8750 MDSS schema

GPU:
- Added MODULE_DEVICE_TABLE to the GPU driver
- Fix bogus protect error on X2-85
- Fix dma_free_attrs() buffer size
- Gen8 UBWC fix for Glymur

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: display: msm: Fix reg ranges and clocks on Glymur

Abhinav Kumar (1):
      drm/msm/dpu: Correct the SA8775P intr_underrun/intr_underrun index

Akhil P Oommen (3):
      drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
      drm/msm/a6xx: Fix the bogus protect error on X2-85
      drm/msm/a8xx: Fix ubwc config related to swizzling

Dmitry Baryshkov (1):
      Revert "drm/msm/dpu: try reserving the DSPP-less LM first"

Kees Cook (1):
      drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation ty=
pe

Konrad Dybcio (1):
      drm/msm/dpu: Fix LM size on a number of platforms

Krzysztof Kozlowski (1):
      dt-bindings: display/msm: qcom,sm8750-mdss: Fix model typo

Pengyu Luo (3):
      drm/msm/dsi: fix hdisplay calculation when programming dsi registers
      drm/msm/dsi/phy: fix hardware revision
      drm/msm/dsi: fix pclk rate calculation for bonded dsi

Thomas Fourier (1):
      drm/msm: Fix dma_free_attrs() buffer size

Thomas Wei=C3=9Fschuh (1):
      drm/msm/dpu: Don't use %pK through printk (again)

sunliming (1):
      drm/msm/dpu: Fix smatch warnings about variable dereferenced before c=
heck

 .../bindings/display/msm/dp-controller.yaml        | 21 ++++++++-
 .../bindings/display/msm/qcom,glymur-mdss.yaml     | 16 ++++---
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  2 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c           |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  3 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 14 +++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  1 +
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 12 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 12 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 12 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 12 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 12 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c    |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 52 ++++++------------=
----
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 43 +++++++++++++-----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 22 ++++-----
 drivers/gpu/drm/msm/msm_iommu.c                    |  2 +-
 19 files changed, 139 insertions(+), 109 deletions(-)
