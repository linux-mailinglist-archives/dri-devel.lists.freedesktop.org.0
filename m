Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF/SCTAFq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF274225610
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A735610EDE3;
	Fri,  6 Mar 2026 16:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mo8Nwd3M";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XD52MdX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9FC10EDF2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:38 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr9DS550304
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=; b=Mo8Nwd3M4MIJKTJH
 gMRjuGDEY9pr/EtnflqEOJFHn5zQOokp2UUS00B8IUA32El4IZbjeKVe/17IQ0mD
 OF0VgTVl35aI685dBjmUWeEC/+wGbuBeffmfZIhhtamL0Ym0FJQPE2ioNOafJGuu
 95tsocTXyJ5CGh6+90m/qwrefFHYjDZ+a9vjkrZm1lsdNXyG6YMDeH97UKL3jfY6
 cgyTwb65lUP9pG666Fibfl9Ng91HlW4x49tvHlNE8TnWGv6u6Qm3rVJDD3zeOTuc
 woa+bCuzrCKt2TkNlK05Vz1e7YOg5kIlBWz54Z7YYWPASjT0ip1oSuuFqFIEP5q5
 rweDYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka68t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70ef98116so6156335585a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815657; x=1773420457;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=;
 b=XD52MdX94pWGPrDMx9H5WNnLZ98s9YUD8mqJj47MeVu5NQveGDpGm00Ha9lYm6KIIS
 sgpaeXcVoRAsyuRO2G0c/MDyK+wOERQbbdzzpwts1WlgBNAZkOBT/H1OJRrkjerTAjU+
 pUZjJdKbgmbq48UP4A6d309AV/hPZnRDtL4BIdxc1dfel2uCLvAFlE4XB6pAAdOgk7EX
 e+SX8j5N/m32rFCiIcrw272YqncE9nXOFhQx2jHv0JX97iBnFdh1R3MlLSDawyufUWEi
 pgII/BPNn9u3mR9v6H7Bp8wllhG6ltXy8qP/uQ7wb3V+ufOu/pAgmIbUvPVlWftAp0WZ
 NkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815657; x=1773420457;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=;
 b=Lf6tc+cUJ13Ny/PBrHuBp+Vd/IJ0+aN+xz1Go7rqwGdb7ei9J72eN1ateIDqjGr+TO
 OgBd1Ptth2L83fv9mMr3h/7l+R16uNMSIMUC5T49jAECapFrtgj8+29+o05XfRmAq9MB
 VJ3hoKGPS4/JCiGyS/5rGvSwiZIAUqmfU0voQ0ztIUdRE405ndo4xC4BaP4ILklWIWqx
 xYT0H+d9baoO/8h3q+zOuPMd1yS6YHFr5OqRhBfokNU/y3FJWRmCsQX3lQNdUoZSalCq
 41/9U0rW3uKg/GfUMdj4sEaRYhJ4/jD2BOC6XsXoMECu/JKiSggOADr7DfcWTiYfXnQZ
 x48w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCTDMe0RferyquG9n8u614BBAiKRaNIWryb8FK5eYp/aV6e3bJS5Wdj/+ENEDwQmApRvouipIVhTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgHCV0Xwh3zqmSVuIdTx4UUICw5caKLerN/YjCq5EBAvurAM67
 k3RKKOQUCQl92pvnY1xs88DB5AnBDKWh+Ws2kw17VXVL+32A0NOhOW5J/ThnEcMKTXYSN5FGTg6
 oR2ImeaHfQigv2YCaF9Q9r7cxbj4pDrmbQS9W8N/pGJNmcVC/zRfJ+T23Rn9y1uQPqpNcuaY=
X-Gm-Gg: ATEYQzxLdixz7+XAogUHGsnGHEpN96SqIlPOs2Jsk9c41Upd3FwHWcR7U7s+d2JgJBi
 POuTY6VIu474+nNCL7ggX8KNYHK4jHqsq9B75kS+DG+yqm+cDCT3roRXB+gtWAXhR1rcDzWZZmn
 Zkdv4Q1EMpheol6oHyvRFfJHCXtEFMy+VDoQTSMRZsrwNbXfmyvBRUZEdy8P0Q8F3KaACkJ6DcT
 +zrAiHwoPAfaGT1y2pCctNjIjfpf7u3frBQda3+G8jZ0u5u8MswR92189zTxdvL9DllGHFjRLAY
 t4KvpTFd+G7kt6ksEZGqEgFcxTG1uo3TB2oAvieiIhw+lVEDm5T/XFFhmmf+6PfbSABTFbG29G9
 zKmjhZIlSZUlH2MgplpCWoHHt4J4Edl3nBDiIT7jgF5YpIxsPF50XGvjG62YNIiOc5QzxkSmA9W
 1f0cd955R4RZ72eZLe6ijVX45Hj7fiS0yE/JA=
