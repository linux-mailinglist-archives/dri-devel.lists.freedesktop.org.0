Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0833AD3B7FB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 21:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED0610E503;
	Mon, 19 Jan 2026 20:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2R1O9nF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c43kGfUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F1010E503
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:08:13 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JHVNll1904964
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Y0fLneOJSXOak7HuV0zORX
 tyJggZTb2G4Eb19+5EtdQ=; b=e2R1O9nFQt8ptsL4EDln7dCX57kRbjvKiJFEfN
 1jlN3QnBuI1vwYVwRzItj8GfIxpbo67a8cwzfR84t5dBxlq5JV7MaLf4gURZWB1l
 zk0vOznyqKtTS+BMqFJhPIFCyI/jSL6uwGnohkIe/0CG8rWyXdtjR0oam/737vCe
 31Jy/9918d6Ui4yxmBnyzvGlUHJr5Wtv9PKUS6VlSON/d+iqGgZmelvNxTUmQY44
 eAUz9QoZs4pis81GEIZnxYuaK29wA/W+LLvV53ruL7zvsf5I4GeVHUSVCQNgMltA
 Aw65C3k3pqsF2VejdNk0o4EdiIT1pbhwOolBgCveyem5eliw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmua3bj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 20:08:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a2f8e7d8dso134024356d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768853292; x=1769458092;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0fLneOJSXOak7HuV0zORXtyJggZTb2G4Eb19+5EtdQ=;
 b=c43kGfUhf76Ln2cdtGSZzXSdh9fdp4mQvzwqtDbgq1BQdEsPhoo4dPl1xLaoqUXMA7
 81C41M55Iq36Zy6bycjoO/0Llr3rcRvQEAT5FGDwvaGQAMvEfjmCSUkM/bMx30MXcjyM
 u9o6+fzFfHgrVb6FBg0k/v8OFARoScfsZmM43PwgvwGxyemsML3H8eW1I+FMqnx7Px0J
 uv+79bagVVkyxsYbJ5PgR3JEWhqGVadu4aHSiCoSk/1lqAxxDDcBUCBRM0IMkaaBK5Yp
 Yr/UOzewkLz7bub8HJ59puUrwibt/xc/8sWtUmdbcKO64eahD8kQol5iuY1f00Iu2JlL
 XIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768853292; x=1769458092;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y0fLneOJSXOak7HuV0zORXtyJggZTb2G4Eb19+5EtdQ=;
 b=tNu0/oIZ+NoBKI2Pd+KNT9cfoTAlVVpTPqBdE8L/Q+Ti1UYCROCDqDQLn55NB8Ou0q
 FQyxeCgWafJ0OTcyLWUgb82yoGa0oNWw47AWTzvgUvW/FEqEQBQcBLuGTcFL6Z5Habgh
 sxH8yYf99vaxPEXV9kEbD3ss93GTvK39pmIUskTu82auxOvtn9RhfqSrHfvXC/LMlj5n
 lGCmj2PUsk14YL0Y7dZMbtZIZBZJuZdClvtkKJOEAXPXeNh9+5PK6fGktCeWniO5eZhl
 oGnS6opeKSts9Jw/CuQyYGfBmxeNr7+37DFpzjo+ktCF295d8ZtEl5CvPZsECLBOsuRB
 Mp0A==
X-Gm-Message-State: AOJu0YymlmpVCgUSi4gPcqg3mDzJEXasiWz3kmmrsInh3S7Tz68OcrYW
 acLbUO8k94Ooq0HzDjPq8sRTfYFpXZ/UqMF1lxhnNARPwfp4ENMhiSv/IoV+gGRzIsVc1JMT00L
 3YjKayF45r/NzVNtgQ1afV3wy0ISMuyjEVjW2S6xy5qAjhdSMD+vUE+vwLDFbj4VfKOHtmgQ=
X-Gm-Gg: AY/fxX5Bcc6aWcrnGlnX5Ip17WLnTb+C39OJRFRrT/+CXJ05VgyX+mm/HDAF7KbqymC
 0yViZSowcCwBJKEIewdKd4DiFq7BTNQCyJdCp6A50O2UwLpC/eYeOed6V3GTHefHdM2x1+RrSOD
 XE7h2xvCwvq3m5ioWOgnirF3/uLZiWf7QkOTdlPaRsyQ+J61Me74C7SR4YDlVpmX/DMMTjY+lJ/
 HcgxoPrlJ9YaqCXPh83/2/yXlJqbI/sXS4ukS6tBH4l+3dcgP+9jDnoZYs2TEPCgprK/g0SD8W7
 5mrUstL8EONgHAwUXUc1wQwuSqCHxX82MKbfD77tWfOGsR5TRWJC3eb4tkFTnXWVuXGF+Z7q+hJ
 bSX+fftOTinghJfVwTI6T5/s/zc7xVfLhI7tWCg/Q+DmRUzddoOoua+BBkexrEIyFffDJjYeYnM
 FeTxM02yvrog4RVjtCerZZIHs=
