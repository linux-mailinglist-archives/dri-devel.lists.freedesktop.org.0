Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOmvLE/koWmUwwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:37:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 499991BC101
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5803D10EBE9;
	Fri, 27 Feb 2026 18:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeN9uALc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5bsDbNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0CE10EBE6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:55 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0IOO151877
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 knDk3tSfaQ9703dYF25NunPoznlI9mTd0Ra/y2ypvOY=; b=eeN9uALcBmTepnSW
 XtUAha2NjmL1Hj9/TSsa6l0SuxBx36FBctqvSl+0ilQmU4SmiIDku+J0UGEVE++O
 KtFWRbMVujeI6VQK0mVQvKwOlAMBWC90HcDB8wWVO2fq2f1NI1+9PfmcNAlzafj6
 AkOo3hoVBHJufelyl7espbTZBA3OzaztpeFSYhCEmZ38Lmwpa1zjqHMe3Vu0USkP
 DX4cL+a3EEP3C1SHpXmwjoRQ7BesSwhGq62Tm04DjmlcEyhKwTE9YueZ/Dq6MFxC
 g0tWj9cJolp1rBUvHGBElq5jp+2xWHnExtq5G4vWVRs4o4pHrvUJS63jZL89XYOX
 X8xgkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r4jyn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70ab7f67fso2682575885a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772217413; x=1772822213;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=knDk3tSfaQ9703dYF25NunPoznlI9mTd0Ra/y2ypvOY=;
 b=Y5bsDbNikFa9VUGkRDKdfDc/GNcrQbD3lM396ACpU+tv7ajDEE0ima1OD39Tru6wdF
 cyw50jdIQxRaykX+x+XFCybX4I6IxTK03y7p6j9EtKTwEHdfQN/FFkzJ5nJmtcShd+iU
 2zTj6pgoi3c+axGnJFHjgba/CCP5MP7YCyP3V/VHI5fcR+3NrJntDWxTYTXinheW8LMP
 LwHBmO5Kd871fjymSSblIcR9PN+B8dPGRf7YfbO7o4spZ1xZUk8VA6SYQxBDOMEFV+uy
 VGyifGVuoNXEbg15k4nMT92pV4qd8IJm4bwMm4Wu6FlKd+MaCyOJ+FiOldUnF2xygKAA
 adJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772217413; x=1772822213;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=knDk3tSfaQ9703dYF25NunPoznlI9mTd0Ra/y2ypvOY=;
 b=jjy4hIw8WrzprLIzf8t6Lmz+Ku9f9kOAo42qJxAJNAXEl7iDMoIyebdnhZIQ7nRKCo
 sDd39kVQw4xdkwnfc3BNB4tf1YfsNTOf/R2OT4ve+JCQRRky1zX8NVJ6nc4mqvQ4atwF
 yNYsFdQ5/ZYubl0Z+zVlzS9AoxBraPTEfOiazEKrVeLbC6z4gd7HV/WJ8UdEg47kxnFC
 dyUUljhmdRJZmRolj1yYuGQ7BihiPio12Wi4uM4A97Ib/PbAvh5u8FEcFfAogBdfsTcc
 5l8qmdoSQ7wGuulMk1/ZVn6QmvACM+tCI4aO608+72cmofbRNIV9d6BSDm7faxsLJ7YF
 UAGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYHXsext8AReXsxXp8LcXhb6Dc7HNf9Kc+yx5lsGukmloRO/ERZr0h/77yGNRMhZB1vC13HVbwDAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwF9KggltLvjKwyCd6Clwx1N1ySHOtyD1uAV7Mxpnk0xektMpqN
 RvlN+0wI+Dh1L/bk7QRY1ikhgg6qvuZLYJPEhKylV/TJ4bMrxsrOQlSsye2GdjM8twgNAL/D+Ai
 HaWo5HSbwA8TiCcXj44vD0AxInPRCSoO4npS08e0UyHgp29lmptbGnjXPsOCxYglMqADe+44=