X-Received: by 2002:a05:620a:29c3:b0:8cb:8a78:2cd1 with SMTP id
 af79cd13be357-8cd6d44199bmr345356985a.20.1772815657439; 
 Fri, 06 Mar 2026 08:47:37 -0800 (PST)
X-Received: by 2002:a05:620a:29c3:b0:8cb:8a78:2cd1 with SMTP id
 af79cd13be357-8cd6d44199bmr345353785a.20.1772815656971; 
 Fri, 06 Mar 2026 08:47:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:20 +0200
Subject: [PATCH 14/24] drm/msm/dpu: drop ubwc_dec_version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-14-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hheiMl8VJ8rTRpyUKrTSw/T/7nX7ElA8etZcspaY4GU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUOe72d0ff8IYJr6eCZASzSx5JMmxu/GZKTO
 1j+DdC89oaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1TZRCACKEJlsDwLebkHT5WKmGXXP6U/u9hsEV4J60U2+TmsXK/aV+XiwJHwzs1I4E7yy5PVl9ny
 U+9WF4fLO2dsaHD25UhmwpzZ3tBbs831aoqZ/U1CUQsB0r9BzKWmmTuEWZD126W9UmqaJvwEW8d
 eIGjzAc8XPMHhTD5/8EtZeNWDAAP7Kqu2Zg42d7vSObGox0Tb4x0irCBRkjCI3huRV7PFuDOT+y
 A96mczQNmJ+Y2W16vL7u82ql87bQKRm/RX3e6PGEJEi9mGKxfL12n2yM+E0MbckaMRapt0BJ7bm
 AXVNaEahYhJ98K4LLbGsG1G/F+YDfZptgq9if1CaA4ngG7et
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXyYAT2ZdXyOGX
 40bDjhkWQE5dZFTBMj30By1ouJr2ZbNamO7F+POFJxSaXhIiSWIx3WQjRgALbe78vF3QWLsLUXe
 VcICTDkzCSxJQUS6BpWrTOxmUeegtRTaDJzq8GQfoosyhsSMYPwTCLECG/76X61FfkwXV1Np80c
 NPLkKZR0YCzg0hKQ5i2mB7y47dsPKmDy6wDKqE57WF+ZtMyUGDNi0HtlMu382yZOYvCfyxV54PJ
 /qbmDTJeSHFqqtTbfl2V9YrQSJAhAVbLIYZHPEOwldSXo6PTm9IG1MArBiL6ipgJD+TeP+a5T6U
 ZtXEzbOwY+mBMCX9+meZWpEP4aSO9QRMaPekBDsUv0cVebc6k7qWr0dnaF90Ax82QrSz+iRkNEi
 DYWQZde40ZEGlS1WLqSrHeasSg8cwbM94iD48MFYNY/bZXw4Ygf3wkEUGniGuA9021dixVPTm54
 4K4unqRy04NGqwRZ1mQ==
X-Proofpoint-ORIG-GUID: sPnB49Aw3lHRisFn2WvLWpFLf9uz3t_O
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab052a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OFVxzADIxEWc22agC70A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: sPnB49Aw3lHRisFn2WvLWpFLf9uz3t_O
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
X-Rspamd-Queue-Id: CF274225610
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Stop using ubwc_dec_version (the version of the UBWC block in the
display subsystem) for detecting the enablement of the UBWC. Use only
ubwc_enc_version, the version of the UBWC which we are setting up for.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 547d084f2944..f424be5ad82b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1718,8 +1718,7 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 		uint32_t format, uint64_t modifier)
 {
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0) &&
-			   (dpu_kms->mdss->ubwc_dec_version == 0);
+	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0);
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;

-- 
2.47.3