X-Received: by 2002:a05:620a:f12:b0:8a4:107a:6772 with SMTP id
 af79cd13be357-8c6a678a15fmr1670264785a.76.1768853291678; 
 Mon, 19 Jan 2026 12:08:11 -0800 (PST)
X-Received: by 2002:a05:620a:f12:b0:8a4:107a:6772 with SMTP id
 af79cd13be357-8c6a678a15fmr1670260785a.76.1768853291176; 
 Mon, 19 Jan 2026 12:08:11 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397712sm3643786e87.52.2026.01.19.12.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 12:08:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 22:08:09 +0200
Subject: [PATCH] drm/tests: hdmi: fix build failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-fix-kunit-infoframe-v1-1-5f2f9b066594@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACiPbmkC/x2MWwqAIBAArxL73YKa9rpK9CG11hJZaEUQ3T3pc
 2BmHogUmCK02QOBLo68+QQyz2CYrZ8IeUwMSqhSSNmg4xuX0/OB7N3mgl0JlTZG6KIypraQyj1
 Q0v5r17/vBxKlMsJlAAAA
X-Change-ID: 20260119-fix-kunit-infoframe-24550437558a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L2/Wh/Nma6naYqwre6gNsRDFA9T8DgsWvEaRcy6qaOU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbo8pZY75WsMBz+45TwTxXR38ClgtoUsXl0fq8
 hMCN5uJQD+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW6PKQAKCRCLPIo+Aiko
 1SBbB/9fGZGtWQwvfEVfhT7SieK56VeK7gmceqcxeBoseAduYcrN9TXmmCPwfZ6T/TXR1vCvLjb
 QgoQmbX9zNhWyZumNVb9Z4LA2Yd7Nj/YWCL54ts4aKFE9Ry5lMyu1lbXAZ1ivjPd231Fj/CNfXq
 QboKzqV32jk8EIVzTxIdl7D4fh/iztoqmXY/hb6lxORtITZJ6V/XH8fcrKwPeSFa5aZ20TnV7uG
 ZJI2p+Nr7v2fl+VSQ84FKbFRSC1d34IzKtcDl9uS0cQopPM74wiJMG6/H9gWVYeKOGNfLtD8ufE
 cac/jLvrkkdX8jpCOkGwty4QpNcPW+nxivZPTfhgbzmF2IsR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE2OCBTYWx0ZWRfXydj4r7b77I2n
 wODD38mxlvm2xRLCvi368/YNrBKJAHldt82VOzioAb7VbL3kIbE+82C16tJ2fXTm3S985o3qa9B
 YKxwHH0P96eSm0efqHuCNmsqKKp6cjVFSW5/lFYBysExnAA3UKmAWMjVjFmdd+gT1B1tGgTwRz8
 ut9YuvB7S8Ff1ASH4wTgcAmLmelAl1K6wy7C79fPBPMRlJjCjB/MIX/nw4UrHg2P9/upLZqstcf
 oWQGcG6AWL/56RBkuZuh9q2XmBdKzR90Uo27szRMncqJv4rG5hyHObivAw7wrKWKT8UcKBK+XjR
 3SBq8Y24TD407gtYdrVrWZBNqxBaBLZcbiBJG9JCNidjY9umhbTEJVoLAvAyelRpHZJyMZmcUDh
 e4NoqiHc5P5+w95K1CpOQmWqNT/HEwjQSkw7EwVDc5r0NiG/+TOhXx6c8vdUlJFU1lrd4YLmq78
 tgVdH6ML8ZKmDN5p+vw==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696e8f2c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=3sqaxwQljTMhRSAFrYUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: ebKzq4hAOTnc7tKAC7fhro3tO9P-gc9i
X-Proofpoint-GUID: ebKzq4hAOTnc7tKAC7fhro3tO9P-gc9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_05,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190168
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

The commit ca59e33f5a1f ("drm/atomic: add max_size check to
drm_property_replace_blob_from_id()") added a new parameter to
drm_property_replace_blob_from_id(), however commit 7436a87db99d
("drm/tests: hdmi: check the infoframes behaviour") was based on the
older tree and used the old number of params (with me failing to run
kunit tests when applying).

Fix the build error by specifying -1 as the max_size (as expected).

Fixes: 7436a87db99d ("drm/tests: hdmi: check the infoframes behaviour")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601200306.dgF5deFm-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 1c60947a13a1..13e405979e33 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -2779,7 +2779,7 @@ static void drm_test_check_reject_hdr_infoframe_bpc_10(struct kunit *test)
 	ret = drm_property_replace_blob_from_id(drm,
 						&new_conn_state->hdr_output_metadata,
 						hdr_blob->base.id,
-						sizeof(struct hdr_output_metadata), -1,
+						-1, sizeof(struct hdr_output_metadata), -1,
 						&replaced);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 	KUNIT_ASSERT_EQ(test, replaced, true);

---
base-commit: ab4c3dcf9a71582503b4fb25aeab884c696cab25
change-id: 20260119-fix-kunit-infoframe-24550437558a

Best regards,
-- 
With best wishes
Dmitry

