Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2106CFF570
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052C110E2C1;
	Wed,  7 Jan 2026 18:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5wQoHxQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tu/TztaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6961210E2C1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:15:05 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 607H3w573050003
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 18:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=46Gg+PyoOePNZTavJ/f0dI
 NF0Iy1zt9yuv/JMI3KZdo=; b=b5wQoHxQp3wYlAg6T+W2ikXEJPzoXy45ScOMWL
 Q0FCIVPJi5unHLjJ+z2qvG8nBQruKD4DJNosWNMZ/5uESj9hgoxtjNSkYEelFqtK
 jKSFs1ELv/tt5/gSAJEFs3y2c7NtES/da07XjZg2B8SiW0/PNFp+JbEefb4W/ffp
 LHxHntJXzkTwqwLWI5L/jigaHDy+wkmTdC4IeBf80PEsrvb6e+gikjoEsdUc+Q0Q
 vzeoY4mw2nfmC9HLfCLr5JKIj6YRRHIRrJOu0dmZmszoKjExas1vrDa7SZX71Ody
 FArH61t983BFcy70sZShIPcP1Ppvfvm6GrWKMLnvCE8QoNzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhujeg8gv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 18:15:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b51db8ebd9so776560685a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 10:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767809704; x=1768414504;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=46Gg+PyoOePNZTavJ/f0dINF0Iy1zt9yuv/JMI3KZdo=;
 b=Tu/TztaMXDuTUvFDN2fuQQVxXGMhlde+IDPZ36AlZNjBiZ5fjWi1UkyP3IauihKYAZ
 nWnuowVWLS1pnWop4wNLScxotl/M42WFLq+S2Rkv0lZalpZmFjYRwICw7aabReSBMoqO
 X1K0BihDOIAlF8dsGbB4Lw5OsxfY+DQPL91YKaVDuwlbS8pT0EP1+kKPcFZs1ZklUg/b
 O/uY9bmP/fJKr4Z+IcF/C3L83KTcgqgLFZJaICrWvNxainMgKdGNFMCQFgdophRHLUGq
 uF4DBagCwSQ5+gro0s55zn6+2n+OX5ZsQAMMDiNNUX/nHljW/Ic7r0QA07hQ/8vCxxYO
 Jcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767809704; x=1768414504;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=46Gg+PyoOePNZTavJ/f0dINF0Iy1zt9yuv/JMI3KZdo=;
 b=F7fxgh4twjDiTHv2pUgJJIjlBu0dXmvmeC9oXraTDPCVRzsLwDWFY/wWLZn7coBiDd
 MaC7hRA5KWznYsnR50JuUETuS3iJaLD0CHmmCu27PivYwrHBBUAPemXzTedSFBCNpyoO
 mlrBpg5ai+oPkBSO5nCB6prQdnpG5d8dN2vfi/YPVCt7gWVMt/4TxGtyavn6yXJaeurI
 J0qH9N7BQpixX9B06/oe4g5jYEBrRYpNIl7SHzUr5d8wZyTcjSqNx/dsXFKsWYuEJMlh
 LZBIprOxvcV2bmoUJJ0wRnpx/eznZX1yiLt0dXDfZakOEGOpPd6H/Sn41vENDGHeUWLa
 NbEg==
X-Gm-Message-State: AOJu0YwZsL3f9RFf84rRyauTmukNel8DaS9rgLdhGsuErfTDeSOcBRVt
 SaW4mSvX1in1utKoQTluHH4QLhLs5Egy+/JyCw++XFyps5dByv/ci91UK4F1QlAbNmdUNtURfVz
 QE/FleHrD7E4Ku8vrjDwMmxc6yS/g0DJy4pB6bv1TbbgUaz0dspo/CDmW7rkaWB0mLncfo4U=
