Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO8TDKGTqWlCAQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:30:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9A21370E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F1110E269;
	Thu,  5 Mar 2026 14:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWRslusU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgG039yd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509D510EB0E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 14:30:53 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AG4U72118300
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 14:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=VUV0y0FIELlN8NyP40NGtW
 8n58Eg5T0qXaEnE+GkIgU=; b=CWRslusUJxHqdLMlhVVj8q4AHop9N4kprrtLRa
 ZvTbmZPMOW9gewsHQaKktS0/AZlzvGcVWp/3s9gbM73mME5M/uo9wq1CuCEPjnaQ
 G9fAHbw0Uuj9t/dvEBP3/Rw9jDHYqBK8KbtWrlFNQLp+BQC/Ln7GxSEgtsUdlrkB
 GAieS1pQZZuxNuyf0IC4hTfyCVZsOZSdlRpAx5VYrHAE1+NW67/kP2xZErcM428V
 HpszU11eOIQyxvyZLJuRuNNuBVd/AJWpNXAnB9FfumOn9l4a94hX4gkVXR0kG61p
 Qy+C0xAbsrRmCA4/8zU2jjzOsXvDwDJJoZh7Qy3anxg+NHMA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m3nwx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 14:30:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-56afd606ff0so156254e0c.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 06:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721052; x=1773325852;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VUV0y0FIELlN8NyP40NGtW8n58Eg5T0qXaEnE+GkIgU=;
 b=CgG039ydyjygLkv/ze2BBCo/sLIhaxB8QWuOoR8Lk2czdUKgPrC7YVTSszPTG+cxOe
 uyzGmGWZlJ47WtnmiJpW6aYFee92rd4kKqwgaQwOLSi/Ym68lPw6JvXtJKlLMXxhZDEd
 0k114Q26AYsGk+r5TmklCBwY/X+PoomsCfkDcUo3X4doq0SCr6/x//KYw45BHl4nV72o
 VR/lWEp1xbrrTn/XLtZtjmHfMPOCDY4nXN1FjqRcTk5A+IHra/yjcgtzwMVp0LreXjqj
 FncKqVVWcGT9IG/npuY2GjNGzYZ8y7w3Q1W3ADcxxNG3IPUbzXcgstOSbgW+2MLbmlmy
 DFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721052; x=1773325852;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VUV0y0FIELlN8NyP40NGtW8n58Eg5T0qXaEnE+GkIgU=;
 b=fk5j9Bg0oYKOq+7td5syV3aQrJ7mT33KTMKSxRPjIAG8xZmiUmzST7nlc81vMvVLf8
 mU1E1EBO5ssXkVRsCHaGJEfIlsi1kEXK2HOWV7ptP0nDPck8W0GZy396A+2nbshhMlBv
 VcY+lTOgFfFJRaqGzd0x9xU4acKWQvyT8OVHLrhzZ6pDxHJaRTM2dT68OTn9rMIidfg8
 JvPOXFWfGh58juHZTU6gZVlR83A0mytmPTT+B1ZtQpR3JNiNmzXDE6AdFEKpWy+d197e
 kpsPT32ryqYt4Q+en0QY03JEcdlcQ6fRYCnb2fQ32pMAt1PNigBB4A3gZ3sKBRptAYD7
 xPAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/GRN1RARMzFmfOb+88qLNIVKokNyCHzUWUeQ4gVATSAdIKYOOHDphdEvfh9h6R18WulG3rGtxmIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZqEfFIArLU5RY4S2iq2e1WtM4ZcdFpI+5YJzxkzpZmisZmAfx
 nu5gF8OTLdTW1IeV1u3EfK7WYB3+ihGpveSc95ojos2oZIcOgBr9sMG7/Ype+8SyhaLqWW6IaqN
 tzx/ALxaiDuMS4VjL2mFpuHcfhZHJkAoYlchSZgXxQIztwd2m+8cJDHjI1va05EMnJX/RNm0=
X-Gm-Gg: ATEYQzxcfYhQ0BKDpa7pOfAaCzmhnag8ZapBNHGXvgcPXtZVStdvMvN5V3ipOsfi2zz
 J1F7UhPHH/SdjSemjRnODp7Fs94LWfxowUUvgRnQZ+INx7sKAAjeNDh/x7phXRmq2IN9TpTqYnx
 mI/HqYfFrL3a4lsNGcznNRLtocIVOEaKbLhpSmBaU00KFw36H6V4Hz82d2+OIAzPxXkXbnhQHOo
 7/piDvd6qBuJpQjF/pWm00/YjmuscEpKujutNGKgB9AJ49YLo1AITsw0X5eq5Y/baThlJhrMqkP
 Kaa7vbfSWlcjQYPvM7pkXcXjxZKvPM2AC8+pBxMr7rzCV0UMvGWJO8xmsTjvM9Em+deJr50+J5x
 e7lZuDFkb1yDhaZdjNeC6aTxNYCf2zwJxRpaC/iIzYNOITUnUaPyCIny4hu/e/0fsKcrMwf4tVA
 aZLWYFtmWBHI8WaZ9b3ZlIJCkOvMRS4dWdzuI=
X-Received: by 2002:a05:6122:a01c:b0:56a:e7e7:7d53 with SMTP id
 71dfb90a1353d-56ae7e77e9bmr2143583e0c.12.1772721051615; 
 Thu, 05 Mar 2026 06:30:51 -0800 (PST)
X-Received: by 2002:a05:6122:a01c:b0:56a:e7e7:7d53 with SMTP id
 71dfb90a1353d-56ae7e77e9bmr2143558e0c.12.1772721051092; 
 Thu, 05 Mar 2026 06:30:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:30:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/9] drm/msm/dp: Drop the HPD state machine