X-Gm-Gg: ATEYQzwDcTnhTyZYcmh1ZVnEp+kzFV5Zzkgzjk/zD2Dp4It32012qWTOLLtnMheuaKK
 8kwtKkPu5YINfLgIji4aGeRqucO1Sq3GURHhcVAm37XpM2azqSK+DHjLKY45GyiCsx3VhuIM6Qn
 tTkN0ErItBnocWvF+j94GAJkZHOR6MvPZYKb5wvf2194wppTHIUdXzlXo1klAQfuDChaUsKs+/K
 vIY9LBtzo8gHir7svloRCFi2egclmWT6VO+3EjfqZzRkquFTWgUo96NK3yvu08PCl376Pe0c3EX
 o1hmiMRpe11ppUBoCCbXpF6/qUfQKRqE+m3Zmzdq8MN+GN9Tf4J0JVIf+o9Ty3yMSPVmXGBm/7b
 XrGkg5la+SkuI6FKSa4aiCt4Clt3HGSOfeapQ0UWzO6E4Zt59AhkWeRH931n9if4yOxH5X7Zfdy
 oUTmW9UtfrlPU3lbi4QrO6KuMkXKdx7gQI1lw=
X-Received: by 2002:a05:620a:d82:b0:8ca:105a:f5d1 with SMTP id
 af79cd13be357-8cbc8dee4ecmr536802285a.30.1772217412875; 
 Fri, 27 Feb 2026 10:36:52 -0800 (PST)
X-Received: by 2002:a05:620a:d82:b0:8ca:105a:f5d1 with SMTP id
 af79cd13be357-8cbc8dee4ecmr536797985a.30.1772217412185; 
 Fri, 27 Feb 2026 10:36:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 10:36:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:41 +0200
Subject: [PATCH 2/7] drm/msm/dpu: stop declaring VBIFs as an array in catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-2-2b97d0438182@oss.qualcomm.com>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=29707;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wQ7wIiIog9u31W8U6g8ofBQYQu9GmNb85/2ekUBbtwQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ9rYn6DxtEaU28BKubT7EkR7KMB3T4k1ow/
 N3kLbNRZDqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPQAKCRCLPIo+Aiko
 1YieCACpRtgzp5GGd2BV93/q0GGR1oqxp3nl3txm6BSTQSx2lA9qGmS56Q7lX7EcP/bfVcEjcwL
 sxjRn5PWbdo9CxcQlpXrBYs7LFJKRWIf3Xej9gDlgmOxKi8bpr8weXqKMPDqL/HKL8RfpZ71y/+
 hMmg9dgx7vA+7r/bH9HWQMA0+oUt8A16Mxq72hKBdXP7DF7mLa+iWP1NZLSjz6BFclrQcCja2Rd
 E8hPCyhnSjBQ+1o79BAVLY+jQmWPZYx1Fm1cnPkKXQYL2Lcs3L7tePBBPbjXsf/7CJ/lu+HnDAh
 /x3Lmx5zn7g5JAF2BZdcOxlFyVHuC+hQSpd6qLyhxMj6q5SH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfXxutGN2YHDBZ4
 uE+0HNXdI42q3wrTTryJuu9IiOJNEdxQNs/ZH9hY5pLt2j5Bs7gPaboyr4DwsOsbCp6Kv1LVUK3
 xlqbjX6GHNklCmvwIhWRslVtQCpMTCX4FhbI7f/ERrjwPzgo1sAwk/gcFzJ5vVXKA4/FTIkga2x
 VcBzEoHCVN+U57AKLWLr81MM+xJzqbxtRKxT7FKy/TXdsqGzvDNjQuZ0+3KUrXs3cGCHxP4DT74
 Uo1B3QdG1K7dESfOOzOhcviqF96nIg6bwvZ7yohGb6rWzjzyWvAJ8PGqpnptoH3Jh1bBW86JCJJ
 QKhkFJlvCyY7KXLdLdI1IXalq7+7ilS2r3Edb2fyrrkM0KgcI2Qbz5ehWvBYdz4Pwo7dtQwMXtZ
 dDMWH6lpNkzV/tsZH3lW2mjAKo80UWAdz2ImC3uLpSIM2zToBk9psm1NNn6F3fGZG8KPRnig5u6
 l/94ueZdUq5IuY3JQ9g==
X-Proofpoint-GUID: qpH8lHj43K5N-POJLGqdZviFUwIc-3BL
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a1e446 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=bGC42zg7wQkgJaAE8VcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qpH8lHj43K5N-POJLGqdZviFUwIc-3BL
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
X-Rspamd-Queue-Id: 499991BC101
X-Rspamd-Action: no action