X-Gm-Gg: AY/fxX6fg9Jn6/nwYECRtduMD33vJ3rC9lGflNmbfa03Hya3BIkpT4hJAtFvZsktUdF
 qODBkApk9xjd8eE7iHCgjrMIiZgS562wpwYD7aB/9NLi/yKbJ16Gls+Mp8WtJskMfZJTjn3AFMV
 61nzlumjMFftN47UqPoWrjnGEVi7EUNwP+KoNuCKIevLjH1IPLtqjdqciDfmADfRZ1OOyethuUy
 EMNOquG6uwZ3K/OdRcACRg6Jj9T60sqtNghhwBkezjoa9FkEzobTKF/V7degjdraMYrzysutlMU
 6fnCmoRRocmthul/UlBpQjuOwTd5igmrAkvnl/BOBaQ01lnZ/znOJQLQcvnbjZFn3EGnKI4PByX
 FibKbt3rBkpdOP8CmML1F6I5yA41Hi4lqxSksOSCJyBh5VvahouFWemUelEJ8J4jiT2EstBJAID
 UFVwFfbgWj4zaT0kpZl9WuZtM=
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id
 af79cd13be357-8c389379d10mr442482585a.1.1767809703702; 
 Wed, 07 Jan 2026 10:15:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElQihcW3Tjcl/g47DFZ0X3Xy9yKLqj4E4uU5Naixz+3u8V8AGWXuPSPneKVozlSO90301DfQ==
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id
 af79cd13be357-8c389379d10mr442474185a.1.1767809703041; 
 Wed, 07 Jan 2026 10:15:03 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 10:15:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 00/10] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Wed, 07 Jan 2026 20:14:57 +0200
Message-Id: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGiXmkC/33NwQrCMAyA4VeRnq202eqsJ99DPHRrogG3ajuHI
 nt3Ow/iYXoJ/IF8eYqEkTGJ7eIpIg6cOHQ5yuVCNCfXHVGyzy1AgVEWKnnmlnvJHQWKrsUkQa5
 rW6CxFivrRD68RCS+v9H9IfeJUx/i4/1j0NP2LzdoqeTaVkbr2iuj6l1IaXW9uXMT2naVh5jUA
 b6lzawEk0QbMuRVCbr8IRUfSQOUs1KRpYp80biGkNDPSOM4vgBcyHlyTwEAAA==
X-Change-ID: 20250927-limit-infoframes-2-6b93e599e79a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3984;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gX9SpOCO0/7Ulc3hkcD6g/xnQUwnJ/+8R4Xg744u4yE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKjKvSyr21kbkh8HJSdMuDgMW95IRHJ5Zf+6
 v4b7inYl7+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6iowAKCRCLPIo+Aiko
 1TCRB/4x8rn0hPnD2RKVnGj/gtjxhkM5jJjPtq3SxdltJdWN+UeeTrLxrwZv+0hkL7Yeal2G/ZK
 z5CwZoquEq5/Fk0QXvHuBnPtLwzK/L5OicGMVegNDtEBZfdsZiCrfVK556IFooZTd+V5ZDchY9I
 ttBQdoxQZIg8n2A3f1w9JY6oWBoLD1qfRn6NyXZPJVG88WyDtwY9Tva/yAXD/2W4/w2h4/GvgFA
 wdo+/sQdcS2PDnz532CVB1rJR0HPEfXSOC0wZdYeT66tGJrVfvKsAFEwzcLyq20cMSVRdpi19F7
 VJWc8PN+Q4a+46JJIaSDDIOV/nuaqm8XoFehBn8/d7QYqiVI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WKNyn3sR c=1 sm=1 tr=0 ts=695ea2a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cAKecciHRQCNmb6kppMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Q0HwY5-sSkDPloOcfJAtCW4jnsxV3iNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX4n9jQSJa22q8
 PbnmioHkvLQASYlOtBUdEC5sDOVxu8JeuRjvfimRzBfg/x+Lz5yS6SPOS/rlu5GFVhz6imM2LVC
 OWDJg9bfclAegOH0F78QBlprS4YGy1tliHgqr7NUkj3qP7cxQ6fh1iGNZIfjiKFO0qlKk1TiCEX
 E/tv/30+jNhfvQXCDdVpHO5nxYPy/Ch7Df+SyOl1QaE7rktRl4EvSLfnqR6kmZXr4pC1s0QVWol
 A8v33Lku/Tk1HgYGdOo71atYARkW0RBfkPyO0C3xffyksugep9B1Ni6If/mKlQOlSMoQM+1ZC4S
 70g0jZsljLtnsBAF9OpyRmIorsyVVHqkFNLy5cPwgb1hdXgGckgT0L2ZbkbQrP2YPtl1kd57ewS
 ocHW04gbO36hRhy7MNlFTppZ6lWShyJaENwKGhNcBzWTyVLiCIDRZMIe46K6KKvb4YfjW3H0NJl
 L/jN10w1Y1kXHkgmJiA==