Date: Thu, 05 Mar 2026 16:30:42 +0200
Message-Id: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJKTqWkC/3XMwQ6CMAwG4FcxOzuytRsQT76H8TBGkSUqyJRoC
 O9uwRgj0UuTv3/7DSJSFyiKzWoQHfUhhubMwaxXwtfufCAZSs4CFFhlAWXdlrKjyvlr08nMENj
 C2hSUE/zSchPuM7fbc65D5LPHrPd62r6gTOtvqNdSSURfOJ8DVmi2TYzJ5eaOvjmdEh5i8nr4G
 LnKFwawkVWGNGVGO4d/DHwbqdLaLgxkQ+UEFRa+BFI/jHEcn4tsscA3AQAA
X-Change-ID: 20250523-hpd-refactor-74e25b55620a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3202;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YhfWJdZj/hIogxiuGjXK64lA75GeJFzrz73j6/EHDzg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOYrlMLSSkrANKkuod+bIQSbKqgHdp/3zY88
 mBF5hWcY62JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1VgQB/sH0AdR/Ys3NCSv7iPKk4aDaJKW9ui3lcL6Yn9N/Edp+MOSdbEOYHKQEjGdsxEOjAjXr3B
 Nzs9q4lw7cmJiD7a1W+howCW+u8BB7ZdnFWcIUhrzcfDGgRsdIrHgNEHDAJ9iE+/sH3JcP9/xX0
 TIazkoQXuOV5Sz/6GFr4aIN4SawOcB9isOgBLpPyIWWsUV8QvSuVHOtenBd959c5rggrzCPpsu7
 mm6eh0529oyLv0yh/q3aSkzQUL9/bbZ0/feq2Ytf8wySMQvNczg/V6eoTIrllrjCWGRqY2/AIMh
 GzLSOdP2xBpXge0IB2Soo2AH4lHdVAEgsLI4WvYlionDZz6M
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a9939c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Bp5APB5_ZGd9cemfosMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 4bLCWEe8QEkO7k3XTbe53PLuodUUp01A
X-Proofpoint-GUID: 4bLCWEe8QEkO7k3XTbe53PLuodUUp01A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX7W9g/QJmSnmh
 H2mIMvm3fKK6TvWWDxB4s2lS0I4MivGmEqwMlWmtMRA2B31Hvx0+ixFuXqYamwFE3vyquOLbgeN
 gE7D2+TCXEoyaqraNzVBhcNKsnx6AaDfS8nZ5qY7JRsMcryXV60Yhd/Y3W5UbO54fDfFP3AhZEA
 FmMvWVznWudvpr7zlx6OxKVyl6bOH06qFaBs//vDB1dVYeQ+uL1se6hzNZQmK1bRemjBsr8Si4J
 6aXPFN1oxDhl7lbbTMgYvPCA88JaUGkB8TwcjGa9SnPIRycLRI6IDm7x0a4fCfqQiSx6C3TYjXL
 wqXj0ryxrs5hOTyvRQ/vDROSWHHWHAQai1UjyPf+mnKSKfm+NPgYQiixkAzsva6/rudb+qm1J3d
 yEla64WYzwVfHEVuwuXkkILPt3Wm+E0mFwr6MDKLijKrkC8K12pkO/MCzEnt5+iMkapSQSwPev5
 wDZtjLnt21qL/eixx0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
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
X-Rspamd-Queue-Id: D1B9A21370E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Currently, all HPD interrupt handling must go through the HPD state
machine.

This has caused many issues where the DRM framework assumes that DP is
in one state while the state machine is stuck in another state.

As discussed here [1], this series:

- Removes the state machine
- Moves link training to atomic_enable()
- Changes the detect() behavior to return true if a display is physically
  plugged in (as opposed to if the DP link is ready).
- Remove event queue and move internal HPD handling to hpd_notify()

Note: eDP is mostly untested. This will be sorted out before the next
iteration, but it will not affect the series in a major way.

Note 2: there is an issue with the DP connectors using GPIO for HPD
(rather than using the nativate DP HPD pin), the DP will not detect a
display if it is plugged in before the board is booted. This is not an
issue of this series and it will be handled by a separate series to be
posted today or tomorrow.

[1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738

---
Changes in v4:
- Fixed PM runtime handling
- Fixed several cases where the HPD machine would loose its state
- Fixed the case where detection was ignoring the plugging in display.
- Link to v3: https://lore.kernel.org/r/20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com

Changes in v3:
- Take over the series (thanks, Jessica, for the previous work!)
- Major rework of the series, squashed the set of patches touching the
  HPD states and handling, it is easier to do it this way rather than
  pulling the strings one by one.
- Link to v2: https://lore.kernel.org/r/20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com

Changes in v2:
- Dropped event queue (Dmitry)
- Moved internal HPD handling to use hpd_notify() (Dmitry)
- Reworked bridge detect() to read DPCP and sink count (Dmitry)
- Moved setting of link_trained to plug/unplugged handling
- Dropped msm_dp::connected (Dmitry)
- Squashed all hpd state related patches (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      drm/msm/dp: drop event data
      drm/msm/dp: turn link_ready into plugged

Jessica Zhang (7):
      drm/msm/dp: fix HPD state status bit shift value
      drm/msm/dp: Fix the ISR_* enum values
      drm/msm/dp: Read DPCD and sink count in bridge detect()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Drop EV_USER_NOTIFICATION
      drm/msm/dp: rework HPD handling
      drm/msm/dp: Add sink_count to debug logs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 --
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 712 ++++++++++++------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     |  63 +---
 drivers/gpu/drm/msm/dp/dp_drm.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |   4 +-
 7 files changed, 236 insertions(+), 571 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20250523-hpd-refactor-74e25b55620a

Best regards,
-- 
With best wishes
Dmitry