The driver handles a single VBIF instance, VBIF_RT. Stop declaring VBIFs
as an array in the DPU hardware catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 20 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 32 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           | 79 ++++++++++------------
 36 files changed, 87 insertions(+), 141 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 56d3c38c8778..b31cb6f16f33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -445,8 +445,7 @@ const struct dpu_mdss_cfg dpu_sm8650_cfg = {
 	.cwb = sm8650_cwb,
 	.intf_count = ARRAY_SIZE(sm8650_intf),
 	.intf = sm8650_intf,
-	.vbif_count = ARRAY_SIZE(sm8650_vbif),
-	.vbif = sm8650_vbif,
+	.vbif = &sm8650_vbif,
 	.perf = &sm8650_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
index db8cc2d0112c..b0c38b2e38c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
@@ -486,8 +486,7 @@ const struct dpu_mdss_cfg dpu_sm8750_cfg = {
 	.cwb = sm8650_cwb,
 	.intf_count = ARRAY_SIZE(sm8750_intf),
 	.intf = sm8750_intf,
-	.vbif_count = ARRAY_SIZE(sm8650_vbif),
-	.vbif = sm8650_vbif,
+	.vbif = &sm8650_vbif,
 	.perf = &sm8750_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
index 13bb43ba67d3..f6fd79a48537 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
@@ -533,8 +533,7 @@ const struct dpu_mdss_cfg dpu_glymur_cfg = {
 	.cwb = sm8650_cwb,
 	.intf_count = ARRAY_SIZE(glymur_intf),
 	.intf = glymur_intf,
-	.vbif_count = ARRAY_SIZE(sm8650_vbif),
-	.vbif = sm8650_vbif,
+	.vbif = &sm8650_vbif,
 	.perf = &glymur_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
index 0b20401b04cf..02d2de6073f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
@@ -484,8 +484,7 @@ const struct dpu_mdss_cfg dpu_kaanapali_cfg = {
 	.cwb = sm8650_cwb,
 	.intf_count = ARRAY_SIZE(kaanapali_intf),
 	.intf = kaanapali_intf,
-	.vbif_count = ARRAY_SIZE(sm8650_vbif),
-	.vbif = sm8650_vbif,
+	.vbif = &sm8650_vbif,
 	.perf = &kaanapali_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 29e0eba91930..4ff7b397f808 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -197,8 +197,7 @@ const struct dpu_mdss_cfg dpu_msm8937_cfg = {
 	.pingpong = msm8937_pp,
 	.intf_count = ARRAY_SIZE(msm8937_intf),
 	.intf = msm8937_intf,
-	.vbif_count = ARRAY_SIZE(msm8996_vbif),
-	.vbif = msm8996_vbif,
+	.vbif = &msm8996_vbif,
 	.perf = &msm8937_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index cb1ee4b63f9f..1518c3d39ce8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -176,8 +176,7 @@ const struct dpu_mdss_cfg dpu_msm8917_cfg = {
 	.pingpong = msm8917_pp,
 	.intf_count = ARRAY_SIZE(msm8917_intf),
 	.intf = msm8917_intf,
-	.vbif_count = ARRAY_SIZE(msm8996_vbif),
-	.vbif = msm8996_vbif,
+	.vbif = &msm8996_vbif,
 	.perf = &msm8917_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index b44d02b48418..e8aabe43c9ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -204,8 +204,7 @@ const struct dpu_mdss_cfg dpu_msm8953_cfg = {
 	.pingpong = msm8953_pp,
 	.intf_count = ARRAY_SIZE(msm8953_intf),
 	.intf = msm8953_intf,
-	.vbif_count = ARRAY_SIZE(msm8996_vbif),
-	.vbif = msm8996_vbif,
+	.vbif = &msm8996_vbif,
 	.perf = &msm8953_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 8af63db315b4..67910a2f6880 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -320,8 +320,7 @@ const struct dpu_mdss_cfg dpu_msm8996_cfg = {
 	.dsc = msm8996_dsc,
 	.intf_count = ARRAY_SIZE(msm8996_intf),
 	.intf = msm8996_intf,
-	.vbif_count = ARRAY_SIZE(msm8996_vbif),
-	.vbif = msm8996_vbif,
+	.vbif = &msm8996_vbif,
 	.perf = &msm8996_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index b1b03d8b30fa..67c1463d3bd6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -305,8 +305,7 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.dsc = msm8998_dsc,
 	.intf_count = ARRAY_SIZE(msm8998_intf),
 	.intf = msm8998_intf,
-	.vbif_count = ARRAY_SIZE(msm8998_vbif),
-	.vbif = msm8998_vbif,
+	.vbif = &msm8998_vbif,
 	.perf = &msm8998_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 64df4e80ea43..84344029819f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -269,8 +269,7 @@ const struct dpu_mdss_cfg dpu_sdm660_cfg = {
 	.dsc = sdm660_dsc,
 	.intf_count = ARRAY_SIZE(sdm660_intf),
 	.intf = sdm660_intf,
-	.vbif_count = ARRAY_SIZE(msm8998_vbif),
-	.vbif = msm8998_vbif,
+	.vbif = &msm8998_vbif,
 	.perf = &sdm660_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index b409af899918..ef5777aee587 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -207,8 +207,7 @@ const struct dpu_mdss_cfg dpu_sdm630_cfg = {
 	.pingpong = sdm630_pp,
 	.intf_count = ARRAY_SIZE(sdm630_intf),
 	.intf = sdm630_intf,
-	.vbif_count = ARRAY_SIZE(msm8998_vbif),
-	.vbif = msm8998_vbif,
+	.vbif = &msm8998_vbif,
 	.perf = &sdm630_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 5cc9f55d542b..019135c9a831 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -325,8 +325,7 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.dsc = sdm845_dsc,
 	.intf_count = ARRAY_SIZE(sdm845_intf),
 	.intf = sdm845_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sdm845_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index 0f5e9babdeea..54b4a83ee16e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -144,8 +144,7 @@ const struct dpu_mdss_cfg dpu_sdm670_cfg = {
 	.dsc = sdm670_dsc,
 	.intf_count = ARRAY_SIZE(sdm845_intf),
 	.intf = sdm845_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sdm845_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index ae1b2ed96e9f..9f43ce8bf31b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -381,8 +381,7 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.wb = sm8150_wb,
 	.intf_count = ARRAY_SIZE(sm8150_intf),
 	.intf = sm8150_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sm8150_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index b572cfa7ed35..14611a344371 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -405,8 +405,7 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.wb = sc8180x_wb,
 	.intf_count = ARRAY_SIZE(sc8180x_intf),
 	.intf = sc8180x_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sc8180x_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index a56c288ac10c..7b97e3b8630e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -309,8 +309,7 @@ const struct dpu_mdss_cfg dpu_sm7150_cfg = {
 	.intf = sm7150_intf,
 	.wb_count = ARRAY_SIZE(sm7150_wb),
 	.wb = sm7150_wb,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sm7150_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 26883f6b66b3..65fbd006720d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -246,8 +246,7 @@ const struct dpu_mdss_cfg dpu_sm6150_cfg = {
 	.wb = sm6150_wb,
 	.intf_count = ARRAY_SIZE(sm6150_intf),
 	.intf = sm6150_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sm6150_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index fbf50f279e66..c7833ca05eb4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -217,8 +217,7 @@ const struct dpu_mdss_cfg dpu_sm6125_cfg = {
 	.wb = sm6125_wb,
 	.intf_count = ARRAY_SIZE(sm6125_intf),
 	.intf = sm6125_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sm6125_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 7b8b7a1c2d76..09ca22b93e68 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -378,8 +378,7 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.merge_3d = sm8250_merge_3d,
 	.intf_count = ARRAY_SIZE(sm8250_intf),
 	.intf = sm8250_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.wb_count = ARRAY_SIZE(sm8250_wb),
 	.wb = sm8250_wb,
 	.perf = &sm8250_perf_data,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index c990ba3b5db0..3adc3350f05b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -211,8 +211,7 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.intf = sc7180_intf,
 	.wb_count = ARRAY_SIZE(sc7180_wb),
 	.wb = sc7180_wb,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sc7180_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 343ff5482382..20a2e9ff5cc9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -144,8 +144,7 @@ const struct dpu_mdss_cfg dpu_sm6115_cfg = {
 	.pingpong = sm6115_pp,
 	.intf_count = ARRAY_SIZE(sm6115_intf),
 	.intf = sm6115_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sm6115_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 093d16bdc450..7b58e438f597 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -229,8 +229,7 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg = {
 	.wb = sm6350_wb,
 	.intf_count = ARRAY_SIZE(sm6350_intf),
 	.intf = sm6350_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sm6350_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 47053bf9b0a2..7ae7530aa3b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -137,8 +137,7 @@ const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
 	.pingpong = qcm2290_pp,
 	.intf_count = ARRAY_SIZE(qcm2290_intf),
 	.intf = qcm2290_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &qcm2290_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 98190ee7ec7a..fc7ceac859be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -155,8 +155,7 @@ const struct dpu_mdss_cfg dpu_sm6375_cfg = {
 	.pingpong = sm6375_pp,
 	.intf_count = ARRAY_SIZE(sm6375_intf),
 	.intf = sm6375_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sm6375_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 85aae40c210f..a3fea0ade688 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -392,8 +392,7 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.wb = sm8350_wb,
 	.intf_count = ARRAY_SIZE(sm8350_intf),
 	.intf = sm8350_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sm8350_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 2f8688224f34..ce38e93c0d7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -263,8 +263,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.wb = sc7280_wb,
 	.intf_count = ARRAY_SIZE(sc7280_intf),
 	.intf = sc7280_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sc7280_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 303d33dc7783..12993751b397 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -421,8 +421,7 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.merge_3d = sc8280xp_merge_3d,
 	.intf_count = ARRAY_SIZE(sc8280xp_intf),
 	.intf = sc8280xp_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sc8280xp_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index b09a6af4c474..9983a297b68a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -405,8 +405,7 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.wb = sm8450_wb,
 	.intf_count = ARRAY_SIZE(sm8450_intf),
 	.intf = sm8450_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sm8450_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 0f7b4a224e4c..cb2513785f5f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -445,8 +445,7 @@ const struct dpu_mdss_cfg dpu_sa8775p_cfg = {
 	.wb = sa8775p_wb,
 	.intf_count = ARRAY_SIZE(sa8775p_intf),
 	.intf = sa8775p_intf,
-	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-	.vbif = sdm845_vbif,
+	.vbif = &sdm845_vbif,
 	.perf = &sa8775p_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 465b6460f875..384ed6e86fc2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -400,8 +400,7 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.wb = sm8550_wb,
 	.intf_count = ARRAY_SIZE(sm8550_intf),
 	.intf = sm8550_intf,
-	.vbif_count = ARRAY_SIZE(sm8550_vbif),
-	.vbif = sm8550_vbif,
+	.vbif = &sm8550_vbif,
 	.perf = &sm8550_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 6caa7d40f368..6777eb75faec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -400,8 +400,7 @@ const struct dpu_mdss_cfg dpu_sar2130p_cfg = {
 	.wb = sar2130p_wb,
 	.intf_count = ARRAY_SIZE(sar2130p_intf),
 	.intf = sar2130p_intf,
-	.vbif_count = ARRAY_SIZE(sm8550_vbif),
-	.vbif = sm8550_vbif,
+	.vbif = &sm8550_vbif,
 	.perf = &sar2130p_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 7243eebb85f3..b5e2d832666d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -441,8 +441,7 @@ const struct dpu_mdss_cfg dpu_x1e80100_cfg = {
 	.wb = x1e80100_wb,
 	.intf_count = ARRAY_SIZE(x1e80100_intf),
 	.intf = x1e80100_intf,
-	.vbif_count = ARRAY_SIZE(sm8550_vbif),
-	.vbif = sm8550_vbif,
+	.vbif = &sm8550_vbif,
 	.perf = &x1e80100_perf_data,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c4e1f6b7345d..94c70b7b789e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -513,8 +513,7 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
 	},
 };
 
-static const struct dpu_vbif_cfg msm8996_vbif[] = {
-	{
+static const struct dpu_vbif_cfg msm8996_vbif = {
 	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.default_ot_rd_limit = 32,
@@ -538,11 +537,9 @@ static const struct dpu_vbif_cfg msm8996_vbif[] = {
 		.npriority_lvl = ARRAY_SIZE(msm8998_nrt_pri_lvl),
 		.priority_lvl = msm8998_nrt_pri_lvl,
 		},
-	},
 };
 
-static const struct dpu_vbif_cfg msm8998_vbif[] = {
-	{
+static const struct dpu_vbif_cfg msm8998_vbif = {
 	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.default_ot_rd_limit = 32,
@@ -568,11 +565,9 @@ static const struct dpu_vbif_cfg msm8998_vbif[] = {
 		},
 	.memtype_count = 14,
 	.memtype = {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
-	},
 };
 
-static const struct dpu_vbif_cfg sdm845_vbif[] = {
-	{
+static const struct dpu_vbif_cfg sdm845_vbif = {
 	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
@@ -588,11 +583,9 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
 		},
 	.memtype_count = 14,
 	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
-	},
 };
 
-static const struct dpu_vbif_cfg sm8550_vbif[] = {
-	{
+static const struct dpu_vbif_cfg sm8550_vbif = {
 	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
@@ -608,11 +601,9 @@ static const struct dpu_vbif_cfg sm8550_vbif[] = {
 		},
 	.memtype_count = 16,
 	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
-	},
 };
 
-static const struct dpu_vbif_cfg sm8650_vbif[] = {
-	{
+static const struct dpu_vbif_cfg sm8650_vbif = {
 	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1074,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
@@ -628,7 +619,6 @@ static const struct dpu_vbif_cfg sm8650_vbif[] = {
 		},
 	.memtype_count = 16,
 	.memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
-	},
 };
 
 /*************************************************************
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 70d5ed4732f2..fda4f3bdd797 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -743,7 +743,6 @@ struct dpu_mdss_cfg {
 	u32 intf_count;
 	const struct dpu_intf_cfg *intf;
 
-	u32 vbif_count;
 	const struct dpu_vbif_cfg *vbif;
 
 	u32 wb_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 16f129625795..5f0960368db3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1059,13 +1059,11 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 					    dpu_kms->mmio + cat->cdm->base,
 					    "%s", cat->cdm->name);
 
-	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
-		const struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
+	const struct dpu_vbif_cfg *vbif = dpu_kms->catalog->vbif;
 
-		msm_disp_snapshot_add_block(disp_state, vbif->len,
-					    dpu_kms->vbif[vbif->id] + vbif->base,
-					    "%s", vbif->name);
-	}
+	msm_disp_snapshot_add_block(disp_state, vbif->len,
+				    dpu_kms->vbif,
+				    "vbif");
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
@@ -1143,7 +1141,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms;
 	struct drm_device *dev;
-	int i, rc = -EINVAL;
+	int rc = -EINVAL;
 	unsigned long max_core_clk_rate;
 	u32 core_rev;
 
@@ -1219,20 +1217,18 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto err_pm_put;
 	}
 
-	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
-		struct dpu_hw_vbif *hw;
-		const struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
-
-		hw = dpu_hw_vbif_init(dev, vbif, dpu_kms->vbif[vbif->id]);
-		if (IS_ERR(hw)) {
-			rc = PTR_ERR(hw);
-			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
-			goto err_pm_put;
-		}
+	struct dpu_hw_vbif *hw;
+	const struct dpu_vbif_cfg *vbif = dpu_kms->catalog->vbif;
 
-		dpu_kms->hw_vbif[vbif->id] = hw;
+	hw = dpu_hw_vbif_init(dev, vbif, dpu_kms->vbif[vbif->id]);
+	if (IS_ERR(hw)) {
+		rc = PTR_ERR(hw);
+		DPU_ERROR("failed to init vbif: %d\n", rc);
+		goto err_pm_put;
 	}
 
+	dpu_kms->hw_vbif[vbif->id] = hw;
+
 	/* TODO: use the same max_freq as in dpu_kms_hw_init */
 	max_core_clk_rate = dpu_kms_get_clk_rate(dpu_kms, "core");
 	if (!max_core_clk_rate) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index ede38b3c6f8c..6ebd9627514b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -292,58 +292,51 @@ void dpu_vbif_init_memtypes(struct dpu_kms *dpu_kms)
 
 void dpu_debugfs_vbif_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
 {
+	const struct dpu_vbif_cfg *vbif = dpu_kms->catalog->vbif;
 	char vbif_name[32];
-	struct dentry *entry, *debugfs_vbif;
-	int i, j;
-
-	entry = debugfs_create_dir("vbif", debugfs_root);
-
-	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
-		const struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
-
-		snprintf(vbif_name, sizeof(vbif_name), "%d", vbif->id);
+	struct dentry *debugfs_vbif;
+	int j;
 
-		debugfs_vbif = debugfs_create_dir(vbif_name, entry);
+	debugfs_vbif = debugfs_create_dir("vbif", debugfs_root);
 
-		debugfs_create_u32("features", 0600, debugfs_vbif,
-			(u32 *)&vbif->features);
+	debugfs_create_u32("features", 0600, debugfs_vbif,
+		(u32 *)&vbif->features);
 
-		debugfs_create_u32("xin_halt_timeout", 0400, debugfs_vbif,
-			(u32 *)&vbif->xin_halt_timeout);
+	debugfs_create_u32("xin_halt_timeout", 0400, debugfs_vbif,
+		(u32 *)&vbif->xin_halt_timeout);
 
-		debugfs_create_u32("default_rd_ot_limit", 0400, debugfs_vbif,
-			(u32 *)&vbif->default_ot_rd_limit);
+	debugfs_create_u32("default_rd_ot_limit", 0400, debugfs_vbif,
+		(u32 *)&vbif->default_ot_rd_limit);
 
-		debugfs_create_u32("default_wr_ot_limit", 0400, debugfs_vbif,
-			(u32 *)&vbif->default_ot_wr_limit);
+	debugfs_create_u32("default_wr_ot_limit", 0400, debugfs_vbif,
+		(u32 *)&vbif->default_ot_wr_limit);
 
-		for (j = 0; j < vbif->dynamic_ot_rd_tbl.count; j++) {
-			const struct dpu_vbif_dynamic_ot_cfg *cfg =
-					&vbif->dynamic_ot_rd_tbl.cfg[j];
+	for (j = 0; j < vbif->dynamic_ot_rd_tbl.count; j++) {
+		const struct dpu_vbif_dynamic_ot_cfg *cfg =
+				&vbif->dynamic_ot_rd_tbl.cfg[j];
 
-			snprintf(vbif_name, sizeof(vbif_name),
-					"dynamic_ot_rd_%d_pps", j);
-			debugfs_create_u64(vbif_name, 0400, debugfs_vbif,
-					(u64 *)&cfg->pps);
-			snprintf(vbif_name, sizeof(vbif_name),
-					"dynamic_ot_rd_%d_ot_limit", j);
-			debugfs_create_u32(vbif_name, 0400, debugfs_vbif,
-					(u32 *)&cfg->ot_limit);
-		}
+		snprintf(vbif_name, sizeof(vbif_name),
+				"dynamic_ot_rd_%d_pps", j);
+		debugfs_create_u64(vbif_name, 0400, debugfs_vbif,
+				(u64 *)&cfg->pps);
+		snprintf(vbif_name, sizeof(vbif_name),
+				"dynamic_ot_rd_%d_ot_limit", j);
+		debugfs_create_u32(vbif_name, 0400, debugfs_vbif,
+				(u32 *)&cfg->ot_limit);
+	}
 
-		for (j = 0; j < vbif->dynamic_ot_wr_tbl.count; j++) {
-			const struct dpu_vbif_dynamic_ot_cfg *cfg =
-					&vbif->dynamic_ot_wr_tbl.cfg[j];
-
-			snprintf(vbif_name, sizeof(vbif_name),
-					"dynamic_ot_wr_%d_pps", j);
-			debugfs_create_u64(vbif_name, 0400, debugfs_vbif,
-					(u64 *)&cfg->pps);
-			snprintf(vbif_name, sizeof(vbif_name),
-					"dynamic_ot_wr_%d_ot_limit", j);
-			debugfs_create_u32(vbif_name, 0400, debugfs_vbif,
-					(u32 *)&cfg->ot_limit);
-		}
+	for (j = 0; j < vbif->dynamic_ot_wr_tbl.count; j++) {
+		const struct dpu_vbif_dynamic_ot_cfg *cfg =
+				&vbif->dynamic_ot_wr_tbl.cfg[j];
+
+		snprintf(vbif_name, sizeof(vbif_name),
+				"dynamic_ot_wr_%d_pps", j);
+		debugfs_create_u64(vbif_name, 0400, debugfs_vbif,
+				(u64 *)&cfg->pps);
+		snprintf(vbif_name, sizeof(vbif_name),
+				"dynamic_ot_wr_%d_ot_limit", j);
+		debugfs_create_u32(vbif_name, 0400, debugfs_vbif,
+				(u32 *)&cfg->ot_limit);
 	}
 }
 #endif

-- 
2.47.3