X-Proofpoint-ORIG-GUID: Q0HwY5-sSkDPloOcfJAtCW4jnsxV3iNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144
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

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. Currently it's mostly ignored by the framework: it
calls write_infoframe() / clear_infoframe() callbacks for all frames and
expects them to return success even if the InfoFrame is not supported.

Sort that out, making sure that all interfaces are consistent:
- split function interfaces, having a pair of callbacks per each
  InfoFrame type.
- write_infoframe() / clear_infoframe() functions return -EOPNOTSUPP
  for unsupported InfoFrames.
- don't create and enable unsupported InfoFrames.
- limit debugfs to provide supported InfoFrames only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebased on top of drm-misc-next, moving inno-hdmi to the bridge patch
- Expanded "normal" test description (Maxime)
- Added EDEADLK handling to the tests (Maxime)
- Moved hdmi_update_failures to drm_atomic_helper_connector_hdmi_priv
  (Maxime)
- Link to v3: https://lore.kernel.org/r/20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com

Changes in v3:
- Added DRM KUnit tests verifying InfoFrames behaviour (Maxime)
- Reworked the patchset, having per-infoframe callbacks rather than
  extra flags (Maxime)
- Link to v2: https://lore.kernel.org/r/20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com

Changes in v2:
- Fixed build issue in common code
- Fixed comments regarding HDR / audio frames (Diedrik)
- In adv7511 actually check for the HDR frame (the comment was correct)
  rather than the audio infoframe (c&p error).
- Link to v1: https://lore.kernel.org/r/20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com

---
Dmitry Baryshkov (10):
      drm/tests: hdmi: check the infoframes behaviour
      drm/vc4: hdmi: implement clear_infoframe
      drm/sun4i: hdmi_enc: implement clear_infoframe stub
      drm/connector: make clear_infoframe callback mandatory for HDMI connectors
      drm/bridge: refactor HDMI InfoFrame callbacks
      drm/display: hdmi_state_helper: split InfoFrame functions per type
      drm/display: hdmi_state_helper: reject Audio IF updates if it's not supported
      drm/display: hdmi_state_helper: don't generate unsupported InfoFrames
      drm/display: bridge_connector: dynamically generate HDMI callbacks
      drm/debug: don't register files for unsupported HDMI InfoFrames

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 180 +++---
 drivers/gpu/drm/bridge/inno-hdmi.c                 |  41 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  95 +--
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 143 +++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 110 ++--
 drivers/gpu/drm/display/drm_bridge_connector.c     | 190 +++++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  94 +--
 drivers/gpu/drm/drm_connector.c                    |   6 +
 drivers/gpu/drm/drm_debugfs.c                      |   7 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             | 110 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 195 +++---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  47 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  42 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   3 +
 drivers/gpu/drm/tests/drm_connector_test.c         |  19 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 667 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 119 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 105 +++-
 include/drm/drm_bridge.h                           | 127 +++-
 include/drm/drm_connector.h                        | 105 +++-
 21 files changed, 1900 insertions(+), 513 deletions(-)
---
base-commit: 349d4efadc1f831ebc0b872ba1e3a2b7dd58b72b
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry

