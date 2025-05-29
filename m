Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FB9AC84E2
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 01:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9285710E767;
	Thu, 29 May 2025 23:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlfPzSHT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173D410E2A4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1pLW032356
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=dM46x4cxeQsukQLX6q9Z31
 jsJ1XmgFK8Wlrcgm47nVo=; b=JlfPzSHTayY0hlkGVvikC1zRJMznzhrhGgQbiL
 V/JhhLFDoV6QvC0BhTSJuiuYk/XkA4t+a5papFCHEzJhnfpxgkrCjXNJGciS7Jos
 zeSLXstDmpLX0WZPQT61ckWisfonJ9RQDNFIAfmfLIAzNGpsZh1sNGkyBzuMnZeu
 BpDr8Vw6RFpab0R3ZWReSamMz68NIVIibEFN4GGqCT2Qzl3vEtGenq+b8V/IXVrP
 BgQluCgRpxP5RzMrDn16ed9q2ZnEuP4qcvV2vHbOGoLBiE6xJvbGl+iAJB/DPa+L
 aQ+q43PtyVO6VakuiQeKpRQ9wfZlbeXx9c19fXxENpgm2B0g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjy7j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 23:15:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2eb60594e8so900845a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 16:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748560522; x=1749165322;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dM46x4cxeQsukQLX6q9Z31jsJ1XmgFK8Wlrcgm47nVo=;
 b=O5DzTN6aXu1EsIF/MtDs0PjG3HH2Jebsb9WIX/z5TXsZ4/rwImEy0drJZpwNeReew0
 ZEXCNIAq+LggYl49mkMHPSif83r/UM0P2xhyX01tG22MJOpk/WzU6KWLFFQ6wxKaAwPy
 IiaIaYonipad8TRxsVYfbD69MVeXrMuhezE6xdnOCFijX1mI1Psir6/6WDxnGev/ay+r
 OtOmi5OyUjP32NKTauAgWrUFT3OqFKk2AfYe8W+PvU60RPDICvejDAW7Y07U53EpmDVS
 0rDvjMyS6o88cqy88bpp5QOZcpnHtWQEgXOX2dD0PVgoQ7k4KZ0k/tumiQt9qRlyC8I3
 JeWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ9vXYIvrsF4O6mJiofGOuBUni4ofVFrr990E1Ss6ucaGxv1PsIzOCiKwYjCKUR0zyBKeElQG0Z3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6p24Uu8Zrg7HxtaDgE+OdJ4Agn9sYr5HJo2idu5/HLDCHvJ69
 ih4otYeaieaPDUGPf5HivuTlzBBife8RTow3/EUWsNhM80BVi9yruOB7oxdaqiSorsbvjQukkYc
 A8B1HCEebDPpW5MVZWyU21/gbobQvX0rM7/82b+SdxQi74WiBqQaAeoQXSZaH659m1MjlfqY=
X-Gm-Gg: ASbGncve3Ndy/Yloj7+p15TEcDzT3RhewGty/3mDNJPRLFIx3vlCvZAuZeMLkfNdxmh
 Zh9+GePnrPt5kyoxm4UXybaJmk0XFs8sq/bI9yk9odSoxgii5a16FUYihWKbKyYDm4QlPvBvODu
 RjAKh6J7NBCJVkoajeERud+Dt99Nq/2b/7n/Z1jUZvEvSc/tZHca6yVerRFS79KZUqunjeMvKTa
 ylYBcckLRUMY0QvvTMEMYQhtnITAnzb+13DB9/QV3g2h98ZBB0v5p/VxGZAF8X0AOfBgFCrxT8P
 J03JZKezSCnNG3MB7h3rsIMPei5JUUODslF1KD6prUEoJ6jIY35aw4yGaESVUcHIHsCuUQi9
X-Received: by 2002:a17:90b:53c3:b0:312:1143:cf8c with SMTP id
 98e67ed59e1d1-312417344b1mr1957976a91.16.1748560521983; 
 Thu, 29 May 2025 16:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExYZ+leMnKPo4Ci9CLPMqPb0xaWB2oGIYcmSOSoT4uHU76LrLJmAqIKUON0iPvzODR1Vaujw==
X-Received: by 2002:a17:90b:53c3:b0:312:1143:cf8c with SMTP id
 98e67ed59e1d1-312417344b1mr1957948a91.16.1748560521574; 
 Thu, 29 May 2025 16:15:21 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 16:15:21 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
Date: Thu, 29 May 2025 16:13:42 -0700
Message-Id: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfqOGgC/x2MQQqAIBAAvyJ7TlDLDn0lQiTXXAgVhSikvyddB
 uYw06BiIaywsAYFL6qUYhc5MNiDjQdyct1BCTXJDh6yM45qPu1jkvd8Flpaq6XwaoRe5YKe7v+
 4bu/7AT/3Ta9hAAAA
X-Change-ID: 20241202-hpd_display_off-6051aa510f23
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=2255;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=p+J6Yc4e0I4h3V1k9TjlmQ+K0LikpunWgUiF/f0yJis=;
 b=BQctw8V9YspdOLDHmfw7iXSaWQZ1w9E4/q0xe1yRnX23EYhwTtLhe6DxjYXOftuqvNwA+PAvW
 MxRu6oV+V4jCscPknjbJbJ36h3zcyKIpYY0Dam4hI7cPCbMZ9U3ZrEa
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6838ea8a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BGtpjrQ8lv99lgvwEK8A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: fLHej9daaHuPkutoxQCz06yvCbDdctDb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfXyi2A5GOErPAN
 /mw4ViLszX37hGv5BbkO/7WxYRtFPBKjZ6xM7/A895TlNKnJgZg4FCk3o+h5R61q+Kryi9lYUGV
 U1iegY1blmK3SZSNffSmMaeupr/8sbNh5PTsJDoj5aQSnfj9bSB6fXNDwRRePRTfvbuSQtW3GZZ
 a2k9BZ4d5JIE9Rb9GlLu6cPncxtEj6PCwXg9Daw35mZDbrXyQrMc+p6w/6Qfgu48Y4SrSbohV1h
 6TAruviUnMB2gPIRZ4bvLCk4hz1dP7Zogk6pnSdzdBRJWg/ooIfb66fybPRglUWGG7o/NTuyUv+
 bc/B1A8nQzoNIqk4E8zT8skqatLX19/6aaJ1ePqx59fRcpVTY9v0axmQg9zvcMU/bCl45126GQz
 JBYm6RX+oloulq8DZJtpUCwqOPmDpi4M4l9CYi8sECvYVcIFDzwYdp1Szbl6OTUXb6KSe1GJ
X-Proofpoint-GUID: fLHej9daaHuPkutoxQCz06yvCbDdctDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290227
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

HPD state machine in msm dp display driver manages the state transitions
between various HPD events and the expected state of driver to make sure
both match up.

Although originally done with the intent of managing userspace interactions
and interactions with compliance equipment, over period of time,
changes to this piece of code has become quite difficult to manage.

Although, unwinding this logic will take some time and will be spread over
various changes, to start things, this series tries to get rid of the
ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
of the display overall. Coupled with this, there are quite a few checks
in the current code, the origins of which need to be re-visited OR are unclear
which seem unlikely or redundant. With DP controller on newer chipsets supporting
multiple streams, this has become increasingly difficult to work with.

This series removes the redundant state checks and simplifies the logic as an
attempt to get rid of this ST_DISPLAY_OFF state.

Note: This series has been tested with sa8775p and sc7180 devices with multiple
monitors and also multiple dongles with no noticeable regressions.
Both of these devices use native DP PHY though. Hence, if this series can
be verified on some devices with USBC-DP combo PHY with the help of the other
developers, that will be great.

---
Changes in v2:
- Rebased on top of next-20250523
- Change atomic_enable() to return early if ST_DISCONENCT_PENDING
  instead of completely dropping the
  if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) check (Dmitry)

---
Abhinav Kumar (4):
      drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
      drm/msm/dp: Return early from atomic_enable() if ST_DISCONNECT_PENDING
      drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
      drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state

 drivers/gpu/drm/msm/dp/dp_display.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)
---
base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
change-id: 20241202-hpd_display_off-6051aa510f23

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

